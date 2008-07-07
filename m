From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 07 Jul 2008 14:13:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87fxqmg53j.fsf@macbook.be.48ers.dk>
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk>
Message-ID: <48720878.3070602@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-07-04 15:29:50 -0700 (Fri, 04 Jul 2008)
>  ulf> New Revision: 22640
> 
>  ulf> Log:
>  ulf> Add 'build with log'
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/Makefile
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/Makefile
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/Makefile	2008-07-04 22:23:20 UTC (rev 22639)
>  ulf> +++ trunk/buildroot/Makefile	2008-07-04 22:29:50 UTC (rev 22640)
>  ulf> @@ -475,6 +475,9 @@
>  
>  ulf>  prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
>  
>  ulf> +log:
>  ulf> +	$(MAKE) > $(PROJECT).log 2>&1 
> 
> That breaks the source-check/external-deps check in
> Makefile.autotools.in (r22607).
> 

Is not something like the following to be preferred?

Index: Makefile
===================================================================
- --- Makefile	(revision 22671)
+++ Makefile	(arbetskopia)
@@ -346,10 +346,10 @@
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)

 _source-check:
- -	$(MAKE) SPIDER=--spider source
+	$(MAKE) FORCE_DOWNLOAD=y SPIDER=--spider source

 external-deps:
- -	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)toolchain/wget-show-external-deps.sh \
+	@$(MAKE) FORCE_DOWNLOAD=y -Bs
BR2_WGET=$(TOPDIR)toolchain/wget-show-external-deps.sh \
 	source

Index: package/Makefile.autotools.in
===================================================================
- --- package/Makefile.autotools.in	(revision 22671)
+++ package/Makefile.autotools.in	(arbetskopia)
@@ -131,7 +131,7 @@
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
- -ifeq ($(MAKELEVEL),1)
+ifeq ($(FORCE_DOWNLOAD),y)
 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 else
 #############################################################

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIcgh4AyRRH5cXxqwRArN5AJ9AF/jF0N6l8rj/t3H8PBmIfCL1CgCdH64e
0AisEv4BygKL0S84UEA5p9k=
=T0+o
-----END PGP SIGNATURE-----
