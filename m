From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 17:00:25 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix generatign keys on RO
	file systems
In-Reply-To: <1436798945-6869-1-git-send-email-yann.morin.1998@free.fr>
References: <1436798945-6869-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivyQufZO+8PXevZoD6c2Ec5CCuyCoa0B5HTNrW7m7ic65A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

On Mon, Jul 13, 2015 at 4:49 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> dropbear generates its keys at the first connection, and wants to save
> them in /etc/dropbear (not configurable).
>
> Currently, our /etc/dropbear is a directory.
>
> When the filesystem is read-only, dropbear can't save its keys, so
> refuses all connections.
>
> Fix that with:
>
>   - at build time, create /etc/dropbear as a symlink to
>     /var/run/dropbear
>
>   - at runtime, if the filesystem is RW (we can rm /etc/dropbear),
>     we replace the symlink with an actual directory; otherwise,
>     when the filesystem is RO (we can't rm /etc/dropbear), we create
>     /var/run/dropbear so the symlink points to an existing directory
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/dropbear/S50dropbear | 14 ++++++++++++++
>  package/dropbear/dropbear.mk |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
> index 2694931..790d95a 100644
> --- a/package/dropbear/S50dropbear
> +++ b/package/dropbear/S50dropbear
> @@ -11,6 +11,20 @@ start() {
>
>         echo -n "Starting dropbear sshd: "
>         umask 077
> +
> +    # If /etc/dropbear is not a directory, and
> +    #   - the filesystem is RO (i.e. we can not rm the symlink),
> +    #     create the directory pointed to by the symlink.
> +    #   - the filesystem is RW (i.e. we can rm the symlink),
> +    #     replace the symlink with an actual directory
> +       if ! [ -d /etc/dropbear ]; then
> +               if ! rm -f /etc/dropbear; then
> +                       mkdir -p /etc/dropbear
> +               else
> +                       mkdir -p $(readlink -f /etc/dropbear)
> +               fi
> +       fi
> +
>         start-stop-daemon -S -q -p /var/run/dropbear.pid \
>                 --exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
>         [ $? = 0 ] && echo "OK" || echo "FAIL"
So systemd users are left behind ? :(
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index bc65d69..5bbe864 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -93,7 +93,7 @@ define DROPBEAR_INSTALL_TARGET_CMDS
>         for f in $(DROPBEAR_TARGET_BINS); do \
>                 ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
>         done
> -       mkdir -p $(TARGET_DIR)/etc/dropbear
> +       ln -snf ../var/run/dropbear $(TARGET_DIR)/etc/dropbear
>  endef
>
>  $(eval $(autotools-package))
> --
> 1.9.1
>
