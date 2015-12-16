From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Dec 2015 22:36:48 +0100
Subject: [Buildroot] [PATCH v10 01/28] package/efl/libefl: new package
In-Reply-To: <20151216213204.198f5387@free-electrons.com>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <1450219240-16938-2-git-send-email-romain.naour@openwide.fr>
 <20151216213204.198f5387@free-electrons.com>
Message-ID: <20151216213648.GA3448@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-16 21:32 +0100, Thomas Petazzoni spake thusly:
> On Tue, 15 Dec 2015 23:40:13 +0100, Romain Naour wrote:
> 
> > Also, add BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG config option in order to
> > select all recommended packages that allows to build libefl without the
> > extra-long --enable-i-really-know-what-i-am-doing...
> 
> I am still not entirely happy with your recommended config mechanism.
> What I want to see is the visible option "recommended config"
> completely removed. See my proposal in the attached patch 0001.
> 
> My attached patch 0002 also rewraps some Config.in help text.
> 
> But I have more issues, see below.
> 
> 
> > diff --git a/package/efl/Config.in b/package/efl/Config.in
> > index 7ce5a36..3a5e708 100644
> > --- a/package/efl/Config.in
> > +++ b/package/efl/Config.in
> > @@ -1,8 +1,13 @@
> >  menuconfig BR2_PACKAGE_EFL
> >  	bool "Enlightenment Foundation Libraries"
> > -	depends on BR2_USE_WCHAR
> > -	# libeina uses madvise(). To revisit when bumping EFL to 1.8
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_PACKAGE_HAS_UDEV # libudev
> > +	depends on BR2_PACKAGE_LUA # lua 5.1 or better
> 
> So we really need Lua itself, and not LuaJIT ? If we need only Lua (and
> not LuaJIT), why don't we select it ?

As Romain and I already explained, that's because Lua is a provider for
the virtual package lua-interpreter, and we can not select a provider.

Regards,
Yann E. MORIN.

> If we can use either Lua or
> LuaJIT, then we should "depends on BR2_PACKAGE_LUAINTERPRETER.
> 
> Also, if I apply just this patch, I get some kconfig warnings:
> 
> package/efl/Config.in:1:error: recursive dependency detected!
> package/efl/Config.in:1:	symbol BR2_PACKAGE_EFL depends on BR2_PACKAGE_LUA
> package/lua/Config.in:1:	symbol BR2_PACKAGE_LUA is selected by BR2_PACKAGE_LIBEDJE
> package/efl/libedje/Config.in:4:	symbol BR2_PACKAGE_LIBEDJE is selected by BR2_PACKAGE_LIBETHUMB
> package/efl/libethumb/Config.in:4:	symbol BR2_PACKAGE_LIBETHUMB depends on BR2_PACKAGE_EFL
> 
> But it's true that your series later removes libedje, so maybe I should
> just not care about this: it's hard to do the big change you're doing
> without having some intermediate steps that are imperfect.
> 
> Can you let me know the answer for the Lua/LuaJIT question so that we
> can move forward with this ?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

> From d4eb62a8eedb36a2b7ef6832439dc15cba813520 Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: Wed, 16 Dec 2015 21:26:37 +0100
> Subject: [PATCH 1/2] efl: rework recommended config mechanism
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/efl/libefl/Config.in | 36 ++++++++++++------------------------
>  package/efl/libefl/libefl.mk |  2 +-
>  2 files changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index cc39c82..24e0fae 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -14,23 +14,6 @@ config BR2_PACKAGE_LIBEFL
>  
>  if BR2_PACKAGE_LIBEFL
>  
> -config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
> -	bool "Use recommended and tested configuration"
> -	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
> -	select BR2_PACKAGE_LIBEFL_BULLET
> -	select BR2_PACKAGE_LIBEFL_FONTCONFIG
> -	select BR2_PACKAGE_LIBEFL_GSTREAMER1
> -	select BR2_PACKAGE_LIBEFL_LIBFRIBIDI
> -	select BR2_PACKAGE_LIBEFL_LIBSNDFILE
> -	select BR2_PACKAGE_LIBEFL_PULSEAUDIO
> -	select BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
> -	default y
> -	help
> -	  Enable the basic set of recommended features.
> -
> -	  Without that, the EFL developpers consider the build to be
> -	  potentially broken and won't provide any support for it.
> -
>  config BR2_PACKAGE_LIBEFL_BULLET
>  	bool "Enable bullet support (recommended)"
>  	select BR2_PACKAGE_BULLET
> @@ -107,14 +90,19 @@ config BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
>  	  devices etc... and disabling this will hurt support for
>  	  Enlightenment and its filemanager.
>  
> +config BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG
> +	bool
> +	default y if BR2_PACKAGE_LIBEFL_BULLET && \
> +		BR2_PACKAGE_LIBEFL_FONTCONFIG && \
> +		BR2_PACKAGE_LIBEFL_GSTREAMER1 && \
> +		BR2_PACKAGE_LIBEFL_LIBFRIBIDI && \
> +		BR2_PACKAGE_LIBEFL_LIBSNDFILE && \
> +		BR2_PACKAGE_LIBEFL_PULSEAUDIO && \
> +		BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
> +
> +
>  comment "Warning: one of the recommended option for EFL is not enabled"
> -	depends on !BR2_PACKAGE_LIBEFL_BULLET \
> -		|| !BR2_PACKAGE_LIBEFL_FONTCONFIG \
> -		|| !BR2_PACKAGE_LIBEFL_GSTREAMER1 \
> -		|| !BR2_PACKAGE_LIBEFL_LIBFRIBIDI \
> -		|| !BR2_PACKAGE_LIBEFL_LIBSNDFILE \
> -		|| !BR2_PACKAGE_LIBEFL_PULSEAUDIO \
> -		|| !BR2_PACKAGE_LIBEFL_UTIL_LINUX_LIBMOUNT
> +	depends on !BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG
>  
>  comment "libevas loaders"
>  
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index dad5e40..615968e 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -56,7 +56,7 @@ LIBEFL_CONF_OPTS = \
>  	--with-x11=none
>  
>  # Disable untested configuration warning.
> -ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
> +ifeq ($(BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG),)
>  LIBEFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
>  endif
>  
> -- 
> 2.6.4
> 

