From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 21 Nov 2019 14:14:37 -0600
Subject: [Buildroot] [PATCH 1/1] package/modsecurity2: new package
In-Reply-To: <20191121172845.25958-1-tom.marcuzzi@orolia.com>
References: <20191121172845.25958-1-tom.marcuzzi@orolia.com>
Message-ID: <CANQCQpYncnwbXPhG3TvYUOEHKxNo26Mdxffx=Kq+VGJvF50OsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tom,

On Thu, Nov 21, 2019 at 2:05 PM Tom Marcuzzi <tom.marcuzzi@orolia.com> wrote:
>
> From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
>
> Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
> ---
>  package/Config.in                      |  5 +++++
>  package/modsecurity2/Config.in         | 12 ++++++++++++
>  package/modsecurity2/modsecurity2.hash |  4 ++++
>  package/modsecurity2/modsecurity2.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/modsecurity2/Config.in
>  create mode 100644 package/modsecurity2/modsecurity2.hash
>  create mode 100644 package/modsecurity2/modsecurity2.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f72c77b416..c056c210fb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1888,6 +1888,11 @@ menu "Networking applications"
>         source "package/aircrack-ng/Config.in"
>         source "package/aoetools/Config.in"
>         source "package/apache/Config.in"
> +if BR2_PACKAGE_APACHE
> +menu "External Apache modules"
> +       source "package/modsecurity2/Config.in"
> +endmenu
> +endif
>         source "package/argus/Config.in"
>         source "package/arp-scan/Config.in"
>         source "package/arptables/Config.in"
> diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
> new file mode 100644
> index 0000000000..7d99a42552
> --- /dev/null
> +++ b/package/modsecurity2/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_MODSECURITY2
> +       bool "modsecurity2"
> +       depends on BR2_PACKAGE_APACHE
> +       select BR2_PACKAGE_LIBXML2
> +       help
> +         ModSecurity is an open source, cross-platform web application
> +         firewall (WAF) module. Known as the "Swiss Army Knife" of
> +         WAFs, it enables web application defenders to gain visibility
> +         into HTTP(S) traffic and provides a power rules language and
> +         API to implement advanced protections.
> +
> +         http://modsecurity.org
> diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
> new file mode 100644
> index 0000000000..c7f80c8957
> --- /dev/null
> +++ b/package/modsecurity2/modsecurity2.hash
> @@ -0,0 +1,4 @@
> +# From https://www.modsecurity.org/tarball/2.9.3/modsecurity-2.9.3.tar.gz.sha256
> +sha256 4192019d169d3f1dd82cc4714db6986df54c6ceb4ee1c8f253de78d1a6b62118 modsecurity-2.9.3.tar.gz
> +# Locally computed
> +sha256 2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9 LICENSE
> diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
> new file mode 100644
> index 0000000000..05fe12fd0e
> --- /dev/null
> +++ b/package/modsecurity2/modsecurity2.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# modsecurity2
> +#
> +################################################################################
> +
> +MODSECURITY2_VERSION = 2.9.3
> +MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
> +MODSECURITY2_SITE = https://www.modsecurity.org/tarball/$(MODSECURITY2_VERSION)
> +MODSECURITY2_LICENSE = Apache-2.0
> +MODSECURITY2_LICENSE_FILES = LICENSE
> +MODSECURITY2_INSTALL_STAGING = YES
> +
> +MODSECURITY2_DEPENDENCIES += apache libxml2

Does this pkg provide a libmodsecurity library that can be used for
apache or nginx?   My understanding was nginx required an additional
connector plugin but it used this same package.

> +
> +MODSECURITY2_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
> +       --with-libxml=$(STAGING_DIR)/usr \
> +       --with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
> +       --with-apu=$(STAGING_DIR)/usr/bin/apu-1-config \
> +       --with-apxs=$(STAGING_DIR)/usr/bin/apxs
> +
> +$(eval $(autotools-package))
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
