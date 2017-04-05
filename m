From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Wed, 5 Apr 2017 15:38:59 +0200
Subject: [Buildroot] [PATCH] syslinux: Builds with the target toolchain
In-Reply-To: <20170405130227.10a029e2@free-electrons.com>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
 <20170405130227.10a029e2@free-electrons.com>
Message-ID: <20170405153859.7654c11d@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 5 Apr 2017 13:02:27 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> > diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> > index 5b7906c..50feea3 100644
> > --- a/boot/syslinux/syslinux.mk
> > +++ b/boot/syslinux/syslinux.mk
> > @@ -51,8 +51,10 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
> >  # and the internal zlib should take precedence so -I shouldn't
> >  # be used.
> >  define SYSLINUX_BUILD_CMDS
> > -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter
> > $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> > -		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D)
> > $(SYSLINUX_TARGET)
> > +        $(TARGET_MAKE_ENV) $(MAKE1) \
> > +            CC="$(TARGET_CC)" LD="$(TARGET_LD)"
> > NASM="$(HOST_DIR)/usr/bin/nasm" \
> > +            HOSTCC="$(HOSTCC)" HOST_CFLAGS="$(HOST_CFLAGS)"
> > HOST_LDFLAGS="$(HOST_LDFLAGS)" \
> 
> In fact, it would have been better to use CC_FOR_BUILD,
> CFLAGS_FOR_BUILD, LDFLAGS_FOR_BUILD in the syslinux Makefile. If you
> do this, then you can simplify this to:
> 
> 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
> 		NASM=... $(SYSLINUX_EFI_ARGS) -C $(@D)
> $(SYSLINUX_TARGET)
> 

I didn't addressed this in my version 2 of the patch as somehow, when
using $(TARGET_CONFIGURE_OPTS) instead of the various variables, the
Makefiles from syslinux were not able to define CFLAGS on their own, or
somehow, they didn't used their version of it.

Regards,
Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170405/6d7b9aff/attachment.asc>
