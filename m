From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 09:11:15 +0100
Subject: [Buildroot] [Question] Including only needed makefiles?
In-Reply-To: <CAK7LNAQNQp_zm-QFyaMhtPtJt+h3BkiwEasXTc6twFm5W_dUnw@mail.gmail.com>
References: <CAK7LNAQNQp_zm-QFyaMhtPtJt+h3BkiwEasXTc6twFm5W_dUnw@mail.gmail.com>
Message-ID: <20160217091115.0f89f400@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yamada-san,

On Wed, 17 Feb 2016 13:00:26 +0900, Masahiro Yamada wrote:

> I am not an active developer of Buildroot.
> Apology if I am asking a silly question.

Your question is not silly at all!

> It takes a few seconds for Buildroot to start building things
> after executing "make".
> 
> I think it is because Buildroot parses all the makefiles
> included by the following wildcard pattern:
> 
> include $(sort $(wildcard package/*/*.mk))
> 
> Some of them are really needed to build desired packages,
> but most of them are not necessary at all.

Correct.

> I found commit 863036378b257d9a9eb9908322edaf29f2121ae7
> ("package/c-libraries: need linux-headers").
> 
> This commit added the dependency to Kconfig
> rather than leaving it to Makefile.
> 
> 
> I have two questions.
> 
> 
> [1]
> 
> Are we going towards inter-package dependency in Kconfig
> rather than in Makefiles?

In Buildroot, we have a duplication of the expression of the
dependencies:

 * Dependencies are expressed at the kconfig level in Config.in files,
   by means of "select" and "depends on" statements, to ensure the
   consistency of the configuration at the kconfig level. For example,
   if one package needs bzip2, we want this package to "select"
   BR2_PACKAGE_BZIP2, so that all other packages can see that
   BR2_PACKAGE_BZIP2 is enabled and potentially use this support.
   However, dependencies at the kconfig level do *not* enforce the
   build ordering.

 * Dependencies are also expressed at the makefile level in .mk file,
   by means of the <pkg>_DEPENDENCIES variable. These dependencies are
   here to enforce build ordering (i.e be sure that the dependencies
   have been built before the package that needs them).

Due to this duplication of dependencies, we added in commit
28f67899e54f15c6e48484ea2976c3e431756bcb (and improved in
3e1b33a5349b21197da88405f32d3fc57a385421) makes sure that a package
cannot be built if its Config.in option is not enabled.

Indeed, we had lots of packages that had a given dependency in their
<pkg>_DEPENDENCIES variable, but this dependency was not accounted for
in the package Config.in file. Which is why we added this check.

Due to this check, some errors popped up, and especially the fact that
the linux-headers package did not have any Config.in option, so when
our check was verifying that its Config.in option was enabled, it was
detecting a failure. So we added a Config.in option to the
linux-headers package, to make it a regular "target" package in
Buildroot.

> [2]
> If we achieve the perfect dependency in Kconfig,
> perhaps can we include makefiles that are really
> enabled by Kconfig?   For example, like this?
> 
> 
> pkg-$(BR2_PACKAGE_BUSYBOX) += busybox
> pkg-$(BR2_PACKAGE_LAME)    += lame
> pkg-$(BR2_PACKAGE_GZIP)    += gzip
>    ...
> 
> 
> include $(addprefix packages, $(addsuffix Makefike, $(pkg-y)))

I propose such a change two years ago, see my RFC patch series at:

   http://lists.busybox.net/pipermail/buildroot/2014-March/092548.html

The main complexity is that while target packages all have a Config.in
options, it is not the case for host packages. And therefore, changing
to a per package makefile inclusion requires adding lots and lots of
Config.in options for host packages.

Another issue (explained in the cover letter) was that we could no
longer use sub-directories in packages, such as
package/qt5/qt5base/qt5base.mk.

If you look at the feedback of the patch series, it was generally quite
positive, but this needs more work, and is only saving a few seconds of
make parsing, which are not such a big deal. So the effort is fairly
big for limited savings.

I would personally rank implementing top-level parallel build at a much
higher priority level than this micro-optimization.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
