From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Feb 2016 10:21:53 +0100
Subject: [Buildroot] [PATCH] sysklogd: override SKFLAGS with
	TARGET_CFLAGS
In-Reply-To: <56C8FE2C.1070000@mind.be> (Arnout Vandecappelle's message of
 "Sun, 21 Feb 2016 01:00:44 +0100")
References: <1455967730-10332-1-git-send-email-romain.naour@gmail.com>
 <56C8FE2C.1070000@mind.be>
Message-ID: <87oababeq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +# Override SKFLAGS which is used as CFLAGS.
 >> define SYSKLOGD_BUILD_CMDS
 >> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 >> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) SKFLAGS="$(TARGET_CFLAGS) -DSYSV" \

 >  Doesn't that make the bug above reappear when you have configured
 > BR2_OPTIMIZE_3? In other words, shouldn't we do something like:

 > ifeq ($(BR2_TOOLCHAIN...),y)
 > SYSKLOGD_CFLAGS = $(subst -O3,-O2,$(TARGET_CFLAGS))
 > else
 > SYSKLOGD_CFLAGS = $(TARGET_CFLAGS)
 > endif
 > SYSKLOGD_CFLAGS += -DSYSV

True, but chances are that other packages will be affected by that -O3
issue with the 2012.03, so perhaps the safest option is to make
BR2_OPTIMIZE_3 depend on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2.

-- 
Bye, Peter Korsgaard
