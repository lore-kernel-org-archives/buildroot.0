Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EED1C83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7999440003;
	Sun, 27 Aug 2023 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7999440003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbJj1cXrl7NJ; Sun, 27 Aug 2023 19:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D25BA405A2;
	Sun, 27 Aug 2023 19:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25BA405A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D581C1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC0E410D1
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 19:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC0E410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBmO-9SncERV for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 19:40:11 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA174409FD
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 19:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA174409FD
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-79266c8617eso92570539f.3
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 12:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693165209; x=1693770009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ikerNEZSU23Z6nekKQuwAo0VTZI/jYDWuA5fSuhwJ34=;
 b=I7WkILKJRJsJ8clq31d4JuWa5NgaEsr7GPD7io9QRykoMraM1ZhGLZi1V5bwNol3Jo
 QC2YuebTmAkCRb8one9nv4Rp4eO7OKeMq7n1/b2OAuciAcEv4dOn6kYP+B2MXTyF3b/V
 OsRLmUiNxeM4D50VABdZWu5NJowkfl6F1Awy9X27oQVIVlApb8MZK74Ze+scaOD9BMa3
 ArdgEZRpFJRWHDJuvW6YD3B3/0FymLlhM59QAAeluddNbPzqp7kivL47l0BXLoi3YYC1
 eNbEi9ozovJEeIvJYp+Iz6Ao6vKeNhCKmn1AI9vFihq7oj7YQL5Qxy4KFKo48Z/PbRQ7
 P7FA==
X-Gm-Message-State: AOJu0YyKQU9aXP/ouPX40Z9UkvZ/fGC0CyNRC0P0G7XQ2WzKvwPMWm7i
 xTrPBlNsnQuk9n3Z4R8NsEIyNVF9UyM=
X-Google-Smtp-Source: AGHT+IFXzLiu30ROjt15HI1VaEDnZW38X2rP4CbavXHyN9XOYra36IfxqfCbp6vB09UuHJfIG7SpYg==
X-Received: by 2002:a6b:5c17:0:b0:794:cb39:efb5 with SMTP id
 z23-20020a6b5c17000000b00794cb39efb5mr1609570ioh.3.1693165209563; 
 Sun, 27 Aug 2023 12:40:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 z20-20020a029f14000000b0042bb5a8e074sm1993776jal.8.2023.08.27.12.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 12:40:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 13:40:03 -0600
Message-Id: <20230827194003.3387773-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230827194003.3387773-1-james.hilliard1@gmail.com>
References: <20230827194003.3387773-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693165209; x=1693770009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ikerNEZSU23Z6nekKQuwAo0VTZI/jYDWuA5fSuhwJ34=;
 b=e/DbrXdOqtmGYaxQsIth2KKrEM4VnVAs2xpdnh2ybgI1XK/K2vLGVOYDKVyJyah97Z
 +S9AscFBHpus33DBh8xdRevb8CQZ9dah+qkixUjEIapcDzsbQKXPtQA9pnBPRM2eY7Pi
 NWpwtd5Yg1giZicvVpmTbgTDuzyw/rhfMpg45ni3y7t8GrFf7OU+5q+SUw8Y0hr+MNuB
 zJV11beF7y/TEdyuR5Bj0pFIlc83RtH/vIqcf59SjqA7EV4nfMiJnwVp5VAHxdl6IMq5
 7frTLI3Li5QqohY1DK3jC0bUjFaFl42K/Gb8N0ZjqG0XqgxdQIvKU33un5RLy1HA8jqm
 dM/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=e/DbrXdO
Subject: [Buildroot] [PATCH 2/2] package/qemu: add host-python-distlib
 dependency
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The qemu documentation recommends depending on this package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qemu/qemu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 84166958bb..4d2135a3c6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -26,6 +26,7 @@ QEMU_DEPENDENCIES = \
 	host-meson \
 	host-pkgconf \
 	host-python3 \
+	host-python-distlib \
 	libglib2 \
 	zlib
 
@@ -339,6 +340,7 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pixman \
 	host-pkgconf \
 	host-python3 \
+	host-python-distlib \
 	host-slirp \
 	host-zlib
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
