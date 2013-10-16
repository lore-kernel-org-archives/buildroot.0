From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 16 Oct 2013 09:32:37 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <20131014184341.6ba6e0c4@skate>
References: <525BAB59.4020105@gmail.com>	<20131014114754.12f56017@skate>	<525BCC9C.9020602@gmail.com>	<20131014134753.33a41074@skate>	<525BED56.5030704@gmail.com>	<CAAXf6LXB8+5bjhZ3Y0ftNR0aQVK8Rvge_YDq-KvhfpORO8LPMw@mail.gmail.com>	<525C0C82.6090801@gmail.com>	<525C1100.9040608@gmail.com>
 <20131014184341.6ba6e0c4@skate>
Message-ID: <525E4115.5080703@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> If you don't post the Config.in and .mk file of your package, there's
> nothing we can do to help you on this.


Hi Thomas,
I repost the content of the files here:

Config.in
config BR2_PACKAGE_SENSORAY2253
     bool "sensoray2253"
     depends on BR2_LINUX_KERNEL
     depends on BR2_LIBV4L
     help
       Kernel module for Sensoray 2253

       http://it.sensoray.com/products/2253.htm


sensoray2253.mk
################################################################################
#
# sensoray2253
#
################################################################################

SENSORAY2253_VERSION = 1.2.6
SENSORAY2253_SOURCE = sdk_x53_linux_$(SENSORAY2253_VERSION).tar.bz2
SENSORAY2253_SITE = http://it.sensoray.com/downloads/
SENSORAY2253_DEPENDENCIES = linux libv4l

define SENSORAY2253_CONFIGURE_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver clean
endef

define SENSORAY2253_BUILD_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver modules
endef

define SENSORAY2253_INSTALL_TARGET_CMDS
     $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D)/driver 
modules_install
endef

$(eval $(generic-package))


sensoray2253-deprecated.patch (just few lines)
diff -purN sensoray2253-1.2.6.orig/driver/s2253.c 
sensoray2253-1.2.6/driver/s2253.c
--- sensoray2253-1.2.6.orig/driver/s2253.c    2013-06-21 
17:48:17.000000000 +0200
+++ sensoray2253-1.2.6/driver/s2253.c    2013-10-14 10:08:23.237612305 +0200
@@ -2498,8 +2498,8 @@ static int vidioc_queryctrl(struct file
          //V4L2_CID_AUDIO_MUTE,
          V4L2_CID_HFLIP,
          V4L2_CID_VFLIP,
-        V4L2_CID_HCENTER,
-        V4L2_CID_VCENTER,
+        V4L2_CID_PAN_RESET,
+        V4L2_CID_TILT_RESET,
          S2253_CID_DFLIP,
          S2253_CID_INTERPOLATE,
          S2253_CID_GPI,
@@ -2635,10 +2635,10 @@ ctrl_next:
      case V4L2_CID_VFLIP:
          v4l2_ctrl_query_fill(ctrl, 0, 1, 1, 0);
          break;
-    case V4L2_CID_HCENTER:
+    case V4L2_CID_PAN_RESET:
          v4l2_ctrl_query_fill(ctrl, -256, 255, 1, 0);
          break;
-    case V4L2_CID_VCENTER:
+    case V4L2_CID_TILT_RESET:
          v4l2_ctrl_query_fill(ctrl, -128, 127, 1, 0);
          break;
      case V4L2_CID_PRIVATE_COLORFILTER:
@@ -2856,13 +2856,13 @@ static int vidioc_try_ext_ctrls(struct f
              else if (ctrl->value > 100)
