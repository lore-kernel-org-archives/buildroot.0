From: =?ISO-8859-9?B?QWxwZXIgWf1sZP1y/W0=?= <yildirimalper@gmail.com>
Date: Wed, 8 Jun 2011 23:22:45 +0300
Subject: [Buildroot] [RFC] Override source directories
In-Reply-To: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <BANLkTikMaFZ+xhjKb0oPJssjfON+faj75A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, May 19, 2011 at 12:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is a set of RFC patches that implement the basic mechanism I have
> been referring to since a couple of weeks/months about allowing users
> to override the source directory for packages.
>
> >From an user perspective, it allows ones to create a "local.mk" file
> in the Buildroot main source directory, with variable definitions such
> as :
>
> ?ZLIB_OVERRIDE_SRCDIR = /tmp/zlib
> ?MYAPP_OVERRIDE_SRCDIR = /home/foobar/project/myapp
> ?LIBGLIB2_OVERRIDE_SRCDIR = /home/foobar/git/libglib2
>
> At build time, Buildroot would use those directories at the source for
> the packages, instead of downloading, extracing and patching them in
> the usual way.
>
> Internally, this is implemented inside our package infrastructure, so
> this mechanism should work for all packages that rely on the
> infrastructure. The GENTARGETS macro makes sure that the package build
> process bypasses the download, extract and patch step when
> <pkg>_OVERRIDE_SRCDIR is defined, and instead a symlinking step is
> added. It's very simple.
>

It is definitely what i want from buildroot. This feature is a must when working
with local application repositories.

> This series of patches also add the <pkg>-reconfigure and
> <pkg>-rebuild targets, which makes it easy for users to restart the
> package build process at the compilation step or at the configuration
> step, without having to mess up with stamp file details.
>
> There are still a few issues to solve and discuss, though :
>
> ?* Is local.mk inside the main source directory the good solution?
> ? Should we instead provide a configuration option to set the path to
> ? the override file? Or another solution?

I prefer having a configuration option for this, it will be more flexible.

> ?* As the mechanism is implemented today, "make clean" removes the
> ? symbolic link $(O)/build/<pkg>-<version>, but not the stamp files
> ? created inside this source directory. So next time the build is
> ? started, things will go wrong. To solve this, the only solution I
> ? see is to separate the directory with the stamp files from the
> ? source directory, at least in the case of overriden source
> ? directories.

I guess, it won't hurt to have an extra stamp directory for locally overridden
source directories.

> ?* Other things?
>
> Feedback, comments and ideas welcome.
>

When do you plan to release this feature.
Please don't wait too much.

Cheers,
Alper

> Regards,
>
> Thomas
>
> The following changes since commit 7234c23967fa70b760c64700e56bb1778019fbeb:
>
> ?CHANGES: update with recent changes (2011-05-18 21:02:30 +0200)
>
> are available in the git repository at:
> ?http://free-electrons.com/~thomas/buildroot.git for-2011.08/sourcedir
>
> Thomas Petazzoni (4):
> ? ? ?package: enhance infrastructure to support source dir override
> ? ? ?package: remove stamp files in <pkg>-dirclean
> ? ? ?package: add <pkg>-rebuild and <pkg>-reconfigure
> ? ? ?Include a local.mk for package overrides
>
> ?Makefile ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/Makefile.package.in | ? 30 ++++++++++++++++++++++++++++++
> ?2 files changed, 31 insertions(+), 0 deletions(-)
>
> Thanks,
> --
> Thomas Petazzoni
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
