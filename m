Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4338C88E5A
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A41FF80E75;
	Sun, 13 Sep 2026 10:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCDhfBcvKMDS; Sun, 13 Sep 2026 10:53:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7130480E19
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789296805;
	b=jTK8KEZREA3vFL+Z50nOzt5J5Azc5puWBZsTXd9spe0dcS2JssJlp3ED6Pb3hY2mZ4Dn
	 XYx4XyrPGaOaVl+7DU4LB1pW+ROcF1J7vBWNIdtrXf9z/Ls4bxb1hTG9MvGm2V+UDkMaz
	 o1mFJxFb/Nt7nMZjww5OcTU9TRu7LVpXDkCFYrhYz8b9Czg3lupnUHxRJVj3eXOHY30JA
	 +KBHQWS9Zs8M0mXeS6KJc0asVapq7qAiKNnr9vr3CBdNitiVDWc44GIEW9D8gBaBKH6T5
	 lLnr33KxpSYJMxdWVM7ihkP5gJ4sUS8+OoNdP1Klu77gFVOI2QEKQFCcAXRbxydxhSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789296805;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/YeMLQkeEFzYmJBPGiHs458MMRgzL9+6WJbdxb3ztGY=;
	b=U2JtwiGq1Om5AxrTAdOe7YdGKuesOQ8kS8SaQOC9WCSwS1LTa5ZCDKj60IwhOYC8XHi+
	 CFtWhvkzy3Z2FGPEdIQrHpIpClc+T1B4R2AZVFU8EfEASyzr/fkyJqaz4aOLLlYS3SUqD
	 sDzFvbctJKpw0g0fOopAXS/V+PcPWbdgxfjgxSMss4Qnltn+sjh4a/srQwilraoi8C3uD
	 fbYPi1LSMGzaUZGkhW/MlCa2JmjsqEkmRwAzcJc6NkdBm0WP14+xL6mOXoTEMQm0sJxME
	 YyIo6QG5UrsDAUyFi8JVlIDU3J3AKwVY5+cHJElS6dunCRA2ThwriKm4pZIPxbR1auw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789296805;
	bh=/YeMLQkeEFzYmJBPGiHs458MMRgzL9+6WJbdxb3ztGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jrADGt4WUIry0h9AQRphNxSC7jcuHHsSDveukgxvcjgvuOUe4IfNh9T8KFAA0lQdG
	 Qh23N6paA60uDJ4Fxr51t732T32U99u/+oSiwaLnI2J5qQz+SooATROIQM+VlzYPK9
	 02X+egtD4E/Oa04R692D+SJWkNh/ewYit6PlivmiizbmbFoCYKH2/77dbM5Eb46c9t
	 5Hu8feeGtCHG3GrnW0aw9xNoC5DmgCg7mD7Uz08HZapk+lqNDhP7z2EGKhd8nMWG4G
	 ZgZoBfBVEBVOiKJvYFTrpHbP9jcfEP166kLLu7TBtdfsyoCVjsHXF0MaQf7fF4KL+I
	 9mGZfSgkRBFbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7130480E19;
	Sun, 13 Sep 2026 10:53:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C1423F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EF980E19
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs9RPaK6Zpxn for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:53:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DF4BF80D07
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789296802;
 b=Xh+0YHR6astb1R2ffC1wGSuLVB5zQE1PXmlhWeqZmho8S30GqGfjQjObwbdrCweCrfmg
 seiBz+N6KwneIM5tv3aNuoDtb6alFZEPOyaWgtZY223JAjbUG4YZpZoycH9Zv19oVsqMG
 PjphPa9XUxC5pUISx82i7KyKlVBsC9OUDAK61OAmbwb8pQQCSJJgG5xTCw6sUINLHVRlE
 I/CMO6qmzArtns/bJngpByYbmgr3V/j9j55AWE87wDtd6LlRKKErW7KxS6XatVfsMvgW4
 TumkIfUq5ghNmedam1SQVErK9bIV6QCQ84rJacQv+q4pxjevJNTcpNuZvI1cXsSzNAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789296802;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NCgMhwPx/sY04H4KzwO7Uk50HRxwPnNpcy5j15uFFXs=;
 b=riFV3k6HA90qnyeMbKvueNV4kY5wghpwHEBmKb0u7JwCpFGQXPWQYEA25LL7zM8rPB0C
 aUf/+H+aLeTbGClf8hjX4L86t7oGxlo14aPXVImwSeCu22HBrB94K6iED9/N1oxRaRXuC
 qo2FBnSRL0clskHlAto3qFCA7MN0Lorb0kFb8Cly+i4Wea4rb91kq6yaauIX5fy0dZMj7
 6X/mxj7qHwPAuUT2YnUyMdsaDE5SaPpJPW6fxXJwEcQMtY3RwEe0fassnagJ6X0tBlq85
 Yq0l25K4NoB4CtybI3EXik04GA/7X4IbV/HeJhFyW+98OpRwjeS9FLOD/XA48u1zgvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF4BF80D07
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1443195BC9; Sun, 13 Sep 2026 10:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 12:46:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ca5af794fcb54d457a4ce5525a9643d1117f8ae
X-Git-Newrev: c314f34213e9fc0f14b9b32b82f80399de896800
X-Patchwork-Hint: ignore
Message-Id: <20260913105218.1443195BC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: bump version to 6.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c314f34213e9fc0f14b9b32b82f80399de896800
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://mmonit.com/monit/changes/
https://bitbucket.org/tildeslash/monit/commits/tag/release-6-0-0

Rebased patch 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch | 4 ++--
 package/monit/monit.hash                                             | 4 ++--
 package/monit/monit.mk                                               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 6fa370dbea..67d907a096 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -10,7 +10,7 @@ Upstream: N/A (specific to buildroot)
 Signed-off-by: Jens Maus <mail@jens-maus.de>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-[Bernd: rebased against 5.34.2]
+[Bernd: rebased against 6.0.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Daniel: rebased against 5.35.2]
 Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
@@ -25,7 +25,7 @@ index 3a6cf4e6..477cdbaa 100644
 +++ b/configure.ac
 @@ -8,7 +8,7 @@ AC_PREREQ([2.53])
  # Example: 5.0_beta2
- AC_INIT([monit], [5.35.2], [monit-general@nongnu.org])
+ AC_INIT([monit], [6.0.0], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 0f54aa08dd..9b053d56e7 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.35.2.tar.gz.sha256
-sha256  4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f  monit-5.35.2.tar.gz
+# From https://mmonit.com/monit/dist/monit-6.0.0.tar.gz.sha256
+sha256  ddacd2a8120aeb2351e4486ee04a17782b5004aee99f2041d829bc4dcf2a5b3b  monit-6.0.0.tar.gz
 # Locally computed
 sha256  772cd55fbcb4e52a99f9440cb483cd348db05b7d0712c28023e36d9d5caf0b0f  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index bb38d8245b..11da2809b8 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.35.2
+MONIT_VERSION = 6.0.0
 MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
