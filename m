Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F20EFEA83B
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 10:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A03B8343E;
	Wed, 25 Mar 2026 10:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7KOy0HGgezU; Wed, 25 Mar 2026 10:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D43683544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774433732;
	bh=jVzxjzCKtG0nMARD+gPSXmktvW1JodDuGtg2nwBGvMY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=hStjsiUiQhMuLvRcF5i9iLZ0vaZCAaGYF777swexmem70uuvp8XkSkZZN+qDg128K
	 C5l0DAbhEJPRnn0b/IQ5RG5TI+nIIzrtgunCgWYtBJ7kPxjiGbakIwLXO/RkgfFxN3
	 QovNT4/v5V893nPnSg2EcDvsYUy+x6P/hpq9fbQwMBhULJ8Bu1Ymc4/1id37V0hCfS
	 uA4SrqrGQaI8bx0CreTySr9mWb82CoFWIU88fdZJElTlmGQsqQmso1sVadnXmFfBxN
	 5K7rTIvFmOTg/fHlxqfQA4DguBDpaYXV2TU+DjReJQ1Gip4WCkMdVb54en+3eEWARa
	 QtpGwLYCaUZHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D43683544;
	Wed, 25 Mar 2026 10:15:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4741D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99D5561037
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0s4H7fgm1c3B for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 10:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EEAC6103F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EEAC6103F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EEAC6103F
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so43461625e9.0
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 03:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774433723; x=1775038523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=flH9ey6MDmnDnFnIaUlV9C+xRwA0HsD7V15IJwYwKBc=;
 b=AFQs2SMepiDDGNUgR8P5L6gfiHb1q07sTX5cbR4yIj4cueBRIWBJYRdq62nbMUuxfA
 WW2amHN1FWeOQhene85ZT94GJRLZFsQAdRSB2oCizyQmmUZnL3D2DP9FHOlLai047Vy1
 8gqjN4wSlLp6hwrXxicYNoZnA+h9OLgjFo80WRvEOEz03AfdNBIpWZO3JkcDAX3STvxn
 B3sxPPa5uxmG4H/TXwl/uKrA1kjeNwc/kTsZYrZGzpt1fjx8BIljiwfyla2wg92F0sw9
 cIo4DgVTZnDYoT6iZ5XaMuYGqfoOp6/vADxGQUZLSIIy1MmvIsfGtDG1ZR9qOWq2WyDO
 4IsA==
X-Gm-Message-State: AOJu0YxJqwr5bGISAVU/JFlVJawqT6y0xDrSvhgoF9Vi17AoTXY5+cPR
 L1soaQW7kfbGcRKxG+6XPEYxlg6BdVXsmGksbcM1AwrrdK5Jdvd6JqhRYQAXBWkb8SujUNx1Gx6
 YNgeHvto=
X-Gm-Gg: ATEYQzzHROZPHnT3Lgey9fc/dXp6clUyhtecUB5LigH+JP3sFCd6VPyBi/T1xteLeby
 2xrxZe7ki8Z0kwwWHhEMFJB1/xGPd+lxdQUj4wQrc3oZ61fTKNNdkhyTlxLC47qxB8ooAp/7nWF
 S4synPNb61jw4UQATCkcxVlQe/XMubeXZIH7z+jhmieHzM2v8ypR3hiHe42GfbE55JrO7/IQu+c
 KROwE9Va8VEbE2w0mlcavLZLGwOGNmNYnwadf2b3X/ankl147DSydaFpNaladbZkFdOl0G7xD5I
 OSWw80WwCYNpcqtPFufFwPbS+SIlV0iaXcvibBYOXlayPoGo/C7w2ri+Aoif50LoaZGXYK8q+A+
 tdxa2wiiZy4FWy9FGj02rCuZTvzR9+9bwrw4quI6mRzqV1e7ANERa8WiTOw7HDldO0aTh7FEhnf
 GA0P1Fk2kfCGVlIDQk
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id
 5b1f17b1804b1-487160a681bmr39774125e9.33.1774433722506; 
 Wed, 25 Mar 2026 03:15:22 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48716641406sm18326895e9.11.2026.03.25.03.15.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:15:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 11:15:19 +0100
Message-ID: <20260325101519.77626-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325101519.77626-1-thomas.perale@mind.be>
References: <20260325101519.77626-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774433723; x=1775038523; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flH9ey6MDmnDnFnIaUlV9C+xRwA0HsD7V15IJwYwKBc=;
 b=ULJSosjcKB2NSR3TU6AaAPT6R2+bk43/d43moRdMb8aOluiJ2v4+8S59plbo0il/fZ
 B3IfefEp08mrU5ENYzD/aUB84hwumc8V6MAb5N9bU+z6HWbi4qMjchGm84lz90cxYwfE
 VAjm5fsXBVZKZlqMjBF0gxxdipSIPl9azJDluF7U09VB1Z9Y370E0dUdKFh0bJORocCN
 zF8Ce44hkVOSI8MXLaNzzayzWGCZ/9Y0mEWPdOFUcGW/xaKJQ9xsvoLXZZXi0MWezJgm
 w2AgnLYtKM9BfiN2dPtFl0dCE5m4JjMy7NCSi8YDAzKuaMMq6uvFdowoNMYQU4IPFF4w
 H3EQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ULJSosjc
Subject: [Buildroot] [PATCH 4/4] website/sponsors.html: add IPComm as a
 silver sponsor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IPCOMM GmbH is a German company that develop industrial gateways and
inter-network communication solutions.

They agreed to sponsor the LTS maintenance for 2026. We thanks them for
their contribution.

 - https://www.ipcomm.de/
 - https://www.ipcomm.de/article/AboutUs/en/sheet.html

For more informations about the LTS sponsorship, see:

 - https://buildroot.org/lts.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/ipcomm-logo.png | Bin 0 -> 4241 bytes
 docs/website/sponsors.html          |  20 ++++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 docs/website/images/ipcomm-logo.png

diff --git a/docs/website/images/ipcomm-logo.png b/docs/website/images/ipcomm-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..376f4160ef671ebd43e0481f3b71ea5e195cdd15
GIT binary patch
literal 4241
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

literal 0
HcmV?d00001

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index f7ccbbedd5..76182c602a 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -51,6 +51,26 @@
     </div>
     </div>
 
+    <div class="panel-body">
+      <h3>Silver Sponsors</h3>
+      <div class="sponsors-container">
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://www.ipcomm.de">
+                  <img class="img-responsive center-block" style="height: 100%;" src="images/ipcomm-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://www.ipcomm.de">IPComm</a>
+              </div>
+            </div>
+          </div>
+        </div>
+      </div>
+    </div>
+
     <div class="panel panel-primary">
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
