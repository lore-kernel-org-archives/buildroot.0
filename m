Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B11AC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D19B6821D1;
	Tue, 23 Jan 2024 14:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D19B6821D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hA5JacbJO06k; Tue, 23 Jan 2024 14:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32CEE83298;
	Tue, 23 Jan 2024 14:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CEE83298
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 968AE1BF318
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 14:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C580821D1
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 14:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C580821D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyIH4oYP351j for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 14:02:25 +0000 (UTC)
Received: from webmail01.frogblue-tec.com (webmail01.frogblue-tec.com
 [213.183.94.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C28081310
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 14:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C28081310
X-Footer: ZnJvZ2JsdWUtdGVjLmNvbQ==
Received: from masenlnx.homeofficevpn.frogblue-tec.com ([91.67.24.226])
 (authenticated user maximilian.senftleben@frogblue-tec.com)
 by webmail01.frogblue-tec.com with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Tue, 23 Jan 2024 15:02:19 +0100
From: Maximilian Senftleben <maximilian.senftleben@frogblue-tec.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 15:02:11 +0100
Message-ID: <20240123140211.105695-1-maximilian.senftleben@frogblue-tec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=frogblue-tec.com; s=mail;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
 bh=kAlZB2MSuDXzo94wTNsc9cBBV1zg8OpYcXH3aqfWEQI=;
 b=jNkq/CpsN0CPKCpCNmAyH3Inxj4U2f6GHPzMZnLw6z39QjbLF9qwQ127oSpu+o3X3RAWL+rDCGGx7
 tt5KneTwcw7MxViMgKkUFpDd/SuJ7UucE7AYnUjkcc30MnxIY0v9MGBxzu0Cpp/wj5AhGS0IpPCC72
 18a9KjlpMk2dZXeRLM8LTqqf+s7aOigDF5BHdDjCdoPmIv86Y0wkL7+fDCOpTIa303aoJ54ZfjOsMm
 xggh9nKUFQLVzD26AH/QiwGTwpYKf0lxoe9WQKx6auE00mq5TFG/fv6+svn+toP3amPEV9y7T00yIx
 mOeDwd9UsZ9NaI/yUsdWDVlW3pTPTMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=frogblue-tec.com header.i=@frogblue-tec.com
 header.a=rsa-sha256 header.s=mail header.b=jNkq/Cps
Subject: [Buildroot] [PATCH 1/1] package/opencv4-contrib: fix INSTALL_TARGET
 value
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Maximilian Senftleben <maximilian.senftleben@frogblue-tec.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The variable should be a YES/NO value, FALSE is not a valid value.
E.g. the yesno-to-bool cmd does not translate a FALSE value and therefore returns invalid JSON.

Signed-off-by: Maximilian Senftleben <maximilian.senftleben@frogblue-tec.com>
---
 package/opencv4-contrib/opencv4-contrib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index 52d2682b26..f8c8cfd94c 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -6,7 +6,7 @@
 
 OPENCV4_CONTRIB_VERSION = 4.8.1
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
-OPENCV4_CONTRIB_INSTALL_TARGET = FALSE
+OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
 OPENCV4_CONTRIB_LICENSE_FILES = LICENSE
 
-- 
2.43.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
