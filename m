From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 9 Jul 2007 11:21:08 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs
	$(MAKE)	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <20070709082550.GA19774@aon.at>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
	<000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at>
Message-ID: <20070709092108.GA20627@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 09, 2007 at 10:25:50AM +0200, Bernhard Fischer wrote:
>On Sun, Jul 08, 2007 at 12:49:20AM +0200, Ulf Samuelsson wrote:
>>> On Sat, Jul 07, 2007 at 09:37:05PM +0200, Ulf Samuelsson wrote:

>>Stephen, can you pls review the mtd part of this patch ASAP,
>>since this breaks the build for ARM (and possibly all non-x86).
>>Pls commit (or ack my commit) if OK.
>
>I've applied this now and will fix the other breakage due to not passing
>CFLAGS any longer, thus building with package-imposed incorrect flags.

Steven,

This hunk of yours is really broken:
TARGET_CONFIGURE_OPTS=... \
                CC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
                GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
                CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
                CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \

1) These are the compilers and not compiler plus flags.
2) CFLAGS are wrong as CXXFLAGS
3) since your change we end up using the default flags from the
packages, which more often than not default to -O2. Let me refer you to
options.c of gcc (or the respective docs for the gory details).

I am going to revert this change for now. What were you trying to
do/solve?
