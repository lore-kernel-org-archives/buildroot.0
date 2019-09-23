From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 23 Sep 2019 08:12:17 -0500
Subject: [Buildroot] [PATCH 09/30] package/musl-fts: new package
In-Reply-To: <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpbDfgRAvwf1caXcRJV5k1Mi=NeRyiUaE9RS-hCOQ9UWEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Sun, Sep 22, 2019 at 4:07 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This package provides a replacement implementation for <fts.h>
> functions missing from musl and uClibc-ng.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/musl-fts/Config.in     |  7 +++++++
>  package/musl-fts/musl-fts.hash |  3 +++
>  package/musl-fts/musl-fts.mk   | 21 +++++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/musl-fts/Config.in
>  create mode 100644 package/musl-fts/musl-fts.hash
>  create mode 100644 package/musl-fts/musl-fts.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b427fd92ae..18ef50c311 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2291,6 +2291,7 @@ F:        package/monit/
>  F:     package/mpdecimal/
>  F:     package/msmtp/
>  F:     package/musl/
> +F:     package/musl-fts/
>  F:     package/ne10/
>  F:     package/pkg-python.mk
>  F:     package/pkg-autotools.mk
> diff --git a/package/Config.in b/package/Config.in
> index 2fc11065f6..15572e7a1d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1766,6 +1766,7 @@ endif
>         source "package/msgpack/Config.in"
>         source "package/mtdev2tuio/Config.in"
>         source "package/musl-compat-headers/Config.in"
> +       source "package/musl-fts/Config.in"
>         source "package/openblas/Config.in"
>         source "package/orc/Config.in"
>         source "package/p11-kit/Config.in"
> diff --git a/package/musl-fts/Config.in b/package/musl-fts/Config.in
> new file mode 100644
> index 0000000000..a7f38c182e
> --- /dev/null
> +++ b/package/musl-fts/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MUSL_FTS
> +       bool "musl-fts"
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         The musl-fts package implements the fts(3) functions
> +         fts_open, fts_read, fts_children, fts_set and fts_close,
> +         which are missing in musl and uClibc-ng C libraries.
> diff --git a/package/musl-fts/musl-fts.hash b/package/musl-fts/musl-fts.hash
> new file mode 100644
> index 0000000000..207fef31ad
> --- /dev/null
> +++ b/package/musl-fts/musl-fts.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256   49ae567a96dbab22823d045ffebe0d6b14b9b799925e9ca9274d47d26ff482a6  musl-fts-v1.2.7.tar.gz
> +sha256   55af87e4017668f54467a3380e7ebbac5e672d8c763bfe95e6fc882a6fdc4046  COPYING
> diff --git a/package/musl-fts/musl-fts.mk b/package/musl-fts/musl-fts.mk
> new file mode 100644
> index 0000000000..190f3864b4
> --- /dev/null
> +++ b/package/musl-fts/musl-fts.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# musl-fts
> +#
> +################################################################################
> +
> +MUSL_FTS_VERSION = v1.2.7

Does it make sense in this case to move the "v" to the SITE like the
other version fix-ups?  I checked release monitoring and it doesn't
look like there is an entry yet for this package (ie. no precedence
has been set yet)

> +MUSL_FTS_SITE = $(call github,void-linux,musl-fts,$(MUSL_FTS_VERSION))

Regards,
Matt
