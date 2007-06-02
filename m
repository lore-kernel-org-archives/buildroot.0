From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sat, 02 Jun 2007 10:16:30 +0300
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp toolchain
In-Reply-To: <4661079D.90303@cs.helsinki.fi>
References: <20070601221630.067824855D@busybox.net>
	<4661079D.90303@cs.helsinki.fi>
Message-ID: <4661194E.5010707@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heikki Lindholm kirjoitti:
> aldot at uclibc.org kirjoitti:
> 
>>Author: aldot
>>Date: 2007-06-01 15:16:28 -0700 (Fri, 01 Jun 2007)
>>New Revision: 18723
>>
>>Log:
>>- add BR2_PREFER_STATIC_LIB config option to be able to select if we prefer to build static or dynamic libs/bins.
>>- depending on the BR2_GNU_BUILD_SUFFIX, set the respective EXEEXT, LIBEXT, SHREXT extensions for use on the target.
>>Thanks to Tom for suplying a diff which implements these.
>>
>>
>>Modified:
>>   trunk/buildroot/Config.in
>>   trunk/buildroot/Makefile
>>   trunk/buildroot/package/gmp/gmp.mk
>>   trunk/buildroot/toolchain/Makefile.in
>>
>>
>>Changeset:
>>Modified: trunk/buildroot/Config.in
>>===================================================================
>>--- trunk/buildroot/Config.in	2007-06-01 19:17:36 UTC (rev 18722)
>>+++ trunk/buildroot/Config.in	2007-06-01 22:16:28 UTC (rev 18723)
>>@@ -373,6 +373,19 @@
>> 	help
>> 	  This option hides outdated/obsolete versions of packages.
>> 
>>+config BR2_PREFER_STATIC_LIB
>>+	bool "prefer static libraries"
>>+	default n
>>+	help
>>+	  Where possible, use static libraries.
>>+	  This increases your code size a lot and should only be
>>+	  used with a good reason why not use the default, which
>>+	  is dynamic libraries.
>>+
>>+	  If unsure, say No.
>>+
>>+	  WARNING: This is highly experimental at the moment.
>>+
>> endmenu
>> 
>> source "toolchain/Config.in"
>>
>>Modified: trunk/buildroot/Makefile
>>===================================================================
>>--- trunk/buildroot/Makefile	2007-06-01 19:17:36 UTC (rev 18722)
>>+++ trunk/buildroot/Makefile	2007-06-01 22:16:28 UTC (rev 18723)
>>@@ -66,7 +66,32 @@
>> #
>> #############################################################
>> 
>>+ifneq (,$(findstring linux,$(BR2_GNU_BUILD_SUFFIX)))
>>+EXEEXT:=
>>+LIBEXT:=.a
>>+SHREXT:=.so
>>+endif
>>+ifneq (,$(findstring apple,$(BR2_GNU_BUILD_SUFFIX)))
>>+EXEEXT:=.pear
>>+LIBEXT:=.dunno
>>+SHREXT:=.dylib
>>+endif
> 
> 
> Oh, please! How about
> EXEEXT:=
> LIBEXT:=.a
> SHREXT:=.dylib
> 
> A while back I submitted a bug report
> http://bugs.uclibc.org/view.php?id=1257
> which has the places I had to patch hard-coded lib extensions for a 
> basic toolchain build. Otherwise, this approach is probably better than 
> mine.

I updated the bug report with a refresh of my patch, taking the above 
stuff into account.

-- hl
