From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 00:30:35 +0100
Subject: [Buildroot] [PATCH 2/4] Convert busybox to the device
	declaration method
In-Reply-To: <1098caad9414fca0d7395e8c65b7034c780f4ed3.1326304128.git.maxime.ripard@free-electrons.com>
References: <cover.1326304128.git.maxime.ripard@free-electrons.com>
 <1098caad9414fca0d7395e8c65b7034c780f4ed3.1326304128.git.maxime.ripard@free-electrons.com>
Message-ID: <201201210030.35889.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 11 January 2012 18:53:39 Maxime Ripard wrote:
> Busybox used to declare and create files even if the package was not
> enabled through the device table. Remove the entries for busybox in the
> device table and move them to the package declaration.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/busybox/busybox.mk      |    5 +++++
>  target/generic/device_table.txt |    2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index d18b6d0..59448d5 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -28,6 +28,11 @@ ifndef BUSYBOX_CONFIG_FILE
>  	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
>  endif
>  
> +define BUSYBOX_PERMISSIONS
> +/bin/busybox			 f 4755	0 0 - - - - -
> +/usr/share/udhcpc/default.script f 755  0 0 - - - - -
 Actually, the default.script doesn't need to be touched.  busybox.mk will
install it with install -m 0755 so the line above doesn't change it.  (Note:
I verified that.)

> +endef
> +
[snip]


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
