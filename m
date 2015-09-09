From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 11:21:03 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <55EFF9FF.1020402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 23:28, Luca Ceresoli wrote:
> +++ b/package/busybox/inittab
> @@ -16,6 +16,7 @@
>  # Startup the system
>  null::sysinit:/bin/mount -t proc proc /proc
>  null::sysinit:/bin/mount -t sysfs sysfs /sys
> +#null::sysinit:/sbin/activate-mdev

 Excuse my stupidity, but wouldn't it be enough to add the following here:

null::sysinit:/bin/mount -t tmpfs mdev /dev

and keep on using S10mdev? That is less invasive, and it should work since it's
more or less the same as what is done in the cpio/initramfs case.


 Regards,
 Arnout

>  null::sysinit:/bin/mount -o remount,rw /
>  null::sysinit:/bin/mkdir -p /dev/pts
>  null::sysinit:/bin/mkdir -p /dev/shm
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
