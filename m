Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151F5C44534
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C52040821;
	Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbDqN6n_4-lX; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E264086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626787;
	bh=kgsV1h+Ch/11AT6WvbHj5B073eGzT/oEJvaJkewNzGE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WX6OBTUlr9fnossBxvUNMyhsSGTwv7D/wg18vN3M/PnlVu3mJaPQsjhkUsFcx4Woy
	 s+/gZYOmoLnFcVALCA+j22B22IDlhS5cXcMt2CFEOcQ39WRK9IyWRrxhUPwWDES/bK
	 O30JRDU4FWnN3blHo4e0JC/A5jw/5TKsfYoOioS/4Cv1bG1NNUZniRQq9btkfWlZxQ
	 uIFxTFzXLZMBXkDfYQcJ/lJTJAiaemizJj8/8Rz1uhKrhcQyvICoG/2GF9LMO1Pusa
	 hNHJS8T/xvc6tBeWEObq5YbuRFRPnS5eU86UFW2Jf9o7+TWIKVIuKdbtm1Dm8IS5Mx
	 iZSJFEaxZZiMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E264086E;
	Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8446096C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B60280BE6
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWt_A5f1XMgS for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F42080B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F42080B84
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F42080B84
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4954d383e64so21135445e9.1
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626782; x=1785231582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hZJyZVvf/0fJsUj/BoEomJ5QCF86q/g09lSF7BAn0aQ=;
 b=Cha3a1qIqHRi7/WmvUZracKgVOMAMkhjW9OvBDLKP2H6gNNoamp2SmrjS9Vl/x5aF2
 SunQXXYIrDIWBKswhxSY5nFL7JZccJ6T7c7+SLhoU9xJG7XXrW34fFNJGWltIEcf/cSk
 DdAEQQsOYRCn/nodoRBtIP36Abjv7fTXLMEr7BkoIjacRE4Ia3ADb4XyG1CCwiF9bvIM
 wPHdYBoas38UepRaRzpXxBmtoihVCAihnG8/YwXf+/SU54OdR7IqltkafTPBaEJ4TJgh
 yQfw8u9TCBo9AzBnJjV4bdvLuf8XRX41e8ribmuDPjZLBAhuKbykAVN3Y0dNINva+BMT
 2ZLw==
X-Gm-Message-State: AOJu0YyuSkY7nre9Ba2XFZAZV0OclPlLtaYoeqO/ljq8Wzg1mvXwYrVV
 XnW8p+mM3JVvKLHl0ky8+42kqhA6BRlKQQwtMikznH8j41ptZ4Jz2UgkeHYUwg==
X-Gm-Gg: AfdE7cmGkvZhhiFBNx0cY9vREmTvEI1gJxfZz2pRkX+ZHsSmE/kNbRQ98Jt5vvjfniR
 hMjWP9BEYlWpOqlw5QsahrBxvNI+UBLXdlLfp2GMY56hg9vfVZlkuBl4G6qd07jcI3KS3Q83WSe
 xkJ98Q4i6umLzgak4YtOIJ/5Uw/R3PGhNDfvjP2Czy6ideFlGrJ7F7adZEi2aJMIPTgTctEdPr8
 ttMHYmEo37sPmm6oy0G8rgTa8gDNOozKemqf1NgRMD3GytmiwP/xKA3ljIBjVtcy8mSakN1O/sl
 tAjfkJuB7NY8q89oCf5nKXhfM5H6eTEyg+XrucXUnKZZGkJPM4ss8Z1WSicrLZOsMGU5YGrYP6x
 TI5ave71hVW0x9AOdOv22UaCrFn/lI5wxVL8Alfo32Ma6qdG5wGYL6i0n7wYtRYnn/XZMQzoqvc
 Ip1HucpN/q49Q+KFFqQXWUJiVv+msFBFIFuA==
X-Received: by 2002:a05:600c:1d15:b0:493:f6e6:ce2a with SMTP id
 5b1f17b1804b1-4954a3e720cmr204806295e9.2.1784626782191; 
 Tue, 21 Jul 2026 02:39:42 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:41 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:25 +0200
Message-ID: <20260721093932.282565-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626782; x=1785231582; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hZJyZVvf/0fJsUj/BoEomJ5QCF86q/g09lSF7BAn0aQ=;
 b=k6fxRKNRZoKNWxErwoeL+D79v+WMuMvaEa29S9QmEbJn2Ph1tiTj9rxJfGN0B9As0H
 3Ovb1Efc6mxO8X5DFQR+e0WGlcbXK3ncQuS00VZZcSX0TiqQp6C59NoLg+eLHJrhEEmE
 wb3/LxZqJUFWsv+BC/NjF4AWnq1lpyuI+N2gt/4JTi7Z6mgis7+oT8U5fxs9ZCBVU+UO
 Nj8Eiu23YGq8VLLpcpQCpQWIGreF3t6nJ9xdT7Frty0NI+4uF/TLXt/npN6ha6Rk0+MD
 RpUO7HRcCuEUnCckRHC8E7Dk8ckr8PUaHBMALFSb3IiiXcp6pJ3zwCsQznCYamqWkWGC
 IXnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=k6fxRKNR
Subject: [Buildroot] [PATCH v3 1/8] package/qbe: new host package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS           |  1 +
 package/qbe/qbe.hash |  5 +++++
 package/qbe/qbe.mk   | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/qbe/qbe.hash
 create mode 100644 package/qbe/qbe.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3530d515a..23c95db6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1177,6 +1177,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/janet/
+F:	package/qbe/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/linenoise/
diff --git a/package/qbe/qbe.hash b/package/qbe/qbe.hash
new file mode 100644
index 000000000..2250c493a
--- /dev/null
+++ b/package/qbe/qbe.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://c9x.me/compile/releases.html
+sha256  a6d50eb952525a234bf76ba151861f73b7a382ac952d985f2b9af1df5368225d  qbe-1.2.tar.xz
+
+# Locally computed
+sha256  2b026a9038be00b1102da922775ffea4857ea755f63694efc36dcbcbdebf23d6  LICENSE
diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
new file mode 100644
index 000000000..a6e3e4d57
--- /dev/null
+++ b/package/qbe/qbe.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qbe
+#
+################################################################################
+
+QBE_VERSION = 1.2
+QBE_SITE = https://c9x.me/compile/release
+QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
+QBE_LICENSE = MIT
+QBE_LICENSE_FILES = LICENSE
+
+define HOST_QBE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QBE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
