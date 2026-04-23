Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62669FC0360
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 16:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1530240FC4;
	Thu, 23 Apr 2026 16:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCf91YIKyGGA; Thu, 23 Apr 2026 16:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF4541008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776960137;
	bh=AIZU9RAJWril0xc88yqnq9A8eoaq+71euLOXlq2yuh0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H56sLhB5ZTjxmWOaSTgAWxFpUcj044NZfewaxT3FVJzw2aFolJ4nERkiG/nU8pXCe
	 rs1thIbeHyaiF+jwScBc19IB+M+E8rnn953s10a9/BmglvHq/XPC1rLkf9RP/+5Odq
	 6r7ylf/xvac+RIKEuptPOerSyyvTEBojS2/YaBk9pCEte+vFvRNQDDER8xafoBRfNg
	 cubFkrhuwjbyIHW1VF9C3p7iCckD6T8IYzzm6s4yVonELSmbOl1dirZX8H+3cYrq/l
	 vhgtVtJQ09l5FBKvWiXs/2TGlo3e0eAK2f2QyfOQvNa12p80xc81NsPRpPskCv9KQt
	 iVZ2ua4iExUNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF4541008;
	Thu, 23 Apr 2026 16:02:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8BFF24D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 16:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE92883BF4
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 16:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgREIO_wHFB8 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 16:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F2CF83BF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F2CF83BF6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F2CF83BF6
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 16:02:10 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so4741352a91.3
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 09:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776960130; x=1777564930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8CfJ6jy8dXmt5FNWQWR4uU8lJ553MIWl0+unblLaqA=;
 b=sOiG9uLGBKHrANVFXAUpSkGmYJ+ivX3kfUOowAs7xdLnjOcDCvv4NogWn+0sgayzjd
 bLlS+ME9bdKJp0LpSxZajVC659lXg44ZwHEKPPwtWzTy0rHmoVdPBkJPE5K2j/Hh0FKF
 IN470tjQmQb/ieU4bn8cRO/YdorXuVZoPRDWMpVxnn+Q3UUkRGl+MR4/93htjzNRs+c5
 hUWUoLMNNI7xBAWBtfv6T+iT+HaGYPSCFw4iG9F64l0zn5GZGQ9xSw91F+9sYjlYmyAj
 TDVRBwBQqDvoTdqFcGkRuFwqo5eU6oTVr5e2rOmENL25FpHxxwJLEr8ixCBXBQCVxkov
 HtGg==
X-Gm-Message-State: AOJu0Yxg4UTipVe2UbstPjqARD0Sl4d7A/9FcscDl/CS/o3nBarBsB8F
 Cc9S9CnVExaiG4zsAMigvHwtUmVwXT1EEV01L1+2AiQ8Ehp0+dQFZAxSkwHRlw==
X-Gm-Gg: AeBDiesir8AAnK8NDkR/XM6uIDSchUk6qgX809gep3jZx+psYrkHxB13+yHOxyz8kyo
 oUe0GYoVprGq/7WiIZq3PMeNWQkxit6fikJTTNEsivGk93kPYfjDSSu8mQ3/TImO0EBN4Jas4sG
 4QSRzH5TxdjZamIyf7iNSI/j6oLFj+JFYPIBLPa0+UA6tsOgsJy6Hz0tLl8ppeWJvDrRtCsitd0
 PkKGlnDhPouRay6Jpjwcmo1nZhH7M6i7WL/AMSaA0MiUvyQgU7AWPBgC+JWne0iB75yfR0nU0hx
 BOo0uyEloUaB/AW6c7r//MnRZyoU3VV1/0s+vv+m+aXffcb0ull+a/GvHW10pccn02b7WPe3gtq
 2LynkNCFXf3MYnXcRSbv3KDVKzokrh5K2z3r35y7Y8AB2QtvkLvM6o2MToS4/q+ZELHJhbnXh+e
 ChOa+K2d09ZxVhoiz8kla9OMJ79T04IVvO1W8vaCK2HINtbquOpDpH2XiosIw=
X-Received: by 2002:a17:90b:4b86:b0:35b:e550:e68a with SMTP id
 98e67ed59e1d1-361403b8367mr27630846a91.3.1776960129699; 
 Thu, 23 Apr 2026 09:02:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:801a:4095:4cd:1051:d19:19e8])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36140feea38sm20658764a91.6.2026.04.23.09.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 09:02:09 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 23 Apr 2026 21:31:56 +0530
Message-Id: <20260423160156.21391-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776960130; x=1777564930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y8CfJ6jy8dXmt5FNWQWR4uU8lJ553MIWl0+unblLaqA=;
 b=IICsyGILWHrgOmdSvJt24d5tMx/0g7Pd820zPs33AhvBYoGlSsTlfhLysHbsg+6XtW
 6AdEYgOo1rpcwlQJszyvoAEZiChMSpC0a5FxJgNQ7q4V7pCBxcyr+34M68jfc/LszSRV
 f514B/ytEvg9UlRfV/kb1FhBJZTnPlqmy8Lxs377HAk4hyDPfNdLgJIOdRXLd6awbE/v
 ZYC11BXfCeqN7ElvJj+TBViWxCL2sMkHUjkUFDk/Oh+He8EYCf87ISV8yVSSoyFGwI+6
 RGPjJ1Kq2ACfmpKEhd2GYLdu+mFf2jSrMdurGkwJaVHnVV9YQRdPZIE5DK0mRL8sHWcW
 WqFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IICsyGIL
Subject: [Buildroot] [PATCH] package/mpfr: bump version to 4.2.2
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

Update MPFR from 4.1.1 to 4.2.2.

Release notes:
https://www.mpfr.org/mpfr-4.2.2/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 4b0d14c9c2..56e662afa2 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d  mpfr-4.1.1.tar.xz
+sha256  b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01  mpfr-4.2.2.tar.xz
 
 # Hash for license file
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index c0c8c04646..2633084d73 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 4.1.1
+MPFR_VERSION = 4.2.2
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
