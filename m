Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F33C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C2560B4C;
	Fri, 28 Jan 2022 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Veve5phLb4Ul; Fri, 28 Jan 2022 12:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9753060BCA;
	Fri, 28 Jan 2022 12:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0081BF332
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D80384C6B
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNrY2jcatBS3 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABBEA84C68
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643373940;
 bh=ZTLTdTWGZ1gbsEmncuEbFasRIDI3BD0/rEdztRJCi+8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=XWgWTGg9uMzQee+1ioodTTY7t8Z8MnotedBPziRPttxRDwWo6KpC32+vLarIy77fX
 sJ0/9fcWGGCWUpdJDwb8UnubW9CHvAwfHVrmT+kEcZQIq3rrVX5c++BFUiKvF0fMrt
 Jh7Rz2pBj4adlTmvY1l1CzZ0r/ttHQn7cn3DUXNA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.233]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N95e9-1m9Ttc3jDr-0168vw; Fri, 28 Jan 2022 13:45:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 13:45:36 +0100
Message-Id: <20220128124538.31789-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:pi1OgFVZJQygpF215RAiSkopAkOaGiWNRj5gQuqHa77Fn5Rnx2z
 s2QPFmag91BCZTtTCi1pW00cmigIDxnmhGVh3IQ3kjnSVvQmVv7fPfWXrKRfzRBJYBaixew
 CzwYd4s4229JDLEmSZRGgzmBWk21ah6Z8v78olydVRKVuK+rM6OthMYxHhX41ZDc02LDCPk
 zOtfvleLEwR5w74ajNE5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xiIRnNGbbB8=:2AN4RK63Xg0F8Bug1h7obs
 9+NWD3PAUVigZeijtFdXC5Ssyet3rUyJTMnGxlEsv6XYzyOBHGUmzoKR6FtjB4yv/k79SPZru
 KgeEH09f78yh3ww7ACLqsViwDyvtXqz20xqI3uMWNCM5Af8S4cbEOLPRwLH48T0aVpSc7mv2C
 Nd+uxFOwZ875vFHzFcc1UYSwMVd7NGOagjeABDQfo54DWcw3xhq9TUJQdb0Ke1IriYRXErO5S
 PSKWGj/lEe7ELps3UZbMRkUUq0V8s3hRc7Hn6Qqp3QN6tcuHg/Xg63Gmf8Qszfi2Mb9nrpgH1
 0nKYKLXXA+MVMRgKBIgXoOxWDYaY2nUHdRUowGVtcIXtXBJLbAXjDIfa1hIyIvenAgKPvazQW
 JIJSs6EMU8oDo0tZmcsJ6eFBv8Mb5Om2JXy0e0R3eB76MLH+ytBpFyZoA7BFWLqTq/B29vTUT
 V6fAD74aiuoy5hfa+Z3Cr0sbmtriD6NjoSxKPPS+UhvnnJIN25WOl73Od/JQbxqp1/kNfojLg
 qQlgeRDMO8JS81jea+Z4WmeILT/GuGEsjbL8TfAUByxOqx+O1bOXQlSK4jBCvtB/EGSSMhqvE
 u3Jvte1Mo0BvOiZ4Y/++CPBqbQj6bQxwlIfAhtA53Z+2tOkTiLYwv+mbH3hx68NFPCIGjIkl1
 XIFfM6Wp8yhUsQuQHbYraSHoVP7LRiIxwoEbq7U1kZejcC84KCt7Ww9doYHdZL+NFDJf6mT2u
 cBxJ2lKFiuU1NxJ7T98G6KYvVC27bKcA0An52XPhLe357Ffq548HKcjgZSnemkUOCt+G+4vSJ
 pSLc0O1io58h/z//eWZB+ZiksqIAfYNZJs254HXNfdk9iyajpnqVfyLAED4E5TUhIlw04O4y5
 QCOLT2xVtwuIMQO0R4GUCre1QqhOs2gQk68Si5H8W2y3yKB5czKQqnvIzuPZ+/vu4zrZXSpJz
 Bi+UhLh/TtFw+PKcXSrlaeXVUNFOMrBHOuzXve+CGJw3B4v5R1b1pxi2sTcF0Hm0OfVxoQD+j
 l/40zIIKBjGwEdx6reunueH40OnT284zkHi3XTiiH2o5dcdK28hvdLl6dptrMy2t17ATiWoJI
 G9SuzXmBi8vHgg=
Subject: [Buildroot] [PATCH v1 1/3] package/log4cxx: change download URL to
 https
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change download URL to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/log4cxx/log4cxx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index e799b0fb16..7612774583 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LOG4CXX_VERSION = 0.12.0
-LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
+LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
