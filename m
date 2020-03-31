From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 31 Mar 2020 18:23:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.6.0
In-Reply-To: <20200330185038.31994-1-james.hilliard1@gmail.com>
References: <20200330185038.31994-1-james.hilliard1@gmail.com>
Message-ID: <20200331182340.GE368543@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

I was just planning to send such an update to the Cog package, you were
faster ;-)

Please check the comment below.

On Mon, 30 Mar 2020 12:50:38 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> Drop patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ata.state-is-not-null-before-calling.patch | 30 -------------------
>  ...ata.state-is-not-null-before-calling.patch | 30 -------------------
>  ...ata.keymap-is-not-null-before-callin.patch | 30 -------------------
>  package/cog/cog.hash                          | 10 +++----
>  package/cog/cog.mk                            |  2 +-
>  5 files changed, 6 insertions(+), 96 deletions(-)
>  delete mode 100644 package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
>  delete mode 100644 package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
>  delete mode 100644 package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch
> 
> diff --git a/package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch b/package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
> deleted file mode 100644
> index 4e8d4ad121..0000000000
> --- a/package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 9f1f1e64b65e6680d5cdedf5a3b753ef85fc01f4 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Tue, 18 Feb 2020 01:20:50 -0700
> -Subject: [PATCH] fdo: ensure xkb_data.state is not null before calling
> - xkb_state_update_mask (#180)
> -
> -[james.hilliard1 at gmail.com: backport from upstream commit
> -9f1f1e64b65e6680d5cdedf5a3b753ef85fc01f4]
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----
> - platform/cog-platform-fdo.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/platform/cog-platform-fdo.c b/platform/cog-platform-fdo.c
> -index 36177fc..e6f1cb5 100644
> ---- a/platform/cog-platform-fdo.c
> -+++ b/platform/cog-platform-fdo.c
> -@@ -894,6 +894,9 @@ keyboard_on_modifiers (void *data,
> -                        uint32_t mods_locked,
> -                        uint32_t group)
> - {
> -+    if (xkb_data.state == NULL)
> -+        return;
> -+
> -     xkb_state_update_mask (xkb_data.state,
> -                            mods_depressed,
> -                            mods_latched,
> --- 
> -2.20.1
> -
> diff --git a/package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch b/package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
> deleted file mode 100644
> index 48918001e9..0000000000
> --- a/package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 575ef199984ae4e8510ed36f8b1ae1babdff8ea9 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Thu, 26 Mar 2020 07:48:19 -0600
> -Subject: [PATCH] fdo: ensure xkb_data.state is not null before calling
> - xkb_state_key_get_one_sym (#192)
> -
> -[james.hilliard1 at gmail.com: backport from upstream commit
> -575ef199984ae4e8510ed36f8b1ae1babdff8ea9]
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----
> - platform/cog-platform-fdo.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/platform/cog-platform-fdo.c b/platform/cog-platform-fdo.c
> -index 043f91d..93ff255 100644
> ---- a/platform/cog-platform-fdo.c
> -+++ b/platform/cog-platform-fdo.c
> -@@ -919,6 +919,9 @@ capture_app_key_bindings (uint32_t keysym,
> - static void
> - handle_key_event (uint32_t key, uint32_t state, uint32_t time)
> - {
> -+    if (xkb_data.state == NULL)
> -+        return;
> -+
> -     uint32_t keysym = xkb_state_key_get_one_sym (xkb_data.state, key);
> -     uint32_t unicode = xkb_state_key_get_utf32 (xkb_data.state, key);
> - 
> --- 
> -2.20.1
> -
> diff --git a/package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch b/package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch
> deleted file mode 100644
> index 58842bb15c..0000000000
> --- a/package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 817f6c9dafd5ad23722eae0a8f43ba9211f37c95 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Thu, 26 Mar 2020 07:49:05 -0600
> -Subject: [PATCH] fdo: ensure xkb_data.keymap is not null before calling
> - xkb_keymap_key_repeats (#193)
> -
> -[james.hilliard1 at gmail.com: backport from upstream commit
> -817f6c9dafd5ad23722eae0a8f43ba9211f37c95]
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----
> - platform/cog-platform-fdo.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/platform/cog-platform-fdo.c b/platform/cog-platform-fdo.c
> -index 93ff255..ecc05e9 100644
> ---- a/platform/cog-platform-fdo.c
> -+++ b/platform/cog-platform-fdo.c
> -@@ -990,7 +990,8 @@ keyboard_on_key (void *data,
> -         memset (&wl_data.keyboard.repeat_data,
> -                 0x00,
> -                 sizeof (wl_data.keyboard.repeat_data));
> --    } else if (state == WL_KEYBOARD_KEY_STATE_PRESSED
> -+    } else if (xkb_data.keymap != NULL
> -+               && state == WL_KEYBOARD_KEY_STATE_PRESSED
> -                && xkb_keymap_key_repeats (xkb_data.keymap, key)) {
> -         if (wl_data.keyboard.repeat_data.event_source)
> -             g_source_remove (wl_data.keyboard.repeat_data.event_source);
> --- 
> -2.20.1
> -
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index 2e37928fc6..dc5c1b3c46 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.4.0.tar.xz.sums
> -md5 75a0838ee6c81bb8df1b254f525440a6 cog-0.4.0.tar.xz
> -sha1 284d2a641e6269b296057918602c8c94eb831527 cog-0.4.0.tar.xz
> -sha256 e9c13a51232434b7340a419b1e6f59c40c582cd80c8e60bd9ec7de16c904fc03 cog-0.4.0.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.6.0.tar.xz.sums
> +md5  a97df4f0e2d25f4da7cd9bb55294d30e  cog-0.6.0.tar.xz
> +sha1  9392d9251bab8a9f61d00297707e16a983127eae  cog-0.6.0.tar.xz
> +sha256  208f58e0533b269400875237a95e994c93da7234a29fd1c904e756b88963e35d  cog-0.6.0.tar.xz
>  
>  # Hashes for license files:
> -sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> +sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index d0e5b79c38..38ce4a0030 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -COG_VERSION = 0.4.0
> +COG_VERSION = 0.6.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES

Here in ?cog.mk? I would add the following to COG_CONF_OPTS:

  -DCOG_PLATFORM_DRM=OFF
  -DCOG_WESTON_DIRECT_DISPLAY=OFF
  -DINSTALL_MAN_PAGES=OFF

As usual with packaging, it's best to explicitly set build options instead
of relying on the package defaults, which might change any time (well, in
this case I am the one doing the releases and I do not expect any of them
changing any time soon; but it's good practice to be explicit nevertheless).

Cheers,
?Adri?n

> -- 
> 2.20.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200331/602efb3d/attachment.asc>
