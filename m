From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Dec 2020 22:02:51 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/systemd: add a menu entry to
 enable portable services
In-Reply-To: <DM6PR01MB375592537E27457D12083884F3F10@DM6PR01MB3755.prod.exchangelabs.com>
References: <20201126155533.28179-1-fgervais@distech-controls.com>
 <DM6PR01MB375592537E27457D12083884F3F10@DM6PR01MB3755.prod.exchangelabs.com>
Message-ID: <57717ae0-a3f9-21ba-1354-f54325f99a05@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/12/2020 14:19, Gervais, Francois via buildroot wrote:
> Is there something more required on my part for this patch?
> 
> The delay might be normal but since my previous patches where
> merged in quite quickly I'd like to make sure I'm not missing something.

 It's not really normal, but it is usual :-) We have a huge patch backlog, as
you can see on http://patchwork.ozlabs.org/project/buildroot/list/ It can
sometimes take up to a year before even a simple patch gets merged, unfortunately.

 That said, I've applied your patch now.

> From: Gervais, Francois <FGervais@distech-controls.com>
> Sent: November 26, 2020 10:55 AM
> To: buildroot at buildroot.org <buildroot@buildroot.org>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>; Yann E . MORIN <yann.morin.1998@free.fr>; Norbert Lange <nolange79@gmail.com>; Gervais, Francois <FGervais@distech-controls.com>
> Subject: [PATCH v3 1/1] package/systemd: add a menu entry to enable portable services 
> ?
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
> Reviewed-by: Norbert Lange <nolange79@gmail.com>
> ---
> ?package/systemd/Config.in? | 17 +++++++++++++++++
> ?package/systemd/systemd.mk |? 7 ++++++-
> ?2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index ec34478e3d..3966ba2fc7 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -343,6 +343,23 @@ comment "polkit support needs a toolchain with C++, wchar, NPTL, gcc >= 4.9"
> ???????????????? !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> ???????????????? !BR2_USE_WCHAR
> ?
> +config BR2_PACKAGE_SYSTEMD_PORTABLED
> +?????? bool "enable portable services"
> +?????? help
> +???????? Portable services are systemd services that can be dynamically
> +???????? attached and detached from the system.
> +
> +???????? These services must come with their own root directory which
> +???????? they are bond to through an automatically generated drop-in.
> +
> +???????? They also have restrictions applied by the host system in the
> +???????? form of profiles.
> +
> +???????? This functionality is provided by the system service systemd-portabled

 This line was too long, as reported by utils/check-package. I fixed that while
applying.

 Regards,
 Arnout

> +???????? along with the corresponding CLI portablectl.
> +
> +???????? https://systemd.io/PORTABLE_SERVICES/
> +
> ?config BR2_PACKAGE_SYSTEMD_QUOTACHECK
> ???????? bool "enable quotacheck tools"
> ???????? help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index cb12f667d6..5aed87f452 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -33,7 +33,6 @@ SYSTEMD_CONF_OPTS += \
> ???????? -Dman=false \
> ???????? -Dmount-path=/usr/bin/mount \
> ???????? -Dnss-systemd=true \
> -?????? -Dportabled=false \
> ???????? -Dquotacheck-path=/usr/sbin/quotacheck \
> ???????? -Dquotaon-path=/usr/sbin/quotaon \
> ???????? -Drootlibdir='/usr/lib' \
> @@ -417,6 +416,12 @@ else
> ?SYSTEMD_CONF_OPTS += -Dpolkit=false
> ?endif
> ?
> +ifeq ($(BR2_PACKAGE_SYSTEMD_PORTABLED),y)
> +SYSTEMD_CONF_OPTS += -Dportabled=true
> +else
> +SYSTEMD_CONF_OPTS += -Dportabled=false
> +endif
> +
> ?ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
> ?SYSTEMD_CONF_OPTS += -Dnetworkd=true
> ?SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
> 
