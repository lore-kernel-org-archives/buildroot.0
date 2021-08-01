Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DABBC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:41:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3578560E76
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3578560E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28604033B;
	Sun,  1 Aug 2021 09:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDwTEr5PIzfI; Sun,  1 Aug 2021 09:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EEFF402F5;
	Sun,  1 Aug 2021 09:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCE61BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E927401D7
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlvLDBKbQXF6 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:38:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500D44010A
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7622D8A388; Sun,  1 Aug 2021 09:38:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:37:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64ace4e5f146c34c3315c9c89659a3caeb3a657a
X-Git-Newrev: 4c1337dbc3f2c13db698c7b0f88dd920591c8e96
X-Patchwork-Hint: ignore
Message-Id: <20210801093845.7622D8A388@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: fix host build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4c1337dbc3f2c13db698c7b0f88dd920591c8e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9dfbbbb4105c47602da048c9bb9499fb8862e768 wrongly removed
dependency on host-python3 or host-python resulting in the following
build failure:

cp -rp /tmp/instance-2/output-1/build/host-gtest-1.11.0/googlemock/scripts/generator/cpp /tmp/instance-2/output-1/per-package/host-gtest/host/lib/python2.7/site-packages
cp: cannot create directory '/tmp/instance-2/output-1/per-package/host-gtest/host/lib/python2.7/site-packages': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/a1d2e100a65d7c1c39c20bdd5bf687a804c94305

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtest/gtest.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 474d127312..6447954e36 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -21,8 +21,10 @@ HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
+HOST_GTEST_DEPENDENCIES += host-python3
 else
 HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
+HOST_GTEST_DEPENDENCIES += host-python
 endif
 
 HOST_GTEST_GMOCK_PYTHONPATH = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
