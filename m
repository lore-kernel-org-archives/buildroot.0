Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82F7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 16:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A6E61212
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 16:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55A6E61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0475F415A7;
	Fri, 24 Sep 2021 16:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVUfGZNEWEAr; Fri, 24 Sep 2021 16:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1D0406E2;
	Fri, 24 Sep 2021 16:04:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5E081BF57F
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 16:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5F42819D6
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 16:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1OQgdY8lRHs for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 16:04:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1D65819D2
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 16:04:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t7so28832776wrw.13
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=isURKw4T8FW1Am/5ULjbFisEEGjRn+6DAYoN7n/2dvQ=;
 b=AVodtenlLwL/zkBRWjv+V5n88LNSo4I6ipsC9M5fOcFB0987AwxLCv/kudiHNs7STu
 aG6BCnAuPZAaxaofpfMWDCYC6PD0Zf/HH7LbzrqV27Np8np4GJZ/yNAIiT3Llc+2IIiK
 0h4jD1bODnG1WhGxBcZj6q/IMAKxRqEBFEEw4/x4TJQeFaygSkPef/ZiiOxGKGguCL0M
 fYDXZNSVRlLT0IdZm11TegqOBZtSt5C3k+N1QIjlgdNZCbBDupIEM6P7H/DoafyNiSfW
 ZlUmH7LIgZ6a8ExC2xHeXW75iE9Ttt2pg25yd/MxhE50sBsJZu4TIMqJtaAlRQv4Y8Xn
 3IMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=isURKw4T8FW1Am/5ULjbFisEEGjRn+6DAYoN7n/2dvQ=;
 b=65bql8Cxdm75Fydr40Y4jJ7HQR5qp6AWOUVXTwSwhoyK03GGmgKl3cFeVsiLPl0KHx
 yj17gw0+HT97Q9YIERsKh8q+y+vWKgcyORQks+cpie1EoXLdNB6BiLLhYmHMjYvObBxv
 GhB0XIHsOBqdjF8qoK55aPxFrGDPAWaawGlKah7WYrkwsiJqf8IDNHQf29bSfIYGhUr6
 12Ed3024qoKXgWd4eryRv8/U46SWqwIwLYBboGlGjvZ7vSZc9/a8hKP9Uf5Tw87Vi5Ul
 K/jiC11ZxeS425XKXwzVzME0+kj6ntyBEQVmEMjx2W461wbuwN9zJ02acY1ZlFfSqISH
 gO2Q==
X-Gm-Message-State: AOAM532/5dNifdzBNsslN6IuUOqTq/pPeYy7n8RAVun1szI69Jq1WH8H
 IWwURQisbY53nN1toJqOB077C9pIG4I=
X-Google-Smtp-Source: ABdhPJxV+91CBU69pvS1s/CEQdRvQuMeAsaUEgSBCEnTkMIIDtyAUmwgy5BJUklVZxR8PflUvmmywQ==
X-Received: by 2002:a05:600c:4f54:: with SMTP id
 m20mr3015538wmq.96.1632499450859; 
 Fri, 24 Sep 2021 09:04:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j7sm10627051wrr.27.2021.09.24.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:04:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 18:03:45 +0200
Message-Id: <20210924160345.1994773-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/log4cxx: fix build without wchar
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure without wchar raised since bump to
version 0.12.0 in commit 83a0e8dea203dc37c6c207a36b3f46160578dcc2:

/home/buildroot/autobuild/instance-0/output-1/build/log4cxx-0.12.0/src/main/include/log4cxx/helpers/transcoder.h:113:33: error: 'wstring' in namespace 'std' does not name a type
  113 |   static void decode(const std::wstring& src, LogString& dst);
      |                                 ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7d0297b071df06bc312b9927396021aa6fe401f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cxx/log4cxx.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 49f4667a9a..8a7ca8ef17 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -21,4 +21,10 @@ ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 LOG4CXX_DEPENDENCIES += libesmtp
 endif
 
+ifeq ($(BR2_USE_WCHAR),y)
+LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=ON
+else
+LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
