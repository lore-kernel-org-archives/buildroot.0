Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B350FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E78558465E;
	Mon,  4 May 2026 14:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsbtiAYiyHBd; Mon,  4 May 2026 14:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263148460C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906070;
	bh=CIDzBLj29muL4N6Jg2k3RxAzVdXlbE+QC4jAv0TYY+E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FgITJEVjt2CRnsY2vfoE+UGUp3ycqjULFj4jKPcWBZLMjmPP4IHZIFWf9N54uUCk5
	 WR3qugJhz1PjR4Clh7CFmG8IEatG21eIK0pYjgYu1RL5kkm48Q+fvJjEL+J7N1s+th
	 Bcz4pRJXUnnNoSIbsdNiUfL1yloBVuWgWOeU1ZgqD56/gsfs4+Ygx3Z407c8KVGez8
	 G0K8UN27ANty5p1kQA3tqJq/FzPzhegh9qEYRwzwP2H5Mpe3LVx3OSBh4z9tdVgQvN
	 VyfEpobr2FQUt0aKKUghh2xqpj2Rh5Xt4KtbXNqP7PfaZoIPXeF+j2ne0rZrI6fIv2
	 DsBLMR6gyZ1Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263148460C;
	Mon,  4 May 2026 14:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB9AA190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E7E84651
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M18m2WanLVpE for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6152684652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6152684652
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6152684652
 for <buildroot@busybox.net>; Mon,  4 May 2026 14:47:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso47671235e9.1
 for <buildroot@busybox.net>; Mon, 04 May 2026 07:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906064; x=1778510864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aqjJ+JAP2xKK1hGPabpQW9FAPzDjOnE93aIjzHgyykY=;
 b=H3ZI2j7/SYBWn4vkkXCJGQJXDMbiNUIQ6Sj0uRfY/t8YqF4kGPG+CNSGzAaCv6Vb+2
 ErG+Fxk1z4dPSZ4Sr5A+R3qQ2mEfZXJDTUvxJwG2Jpxyi4FyDfW4IzekGztvMgLq3sRg
 yFlQSPGe4cALXH+KT0lLJv8qGhrknuztU5EeFwsXT3Ticdmoo32A8ZLt4SwO9k9rVwlz
 7Ca5dXtkynpNm5HiSULPxLi4JnWidej1Eye2Xnxi42xdvYbc2+Cr+OIjlNQV5m4iUdLE
 Mn0o0MrG/bnIYbBzlVVRJKtBsqmHYkl6LxMc55BJ3QHzD/tBb6U2UShYGdNoc2kGCzAf
 Hqwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ83N3MD0kXB6hijUUg+2RIbRFPkd6bWsuhTizw6w8XXev39P4cl6wJAQxbMLKBxG1NwxYE2fCm9lyM=@busybox.net
X-Gm-Message-State: AOJu0Yz0w2qz243VDBOwltxWx1BSMVWgS3QYLNbaQWFW60/RRwv2mdpE
 W83yXN8OCDmIOQkHnuh51maa/HxAKMHZDMa5j9v7+O2AvzcamRt5B5JNpvGeuNO5plo=
X-Gm-Gg: AeBDievK1kR/nBswPWWh0RcCOQuuEHtY8vCb+jmjpe5NhzucUtc2mYhXfLbHUj98Ua8
 7fxjG3kRkkpqeAiw7VZ+hqeG0CmlDgi+EENExb+/3wbf57JHma050sXKgDJ3rMg9H6JtAmxeyl3
 efcsMQ0Y1EoHzIV4OpKnwXwqegAWnnIZW1r6K9sGRP7iYHt2GR9ETrVCM+Ty9YTaaydlVWPSOkm
 IlZ/MWPs4xCFP7Lr0ugk8/N62pRWIugMwyCbjdKybZjRiNQptSSBambBCmusJBdNmTW+Ot20IEF
 SZbW+m7f4Z5ZU2eh84GC6AtnMbM7wf4fbHZ21VCeF9Joz06hv7Ils5r18xrBh/f3VJ7u7yQePKS
 uynLmKbE+zCc8zgdgWacmphXzodHu+MxbLjtIHr/mNFEdgCr97J7LH/7YCmEMlSlEwb3sAINzL8
 UdLWWG4IfYdDUWGcZnNwuipXRMpabqOJUw18AG
X-Received: by 2002:a05:600c:8b11:b0:48a:5339:a46 with SMTP id
 5b1f17b1804b1-48a970eafbemr148422745e9.9.1777906064341; 
 Mon, 04 May 2026 07:47:44 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81b99127sm324762675e9.0.2026.05.04.07.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:43 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Mon,  4 May 2026 16:47:43 +0200
