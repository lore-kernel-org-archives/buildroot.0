From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 31 Oct 2008 09:37:36 +0100
Subject: [Buildroot] [PATCH] Create zlib installation directory in
	the	staging dir
In-Reply-To: <20081030170039.6fe37578@surf>
References: <20081030170039.6fe37578@surf>
Message-ID: <20081031083736.GB26468@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 30, 2008 at 05:00:39PM +0100, Thomas Petazzoni wrote:
>Create zlib installation directory in the staging dir
>
>A simple .config with just Busybox and zlib, using an external binary
>toolchain, leads to the following build failure:
>
>touch -c /home/thomas/local/buildroot2/build_arm/zlib-1.2.3/libz.so
>cp -dpf /home/thomas/local/buildroot2/build_arm/zlib-1.2.3/libz.a /home/thomas/local/buildroot2/build_arm/staging_dir/usr/lib/
>cp: cannot create regular file `/home/thomas/local/buildroot2/build_arm/staging_dir/usr/lib/': Is a directory
>make: *** [/home/thomas/local/buildroot2/build_arm/staging_dir/usr/lib/libz.so] Error 1
>
>This is because no one creates $(STAGING_DIR)/usr/lib, and the
>installation of zlib is done manually. Fix that by creating
>$(STAGING_DIR)/usr/lib and $(STAGING_DIR)/usr/include in zlib
>installation target.
>
>Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>---
> package/zlib/zlib.mk |    2 ++
> 1 file changed, 2 insertions(+)
>
>Index: buildroot2/package/zlib/zlib.mk
>===================================================================
>--- buildroot2.orig/package/zlib/zlib.mk
>+++ buildroot2/package/zlib/zlib.mk
>@@ -37,6 +37,8 @@
> 	touch -c $@
> 
> $(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
>+	mkdir -p $(STAGING_DIR)/usr/lib/
>+	mkdir -p $(STAGING_DIR)/usr/include/
> 	cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
> 	cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
> 	cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/

 	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
 	$(INSTALL) $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/zconf.h

fixed.
