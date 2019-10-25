From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:04:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/jitterentropy-library: fix
 static build
In-Reply-To: <20191024165913.19081-2-fontaine.fabrice@gmail.com>
References: <20191024165913.19081-1-fontaine.fabrice@gmail.com>
 <20191024165913.19081-2-fontaine.fabrice@gmail.com>
Message-ID: <20191025160441.6bba0aab@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 18:59:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy-static
> +JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-static
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy jitterentropy-static
> +JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared install-static
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy
> +JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
> +endif

This can be written in a slightly shorter way:

+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy-static
+JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-static
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy
+JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
+endif

So I changed it to that, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
