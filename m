From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 22:38:49 +0100
Subject: [Buildroot] [PATCHv2] aircrack-ng: bump to version 1.2-rc1
In-Reply-To: <1415740631-9765-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Nov 2014 18:17:11 -0300")
References: <1415740631-9765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjbxl8nq.fsf@dell.be.48ers.dk>
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

 > Drop iw runtime dep since it's only one of many required by airmon-zc (a
 > script) which require a ton of conditionals for just that tool.
 > It will tell somewhat nicely if they're missing. These would be:

 > awk - from busybox or gawk
 > ethtool
 > grep - from busybox or grep
 > ip or ifconfig - from busybox, iproute2 or net-tools
 > iw
 > lspci - from pciutils (needs full variant)
 > lsusb - from usbutils (needs full variant)
 > modprobe/modinfo - from busybox or kmod
 > uname - from busybox or coreutils

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks, looks good except:

 > --- a/package/aircrack-ng/aircrack-ng.mk
 > +++ b/package/aircrack-ng/aircrack-ng.mk
 > @@ -4,33 +4,56 @@
 >  #
 >  ################################################################################
 
 > -AIRCRACK_NG_VERSION = 1.1
 > +AIRCRACK_NG_VERSION = 1.2-rc1
 >  AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 >  AIRCRACK_NG_LICENSE = GPLv2+
 >  AIRCRACK_NG_LICENSE_FILES = LICENSE
 > -AIRCRACK_NG_DEPENDENCIES = openssl
 > +AIRCRACK_NG_DEPENDENCIES = openssl zlib host-pkgconf
 > +# Enable buddy-ng, easside-ng, tkiptun-ng, wesside-ng
 > +AIRCRACK_NG_MAKE_OPTS = unstable=true
 
 > -ifeq ($(BR2_PACKAGE_SQLITE),y)
 > -	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 > -	AIRCRACK_NG_MAKE_OPTS += \
 > -		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -lpthread)"
 > +# Account for libpthread in static
 > +AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) \
 > +	$(if $(BR2_PREFER_STATIC_LIB),-lpthread)

We unconditionally add -lpthread for static builds.

 
 > -	AIRCRACK_NG_DEPENDENCIES += sqlite
 > +# libnl support has issues when building static
 > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
 > +	AIRCRACK_NG_MAKE_OPTS += libnl=false
 >  else
 > -	AIRCRACK_NG_MAKE_OPTS = sqlite=false
 > +	AIRCRACK_NG_MAKE_OPTS += libnl=true
 > +	AIRCRACK_NG_DEPENDENCIES += libnl
 >  endif
 
 > -AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
 > -	$(if $(BR2_PREFER_STATIC_LIB),-lpthread)
 > +ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 > +	AIRCRACK_NG_DEPENDENCIES += libpcap
 > +	AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
 > +		$(if $(BR2_PREFER_STATIC_LIB),LIBPCAP="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)")
 > +else
 > +	AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=no
 > +endif
 > +
 > +ifeq ($(BR2_PACKAGE_PCRE),y)
 > +	AIRCRACK_NG_DEPENDENCIES += pcre
 > +	AIRCRACK_NG_MAKE_OPTS += pcre=true
 > +else
 > +	AIRCRACK_NG_MAKE_OPTS += pcre=false
 > +endif
 > +
 > +ifeq ($(BR2_PACKAGE_SQLITE),y)
 > +	AIRCRACK_NG_DEPENDENCIES += sqlite
 > +	AIRCRACK_NG_MAKE_OPTS += sqlite=true \
 > +		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -lpthread)"

And here we add it again, so I've dropped it here and committed, thanks.

-- 
Bye, Peter Korsgaard
