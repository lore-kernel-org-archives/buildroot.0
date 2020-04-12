From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:13:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: add homed support
In-Reply-To: <20200308214936.61309-1-james.hilliard1@gmail.com>
References: <20200308214936.61309-1-james.hilliard1@gmail.com>
Message-ID: <20200412151355.05613b84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 15:49:36 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> systemd-homed is a system service that may be used to create,
> remove, change or inspect home directories.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/Config.in  | 15 +++++++++++++++
>  package/systemd/systemd.mk |  8 +++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index bd638477a0..3c688d9e41 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -188,6 +188,21 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
>  
>  	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
>  
> +config BR2_PACKAGE_SYSTEMD_HOMED
> +	bool "enable home daemon"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
> +	depends on BR2_USE_MMU # cryptsetup -> lvm2
> +	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c

You were missing a dependency on headers >= 4.12 here, which is needed
for the fscrypt_key structure definition.

Also, a Config.in comment was missing.

I've fixed both issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
