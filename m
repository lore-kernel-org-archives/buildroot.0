Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B2CC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382CA4021F;
	Wed, 19 Feb 2025 08:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AkikQCntCcq; Wed, 19 Feb 2025 08:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCDF404AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCDF404AF;
	Wed, 19 Feb 2025 08:51:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 950A2127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E85984D93
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dDJFYS1w0OL for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FA8180DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA8180DBB
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FA8180DBB
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f3ea6207cso2813830f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955050; x=1740559850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cjS4d4FQdmt1u4jdWAF0NEG68lfkNcvdBwXQsL+KhRs=;
 b=iwgNSwDBcuK/owyRGnQbaJqO6Z9g0eRewLS2r/Pj+I+b1vP7xg5mIqDAaIq+kxGXSS
 ZznfaY/b4i6hfPv2vpgcL3KhW7ttomHUkqMCtYMFI5yuGWjR1rz22AZNXLHlaVfYuRse
 Ma+swKVZCnl+a/NdutiB9/IFyJtGJqFiZ+3cUflwTx4iojN9TrwfXWFOh5p4kx8qzLNz
 47jjaMd/a2drn8QLTjOZXAVzI+P5LYkpmO9thxZUmZAZKlVNVI7OYgCWKFnkdfhkr0NW
 3vfXVYZ/IdM/q/ZkZDcbGzpIzqMWclQlALlg2lZSFLsHpUCSxdwTnggWouXLuWoTuqQV
 OO6Q==
X-Gm-Message-State: AOJu0YwYDyhpH43nAOSGxJOlHYqLEVcLJ5QMisXzE8nmtFK0KQ49alGO
 wr5tvwMB+RbgBBe3KhtAsjqXpJKTJv8hv2z+HJ5kOiXf6bTmeumRyOxsZA==
X-Gm-Gg: ASbGnctsLm/xnfhXcIxKCZ65LEe8kVkhEvEM+O1E0KGpNX+3d1nZApDuq9U1hMPZC4A
 i7zqU1PrB0izA5xRXIyrk441Q9E2mvo7DDmP19/r36D6tILI8ZWVrFUiYHSbXz4Ny8kubRFeU0Z
 hegwYJQPXcMdMqjbR0QWorNK7wywtWH+vCS4e/gM2OvMFi0RfiGDsFotU9PIif53JhDPlDsa8kB
 ZpUyzB3ARLlh/lcBBnU/VgHtINLWZlHe3b7ajYPt0cb/Oc9xgzjZ4u6OOXUf/QSDu8hlh8rt76x
 8FdZKHE7HUA7mHSeCSCNBLlxeA==
X-Google-Smtp-Source: AGHT+IGpgREJ55RSeFBiFAUoI1Rd/LqV3rjyJS7VefP6/NEXtTYBbeO8iJ4e1yXD0Pge3W6kiN8V7g==
X-Received: by 2002:a5d:6d05:0:b0:38d:e15e:17e1 with SMTP id
 ffacd0b85a97d-38f33f31faamr17547206f8f.10.1739955050166; 
 Wed, 19 Feb 2025 00:50:50 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:49 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:26 +0100
Message-ID: <2a47b5d2e079f736b8279f898801f90b27458596.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955050; x=1740559850; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjS4d4FQdmt1u4jdWAF0NEG68lfkNcvdBwXQsL+KhRs=;
 b=WIVeoddqDJkPhWFtSkPwI0OmXAbdvZ/0lcDBiKRLLONnEY6GrdxbHLyb6EaxdMf1Jt
 csEjS2VUrPFQp4iqk2PCoXt7lAqc7UEO52CZ8mqTpSKzTfn2JeX1C3N47eJ5ew3Vyyho
 BpXrCiyiN7S8vE5EnSE1LGZVLIIH04pLYmNZuOko1nqMm8P7eUDFXbOg0jio5E1vEkNU
 E/rhk79HHOiPmoauAdjUN3qrVN8rSR5J3IUCbP9a/+/NTJjrutiu55I20IP3JMwRsdHV
 ohyL7NZED0IdtghF+7VW6lZ//+oAVW+13HmQy4omkprFEhr9NmIlYhqfktuC4oNQ9/FT
 S4Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WIVeoddq
Subject: [Buildroot] [PATCH 11/27] package/boost: add host symbol
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

That will be necessary when we eventually add sub-options to drive the
features of the host variant. But first, we need to convert existing
host packages using host-boost, so let's got step by step and have them
select host-boost; this will be done in following commits, one package
at a time.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in.host       | 1 +
 package/boost/Config.in.host | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 package/boost/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index bf04f5fa97..3e6fef9e50 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -11,6 +11,7 @@ menu "Host utilities"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
 	source "package/bmap-writer/Config.in.host"
+	source "package/boost/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
new file mode 100644
index 0000000000..5ffcbe6932
--- /dev/null
+++ b/package/boost/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_BOOST
+	bool
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
