Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19696CAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 08:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF7674196B;
	Mon, 22 Sep 2025 08:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUxB-oz1qNyH; Mon, 22 Sep 2025 08:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC13641988
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC13641988;
	Mon, 22 Sep 2025 08:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4431C116C
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27645413A3
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQlLhkUymDl2 for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 08:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C656E40442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C656E40442
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C656E40442
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 08:15:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1073415719; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Sep 2025 08:15:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v0biD-00F6B9-1u;
 Mon, 22 Sep 2025 10:15:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 10:15:50 +0200
Message-Id: <20250922081552.3598651-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=B0QBF/EITZGKHwqFGqhqb+P++LGreFuooovsuRociHpQ7k7OXadxXprQH2e628RC9rgR2kbgB4raBUZ0nF+QWVKLGG5+WIWkF/4kn+GK8TrO1pI5P9lmUGLnj0iQS4pxo1g3PA7x0J+lVZ9mVWOIVYGySPyZn8VSBqKyJdJOJe2AcXcGRQc0AOcHlSGg2guXDr8/Vg7QM2ucx6ADwJq9R14c87cZVsaKeCTmvCk2MUcLwevE+48mnvR48lmQFn4/OfEgEsA/i5wfosa8zcoKS2p/zcclbn9BAzPTyDr02/zUhHDCe9ye5qpq093e0ZX4iMGeygUsXXTurbvSjETAyA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+0BA7tuO8WYc7qcoh9sn8dio424KMeQemwymzcD1dbM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=B0QBF/EI
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/2] package/rtl_433: do not leak Buildroot git
 info
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

The CMake build system has logic to detect the git repo info and include it
in the version output.  This unfortunately gets confused and adds the git
info of the Buildroot repository when building inside the repo:

-- Found Git version: refs/heads/rtl_433-25.02 commit a367362af00ed349915b0b4496ebeb9910fc86e4                                 from 2025-09-21T20:07:58+0200
-- Using Git version tag: 2025.08-283-ga367362af0 on rtl_433-25.02 at 202509212007

rtl_433 -V
rtl_433 version 2025.08-283-ga367362af0 branch rtl_433-25.02 at 202509212007 inputs file rtl_tcp RTL-SDR

Pass GIT_DIR=.  to the configure step similar to how it is already done for
the build step to disable this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl_433/rtl_433.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 0af25c7936..60f90a94c7 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -18,6 +18,9 @@ RTL_433_CONF_OPTS = \
 	-DBUILD_TESTING_ANALYZER=OFF \
 	-DENABLE_SOAPYSDR=OFF
 
+# do not include Buildroot git info in version output
+RTL_433_CONF_ENV = GIT_DIR=.
+
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
