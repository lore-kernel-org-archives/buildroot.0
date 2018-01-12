From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 12 Jan 2018 12:34:41 +0200
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <jt1miexfp7.ln2@ID-313208.user.individual.net>
References: <20180111232039.24270-1-stefan.froberg@petroprogram.com>
 <jt1miexfp7.ln2@ID-313208.user.individual.net>
Message-ID: <2075ceff-cae9-29b4-365b-5c11334754b9@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd

Okay, I will send a new one soon.

Best Regards
Stefan

Bernd Kuhls kirjoitti 12.01.2018 klo 08:41:
> Hi Stefan,
>
> Am Fri, 12 Jan 2018 01:20:39 +0200 schrieb Stefan Fr?berg:
>
>> diff --git a/package/unbound/Config.in b/package/unbound/Config.in
>> new file mode 100644
>> index 0000000000..07e4fa39f2
>> --- /dev/null
>> +++ b/package/unbound/Config.in
>> @@ -0,0 +1,37 @@
>> +config BR2_PACKAGE_UNBOUND
>> +	bool "unbound"
>> +	select BR2_PACKAGE_EXPAT
>> +	select BR2_PACKAGE_LIBEVENT
>> +	select BR2_PACKAGE_LIBSODIUM if BR2_PACKAGE_UNBOUND_DNSCRYPT
> parts of this line should be moved inside
> "config BR2_PACKAGE_UNBOUND_DNSCRYPT".
>
>> +	depends on BR2_PACKAGE_OPENSSL
> Why not "select BR2_PACKAGE_OPENSSL"?
> Did you test with libressl as well?
>
>> +	help
>> +	  Unbound is a validating, recursive, and caching DNS resolver.
>> +	  It supports DNSSEC, QNAME minimisation, DNS-over-TLS and
>> +	  DNSCrypt.
>> +
>> +	  https://www.unbound.net
>> +
>> +if BR2_PACKAGE_UNBOUND
>> +
>> +config BR2_PACKAGE_UNBOUND_DNSCRYPT
>> +	bool "Enable DNSCrypt"
> Add
>
>> +	select BR2_PACKAGE_LIBSODIUM
> here.
>
> [...]
>
>> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
>> new file mode 100644
>> index 0000000000..3c6f4ac895
>> --- /dev/null
>> +++ b/package/unbound/unbound.mk
>> @@ -0,0 +1,50 @@
>> +################################################################################
>> +#
>> +# unbound
>> +#
>> +################################################################################
>> +
>> +UNBOUND_VERSION = 1.6.7
>> +UNBOUND_SOURCE = unbound-$(UNBOUND_VERSION).tar.gz
> the variable value contains the default, this line can therefore
> be removed completely.
>
>> +UNBOUND_SITE = https://www.unbound.net/downloads
>> +UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
>> +UNBOUND_LICENSE = BSD
> According to https://spdx.org/licenses/ the value "BSD" does not exist,
> afaics the license is "BSD-3-Clause".
>
>> +UNBOUND_LICENSE_FILES = LICENSE
>> +UNBOUND_CONF_OPTS += --disable-rpath \
>> +		     --disable-debug \
>> +		     --with-conf-file=/etc/unbound/unbound.conf \
>> +		     --with-pidfile=/var/run/unbound.pid \
>> +		     --with-rootkey-file=/etc/unbound/root.key \
>> +		     --enable-tfo-server \
>> +		     --enable-relro-now \
>> +		     --with-pic \
>> +		     --enable-pie
> Please add
> 		--with-ssl=$(STAGING_DIR)/usr \
>
> to avoid
>
> checking for SSL... configure: error: Cannot find the SSL libraries in
>  /usr/local/ssl /usr/lib/ssl /usr/ssl /usr/pkg /usr/local /opt/local /usr/sfw /usr
>
> Small nit: I do not like the idention used, how about something like this?
> https://git.buildroot.net/buildroot/tree/package/kodi/kodi.mk#n59
>
>> +# uClibc-ng does not have MSG_FASTOPEN
>> +# so TCP Fast Open client mode disabled for it
>> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
>> +UNBOUND_CONF_OPTS += --disable-tfo-client
>> +else
>> +UNBOUND_CONF_OPTS += --enable-tfo-client
>> +endif
> An external uClibc toolchain does not define
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC:
>
> $ grep UCLIBC .config
> BR2_TOOLCHAIN_USES_UCLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_UCLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=y
>
> Better check for BR2_TOOLCHAIN_USES_UCLIBC.
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
