From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 15:01:32 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs $(MAKE)
	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
	<000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
Message-ID: <20070707130132.GU4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 12:06:09PM +0200, Ulf Samuelsson wrote:
>>> * Update mtdutils (which is really old)
>>>
>> Please do not check in changes to this until running the patch by
>> me. This package is critical for a lot of embedded systems and has
>> been working well up to this point and there are no bugs in the
>> bug tracker.
>> 
>
>Before looking at introducing my new version (as an option)
>I tried rebuilding the current svn and ran into a problem with mtd.
>
>When building for arm, the target mtdutils are built using the *host* compiler 
>and stored in $(TARGET_DIR)/usr/sbin.
>
>When the arm-linux-uclibc-strip is invoked on 
>"$(TARGET_DIR)/usr/sbin/flash_erase" 
>compiled by gcc (not arm-linux-uclibc-gcc), the make fails.
>
>I think someone got it wrong in the "package/mtd/mtd.mk" which says
>
>    $(TARGET_CONFIGURE_OPTS) $(MAKE) ...    - build using gcc
>    
>which should be:
>
>     $(MAKE) $(TARGET_CONFIGURE_OPTS) ...    - build using arm-linux-uclibc-gcc

yes, the latter is correct. Steven, please repair or elaborate.

Also, not using the user's CFLAGS sound a little bit odd to me, given
that after your change a package will *not* use the proper flags
anymore.
Think about a package that has
CFLAGS = -O2 -fother-bloat
in it's makefile. Now you changed it to be compiled as
myarch-linux-uclibc-gcc -Os $USERFLAGS -O2 -fother-bloat
which will end using -O2 rather than the correct -Os

Previously we were overriding the package imposed default CFLAGS, which
is the proper thing to do, IMO.

What was the rational behind your change? TIA for elaborating..
