From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Feb 2021 22:15:35 +0100
Subject: [Buildroot] [PATCH] package/avrdude: Switch to upstream
In-Reply-To: <20210222022606.491102-1-alexander.sverdlin@gmail.com>
References: <20210222022606.491102-1-alexander.sverdlin@gmail.com>
Message-ID: <20210222211535.GF2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2021-02-22 03:26 +0100, Alexander Sverdlin spake thusly:
> In the meanwhile "linuxspi" programmer was merged upstream, therefore it's
> possible to switch to latest upstream tree instead of the old fork without
> losing any functionality.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  package/avrdude/avrdude.hash | 2 +-
>  package/avrdude/avrdude.mk   | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
> index 888668ae44..9c56dacd60 100644
> --- a/package/avrdude/avrdude.hash
> +++ b/package/avrdude/avrdude.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  cfa97af7badc713c62306ab85d0e7a288b064bf72e698494f73cb16c5b2c659e  avrdude-f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa.tar.gz
> +sha256  39d77cec4064b03bfc0ff942d36c41df7eea9b56b89a3f991078b68caddd3c77  avrdude-r1450.tar.gz

Since 2021-01-10, we changed the format of tarballs generated from
subversion, and the tarballs now include a '-br1' suffix after the
version, e.g.: avrdude-r1450-br1.tar.gz

Also, see below...

>  sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index ae378dfbac..b6754684e1 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -4,15 +4,16 @@
>  #
>  ################################################################################
>  
> -AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
> -AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
> +AVRDUDE_VERSION = r1450
> +AVRDUDE_SITE_METHOD = svn
> +AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk

I am wondering what version of Buildroot you've been testing this with,
because downloading via svn is currently broken in master.

No need to reend for now, until we fix the svn download (imminent,
anytime soon, almost done, etc...)

Regards,
Yann E. MORIN.

>  AVRDUDE_LICENSE = GPL-2.0+
>  AVRDUDE_LICENSE_FILES = avrdude/COPYING
>  AVRDUDE_SUBDIR = avrdude
> -# Sources coming from git, without generated configure and Makefile.in
> +# Sources coming from svn, without generated configure and Makefile.in
>  # files.
>  AVRDUDE_AUTORECONF = YES
> -AVRDUDE_CONF_OPTS = --enable-linuxgpio
> +AVRDUDE_CONF_OPTS = --enable-linuxgpio --enable-linuxspi
>  AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>  	host-flex host-bison
>  
> -- 
> 2.29.2
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
