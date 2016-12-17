From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 23:52:36 +0100
Subject: [Buildroot] [PATCH 2/2] soletta: new package
In-Reply-To: <1477419935-86355-2-git-send-email-fabrice.fontaine@orange.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
 <1477419935-86355-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161217235236.06cc45a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 20:25:35 +0200, Fabrice Fontaine wrote:

>  .../0001-Check-availability-of-RB_SW_SUSPEND.patch |  37 ++++++
>  ...Check-availability-of-nonstandard-locales.patch |  64 ++++++++++
>  .../0003-Use-tinydtls-from-buildsystem.patch       | 102 +++++++++++++++
>  .../0004-Use-tinycbor-from-buildsystem.patch       | 139 +++++++++++++++++++++
>  package/soletta/0005-Fix-tinycbor-API-calls.patch  | 130 +++++++++++++++++++
>  .../0006-Remove-warning-when-building-OIC.patch    |  32 +++++

Have all those patches been submitted upstream?

> diff --git a/package/soletta/Config.in b/package/soletta/Config.in
> new file mode 100644
> index 0000000..a9891c0
> --- /dev/null
> +++ b/package/soletta/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_SOLETTA
> +	bool "soletta"
> +	depends on BR2_USE_MMU # fork
> +	# python3 is not really needed except for 4 development scripts, however
> +	# if we don't enable it, host-python-jsonschema will be installed for
> +	# the default python interpreter which is host-python2. As a result
> +	# host-python3 will not find the module in its site-packages directory.

If python3 is not really needed, then why don't you use the default
host-python? You can do this:

SOLETTA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

Also, in any case, it fails to build here (even with python3) :

ESC[3m>>> soletta v1 BuildingESC[23m
PATH="/home/test/buildroot/output/host/bin:/home/test/buildroot/output/host/sbin:/home/test/buildroot/output/host/usr/bin:/home/test/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games" /usr/bin/make -j9 TARGETAR="/home/test/buildroot/output/host/usr/bin/arm-linux-ar" TARGETCC="/home/test/buildroot/output/host/usr/bin/arm-linux-gcc" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" SOLETTA_CONF="/home/test/buildroot/output/build/soletta-v1/soletta_conf" -C /home/test/buildroot/output/build/soletta-v1 -f Makefile.smallos
make[1]: Entering directory `/home/test/buildroot/output/build/soletta-v1'
Makefile.smallos:35: "LDFLAGS not set. This is probably an error"
Makefile.smallos:55: *** multiple target patterns.  Stop.
make[1]: Leaving directory `/home/test/buildroot/output/build/soletta-v1'
make: *** [/home/test/buildroot/output/build/soletta-v1/.stamp_built] Error 2

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
