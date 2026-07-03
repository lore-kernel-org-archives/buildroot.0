Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E296FC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADCF560828;
	Fri,  3 Jul 2026 19:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBKMLALTPpuK; Fri,  3 Jul 2026 19:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6586070B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783106308;
	bh=vtaQGFaN/MFKdYD5PoY0Q3QPqcVJpNadPy4K8njycDg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YWoAFTeohO9IC54K+oJEGo+UT7sq9paAXl4zl+DWsZmi1dx7MEPdp0ms2yycKJ9v9
	 rxuGvp3r+VdchyNafbQ9woOSKRLr+QK16e9tyj9ZXqxT6WMauzQ0jXgQK9hk4KF45f
	 Jy8n0om2yKjTiRoZQwbxBXOJX0dBFz3C/tf+ZWs3ay6y41IfczSJh2dfxRDBBfWLVW
	 0ecS4LMgvSpJHoZRdfCSy+qW5nQitDOyM0fGjdnJDPtflYP0Q4+vCkPnC8yPa/NhBK
	 hEtCFgdNIQf2X6jB8RIUwmFtJkGL3Z9qix3zTG9fwqmJuU0lU1va+MQLLXuUroRe0h
	 yFTxsX4MUrZEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6586070B;
	Fri,  3 Jul 2026 19:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98F1214F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EAD940056
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esKyO82R-4Gm for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75B2240042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B2240042
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75B2240042
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:18:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B450A4C0465
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:18:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52340)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjP6-000000008QT-1Mmv
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:18:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:18:24 +0200
Message-ID: <20260703191824.3692044-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783106304;
 bh=mNOYZsTWihn9rYn7do/9Kn2YBR8yUok3hHBx3tYKRF0=;
 h=From:To:Subject:Date:From;
 b=Aa0kvz7MDTw9ulTxiWtyMZ2EeU3e7zUtBnayb8WRDBb+YpVUsj2FtlVqMNM+OA/4E
 2tpAky6EdiH3w4E6Y+s7m4oXcAC+1hQ0f9ocHOS7xQcJK/4wJgwna9XQdYe5sug7EI
 AQwNhAUQ9mmSN2hHZ0KQkZMyDh8vnH2rA4JEh7TTCK+ALOGRf3fHwAfFgi+53aGcED
 CuVS8ZBH5GgQtxHu3qZWQb67POJHYmPy2SBHuTgV6DlKJvVwKF/FqEPIgrt68QU5ig
 PM/M5bxgz0ESSmz6BzTfs9h5sAeyW9kfkch+e6cb4xwZ6Rbpti3t4gB4F+A8Z0c45N
 XX7obBImkfuhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Aa0kvz7M
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.22-Omega
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

https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.22-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c943e4775ade2280ef68e0bae62da7c97f60faf9

 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index dd9be8de87..4b4768af82 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  31b441cd3bfd9b7f773bf4e80a71a729aa722db28359646fc5667e625cc9b082  kodi-inputstream-adaptive-21.5.21-Omega.tar.gz
+sha256  8c9132597fc5d047657f10873c09f9f6837b73f140b7a59b8d72929d37fc79f2  kodi-inputstream-adaptive-21.5.22-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index fc79a31772..c03c8e81ff 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.21-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.22-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
