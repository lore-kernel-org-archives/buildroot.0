Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00277C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C02543705;
	Fri,  5 Jan 2024 13:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C02543705
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q52nX6PJd88d; Fri,  5 Jan 2024 13:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70C1E4370C;
	Fri,  5 Jan 2024 13:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C1E4370C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAC421BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B16435DF
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2B16435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6eW76KPMm25 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A64436BD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A64436BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F0C0844F2; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 14:00:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ab4b55b0a790d4eef105535a0a81410e2c1a842
X-Git-Newrev: 55b0434940d46bd16ec1d6063f124c9560e4ceb4
X-Patchwork-Hint: ignore
Message-Id: <20240105130113.4F0C0844F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: add trousers optional
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55b0434940d46bd16ec1d6063f124c9560e4ceb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

trousers is an optional dependency since version 1.11.26 and
https://github.com/randombit/botan/commit/1752f0d522eef9a4a703fccf702b4b026c1c1d01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 59fbc950b0..52019f36eb 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -67,6 +67,11 @@ BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_TROUSERS),y)
+BOTAN_DEPENDENCIES += trousers
+BOTAN_CONF_OPTS += --with-tpm
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 BOTAN_DEPENDENCIES += xz
 BOTAN_CONF_OPTS += --with-lzma
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
