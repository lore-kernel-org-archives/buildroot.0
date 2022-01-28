Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0931C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30DF60D4F;
	Fri, 28 Jan 2022 20:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3LDhJLrlZgw; Fri, 28 Jan 2022 20:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AAC60D4D;
	Fri, 28 Jan 2022 20:54:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7FD81BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96725818B5
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZUEHy5a74Dq for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:53:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FF7C8146E
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:53:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l25so13054521wrb.13
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QEti+7fuBlKcJaXsIU8QyvKoQtiXY7nhcY6kap/Eo8=;
 b=jmEyv1pKzH+qEI277DsfZyquAQERfprhWYkSTIqTTcxmL4Cw/YwaFHMoNO7a0BffR0
 Ro9zV0fRcNn8jl+6Vaz4++9XKieGOGqNeWnhdwnKiAWDZ5Mlm31MOpnAQxmHGb8D6SSC
 Sn2YLmpGk60tJbWVWMwtNI54AES/JoiVAhFxnmjJWg2d2UYevvFQkX5ZYtmQ+YdgQAKe
 enzdnntibK1IZvxF9zsnUc92I8yAnVv1V/UBLceEWMRJD3OWKe0iiT+1xB9xlAbRsKDi
 C+02IHCBzVE/cZPjtSXXhlRLtgjMuTwWunH5ocCJv5FDx6dF0U7JB3mNdDKKOPPax+fX
 PD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QEti+7fuBlKcJaXsIU8QyvKoQtiXY7nhcY6kap/Eo8=;
 b=QZ781NtR9B/wpZ1hQKGSViRfKfGuJvvxCsdKFH/gQhDHLHYLG4NCTcUvJzg0xtx539
 QLiI+9ODiySPyVpg0klrVIC8aOnTBg4LL3pOFyBbp7TwR87AguDs7SiWn1yiZ6B0OWaE
 lwjvk+uxIWSkwHqBrW5W0MpX0tN8pKOplBvqj2K/DXPXaJ4Mw3oqYn+cqZVgehZby3Dt
 Af4m1IddsZfyhPygjE0h64mIpZZVN6XpN9r7YwpjdKXQ8pc2wHYCBAsvKJZZ9fscRUHE
 fKgEevDuuDJUipNg8KlPnD2dUdQ1BPCmchNFczfeJLDnWSdXpIyD96ZZVhvp2gKUr0Ev
 TErg==
X-Gm-Message-State: AOAM532Q2b0hrqLL11QeA2sWVkiORfLDq/wr6jAgr/If/9juSHg+4CRn
 jfYVJKjzhOUV5HaXBn1JuKMriU+nSYc=
X-Google-Smtp-Source: ABdhPJxLVFUDXpltBQQOH3QUqqJCaS1Rqucj8L5PqqqevGBuBbF6yVs/DzmMUYJcKxlKXblbEC3QBg==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr8778274wru.58.1643403235641; 
 Fri, 28 Jan 2022 12:53:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s9sm5337243wrr.84.2022.01.28.12.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 12:53:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:52:01 +0100
Message-Id: <20220128205201.2798205-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
References: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libglvnd: bump to version 1.4.0
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of README.md (extra paragraph removed with
  https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/a7bb6f4d19d1258d83c8800af885936a243e07bb)
- Update hash of uthash license (year updated with
  https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/b3a958feb03694e2f0df71482875684e45353964)

https://gitlab.freedesktop.org/glvnd/libglvnd/-/tags/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglvnd/libglvnd.hash | 6 +++---
 package/libglvnd/libglvnd.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
index 15e76ea9e8..e463a8def5 100644
--- a/package/libglvnd/libglvnd.hash
+++ b/package/libglvnd/libglvnd.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256  6332c27f4c792b09a3eb1d7ae18c2d6ff6a0acaf3a746489caf859e659fca2f7  libglvnd-v1.3.2.tar.gz
+sha256  c4a884503d2412dc1fa209613aa8a77193aeb7065b823fe1775dc8b6f3e45211  libglvnd-1.4.0.tar.gz
 
 # Locally computed hashes for license files
-sha256  224534547628a9e5e889d8808385bd38839e6bdb77d89c90ac04dad6891a4f5f  README.md
-sha256  bebdc0fd27cd37af8406e47af23c113866b7856c3f7349ffcbc672029ec8acf7  src/util/uthash/LICENSE
+sha256  f84a3eca98cc5bdf5318741124c38c5e877f856df8c7e229ee5065e5c61038c2  README.md
+sha256  e9b9aac8421b6d29176c6f23f6f7a907194245e35ef99ace10839734961cfaa2  src/util/uthash/LICENSE
 sha256  f6f207863675ca5a5128fd120b9aef4f4bbab73ffa57e5f771ccffc8e3cc56b7  src/util/cJSON/LICENSE
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
index 3df609f6eb..4149e8b1e6 100644
--- a/package/libglvnd/libglvnd.mk
+++ b/package/libglvnd/libglvnd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBGLVND_VERSION = 1.3.2
-LIBGLVND_SOURCE = libglvnd-v$(LIBGLVND_VERSION).tar.gz
-LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v$(LIBGLVND_VERSION)
+LIBGLVND_VERSION = 1.4.0
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/uploads/ca5bf4295beb39bb324f692c481ac8a1
 
 LIBGLVND_LICENSE = \
 	libglvnd license, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
