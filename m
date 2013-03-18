From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 18 Mar 2013 15:33:27 +1300
Subject: [Buildroot] Package overriding
Message-ID: <CAE21AQraBRp3_94Td_Gw+D9NML+-X0e+2U=cwR979ww99_aJ=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildrooters

It seems to me that the package override feature is misnamed and has
some shortcomings.

First off, the name is, IMHO, poor. Package Override is applied before
tha packages are parsed. It does not override them. Instead it is
really overriding configurations before the packages are read. Perhaps
it should really be called CONFIG_OVERRIDE?

There is also a deficiency in that Package Override cannot override
anything set up in the packages.

For example, I recently needed to add two more configuration lines to
building bluez_utils.

Instead of:

BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
I wanted
BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools --enable-bccmd --enable-dund


A logical way I can see to do this would be to have a mechanism
similar to Package Override but that is applied after the packages are
parsed.

--- Makefile	(revision 20385)
+++ Makefile	(working copy)
@@ -319,11 +319,20 @@
 -include $(PACKAGE_OVERRIDE_FILE)
 endif

 include package/*/*.mk
 include hj/package/*/*.mk
 include boot/common.mk
 include linux/linux.mk

+POST_PACKAGE_OVERRIDE_FILE=$(call qstrip,$(BR2_POST_PACKAGE_OVERRIDE_FILE))
+ifneq ($(POST_PACKAGE_OVERRIDE_FILE),)
+-include $(POST_PACKAGE_OVERRIDE_FILE)
+endif
+
+

Then have POST_PACKAGE_OVERRIDE_FILE point to a file which has

# Add bluez_utils options we need
BLUEZ_UTILS_CONF_OPT +=  --enable-bccmd --enable-dund

Does that sound useful?

Is there a better way?

Thanks

Charles
