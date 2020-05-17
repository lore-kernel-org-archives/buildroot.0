From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 23:12:42 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/x11r7/xserver_xorg-server:
 disable GLAMOR support with NVIDIA drivers
In-Reply-To: <20200517204003.2187318-4-jskrzypnik@novomatic-tech.com>
References: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
 <20200517204003.2187318-1-jskrzypnik@novomatic-tech.com>
 <20200517204003.2187318-4-jskrzypnik@novomatic-tech.com>
Message-ID: <20200517211242.GY12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jakub, Bernd, All,

On 2020-05-17 22:40 +0200, Jakub Skrzypnik spake thusly:
> Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>

Jakub: this patch needs a commit message that explains why we need to
disable glamor.

Bernd: you've hacked the Xorg stack quite extensively; do you have an
opinion on this?

Note that his change is totally decorelated from the libglvnd efforts in
this series (I guess Jakub has the issue while working on the nvidia
driver, the reason why this patch is here...)

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 8ccc04224d..44f93a99ed 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -191,7 +191,11 @@ XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
>  ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
>  XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
> +ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
> +XSERVER_XORG_SERVER_CONF_OPTS += --disable-glamor
> +else
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
> +endif
>  else
>  XSERVER_XORG_SERVER_CONF_OPTS += --disable-glamor
>  endif
> -- 
> 2.26.2
> 
> 
> -- 
> CONFIDENTIALITY NOTICE
> ------------------------------------
> This
>  E-mail is 
> intended only to be read or used by the addressee.The 
> information 
> contained in this E-mail message may be confidential 
> information. If you 
> are not the intended recipient, any use, 
> interference with, distribution, 
> disclosure or copying of this material 
> is unauthorized and prohibited. 
> Confidentiality attached to this 
> communication is not waived or lost by 
> reason of the mistaken delivery 
> to you.
> If you have received this message 
> in error, please delete
>  it and notify us by return E-mail or telephone 
> NOVOMATIC Technologies 
> Poland S.A. +48 12 258 00 50. Any E-mail attachment 
> may contain software
>  viruses which could damage your own computer system. 
> Whilst reasonable 
> precaution has been taken to minimize this risk, we 
> cannot accept 
> liability for any damage which you sustain as a result of 
> software 
> viruses. You should therefore carry out your own virus checks 
> before 
> opening any attachments.
> ------------------------------------
> 
> NOVOMATIC Technologies Poland S.A., Poland, Krakowska 368, 32-080 Zabierz?w

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
