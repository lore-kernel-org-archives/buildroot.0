From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 05 Oct 2009 11:00:30 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: adjust make environment for
 pkg-config call
In-Reply-To: <87y6nq44bp.fsf@macbook.be.48ers.dk>
References: <1254731431-8430-1-git-send-email-s.neumann@raumfeld.com>
	<87y6nq44bp.fsf@macbook.be.48ers.dk>
Message-ID: <1254733230.5772.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2009-10-05 at 10:45 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
> Hi,
> 
>  Sven> In case that wpa_supplicant is configured with DBus interface,
>  Sven> it calls pkg-config to find the dbus headers and libraries.
>  Sven> Adjust the make environment so that it will use the right
>  Sven> pkg-config search paths.
> 
>  Sven>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  Sven> -	WPA_SUPPLICANT_DEPENDENCIES += dbus
>  Sven> +	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconfig dbus
>  Sven> +	WPA_SUPPLICANT_MAKE_ENV = \
>  Sven> +		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
>  Sven> +		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
> 
> Won't this pick up /usr/bin/pkg-config instead of the one in HOST_DIR? I
> would prefer to simply use TARGET_CONFIGURE_OPTS here so the path gets
> set and we only have the pkgconfig magic one place.

The PATH is already set. Here's the relevant line from our log (with
this change applied):

PATH="/tmp/build/build/toolchain_build_arm/bin:/tmp/build/build/build_arm/host_dir/bin:/tmp/build/build/build_arm/host_dir/usr/bin:/tmp/build/build/build_arm/staging_dir/bin:/tmp/build/build/build_arm/staging_dir/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games" PKG_CONFIG_SYSROOT_DIR="/tmp/build/build/build_arm/staging_dir" PKG_CONFIG_PATH="/tmp/build/build/build_arm/staging_dir/usr/lib/pkgconfig" /usr/bin/make -j4  -C /tmp/build/build/build_arm/wpa_supplicant-0.6.9/wpa_supplicant

But if you can come up with a cleaner solution, then please go ahead and
commit it instead of my patch.


Sven
