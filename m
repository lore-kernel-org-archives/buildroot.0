Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E1CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2EA760FCD;
	Wed,  6 May 2026 22:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy1qtseL7WHR; Wed,  6 May 2026 22:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E6160FE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106869;
	bh=HpHsm1PILuSmCkg0d5gJFl/7wlPa3GX2h/iHul6tDKs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Gwa2SXzg2tQbl7G3md3+8sEYriXoTphxpYKbZ2ih7i8BrKXYx1k6mCrcTDByaVwcv
	 j3fj4K9sS+y3rEoRDgHwQrz8n3MIFRjJQiUBKeYBAeqtl2KJJRGmHSGAQtOLaNb1v+
	 VWof4Ye0IwwmMBrZLTxRUr51E1qZY0iykQQARubWhI6oTl2j/ajSu9Rs8iHkdlAfQf
	 TSf/l2RrHskX1dQwaOVikRBdn7ndL3VthDB/4UDrLBIWGhAFUw7i5zMXFdC2MauLah
	 pwnGRIAwP8GTZqcnVU64PElI14JdD6brvOVXyzNBR4y0sIe9jaPOOD1xDrUTC03Yuy
	 35iX9Oh7BlQ/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E6160FE1;
	Wed,  6 May 2026 22:34:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 120A6280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 786A741053
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PY875a6cYr6C for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AC204001F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC204001F
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AC204001F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:22 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7dcd9061b1aso196644a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106861; x=1778711661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B5yBTkPoB6a907jDJjoaKV8uuQMBM3aQz9vdSaurBKI=;
 b=MUZOswU15JyF+q84AG0Hffgk2RN4eq0jRtcEwE5D+e8Fc5idNv2WibpOGutWBUrudd
 niYmBK8J8mQCNhI3ic0tdPwxWAp/pxlKmBNVnlgXoCjzIIMkzoqZQR6SFFfL8yNpHQQq
 TUZPvAeUd26QKUwSpmS58q5qy/mj436k/GPcn26jNJmMYVOBj/qkviUq4s1H1s5oiupN
 lXCdFj69nSGLIzV/flR+Uh4Bq3mUyAxkk4mveHPjdLs2jmjpwEOeHwD5NA5HJ5OxZRvO
 HF5t/1pRmEJIGa4nUrj2M49reaDI6/Iv3OHinq6qZcbNu60hY1hOkJeVCLZesml7LNV5
 YHjg==
X-Gm-Message-State: AOJu0YzVT36YGj3CJcTnTqFQlnSr90taQlfb4vpvU4i34RH+2El0cH2q
 Qi9B3QhWKetAJFWSz7rLtMpMrHhYb9/uemiilvVCnQCVL/E3AVJvnF6TsY/+H639
X-Gm-Gg: AeBDieurE/MAvNI5JAPRRi6iBv8JmefvuewBEEfjX+tEm+YaGsvn/nPm0I42mb88kFA
 zTTWJH4+5UaemkZdQkecZEWITZ4LSGXIPTnSs+T+3yvbglGEC93C4qsw4clA4/guSciMRz4wYBn
 bUct8GmdyO9GbufEF+AtPWi9h1avsdPK3ydCefqVQHEJlin0JX78E4PgcLdlVeX1ndRrLo/LoMR
 qylKxKYB86no9ro87r+Kv2+/E2pYiQ+jaxbNpCSjXHjX1ccp+ElVhCpX/IhlWvRNqoMWm7ngCCT
 8uqEPYkXIR6vwI/8lWvYTN9K+pUPMePYd/H1NcNZHfj8yJQupgwve8O1zl35UOBLjju3zYSg14a
 /oVTtwaUGPJYt9I5YnvARTk55fPXCp65t+BRgUiKX2NsIvsAnoEjPDUWn6j6KuI4BXvOQaKYJzz
 jGtdV/IqMe8emrL8GkaVvLZ1Ghk9eAggNv2bogtEtp7vG64lvL6e1DnNyOzSFN8HH0UZGnvBM2Q
 bj5JekT2UrIlU9Q9a2OXWE4v21n3dUQMjv6r2wDljwFW6Qgng5K7MYd/8GITX/JTpSJOE8sV2zi
 r1Scqb0=
X-Received: by 2002:a05:6830:64c9:b0:7d9:f50f:9691 with SMTP id
 46e09a7af769-7e1dea9d032mr2998371a34.0.1778106861184; 
 Wed, 06 May 2026 15:34:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:33 -0600
Message-ID: <20260506223341.1759760-32-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106861; x=1778711661; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5yBTkPoB6a907jDJjoaKV8uuQMBM3aQz9vdSaurBKI=;
 b=Ta5EXBaK+uqMb6Nskq6mHPXhHDQ0BHSW0PN+g+bWxS82q2Fh1bpUF+qLZCC9szrrT1
 J7wixTO5RHfznSaHUeY7jefJHTNou5aWDAtpnERvWn6hptwth3gvkjRjPYgxm5AOJ4CZ
 S6DQQHWVT47tuvZLbqjzbojoYD/HoHYHIjBfrwCcXINdW5WT3cxZKfV5+uwGMQ9PK7L4
 iJVEhyj/NkmN3utqe8yDE7yHF1WgEbA5Gd7wkGXAtD84vOENaGjBpvZwxkD75vbYZAjC
 SaG2zn/xEELDO+cPdKn+PzEt14gNg+n1oaS3b2AOybjOtd63z8jEyMpp6WUdeorTlgF9
 ZjiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ta5EXBaK
Subject: [Buildroot] [PATCH 32/40] package/ti-uim: preserve /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ti-uim/ti-uim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index 8b1678f6b1..aac82581d8 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -14,7 +14,7 @@ define TI_UIM_BUILD_CMDS
 endef
 
 define TI_UIM_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/uim \
+	$(INSTALL) -m 0755 $(@D)/uim \
 		$(TARGET_DIR)/usr/sbin/uim
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
