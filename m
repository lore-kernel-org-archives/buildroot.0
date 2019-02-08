From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 8 Feb 2019 08:40:29 -0600
Subject: [Buildroot] [PATCH] package: add new package: fluent-bit
In-Reply-To: <20190207223047.5286-1-khilman@baylibre.com>
References: <20190207223047.5286-1-khilman@baylibre.com>
Message-ID: <CANQCQpb8FDuEkPzeB+W2dYHX2vQ3yNHjy5ZTNFi9B7-15_MLkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kevin,


On Thu, Feb 7, 2019 at 4:36 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> From https://fluentbit.io/:
>
>   Fluent Bit is an open source and multi-platform Log Processor and
>   Forwarder which allows you to collect data/logs from different
>   sources, unify and send them to multiple destinations.
>

Thanks for sending the patch, see a few comments below.

> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  package/Config.in                |  1 +
>  package/fluent-bit/Config.in     | 10 ++++++++++
>  package/fluent-bit/fluent-bit.mk | 23 +++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 package/fluent-bit/Config.in
>  create mode 100644 package/fluent-bit/fluent-bit.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 29862c478c5a..ffee39127d5a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1445,6 +1445,7 @@ endmenu
>
>  menu "Logging"
>         source "package/eventlog/Config.in"
> +       source "package/fluent-bit/Config.in"
>         source "package/glog/Config.in"
>         source "package/liblog4c-localtime/Config.in"
>         source "package/liblogging/Config.in"
> diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
> new file mode 100644
> index 000000000000..f04bad1d8324
> --- /dev/null
> +++ b/package/fluent-bit/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_FLUENT_BIT
> +       bool "fluent-bit"
> +       depends on BR2_INSTALL_LIBSTDCPP

Looks like some architectural limitations? (x86 / ARM)
https://docs.fluentbit.io/manual/installation/requirements

You could also run a ./util/test-pkg build to see if there are any std
library limitations with musl/uclibc/glibc.  To do that you create a
new file with your BR2_PACKAGE_FLUENT_BIT=y and then call the script
with that file like the following.
./utils/test-pkg -d <build-test-dir> -c <cfg_file> -a

> +       help
> +         Fluent Bit is an open source and multi-platform Log
> +         processor and forwarder which allows you to collect
> +         data/logs from different sources, unify and send them to
> +         multiple destinations.
> +
> +         http://fluentbit.io
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> new file mode 100644
> index 000000000000..96d0a5eaad27
> --- /dev/null
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# fluent
> +#
> +################################################################################
> +
> +FLUENT_BIT_VERSION=v1.0.4
> +FLUENT_BIT_SITE=https://github.com/fluent/fluent-bit.git
> +FLUENT_BIT_SITE_METHOD=git
> +FLUENT_BIT_INSTALL_STAGING = YES

What is used from staging?

> +FLUENT_BIT_DEPENDENCIES = zlib

You'll need to add a select in your Config.in after your depends.


> +
> +# Disable LuaJIT and filter_lua support
> +FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=OFF -DFLB_FILTER_LUA=OFF
> +
> +# Disable Library and examples
> +FLUENT_BIT_CONF_OPTS += -DFLB_SHARED_LIB=OFF -DBUILD_SHARED_LIBS=OFF
> +FLUENT_BIT_CONF_OPTS += -DFLB_EXAMPLES=OFF
> +
> +# Ensure that uses of autoconf behave with cross-compliation
> +FLUENT_BIT_CONF_OPTS += -DGNU_HOST=$(GNU_TARGET_NAME)
> +
> +$(eval $(cmake-package))
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

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
