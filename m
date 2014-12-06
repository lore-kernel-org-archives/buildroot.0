From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Dec 2014 16:23:23 +0100
Subject: [Buildroot] [PATCH 1/1] Added mpd-mpc, mpc client to mpd
In-Reply-To: <1417876929-21438-1-git-send-email-tbultel@free.fr>
References: <1417876929-21438-1-git-send-email-tbultel@free.fr>
Message-ID: <20141206162323.6f20ce60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Sat,  6 Dec 2014 15:42:09 +0100, Thierry Bultel wrote:

> diff --git a/package/mpd-mpc/Config.in b/package/mpd-mpc/Config.in
> new file mode 100644
> index 0000000..a56e2a6
> --- /dev/null
> +++ b/package/mpd-mpc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MPD_MPC
> +	bool "mpd-mpc"
> +	select BR2_PACKAGE_MPD
> +	select BR2_PACKAGE_LIBMPDCLIENT

When you select a package, you must replicate the dependencies of this
package. So if you select BR2_PACKAGE_MPD, you should add:

        depends on BR2_INSTALL_LIBSTDCPP # mpd
        depends on BR2_LARGEFILE # mpd -> boost
        depends on BR2_USE_WCHAR # mpd -> libglib2, flac
        depends on BR2_TOOLCHAIN_HAS_THREADS # mpd -> libglib2
        depends on BR2_USE_MMU # mpd-> libglib2
        # avr32, sparc & CS powerpc gcc are too old for mpd
        depends on !(BR2_avr32 || BR2_sparc)
        depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)

However, are you sure "mpd" is really a build dependency? To me, it
seems like only mpdclient is needed to build mpc. And you could imagine
having to build only the client on a given system, where the mpd server
would run on another system, no?

> +MPD_MPC_VERSION = 0.26
> +MPD_MPC_SITE = http://www.musicpd.org/download/mpc/0
> +MPD_MPC_SOURCE=mpc-$(MPD_MPC_VERSION).tar.xz

Spaces before and after = sign.

> +MPD_MPC_DEPENDENCIES = mpd libmpdclient

mpd dependency really needed?

You should also include MPD_MPC_LICENSE and MPD_MPC_LICENSE_FILES.

These days, we also like to have the hash file for new packages. See
http://buildroot.org/downloads/manual/manual.html#adding-packages-hash
for details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
