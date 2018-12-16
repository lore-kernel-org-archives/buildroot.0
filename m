From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2018 15:09:32 +0100
Subject: [Buildroot] [PATCH v3] package/openssh: Add tmpfiles.d snippet
 to create /var/empty
In-Reply-To: <20180216181141.8893-1-chris.lesiak@licor.com>
References: <20180206162102.4322-1-chris.lesiak@licor.com>
 <20180216181141.8893-1-chris.lesiak@licor.com>
Message-ID: <20181216140932.GC2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2018-02-16 12:11 -0600, Chris Lesiak spake thusly:
> The openssh privilege separation feature, enabled by default,
> requires that the path /var/empty exist; see README.privsep
> included as part of the openssh distribution.
> 
> On a volatile or stateless system, that path might not exist.
> Use systemd-tmpfiles (if enabled) to ensure that the path exists
> and has the correct permissions.
> 
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

nd it does work currently, because openssh does create /var/empty at
build time, except it may have incorrect rights). Care to add a
follow-up patch that sets appropriate rights (with OPENSSH_PERMISSIONS),
please?

Note: currently, the rights *are* correct, because we enforce the umask,
or because openssh' install procedure creates it correctly. But there is
no guarantee that either will still be the case in the future (hint: the
umask we may drop shortly!).

Regards,
Yann E. MORIN.

> ---
> Changes v2 --> v3
>   - Provide a more detailed explanation as suggested by
>     Arnout Vandecappelle<arnout@mind.be>.
>   - Only bother if BR2_PACKAGE_SYSTEMD_TMPFILES=y
> Changes v1 --> v2
>   - Use 0755 as the permission of /var/empty as suggested by
>     Samual Martin <s.martin49@gmail.com> and the README.privsep
>     included with openssh-7.6p1.
> ---
>  package/openssh/openssh.mk        | 8 ++++++++
>  package/openssh/ssh_tmpfiles.conf | 1 +
>  2 files changed, 9 insertions(+)
>  create mode 100644 package/openssh/ssh_tmpfiles.conf
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 5d099ceb13..cdafdedae4 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -67,6 +67,13 @@ define OPENSSH_INSTALL_SYSTEMD_SYSUSERS
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
> +define OPENSSH_INSTALL_SYSTEMD_TMPFILES
> +	$(INSTALL) -m 0644 -D package/openssh/ssh_tmpfiles.conf \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/ssh.conf
> +endef
> +endif
> +
>  define OPENSSH_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/openssh/sshd.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
> @@ -74,6 +81,7 @@ define OPENSSH_INSTALL_INIT_SYSTEMD
>  	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
>  	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
> +	$(OPENSSH_INSTALL_SYSTEMD_TMPFILES)
>  endef
>  
>  define OPENSSH_INSTALL_INIT_SYSV
> diff --git a/package/openssh/ssh_tmpfiles.conf b/package/openssh/ssh_tmpfiles.conf
> new file mode 100644
> index 0000000000..ca2a393542
> --- /dev/null
> +++ b/package/openssh/ssh_tmpfiles.conf
> @@ -0,0 +1 @@
> +d /var/empty 0755 root root
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
