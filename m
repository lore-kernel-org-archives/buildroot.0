From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 2 May 2018 23:14:02 +0200
Subject: [Buildroot] [RFC v1 1/2] libopenssl: bump version to 1.1.0h
In-Reply-To: <0a63a86c-322f-6508-5cc3-5a37ff0e5dad@gmail.com>
References: <20180417211921.18718-1-ps.report@gmx.net>
 <0a63a86c-322f-6508-5cc3-5a37ff0e5dad@gmail.com>
Message-ID: <20180502231402.1ef518a9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Fri, 20 Apr 2018 08:29:52 -0700, Ryan Coe <bluemrp9@gmail.com> wrote:

> Peter, All,
> 
> On 04/17/2018 02:19 PM, Peter Seiderer wrote:
> > - remove all parallel build patches (openssl build-system changed)
> >
> > - rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> >
> > - replaced 0002-cryptodev-Fix-issue-with-signature-generation.patch with
> >    upstream version
> >
> > - rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch
> >
> > - fix uclibc build failure, use '-DOPENSSL_NO_ASYNC'
> >
> > - remove legacy enable-tlsext configure option
> >
> > - change legacy INSTALL_PREFIX to DESTDIR
> >
> > - remove 'libraries gets installed read only, so strip fails'
> >    workaround (not needed anymore)
> >
> > - change engine directory from /usr/lib/engines to
> >    /usr/lib/engines-1.1
> >
> > - change license file hash, no license change, only the following
> >    hint was removed:
> >
> >      Actually both licenses are BSD-style Open Source licenses.
> >      In case of any license issues related to OpenSSL please
> >      contact openssl-core at openssl.org.
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >
> >   - There was a previous attempt to bump the openssl version by
> >     David Mosberger <davidm@egauge.net>. I could not find the
> >     corresponding patch in patchwork or on the mailing list,
> >     only a reply by Arnout Vandecappelle (see [1]) and the
> >     answer by David Mosberger (see [2]).
> >
> >   - I did only (compile) check openssh yet (and fixed the build
> >     failure, see next patch).
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2017-August/200859.html
> > [2] http://lists.busybox.net/pipermail/buildroot/2017-August/200898.html
> > ---
> >   ...time-building-manpages-if-we-re-not-going.patch |  33 +-
> >   ...todev-Fix-issue-with-signature-generation.patch | 585 ++++++++++++---------
> >   ...roducible-build-do-not-leak-compiler-path.patch |  32 +-
> >   package/libopenssl/libopenssl.hash                 |  13 +-
> >   package/libopenssl/libopenssl.mk                   |  29 +-
> >   5 files changed, 379 insertions(+), 313 deletions(-)
> >
> > diff --git a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> > index 10d2b7526c..9fa31f968e 100644
> > --- a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> > +++ b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> > @@ -1,27 +1,30 @@
> > -From 389efb564fa1453a9da835393eec9006bfae2a52 Mon Sep 17 00:00:00 2001
> > +From 0924eea80a1a0a23c4ba74af7616a8da185b2a37 Mon Sep 17 00:00:00 2001
> >   From: Mike Frysinger <vapier@gentoo.org>
> >   Date: Sat, 16 May 2015 18:53:51 +0200
> > -Subject: Dont waste time building manpages if we're not going to use em.
> > +Subject: [PATCH] Dont waste time building manpages if we're not going to use
> > + em.
> >   
> >   Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> >   [Gustavo: update for parallel-build]
> > +[rebased on openssl-1.1.0h]
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >   ---
> > - Makefile.org | 2 +-
> > + Makefile | 2 +-
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >   
> > -diff --git a/Makefile.org b/Makefile.org
> > -index 60f07cc..976ceaf 100644
> > ---- a/Makefile.org
> > -+++ b/Makefile.org
> > -@@ -527,7 +527,7 @@ dist:
> > - dist_pem_h:
> > - 	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
> > +diff --git a/Makefile b/Makefile
> > +index b83ed2d..12cb4a2 100644-Wl,-rpath,'$(HOST_DIR)/lib'
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -173,7 +173,7 @@ list-tests:
> > + 	 $(PERL) $(SRCDIR)/test/run_tests.pl list
> > + 	@ :
> >    
> > --install: install_docs install_sw
> > -+install: install_sw
> > +-install: install_sw install_ssldirs install_docs
> > ++install: install_sw install_ssldirs
> > +
> > + uninstall: uninstall_docs uninstall_sw
> >    
> > - install_sw:
> > - 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
> >   --
> > -1.9.1
> > +2.16.3  
> This patch applies but install_docs returns after the configuration 
> step.? Perhaps a post configure sed is a better option for this.

