Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B108CD6E69
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF426173A;
	Wed,  3 Jun 2026 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3MaSx7_LrvE; Wed,  3 Jun 2026 17:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7393561732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780508711;
	bh=HPDPpaZ0zp5ja4eSini+WinPT1p93l58/5jxpEThTK4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=O+o4LIRUxAvWfiBL+lNSwlklrtcb3lRbVtZfvrlVPo/cqDOoRViqn/N1i832NADkm
	 HRw9VgU6T2K8KYQ8i1ZPHpKPzUuEmzT7MMt9FTMSc0Xn3A7aOGUGRIVglFw9ik8r3g
	 bMe7Lp6jDpqL/+8qhZaMfTTRy+yope4070v9YVH+nHpDRpniXJOPRFprQaEwAM6k83
	 qTfge8GjF4q4QGlijkiGeSnZP8H5ZAFALM1Jo9jIj1sR96vtMRjZTVKkKz8B0IAtl9
	 nBM2Ra0Zty3JTo1XcmwFIL1eXyyXBYs3eIsq/vEptgq+AupHmRX3VPdxMdg3U0Ltta
	 A2KTqtxoPePDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7393561732;
	Wed,  3 Jun 2026 17:45:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA495192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC78B61732
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKyuE0gkeUHH for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 17:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCD7861731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD7861731
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCD7861731
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:45:08 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7e615efd7d7so9759966a34.2
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 10:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780508707; x=1781113507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTDGUGpy7262IbcPvp+dnH7Frt5Zn+X77/jJ2nGZAC0=;
 b=al3UUtKgtF7S6hfPnQMvSrjwe+F5nkgEL7bqBBJdOdc0OUJwoISxJIbHqW42SR+jgf
 GETw+0IYRcX3IVyZvwFCaZyRQOFRfFd/HUWoQWqBLyEA+JWwDITQFvNdTTUT/0l0HIps
 b/P7Xwg4eU/IBy5xb+2ofIuvARKYJ44df1Whyc5+jqz+Dhy5UR4oju0PwNDfJ8x4dWBR
 JyJJFpMSsgGRTmzSKH3YW0n/spYXtw7qViVpMwGQbaB9sQwswpf2QhCNz786Rzno/TvW
 CBsb9ZZdYzRIUDDzh3wnDsz0hQwAiDFVsuYWj4QnErIPiopQs1C6cVY8+2G+xGOKAxd8
 aVVA==
X-Gm-Message-State: AOJu0Yx+7KTb3v6AfimaXMn6aebay8+Ip0CmDqH231pTwkNXRKB7vPcr
 1c7jDFoZfUzSb+3/dyb+sOfVpqlX9y7mpjjWoxU98sRnVqB2bGAK4Oti6lQ/pxbu
X-Gm-Gg: Acq92OGtW6cdE+rbXrk1wZhtp7SxkVmiSsi+bbrIDkM06R7tpLaxuPjuss6HGzbFJe1
 5ZFZLd47Q0dTECI/5HdzsG23r5J7+oVaZnZpaXegT0Lr3bJcbTIZF3jNZJTkis3LrUf+Au81JCr
 ridREPvA7pGuYdjItlOG3LN4Bq+NlK+SKiOo3XP+dwco/MhybNr+QFEg+EVX/eP2ADZzNhnLNs+
 pyxT5Za75cQ+OLsbqTF8lC03JOZIRvpbO8W0HG+A2ilUrFjt8f6+eI/yczifuMuJ3nLpnQcggQK
 xOFNTwHQ8IqN1XISULCTRfmLQYiY7tKXphTUVYJo0+3lslXpaKrtzFzqhtL6S9Lz/3/zM2y4RRX
 uIWVpAu7VQRqVffQoPO8obkRlEH+DgZZLeQQe/pIo+tl9WQkxrGI1uPEryjG9idwFLEIjwenkez
 2Z5o2d6y8O4GT6KzzU/AWGo+kcHdUcIRsm9BXnYWmqQWYatSOiY1YzY1+Mipwnin8lvo5y3DUwy
 XvnNZoMMo/W4Kr6bSNlnQUaYSRKTaEuXriF/MUeQDAoToj59LWp5Tz62pfNpWPKRSSaEnajNae4
 Od+tEEehM9JT16KJWaVrKyQkaP+li/7OEQmW
X-Received: by 2002:a05:6830:6001:b0:7d7:ed69:81b2 with SMTP id
 46e09a7af769-7e6e949d9afmr2691567a34.5.1780508707525; 
 Wed, 03 Jun 2026 10:45:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-155-24.hlrn.qwest.net.
 [184.96.155.24]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6e745fea5sm2042414a34.5.2026.06.03.10.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 10:45:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 11:45:02 -0600
Message-ID: <20260603174502.727547-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780508707; x=1781113507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dTDGUGpy7262IbcPvp+dnH7Frt5Zn+X77/jJ2nGZAC0=;
 b=QYtlJc3XmlYZb7fTZFuUB+IZRI7yjpObLrAkNq2UMpXFkvExCJl+1h19YDEw2/g1cb
 hfPD51OyiHdRaaTXgZqI0UENDszLlTL+PA18LGAw3vE3hKCsm4RFYldGRuYziKvaGzI/
 J92L/L56gxDbi+YkvphWDxeN94mx+GIwOxq06vY77FBvdpmSQ+h6k+ED+G1kToDbnVhZ
 NpQ4Y3kDgu+Ws/dCSkEXTx2vMRUBGi4wOgIqMzyvJwjM88Yk+syt1nnIqkDRdqDTRDOl
 Z2WHn8DaEJnWJ4nA2Wg88dEgw98oLK1ZHl4CBsxd1RPLXeqVBuDM8S2wnunHHu37yPjm
 7xOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QYtlJc3X
Subject: [Buildroot] [PATCH 1/1] package/python-uv-build: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are currently no in-tree users of this build backend, however
as uv is a commonly used python build system we should add support
for this pep517 build backend for use with external packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uv-build/python-uv-build.hash |  5 +++++
 package/python-uv-build/python-uv-build.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-uv-build/python-uv-build.hash
 create mode 100644 package/python-uv-build/python-uv-build.mk

diff --git a/package/python-uv-build/python-uv-build.hash b/package/python-uv-build/python-uv-build.hash
new file mode 100644
index 0000000000..81837a034a
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  bfe502ecbfa11661f74ec32d74689b26d53a1641cdd69c6462ba6e3faee1398b  python-uv-build-0.11.18-cargo5.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c  LICENSE-MIT
diff --git a/package/python-uv-build/python-uv-build.mk b/package/python-uv-build/python-uv-build.mk
new file mode 100644
index 0000000000..45e9753fe5
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-uv-build
+#
+################################################################################
+
+PYTHON_UV_BUILD_VERSION = 0.11.18
+PYTHON_UV_BUILD_SOURCE_PYPI = uv_build-$(PYTHON_UV_BUILD_VERSION).tar.gz
+PYTHON_UV_BUILD_SITE = $(PYTHON_UV_BUILD_SITE_PYPI)/$(PYTHON_UV_BUILD_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/39/30/f7c499da67b9e55e4551f4a34f4c57e65fa8601f5502fd8b811a5594dcad
+PYTHON_UV_BUILD_SETUP_TYPE = maturin
+PYTHON_UV_BUILD_LICENSE = MIT or Apache-2.0
+PYTHON_UV_BUILD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