> From 68878964e825c678b40194104b68dd9af15b28c7 Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: Wed, 16 Dec 2015 21:27:08 +0100
> Subject: [PATCH 2/2] efl: rewrap Config.in help texts
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/efl/libefl/Config.in | 56 ++++++++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 26 deletions(-)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index 24e0fae..6788bb3 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -19,23 +19,25 @@ config BR2_PACKAGE_LIBEFL_BULLET
>  	select BR2_PACKAGE_BULLET
>  	default y
>  	help
> -	  If you have chosen to disable physics support, this disables lots
> -	  of core functionality and is effectively never tested. You are
> -	  going to find features that suddenly don't work and as a result
> -	  cause a series of breakages. This is simply not tested so you are
> -	  on your own in terms of ensuring everything works if you do this.
> +	  If you have chosen to disable physics support, this disables
> +	  lots of core functionality and is effectively never
> +	  tested. You are going to find features that suddenly don't
> +	  work and as a result cause a series of breakages. This is
> +	  simply not tested so you are on your own in terms of
> +	  ensuring everything works if you do this.
>  
>  config BR2_PACKAGE_LIBEFL_FONTCONFIG
>  	bool "Enable fontconfig support (recommended)"
>  	select BR2_PACKAGE_FONTCONFIG
>  	default y
>  	help
> -	  If fontconfig is disabled, this is going to make general font
> -	  searching not work, and only some very direct
> -	  'load /path/file.ttf' will work alongside some old-school ttf
> -	  file path searching. This is very likely not what you want, so
> +	  If fontconfig is disabled, this is going to make general
> +	  font searching not work, and only some very direct 'load
> +	  /path/file.ttf' will work alongside some old-school ttf file
> +	  path searching. This is very likely not what you want, so
>  	  highly reconsider turning fontconfig off. Having it off will
> -	  lead to visual problems like missing text in many UI areas etc...
> +	  lead to visual problems like missing text in many UI areas
> +	  etc...
>  
>  config BR2_PACKAGE_LIBEFL_GSTREAMER1
>  	bool "Enable gstreamer1 support (recommended)"
> @@ -43,30 +45,31 @@ config BR2_PACKAGE_LIBEFL_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	default y
>  	help
> -	  If Gstreamer 1.x support is disabled, it will heavily limit your
> -	  media support options and render some functionality as useless,
> -	  leading to visible application bugs.
> +	  If Gstreamer 1.x support is disabled, it will heavily limit
> +	  your media support options and render some functionality as
> +	  useless, leading to visible application bugs.
>  
>  config BR2_PACKAGE_LIBEFL_LIBFRIBIDI
>  	bool "Enable libfribidi support (recommended)"
>  	select BR2_PACKAGE_LIBFRIBIDI
>  	default y
>  	help
> -	  Fribidi is used for handling right-to-left text (like Arabic,
> -	  Hebrew, Farsi, Persian etc.) and is very likely not a feature you
> -	  want to disable unless you know for absolute certain you will
> -	  never encounter and have to display such scripts. Also note that
> -	  we don't test with fribidi disabled so you may also trigger code
> -	  paths with bugs that are never normally used.
> +	  Fribidi is used for handling right-to-left text (like
> +	  Arabic, Hebrew, Farsi, Persian etc.) and is very likely not
> +	  a feature you want to disable unless you know for absolute
> +	  certain you will never encounter and have to display such
> +	  scripts. Also note that we don't test with fribidi disabled
> +	  so you may also trigger code paths with bugs that are never
> +	  normally used.
>  
>  config BR2_PACKAGE_LIBEFL_LIBSNDFILE
>  	bool "Enable libsndfile support (recommended)"
>  	select BR2_PACKAGE_LIBSNDFILE
>  	default y
>  	help
> -	  If you disabled audio support in Ecore, this is not tested and may
> -	  create bugs for you due to it creating untested code paths.
> -	  Reconsider disabling audio.
> +	  If you disabled audio support in Ecore, this is not tested
> +	  and may create bugs for you due to it creating untested code
> +	  paths.  Reconsider disabling audio.
>  
>  config BR2_PACKAGE_LIBEFL_PULSEAUDIO
>  	bool "Enable pulseaudio support (recommended)"
> @@ -74,10 +77,11 @@ config BR2_PACKAGE_LIBEFL_PULSEAUDIO
>  	select BR2_PACKAGE_PULSEAUDIO
>  	default y
>  	help
> -	  The only audio output method supported by Ecore right now is via
> -	  Pulseaudio. You have disabled that and likely have broken a whole
> -	  bunch of things in the process. Reconsider your configure
> -	  options.
> +	  The only audio output method supported by Ecore right now is
> +	  via Pulseaudio. You have disabled that and likely have
> +	  broken a whole bunch of things in the process. Reconsider
> +	  your configure options.
> +
>  	  NOTE: multisense support is automatically enabled with
>  	  pulseaudio.
>  
> -- 
> 2.6.4
> 


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
