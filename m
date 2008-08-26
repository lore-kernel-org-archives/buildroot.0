From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 16:03:49 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/i2c-tools
In-Reply-To: <87prnvew4v.fsf@macbook.be.48ers.dk>
References: <20080826130305.B90693C7BC@busybox.net>
	<87prnvew4v.fsf@macbook.be.48ers.dk>
Message-ID: <20080826140349.GM2213@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 03:36:16PM +0200, Peter Korsgaard wrote:
>>>>>> "laird" == laird  <laird@uclibc.org> writes:
>
> laird> Author: laird
> laird> Date: 2008-08-26 06:03:05 -0700 (Tue, 26 Aug 2008)
> laird> New Revision: 23205
>
> laird> Log:
> laird> The changes below move i2c-tools.mk to use Makefile.autotools.in
>
>But i2c-tools doesn't use autotools!
> laird> @@ -6,45 +6,22 @@
> laird>  I2C_TOOLS_VERSION:=3.0.1
> laird>  I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
> laird>  I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
> laird> -I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
> laird> -I2C_TOOLS_BINARY:=tools/i2cdetect
> laird> -I2C_TOOLS_TARGET_BINARY:=usr/bin/i2cdetect
> laird> +I2C_TOOLS_AUTORECONF = NO
> laird> +I2C_TOOLS_INSTALL_STAGING = YES
>
>Why install into staging (usr/local even)?
>
> laird> +$(I2C_TOOLS_TARGET_INSTALL_TARGET):
> laird>  	for i in i2cdump i2cget i2cset i2cdetect; \
> laird>  	do \
> laird> -		$(INSTALL) -m 755 $(<D)/$$i $(@D); \
> laird> -		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$$i; \
> laird> +		$(INSTALL) -m 755 $(I2C_TOOLS_DIR)/tools/$$i $(TARGET_DIR)/usr/bin; \
> laird> +		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
> laird>  	done
>
>You don't remove these files on -clean.
>
>Sorry, I don't really see this as an improvement.

Folks,

Please think about $(STRIP_STRIP_UNNEEDED) vs. $(STRIP_STRIP_ALL).

Ask yourself:
1) Do i want my libraries be able to load?
   If you answer Y here, then use _UNNEEDED
2) Do i want my binaries small?
   If you answer Y here, then use _ALL

Read the corresponding manpage for details and try to correct the
incorrectly stripped stuff that accumulated during the last months.

HTH,
