From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 19:19:51 +0100
Subject: [Buildroot] [PATCHv3 74/74] toolchain: install nssswitch.conf
 configuration file unconditionally
In-Reply-To: <1417357142-14307-75-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-75-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130181951.GD4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:19 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> index 3f9900b..0fb115b 100644
> --- a/toolchain/toolchain.mk
> +++ b/toolchain/toolchain.mk
> @@ -3,12 +3,10 @@
>  # TARGET_FINALIZE_HOOKS, to be applied just after all packages
>  # have been built.
>  
> -# Install default nsswitch.conf file if the skeleton doesn't provide it
> +# Install default nsswitch.conf file
>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  define GLIBC_COPY_NSSWITCH_FILE
> -	$(Q)if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
> -		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
> -	fi
> +	$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf

As much as I am tempted to Ack this patch, I think we should revisit the
way we handle nsswitch.conf, especially in the light of my comments on
your previous patch about nss-mdns.

So, Can we get those two patches out of the series for now?

Regards,
Yann E. MORIN.

>  endef
>  TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
>  endif
> -- 
> 2.1.0
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
