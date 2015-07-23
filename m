From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Jul 2015 09:52:13 +0300
Subject: [Buildroot] [PATCH v2 1/1] mosh: new package
In-Reply-To: <CA+h8R2oHO4SCG_wvaVGoGngwVqBug0=B3_B+JmGF=LzYed1cgQ@mail.gmail.com>
References: <1437611042-10847-1-git-send-email-christian@paral.in>
 <20150723052259.GP13027@tarshish>
 <CA+h8R2oHO4SCG_wvaVGoGngwVqBug0=B3_B+JmGF=LzYed1cgQ@mail.gmail.com>
Message-ID: <20150723065213.GQ13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Thu, Jul 23, 2015 at 06:31:58AM +0000, Christian Stewart wrote:
> The patch is necessary as the git command is unavailable in the Buildroot
> tree. The Makefile usually attempts to use git commands to generate a
> version string.

Please add this explanation in the patch description. I guess upstream would 
also be interested in addressing this problem since it makes build from 
tarball impossible in the absence of git.

> I'm not sure if you're asking why it depends on OpenSSH but if you don't
> know why I suggest you read into what Mosh is and how it works.

Dependency on openssh is quite unusual, since openssh does not provide a 
library. From what you say I infer that openssh is a run-time dependency only. 
If so, please note it in the commit log and in inline comment.

Also, Buildroot prefers 'select' rather than 'depends on' for less than 
obvious dependencies. I thing openssh falls in that category. See again 
"Choosing depends on or select" in the manual.

> There is no 1.2.5 yet, see https://github.com/keithw/mosh/releases -
> there's only 1.2.4.95 release candidate 2.

This is weird. There is a "Bump version to 1.2.5" commit at
https://github.com/keithw/mosh/commit/3c3b356cb5e387887499beb2eedddce185f36944

> Why would I not put both host-protobuf and protobuf? What if protobuf is
> edited later to not depend on the host (which actually is more logical)?
> It's logical to add both dependencies on the package, but if that's a
> problem I'll change it.

So mosh itself depends on host-protobuf? If so, this is OK. Again, a note in 
the commit log about that would be nice.

> I'll incorporate the requested changes and respin. But I still don't
> understand half of your questions :)

I hope I'm clearer now.

baruch

> On Wed, Jul 22, 2015 at 10:23 PM Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Jul 22, 2015 at 05:24:02PM -0700, Christian Stewart wrote:
> > > Adding mosh, the mobile shell.
> > >
> > > Signed-off-by: Christian Stewart <christian@paral.in>
> >
> > [snip]
> >
> > > diff --git a/package/mosh/0001-use-version-from-buildroot.patch
> > b/package/mosh/0001-use-version-from-buildroot.patch
> > > new file mode 100644
> > > index 0000000..2d79eb2
> > > --- /dev/null
> > > +++ b/package/mosh/0001-use-version-from-buildroot.patch
> > > @@ -0,0 +1,23 @@
> > > +Alter the Makefile to use Buildroot's VERSION string.
> >
> > Why is that needed?
> >
> > > +
> > > +Signed-off-by: Christian Stewart <christian@paral.in>
> > > +
> > > +diff -Nau mosh.orig/Makefile.am mosh/Makefile.am
> > > +--- mosh.orig/Makefile.am.orig       2015-07-22 16:55:42.523086477 -0700
> > > ++++ mosh/Makefile.am 2015-07-22 16:56:13.615085453 -0700
> > > +@@ -8,14 +8,7 @@
> > > + .PHONY:     VERSION
> > > +
> > > + VERSION:
> > > +-    @set -e; if [ ! -f VERSION ]; then echo @PACKAGE_STRING@ >
> > VERSION; fi
> > > +-    @set -e; if git status > /dev/null 2>&1; then \
> > > +-            git describe --dirty > VERSION.new;  \
> > > +-            if ! diff -q VERSION VERSION.new > /dev/null 2>&1; then \
> > > +-                    mv -f VERSION.new VERSION; \
> > > +-            fi; \
> > > +-    fi
> > > +-    @rm -f VERSION.new
> > > ++    @echo $(VERSION) > VERSION
> > > +
> > > + version.h:  VERSION
> > > +     @printf '#define BUILD_VERSION "%s"\n' "$$(cat VERSION)" >
> > version.h.new
> > > diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> > > new file mode 100644
> > > index 0000000..53db04b
> > > --- /dev/null
> > > +++ b/package/mosh/Config.in
> > > @@ -0,0 +1,13 @@
> > > +comment "mosh needs openssh to be built"
> > > +     depends on !BR2_PACKAGE_OPENSSH
> > > +
> > > +config BR2_PACKAGE_MOSH
> > > +     bool "mosh"
> > > +     depends on BR2_PACKAGE_OPENSSH
> >
> > Why? Please explain.
> >
> > > +     select BR2_PACKAGE_PROTOBUF
> >
> > Please copy here the dependencies of BR2_PACKAGE_PROTOBUF. Please see the
> > explanation under "Choosing depends on or select" in
> > http://nightly.buildroot.org/manual.html#_config_files.
> >
> > > +     help
> > > +       Remote terminal application that supports intermittent
> > connectivity,
> > > +       allows roaming, and provides speculative local echo and line
> > editing
> > > +       of user keystrokes.
> > > +
> > > +       https://github.com/keithw/mosh
> > > diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
> > > new file mode 100644
> > > index 0000000..4121d36
> > > --- /dev/null
> > > +++ b/package/mosh/mosh.hash
> > > @@ -0,0 +1 @@
> > > +sha256
> > 56571fb1cb9c9714013ab0fc813863d58e0f5c7d320430aa05df952295e046a7
> > mosh-1.2.4.95rc2.tar.gz
> > > diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> > > new file mode 100644
> > > index 0000000..8ad4da9
> > > --- /dev/null
> > > +++ b/package/mosh/mosh.mk
> > > @@ -0,0 +1,15 @@
> > >
> > +################################################################################
> > > +#
> > > +# mosh
> > > +#
> > >
> > +################################################################################
> > > +
> > > +MOSH_VERSION = 1.2.4.95rc2
> >
> > Is there a reason not to use the latest version 1.2.5?
> >
> > > +MOSH_SITE = $(call github,keithw,mosh,mosh-$(MOSH_VERSION))
> > > +MOSH_DEPENDENCIES = host-protobuf protobuf
> >
> > protobuf depends on host-protobuf already.
> >
> > > +MOSH_AUTORECONF = YES
> >
> > Please add a comment noting that autoreconf is needed because we are using
> > the
> > git repo.
> >
> > > +MOSH_LICENSE = OCB
> >
> > It's GPLv3+ with openssl and iOS exceptions.
> >
> > > +MOSH_LICENSE_FILES = ocb-license.html
> >
> > Should be "COPYING COPYING.iOS", I guess. ocb-license.html is a patents
> > grant.
> > But IANAL.
> >
> > > +MOSH_MAKE_ENV = VERSION="mosh-$(MOSH_VERSION)"
> > > +
> > > +$(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
