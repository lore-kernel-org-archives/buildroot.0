From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 6 Feb 2018 16:09:56 +0100
Subject: [Buildroot] [PATCH] package/openssh: Add tmpfiles.d snippet to
 make /var/empty
In-Reply-To: <20180123232451.6236-1-chris.lesiak@licor.com>
References: <20180123232451.6236-1-chris.lesiak@licor.com>
Message-ID: <CAHXCMMKAZ=oCwBmTo=7gL2+yQr1E2hpJoz+ow5Anpju81wOp4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, all,

On Wed, Jan 24, 2018 at 12:24 AM, Chris Lesiak <chris.lesiak@licor.com> wrote:
> This is useful in volatile or stateless systems in which /var is empty.
>
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> ---
>  package/openssh/openssh.mk        | 2 ++
>  package/openssh/ssh_tmpfiles.conf | 1 +
>  2 files changed, 3 insertions(+)
>  create mode 100644 package/openssh/ssh_tmpfiles.conf
>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index fc82300ab7..bb43b2edec 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -73,6 +73,8 @@ define OPENSSH_INSTALL_INIT_SYSTEMD
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>         ln -fs ../../../../usr/lib/systemd/system/sshd.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
> +       $(INSTALL) -m 0644 -D package/openssh/ssh_tmpfiles.conf \
> +               $(TARGET_DIR)/usr/lib/tmpfiles.d/ssh.conf
>         $(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
>  endef
>
> diff --git a/package/openssh/ssh_tmpfiles.conf b/package/openssh/ssh_tmpfiles.conf
> new file mode 100644
> index 0000000000..9d1370a930
> --- /dev/null
> +++ b/package/openssh/ssh_tmpfiles.conf
> @@ -0,0 +1 @@
> +d /var/empty 0711 root root

Any specific reason to set permissions to 0711 instead of 0755 (like
many distros do)?

Regards,

-- 
Samuel
