From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 3 Sep 2007 16:29:55 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
References: <20070903062608.3D391A65E5@busybox.net>
	<20070903140903.GA4518@aon.at>
Message-ID: <002d01c7ee36$f93df3a0$0402a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Sun, Sep 02, 2007 at 11:26:08PM -0700, ulf at uclibc.org wrote:
>>Author: ulf
>>Date: 2007-09-02 23:26:06 -0700 (Sun, 02 Sep 2007)
>>New Revision: 19770
>>
>>Log:
>>Cleanup handling of gccbug script
>>
>>Modified:
>>   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
>>   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
>>
>>
>>Changeset:
>>Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
>>===================================================================
>>--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk 2007-09-03 06:10:01 UTC (rev 19769)
>>+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk 2007-09-03 06:26:06 UTC (rev 19770)
>>@@ -282,7 +282,7 @@
>> fi
>> # Strip the host binaries
>> ifeq ($(GCC_STRIP_HOST_BINARIES),true)
>>- strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
>>+ strip --strip-all -R .note -R .comment $(filter-out gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
>> endif
>> # Make sure we have 'cc'.
>> if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
>>
>>Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
>>===================================================================
>>--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk 2007-09-03 06:10:01 UTC (rev 19769)
>>+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk 2007-09-03 06:26:06 UTC (rev 19770)
>>@@ -290,7 +290,7 @@
>> fi
>> # Strip the host binaries
>> ifeq ($(GCC_STRIP_HOST_BINARIES),true)
>>- strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
>>+ strip --strip-all -R .note -R .comment $(filter-out gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
> 
> No, this is wrong. Ulf, did you try this at all?
> *grumble*
> 

No, there was someone else (dont remember who) reporting "-gccbug" as a problem 
and provided a patch using "gccbug"  which I applied.

Reading the documentation for "filter-out" ,makes me believe that both the
original and the fix are incorrect.

filter-out will only remove the white space separated word in the first parameter,
so AFAIK, there is nothing removed by the original rule.

- strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))

should be replaced by:
- strip --strip-all -R .note -R .comment $(filter-out $(REAL_GNU_TARGET_NAME)-gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*





Have been pondering on the larger question for some time.
How do we decide when to trust patches like this?


Best Regards
Ulf Samuelsson
