From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 10 Aug 2011 21:33:29 +0200
Subject: [Buildroot] BUG: no https support with midori
In-Reply-To: <20110810192520.7524c2ab@gmail.com>
References: <20110810192520.7524c2ab@gmail.com>
Message-ID: <1313004810.8441.3.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-08-10 at 19:25 +0200, Frederic Bassaler wrote:
> Midori needs libsoup to be compiled with SSL support, otherwise no
> https support.
> 
> libsoup 2.32.2 needs libgnutls and libgcrypt, I have enabled them in
> my .config, but libsoup refuses to compile :
> 
> checking pkg-config is at least version 0.16... yes
> checking for GLIB - version >= 2.21.3... yes (version 2.28.6)
> checking for XML... yes
> checking for Win32... no
> checking for gmtime_r... yes
> checking for mmap... yes
> checking for socket... yes
> checking for LIBGNUTLS... yes
> checking for libgcrypt-config... no
> checking for LIBGCRYPT - version >= 1.2.0... no
> configure: error: Could not configure SSL support.
> Pass "--disable-ssl" if you really want to build without SSL support
> make: ***
> [/home/fred/buildroot/output/build/libsoup-2.32.2/.stamp_configured]
> Erreur 1

I've submitted a patch a while ago that adds optional SSL support to
libsoup (SSL support is enabled if gnutls is available). Here's the
patch again for you to try:

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6ec0882..697f426 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,9 +19,15 @@ endif
 LIBSOUP_CONF_OPT = \
        --disable-explicit-deps \
        --disable-glibtest      \
-       --disable-ssl           \
        --without-gnome
 
 LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext
libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBSOUP_DEPENDENCIES += gnutls
+LIBSOUP_CONF_OPT += --enable-ssl
+else
+LIBSOUP_CONF_OPT += --disable-ssl
+endif
+
 $(eval $(call AUTOTARGETS,package,libsoup))
