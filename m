From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 May 2015 00:20:16 +0200
Subject: [Buildroot] [PATCHv6] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <1430602215-20128-1-git-send-email-yann.morin.1998@free.fr>
References: <1430602215-20128-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55454DA0.80906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 23:30, Yann E. MORIN wrote:
> From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
> 
> Currently, there is only two possibilities regarding the root account:
                   are

>   - it is enabled with no password (the default)
>   - it is enabled, using a clear-text, user-provided password
> 
> This is deemed insufficient in many cases, especially when the .config
> file has to be published (e.g. for the GPL compliance, or any other
> reason.).
> 
> Fix that in two ways:
> 
>   - add a bolean option that allows/disallows root login altogether,
            boolean

>     which defaults to 'y' to keep backward compatibility;
> 
>   - accept already-encoded passwords, which we recognise as starting
>     with either of $1$, $5$ or $6$ (resp. for md5, sha256 or sha512).
> 
> Signed-off-by: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
> [yann.morin.1998 at free.fr:
>   - don't add a choice to select between clear-text/encoded password,
>     use a single prompt;
>   - differentiate in the password hook itself;
>   - rewrite parts of the help entry;
>   - rewrite and expand the commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Tested-by: "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 A few more optional suggestions below.

> 
> ---
> Notes:
> Lorenzo, I did not add your Acked-by tag, since there was some changes
> prompted by Arnout; I however kept your Tested-by since the logic is
> still the same. Feel free to review this iteration again. Thanks! :-)
> 
> ---
> Chanages v5 -> v6:
>   - use simpler $(filter)  (Arnout)
>   - fix default value  (Arnout)
>   - expand help about doubling $s  (Arnout)
> 
> Changes v4 -> v5:
>   - use makefile syntax instead of shell  (Thomas)
>   - typoes  (Thomas)
>   - fix up the commit log (it never was possible to disable root login)
> ---
>  system/Config.in | 30 +++++++++++++++++++++---------
>  system/system.mk | 22 ++++++++++++++++------
>  2 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 84cde94..dc46401 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -176,26 +176,38 @@ endif
>  
>  if BR2_ROOTFS_SKELETON_DEFAULT
>  
> +config BR2_TARGET_ENABLE_ROOT_LOGIN
> +	bool "Enable root login"
> +	default y
> +	help
> +	  Enable root login password

 Perhaps more explicitly: "If not enabled, root login is still possible with
e.g. an authorized ssh key".

> +
>  config BR2_TARGET_GENERIC_ROOT_PASSWD
>  	string "Root password"
>  	default ""
> +	depends on BR2_TARGET_ENABLE_ROOT_LOGIN
>  	help
> -	  Set the initial root password (in clear). It will be md5-encrypted.
> +	  Set the initial root password.
>  
>  	  If set to empty (the default), then no root password will be set,
>  	  and root will need no password to log in.
>  
> -	  WARNING! WARNING!
> -	  Although pretty strong, MD5 is now an old hash function, and
> -	  suffers from some weaknesses, which makes it susceptible to attacks.
> -	  It is showing its age, so this root password should not be trusted
> -	  to properly secure any product that can be shipped to the wide,
> -	  hostile world.
> +	  If the password starts with any of $1$, $5$ or $6$, it is considered
> +	  to be already crypt-encoded with respectively md5, sha256 or sha512.
> +	  Any other value is taken to be a clear-text value, and is crypt-encoded
> +	  as per the "Passwords encoding" scheme, above.
> +
> +	  Note: "$" signs in the hashed password must be doubled. For example,
> +	  if the hashed password is "$1$longsalt$v35DIIeMo4yUfI23yditq0",
> +	  then you must enter it as "$$1$$longsalt$$v35DIIeMo4yUfI23yditq0"
> +	  (this is necessary otherwise make would attempt to interpret the $
> +	  as a variable expansion).
>  
>  	  WARNING! WARNING!
> -	  The password appears in clear in the .config file, and may appear
> +	  The password appears as-is in the .config file, and may appear
>  	  in the build log! Avoid using a valuable password if either the
> -	  .config file or the build log may be distributed!
> +	  .config file or the build log may be distributed, or at the
> +	  very least use a strong cryptographic hash for your password!
>  
>  choice
>  	bool "/bin/sh"
> diff --git a/system/system.mk b/system/system.mk
> index c95e436..53a990b 100644
> --- a/system/system.mk
> +++ b/system/system.mk
> @@ -34,7 +34,7 @@ endef
>  TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
>  endif
>  
> -ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
> +ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
>  PACKAGES += host-mkpasswd
>  endif
>  
> @@ -69,12 +69,22 @@ TARGET_FINALIZE_HOOKS += SET_NETWORK
>  
>  ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
>  
> -define SYSTEM_ROOT_PASSWD
> -	[ -n "$(TARGET_GENERIC_ROOT_PASSWD)" ] && \
> -		TARGET_GENERIC_ROOT_PASSWD_HASH=$$($(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)"); \
> -	$(SED) "s,^root:[^:]*:,root:$$TARGET_GENERIC_ROOT_PASSWD_HASH:," $(TARGET_DIR)/etc/shadow
> +ifeq ($(BR2_TARGET_ENABLE_ROOT_LOGIN),y)
> +ifeq ($(TARGET_GENERIC_ROOT_PASSWD),)
> +SYSTEM_ROOT_PASSWORD =
> +else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(TARGET_GENERIC_ROOT_PASSWD)),)
> +SYSTEM_ROOT_PASSWORD = $(TARGET_GENERIC_ROOT_PASSWD)
> +else

 Perhaps the PACKAGES += host-mkpasswd should move here?

 Perhaps add a comment:

# This variable will only be evaluated in the finalize stage, so we can be sure
# that host-mkpasswd has already been built.


 Regards,
 Arnout

> +SYSTEM_ROOT_PASSWORD = $(shell $(MKPASSWD) -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
> +endif
> +else # !BR2_TARGET_ENABLE_ROOT_LOGIN
> +SYSTEM_ROOT_PASSWORD = *
> +endif
> +
> +define SYSTEM_SET_ROOT_PASSWD
> +	$(SED) 's,^root:[^:]*:,root:$(SYSTEM_ROOT_PASSWORD):,' $(TARGET_DIR)/etc/shadow
>  endef
> -TARGET_FINALIZE_HOOKS += SYSTEM_ROOT_PASSWD
> +TARGET_FINALIZE_HOOKS += SYSTEM_SET_ROOT_PASSWD
>  
>  ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
>  define SYSTEM_BIN_SH
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
