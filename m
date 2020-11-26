From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 26 Nov 2020 11:44:38 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/systemd: add a menu entry to
 enable portable services
In-Reply-To: <20201125223956.24847-2-fgervais@distech-controls.com>
References: <20201125223956.24847-1-fgervais@distech-controls.com>
 <20201125223956.24847-2-fgervais@distech-controls.com>
Message-ID: <CADYdroM7YRKR=D6x42WyB8xdZaeenWwN58jFgP+zBqvNY2449w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 25. Nov. 2020 um 23:41 Uhr schrieb Francois Gervais
<fgervais@distech-controls.com>:
>
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
> ---
>  package/systemd/Config.in  | 17 +++++++++++++++++
>  package/systemd/systemd.mk |  6 ++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index ec34478e3d..3966ba2fc7 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -343,6 +343,23 @@ comment "polkit support needs a toolchain with C++, wchar, NPTL, gcc >= 4.9"
>                 !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>                 !BR2_USE_WCHAR
>
> +config BR2_PACKAGE_SYSTEMD_PORTABLED
> +       bool "enable portable services"
> +       help
> +         Portable services are systemd services that can be dynamically
> +         attached and detached from the system.
> +
> +         These services must come with their own root directory which
> +         they are bond to through an automatically generated drop-in.
> +
> +         They also have restrictions applied by the host system in the
> +         form of profiles.
> +
> +         This functionality is provided by the system service systemd-portabled
> +         along with the corresponding CLI portablectl.
> +
> +         https://systemd.io/PORTABLE_SERVICES/
> +
>  config BR2_PACKAGE_SYSTEMD_QUOTACHECK
>         bool "enable quotacheck tools"
>         help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index e24c357ccf..5aed87f452 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -416,6 +416,12 @@ else
>  SYSTEMD_CONF_OPTS += -Dpolkit=false
>  endif
>
> +ifeq ($(BR2_PACKAGE_SYSTEMD_PORTABLED),y)
> +SYSTEMD_CONF_OPTS += -Dportabled=true
> +else
> +SYSTEMD_CONF_OPTS += -Dportabled=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
>  SYSTEMD_CONF_OPTS += -Dnetworkd=true
>  SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
> --
> 2.17.1
>

I would prefer this to be a single commit, no point in an extra "revert".
Other than that:

reviewed-by: Norbert Lange <nolange79@gmail.com>

Norbert
