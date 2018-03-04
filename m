From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 4 Mar 2018 13:17:00 -0500
Subject: [Buildroot] [PATCH 1/3] package/skeleton-init-systemd: work
 around for /var/lib not populating
In-Reply-To: <eecb0195cfda07450e00e2162febe5626bf079c0.1520183159.git.yann.morin.1998@free.fr>
References: <cover.1520183159.git.yann.morin.1998@free.fr>
 <eecb0195cfda07450e00e2162febe5626bf079c0.1520183159.git.yann.morin.1998@free.fr>
Message-ID: <CAFSsvmqf3V+vw1OuhcHAykufTRzv2enSOC6a8TB1c=HjJPzgmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sun, Mar 4, 2018 at 12:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: Trent Piepho <tpiepho@impinj.com>
>
> When using a RO root with systemd, it is intended that /var/lib should be
> populated at boot time by tmpfiles system mirroring it from
> /usr/share/factory/var/lib.
>
> However, this will only happen if /var/lib does not already exist at the
> time systemd-tmpfiles runs.  If it does exist, then tmpfiles will
> (silently) skip it and do nothing.
>
> It turns out /var/lib will exist, because some part of systemd creates
> /var/lib/systemd/catalog on boot before tmpfiles runs.
>
> The fix used here is to also create tmpfiles entries for the contents of
> /var/lib/* and /var/lib/systemd/*.  This way, when those directories
> already exist, the entire tree is not skipped and instead the
> not-yet-existing contents of /var/lib and /var/lib/systemd will be still
> be mirrored from the factory dir.
>
> And if /var/lib/systemd, or a prefix of that, stops getting created and
> does not exist, it'll still mirror properly.
>
> It does cause some warnings from systemd:
> systemd[1]: Starting Create Volatile Files and Directories...
> systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:7] Duplicate line for path "/var/lib/systemd", ignoring.
> systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:8] Duplicate line for path "/var/lib/systemd/coredump", ignoring.
>
> But they can be ignored.
>
> IMHO, I think a better solution would be for systemd-tmpfiles to gain a
> "merge tree" operation that is like "C" but doesn't abort if the
> destination exists, but rather merges the source into it.
>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> [yann.morin.1998 at free.fr: slight rework of commit title]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index a2d4e8c4b3..6a0527fde2 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -40,7 +40,10 @@ endef
>  define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
>         rm -f $(TARGET_DIR)/var
>         mkdir $(TARGET_DIR)/var
> -       for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
> +       for i in $(TARGET_DIR)/usr/share/factory/var/* \
> +                $(TARGET_DIR)/usr/share/factory/var/lib/* \
> +                $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do \
> +               [ -e "$${i}" ] || continue; \
>                 j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
>                 if [ -L "$${i}" ]; then \
>                         printf "L+! %s - - - - %s\n" \
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Tested-by: Adam Duskett <aduskett@gmail.com>
