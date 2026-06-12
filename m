Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4466CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780F684157;
	Fri, 12 Jun 2026 20:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNqJPL3M4c2v; Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993ED84150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297482;
	bh=ZXnse6dgZaS55bnp2TRk9xP2K3sCkdD3tn7dfPK9fSU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gKEDf56PwhhoyvlFBGUWFQFQA45gpnRabXbG9FPxY5Wie5vy0F4aycKSg2V8djOIb
	 x//x99kvrkiJhDPxZBeJ3O6sn6yAexXs4Ti7GePYDZn1iwvnfKZNVkkjetISePqI3R
	 n2dNmjkN1O1KJ3Mn4yl8gTLunX1Xo3CBufzoY9I8fYDNlAowh0eKtrf98hlxSHs4qq
	 8KTi2RhoOn7MzMW4Zx1SipQtnP0uO7csDezN4shOCO36qyKHkMfrga5Vlew0/KC25w
	 qtKwBvR2ePMh9xfBENzVnBYhTXHyJh4bwBEMBQc3dSanjh4VA8ogGIhEGVN0/QL2oY
	 lfXvl6fan9kBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993ED84150;
	Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB121E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B5CA816EE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1HV-7yZxJuM for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0FE6840D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0FE6840D1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0FE6840D1
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso11045705e9.1
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297476; x=1781902276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/QJ/o2OBmulhH68jRhinLaqaUOL6uXixMj4rti/WygA=;
 b=EVjFJ27yCanu0Gbi5z+jGQbyyUtOsiAeTI1AcJ264tU4NEZnKVn8fWM+ThNllvv5M4
 LpSt4yAwcNe5TWqWVYqYywVlGTMOkNebDtw5Yp6PXAc3i7/0bpJ5NCmjUHoL4hOpGGds
 IROV5x09QxhovoLzasStX7C606EYG8QccHigpHg9z6XGemPk9eig4tWZ+H06e7poUIye
 25ZfJlG6vaXEYF8kilAyga0ESishyANhC+aGy7XbxNyRAqMqdrSVe5aukmJtCVQFCK+u
 7gmRN1Ylpa/EULNLx0e9MtqEXza+hUPl9NM71L5TkuQI8WaqYfsP6LxuVy+PwoeMF3vo
 xEGw==
X-Gm-Message-State: AOJu0Yykt9Bq/RUHeNyC5ygr0lBVHzDQ0wuhebSM6ly476boazc38LBW
 luCAr/Idu8MldhawKELKj1W6GrFCCEy2k9w/ExMLdpNKmnDd9euHxNHD88F+9x1hECuNaXfbAUH
 rbj1Iug==
X-Gm-Gg: Acq92OF9WaCcrTu55ib26auGPLtSGfYyp7J6k8cCgdrqFPFU8You4kAVJtptB66+NE/
 XiFk7w44L32VuUJCyc2kMaq1tNR7BgPyAa315cUtSJUdP4Zbj1CpeDvrZZqdwlCNW/N6fcC98Gj
 uTjsIOXVQGnAv3tWyjrPyp93FEg2vGoGSHmRvzUhDdjxjLQZaKsVmi1zK32pbIWcWudb60ZsIak
 7yYsj+GVpFeH/O4Wa4lsoK/wZxDWMsGf78OJgnZN/wtaxUtdcPGKgUY6Y89ZlM/cjSl5QTp3JTD
 cmyo6IyqtlyZ6NUi8em0dh5BKXm/EC3UfnLptCaeM9rrgpKODHqq8SDpv65fh267/xYh1WfowHd
 kxYOFOvbrZgO6goaIomkOziNx1p1fww6RPVBokPtScQaU1kNcAFWL/I66Lr+ky5Vn327+SHoBii
 dD7o3eRZ69YXVEJ/cN4gSN3uvT9eB0dwWJI6HZtUCGPLI8Pql65l8e1nlgOLYZ
X-Received: by 2002:a05:600c:4444:b0:490:e5c1:b89d with SMTP id
 5b1f17b1804b1-490ec33a226mr57911385e9.0.1781297474738; 
 Fri, 12 Jun 2026 13:51:14 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:14 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:25 +0200
Message-ID: <20260612205029.269642-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297476; x=1781902276; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/QJ/o2OBmulhH68jRhinLaqaUOL6uXixMj4rti/WygA=;
 b=Ud6DFOTdck8yOE6ZFOET2k5JdQahJF40QgWuplp5sLWKrRnYm4i9A36fPJVB7D8jID
 cLJJiu2FRBG6enBH+0O7xfa+BPpr/yfGmteKRfpgmZ6F6GCZRZ2eaL6SMtsWxcPso+Al
 Gfpp9MJzcudHx1iI2uub5tXIElyhA9gEQW38/huxTOEKnkVe8g7mmDd8y/8mM/qCnlIZ
 Y84OrrL2r/6l5cnLY7j1BOeROcLxdjmMHNAylk/MBQoDp/7jDcfRJrFcsSf5uvME+YZV
 Uwu2kNSMeeHAIlRhrnwCzUD8pZnkZPHunABPLRqPGj11H4BmZz2tR/A74pVGfG41kYVL
 WHMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Ud6DFOTd
Subject: [Buildroot] [RFC PATCH 6/9] package/hare-ev: new package
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
 package/Config.in            |  1 +
 package/hare-ev/Config.in    |  8 ++++++++
 package/hare-ev/hare-ev.hash |  3 +++
 package/hare-ev/hare-ev.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk

diff --git a/package/Config.in b/package/Config.in
index 630662477..5cdf0c13d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2168,6 +2168,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/hare-ev/Config.in"
 	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
diff --git a/package/hare-ev/Config.in b/package/hare-ev/Config.in
new file mode 100644
index 000000000..5a65e1fbc
--- /dev/null
+++ b/package/hare-ev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_EV
+	bool "hare-ev"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides an event loop for Hare programs.
+
+	  https://git.sr.ht/~sircmpwn/hare-ev
diff --git a/package/hare-ev/hare-ev.hash b/package/hare-ev/hare-ev.hash
new file mode 100644
index 000000000..beb0c6f4d
--- /dev/null
+++ b/package/hare-ev/hare-ev.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c80dc647f3a227259c05dab3b42b4cdfee44c68acd8e7cf31245807a8fa79188  hare-ev-0.26.0.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-ev/hare-ev.mk b/package/hare-ev/hare-ev.mk
new file mode 100644
index 000000000..0f374f3a3
--- /dev/null
+++ b/package/hare-ev/hare-ev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-ev
+#
+################################################################################
+
+HARE_EV_VERSION = 0.26.0.0
+HARE_EV_SITE_METHOD = git
+HARE_EV_SITE = https://git.sr.ht/~sircmpwn/hare-ev
+HARE_EV_LICENSE = MPL-2.0
+HARE_EV_LICENSE_FILES = COPYING
+HARE_EV_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
