From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 15:26:26 +0200
Subject: [Buildroot] [PATCH v3 2/2] systemd: select util-linux/fsck and
 e2fsprogs/e2fsck
In-Reply-To: <1491154114-14797-3-git-send-email-casantos@datacom.ind.br>
References: <1491154114-14797-1-git-send-email-casantos@datacom.ind.br>
 <1491154114-14797-3-git-send-email-casantos@datacom.ind.br>
Message-ID: <3f5305c2-c524-3766-6569-af36901311b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-17 19:28, Carlos Santos wrote:
> e2fsprogs does not override/remove the fsck from util-linux anymore when
> /sbin and /usr/sbin are merged. So we can select the fsck tools required
> by systemd provided by those packages. This also prevents ending up with
> the fsck from busybox, which is incompatible with systemd.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/systemd/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 0f54686..f5eb9d0 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -22,6 +22,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
>  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
>  	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
> +	select BR2_PACKAGE_UTIL_LINUX_FSCK

 I agree with this bit. If I understand correctly, as soon as you have *some*
filesystem configured (or hotplugged), systemd will call fsck with an option not
known to busybox/e2fsprogs fsck and will barf.

> +	select BR2_PACKAGE_E2FSPROGS
> +	select BR2_PACKAGE_E2FSPROGS_E2FSCK

 I don't agree with this bit: it should only be necessary when there is an ext2
filesystem somewhere. And even so, with a 'nofail' in fstab, it's not an error
if the fsck.ext2 is missing. Therefore, it's up to the user to select it IMO. At
most, add something to the help text about it.

 Note that e2fsprogs is AFAIK the only provider of e2fsck (busybox has an fsck
wrapper but not an fsck.ext2).


 Regards,
 Arnout

>  	select BR2_PACKAGE_KMOD
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
>  	select BR2_PACKAGE_KMOD_TOOLS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
