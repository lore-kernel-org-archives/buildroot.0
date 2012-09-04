From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Sep 2012 20:13:36 +0200
Subject: [Buildroot] [PATCH 1/2] PAM support in Busybox if linux-pam is
	built
In-Reply-To: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
References: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
Message-ID: <201209042013.36710.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dmitry, All,

On Tuesday 04 September 2012 05:28:41 Dmitry wrote:
> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---
>  package/busybox/Config.in  |   11 +++++++++++
>  package/busybox/busybox.mk |   12 ++++++++++++
>  2 files changed, 23 insertions(+), 0 deletions(-)
> 
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index dedcf18..2a9cbf1 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -62,6 +62,17 @@ config BR2_PACKAGE_BUSYBOX_WATCHDOG
>  	  Install the watchdog daemon startup script,
>  	  that just start at the boot the busybox watchdog daemon.
>  
> +config BR2_PACKAGE_BUSYBOX_PAM
> +	bool "Enable PAM support in Busybox"
> +	default n
> +	depends on BR2_PACKAGE_LINUX_PAM
> +	help
> +	  If this item is selected, Busybox login will use the PAM stack
> +	  for local logins.

>         Local logins with null password are allowed
> +	  for users with records in /etc/passwd ("default" and "root").

> +	  The default PAM configuration file requires user accounts with
> +	  nonzero length passwords.

These two sentences tend to contradict each other. What about:

    The default PAM configuration in buildroot allows local users
    (those with records in /etc/passwd and /etc/shadow) with null
    passwords to log in.

Then the second sentence can go away, because the PAM config files patch
will come before that patch. ;-]

If you can come with another formulation that is not contradictory, that
is fine by me, too. ;-) 

>  if BR2_PACKAGE_BUSYBOX_WATCHDOG
>  
>  config BR2_PACKAGE_BUSYBOX_WATCHDOG_PERIOD
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 33f8633..21942c6 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -164,6 +164,17 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BUSYBOX_PAM),y)
> +BUSYBOX_DEPENDENCIES += linux-pam
> +define BUSYBOX_ENABLE_PAM

To be more in line with other options, I'd suggest this be BUSYBOX_SET_PAM
(we already have a bunch of BUSYBOX_SET_XXX, although there are variations).
But I have no strong objection to keeping ENABLE.

Otherwise, LGTM. When you resubmit (with at least the help clarification):
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
