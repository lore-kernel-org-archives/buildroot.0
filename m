From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 10:14:24 +0100
Subject: [Buildroot] [PATCH] libffi: Needs threads support in toolchain
In-Reply-To: <1353140814-26164-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Sat, 17 Nov 2012 09:26:54 +0100")
References: <1353140814-26164-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87lie0vbf3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Fixes
 Maxime> http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  package/libffi/Config.in   |    1 +
 Maxime>  package/libglib2/Config.in |    1 +
 Maxime>  package/python/Config.in   |    1 +
 Maxime>  package/python3/Config.in  |    1 +
 Maxime>  4 files changed, 4 insertions(+)

 Maxime> diff --git a/package/libffi/Config.in b/package/libffi/Config.in
 Maxime> index 7211f8f..6c7688c 100644
 Maxime> --- a/package/libffi/Config.in
 Maxime> +++ b/package/libffi/Config.in
 Maxime> @@ -1,5 +1,6 @@
 Maxime>  config BR2_PACKAGE_LIBFFI
 Maxime>  	bool "libffi"
 Maxime> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Maxime>  	help
 Maxime>  	  The libffi library provides a portable, high level
 Maxime>  	  programming interface to various calling conventions. This
 Maxime> diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
 Maxime> index 5282885..7b1040c 100644
 Maxime> --- a/package/libglib2/Config.in
 Maxime> +++ b/package/libglib2/Config.in
 Maxime> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBGLIB2
 Maxime>  	select BR2_PACKAGE_LIBFFI
 Maxime>  	select BR2_PACKAGE_ZLIB
 Maxime>  	depends on BR2_USE_WCHAR # gettext
 Maxime> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi

You will unfortunately also have to add it everywhere a package selects
libglib2 (and the packages selecting those):

git grep -l 'select BR2_PACKAGE_LIBGLIB2' package
package/atk/Config.in
package/bluez_utils/Config.in
package/connman/Config.in
package/dbus-glib/Config.in
package/docker/Config.in
package/enchant/Config.in
package/gamin/Config.in
package/gdk-pixbuf/Config.in
package/glib-networking/Config.in
package/gmpc/Config.in
package/gob2/Config.in
package/gvfs/Config.in
package/latencytop/Config.in
package/libglade/Config.in
package/libgtk2/Config.in
package/libmms/Config.in
package/libmpd/Config.in
package/librsvg/Config.in
package/libsoup/Config.in
package/lttng-babeltrace/Config.in
package/multimedia/gstreamer/Config.in
package/multimedia/mpd/Config.in
package/nbd/Config.in

-- 
Bye, Peter Korsgaard
