Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF29CD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 12:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 554D36FD62;
	Sun, 21 Jun 2026 12:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KM26UsXQvogW; Sun, 21 Jun 2026 12:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86F606FD5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782044980;
	bh=YX4IWl7vEuKzR5k4uCuA1ut4MPHtUG8kvhOPaJaOikM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c8cGw2D8XLMBDXHXCPRLxiP5pgpMA+iWp2L18rfg+s2/a4d44iLKpJAdIBbgoUJmp
	 YSb38m4MFb6Sq6ttj9X4Uwpi383YACbg3kENjrBmXA7HKySKyG4xTLqnExUJhZUoTF
	 4iMjGewd7rFnEdOo1shm4spvpZyPL69buQZNSWg7pOYU3Jr+Yw15lSw4KPkee6r7Pa
	 SfYlrqR0Aye4IaG1HTC6sEQT6nNCTGcs7aioeuGKp6pZr9M2gyFxc8kFKE2QJofXe/
	 HLQz/rkFevN9ERVGMi6jkQIeLLJJcbUMRb7yxbhahIHahmxi520Q81PXjTgnBkHbo8
	 gHmYorGPO4AnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F606FD5B;
	Sun, 21 Jun 2026 12:29:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47611F4
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 12:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44E8E42E4F
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 12:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTigmmYwVgJP for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 12:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3092D42CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3092D42CA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3092D42CA0
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 12:29:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55C97A4C0E86
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 14:29:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43590)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wbHIu-000000007cr-02qK
 for buildroot@buildroot.org; Sun, 21 Jun 2026 12:29:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 14:29:35 +0200
Message-ID: <20260621122935.1058929-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782044976;
 bh=VevuAWl5a5RapaLaxUalVL/XVJ3vTNoRbTgXcJpX03I=;
 h=From:To:Subject:Date:From;
 b=dN6M58AZmUFetFaGJyUnmBpgOPBJHOtQpAdzwgtIriDAlvBRhP4Qed/0NLrVpRmJL
 CRVRFc6oMUFS42lXlMNXpEbBqWU1m4zuHNbg8twhf9x0F9vwTN1RBBg01bySo3vqux
 sjRQ1nDMdESP4JkkaciZFxaHuB8jvkVCXM83YmWJG9nVq/xB652EOLqhySwcCX1SeJ
 yMUhr9f2ujgruWt6eMko0KU2cK94U3tCutrOv+N+8FgMg0b7eJRjCKJcWfrusTSejv
 eA/HlBRnrtVC3aOgP7VVfN1/i8AXsyYswVBu77fzmKO1dbvjGgIvJaimCOBWkJdNdH
 3oNXlyAcwLfYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dN6M58AZ
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.20-Omega
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.20-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index d05e1c217f..bd79265d70 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  20922de1891c9980f9807a10edbe2d1ae9224c298c438a3458d7b7105d5b7c21  kodi-inputstream-adaptive-21.5.19-Omega.tar.gz
+sha256  dde5178e425d51fd2cebf85591e36f02b55f7f3f511ff43a1759de377dab3678  kodi-inputstream-adaptive-21.5.20-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6afbb241a1..0d62bbbe1b 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.19-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.20-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
