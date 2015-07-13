From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 00:58:21 +0200
Subject: [Buildroot] [PATCHv2] package/dropbear: fix generating keys on
	RO file systems
In-Reply-To: <1436827441-29183-1-git-send-email-yann.morin.1998@free.fr>
References: <1436827441-29183-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivwDigF-pvN_qwZU0UrxPnBytmEJ-rYiSGinMBvBN+LVDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

On Tue, Jul 14, 2015 at 12:44 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
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
>
> ---
> Changes v1 -> v2:
>   - fix indentation  (Arnout)
>   - also change the systemd unit file  (Maxime)
>   - fix logic  (Maxime)
>   - fix subject
> ---
>  package/dropbear/S50dropbear      | 14 ++++++++++++++
>  package/dropbear/dropbear.mk      |  2 +-
>  package/dropbear/dropbear.service | 13 +++++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
> index 2694931..af50ccf 100644
> --- a/package/dropbear/S50dropbear
> +++ b/package/dropbear/S50dropbear
> @@ -11,6 +11,20 @@ start() {
>
>         echo -n "Starting dropbear sshd: "
>         umask 077
> +
> +       # If /etc/dropbear is not a directory, and
> +       #   - the filesystem is RO (i.e. we can not rm the symlink),
> +       #     create the directory pointed to by the symlink.
> +       #   - the filesystem is RW (i.e. we can rm the symlink),
> +       #     replace the symlink with an actual directory
> +       if ! [ -d /etc/dropbear ]; then
> +               if rm -f /etc/dropbear; then
> +                       mkdir -p /etc/dropbear
> +               else
> +                       mkdir -p $(readlink /etc/dropbear)
> +               fi
> +       fi
> +
>         start-stop-daemon -S -q -p /var/run/dropbear.pid \
>                 --exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
>         [ $? = 0 ] && echo "OK" || echo "FAIL"
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
> diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
> index 4e6c879..0e2cf54 100644
> --- a/package/dropbear/dropbear.service
> +++ b/package/dropbear/dropbear.service
> @@ -3,6 +3,19 @@ Description=Dropbear SSH daemon
>  After=syslog.target network.target auditd.service
>
>  [Service]
> +# If /etc/dropbear is not a directory, and
> +#   - the filesystem is RO (i.e. we can not rm the symlink),
> +#     create the directory pointed to by the symlink.
> +#   - the filesystem is RW (i.e. we can rm the symlink),
> +#     replace the symlink with an actual directory
> +ExecStartPre=/bin/sh -c '\
> +if ! [ -d /etc/dropbear ]; then \
> +    if rm -f /etc/dropbear; then \
> +        mkdir -p /etc/dropbear; \
> +    else \
> +        mkdir -p $(readlink /etc/dropbear); \
> +    fi; \
> +fi'
>  ExecStart=/usr/sbin/dropbear -F -R
>  ExecReload=/bin/kill -HUP $MAINPID
>
> --
> 1.9.1
>
