Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE42AC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 15:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60C2360F42
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 15:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60C2360F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BBB661538;
	Fri, 27 Aug 2021 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUuBkZMPg61i; Fri, 27 Aug 2021 15:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40AD06155A;
	Fri, 27 Aug 2021 15:58:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 710E51BF2FD
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 15:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FAF940289
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 15:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_PaIaiaq3Le for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 15:58:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB4F40161
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 15:58:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g18so3638103wrc.11
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qoOwBD/PVSm5o/CYQjO51+8Sj5/NH/hZgcNsAxPG/3I=;
 b=QR57AK/W10dvwH7StVWEMcxdbpRuFCmngLa5wDDdDpTSnzxExyUq/U5NGEDTX/hxXY
 yntlB2JBEW5jvnsDVR6e5xSvz4+D3u0uMhsmyKWDpu8XEJcIGIV7ysXRveqRztyY7+Aa
 lMf1EB9tHz3Mv2TX9nnm1DNmFXwudAxNvVkW9C5+UHcT0ErlmtpBriuM72Z3h4lPgh7E
 eGfh5wT3+V2Z/kq/hMju2M9lclUt+OGF20HQVy2lRa8nYcyXr0I3gO9d3F4r1EWvw3ij
 AhUM7QetfEjELfPZ6DIP9GpuSK1QrQ9bZ8tP+Dz98yLQ4HGs96ny7piJ0o1YkysR0rrS
 /8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qoOwBD/PVSm5o/CYQjO51+8Sj5/NH/hZgcNsAxPG/3I=;
 b=RX7fBZPFaZTE3Kotbrqx9M/uFPSfd4gf0HVcRLkEkBaE9zM7h2bvcV/QBIGfxpojE9
 6+Dva3qSE9V8ictaXQYuyWMuvl6eN8kC6kFYSqo3Zettm6jhaNobmzpI4mZarIYkk/dU
 QdPdpBaXhTO/nm2ggOHRI9W8lOYA1atlgbH3249RiwMN9ENos7bw/6M8aUDVxzIEb08W
 CglmFR/ZF3AEJthPdRgYgviv/N6xtdIWHs8Y7hFAxIimxNmwFUiCjJS/9BB7K7DMB2DW
 4ZhRg/c1yzi6Y59CN2XDZU5mmA8ZIDyIhXHcTgBTEQkhkwbz8qwM2DkkBpnmUk9Iswb1
 jXCg==
X-Gm-Message-State: AOAM530G0BOLy6M43QrVC+xqhirY0u0NsZN0N53W7KoaxagMCviz4lf9
 0N9ctJ1A5jTKtxsHRrH6mHQ5mZ2bUKYVFw==
X-Google-Smtp-Source: ABdhPJzSI/oS9m5iXrd/2Clvzz8k2Tl+eBcPr9+0v0ttmHxBxGTbSWVwLMsCWSfbTqcxPQTy8aPxpA==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr11408555wrc.246.1630079897933; 
 Fri, 27 Aug 2021 08:58:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id w14sm6514589wrt.23.2021.08.27.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 08:58:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 17:58:05 +0200
Message-Id: <20210827155805.1998314-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: disable fuse-lseek on
 uclibc-ng
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on uclibc-ng raised since bump to
version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9:

../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/qemu.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0bd3eafadd..70cf441c9b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -94,11 +94,11 @@ endif
 ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
 QEMU_OPTS += --enable-fuse
 QEMU_DEPENDENCIES += libfuse3
-# musl does not support SEEK_HOLE/SEEK_DATA
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-QEMU_OPTS += --disable-fuse-lseek
-else
+# musl and uclibc-ng don't support SEEK_HOLE/SEEK_DATA
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 QEMU_OPTS += --enable-fuse-lseek
+else
+QEMU_OPTS += --disable-fuse-lseek
 endif
 else
 QEMU_OPTS += --disable-fuse --disable-fuse-lseek
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
