Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3FDCD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 18:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E1882438;
	Tue, 12 May 2026 18:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGsqLe49e6w7; Tue, 12 May 2026 18:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED8A822AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778611714;
	bh=1cdBDEi8xXIEIfLyzyHImF0gs6HHt0Qi2g13vMpNUS0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GYwRGspm5WbZGx0NAwmPPJDgwN9kIF5Bu6Bl+5DU51QFE+5Uvdxxsq6j6L1i2ntP7
	 EfRX4Hu2/FCH13nVgt5kTx69vXdsO/fgZOgqoia3MSFn0Y+zTxE7R/O+5mDf7+dgvS
	 KgUrveIN1Pwcs2w/9kddYZixXu7GFqg7y59/T2OSd72auKZ169jd6g9S3IseolXuo2
	 YTzL27oWufe31ZXXruog7jYxIA7GBQFHySM0bgN0wjUpoz32tHv6Wbk5o+fBAzpLQ+
	 rkfI3I3IO/9PKla7Ec1LfXLhfJ/rhX3wrCsd/y5t6GMNtCUTQS9EHBQ3Wq31lPBy1s
	 iTLnDC3L1KJlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CED8A822AC;
	Tue, 12 May 2026 18:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 429BC223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33A14822AC
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHlgqtrx3QBR for <buildroot@buildroot.org>;
 Tue, 12 May 2026 18:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 473A18229E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 473A18229E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 473A18229E
 for <buildroot@busybox.net>; Tue, 12 May 2026 18:48:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so37048835e9.3
 for <buildroot@busybox.net>; Tue, 12 May 2026 11:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778611711; x=1779216511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98zU9RAYA5m1F0/5GKXMrhurJNo9FPK44Eps6tZyPqE=;
 b=OHnclDA7RwIYIY4ttXhfzDgYY/AB831o1I+dEXmHzy6mltUc0/pYiX/mhtu6Jgw1IJ
 DK+K4gWsXwQxZHsCQYC4/QUHZsezmjB+dUG2116y8WjpWamLRizJOKQ8uEDhFWd0pshz
 lH3Txnrr8K1EDE5xn0udZta1jdjQMJmZgOWoBXfxYCGGQtgH/4KtIMhf5vvljS2ra/Cs
 ane6KAb8sk+PLu689buLbgC/oZfInrQ3Qod5AAh4gmeOYRVEwXirUxMIyy1qvATWeL5W
 yxNr7+hZ4nwKDSdFJAfm0gIoV8Uf9BCaCrqvHpdUDPcZeK3NVLR9xGPn00xwKAbigPDQ
 4kfg==
X-Gm-Message-State: AOJu0YzyfYVC2VHnvCUuutp/yv3aQWmU1PJ2xh8jI4jZlGlexKLES0Vm
 oHI+nXE/+DcS0qqyJHeJlGg/p4wSl379V3Qw55SXYgfuM+ZdHB8AGTree5OnNGfOezYv/H1pc4c
 k9BvqnIvY
X-Gm-Gg: Acq92OEyfJrsMV8x3XPI8ivPe2BwzVQHv2A1dmwS2VTngTBHwBK3LvQeVX/lr6y78Oi
 FmBzWueLZysc2W0/kwD0AJJYa84lMZ/5/eks20atq8OIGYpOokEcoKKflTcDy+v56zaPMa79jcv
 rFPW3DgesaLnQlxtN6U9nQ9qIcLu/qwDAJYV2/vAgX018QZlUXtVzsMyYFGt/m3QBIA67/hBZ1/
 tZWLEoofGngQ7m3nL0IJe3noC26/VFBwWQcx1HPgUdEbLe410zeY05Bb7VSb5HYrvw4uk5f6UGo
 C5S1sjimZkM5eEUg1/T+c1CRrCNfhVcKsrCpxkpSmHsR1dhQtQwOVPVYJgcYdjeCAyPGytB8tl+
 10VlwcMB4x/g8TfZ6mvAsYLYqnTMU2CwsbVh/KKMZXWcIgxOj4OGBSizJjcrdiZIMMMutpKfr7u
 KWI08D37xUsPDspjmg5dhs0yssekdy3ovs8MOMcJ6CJuvvz/jnyA==
X-Received: by 2002:a05:600c:45cd:b0:488:ffb1:494c with SMTP id
 5b1f17b1804b1-48fc9a1bacbmr1926255e9.12.1778611710024; 
 Tue, 12 May 2026 11:48:30 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549217b782sm30394422f8f.35.2026.05.12.11.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 11:48:29 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Tue, 12 May 2026 20:48:26 +0200
Message-ID: <20260512184826.330381-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1778611711; x=1779216511; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=98zU9RAYA5m1F0/5GKXMrhurJNo9FPK44Eps6tZyPqE=;
 b=iATGGqCoVuC2G/rjJVKbX7+Fb4jDkdd2rLfuYJMms0CovrVUZeVXZJaWWOEMWdba1x
 gTMPL0jgxlmp1HXwDK+uLAQFtkSRqkJSRz67wN371Z3bJObTEzGOLbtTfvScWpK8vN5o
 ZiiTMhz8CIkl8JvPr+2MjU14ndGwdr7r7MXKqhU287Y5HXJAs9OtZM67fIr1y/eqJtiD
 0aGqOHs6RKVHjyUOKCEwRfnT30B4x7A6uRyCaeiBc1wWjQV6R9XEDbU/d7B+LVrkSqJJ
 9062FMV5v2lGFjMHBRBFr8Q+TFkExAP/bgmkQ7dgMlUCe01tGTRg0HYTbKFWX3WvbXNr
 bmeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=iATGGqCo
Subject: [Buildroot] [PATCH v2] package/opendoas: fix permissions
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/opendoas/opendoas.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/opendoas/opendoas.mk b/package/opendoas/opendoas.mk
index 06626508f..4f36d20ca 100644
--- a/package/opendoas/opendoas.mk
+++ b/package/opendoas/opendoas.mk
@@ -50,10 +50,14 @@ define OPENDOAS_BUILD_CMDS
 endef
 
 define OPENDOAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
+	$(INSTALL) -D $(@D)/doas $(TARGET_DIR)/usr/bin/doas
 	$(OPENDOAS_INSTALL_PAM_CONF)
 endef
 
+define OPENDOAS_PERMISSIONS
+	/usr/bin/doas f 4755 0 0 - - - - -
+endef
+
 # NOTE: Even though this package has a "configure" script, it is not
 # generated using autotools, so we have to use the generic package
 # infrastructure.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
