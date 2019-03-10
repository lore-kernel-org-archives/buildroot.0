From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 10 Mar 2019 20:43:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/libfuse: common files from
 libfuse3 are prefered
In-Reply-To: <d136d1c9-caf5-4db5-aeb5-6273c4a6438a@mind.be>
References: <20190306163054.5918-1-norbert.lange@andritz.com>
 <20190306163054.5918-2-norbert.lange@andritz.com>
 <d136d1c9-caf5-4db5-aeb5-6273c4a6438a@mind.be>
Message-ID: <CADYdroPtCdrKHQ=BoO7uJYAYJM0V9yg3RZC_jQMNA8KPHy0-Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 10. M?rz 2019 um 16:20 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>  Hi Norbert,
>
> On 06/03/2019 17:30, Norbert Lange wrote:
> > if both libfuse and libfuse3 are installed,
> > make sure libfuse3 will be build first and
> > use the auxiliary files from the newer package.
>
>  Which files are those?

Everything except the libfuse DSO itself, see
https://github.com/libfuse/libfuse/blob/master/ChangeLog.rst#libfuse-300-2016-12-08

>  You could also verify if the packages that currently use libfuse can also use
> libfuse3: curlftpfs e2fsprogs exfat gvfs libostree lua-flu ntfs-3g openvmtools
> owfs sshfs unionfs xenomai. If many of them can also work with libfuse3, it
> might be worth making a virtual package out of it.

They most certainly wont, V2 and V3 are not forward compatible.

>
>
> >
> > Also fix the missing setuid bit for fusermount.
>
>  This should be a separate patch, it's independent of the other changes. The
> "Also" is a hint :-)

K, now for something completely different...

>
> >
> > Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> > ---
> >  package/libfuse/libfuse.mk   | 10 ++++++++--
> >  package/libfuse3/libfuse3.mk |  1 +
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
> > index e8a79a3166..cf7bb2a8e0 100644
> > --- a/package/libfuse/libfuse.mk
> > +++ b/package/libfuse/libfuse.mk
> > @@ -10,15 +10,21 @@ LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFU
> >  LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
> >  LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
> >  LIBFUSE_INSTALL_STAGING = YES
> > -LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> > +LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(if $(BR2_PACKAGE_FUSE3),fuse3)
>
>  libfuse3, not fuse3.

Good catch

>
> >  LIBFUSE_CONF_OPTS = \
> >       --disable-example \
> >       --enable-lib \
> >       --enable-util
> >
> >  define LIBFUSE_INSTALL_TARGET_CMDS
> > -     cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
> > +     $(if $(BR2_PACKAGE_FUSE3),, \
> > +             $(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/ )
>
>  In the libfuse3 package it's called fusermount3, so what is the conflict?

buildroots libfuse package seems a bit dated/incomplete. It does not
install shared files,
there are config files, udev files and a service.
Might make sense to add the udev file so this is a bit of foreshadowing.

fusermount is covered below

>
> >       cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> >  endef
> >
> > +define LIBFUSE_PERMISSIONS
> > +     $(if $(BR2_PACKAGE_FUSE3),, \
> > +             /usr/bin/fusermount f 4755 0 0 - - - - -)
> > +endef
> > +
> >  $(eval $(autotools-package))
> > diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> > index eecdb248d3..be3bf4c746 100644
> > --- a/package/libfuse3/libfuse3.mk
> > +++ b/package/libfuse3/libfuse3.mk
> > @@ -21,6 +21,7 @@ define LIBFUSE3_INSTALL_TARGET_CMDS
> >       $(if $(filter y,$(BR2_STATIC_LIBS)),,cp -dpf $(STAGING_DIR)/usr/lib/libfuse3.so* $(TARGET_DIR)/usr/lib/)
> >       mkdir -p $(TARGET_DIR)/lib/udev/rules.d
> >       $(INSTALL) -m 0644 $(STAGING_DIR)/lib/udev/rules.d/*-fuse3.rules $(TARGET_DIR)/lib/udev/rules.d
> > +     ln -sf fusermount3 $(TARGET_DIR)/usr/bin/fusermount
>
>  Ah, here it is :-)
>
>  Why do you need to make this symlink?

I dont need to make this link, but this helper tool *is backwards compatible*,
so it makes no sense to provide version.
And fusermount is the "interface" for end users/scripts, those
typically dont care
for which DSO the filesystem depends on.
(debian has the same solution)

Norbert
