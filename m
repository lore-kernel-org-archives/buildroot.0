From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Mar 2015 20:14:28 +0200
Subject: [Buildroot] [PATCH 1/1 v2] allow xserver without the systemd
 login daemon.
In-Reply-To: <1427664298-11629-1-git-send-email-sagaert.johan@proximus.be>
References: <1427664298-11629-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <551AE404.7090208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sorry, I should have replied here of course...

On 29/03/15 23:24, Sagaert Johan wrote:
> 
> Thanks to Noel Vellemans for the hint.
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> ---
> Patch v1->v2 :
> 	added else clause as suggested by Thomas.
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index bb5381c..c290734 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -64,6 +64,16 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
>  	--with-fontrootdir=/usr/share/fonts/X11/ \
>  	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +XSERVER_XORG_CONF_OPTS += \
> +	--with-systemd-daemon \
> +	--enable-systemd-logind

XSERVER_XORG_DEPENDENCIES += systemd


 Regards,
 Arnout

> +else
> +XSERVER_XORG_CONF_OPTS += \
> +	--without-systemd-daemon \
> +	--disable-systemd-logind
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
>  XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
