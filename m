Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B475C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 04:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D2C5404F4;
	Tue,  6 Dec 2022 04:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D2C5404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ejJ79JEkGfG; Tue,  6 Dec 2022 04:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B3F74056B;
	Tue,  6 Dec 2022 04:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B3F74056B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCFF51BF358
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B822B403D6
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B822B403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jP-Z9edOVru9 for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 04:45:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1874240385
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1874240385
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 04:45:49 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d123so3589305iof.6
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 20:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0PQkyc2h6Z7eqoKBQBjkLxwxXC+5guxpf/HPVe9M0lY=;
 b=rzi1X1k6/NKr9hI1+WThCCThxXVmhy5C5zsIW+iK3ZfmJ1DDu3pdPbPBC28SPVbAvQ
 IeM41bEuJHNWX5nwHnI/Sl7zSpyVX5xvIHAzVM57HErVafvrykecnvuM7LAc6cc+FnI8
 WwVTNnesbQ26SpKNWEMCCPnE82WXt5FUv9MEPKcpTI0SgQMBhXuzwJuZITw5/JpLZMdv
 lzTr8kOWLP7KbZPdGnouKf/Fn14CPu+/nNOrNDpj4/KR2AdXjvbqeIFTPTCU+jwwAFKN
 2vgwcX0IpKRhBy2oQe7gxolwlC/JIjA/kQ06/7bxGXr2JNPhD7hfndGFuI3cmN6FEBCf
 qDhA==
X-Gm-Message-State: ANoB5pk+8TUlGLISX3yo6GwB+eeAu/wt4viJsfNhVG5aDZbIvjsSM+SX
 UUW8edwbT1irzWbF7VIJOkPSuNLvDyVS5970
X-Google-Smtp-Source: AA0mqf6XkCFIGVUz9L+TZEz6kn/6i2XOVn5VUeh7d9XYCQgTLpa8viZPDLN+RlDa9l9ZUGIcWE9IGg==
X-Received: by 2002:a6b:7903:0:b0:6cb:4c03:6d6e with SMTP id
 i3-20020a6b7903000000b006cb4c036d6emr29911036iop.168.1670301949028; 
 Mon, 05 Dec 2022 20:45:49 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x11-20020a02340b000000b00389eb7a0766sm6466760jae.23.2022.12.05.20.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:45:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 21:45:45 -0700
Message-Id: <20221206044545.2812061-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0PQkyc2h6Z7eqoKBQBjkLxwxXC+5guxpf/HPVe9M0lY=;
 b=bBY2l4DZYBDJyIGALZ7BHdU+t6Evcvfmk+ffh/0cXQiLdecoqtmXyPfhNOPYtaHQSm
 IosdhmWwVd6kVWR87WhSJ0loObCnKQ9WrQEFShaftaF+OIBn3ys+ngv5hguH/eXb6IVq
 2uifOO3YIeJizEL1zy3U7+ytaYDeTeBnMVs1r4QUhECsngACx2FM5gDKCwBP3wKoPTs/
 /vly4JDghktgRzYyk1gqrWYFC6Eljf4cVRPwLJToBMJ2PpG9BeLVx6Ph0QoqrtmOlPd4
 SiYJdWbjrPKYGZPdXvrAILBNkOwU7gWHkaBoeRWvQZBQKbsvSguvlRdvWayFFG1zZDf8
 HmxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bBY2l4DZ
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: drop
 host-python-tomli dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index ab87df3842..3dedfdce11 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -12,7 +12,6 @@ PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
 HOST_PYTHON_MATURIN_DEPENDENCIES = \
 	host-python-setuptools-rust \
-	host-python-tomli \
 	host-rustc
 HOST_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_CARGO_ENV) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
