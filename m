From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:57:40 +0200
Subject: [Buildroot] [PATCH] Add xorg support and upgrade for mp3 issue.
In-Reply-To: <1282404097-12535-1-git-send-email-max@marretta.com>
References: <1282404097-12535-1-git-send-email-max@marretta.com>
Message-ID: <20100822125740.3f3bdea1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Massimiliano,

Thanks for reworking the patch with Git. I have a couple of comments,
though. First, does the X.org support needs to be part of the same
patch as the version bump ? In other words, shouldn't this be split in
several smaller patches (one to bump the versions, one to add X.org
support) ?

It would be good to add a little bit more details in the commit log:
what does the X.org support brings, and what mp3 issue is being fixed
by the version bump ?

Other comments below.

On Sat, 21 Aug 2010 17:21:37 +0200
Massimiliano Marretta <max@marretta.com> wrote:

>  GST_PLUGINS_BASE_CONF_OPT = \
>  		--disable-examples \
> -		--disable-x \
> -		--disable-xvideo \
> -		--disable-xshm \
>  		--disable-oggtest \
>  		--disable-vorbistest \
>  		--disable-freetypetest
>  
> +
> +
> +

Useless newlines. Keep only one.

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
> +GST_PLUGINS_BASE_CONF_OPT += --enable-x \
> +		--enable-xvideo \
> +		--enable-xshm
> +else
> +GST_PLUGINS_BASE_CONF_OPT += --disable-x \
> +		--disable-xvideo \
> +		--disable-xshm
> +endif

This is really a detail, but I'd prefer to have the first --option on a
newline, so :

GST_PLUGINS_BASE_CONF_OPT += \
	--disable-foobar \
	--disable-barfoo

> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +GST_PLUGINS_BASE_DEPENDENCIES += xserver_xorg-server
> +GST_PLUGINS_BASE_CONF_OPT += --enable-x \
> +		--enable-x \

Duplicate.

> +		--enable-xvideo \
> +		--enable-xshm
> +else
> +GST_PLUGINS_BASE_CONF_OPT += --disable-x \
> +		--disable-x \

Duplicate again.

> +		--disable-xvideo \
> +		--disable-xshm
> +endif

> --- a/package/multimedia/gstreamer/gstreamer-0.10.25-fix-unaligned-detectiob-for-x86-64.patch
> +++ /dev/null

Are you sure this patch is no longer needed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
