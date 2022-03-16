Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CC9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B6FA60F6A;
	Wed, 16 Mar 2022 21:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDoiUiL5ijIv; Wed, 16 Mar 2022 21:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863A960BFF;
	Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C23A81BF9C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B775984336
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4qshKhS8Z2E for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7322384329
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466575;
 bh=tDcQCDTui7f1dVFZfnKQ09vf2So5HWjW/u13MsvcbVI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Of7T8D035ZGweHGJT4b28kv2L+TPwSAEWYHsUfhKdybobQgBtqN4g9OIlzRs/VTvp
 Fek9XMtX73ZEwGZ0QUfkai0pWAKNaKQGc11RbIiCcpJt7guq/VFqsi7EcXlk8/a6oQ
 wRhUwbxXAZX6mEmv0Y16i4Dw1Cz6gmjMXESx8xVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MLzBj-1nmPHS1rIP-00Hz75 for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:04 +0100
Message-Id: <20220316213614.16878-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hRjG90QEVClLK//SSU7H19j2uKJxhWGexpqSZB++S9n6u0eLlSW
 9IyBef2VPV2iEwNQ9KwAvfeYBMFOW3z+DOtz9BGP+2iMjc6muERXor087kBSQbXXjixliGz
 hZMfxaVrZ0zppdChdifKihB3tyRaQEVfEwz+ktpNoHJ6x1I1ScKLltHBCtnmCMENY01g2NY
 BkqnEPur6r5/zOY1VbUog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pIc7GFEq0sw=:fvXlSn7OfCwLmcMCP0w7Ps
 u08XehmqQ3tDoZtwufiuOcx+WWtGCGR4lr5NsMUuGOXVSHQd8i0gxr5eZ4NwpyLorf1cI7RMm
 nrKzVkYZG2gqtpO5zgCKsy/L2/A+T4vAQ0BXV2o3B5X1LM8XmTvhdVNfAnEQLNSdwJO9ZGq6H
 cnRQryLrOky20vRerUEC1dXuCJ9u/FrBnd2TC/m5MDXVez+0+981AQsWszkPOOuBlRDxJss+1
 iM5USZGGz5Vo4vS27h72ufu1QT5GKSmyLdJFs1jubfhNreAR6n71KBAUdLzUgIjrD0ItHepv+
 uONfsOvYASd/cxzDXL+Ft80rMNuTFsa3SU1hHnnocD4UMChmJMzxX9LjsCx+REBB7VpMefN8l
 B4NRk5ncgPCQpQph1vEOc08EEbg3XOlTvKT+yhK+mKDoIqzg6H5arCiwSewSaBaMjwEwhcO4E
 b+yS1YBoJaJMkNrG9MR/eBQy+Z3mLduaQR2Hl3b/8thaP++5XNZ99zSC9fElvYDOhEfE/aLoo
 ha2FQAKcjbjOBYj//Aw64vZKOhwPMZSNj0LY04x3nASTwkP+uSRKiApHxbtX0/zG6sW+Cgea9
 xWZvjlEob25KSDHYMfrF+h9r1ASFcOPfkZ4+9eyxoJGtvXfwGER8vjWScymVZJL3kGDRsPcHS
 S8bY/pZHK9uWEOEg3H6HP6GDT158t1Y+lOEc9s4U0qEsxVZm4T0d6V/0S2W39sgp1qWgFy6yq
 6ouyCntOMfIISj+mneobk+L52dpQmxQOBo7SNt/13WuNv1vZ7osbzlceAOsrosMmFKnitYEM0
 uDF/XaOpVI4l/Rce7fGDOvP+S5KIFE9y0k1powarQ1QpztWPeQu8bIB1ohgUe6iF4zRWzT4Fc
 9q6+Z6JrYcz4Ox/oF0Zgt4lZW9CKx5psACZ/BhSDFMpBhTCr4PQeDV4MXs4ZpSOhIFY3P+OHu
 OfOX/ve5YY0yUZKgZ1xk+1CBjfmp8rDEq+y7HpKKmiyMkeYGRE8yjAhf1eDjmbdmyHJTUPtCb
 ilzhiDiCZeriHRVsnW3OidHPGfkn6mQknNnSzwfRK9Mv5o2X6HeSbVc+KP4EFXE8MdYv0ZxAM
 8E4gUkQ3/46mNI=
Subject: [Buildroot] [PATCH v1 02/12] package/gst1-plugins-base: bump
 version to 1.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index ffc3445cda..748d951966 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.0.tar.xz.sha256sum
-sha256  4cb66fccf730b1037e6533862c2128990912a6db4e5bbd14e0ef914450eb4c7c  gst-plugins-base-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.1.tar.xz.sha256sum
+sha256  96d8a6413ba9394fbec1217aeef63741a729d476a505a797c1d5337d8fa7c204  gst-plugins-base-1.20.1.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 08aac850cd..766af88e96 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.20.0
+GST1_PLUGINS_BASE_VERSION = 1.20.1
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