Ups, thanks for the hint, changed the patch to apply to Configurations/unix-Makefile.tmpl
instead of the (re-generated) Makefile...., same for 0003-Reproducible-build-do-not-leak-compiler-path.patch
changed from Makefile to crypto/build.info...

> >   
> > diff --git a/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> > index 47295500c0..2cb9d8361f 100644
> > --- a/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> > +++ b/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> > @@ -1,25 +1,32 @@
> > -From 90fd7e8f1a316cda86ee442b43fcd7d5e5baeede Mon Sep 17 00:00:00 2001
> > -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > -Date: Sat, 16 May 2015 18:55:08 +0200
> > -Subject: cryptodev: Fix issue with signature generation
> > +From b408c3cfd4bbf5f473db5264dabdf7232b204e3c Mon Sep 17 00:00:00 2001
> > +From: Nikos Mavrogiannopoulos <n.mavrogiannopoulos@gmail.com>
> > +Date: Tue, 4 Nov 2014 11:35:14 +0100
> > +Subject: [PATCH] cryptodev: Fix issue with signature generation
> >   
> > -Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
> > -from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
> > -It was originally targetted at 1.0.2-beta3.
> > +That patch also enables support for SHA2 hashes, and
> > +removes support for hashes that were never supported by
> > +cryptodev.
> >   
> > -Without this patch digest acceleration via cryptodev is broken.
> > +Reviewed-by: Rich Salz <rsalz@openssl.org>
> > +Reviewed-by: Richard Levitte <levitte@openssl.org>
> > +(Merged from https://github.com/openssl/openssl/pull/1784)
> >   
> > -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > -Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> > +Buildroot comments from the 1.0.2 port:
> > +  Without this patch digest acceleration via cryptodev is broken.
> > +  Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > +  Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> > +
> > +Upstream: https://github.com/openssl/openssl/commit/efcad82bb81962f9e7620396ee2090035d112b32.patch
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >   ---  
> [snip]
> >   
> >   ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
> >   define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
> > -	rm -rf $(TARGET_DIR)/usr/lib/engines
> > +	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
> >   endef
> >   LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
> >   endif  
> 
> I'm also getting the following error on host-libopenssl:
> 
> PATH="/home/ryan/devel/buildroot/output/host/bin:/home/ryan/devel/buildroot/output/host/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin" 
> PKG_CONFIG="/home/ryan/devel/buildroot/output/host/bin/pkg-config" 
> PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 -Wl,-rpath,'$(HOST_DIR)/lib'-Wl,-rpath,'$(HOST_DIR)/lib'
> PKG_CONFIG_LIBDIR="/home/ryan/devel/buildroot/output/host/lib/pkgconfig:/home/ryan/devel/buildroot/output/host/share/pkgconfig" 
> /usr/bin/make -j9 -C 
> /home/ryan/devel/buildroot/output/build/host-libopenssl-1.1.0h install
> /usr/bin/make depend && /usr/bin/make _all
> *** Installing development files
> *** Installing engines
> install engines/afalg/afalg.so -> 
> /home/ryan/devel/buildroot/output/host/lib/engines-1.1/afalg.so
> install ./include/openssl/aes.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/aes.h
> *** Installing runtime files
> install ./apps/CA.pl -> 
> /home/ryan/devel/buildroot/output/host/etc/ssl/misc/CA.pl
> install engines/capi.so -> 
> /home/ryan/devel/buildroot/output/host/lib/engines-1.1/capi.so
> install ./include/openssl/asn1.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/asn1.h
> install libcrypto.so.1.1 -> 
> /home/ryan/devel/buildroot/output/host//lib/libcrypto.so.1.1
> install ./include/openssl/asn1_mac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/asn1_mac.h
> install ./apps/tsget -> 
> /home/ryan/devel/buildroot/output/host/etc/ssl/misc/tsget
> install engines/padlock.so -> 
> /home/ryan/devel/buildroot/output/host/lib/engines-1.1/padlock.so
> install ./include/openssl/asn1t.h -> -Wl,-rpath,'$(HOST_DIR)/lib'-Wl,-rpath,'$(HOST_DIR)/lib'
> /home/ryan/devel/buildroot/output/host/include/openssl/asn1t.h
> install ./apps/openssl.cnf -> 
> /home/ryan/devel/buildroot/output/host/etc/ssl/openssl.cnf.dist
> install ./include/openssl/async.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/async.h
> install libssl.so.1.1 -> 
> /home/ryan/devel/buildroot/output/host//lib/libssl.so.1.1
> install ./include/openssl/bio.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/bio.h
> install ./include/openssl/blowfish.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/blowfish.h
> install apps/openssl -> /home/ryan/devel/buildroot/output/host/bin/openssl
> install ./include/openssl/bn.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/bn.h
> install ./include/openssl/buffer.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/buffer.h
> install ./tools/c_rehash -> 
> /home/ryan/devel/buildroot/output/host/bin/c_rehash
> install ./include/openssl/camellia.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/camellia.h
> install ./include/openssl/cast.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/cast.h
> install ./include/openssl/cmac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/cmac.h
> install ./include/openssl/cms.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/cms.h
> install ./include/openssl/comp.h -> -Wl,-rpath,'$(HOST_DIR)/lib'
> /home/ryan/devel/buildroot/output/host/include/openssl/comp.h
> install ./include/openssl/conf.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/conf.h
> install ./include/openssl/conf_api.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/conf_api.h
> install ./include/openssl/crypto.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/crypto.h
> install ./include/openssl/ct.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ct.h
> install ./include/openssl/des.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/des.h
> install ./include/openssl/dh.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/dh.h
> install ./include/openssl/dsa.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/dsa.h
> install ./include/openssl/dtls1.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/dtls1.h
> install ./include/openssl/e_os2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/e_os2.h
> install ./include/openssl/ebcdic.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ebcdic.h
> install ./include/openssl/ec.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ec.h
> install ./include/openssl/ecdh.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ecdh.h
> install ./include/openssl/ecdsa.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ecdsa.h-Wl,-rpath,'$(HOST_DIR)/lib'
> install ./include/openssl/engine.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/engine.h
> install ./include/openssl/err.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/err.h
> install ./include/openssl/evp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/evp.h
> install ./include/openssl/hmac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/hmac.h
> install ./include/openssl/idea.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/idea.h
> install ./include/openssl/kdf.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/kdf.h
> install ./include/openssl/lhash.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/lhash.h
> install ./include/openssl/md2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/md2.h
> install ./include/openssl/md4.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/md4.h
> install ./include/openssl/md5.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/md5.h
> install ./include/openssl/mdc2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/mdc2.h
> install ./include/openssl/modes.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/modes.h
> install ./include/openssl/obj_mac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/obj_mac.h
> install ./include/openssl/objects.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/objects.h
> install ./include/openssl/ocsp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ocsp.h
> install ./include/openssl/opensslconf.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/opensslconf.h
> install ./include/openssl/opensslv.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/opensslv.h
> install ./include/openssl/ossl_typ.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ossl_typ.h
> install ./include/openssl/pem.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pem.h
> install ./include/openssl/pem2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pem2.h
> install ./include/openssl/pkcs12.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pkcs12.h
> install ./include/openssl/pkcs7.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pkcs7.h
> install ./include/openssl/rand.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rand.h-Wl,-rpath,'$(HOST_DIR)/lib'-Wl,-rpath,'$(HOST_DIR)/lib'
> install ./include/openssl/rc2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rc2.h
> install ./include/openssl/rc4.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rc4.h
> install ./include/openssl/rc5.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rc5.h
> install ./include/openssl/ripemd.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ripemd.h
> install ./include/openssl/rsa.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rsa.h
> install ./include/openssl/safestack.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/safestack.h
> install ./include/openssl/seed.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/seed.h
> install ./include/openssl/sha.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/sha.h
> install ./include/openssl/srp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/srp.h
> install ./include/openssl/srtp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/srtp.h
> install ./include/openssl/ssl.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ssl.h-Wl,-rpath,'$(HOST_DIR)/lib'-Wl,-rpath,'$(HOST_DIR)/lib'
> install ./include/openssl/ssl2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ssl2.h
> install ./include/openssl/ssl3.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ssl3.h
> install ./include/openssl/stack.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/stack.h
> install ./include/openssl/symhacks.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/symhacks.h
> install ./include/openssl/tls1.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/tls1.h
> install ./include/openssl/ts.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ts.h
> install ./include/openssl/txt_db.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/txt_db.h
> install ./include/openssl/ui.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ui.h
> install ./include/openssl/whrlpool.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/whrlpool.h
> install ./include/openssl/x509.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/x509.h
> install ./include/openssl/x509_vfy.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/x509_vfy.h
> install ./include/openssl/x509v3.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/x509v3.h
> install ./include/openssl/aes.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/aes.h
> install ./include/openssl/asn1.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/asn1.h
> install ./include/openssl/asn1_mac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/asn1_mac.h
> install ./include/openssl/asn1t.h -> -Wl,-rpath,'$(HOST_DIR)/lib'
> /home/ryan/devel/buildroot/output/host/include/openssl/asn1t.h
> install ./include/openssl/async.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/async.h
> install ./include/openssl/bio.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/bio.h
> install ./include/openssl/blowfish.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/blowfish.h
> install ./include/openssl/bn.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/bn.h
> install ./include/openssl/buffer.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/buffer.h
> install ./include/openssl/camellia.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/camellia.h
> install ./include/openssl/cast.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/cast.h
> install ./include/openssl/cmac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/cmac.h
> install ./include/openssl/cms.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/cms.h
> install ./include/openssl/comp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/comp.h
> install ./include/openssl/conf.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/conf.h
> install ./include/openssl/conf_api.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/conf_api.h
> install ./include/openssl/crypto.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/crypto.h
> install ./include/openssl/ct.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ct.h
> install ./include/openssl/des.h -> -Wl,-rpath,'$(HOST_DIR)/lib'-Wl,-rpath,'$(HOST_DIR)/lib'
> /home/ryan/devel/buildroot/output/host/include/openssl/des.h
> install ./include/openssl/dh.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/dh.h
> install ./include/openssl/dsa.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/dsa.h
> install ./include/openssl/dtls1.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/dtls1.h
> install ./include/openssl/e_os2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/e_os2.h
> install ./include/openssl/ebcdic.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ebcdic.h
> install ./include/openssl/ec.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ec.h
> install ./include/openssl/ecdh.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ecdh.h
> install ./include/openssl/ecdsa.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ecdsa.h
> install ./include/openssl/engine.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/engine.h-Wl,-rpath,'$(HOST_DIR)/lib'-Wl,-rpath,'$(HOST_DIR)/lib'
> install ./include/openssl/err.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/err.h
> install ./include/openssl/evp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/evp.h
> install ./include/openssl/hmac.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/hmac.h
> install ./include/openssl/idea.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/idea.h
> install ./include/openssl/kdf.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/kdf.h
> install ./include/openssl/lhash.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/lhash.h
> install ./include/openssl/md2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/md2.h
> install ./include/openssl/md4.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/md4.h
> install ./include/openssl/md5.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/md5.h
> install ./include/openssl/mdc2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/mdc2.h
> install ./include/openssl/modes.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/modes.h
> install ./include/openssl/obj_mac.h -> -Wl,-rpath,'$(HOST_DIR)/lib'
> /home/ryan/devel/buildroot/output/host/include/openssl/obj_mac.h
> install ./include/openssl/objects.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/objects.h
> install ./include/openssl/ocsp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ocsp.h
> install ./include/openssl/opensslconf.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/opensslconf.h
> install ./include/openssl/opensslv.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/opensslv.h
> install ./include/openssl/ossl_typ.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ossl_typ.h
> install ./include/openssl/pem.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pem.h
> install ./include/openssl/pem2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pem2.h
> install ./include/openssl/pkcs12.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pkcs12.h
> install ./include/openssl/pkcs7.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/pkcs7.h
> install ./include/openssl/rand.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rand.h
> install ./include/openssl/rc2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rc2.h
> install ./include/openssl/rc4.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rc4.h
> install ./include/openssl/rc5.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rc5.h
> install ./include/openssl/ripemd.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ripemd.h
> install ./include/openssl/rsa.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/rsa.h
> install ./include/openssl/safestack.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/safestack.h
> install ./include/openssl/seed.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/seed.h
> install ./include/openssl/sha.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/sha.h
> install ./include/openssl/srp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/srp.h
> install ./include/openssl/srtp.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/srtp.h
> install ./include/openssl/ssl.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ssl.h
> install ./include/openssl/ssl2.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ssl2.h
> install ./include/openssl/ssl3.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ssl3.h
> install ./include/openssl/stack.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/stack.h
> install ./include/openssl/symhacks.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/symhacks.h
> install ./include/openssl/tls1.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/tls1.h
> install ./include/openssl/ts.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ts.h
> install ./include/openssl/txt_db.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/txt_db.h
> install ./include/openssl/ui.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/ui.h
> install ./include/openssl/whrlpool.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/whrlpool.h
> install ./include/openssl/x509.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/x509.h
> install ./include/openssl/x509_vfy.h -> 
> /home/ryan/devel/buildroot/output/host/include/openssl/x509_vfy.h
> install ./include/openssl/x509v3.h -> 7aae2fb06db701eeff856620c3b45bfea981b8bd
> /home/ryan/devel/buildroot/output/host/include/openssl/x509v3.h
> install libcrypto.a -> 
> /home/ryan/devel/buildroot/output/host//lib/libcrypto.a
> install libssl.a -> /home/ryan/devel/buildroot/output/host//lib/libssl.a
> install libcrypto.so.1.1 -> 
> /home/ryan/devel/buildroot/output/host//lib/libcrypto.so.1.1
> link /home/ryan/devel/buildroot/output/host//lib/libcrypto.so -> 
> /home/ryan/devel/buildroot/output/host//lib/libcrypto.so.1.1
> install libssl.so.1.1 -> 
> /home/ryan/devel/buildroot/output/host//lib/libssl.so.1.1
> link /home/ryan/devel/buildroot/output/host//lib/libssl.so -> 
> /home/ryan/devel/buildroot/output/host//lib/libssl.so.1.1
> install libcrypto.pc -> 
> /home/ryan/devel/buildroot/output/host//lib/pkgconfig/libcrypto.pc
> install libssl.pc -> 
> /home/ryan/devel/buildroot/output/host//lib/pkgconfig/libssl.pc
> install openssl.pc -> 
> /home/ryan/devel/buildroot/output/host//lib/pkgconfig/openssl.pc
> ***
> *** ERROR: package host-libopenssl installs executables without proper 
> RPATH:
> ***?? /home/ryan/devel/buildroot/output/host/bin/openssl
> make[1]: *** [package/pkg-generic.mk:236: 
> /home/ryan/devel/buildroot/output/build/host-libopenssl-1.1.0h/.stamp_host_installed] 
> Error 1
> make: *** [Makefile:79: _all] Error 2
> 

Thanks fro the failure report, will try Bernd Kuhls -Wl,-rpath,'$(HOST_DIR)/lib' suggestion...

Regards,
Peter
