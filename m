Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBDCA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD6D6064E;
	Sat,  3 Oct 2026 15:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTz4R_Q6av9W; Sat,  3 Oct 2026 15:54:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15F0D606C7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042892;
	b=YjqudH9eM5Laxwz/NcGUtXS3581HpXXdN/8LxXHnOFqKP+f7sTTdohEpZCp/kELKapT1
	 O4q/tTc/nlsgSXhovWbTpgA0ZX1t7Dvq7gbqAwtr4am1uxvB8OQT3tY/JROHYTw2GegHu
	 d2m1+8RCYc+e5fPSlLKad4cb9NNLAPhqLARN0+t/Leke73Wkjf28f1PYI+E4UTy550UxR
	 aaeY2LkntI6qEavtWJOp8xwcDEdqaRUzBL8NfHNi1WtPQAHesd/8M23WPDIYSD3mga/iX
	 TngRbo1AyxH0b8J5nE80qQjxf5PHNBWIUkA1CjFQFUW7mDzHowdfNIg6TseyNnFGtug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042892;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qygh4s2qvX4Z/AfCOSFUtlH4TvKUoJCwxukHxSiyidg=;
	b=KZtt5h4ijE7n6bDOMVelcHFe2e2lwsd57tvV6xhGMzpnEz8NuO6U3ByB6DulPHUM31U4
	 CYpEBZ57Jj9Q+ueVMPzw3uT7Opu9/LVYyGlsABPsiWamAVVo2dlNpYAxWHn5rkWaIr1aX
	 VCSSW1XQxRIHhobnIthjPf8ECBt0O0C94dKim6TNF9IzcdS86FxTfxDss4ifOLlWRP6J2
	 HspSyBMAn7ri+dgAYoMMpDJkyZFmVsClTtkLfvZMKBCPPGkoEwJmW1hE1PuAiRpvQPf1t
	 1Z7KdDvYxQwmc1HcX5CK3yqsNEBzhJF/uP3SWK5MU5JIq9cYOXtP1d7/4Z2hvY9MSHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042892;
	bh=Qygh4s2qvX4Z/AfCOSFUtlH4TvKUoJCwxukHxSiyidg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HctfO6gR22M8yfJL2eTrs+jSicKuCTJPtjvWG8lXMn9+JS5gXZzKOZ8n32C67FRXB
	 4oGiSN8eIn0oOBss3Gdp7VMKXMZR6zDhIh207QWGKx9RwMcg2dZpIacRHlar1bc5UC
	 ji7zPYTA7ZltjbAJs2ykEQiOQRR+RekuEtc78nsgdfxcH2eUpwaHxj36l6N09h6bRS
	 sKWFdztianXdJJYUl1OQ0ixmSCPv4aG+WE2NveN25rdP//K0dfz1RdCkDoUjKsvTgZ
	 7VhGgsKkksjW+X+N2a/QJjEkPmKIVu/Xl6EkF0GA1C6t07OD+mKL8wXBhso3u6aW+y
	 uUGMlSQPjwiTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F0D606C7;
	Sat,  3 Oct 2026 15:54:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E370476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B45A606B9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bav52BgI9Hiu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 50D096064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=VFpcfJz1YnBqKy1QTv7/GVAxIT5toVZg95coXfiqIzykFBXRSDXL+pRqtk1yXFYLCy1P
 f/J3bFsJaKEZXh7tEwxlS1XIe4wx3Ho+E4dNyeYFSgbEG2Rx8dWDauaZ9hAsE/IG3Pfrm
 vZAsMj3r9l+vOmOSiTnAAfDlYIT4LpVWs6cG3atBpTSJFj1pIoPbCnc0QtrNmyA3Ie3/x
 6tsBmHbwbA+SuFghg51uKS5gf51RAhF4UeMHP/Qr0HhzqUPjFuTRUXpWgOOxoec6hic7U
 bdW8IkU3/dWy/PQxKgJ7sRwedjy4T4Ih6Os9OSbADQpE49SjTWhagyEbAcBk9PlhNWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aFWgMbFUdnGyxWo5vDahtux+L+rHMQ/psJzW+QMxpgQ=;
 b=XshOAQ+gq5NfyIuw6gT1yxIbZSPWS3Pu01ubmQCZtS7SQsTGH2JzODuoahUNstUppVkU
 p/VLq00bCWkVyJeO62eHNEsq/WgzZHgrA/eetkD7MHPsWEWf3erx8Roi9DtgxjE1uhy+Z
 56JjcbWRhNpy8Ksr6t4yqAUPd4Rbgu2o6CEkuShFFRsPXIEUbCTdawZQDaWjTaRkEkvfX
 7BE1e4QyiZDBJxCGWNbvyYroByXI0RPGvJ5Kr1HmHLc7gFinXTI/6tgke31O5Az9dP06x
 GiBxQ7ii+idQFfRfoLkWIMKGWljwtuMcOblDTyVC1Wc3XJu8m9jOvGddgYu2aXLkXeA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50D096064B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 922798A31E; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ee51ba072b92657977cb483cd9dcfdc22c53668
X-Git-Newrev: 8f5f94e74e5086dcc659daa807b32a3d7fb6e87d
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.922798A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyopenssl: bump version to
 26.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f5f94e74e5086dcc659daa807b32a3d7fb6e87d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 84f4b7fa60..9da34a4264 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  e48484d4a915a47a71064c10ede7e991  pyopenssl-26.1.0.tar.gz
-sha256  737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b  pyopenssl-26.1.0.tar.gz
+md5  6e47d45177e87ee8f4c0963e873610a1  pyopenssl-26.4.0.tar.gz
+sha256  28dfcce0162b9211413e26dfbfdf1d24317fbeba18fc93c12400a1856b2a0bc7  pyopenssl-26.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index da31da5c5a..b2536de576 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 26.1.0
+PYTHON_PYOPENSSL_VERSION = 26.4.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8c/a8/26d36401e3ab8eed9030ad33f381da7856fcfad5691780fccd1b019718fc
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/3f/e8/7325d258199b159eb2c03fe32107533e2832e70e63f4fb88a6aa00023201
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
