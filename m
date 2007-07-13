From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 13 Jul 2007 11:05:12 -0400
Subject: [Buildroot] [PATCH] trouble with building openssh in
	svn	version 19003
In-Reply-To: <5d75f4610707051114n74862bet4ccddac2f35a163b@mail.gmail.com>
References: <5d75f4610707051114n74862bet4ccddac2f35a163b@mail.gmail.com>
Message-ID: <20070713150512.GA26801@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 06, 2007 at 01:14:23AM +0700, BuraphaLinux Server wrote:
> Hello,
> 
>     While attempting to build openssh in buildroot subversion version 19003
> I get this at the end of the build attempt for openssh:
> 
> scp.o: In function `bwlimit':
> scp.c:(.text+0x420): undefined reference to `__fixunsdfdi'
> scp.c:(.text+0x435): undefined reference to `__udivdi3'
> scp.c:(.text+0x44e): undefined reference to `__umoddi3'
> make[1]: *** [scp] Error 1

The following patch fixes the problem for me (attached).

-R
-------------- next part --------------
--- package/openssh/openssh.mk	11 Jul 2007 14:49:36 -0000	1.1.1.2
+++ package/openssh/openssh.mk	13 Jul 2007 14:59:24 -0000
@@ -15,6 +15,8 @@
 	$(ZCAT) $(DL_DIR)/$(OPENSSH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(OPENSSH_DIR) package/openssh/ openssh\*.patch
 	$(CONFIG_UPDATE) $(@D)
+	# From http://osdir.com/ml/lfs.clfs.devel/2007-01/msg00017.html
+	$(SED) s/@LD@/@CC@/ $(OPENSSH_DIR)/Makefile.in
 	touch $@
 
 $(OPENSSH_DIR)/.configured: $(OPENSSH_DIR)/.unpacked
