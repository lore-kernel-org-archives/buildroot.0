From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:26:24 +1300
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 10.0
In-Reply-To: <20170122141637.18048-1-bernd.kuhls@t-online.de>
References: <20170122141637.18048-1-bernd.kuhls@t-online.de>
Message-ID: <20170124182624.1313b78b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 15:16:37 +0100, Bernd Kuhls wrote:

> Dependency to json-c was dropped, updated reverse dependencies as well.
> Added optional dependency to libatomic_ops.

If libatomic_ops is an optional dependency, why are you selecting it
from the Config.in file?


> diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
> index 20aa374fce..2d1debdb41 100644
> --- a/package/pulseaudio/Config.in
> +++ b/package/pulseaudio/Config.in
> @@ -3,9 +3,8 @@ config BR2_PACKAGE_PULSEAUDIO
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
> +	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4

This line is just wrong, since BR2_PACKAGE_LIBATOMIC_OPTS depends on
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS, so you can't just select
BR2_PACKAGE_LIBATOMIC_OPS like this.

Which is exactly why I'm asking above why you are selecting
libatomic_ops if it's really an optional dependency. If it's really an
optional dependency, just don't do anything in the Config.in file, and
keep the change you already have in the .mk file to depend on
libatomic_ops when enabled in the Buildroot configuration.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
