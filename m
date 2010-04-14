From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 12:50:28 +0100
Subject: [Buildroot] [PATCH 15/16] xserver_xorg-server: bump version,
 improve option support
In-Reply-To: <87vdc1lnbs.fsf@macbook.be.48ers.dk>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>	<1270126006-22405-15-git-send-email-will_wagner@carallon.com>
	<87vdc1lnbs.fsf@macbook.be.48ers.dk>
Message-ID: <4BC5AC04.90408@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/2010 21:08, Peter Korsgaard wrote:
>>>>>> "Will" == Will Wagner<will_wagner@carallon.com>  writes:
>>>>>>              
> Hi,
>
>   Will>  Later version of xserver no longer need configure hack to say where
>   Will>  mesa3d is located.
>
> Thanks, but ..
>
>   Will>  --- a/package/x11r7/xserver_xorg-server/Config.in
>   Will>  +++ b/package/x11r7/xserver_xorg-server/Config.in
>   Will>  @@ -1,23 +1,26 @@
>   Will>   config BR2_PACKAGE_XSERVER_XORG_SERVER
>   Will>   	bool "xorg-server"
>   Will>  -	select BR2_PACKAGE_XLIB_LIBXFONT
>   Will>   	select BR2_PACKAGE_LIBDRM
>   Will>  +	select BR2_PACKAGE_MCOOKIE
>   Will>  +	select BR2_PACKAGE_MESA3D if BR2_PACKAGE_XSERVER_xorg
>   Will>   	select BR2_PACKAGE_OPENSSL
>   Will>  -	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
>   Will>  -	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
>   Will>  -	select BR2_PACKAGE_XPROTO_FIXESPROTO
>   Will>  -	select BR2_PACKAGE_XPROTO_GLPROTO
>   Will>  -	select BR2_PACKAGE_XPROTO_KBPROTO
>   Will>  -	select BR2_PACKAGE_XPROTO_RANDRPROTO
>
>   Will>  @@ -38,6 +38,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
>   Will>   	xproto_bigreqsproto 		\
>   Will>   	xproto_compositeproto 		\
>   Will>   	xproto_damageproto 		\
>   Will>  +	xproto_dri2proto 		\
>   Will>   	xproto_evieext 			\
>   Will>   	xproto_fixesproto 		\
>   Will>   	xproto_fontsproto 		\
>
> Why are you removing these selects if they are still Makefile
> dependencies?
>    

As I said previously, no dependencies are removed, there are just so 
many I have reordered them alphabetically. Also worth noting that this 
patch has the dependacy fix for libpciaccess that Paulis posted.

>   Will>  -config BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
>   Will>  -    bool "Use Builtin Fonts"
>   Will>  -    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
>   Will>  -    help
>   Will>  -        Enable/Use Builtin fonts.
>
> Is this gone? Should we select a font or 2 then so the user doesn't end
> up with a broken system?
>    

This option has gone from xserver.

The package font-misc-misc gets selected, so you will always have a font.

>
>   Will>   ifeq ($(BR2_PACKAGE_FREETYPE),y)
>   Will>   XSERVER_XORG_SERVER_DEPENDENCIES += freetype
>   Will>  -XSERVER_XORG_SERVER_CONF_OPT += --enable-freetype
>
> Is this option gone? Does it still work to build without freetype?
>
>    
This option has gone from xserver.

If you selected xserver then freetype is selected for you by a number of 
packages (xlib_libXfont, xlib_libXft, fontconfig... ) so you can not 
select this without freetype.

Does that answer your queries? Can this get applied?
