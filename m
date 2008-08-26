From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:36:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/i2c-tools
In-Reply-To: <20080826130305.B90693C7BC@busybox.net> (laird@uclibc.org's
	message of "Tue\, 26 Aug 2008 06\:03\:05 -0700 \(PDT\)")
References: <20080826130305.B90693C7BC@busybox.net>
Message-ID: <87prnvew4v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2008-08-26 06:03:05 -0700 (Tue, 26 Aug 2008)
 laird> New Revision: 23205

 laird> Log:
 laird> The changes below move i2c-tools.mk to use Makefile.autotools.in

But i2c-tools doesn't use autotools!
 laird> @@ -6,45 +6,22 @@
 laird>  I2C_TOOLS_VERSION:=3.0.1
 laird>  I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 laird>  I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
 laird> -I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
 laird> -I2C_TOOLS_BINARY:=tools/i2cdetect
 laird> -I2C_TOOLS_TARGET_BINARY:=usr/bin/i2cdetect
 laird> +I2C_TOOLS_AUTORECONF = NO
 laird> +I2C_TOOLS_INSTALL_STAGING = YES

Why install into staging (usr/local even)?

 laird> +$(I2C_TOOLS_TARGET_INSTALL_TARGET):
 laird>  	for i in i2cdump i2cget i2cset i2cdetect; \
 laird>  	do \
 laird> -		$(INSTALL) -m 755 $(<D)/$$i $(@D); \
 laird> -		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$$i; \
 laird> +		$(INSTALL) -m 755 $(I2C_TOOLS_DIR)/tools/$$i $(TARGET_DIR)/usr/bin; \
 laird> +		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
 laird>  	done

You don't remove these files on -clean.

Sorry, I don't really see this as an improvement.

-- 
Bye, Peter Korsgaard
