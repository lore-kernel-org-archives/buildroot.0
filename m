From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 21 Jul 2011 23:27:45 +0200
Subject: [Buildroot] [PATCH] usbmount: bump to 0.0.21
In-Reply-To: <87y5zrz7ut.fsf@macbook.be.48ers.dk>
References: <4E26EA44.8080405@visionsystems.de>
 <87y5zrz7ut.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_kvayCdnok_hMrvAp-TaA9UwvgNoX39WxNM_SpvAokJnzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 21, 2011 at 10:39 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>
> ?Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ?Yegor> ---
> ?Yegor> ?package/usbmount/usbmount-0.0.14.1.patch | ? 57 -------------------------------
> ?Yegor> ?package/usbmount/usbmount.mk ? ? ? ? ? ? | ? ?7 ++-
> ?Yegor> ?2 files changed, 4 insertions(+), 60 deletions(-)
>
> Committed with some changes, thanks.
>
> First of all you forgot to remove the BR2_PACKAGE_UDEV_VOLUME_ID select,
> which was the reason for the version bump in the first place.
>
> ?Yegor> Index: b/package/usbmount/usbmount.mk
> ?Yegor> ===================================================================
> ?Yegor> --- a/package/usbmount/usbmount.mk
> ?Yegor> +++ b/package/usbmount/usbmount.mk
> ?Yegor> @@ -3,13 +3,14 @@
> ?Yegor> ?# usbmount
> ?Yegor> ?#
> ?Yegor> ?#############################################################
> ?Yegor> -USBMOUNT_VERSION=0.0.14.1
> ?Yegor> +USBMOUNT_VERSION=0.0.21
> ?Yegor> ?USBMOUNT_SOURCE:=usbmount_$(USBMOUNT_VERSION).tar.gz
> ?Yegor> -USBMOUNT_SITE:=http://usbmount.alioth.debian.org/package/
> ?Yegor> +USBMOUNT_SITE:=http://ftp.de.debian.org/debian/pool/main/u/usbmount
>
> We have a BR2_DEBIAN_MIRROR setting that should be used.
>
>
> ?Yegor> ?USBMOUNT_DEPENDENCIES = udev lockfile-progs
>
> ?Yegor> ?define USBMOUNT_INSTALL_TARGET_CMDS
> ?Yegor> - ? ? ? $(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/sbin/usbmount
> ?Yegor> + ? ? ? $(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
> ?Yegor> + ? ? ? $(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d
>
> You need to provide the destination file name when you use install -D
>
>
> ?Yegor> ? ? ? ? @if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
> ?Yegor> ? ? ? ? ? ? ? ? $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
> ?Yegor> ? ? ? ? fi
>
> You forgot to update the uninstall step.
>
> The script uses blkid, which we currently don't have enabled in the
> default busybox config. I'll fix that.

Peter, sorry for the unfinished patch. It was more intended so solve
the problems I pointed out in my answer to the udev patch.

"The usbmount.mk file is not installing the usbmount.rules file, so
udev knows nothing about this script. I bumped the package to the
newest version and instructed the installer to put rules files to
/lib/udev/rules.d/ but still it is not working. I'm not the biggest
udev expert yet, so if someone could take a look at the patch I will
send, it would really help. The package itself should depend on
util-linux, so it has nothing to do with volume_id any more."

busybox's blkid won't help, cause it doesn't provide enough info for
the script. Or do I see it wrong. So we need util-linx to do the job.
I've also sent a patch to bump to e newer version. I'm trying to
understand how usbmount work in Debian, perhaps I'll find out, what
I'm missing.

Yegor
