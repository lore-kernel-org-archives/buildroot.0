Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10915F9EDD8
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 13:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C9E42726;
	Wed, 22 Apr 2026 13:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWeaVwv3LAhl; Wed, 22 Apr 2026 13:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA8C742734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776866173;
	bh=Gvxu0C/HI01ck0hgFbTsoKq2Y/almc9rEja4HSVLgjw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LVm7HGo67PBhgHB7YnpwusUqvwTFmGL72LDQfjaed3w9ujS18ObV5C/m4hXjbmx+q
	 s4ZvK+nt1vKklM+PeMgoRAcK6ESaBZ9SGLLiX3sNBu9+2QiSbM0VRmHjeeOT05geqU
	 1jI2mg0sQxfwkl98ACLIcLh1ogaesAVFEHvBVChHJJkO+GQ6g4xS9k50Lv3xd9ZJDe
	 hMSrbTUKzOQoyGRJQtGVrxxbjWlQCIZ0H3CYKQ8ZcXklSZJExU2Q9Dbwk82uJ1ecJX
	 pixBEu3jWrlCXMDFOhwh2TRl1oWEDto8zu1zkP9cKWd20AqOHTCi5kT/jaeOQqz44D
	 pySwgkxTqrcZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8C742734;
	Wed, 22 Apr 2026 13:56:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 276E0183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 13:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C55584905
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 13:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWwXDlPdGIN9 for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 13:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9D0384904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D0384904
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9D0384904
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 13:56:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso3349652f8f.3
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 06:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776866168; x=1777470968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y26FStnTttcZ2saErPzmLVaL1m99FFydv83feNwjWCE=;
 b=l8SadXGZXPbs/2Qoc1alb9Bf1VEe/msCj4mPqQ2mk4dZgX+hj0t2YzHWaBJyjdYgQI
 cwj1hLp1So8HZKzVhgt/638Z4gW6h408Lekoh+yRj6zDpWlihbYQMvpboj3VbqF7NtWw
 wShZUtPNl679fKfsvcBixa/Nh/IyBV5NBMpNn32TC7M8ztCO9Pvh9RsbhNKFcjYAQtWz
 2YIMlUn4Tp+Ll2ctJzpOe9U/1ivl/Uuz2WUpCR+AYoe4dOZwS0PdWmxGzR7iOQw88Xtl
 h565qm8XiPIgtHiq+w6fxNlRjt1uFxINVAujMJxYglqjgzwDzfzUPbhlVY7nhshUPFPW
 EwPA==
X-Gm-Message-State: AOJu0YyuSv4v1hireZhYXzEuYZjXo8XRvfo4zj+FPtyJMx2N23BWue6W
 hygkGntHZEKPkG1pE12GBtU8kJd5QsRA5CzCrRxsEPaU7KmYwT/YWV6VqbWRG8WE0/nvX3c8UqW
 zi9e3sP4=
X-Gm-Gg: AeBDietpcugfmASXHTDxXYNoRGNms0yRGztV+250BkVOp5CkOzhbp1pqFPv36tTkeYO
 fe3ykKIzZ/3r79q0HM0OWopLDsqkKRbLM1VNGQkPwm14yILncZ5kGiGNV1Av/Jiu7rnyCFLs5Zg
 EidK4QHxQhZtiH5EicE6XwD8iQ5FlJmpglCCwtAocSfL1GlMuTKjq2OdUsTssmYLYgU90pxVyKd
 JIrBOnHzW7O9cCadcdyXS4KmWp6i8W2ZXPfATzla4nN1WdzTfPPbE8TxzreCO8Q2OXPzhlu2sCK
 rijBT4lpOLxlqWFMTNhmvgCiUeDK+Id25hmPLnluuYGMzXfy+Zqa+buDID728xOblFwHvTWhmVG
 L6OW2MtzIBmESZ3IE+aS3aNDA7go2aoKoEKFCGNwG0+cb7P+fCYMyZg9zcPus+R/SFqDV2rBHrZ
 9nxO+b4bmPPSADNg7qcL8IOibOmFzE0M25Tc6b2W3emcA=
X-Received: by 2002:a05:6000:1a8c:b0:43e:b0f8:66f1 with SMTP id
 ffacd0b85a97d-43fe3e0b86emr34611364f8f.43.1776866168319; 
 Wed, 22 Apr 2026 06:56:08 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a79esm48079552f8f.17.2026.04.22.06.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:56:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Apr 2026 15:54:56 +0200
Message-ID: <20260422135456.3109434-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776866168; x=1777470968; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y26FStnTttcZ2saErPzmLVaL1m99FFydv83feNwjWCE=;
 b=GjRBAmH1atpkhJxFz3Dc2lNllCe0vHBGWFz1p7VMTR98Jdr2cfGJap+HfAfp/zxOFJ
 jLUE19clsYejtcPGXg5+KJALJK9Q0h87S7fV6YNkIZHn5AsC2jt9XeRZqCqtX9VFMSgE
 aNYFSR85kIwquvlb3PbK3ZSamnoJOiOibu9FIeZFxZxFCnzray7C11nfOyx4LaLF78qa
 EUaTHckMyWKPvFUnvJHETSQCSR38zJ+hogirKZPM3j+6NTbJnC6/DzjTuIp4fqSrgJFn
 Q41w49e7jHbLq0WLj1M1Rj1ym7NwmEWKn1svA0cIiYJyYhZ3/WIV0ftevkwCJ8i+G4dT
 20zA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GjRBAmH1
Subject: [Buildroot] [PATCH] package/log4cxx: security bump to v1.7.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2026-40023:
    Apache Log4cxx's  XMLLayout https://logging.apache.org/log4cxx/1.7.0/c
    lasslog4cxx_1_1xml_1_1XMLLayout.html , in versions before 1.7.0, fails
    to sanitize characters forbidden by the  XML 1.0 specification
    https://www.w3.org/TR/xml/#charsets  in log messages, NDC, and MDC
    property keys and values, producing invalid XML output. Conforming XML
    parsers must reject such documents with a fatal error, which may cause
    downstream log processing systems to drop or fail to index affected
    records.  An attacker who can influence logged data can exploit this
    to suppress individual log records, impairing audit trails and
    detection of malicious activity.  Users are advised to upgrade to
    Apache Log4cxx 1.7.0, which fixes this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-40023

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/log4cxx/log4cxx.hash | 4 ++--
 package/log4cxx/log4cxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index f6770e287c..af97ebca18 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/logging/log4cxx/1.6.1/apache-log4cxx-1.6.1.tar.gz.sha512
-sha512  6ee406314bd7ab02a46c98cc8a0d5ad5aec8928a23716a81a152775ca315cd3b950d600b2e221d5b4a88416ae9bbda1215fae43626107feea4df2f3e074303ad  apache-log4cxx-1.6.1.tar.gz
+# From https://downloads.apache.org/logging/log4cxx/1.7.0/apache-log4cxx-1.7.0.tar.gz.sha512
+sha512  0e94946457423689af6d85074ab97b717e0cec85a4f548e6650b060e8f98b780f980b7d4a7780410fa64681376fb4bc62fab6ed9068fc944e07f9f32ac0413af  apache-log4cxx-1.7.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 57f9b1e844..ea47073d3c 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 1.6.1
+LOG4CXX_VERSION = 1.7.0
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
