Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E40C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 17:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E506023D
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 17:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05E506023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E306082A;
	Thu, 16 Sep 2021 17:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvSkDeBQbiKp; Thu, 16 Sep 2021 17:37:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2D4606C0;
	Thu, 16 Sep 2021 17:37:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCE61BF406
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 17:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ACC9827C6
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 17:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmnNOBH1W5yR for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 17:37:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7881982779
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631813824;
 bh=6m2mQTt5Ank5XRqoyE8EJfDZBVHL+aepcMAIN5LXR3U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=dOmE8mOqCflP2k0I9Yb4JKomG8wr3PdxHecfSrjY8TKQ0S2aVut7XXsxV+KNFcoRD
 3wz6KLYRzgy+QCP12bPl3YPpNeh1ULhzLkeZW74nWcri0ssRBtvCtSFH4JY0NjAJTF
 DtAYx1qf3ujnvX1+1z/cwZuCEniTEKc7t1Lu9UBo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.40]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1mNTTJ041d-00WHFQ; Thu, 16
 Sep 2021 19:37:04 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 19:37:03 +0200
Message-Id: <20210916173703.26938-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:zLTQ2io7+33Xjm3YkyTMc2OjQ2d+xMGXEKoog80d5VQ1f+TwyB+
 KfB33sHcgBiNrwyqh1ji+LR+fZ6LtIT7au9VVhMyk6CX2HyUJ8xFEgHFy7FLJIr1N545SXu
 yjBvcEOjKzwgVHp4uHwKJFu3A0VAiyOa0049Vr9yTRPHQFXGyOlzpauIq9L6PIEML+5gRLz
 +miUFL7URCDSfSPbH+ztQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mTG2/XfBKlw=:Vc2ZVrQ9htvodl/YGGxnNz
 WZB86VPjhGo3PPmYrTxgvlCDF1yLiKaRlgkRyHtXXYip/LMVlKTbq9UHvTKOkc2bi4AX75jbI
 6c2pb8c9qIzyt8shAuZgaJ/4l6LeiOAW7D1il8DWAFj2pkJQUYRUN6kRJlefT9Q6LETg8HQpn
 ZC7LrCJ8xChcOD6ClPswOS4qH1TwjVjDkhFYN/NXLAdIUYlGcJdo1fndVktm9Wx+U4PaDZBt1
 Scm3K6wdm9pNbyzpm5Lt/HibVQNO/0N1CNcK1Avuq2SMw+2sFUFn6dO1jc21IKgjzehY7J/SH
 BGOHdqNrH1UeDZw6dn1cBQyIeGILKbZncQvDMj9OEyCq7ypuMDYUALb3EF2Ob48lb7pA3DVvl
 hm6qBsJSQzrl7gE01X0ELK6qzX8r/Xh0aLZaz11qbT5QzWYKNowD4OuH0VgT+8mu2LCId/YWr
 aGF8TW/OprypBzhj54AoJBTInNcOJ7jHRFHCTQ+oD77ap45R56tuThYttMz/WL2dIzHjQrn77
 I3AHqy6vqcSJmpDEPdcDSQ+EDK3Gwu5+6UoUWIwWmK+INrBXvVASD9Pp2WvLXU5fnJ/bEPmoR
 GGCpV4JmKz64q/FXUN4YX/xwm4yOkpV+/OTF5g6C40KGTvjvOSWW+GhDmGwmTgEJRDizgFxyR
 TUHRXaraIaTlidpL4N+8R4yyxHv447zWQvrZpV7IW03YpYR85D/SLeNFszAIAJGMjWAHVioMd
 EOJHaLPojeRLYj5ilfX4T8c0+uh8YsnVYcvxibBkGpo5ToyUzUWeV8G8KaVvAH28URG44WBHt
 aJ8WIbmrD0cy5SWqmFh9IawS0pvonLSwH8qs2a41zx9OeQ/GRJlw80DOAy8rKqr18BSBhgbZ/
 UQsHhP7fSjVphm+OJacFM2bSBKaIZd2RtzsmyosdyLJjwT/xavTLZQi6cqG/WccH+afr5bn8O
 qLs8weJk5ge24S/gj5w78GcQnwMZp5pdskIEDXZ2UcSDsVLa+q6bf8/zHwJMSkuxSlL9muxK/
 U+2d569Fj5YbbYPK2OO3/KMWhB0qjOC52JZNYY4Yt9ZiXvj5/l+QFF1zgXQRiX7mhgaHKdzYy
 hXnjX0/tdDlC/E=
Subject: [Buildroot] [PATCH v1] package/libiio: fix compile without thread
 support
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- fix compile without thread support (add configure option
  '-DNO_THREADS=ON' as requested)

Fixes:

  - http://autobuild.buildroot.net/results/2cca5952e7d677cd0d5fa97aa1a7bf3e722df3a2

  CMake Error at CMakeLists.txt:409 (message):
    Unable to find pthread dependency.

    If you want to disable multi-threading support, set NO_THREADS=ON.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libiio/libiio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 4ce933a0cd..f706298c22 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -17,6 +17,12 @@ LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBIIO_CONF_OPTS += -DNO_THREADS=OFF
+else
+LIBIIO_CONF_OPTS += -DNO_THREADS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIIO_XML_BACKEND),y)
 LIBIIO_DEPENDENCIES += libxml2
 LIBIIO_CONF_OPTS += -DWITH_XML_BACKEND=ON
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
