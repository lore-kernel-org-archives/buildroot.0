Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD0C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263B460E98;
	Fri, 19 Jul 2024 06:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hr-5f1-MTh6C; Fri, 19 Jul 2024 06:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C4560E8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C4560E8C;
	Fri, 19 Jul 2024 06:32:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 740171BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 626DA81F61
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbVuipX0XQjp for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C0A681F59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C0A681F59
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C0A681F59
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:32:41 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7f99d50c1a6so65813639f.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 23:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721370760; x=1721975560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq13bZ0Y1S8jp0UKkTtwUdk20wWwoM4SMufaQ5TxoqE=;
 b=mbrLZ65Q9oExi2T47cova/RBt4uUirldmG6YNnrTFGh3NIPCVff3iKVkFt4xFEkuwE
 1IZglAt7z7rcz5W1t0dUf4VQs8YBIKwuEpBJUJ7ea6mISIXt8jI+utTYPrCIwsj6osPF
 05d/TBymiiC+ngWDKBluxG9+lxAQqWfB+ia1Ucy9W0VAGyRObTDS0LMa9lasS6uUU+d2
 tPT+QDq1on6OnF5koX/XCjrhnsvcYUuLHp2tcRzwFZiQrjSIVYZnQNV7HJNZWAGefeFE
 Sbe7Z5dlkOESu3rwWyUjIKQvFv+Lk3op0qfx6bP+6irYeoG376qRQ7e27WO3O47EHK2C
 MD/w==
X-Gm-Message-State: AOJu0YytN/TP0WYgl+rgA/kBtDW/xs3YAL8U0K+8RixCIvKBaBtVtjse
 lFwT++kg8TPXkNK3r1h/Uu6NnprPpvGKEkzJzpQUnP06h0SPyPV9R48LQQ==
X-Google-Smtp-Source: AGHT+IEMxQ0U98FPWeaKSn5DshnoYlLjV3uqjbgOOt9McKuiGc3UlWbqF9qTR8Mn0UKIAOoNlXQ44Q==
X-Received: by 2002:a05:6602:6422:b0:7f6:76f2:e359 with SMTP id
 ca18e2360f4ac-81710040e70mr1040124039f.4.1721370760270; 
 Thu, 18 Jul 2024 23:32:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-819ac79ab26sm29587239f.22.2024.07.18.23.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 23:32:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 00:32:31 -0600
Message-Id: <20240719063235.3823015-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719063235.3823015-1-james.hilliard1@gmail.com>
References: <20240719063235.3823015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721370760; x=1721975560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pq13bZ0Y1S8jp0UKkTtwUdk20wWwoM4SMufaQ5TxoqE=;
 b=UnU2nsPEe2gbGliboihPUPc8oFh7GHaoSCorQByuVF5rg0kwQg2Gpm+Xh/a5PkY6FY
 GoK+7Gz06xW6nIsnerf+bLSB+UHQdfWocf0nf/2euhcLNX2u62owif7cj/6KBAbQxifW
 tDTImQC6zwhuse50H1VQ7jlR3GOw7KTNaoaC4oZmc630uzBMMJbskM9ev9j9Onhe4Ukf
 DoEzkZAxcSiI1NuV08nVurrrzcEvLnM7VSRJyjv7UVKS8rqvrhEC7CZjJ1n7Xg1cb5Jy
 Ljz9bii9xF1jhagYwJigSaW9F5pmD7b3/qzoOYmpfqaLhpWIG11hcj+I1I47iXGy73eD
 RfXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UnU2nsPE
Subject: [Buildroot] [PATCH v4 2/6] package/python-cbor2: enable host build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required for the upcoming python-uswid package.

Disable c extensions for host package to speed up build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 5040301867..423670047e 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -12,5 +12,8 @@ PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
+HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=0
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
