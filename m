From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Nov 2018 19:38:26 +0100
Subject: [Buildroot] [PATCH v1] alsa-utils: add optional systemd
 dependency
In-Reply-To: <20181121220102.10580-1-ps.report@gmx.net>
References: <20181121220102.10580-1-ps.report@gmx.net>
Message-ID: <20181122183826.GO2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-11-21 23:01 +0100, Peter Seiderer spake thusly:
> Fixes (reported by Yann E. MORIN, [1]):
> 
> /usr/bin/install -D -m 0644 .../build/alsa-utils-1.1.6/alsactl/alsa-restore.service .../target/usr/lib/systemd/system/alsa-restore.service
> /usr/bin/install: cannot stat '.../build/alsa-utils-1.1.6/alsactl/alsa-restore.service': No such file or directory
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2018-November/236355.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks for the quick fix! :-)

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Still one comment, see below...

> ---
>  package/alsa-utils/alsa-utils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 0c65082a14..986a745399 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -82,7 +82,8 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
>  	fi
>  endef
>  
> -ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
> +ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL)$(BR2_INIT_SYSTEMD),yy)

I was going to argue that I'd prefer the dependency to be on
BR2_PACKAGE_SYSTEMD instead, as I seemed to recall that's what we do
elsewhere.

So I grepped the code, and we have 22 instances where the dependencies
is on the package, and 20 where it is on the init system.

And in the end, it does make sense that this is done on the init sytem,
not the package, so I'm OK with the patch as is, and I would even argue
that the others should be changed (when they install unit files).

So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(Yeah, I'm putting two tags at different places in the reply, just to
see how patchwork handles that. Niark! ;-) )

Regards,
Yann E. MORIN.

> +ALSA_UTILS_DEPENDENCIES += systemd
>  define ALSA_UTILS_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
> -- 
> 2.19.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
