Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B2CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 15:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0F148076C;
	Thu, 28 Aug 2025 15:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6x1HLHioAdQ2; Thu, 28 Aug 2025 15:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D16380906
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D16380906;
	Thu, 28 Aug 2025 15:33:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BADEB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 15:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C87140E75
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 15:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDVnMOAh3EFh for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 15:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 816CF40E71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816CF40E71
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 816CF40E71
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 15:33:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -605309820; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 15:33:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uredD-0080VR-07;
 Thu, 28 Aug 2025 17:33:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 17:33:39 +0200
Message-Id: <20250828153340.1908555-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=h7HQFs5XBnnhlJTL36mEaYmEnPJM8DoZc4eRlZxfK29Mmjd+D/71COukRKzt2DxvQdpxXDrq23+wAtwj1M2syO8ZVP4sc/cOfKhwL5hR0CvrLNMyu5Hj4oCXZDvZ6wtDbRNJ0HTyD8SB6PYnMYJmpwBkgTcW+5ozKGEV6OmGmzyxW8XOckIkwRNmmlnlSrrIUSfeTAjFdHIrAtN9mzKJ9tVDiyxIaNA5orDeRbpuBtz5h2w+WG96CmIYjGEEivUt0did4ekS+MGu0USNrLhr8WQ25zdP8K0LC3cGWoISxusrq9B9T1y2lzQ/vEZlXBpxi+pC+ODEKJf8IFTwgBFKbA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=pf5ytwUKYcLE2gTi96l76UrbTxv955LmVsElkhp8xsc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=h7HQFs5X
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libcap-ng: disable pthread support on
 nommu
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes https://autobuild.buildroot.net/results/9c40c86a42882a6d56eb6d6d1418781a980b6f8f/

The pthread support uses pthread_atfork(), which is not available on nommu:

cap-ng.c: In function 'init_lib':
cap-ng.c:225:9: error: implicit declaration of function 'pthread_atfork';
  did you mean 'pthread_join'?  [-Wimplicit-function-declaration]

So disable pthread support on nommu to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap-ng/libcap-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 9c8012b238..e544e27696 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -14,6 +14,11 @@ LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python3
 
+# pthread support uses pthread_atfork, which is not available on nommu
+ifneq ($(BR2_USE_MMU),y)
+LIBCAP_NG_CONF_ENV += ac_cv_header_pthread_h=no
+endif
+
 HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 HOST_LIBCAP_NG_CONF_OPTS = --without-python3
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
