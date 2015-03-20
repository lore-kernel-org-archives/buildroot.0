From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:39:37 +0100
Subject: [Buildroot] [PATCH v3] package: add hwloc 1.10.1
In-Reply-To: <CAKbGBLiO-qSiuemZs-bC8KnhoR4PCgyUxS-B9GvK0fDhu7cmbg@mail.gmail.com>
References: <1426742959-1220-1-git-send-email-steven@uplinklabs.net>
 <20150320213733.312a1cb0@free-electrons.com>
 <CAKbGBLiO-qSiuemZs-bC8KnhoR4PCgyUxS-B9GvK0fDhu7cmbg@mail.gmail.com>
Message-ID: <20150320233937.72588278@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Fri, 20 Mar 2015 15:33:41 -0700, Steven Noonan wrote:

> > However, there was a missing dependency on BR2_TOOLCHAIN_HAS_THREADS,
> > since hwloc uses pthread.
> 
> Again, only tested with glibc and such, so I'm not seeing lots of
> these dependencies. Glad I held off on my other contributions until I
> could get these through review. Now I've got some ideas of things to
> look for before submission.

Specifically for thread dependency, I generally don't build with a
no-thread toolchain (even though one is available pre-built at
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config).
Instead, I grep for pthread in the source code, and try to decide
whether it needs thread support or not (sometimes packages use thread
when available, but it is optional).

> > Lines slightly too long, so I rewrapped.
> 
> What column wrapping is preferred for the Config.in files? I could
> throw it into my vim config to enforce it in the future.

I think 72 ?

> > As I said, those dependencies are optional, so I made them as such, and
> > also used explicit --enable/--disable options. This allowed me to
> > discover that the numa support was never enabled with your submission:
> > the numactl package was not installing its library/header file in
> > $(STAGING_DIR). With an explicit --enable-libnuma, hwloc configure
> > script bailed out since it couldn't find the libnuma library.
> 
> This would probably explain why the 'perf' build wasn't finding the
> optional libnuma dependency as well -- hadn't figured out what was
> wrong there.

Yes, that would explain it.

> > So I committed a patch that installs libnuma to the staging directory
> > as well.
> 
> Excellent. I'm not familiar with how the staging directory works.

It's actually quite simple. The staging directory, $(STAGING_DIR), is
the "sysroot" of the toolchain. This is where the toolchain looks to
find libraries and headers.

By default, packages only get installed to $(TARGET_DIR), because
<pkg>_INSTALL_TARGET defaults to "YES". In this case
<pkg>_INSTALL_TARGET_CMDS is called and does it job (of course, for
autotools packages, you don't implement this variable manually in your
package .mk file, since the autotools-package infra already has it
implemented for you).

However, when your package is a library, or generally needs to install
something in $(STAGING_DIR), you need to explicitly set
<pkg>_INSTALL_STAGING to YES, because it defaults to NO. When set to
YES, the top-level package infrastructure will call
<pkg>_INSTALL_STAGING_CMDS (which, just like <pkg>_INSTALL_TARGET_CMDS,
is already implemented for you for autotools packages, CMake packages
and al.).

> Does that change work for any package depending on it (e.g. perf)?

Yes: from now on, whenever a package has "numactl" in its
<pkg>_DEPENDENCIES variable, numactl will be installed to both
$(TARGET_DIR) and $(STAGING_DIR), which means that such packages will
be able to "see" the libnuma library and header files.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
