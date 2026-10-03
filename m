Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F613CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD083606EB;
	Sat,  3 Oct 2026 15:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CalHZ2owe3lC; Sat,  3 Oct 2026 15:54:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C1B04606E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042866;
	b=PdGzytu0wLGfFYbka1VMZ8gTs1sTn0zXT5o4/wsWZU1gHZs6UWu5G5d13L6n3JjY/Tu/
	 Lw86QWUDVCw4NE45lssEuAoBVDIauDllEE7hzkqHRG6ndwKhWsd1Z7OwD40+svATLbcIW
	 M1cRX4Pn0qp/3UrYpSTcCz6ujtSDCNa+7qWXeBtKNIJ01IrciQlJjf2RXV9qp2+InzD3u
	 lSXdL/5hjKgiM0I2xAOD9/GLFKw1b1uZO2ydY77jiBfRFDsTktXA6xk3XyD5FIXOWMOgB
	 vQEi04iScppqjy1ijPChEHjwWXQ/90uo23j4BTV5MPOAUu0hUiqXpMJMsBlVUKRkCFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FI+cAcGn7A9a7v71dMql2IydkcBQJa3hfWBvpC3X1ws=;
	b=nLEyQqK2V1Mq5JmPkqVLlRlxk+aGyUj96IquXApZZOdFh2jxK9hYOTZwzzj0xLMWs7Fd
	 LoyrWcYRT0aviaVLCrBR3OFyQ4ZwfhbOGL9xR0BQJiTjM1PlSocn+TU8fZAkrRzD6Qz+9
	 MDf8mU19DQtAFkxWjsZ6t8S4oiZa5ZB8uIQfiXjMZtrNxczbBQF4lGgQtg9gJdbYeaQ+k
	 aOpsLxpnqIOpjqthUzHvEc2ZerQRH8ts1AmpdUVZUBFPukULqESRkuLaW5vG86CMo11Bd
	 FHSceVpj8WtoKeOR9hWPjDpJY1TXkrayOwXgzFGmfTtJdYuIpq3DTIIxUL/BTP0Y5Jg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042866;
	bh=FI+cAcGn7A9a7v71dMql2IydkcBQJa3hfWBvpC3X1ws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n0+194clEoe/UqEVpT+SRCGH1QEr4aZh6ScT0BP2GBo9XucLuR7ruwAi/6+q5BrBe
	 nPE49SfXY4ZBK4E84ZwXwID/neZ/XsjlcKjX47sJvfJHJ+G9e+lzkkVLN7anXK+R2R
	 S24FQxMbNaqzO5xxlECXyy/rQXJlfF8p3POmZHsAW2mLvm8iD5YRGFhaEN3pJOkULh
	 pt8AWBXcKv4UlOtIjoYp3IYB8dm8dLn32Jdb7c6XXej9fB+3+l7e65ro+7nGdOsl3v
	 d7fuNG/19Xj91vSf8uj+H5Rgvx/M4E8rj1hmYuHbFctqBD+T5lb6oY5/x6mkWCD+va
	 M53i7VJLa2V+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B04606E7;
	Sat,  3 Oct 2026 15:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEF76335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D490A6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHNPzzRokYpG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 93DFE6064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=iidzRWJj9hQxpbL1qn/q8JhrjBjyfTW8Zl1yodCDvU7UYNnHonSZIw66D2UOVwMqwFhG
 A9XfE6V+t0fzB7dvHBH2F05xCN5rzSTmLQ0tqiAlxzFej3kkVidQL7qc2v8+gX7iTRfWO
 oGDTQ8/TorNPXdZ+36IcrY2vJHPAeXYBs1tszXSyxSSehn2bzfrcnckIKxI72oimv2xLX
 36nXyyA/r21rkA7h+cUHv+dW5uMBmFg4XFZ5BwgR1lf8JNHrD8difqExZIBmnUzrNEuEF
 ZFkLYFsmwtNeEva1YDJLOd117QfQGWMUO9dPfLFmiEWaXVI8SJ/N8w/DuPZF0jAqDMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6CPyKUAnJ8hITq0CgEqY/jTfXqavFpwzyrRhK+Vmh30=;
 b=Gwl4QMwoBmYPOP7v5VcipcwJE80nSNrPXMsLidrpuswJ8S6QCaPcm40BB85vMCiYtdz2
 9d4sK1pr1eyL6YdtdHJUhTjBqQxrvjc+cqIcubObA+tTV/fqcG6PwTqvhyLZvcNDKNK7x
 +Mn91Yck2DTomRh8saE+rJRHUcCwBkFlQVbUmSoWic/Fj++qemXummFIVxzxnEFxIJrRc
 wA+FJCAF3B6fWGnn5JIg+qVsv42qcLwHdtVtK+/3hB3g9dJaiU7auA0AryJDkFWJMH3C2
 05B5vHLXwBPrCN5K7we5DSdgS0a7KIZwaK8P7gQ6xAyM+//QoK1ZSeyFcPDG5/mhx5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93DFE6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D479D886F7; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30b9a89e233202840fa061218c2f8322e6bb9909
X-Git-Newrev: 5bea1d30aa7e0c26ddac1d17a03377f67f60de47
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.D479D886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yatl: bump version to
 20260805.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5bea1d30aa7e0c26ddac1d17a03377f67f60de47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 5e11fcc17d..7cf7c0485a 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  aa1ee295477870a084a891f864fb6f0f  yatl-20230507.3.tar.gz
-sha256  a7d60abff563d7eb680f4f97efb107b60b32f80061c45bf4fab15c4ea2a057e2  yatl-20230507.3.tar.gz
+md5  520fff685092743ec36879f439cc8bc0  yatl-20260805.1.tar.gz
+sha256  ca09b1a4be97dece288db44a98dbdd3070f889381e503bc5be7603829879e92e  yatl-20260805.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index aaafef8988..4006f59374 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20230507.3
+PYTHON_YATL_VERSION = 20260805.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/bd/3b/723a667a24512a299e1e139608e787c3b24b7819302c15c7aac09c3bec68
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/33/bf/5456f2fa12811b4ce4dd82741ad781d834ff4f4865b75f775e50c3e9ac3e
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 PYTHON_YATL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
