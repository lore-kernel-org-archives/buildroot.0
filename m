From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Jul 2017 21:41:47 +0200
Subject: [Buildroot] [git commit] linuxptp: refactor with
 LINUXPTP_MAKE_{ENV, OPTS} variables
In-Reply-To: <20170706190530.3A84C80AD4@busybox.osuosl.org>
References: <20170706190530.3A84C80AD4@busybox.osuosl.org>
Message-ID: <20170706194147.GA3490@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-06 21:08 +0200, Thomas Petazzoni spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=3692b63fb1b94fe93b40336f97657d77bf0011bd
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Since there is quite some duplication in the variables to be passed in
> the make environment and as make options between the build and install
> steps, this commit introduces LINUXPTP_MAKE_ENV and LINUXPTP_MAKE_OPTS
> to avoid the duplication.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/linuxptp/linuxptp.mk | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
> index d8bcc2b..6516659 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -10,27 +10,23 @@ LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
>  LINUXPTP_LICENSE = GPL-2.0+
>  LINUXPTP_LICENSE_FILES = COPYING
>  
> -define LINUXPTP_BUILD_CMDS
> +LINUXPTP_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	KBUILD_OUTPUT=$(STAGING_DIR) \

Trailing backslash.

> -	$(MAKE) \
> -		prefix=/usr \
> -		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> -		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
> -		-C $(@D) all
> +
> +LINUXPTP_MAKE_OPTS = \
> +	prefix=/usr \
> +	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> +	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \

Ditto...

Regards,
Yann E. MORIN.

> +define LINUXPTP_BUILD_CMDS
> +	$(LINUXPTP_MAKE_ENV) $(MAKE) $(LINUXPTP_MAKE_OPTS) -C $(@D) all
>  endef
>  
>  define LINUXPTP_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) \
> -	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	KBUILD_OUTPUT=$(STAGING_DIR) \
> -	$(MAKE) \
> -		prefix=/usr \
> -		DESTDIR=$(TARGET_DIR) \
> -		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> -		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
> -		-C $(@D) install
> +	$(LINUXPTP_MAKE_ENV) $(MAKE) $(LINUXPTP_MAKE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) -C $(@D) install
>  
>  	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.cfg \
>  		$(TARGET_DIR)/etc/linuxptp.cfg
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
