Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72297C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452D841E51;
	Sat,  4 May 2024 21:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBFkFS6DE4GA; Sat,  4 May 2024 21:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6269641E16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6269641E16;
	Sat,  4 May 2024 21:40:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A39C1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54B794154B
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eX_0WsuENtX for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 164E941558
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164E941558
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 164E941558
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:32 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b79451128so5386075e9.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858830; x=1715463630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ffJN8YmJhHh1K95mn0cDiZxD49CMlnsUVnEVnPE1kZ0=;
 b=WUwC+R/ZW036Z4Dg034KfS97n9UM0ciun/Hu/dIs2wysfA/WsSG0GxpL7xZN0a9I0k
 gjan0Z+XE/XHdPDmEB9/53MjvL7LogtEKWxouN+U7YqCgG/N5+QCb6HCSek55EAQfKXY
 CVxZwbmXa8K+4xroophxY8cTVX8HOfOP/HerPCElWLpQGBnj0JtBosmW5N1D05ycr8mc
 6y32M1FMuCv+2Uz1qiKGj6Tod9ggcZKKg3pMPHsU/sLoqb301fBplAFEqAoTXUAoiC6C
 PxJUn8Srq9tn6XtGJJRembwYoBnlOlo1Ui2AW0qdhCHT8/YlL0tcAUIDTut9b3NVUdTS
 S5/Q==
X-Gm-Message-State: AOJu0YzN4YmZZnttrv372Dq7Zsw6mcsKYCE+db8yOJyekGwP683aCUfT
 PE0pSnEaz05nzbxDOl2CyFB/Pn5JyqocAJxGxJPnRtMEBA/Ts03imIjXSA==
X-Google-Smtp-Source: AGHT+IGzpKrOFbkMn1Cyi+YWUTfKDnauUJbkOMCKA4kjzS3YUYKJg+q23MorMQ1pTUxZFjEnzRaFjg==
X-Received: by 2002:a05:600c:154c:b0:41a:5958:d6ac with SMTP id
 f12-20020a05600c154c00b0041a5958d6acmr4566323wmg.21.1714858830321; 
 Sat, 04 May 2024 14:40:30 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:10 +0200
Message-ID: <91f50705b070bbd13a2e605de0ab47413accb3d5.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858830; x=1715463630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffJN8YmJhHh1K95mn0cDiZxD49CMlnsUVnEVnPE1kZ0=;
 b=d2/v6PvbdKWEmBjHYzVHnmFgTmY+pQkvnzLUP4My88PNVfAfy0RJ6705Da4Tkonn3w
 oEMM8/uPI4mRdEN5bsjxtOYl7K1AmCcqRCdf9XNDM9l4A9Cf2MfAzzAj6LqKgw0853fA
 kElCULlmEvg37C3HOnINLNjkpmzl8egsBmm9DksWIS5+NkDsljvo4/ReFBPSKzfQQyhe
 tFIgBgnb9JxVm8BNyqRC6CRUl3HFpyvytelpc5PVxLzA932+GkHevT5J3e/qIB8RwMiO
 dYRuYdF1p9lmZRvdYWgkWFJxdwwmePa837J39uqzZ+QiNOeUIcO5vAtzuKCnKFBvQeg0
 l4DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d2/v6Pvb
Subject: [Buildroot] [PATCH 09/22 v3] docs/manual: document git backend
 handling of export-subst attribute
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the changes about export-subst in the git backend, to the migrating
section of the manual.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: slightly extend the message, add sed command to update hash
files]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/migrating.adoc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index c0f89cbf07..a6385260a6 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -123,3 +123,13 @@ LIBFOO_PRE_PATCH_HOOKS += LIBFOO_ARCH_PATCHES
 
 Note that no package in Buildroot has architecture-specific patches, and
 that such patches will most probably not be accepted.
+
+[[migrating-git-attributes]]
+=== Migrating to 2024.05
+
+The git download backend now properly expands the `export-subst`
+https://git-scm.com/docs/gitattributes[git attribute] when generating
+archives. Because of this, the archive version suffix has been updated,
+to +-br2+, so the hash files must be updated accordingly. Since
+`export-subst` is usually not used, the hash itself usually doesn't change,
+so the update can be done with `sed -r -i e 's/-br1/-br2/'`.
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
