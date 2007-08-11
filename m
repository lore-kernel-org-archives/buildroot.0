From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 11 Aug 2007 17:07:54 +0300
Subject: [Buildroot] PATCH: correct expat DESTDIR ,
 was ( expat is not correctly installed)
In-Reply-To: <46BB94BC.5070904@promwad.com>
References: <46BB94BC.5070904@promwad.com>
Message-ID: <46BDC2BA.4020001@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct expat DESTDIR, otherwise it installed in staging_dir/usr/usr/include:


Index: package/expat/expat.mk
===================================================================
--- package/expat/expat.mk      (revision 19426)
+++ package/expat/expat.mk      (working copy)
@@ -53,7 +53,7 @@
         touch -c $@

  $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
-       $(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
+       $(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
         $(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
                 $(STAGING_DIR)/usr/lib/libexpat.la
         touch -c $@


Best regards,
Ivan


----------------------------------
> Hello,
> 
> seems expat lib&includes are installed in wring location:
> 
> /usr/bin/make -j1 DESTDIR=/root/buildroot/build_arm/staging_dir/usr -C /root/buildroot/build_arm/expat-2.0.1 install
> make[1]: Entering directory `/root/buildroot/build_arm/expat-2.0.1'
> /bin/sh ./conftools/mkinstalldirs /root/buildroot/build_arm/staging_dir/usr/lib /root/buildroot/build_arm/staging_dir/usr/usr/include
> /bin/sh ./libtool --mode=install /usr/bin/install -c libexpat.la /root/buildroot/build_arm/staging_dir/usr/lib/libexpat.la
> /usr/bin/install -c .libs/libexpat.so.1.5.2 /root/buildroot/build_arm/staging_dir/usr/lib/libexpat.so.1.5.2
> (cd /root/buildroot/build_arm/staging_dir/usr/lib && { ln -s -f libexpat.so.1.5.2 libexpat.so.1 || { rm -f libexpat.so.1 && ln -s libexpat.so.1.5.2 libexpat.so.1; }; })
> (cd /root/buildroot/build_arm/staging_dir/usr/lib && { ln -s -f libexpat.so.1.5.2 libexpat.so || { rm -f libexpat.so && ln -s libexpat.so.1.5.2 libexpat.so; }; })
> /usr/bin/install -c .libs/libexpat.lai /root/buildroot/build_arm/staging_dir/usr/lib/libexpat.la
> /usr/bin/install -c .libs/libexpat.a /root/buildroot/build_arm/staging_dir/usr/lib/libexpat.a
> chmod 644 /root/buildroot/build_arm/staging_dir/usr/lib/libexpat.a
> /root/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib /root/buildroot/build_arm/staging_dir/usr/lib/libexpat.a
> libtool: install: warning: remember to run `libtool --finish /lib'
> for FN in ./lib/expat.h ./lib/expat_external.h ; do /usr/bin/install -c -m 644 $FN /root/buildroot/build_arm/staging_dir/usr/usr/include ; done
> /bin/sh ./conftools/mkinstalldirs /root/buildroot/build_arm/staging_dir/usr/usr/bin /root/buildroot/build_arm/staging_dir/usr/usr/man/man1
> 
> 
> note: do /usr/bin/install -c -m 644 $FN /root/buildroot/build_arm/staging_dir/usr/usr/include
> should be: do /usr/bin/install -c -m 644 $FN /root/buildroot/build_arm/staging_dir/usr/include
> 
> tested to be working ok with expat.mk revision 18589.
> 
> BR,
> Ivan
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
