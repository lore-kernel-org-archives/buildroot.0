From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 18:19:55 +0200
Subject: [Buildroot] [PATCH] package/jitterentropy-library: fix build
 failure due to missing -fPIC
In-Reply-To: <831e0090-8e52-9c2c-6d06-4557d21fde79@mind.be> (Arnout
 Vandecappelle's message of "Wed, 23 Oct 2019 23:56:29 +0200")
References: <20191023110605.23836-1-giulio.benetti@benettiengineering.com>
 <831e0090-8e52-9c2c-6d06-4557d21fde79@mind.be>
Message-ID: <8736fgkdas.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +
 >> define JITTERENTROPY_LIBRARY_BUILD_CMDS
 >> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 >> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(JITTERENTROPY_LIBRARY_CFLAGS)"

 >  And here we see the actual issue: TARGET_CONFIGURE_OPTS should be passed in the
 > environment instead of as arguments, so the Makefile can add its stuff to it.

 >  Hm, but maybe there are indeed good reasons to override the CFLAGS, because the
 > fstack-protector-all requires support from the toolchain. On the other hand, we
 > probably *do* want to keep the -O0 and -fwrapv flags...

The fstack-protector-* options should be handled by BR2_SSP_* and
hardcoded in the package. Why would we want to use -O0?

-- 
Bye, Peter Korsgaard
