From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 22:39:44 +0200
Subject: [Buildroot] [PATCH 2/2 v4] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <a13aae8e9670b5cb069379dee94735deb3663f21.1427223149.git.yann.morin.1998@free.fr>
References: <cover.1427223149.git.yann.morin.1998@free.fr>
 <a13aae8e9670b5cb069379dee94735deb3663f21.1427223149.git.yann.morin.1998@free.fr>
Message-ID: <20150410223944.4dfc96b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 24 Mar 2015 19:54:16 +0100, Yann E. MORIN wrote:

> Currently, there is only three possibilities regarding the root account:
>   - it is enabled with no password (the default)
>   - it is enabled, using a clear-text, user-provided password
>   - it is disabled if the user sets the clear-text password to '*'
> 
> This is deemed insufficient in many cases, especially when the .config
> file has to be published (e.g. for the GPL compliance, or any other
> reason.).
> 
> Fix that in two ways:
> 
>   - add a bolean option that allows/diesaloows root login altogether,

disallows.

>     which defaults to 'y' to keep backward compatibility;
> 
>   - accept already-encoded passwords, which we recognise as starting
>     with either of $1$, $5$ or $6$ (resp. for md5, sha256 or sha512).
>     For backward-compatibility, we stil accept '*' to disable the

still.


> @@ -70,9 +70,25 @@ TARGET_FINALIZE_HOOKS += SET_NETWORK
>  ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
>  
>  define SYSTEM_ROOT_PASSWD
> -	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
> -		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
> -	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
> +	if [ "$(BR2_TARGET_ENABLE_ROOT_LOGIN)" = "y" ]; then \
> +		case '$(TARGET_GENERIC_ROOT_PASSWD)' in \
> +		("") \
> +			ROOT_PASSWD=""; \
> +		;; \
> +		("$$1$$"*|"$$5$$"*|"$$6$$"*) \
> +			ROOT_PASSWD='$(TARGET_GENERIC_ROOT_PASSWD)'; \
> +		;; \
> +		('*') \
> +			ROOT_PASSWD='*'; \
> +		;; \
> +		(*) \
> +			ROOT_PASSWD=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
> +		;; \
> +		esac; \
> +	else \
> +		ROOT_PASSWD='*'; \
> +	fi; \
> +	$(SED) "s,^root:[^:]*:,root:$${ROOT_PASSWD}:," $(TARGET_DIR)/etc/shadow

Argh. Can we use make instead of turning Buildroot into a build system
written in shell ?

ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),)
SYSTEM_ROOT_PASSWORD = *
else
 ifeq ($(TARGET_GENERIC_ROOT_PASSWORD),)
  SYSTEM_ROOT_PASSWORD =
 # I believe we could simplify this, and assume that if the password
 # starts with $$, we have an already encoded password.
 else ifeq ($(or $(filter $$1$$%,$(TARGET_GENERIC_ROOT_PASSWORD)),$(filter $$5$$%,$(TARGET_GENERIC_ROOT_PASSWORD)),$(filter $$6$$%,$(TARGET_GENERIC_ROOT_PASSWORD)))
  SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWORD))
 else ifeq ($(TARGET_GENERIC_ROOT_PASSWORD),*)
  SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWORD))
 else
  SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
 endif
endif

(Completely untested, of course).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
