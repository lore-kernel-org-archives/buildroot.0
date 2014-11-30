From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 19:04:39 +0100
Subject: [Buildroot] [PATCHv3 66/74] nss-mdns: install configuration
 file unconditionally
In-Reply-To: <1417357142-14307-67-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-67-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130180439.GV4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/nss-mdns/nss-mdns.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
> index 9ec9c1a..9a6c5a1 100644
> --- a/package/nss-mdns/nss-mdns.mk
> +++ b/package/nss-mdns/nss-mdns.mk
> @@ -10,9 +10,7 @@ NSS_MDNS_LICENSE = LGPLv2.1+
>  NSS_MDNS_LICENSE_FILES = LICENSE
>  
>  define NSS_MDNS_INSTALL_CONFIG
> -	if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
> -		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
> -	fi
> +	$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf

In fact, this case is a bit different: nsswitch.conf is not coming from
the skeleton, but from the glibc package.

But then, when using an external toolchain, we only install
nsswitch.conf as a target-finalise hook, which is too late for nss-mdns
to sed it.

That was worked-around by Peter about a month ago, by addind that very
conditional code:
    c7c0ca2: nss-mdns: unbreak after e1eba3d97 (system/skeleton: make
             nsswitch install conditional)

The correct fix would be to make the following sed expression a
TARGET_FINALIZE hook, as Peter said in the commit log above.

However, that would leave us in an uncomofrtable position, in that we
would have to ensure that the hook provided my nss-mdns gets called
agfter the hook that install nsswitch.conf, or we'd be back to square
one...

Sp: NAK.

Regards,
Yann E. MORIN.

>  	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
>  		$(TARGET_DIR)/etc/nsswitch.conf
>  endef
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
