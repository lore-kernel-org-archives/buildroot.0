From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 21:14:26 +0100
Subject: [Buildroot] [PATCH] aircrack-ng: security bump to version
	1.2-rc1
In-Reply-To: <1415734946-3492-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Nov 2014 16:42:26 -0300")
References: <1415734946-3492-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnodo5p9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-8321 - gps_tracer stack overflow
 > CVE-2014-8322 - tcp_test length parameter inconsistency
 > CVE-2014-8323 - buddy-ng missing check in data format
 > CVE-2014-8324 - net_get missing check for invalid values

 > Previous CVE patch dropped since the fix is upstream.
 > Also add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 > diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
 > index 314184f..001316d 100644
 > --- a/package/aircrack-ng/Config.in
 > +++ b/package/aircrack-ng/Config.in
 > @@ -2,6 +2,9 @@ config BR2_PACKAGE_AIRCRACK_NG
 >  	bool "aircrack-ng"
 >  	depends on BR2_LARGEFILE
 >  	depends on BR2_USE_MMU # uses fork()
 > +	# libnl has issues when linking statically
 > +	# they need fixing in libnl itself
 > +	select BR2_PACKAGE_LIBNL if !BR2_PREFER_STATIC_LIB

So libnl isn't really a hard dependency? Why do we then force it for
!static?

 >  	select BR2_PACKAGE_OPENSSL
 >  	select BR2_PACKAGE_IW # runtime
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS

 > --- a/package/aircrack-ng/aircrack-ng.mk
 > +++ b/package/aircrack-ng/aircrack-ng.mk
 > @@ -4,33 +4,54 @@
 >  #
 >  ################################################################################
 
 > -AIRCRACK_NG_VERSION = 1.1
 > +AIRCRACK_NG_VERSION = 1.2-rc1
 >  AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 >  AIRCRACK_NG_LICENSE = GPLv2+
 >  AIRCRACK_NG_LICENSE_FILES = LICENSE
 > -AIRCRACK_NG_DEPENDENCIES = openssl
 > +AIRCRACK_NG_DEPENDENCIES = openssl host-pkgconf
 
 > -ifeq ($(BR2_PACKAGE_SQLITE),y)
 > -	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 > -	AIRCRACK_NG_MAKE_OPTS += \
 > -		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -lpthread)"
 > +# Account for libz for openssl, and libpthread in static
 > +AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
 > +	$(if $(BR2_PREFER_STATIC_LIB),-lpthread)

Shouldn't the -lz part also be inside the PREFER_STATIC_LIB conditional?
Or does aircrach-ng use zlib directly? (if so, it should select it and
add it to _DEPENDENCIES)

-- 
Bye, Peter Korsgaard
