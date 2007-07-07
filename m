From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 7 Jul 2007 13:55:24 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
References: <20070707073437.22ECBA682B@busybox.net>
	<20070707093316.GK4096@aon.at>
Message-ID: <00c301c7c091$e5f925d0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> # Strip the host binaries
>> ifeq ($(GCC_STRIP_HOST_BINARIES),true)
>>- -strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
>>+ if [ -e $(STAGING_DIR)/usr/bin/*-gccbug ] ; then \
> 
> testing for existance doesn't work on all solaris test(1).


What will happen on a Solaris host then if this is found?
Will [ -a <file> ] work?

> What you really want is perhaps something like ifneq $((..$(wildcard..)),)
> 

I believe ifneq is read in stage 1 of the Makefile, so this wont work either, right?
The files will only exist in mid build.

Maybe we should not create "arm-linux-uclibc-gccbug" to begin with...
If we rename "arm-linux-uclibc-gccbug" to "arm-linux-gccbug" right 
after the make  and then strip 

* "$(REAL_GNU_TARGET_NAME)-*"
* "faked"

we should be OK.

>>+ mkdir -p "$(STAGING_DIR)/tmp" ; \
> 
> If by now $(STAGING_DIR) could not be created, then something is
> fundamentally wrong (the -p is superfluous).
> 

$(STAGING_DIR) is OK, but "$(STAGING_DIR)/tmp" could 
exist if someone adds this in the future and does not remove it.

Best Regards
Ulf Samuelsson                
