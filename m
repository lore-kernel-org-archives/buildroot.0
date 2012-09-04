From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Sep 2012 19:02:30 +0200
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
	when building linux-pam package
In-Reply-To: <1346729322-17868-2-git-send-email-golubovsky@gmail.com>
References: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
 <1346729322-17868-2-git-send-email-golubovsky@gmail.com>
Message-ID: <201209041902.30271.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dmitry, All,

On Tuesday 04 September 2012 05:28:42 Dmitry wrote:
> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---
>  package/linux-pam/default      |    8 ++++++++
>  package/linux-pam/linux-pam.mk |    7 +++++++
>  package/linux-pam/login        |    9 +++++++++

I think that this patch, which adds the default files, should come
_before_ the busybox patch. If only the busybox patch were to be
applied, then PAM would not be useable as it would lack those files.

In the current order, iIt would also break 'bisectability'.

>  3 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 package/linux-pam/default
>  create mode 100644 package/linux-pam/login
> 
> diff --git a/package/linux-pam/default b/package/linux-pam/default
> new file mode 100644
> index 0000000..0bd5ba0
> --- /dev/null
> +++ b/package/linux-pam/default
> @@ -0,0 +1,8 @@
> +#
> +# default; standard UN*X access
> +#
> +auth     required       pam_unix.so
> +account  required       pam_unix.so
> +password required       pam_unix.so
> +session  required       pam_unix.so
> +

I am not a PAM expert, so I can't say whether these settings are correct,
enough, or whatever. I'd trust close to anybody on this subject. ;-)

> diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
> index 48cb073..2807bc1 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -24,4 +24,11 @@ ifeq ($(BR2_PACKAGE_LIBINTL),y)
>  	LINUX_PAM_MAKE_OPT += LIBS=-lintl
>  endif
>  
> +define LINUX_PAM_CONFFILES
> +	$(INSTALL) -D -m 0644 package/linux-pam/default $(TARGET_DIR)/etc/pam.d/default
> +	$(INSTALL) -D -m 0644 package/linux-pam/login $(TARGET_DIR)/etc/pam.d/login

I'd use:
    $(INSTALL) -D -m 0644 $(@D)/default $(TARGET_DIR)/etc/pam.d/default

Also, shouldn't these files get special permission (ie. redable only by
root, or stuff like that)? If so, then use:
  LINUX_PAM_PERMISSIONS = .....

> +endef
> +
> +LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFFILES
> +
>  $(eval $(autotools-package))
> diff --git a/package/linux-pam/login b/package/linux-pam/login
> new file mode 100644
> index 0000000..d65a9d4
> --- /dev/null
> +++ b/package/linux-pam/login
> @@ -0,0 +1,9 @@
> +#
> +# login: allow local logins to users with entries in /etc/passwd and
> +# /etc/shadow even with null password
> +#
> +auth      required       pam_unix.so nullok
> +account   required       pam_unix.so nullok
> +password  required       pam_unix.so nullok
> +session   required       pam_unix.so nullok

Ditto, I'm not a PAM expert...

Although I doubt I'd like a system where null passwords are OK... :-/
At the risk of adding to the option maze, I'd suggest at least adding
a config knob to enable that. For example:

  config BR2_PACKAGE_LINUX_PAM_NULL_PASSWD_OK
      bool "Allow null passwords"
      help
        Allow local logins to users with entries in /etc/passwd
        and /etc/shadow even with null password.

And only add the "nullok" if that option is set.

If that's not OK to add such an option, then I'd say we should remove the
"nullok" stuff, and leave it to a local post-build script that tweaks this
file if the user really wants to allow local null-password logins.

IMNSHO, the defaut should be a secure system.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
