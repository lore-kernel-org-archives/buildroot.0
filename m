From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 12:33:42 +0000
Subject: [Buildroot] FW: [PATCH] linux-headers: cross compile fix
In-Reply-To: <20140223105041.414123e2@skate>
References: <884EA965490E3C4D8E66AEF41E98025006BF4D@ezex10.ezchip.com>
 <20140223105041.414123e2@skate>
Message-ID: <884EA965490E3C4D8E66AEF41E98025006C47E@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See Inline

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Sunday, February 23, 2014 11:51 AM
To: Noam Camus
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] FW: [PATCH] linux-headers: cross compile fix

Dear Noam Camus,

On Sun, 23 Feb 2014 08:29:15 +0000, Noam Camus wrote:
> Otherwise compiler not found errors occured.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  package/linux-headers/linux-headers.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/linux-headers/linux-headers.mk 
> b/package/linux-headers/linux-headers.mk
> index 30d3076..632b94f 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -25,6 +25,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
>  			HOSTCFLAGS="$(HOSTCFLAGS)" \
>  			HOSTCXX="$(HOSTCXX)" \
>  			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
> +			CROSS_COMPILE="$(TARGET_CROSS)" \
>  			headers_install)
>  endef
>  

Doesn't look harmful in principle, but it seems to have worked until now without CROSS_COMPILE="$(TARGET_CROSS)". Can you expand the commit log by explaining in which case you have seen errors, and which errors.
The linux-headers package is used daily to build toolchains by all Buildroot users, so I'd like to understand how your situation is different. Is it that the ARC kernel headers need something special?
But we are building ARC toolchains everyday in the autobuilders, with no problem. That's why I'd like to have more details.
Thomas 

[Noam Camus]
Sorry for long lines I am still looking for better email client than my outlook.
Just use target linux-headers-rebuild and you will get many errors that buildroot silently ignores.
You alternatively may add intentionally BAD CROSS_COMPILE if you don't have ARC setup handy and see that
Toolchain building is not stopped due to this error.
For example here is my log:
---------------------------------------
rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_rsynced
rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_built
rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_staging_installed
rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_target_installed
rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_images_installed
rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_host_installed
>>> linux-headers custom Syncing from source dir /home/noamc/workspace/sb/EZdk-nps/ldk/build/buildroot/../sources/linux-nps
rsync -au --cvs-exclude --include core /home/noamc/workspace/sb/EZdk-nps/ldk/build/buildroot/../sources/linux-nps/ /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom
>>> linux-headers custom Building
>>> linux-headers custom Installing to staging directory
(cd /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom; PATH="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/bin:/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/bin:/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/sbin/:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/npsdb/ezutils:/home/noamc/bin:/home/npsdb/ezutils" PERLLIB="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/lib/perl" /usr/bin/make -j9 ARCH=arc HOSTCC="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/bin/ccache /usr/bin/gcc" HOSTCFLAGS="" HOSTCXX="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/bin/ccache /usr/bin/g++" INSTALL_HDR_PATH=/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/arceb-ezchip-linux-uclibc/sysroot/usr headers_install)
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
make[3]: arc-linux-uclibc-gcc: Command not found
make[3]: Entering directory `/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom'
make[3]: arc-linux-uclibc-gcc: Command not found
  CHK     include/generated/uapi/linux/version.h
make[3]: Leaving directory `/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom'
>>> linux-headers custom Installing to target
---------------------------------------------------------
Regards,
Noam
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
