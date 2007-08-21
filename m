From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 22:28:57 +0200
Subject: [Buildroot] Hiding non-buildable packages
Message-ID: <1187728137.6145.48.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A lot of the packages does not build.
Some only build for some targets.
I think it would be nice to have the possibility
to set a config item, which resulted in that only
packages which seems to build are really visible.

A lot of people will waste time to try to build
packages which simply does not work...
openssh (or was it openssl) is but one example.

Implementation could be:



Dependencies.in:	
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
config	BR2_HIDE_BROKEN_ARM
	bool "Hide packages, known not to build on ARM"
	default n
	depends on BR2_arm 
	select	BR2_HIDE_OPENSSL
	select  BR2_HIDE_OPENSSH
	[snip]
	select  BR2_HIDE_X11R7
	help
	  Setting this flag will hide packages which 
	  for various reasons will not build on ARM CPUs.

config	BR2_HIDE_BROKEN_X86
	bool "Hide packages, known not to build on ARM"
	default n
	depends on BR2_i386 
	select  BR2_HIDE_OPENSSH
	[snip]
	help
	  Setting this flag will hide packages which 
	  for various reasons will not build on an x86 CPU

...

config	BR2_HIDE_OPENSSH
	bool
	default n

config	BR2_HIDE_OPENSSL
	bool
	default n

[snip]

config	BR2_HIDE_X11R7
	bool
	default n

--------------------------------------------------------



package/openssh/Config.in:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
config	BR2_PACKAGE_OPENSSH
	depends on !BR2_HIDE_OPENSSH
	...
--------------------------------------------------------


Didn't test this, yet, but looks useful.


-- 
Best Regards,
Ulf Samuelsson
