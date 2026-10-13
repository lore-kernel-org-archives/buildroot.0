Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEC7CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 302C880D02;
	Tue, 13 Oct 2026 20:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEJDls4BU4Mk; Tue, 13 Oct 2026 20:52:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6346180D43
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924774;
	b=cOj7cJeGCrxrLoweaMEz30B6SpdY+FKFaDP+LzdjoWxQkI1fJ3sdmOW14xXbyPZhPjCG
	 pnujAmz5299saSEXvL7FZY67HORybwhOYZDUgQMW4FF+YchOZhmrBP7kiQtR0XUuGJT3L
	 JdNuLe4iAfxycXKY8joU6wmgJdjrjowIymgJnN/m0sTDkm83iqPyLLyy6fwmslvtfwbBd
	 H7gfJ9RwmZliItDBZqdLjGviJWwlyDIvEr8UqS1P+95iGRldxAg9iwZneUlVN/fayz18x
	 Fwq1tS3JDSaVXQUtOdoVHHPhumQ+ilL4k7xPHLivuSQaBi66mXBGwTDcl633JVhEZHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HwnYj05vHK5eKqJHpHBJVo0dp70ezEMly6skANTAJ7U=;
	b=lflol0B1ytwloQlfSeSy5Aqkqo04gp7TcNwMHSg7o6ONF1j33INp2IKwHSj48IvYh8jX
	 6JwNfiDcH5QR0RqqOlWswP9r5k0XuKffHC68apGVES172hIJRr8AeNplco/zyJdJDxTUS
	 j5Ny40mdUAZbwICs/Is8B5UB1rS1kDqMozNNgn1UCVQ0tCEo0N0lgpuNRr+mwp5uiSiw5
	 FYk6JsFR28oFxi9rVznnofcmgNgscyy2UKO5WS/Xfbg9CG+tATtBNzs1yI9s97ps934ao
	 b53HxIXnO+mvxv44GXEcKwwIdCSDz7NxvNxS81pdohayIdTK/VbgkYjPTTAuPlW3sgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924774;
	bh=HwnYj05vHK5eKqJHpHBJVo0dp70ezEMly6skANTAJ7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CLEplLU6jO7ZNuLI9iax+UyucBMMLF1za9cWQwS7qM0ZlbWbHqCZv8x8XO/jlReNB
	 mz22Xf8Rcjf49BbDV2n+tyL4e+FR63Uu1FdcpXaTFKjXdZUqFI3FIgQm4F6/bOoMHy
	 t3CnixqWmR3XcAurATKk0XzZ72obzzIVa+EtysjWP4Jvwkz8QAdiW8+txgFU0bFOXt
	 bzoEKrjADvc3Xs6PxYV/IR3IN5ZuHE6Qc9IGwUsd6hdJKrU07gxu92XJC+BZZN9UVh
	 xe1S9OFPejahfJgasoAwXA+ncmLR1R14m7neLoajKpf/6/x+s7rL2AMr9mJJIIHM6h
	 9eu3rfKu2TIxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6346180D43;
	Tue, 13 Oct 2026 20:52:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2310F2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D79607D1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtrTiYPypk1y for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 360E6607D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=mOZc37neBBKG7C7vQEUO7td47v8kTRIMI2DiOnAehCtgPO4KdORSRxwD9zHlkxMkJi/W
 S5DDVH9RJgCa9o30awd96kxu82g3G8sKNK9UDxebVWUyHBcpgrcGKVvlV7F22DPZOC7te
 SAATrxsPdwguoyGMUJwa/OZ0lDiKQvFYbMGcCOzYq6DNWpxCN36MXEEeV98wUMoJmjeLy
 7C7hne/YcUGDqyo/XFwoiahett76DomcVQ9Yf79411xuihcRrHzullJ2HImZrmQRn+eP4
 9Ylb/2azUhnBHTD9Br3SJIwv4T+zxiEh1RCJmbRPZQqy4qfGKdv0VSqQYvrR+eWMW7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pHbIpQNcgxODbIB/x3/Bz1Gu1nPy0xQ4bQb6pF9TN2E=;
 b=NDfmQkc0zHOR80XcVpJC23Kk9Z5yOj69HOdcW5djAmHeOGms4cU8fYAq2380A+RUxGS4
 Wte+SkoNdW5hF4GdDNV1Yh5i/sfb5cO5RoeS2G8QHk+eULB1g8RkhDJq1b/Sq2UnrdJOT
 ZnH6uOhj5gGlydeJXTyyX0p8Br6xxk6KQzGSms6SzRFYebaTAobZmk1s3+uuEivPkYWEv
 m9VznbM1qr9FBoWD1NMa46cYPxBwsbcNfhRmeSXXlSBy+MP0EiK91PryhKWt5lKdn2zYJ
 uXvproD9Pxc/XAls6NtOdHmCJnh5Q22bY+088v9FMXylZfB9Y3jTfHhNynGJp5p/mfg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 360E6607D2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FE17956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60bf7245b53d0acb942ea8e118f76b3d0d63ae51
X-Git-Newrev: cf8d3648ee35d2c7620464ad616478c8bf357ae8
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.6FE17956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: bump to version
 3.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf8d3648ee35d2c7620464ad616478c8bf357ae8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 14e6c2800a..d80a64aaf1 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  5cae5a2c983f959e634ddd719faa35ea10b692bced61b4df74d81e281e514fb1  python-orjson-3.12.0-cargo6.tar.gz
+sha256  c8c68b942934f263e2b2d47ede16c775062797f9a7106b939eb6ba0eb0af0429  python-orjson-3.13.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 15a2cb7873..a96afe8741 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.12.0
+PYTHON_ORJSON_VERSION = 3.13.0
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/0f/f3/742fb1f62b825f2c010697eaf4e828004bc2a81e7e806666989c132c7c42
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/f2/72/380b97dc45bd162d23afe5194721ef678d9eac7cfaa549fe2873f7f0a518
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT, MPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
