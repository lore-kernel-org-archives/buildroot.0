From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2018 00:07:09 +0100
Subject: [Buildroot] [PATCH] package/openssh: Set /var/empty permissions
In-Reply-To: <20181217222522.13499-1-chris.lesiak@licor.com>
References: <20181217222522.13499-1-chris.lesiak@licor.com>
Message-ID: <5a82d54f-a308-bd2f-f3f9-49b583196333@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/12/2018 23:25, Chris Lesiak wrote:
> The openssh privilege separation feature, enabled by default,
> requires that the path /var/empty exist and have certain permission.
> See README.privsep included as part of the openssh distribution.

 It's not clear to me from reading this file if /var/empty should actually be
writable or not. If it does have to be writable, then this won't work in the
readonly rootfs case.

 Also, README.privsep says that the sshd user should have /var/empty as its home
directory, so perhaps we should set that as well?

 Regards,
 Arnout

> 
> Use OPENSSH_PERMISSIONS to ensure this is done correctly.
> 
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> ---
>  package/openssh/openssh.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 07f3e0d663..9175f9589d 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -22,6 +22,10 @@ define OPENSSH_USERS
>  	sshd -1 sshd -1 * - - - SSH drop priv user
>  endef
>  
> +define OPENSSH_PERMISSIONS
> +	/var/empty d 755 root root - - - - -
> +endef
> +
>  ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
>  OPENSSH_CONF_OPTS += --without-pie
>  endif
> 
