Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1EBC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 06:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D398C60637;
	Tue, 20 Aug 2024 06:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AogqTiDtGy5; Tue, 20 Aug 2024 06:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF24606FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF24606FA;
	Tue, 20 Aug 2024 06:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468941BF350
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 06:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34AF1607B9
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 06:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZsZ6ZvRa6Zv for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 06:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08F5060637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F5060637
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08F5060637
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 06:45:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3719f0758c6so1934583f8f.1
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 23:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724136332; x=1724741132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OiPtn2OZfzjlYVQEhJm25EStlZgoy7bG6XQmqziqLsw=;
 b=VNdwpZSvwGqDSvlX/NAt7kdvlpwTy7RcWE7sp5oLF3dE8rCaizU9N99FJPlotRh9wB
 4biiNHh7SwbPpg+72cgwo+3qG39UIEg5J26ljFQkkWiswvlES5S+1aShsDmUiUDBm0VD
 6M4SN3xNcQWZkT+q3zHve5VaSJZD7Znck8l7xcgRbCfz0/KjZIKonG+N7FTxLKdqGJpQ
 PRR5LT9aMMQzFDBmIPaBkt9ThAZmBQoOh/e1I4qde4ifSdpk4p2PtiUOTjIhf/LAZ+2U
 zGRTxGddk9u2n+tRQefbiIy6C/2MT70j2NOy4rSamS8Q6fblumRvAO5xDmN2XFNNNgUN
 d/EQ==
X-Gm-Message-State: AOJu0Yyz7vHgGRby6YAUQOJzbL4vjVV2mKt2O8FEEWy1/FAQBqsQU8Us
 r/Y7/ij0JU+TdWb1xPUWKvE7eZubQH+PQz1XhLrxLB2uOimXyDFhYKUzSA==
X-Google-Smtp-Source: AGHT+IER1FMCJzMGn0vYGEjISPRYNeaoivASOl8/YH70mqzxMdKGegMnK9L8ZbLA/iHSMrQjHBhW5w==
X-Received: by 2002:adf:f4c8:0:b0:371:87d4:8f12 with SMTP id
 ffacd0b85a97d-371c5fbbd8emr715296f8f.17.1724136332173; 
 Mon, 19 Aug 2024 23:45:32 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189897008sm12263506f8f.84.2024.08.19.23.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 23:45:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 08:45:31 +0200
Message-ID: <20240820064531.3680998-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724136332; x=1724741132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OiPtn2OZfzjlYVQEhJm25EStlZgoy7bG6XQmqziqLsw=;
 b=NFNWvCy2EU0UhKKMxhGI+hKr9kf2n3EpcfL5UU/vyPzRdJKEYS4D2KReSVYwRz9PLX
 xTZgCg5yRNuzcKt1hNRBJO+T31QAy/UXtNKGG+TP0q7r9EMEGAxYa6yJjxtNyr11CagV
 tM8x49JG9WlhxM1XLl4vwMcikK46QBOqRAbyKHX5RmcpzY1AXDuOkrjB8xOzVJGcoCBt
 vvCRk8YLmTsDAb1bAvWekkv/mgmTRIBbiBPlK0ufnXIsyITB5+BXJrJf1Zif/RqufCM4
 0s3s7NsxFvuI6irl987sUM/f2wgMod2d2BNAkdU8BBiOhccAXXgH6cGoXm28+iRq8bAn
 dRlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NFNWvCy2
Subject: [Buildroot] [PATCH] utils/genrandconfig: fix fallout of dropping
 toolchain CSV
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2f260084d577 (utils/genrandconfig: remove support for toolchain
CSV) kept the --no-toolchains-csv option, but in the rework forgot to
keep it as a bool, while argparse default is to expect a string.

Rather than re-introduce the action="store_true" which implies the
argument is a bool, explicit make it a bool.

Fixes: 2f260084d5771728f3340ff6a86a23391133a635

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 8e60fd3f9e..ae1f0f85de 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -611,7 +611,7 @@ if __name__ == '__main__':
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
     parser.add_argument("--toolchains-csv", help="Legacy, unused", type=str)
-    parser.add_argument("--no-toolchains-csv", help="Legacy, unused")
+    parser.add_argument("--no-toolchains-csv", help="Legacy, unused", type=bool)
 
     args = parser.parse_args()
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
