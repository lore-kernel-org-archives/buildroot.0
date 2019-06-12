From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 18:23:04 +0200
Subject: [Buildroot] [buildroot] patch for systemd,
 add systemd-journal-remote
In-Reply-To: <CAJPHfYMpP_hw_JhrGd3a8CHH4p6gBoP7TQsZSb+kjB5F=VM5Uw@mail.gmail.com>
References: <CAJPHfYMpP_hw_JhrGd3a8CHH4p6gBoP7TQsZSb+kjB5F=VM5Uw@mail.gmail.com>
Message-ID: <20190612162304.GD2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yi, All,

On 2019-06-12 08:04 +0800, Yi Zheng spake thusly:
> Here is my patch on systemd, which provides an option to select
> whether to build  'systemd-journal-remote' command.
> 
> Could you please have an review, and submit the patch to the offical repo?

Sending to the mailing list like you did _is_ the correct way to send
submission to add new feature to Buildroot.

Yet, here are a few comments:

Use "git send-email" to send the patch: this will send an email
properly formatted with the patch

The commit log for the patch should lokok like:

    topic: small one-line description

    A few mult-line description that explains what the patch
    does in a bit more details than the title does

    Signed-off-by: Your Real NAME <your-emal@adress>

Which in this case could translate to something like:

    package/systemd: add option to enable systemd-journal-remote

    systemd-journal-remote was added in systemd v211, so add a new option
    to enable or disable it.

    Signed-off-by: Yi Zheng <goodmenzy@gmail.com>

Be sure to run "make check-package" to catch any coding-style issues
(there are some).

See also a few comments below...

>  I have checked that it works.
> 
> Thanks.

> From cf907fd68480cf8573e552bb433246478edfd512 Mon Sep 17 00:00:00 2001
> From: Brock Zheng Techyauld Ltd <yzheng@techyauld.com>
> Date: Tue, 11 Jun 2019 21:33:40 +0800
> Subject: [PATCH 17/17] systemd: add systemd-journal-remote supporting
> 
> ---
>  package/systemd/Config.in  | 13 +++++++++++++
>  package/systemd/systemd.mk |  4 ++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 92ffc7cc5a..ca27ac3eed 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -112,6 +112,19 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>  	default "x64"   if BR2_x86_64
>  	depends on BR2_PACKAGE_SYSTEMD_BOOT
>  
> +config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
> +        bool "receive serialized journal events and store them to journal files"

Shorten the prompt to just "enable systemd-journal-remote".

> +	depends on BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY

Since it depends on BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY, it should be
located after it, below.

> +	select BR2_PACKAGE_LIBCURL
> +	help
> +          systemd-journal-remote is a command to receive serialized journal
> +          events and store them to journal files. Input streams are in the
> +          Journal Export Format[1], i.e. like the output from journalctl
> +          --output=export. For transport over the network, this serialized
> +          stream is usually carried over an HTTPS connection.
> +
> +	  https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
> +
>  config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
>  	bool "HTTP server for journal events"
>  	select BR2_PACKAGE_LIBMICROHTTPD
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 0797d27f4e..d68a8ba956 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -179,6 +179,10 @@ else
>  SYSTEMD_CONF_OPTS += -Dmicrohttpd=false -Dqrencode=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
> +SYSTEMD_CONF_OPTS += -Dremote=true
> +endif

Please also explicitly disable it when the option is not set, like all
the other options are handled (see BR2_PACKAGE_SYSTEMD_HWDB for an
example).

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  SYSTEMD_DEPENDENCIES += libselinux
>  SYSTEMD_CONF_OPTS += -Dselinux=true
> -- 
> 2.22.0
> 

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
