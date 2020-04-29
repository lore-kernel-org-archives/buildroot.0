From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:19:08 +0200
Subject: [Buildroot] [PATCH] package/openssh: Add option to populate
 keys on build
In-Reply-To: <20200429124138.180628-1-rfried.dev@gmail.com>
References: <20200429124138.180628-1-rfried.dev@gmail.com>
Message-ID: <20200429221908.08cb5112@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Apr 2020 15:41:38 +0300
Ramon Fried <rfried.dev@gmail.com> wrote:

> During development phase and on targets with read-only
> file systems, generating SSH keys on boot is not an option.
> 
> Add option to generate and populate SSH keys during build.
> 
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>

I don't really have a very well formed opinion on whether we want this
or not. Feedback from other developers/contributors might be useful.

> +if BR2_PACKAGE_OPENSSH
> +
> +config BR2_PACKAGE_OPENSSH_POPULATE_KEYS
> +	bool "Populate device keys"

	bool "Generate host keys during build"

Perhaps.

> +	help
> +	  Populate the image with device keys instead
> +		of generating them on each boot.
> +		This option has security implications, and
> +		should be only used in development or on target
> +		with read-only root file-system.

Please fix the indentation: it should be one tab + two spaces, and the
line should try to use the 72-characters width as much as possible. Run
"make check-package" to check for such coding style issues.

> +endif
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index d50572128a..908eccf6cd 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -86,6 +86,17 @@ define OPENSSH_INSTALL_SSH_COPY_ID
>  	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin/ssh-copy-id
>  endef
>  
> +define OPENSSH_POPULATE_KEYS

Should be defined within the ifeq
($(BR2_PACKAGE_OPENSSH_POPULATE_KEYS),y) condition.

> +	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_rsa_key -N '' -t rsa
> +	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
> +	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_dsa_key -N '' -t dsa
> +	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

Use $(...) to reference make variable instead of ${...}. Also, perhaps
a small loop makes sense:

	$(foreach type,rsa ecdsa dsa ed25519,\
		ssh-keygen -q -f $(TARGET_DIR)/etc/ssh/ssh_host_$(type)_key -N '' -t $(type)
	)

But wait: where is ssh-keygen coming from? We're not building it, so
you're relying on the one available on your build machine. This is not
acceptable for Buildroot, as we don't expect ssh-keygen to be available
on the host machine. So if we want to do what you propose, we would
need to build ssh-keygen for the host machine, using a host-openssh
package.

> +endef
> +
> +ifeq ($(BR2_PACKAGE_OPENSSH_POPULATE_KEYS),y)
> +OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_POPULATE_KEYS
> +endif
> +
>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID

Please keep this hook registration next to its definition.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
