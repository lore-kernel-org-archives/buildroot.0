Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B90DC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 12:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2D781D47;
	Wed,  2 Nov 2022 12:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2D781D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ht2kR5w5AXk9; Wed,  2 Nov 2022 12:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2B181D18;
	Wed,  2 Nov 2022 12:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB2B181D18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEDC21BF366
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 12:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96A8540941
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 12:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A8540941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCd1RUj0iu9i for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 12:07:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C742940928
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C742940928
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 12:07:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id cl5so12577752wrb.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 05:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fm0ufNlwPcYl1FaMGOAlDYbVeSGKd/GBqpOBrp565OU=;
 b=rCMLFObyvFMC2y4NLEY9KttvdLQhCb/aqynyU1q3bR+SGjxKMJL0koFKxmOiwG7byf
 9R5Ed40Sbsuih2HYHlYl39xm9+ZglUYjz/yheZ9hORh7HIht/uLyn+cN0aWwxBTlHn3Z
 FZjukQ+TvepzCfH7y2w1KCdL/9kpJqaj6E5qPB98OMX0O5uIMNGALTzX4HXo8RV9XNMV
 cc2S6q+QXEcwLG3zv/z7HLiHbAo3GQ0WsiJV9xDZmHvcTazhoXs1Guvfyxu2ZWTRpmUa
 J1v5OKY6iWor7CV32/TFhx74ipIMcc/iUM6+TiOAjhwc5uqBOgq7x7pdn+K5MarPgy+K
 AycA==
X-Gm-Message-State: ACrzQf1bgGxXxBlpGbAU9zpk0PwPjM4CXAa5j2gpcIyxnQiSYYJkfDzo
 9ly43Eyx+dgb0XQUJfODNZAuW9PKQm0=
X-Google-Smtp-Source: AMsMyM7F9CjL0S7ulEimy4hGT2+Ru6A9xfeKq2IkRg7/qLKu8TZt05da+szMAhPaIOq1qCjWfmW1jw==
X-Received: by 2002:a5d:6d86:0:b0:236:77fd:94f with SMTP id
 l6-20020a5d6d86000000b0023677fd094fmr15119001wrs.389.1667390874524; 
 Wed, 02 Nov 2022 05:07:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003b435c41103sm2174874wmq.0.2022.11.02.05.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:07:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:07:51 +0100
Message-Id: <20221102120751.103984-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fm0ufNlwPcYl1FaMGOAlDYbVeSGKd/GBqpOBrp565OU=;
 b=VCTGQLZ7oeCELQvfQTXJornITbS6ujAjffBdZrbJj8YTy7ttZPsG6B5QGERdLGnJyE
 tHoggiPfsl7tVw6s5PEl2uW8WvkuqWv3wX48dL5nMkpvAw704m/6wkE3XnqS3LveJmgf
 i04QdUWeDv42lojc5bttsXBxNq0KiyRBwrB+/f7F2hkzCNZIirLopODZYeruyy906BvV
 7+9xwCrdX8PEW2gnKEU8ICVEnWPF3bN3nJK7Fuweenret1mHwwpGWpKEk6fq0nbVTvUV
 3lMsPgEW9t7PgKk8mKiEcNJGIc9aka8nkZfE0jniGrI6MxK51qKM0w+gRm0EsqskNaXb
 5jRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VCTGQLZ7
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix mips64 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following mips64 build failure raised since commit
0b389385666687ecfd09cdbce6c6ecfd74ce11ab:

makedumpfile.c: In function 'is_kvaddr':
makedumpfile.c:1613:39: error: 'KVBASE' undeclared (first use in this function)
  return (addr >= (unsigned long long)(KVBASE));
                                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../makedumpfile/0002-Handle-__mips64.patch   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/makedumpfile/0002-Handle-__mips64.patch

diff --git a/package/makedumpfile/0002-Handle-__mips64.patch b/package/makedumpfile/0002-Handle-__mips64.patch
new file mode 100644
index 0000000000..fd3fdbbb39
--- /dev/null
+++ b/package/makedumpfile/0002-Handle-__mips64.patch
@@ -0,0 +1,69 @@
+From a5779893ee087409b2d1fe391ead102defe0f00b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Nov 2022 13:00:00 +0100
+Subject: [PATCH] Handle __mips64
+
+Handle __mips64 as __mips64__ to avoid the following build failure:
+
+makedumpfile.c: In function 'is_kvaddr':
+makedumpfile.c:1613:39: error: 'KVBASE' undeclared (first use in this function)
+  return (addr >= (unsigned long long)(KVBASE));
+                                       ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/makedumpfile/makedumpfile/pull/11]
+---
+ arch/mips64.c  | 2 +-
+ makedumpfile.h | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/mips64.c b/arch/mips64.c
+index ab45b6e..fd987b0 100644
+--- a/arch/mips64.c
++++ b/arch/mips64.c
+@@ -16,7 +16,7 @@
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+-#ifdef __mips64__
++#if defined(__mips64__) || defined(__mips64)
+ 
+ #include "../print_info.h"
+ #include "../elf_info.h"
+diff --git a/makedumpfile.h b/makedumpfile.h
+index 70a1a91..3842f9c 100644
+--- a/makedumpfile.h
++++ b/makedumpfile.h
+@@ -963,7 +963,7 @@ typedef unsigned long pgd_t;
+ 
+ #endif          /* sparc64 */
+ 
+-#ifdef __mips64__ /* mips64 */
++#if defined(__mips64__) || defined(__mips64) /* mips64 */
+ #define KVBASE			PAGE_OFFSET
+ 
+ #ifndef _XKPHYS_START_ADDR
+@@ -1204,7 +1204,7 @@ unsigned long long vaddr_to_paddr_sparc64(unsigned long vaddr);
+ #define arch_crashkernel_mem_size()	stub_false()
+ #endif		/* sparc64 */
+ 
+-#ifdef __mips64__ /* mips64 */
++#if defined(__mips64__) || defined(__mips64) /* mips64 */
+ int get_phys_base_mips64(void);
+ int get_machdep_info_mips64(void);
+ int get_versiondep_info_mips64(void);
+@@ -2364,7 +2364,7 @@ int get_xen_info_ia64(void);
+ #define get_xen_info_arch(X) FALSE
+ #endif	/* sparc64 */
+ 
+-#ifdef __mips64__ /* mips64 */
++#if defined(__mips64__) || defined(__mips64) /* mips64 */
+ #define kvtop_xen(X)	FALSE
+ #define get_xen_basic_info_arch(X) FALSE
+ #define get_xen_info_arch(X) FALSE
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
