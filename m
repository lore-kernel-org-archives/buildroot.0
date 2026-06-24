Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D95CDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 18:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E30D60F7F;
	Wed, 24 Jun 2026 18:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1ksYNlVDOyW; Wed, 24 Jun 2026 18:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F7060D58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782327281;
	bh=89qhwasLaC18xT7KNO3WMvoYxbpe3gvLipeEVyt2Jwo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KwNbZhuhV0J2sAAusZbo1SgtvRDwurlKmvd7QV6R2sB2EkN9l7T2UAcGJ6iNCmt08
	 kP74s2vivLrGeWjhvaI/EvGEI5TdFVsHUleOikQ+48wk4dc+C46fTr1ZxGYrUqXN1O
	 XN9qAxfmv3wvvNRmR2iMA0/d4bAaK8vr+Mpz4hQ0m74dphW8thz5HsThFQG5OP3dXM
	 SSgAUbRV+opfgeR+qaj01c89cku8NFhD5gfzoZCX6jp7aWajfZ1Az2ZUdp4Y5hzgZ8
	 U4KKSxKsrusyMvRk15y3gHI6KRs+60qGdmwgs/+s3sk9kLxYQXt3qKUY7xqGObqn4D
	 UQNX85nRbpPiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F7060D58;
	Wed, 24 Jun 2026 18:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDE37256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB33741444
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a25NIuNjVjW6 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 18:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85F33411AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F33411AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85F33411AE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:54:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c817.dip0.t-ipconnect.de [79.214.200.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE1B9A4C0E45
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:54:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33704)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcSjb-000000005QZ-29eL
 for buildroot@buildroot.org; Wed, 24 Jun 2026 18:54:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 20:54:03 +0200
Message-ID: <20260624185403.1182797-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782327243;
 bh=DZfL3zyO/QNZEPEB081EIHj+eZ2XY/4SZEXK4sbjTK4=;
 h=From:To:Subject:Date:From;
 b=i4fJDp57SXYb5xdOxJwQP9jzTngA9m8FCZMZWckeGIMA7p6+DuXUFglQ6W9s65gE/
 FSPYkS+6DQ1IDpK5+5DvkFMBxvq9crtgG1MPZXLA8ow/309zEWG07soJanZrFgkb2O
 8N16A5f8En/YMW1hVp8U/Xqv+hl3osbs1oonD0EfUlTLH6CJFqZpPYZg3HdfP5gFyl
 8m0YKS15Bbcd6xwoLgdu7p7JVN7EAfwoNWxBSs0Q5urUs1m663N04Qjoe/1e46tlJJ
 pKeb+7mq/MeSJ6PdTWyPM8UjvyOrLZiZoTXpg7EBxKhhtHOMSPSBqqwsdWcEubM0v+
 6odcz3Cr5KYag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=i4fJDp57
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.21-Omega
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
https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.21-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8fd9e5b9ad1ed7ddc84f42da726d43e2d918dd13

 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index d05e1c217f..dd9be8de87 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  20922de1891c9980f9807a10edbe2d1ae9224c298c438a3458d7b7105d5b7c21  kodi-inputstream-adaptive-21.5.19-Omega.tar.gz
+sha256  31b441cd3bfd9b7f773bf4e80a71a729aa722db28359646fc5667e625cc9b082  kodi-inputstream-adaptive-21.5.21-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6afbb241a1..fc79a31772 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.19-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.21-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