Message-ID: <20260504144743.10236-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422163125.5757-3-francois.perrad@gadz.org>
References: <20260422163125.5757-3-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906064; x=1778510864; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqjJ+JAP2xKK1hGPabpQW9FAPzDjOnE93aIjzHgyykY=;
 b=JaMU6FBI1HMNUCeqxeaY5lmCmuZyWKsy6RgLITzU8axFLLoz0+snD2D2RVi+rCnmBp
 aeiIAIwX9XiIy7Oz2EWXgoLhFY3MOJxJ4RYRkPaNiwd/sDYXevOydi+5bABn0IfRSaXe
 MerJneXVyWrEBZea5LCdShkFavn3XWf859zq6bbeysUUZQvhNospguXxaey7oM7ulvy8
 3P5znVKR2H9a3kBBsLxREa+u9CqhNkaM224gXwt6cZ+erXN9/6ep3iu4fNl92thfXyIW
 RgJc2WECsQNGPMBBAUHmBzcw1V0QBlHfVaWsboJ/QnPRPrBWbpynkKWO7Y7vnoENWt9D
 khuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JaMU6FBI
Subject: Re: [Buildroot] [PATCH v3 2/2] package/ficl: bump to version 3.065
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> - sources are now hosted on Github
> - ficl have its own LICENSE file
> - remove one upstreamed patch
> - support only static lib
> - requires C11
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...=> 0001-makefile.linux-pass-LDFLAGS.patch} | 30 ++++++------
>  package/ficl/0001-missing-include.patch       | 26 ----------
>  package/ficl/Config.in                        |  6 ++-
>  package/ficl/ficl.hash                        |  4 +-
>  package/ficl/ficl.mk                          | 47 ++++---------------
>  5 files changed, 33 insertions(+), 80 deletions(-)
>  rename package/ficl/{0002-Makefile.linux-pass-LDFLAGS.patch => 0001-makefile.linux-pass-LDFLAGS.patch} (70%)
>  delete mode 100644 package/ficl/0001-missing-include.patch
> 
> diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
> similarity index 70%
> rename from package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> rename to package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
> index aa5c00edb..1ac86466d 100644
> --- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> +++ b/package/ficl/0001-makefile.linux-pass-LDFLAGS.patch
> @@ -17,23 +17,25 @@ Upstream: upstream is dead
>  Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>  [francois: downgrade to 3.03]
>  Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +[francois: upgrade to 3.065]
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  ---
> - Makefile.linux | 2 +-
> + makefile.linux | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
> -diff --git a/Makefile.linux b/Makefile.linux
> -index 5f1a41f..df887e6 100644
> ---- a/Makefile.linux
> -+++ b/Makefile.linux
> -@@ -13,7 +13,7 @@ MAJOR = 3
> - MINOR = 0.1
> - 
> - ficl: testmain.o ficl.h sysdep.h libficl.a
> --	$(CC) testmain.o -o ficl -L. -lficl -lm
> -+	$(CC) $(LDFLAGS) testmain.o -o ficl -L. -lficl -lm
> - 
> - lib: libficl.so.$(MAJOR).$(MINOR)
> - 
> +diff --git a/makefile.linux b/makefile.linux
> +index 1e467ea..fad7059 100755
> +--- a/makefile.linux
> ++++ b/makefile.linux
> +@@ -26,7 +26,7 @@ libficl.a: $(OBJECTS)
> + 
> + # === Console Test executable ===
> + ficl: $(FICL_TEST_OBJ) ficl.h sysdep.h libficl.a
> +-	$(CC) $(FICL_TEST_OBJ) -o ficl -L. -lficl -lm
> ++	$(CC) $(LDFLAGS) $(FICL_TEST_OBJ) -o ficl -L. -lficl -lm
> + 
> + # === Compile rules ===
> + .SUFFIXES: .cxx .cc .c .o
>  -- 
>  2.35.1
>  
> diff --git a/package/ficl/0001-missing-include.patch b/package/ficl/0001-missing-include.patch
> deleted file mode 100644
> index a52089623..000000000
> --- a/package/ficl/0001-missing-include.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 87c78eea2c4ac69c09947c8e49f8e8668640071c Mon Sep 17 00:00:00 2001
> -From: Francois Perrad <francois.perrad@gadz.org>
> -Date: Sun, 7 Dec 2025 10:15:27 +0100
> -Subject: [PATCH] missing include
> -
> -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> -Upstream: upstream is dead
> ----
> - fileaccess.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/fileaccess.c b/fileaccess.c
> -index 738889d..c03d5d6 100644
> ---- a/fileaccess.c
> -+++ b/fileaccess.c
> -@@ -4,6 +4,7 @@
> - #include <string.h>
> - #include <ctype.h>
> - #include <sys/stat.h>
> -+#include <unistd.h>
> - #include "ficl.h"
> - 
> - #if FICL_WANT_FILE
> --- 
> -2.43.0
> -
> diff --git a/package/ficl/Config.in b/package/ficl/Config.in
> index 4d9ab4a5b..21861652e 100644
> --- a/package/ficl/Config.in
> +++ b/package/ficl/Config.in
> @@ -1,9 +1,13 @@
>  config BR2_PACKAGE_FICL
>  	bool "ficl"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6 # C11/static_assert
>  	help
>  	  Ficl is a programming language interpreter designed to be
>  	  embedded into other systems as a command, macro, and
>  	  development prototyping language.
>  	  Ficl is an acronym for "Forth Inspired Command Language".
>  
> -	  http://ficl.sourceforge.net
> +	  https://ficl.sourceforge.net/
> +
> +comment "ficl needs a gcc >= 4.6"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
> index 1a4a54e70..6023708ff 100644
> --- a/package/ficl/ficl.hash
> +++ b/package/ficl/ficl.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  064abbea44b2cbbeb53b8df8e5588ed41c4d32dd19bdb897e5d21507691407b2  ficl303.tar.gz
> -sha256  18527f5cdc213d29fb65791e153690974e5426b7e989f3b8eee61c2e5f9e5fcd  ReadMe.txt
> +sha256  09a4649a68a075999c2bc26129cf233c4d672335a9c68b98ffcbf1bc8962e5e1  ficl3065.tar.gz
> +sha256  b7a894f23d7d7302852405b3d1b6fd88e76b4c116a68f046d4547c073c75d3ea  LICENSE
> diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
> index ef2e1408c..1ab1bb6a3 100644
> --- a/package/ficl/ficl.mk
> +++ b/package/ficl/ficl.mk
> @@ -4,56 +4,29 @@
>  #
>  ################################################################################
>  
> -FICL_VERSION = 3.03
> +FICL_VERSION = 3.065
>  FICL_TAG = ficl$(subst .,,$(FICL_VERSION))
> -FICL_VERSION_SO = 3.0.1
>  FICL_SOURCE = $(FICL_TAG).tar.gz
> -FICL_SITE = https://sourceforge.net/projects/ficl/files/ficl-all/$(FICL_TAG)
> -FICL_LICENSE = BSD-2-Clause
> -FICL_LICENSE_FILES = ReadMe.txt
> +FICL_SITE = $(call github,jwsadler58,ficl,$(FICL_TAG))
> +FICL_LICENSE = BSD-3-Clause
> +FICL_LICENSE_FILES = LICENSE
>  FICL_INSTALL_STAGING = YES
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -FICL_BUILD_TARGETS += ficl
> -define FICL_INSTALL_STATIC_BIN
> -	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
> -endef
> -endif
> -
> -ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> -FICL_BUILD_TARGETS += libficl.a
> -define FICL_INSTALL_STATIC_LIB
> -	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
> -endef
> -endif
> -
> -ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> -FICL_BUILD_TARGETS += testmain libficl.so.$(FICL_VERSION_SO)
> -define FICL_INSTALL_SHARED_BIN
> -	$(INSTALL) -D -m 0755 $(@D)/testmain $(TARGET_DIR)/usr/bin/ficl
> -endef
> -define FICL_INSTALL_SHARED_LIB
> -	$(INSTALL) -D -m 0755 $(@D)/libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.$(FICL_VERSION_SO)
> -	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so.3
> -	ln -sf libficl.so.$(FICL_VERSION_SO) $(1)/usr/lib/libficl.so
> -endef
> -endif
> +FICL_DEPENDENCIES = host-python3
>  
>  define FICL_BUILD_CMDS
> -	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
> +	# workaround for static_assert on uclibc-ng < 1.0.42
> +	$(MAKE) -C $(@D) -f makefile.linux $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS) -std=c11 -Dlinux -D_POSIX_C_SOURCE=200809L -Dstatic_assert=_Static_assert -I. " CPPFLAGS="" ficl
>  endef
>  
>  define FICL_INSTALL_STAGING_CMDS
> -	$(FICL_INSTALL_STATIC_LIB)
> -	$(call FICL_INSTALL_SHARED_LIB,$(STAGING_DIR))
> +	$(INSTALL) -D -m 0644 $(@D)/libficl.a $(STAGING_DIR)/usr/lib/libficl.a
>  	$(INSTALL) -D -m 0644 $(@D)/ficl.h $(STAGING_DIR)/usr/include/ficl.h
>  endef
>  
>  define FICL_INSTALL_TARGET_CMDS
> -	$(FICL_INSTALL_STATIC_BIN)
> -	$(FICL_INSTALL_SHARED_BIN)
> -	$(call FICL_INSTALL_SHARED_LIB,$(TARGET_DIR))
> +	$(INSTALL) -D -m 0755 $(@D)/ficl $(TARGET_DIR)/usr/bin/ficl
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
