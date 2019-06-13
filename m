From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Jun 2019 17:35:49 +0200
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
Message-ID: <20190613153549.GJ2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yi, All,

Thanks for this new iteration. :-)

I still have a few comments, see below.

On 2019-06-13 11:05 +0800, Yi Zheng spake thusly:
>     systemd-journal-remote was added in systemd v211, so add a new option
>     to enable or disable it.
> 
>     Signed-off-by: Yi Zheng <goodmenzy@gmail.com>

These lines should not be indented; I did indent them in my previous
reply just to make them stand out. "git send-email" would not have
indented those lines, if you had been able to use it (alas, you had
to use the gmail web UI to pass through the GFW).

We have other people from RPC, that seem to manage sending patches that
are correctly formatted. I wonder how they manage...

> ---
>  package/systemd/Config.in  | 15 +++++++++++++++
>  package/systemd/systemd.mk |  4 ++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 92ffc7cc5a..3ec529b214 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -122,6 +122,21 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> 
>           http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
> 
> +config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
> +       bool "enable systemd-journal-remote"
> +       default n
> +       depends on BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> +       select BR2_PACKAGE_LIBCURL
> +       help

Because you did not send this with git send-mail, the TAB indentation
has been replaced by spaces.

> +         systemd-journal-remote is a command to receive serialized
> +         journal events and store them to journal files. Input
> +         streams are in the Journal Export Format[1], i.e. like the
> +         output from journalctl --output=export. For transport over
> +         the network, this serialized stream is usually carried over
> +         an HTTPS connection.
> +
> +         https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
> +
>  config BR2_PACKAGE_SYSTEMD_BACKLIGHT
>         bool "enable backlight support"
>         help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index edc4a9ecc1..b7e36d9eb9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -178,6 +178,10 @@ else
>  SYSTEMD_CONF_OPTS += -Dmicrohttpd=false -Dqrencode=false
>  endif
> 
> +ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
> +SYSTEMD_CONF_OPTS += -Dremote=true
> +endif

You seemed to have missed in my previous review, that we also want an
explicit disable when the option is not set; see for example how it is
done for BR2_PACKAGE_SYSTEMD_HWDB.

Regards,
Yann E. MORIN.

> +
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  SYSTEMD_DEPENDENCIES += libselinux
>  SYSTEMD_CONF_OPTS += -Dselinux=true
> --
> 2.22.0

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
