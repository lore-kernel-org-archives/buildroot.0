From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 11:41:50 +0200
Subject: [Buildroot] [RFCv1 1/8] musl: new package
In-Reply-To: <1398291272-17591-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 24 Apr 2014 00:14:25 +0200")
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1398291272-17591-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uqhlw2p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/musl/musl.mk | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 >  1 file changed, 72 insertions(+)
 >  create mode 100644 package/musl/musl.mk

 > +
 > +define MUSL_INSTALL_TARGET_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 > +		DESTDIR=$(TARGET_DIR) install-libs
 > +	mv $(TARGET_DIR)/usr/lib/libc.so $(TARGET_DIR)/lib/
 > +	$(RM) $(addprefix $(TARGET_DIR)/usr/lib/,crt1.o crtn.o crti.o Scrt1.o)
 > +endef

It seems like install-libs doesn't create the dynamic linker symlink? I
atleast couldn't boot a qemu_arm_versatile_defconfig w/ musl build
before I had added a ld-musl-arm.so.1 symlink.

I would have preferred if libc.so was a symlink to musl-$(VERSION).so,
but I guess that's what upstream wants.

-- 
Bye, Peter Korsgaard
