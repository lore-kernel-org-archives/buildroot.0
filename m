From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 28 Apr 2020 16:28:25 +0200
Subject: [Buildroot] [PATCH] package/openssh: allow separate selection
 of client, server, keyutils
In-Reply-To: <20200406135622.7645-1-patrickdepinguin@gmail.com>
References: <20200406135622.7645-1-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LUBTd55GrgBwFCoHCv23faRxGd6Hqpu4bxrS6hxjxVqKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 6 abr. 2020 a las 15:56, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> The openssh package comprises three separate entities: the SSH client, SSH
> server, and some SSH key utilities. One may want the client but not the
> server, the server but not the client, or maybe only the key utilities.
>
> Add separate options for each entity and update the files installed on
> target accordingly.
>
> On an ARM Cortex-A53 configuration, size of stripped binaries are:
>
> Client programs: 2213118 bytes (2161 KB)
> usr/bin/ssh,657180
> usr/bin/scp,99836
> usr/bin/ssh-add,312800
> usr/bin/ssh-agent,296428
> usr/libexec/ssh-keysign,398908
> usr/libexec/ssh-pkcs11-helper,292316
> usr/bin/sftp,144992
> usr/bin/ssh-copy-id,10658
>
> Server programs: 806840 bytes (787 KB)
> usr/libexec/sftp-server,112140
> usr/sbin/sshd,694168
> etc/init.d/S50sshd,532
>
> Key utilities: 789648 bytes (771 KB)
> usr/bin/ssh-keygen,398924
> usr/bin/ssh-keyscan,390724
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/openssh/Config.in  | 23 +++++++++++++++++++++++
>  package/openssh/openssh.mk | 31 ++++++++++++++++++++++++++++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/package/openssh/Config.in b/package/openssh/Config.in
> index 683a9c0e51..cc5998742e 100644
> --- a/package/openssh/Config.in
> +++ b/package/openssh/Config.in
> @@ -9,3 +9,26 @@ config BR2_PACKAGE_OPENSSH
>           friends.
>
>           http://www.openssh.com/
> +
> +if BR2_PACKAGE_OPENSSH
> +
> +config BR2_PACKAGE_OPENSSH_CLIENT
> +       bool "client"
> +       default y
> +       help
> +         Client programs: ssh, scp, sftp, ssh-agent, ssh-add,
> +         ssh-copy-id.
> +
> +config BR2_PACKAGE_OPENSSH_SERVER
> +       bool "server"
> +       default y
> +       help
> +         Server programs: sshd, sftp-server
> +
> +config BR2_PACKAGE_OPENSSH_KEY_UTILS
> +       bool "key utilities"
> +       default y
> +       help
> +         Key utilities: ssh-keygen, ssh-keyscan.
> +
> +endif
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index d50572128a..b0259de7dd 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -82,10 +82,39 @@ define OPENSSH_INSTALL_INIT_SYSV
>                 $(TARGET_DIR)/etc/init.d/S50sshd
>  endef
>
> +ifeq ($(BR2_PACKAGE_OPENSSH_CLIENT),y)
>  define OPENSSH_INSTALL_SSH_COPY_ID
>         $(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin/ssh-copy-id
>  endef
> -
>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
> +else
> +define OPENSSH_REMOVE_CLIENT
> +       for i in ssh scp sftp ssh-agent ssh-add ; do \
> +               rm -f $(TARGET_DIR)/usr/bin/$$i ; \
> +       done
> +       for i in ssh-keysign ssh-pkcs11-helper ; do \
> +               rm -f $(TARGET_DIR)/usr/libexec/$$i ; \
> +       done
> +endef
> +OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_REMOVE_CLIENT
> +endif


I discovered a problem with this approach: if dropbear is selected,
and openssh without its 'client', then the dropbear tools ssh and scp
will also be removed (assuming dropbear was built before openssh).

I need to think about a good solution, basically not copying the files
to the target dir in the first place. But it means a custom install
rule.

> +
> +ifneq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
> +define OPENSSH_REMOVE_SERVER
> +       rm -f $(TARGET_DIR)/usr/sbin/sshd
> +       rm -f $(TARGET_DIR)/usr/libexec/sftp-server
> +       rm -f $(TARGET_DIR)/etc/init.d/S50sshd
> +endef
> +OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_REMOVE_SERVER
> +endif
> +
> +ifneq ($(BR2_PACKAGE_OPENSSH_KEY_UTILS),y)
> +define OPENSSH_REMOVE_KEY_UTILS
> +       for i in ssh-keygen ssh-keyscan ; do \
> +               rm -f $(TARGET_DIR)/usr/bin/$$i ; \
> +       done
> +endef
> +OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_REMOVE_KEY_UTILS
> +endif
>
>  $(eval $(autotools-package))
> --
> 2.24.1
>
