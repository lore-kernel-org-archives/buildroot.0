From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 08:44:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/snmppp: fix SNMPv3 with gcc <= 5
In-Reply-To: <20200726212906.1548236-1-fontaine.fabrice@gmail.com>
References: <20200726212906.1548236-1-fontaine.fabrice@gmail.com>
Message-ID: <20200727064442.GL19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-26 23:29 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/bfe3faefc007f2e746c9f0af9b7d0926bb72dc9e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/snmppp/Config.in | 4 ++++
>  package/snmppp/snmppp.mk | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
> index 8d284673bc..de1a09ca4b 100644
> --- a/package/snmppp/Config.in
> +++ b/package/snmppp/Config.in
> @@ -21,10 +21,14 @@ config BR2_PACKAGE_SNMPPP_LOGGING
>  config BR2_PACKAGE_SNMPPP_SNMPV3
>  	bool "enable SNMPv3"
>  	default y
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	select BR2_PACKAGE_OPENSSL
>  	help
>  	  Enable optional support for SNMP++. This selects OpenSSL.
>  
> +comment "SNMPv3 needs a toolchain w/ gcc >= 4.8"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
>  endif
>  
>  comment "snmp++ needs a toolchain w/ threads, C++, dynamic library"
> diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
> index 5f52489ea4..601e28e207 100644
> --- a/package/snmppp/snmppp.mk
> +++ b/package/snmppp/snmppp.mk
> @@ -14,6 +14,7 @@ SNMPPP_LICENSE = SNMP++
>  SNMPPP_LICENSE_FILES = src/v3.cpp
>  
>  ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
> +SNMPPP_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>  SNMPPP_CONF_OPTS += --enable-snmpv3
>  SNMPPP_DEPENDENCIES += openssl
>  else
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
