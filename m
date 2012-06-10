From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jun 2012 22:23:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] libplayer: fix cflags
In-Reply-To: <1339328813-6269-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 10 Jun 2012 13:46:46 +0200")
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87wr3ehq6p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Explicitly run pkg-config to add some include directories to the cflags
 Samuel> when gstreamer support is enabled.

 Samuel> This patch fixes the following unfound headers:
 Samuel> - glib.h
 Samuel> - glibconfig.h
 Samuel> - gst/gst.h

What problem is this solving exactly? I don't recall seeing any failures
on the autobuilders, and host-pkg-config + libglib2 are already
dependencies of gstreamer, so it shouldn't be needed to list them
explicitly.

From a quick look at the (handwritten) configure script, is seem to get
cflags / libs from pkg-config as well.


 Samuel> diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
 Samuel> index 093821e..643c7bb 100644
 Samuel> --- a/package/libplayer/libplayer.mk
 Samuel> +++ b/package/libplayer/libplayer.mk
 Samuel> @@ -30,8 +30,10 @@ else
 Samuel>  endif
 
 Samuel>  ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
 Samuel> -	LIBPLAYER_DEPENDENCIES += gstreamer
 Samuel> +	LIBPLAYER_DEPENDENCIES += host-pkg-config libglib2 gstreamer
 Samuel>  	LIBPLAYER_CONF_OPT += --enable-gstreamer
 Samuel> +	LIBPLAYER_MAKE_OPT += \
 Samuel> +		CFLAGS+="`$(PKG_CONFIG_HOST_BINARY) --cflags glib-2.0 gstreamer-0.10`"
 Samuel>  else
 Samuel>  	LIBPLAYER_CONF_OPT += --disable-gstreamer
 Samuel>  endif
 Samuel> -- 
 Samuel> 1.7.10.4

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
