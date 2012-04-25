From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 25 Apr 2012 17:25:59 +0200
Subject: [Buildroot] [PATCH] util-linux: disable installing binaries by
 default
In-Reply-To: <2cb3fdaa67b81857b507a44dacdc154d@zacarias.com.ar>
References: <1335359709-26898-1-git-send-email-gustavo@zacarias.com.ar>
 <1335364003.2428.14.camel@sven>
 <2cb3fdaa67b81857b507a44dacdc154d@zacarias.com.ar>
Message-ID: <1335367559.2428.16.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2012-04-25 at 11:45 -0300, Gustavo Zacarias wrote:
> On 2012-04-25 11:26, Sven Neumann wrote:
> 
> > On Wed, 2012-04-25 at 10:15 -0300, Gustavo Zacarias wrote:
> >> +config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >> +       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >> +       bool "libblkid and blkid utilities"
> >> +       default y
> >>
> > Actually it only installs libblkid. If you want the blkid utility you
> > also need to select BR2_PACKAGE_UTIL_LINUX_BINARIES.
> >
> >
> > Regards,
> > Sven
> 
> I know.
> Problem is i can't (or don't know how to) make a bool in Kconfig depend 
> on some other option nicely.
> And i'd rather avoid adding more options as i've said.
> So i can leave it as is or just remove the blkid/uuid utilities mention 
> in Config.in

Or add code that installs the blkid utility if
BR2_PACKAGE_UTIL_LINUX_LIBUUID is selected:


Author: Sven Neumann <s.neumann@raumfeld.com>
Date:   Fri Apr 20 14:50:21 2012 +0200

    util-linux: install the blkid binary if libblkid is selected
    
    Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>

diff --git a/package/util-linux/util-linux.mk
b/package/util-linux/util-linux.mk
index a0101a3..3f2c4d6 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -87,6 +87,7 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
 define UTIL_LINUX_INSTALL_LIBBLKID
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libblkid \
                DESTDIR=$(TARGET_DIR) install
+       $(INSTALL) -D -m 0755 $(@D)/misc-utils/blkid $(TARGET_DIR)/sbin
 endef
 endif
 

Regards,
Sven
