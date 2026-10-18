Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3283ECCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA18407E4;
	Sun, 18 Oct 2026 14:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdjtlO2Xir0C; Sun, 18 Oct 2026 14:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCBA94073B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333475;
	b=UpS7j9B54Sh5Wb0uLpMl5LP+/n2gjbpXUteFeOiY3s6AYnRKTvN0hu+EGooTMA6YOmzY
	 Q88KnI5nvTv64nqQENr/+5dYbgGn1dcQr9EzgbHe88Nv4DHYb12cnXE5rjPQ1RYPOc8ah
	 d9KNXAkC152id2BijFpHCPMomBqnO8yM48ENZC4VHxfWZiofbcDjLyxgWbVMmqPy8d0bx
	 sm/2sulqJ2rVw0cjBFwOO6QVC6E/MMfFetY5kGODBBLT7aNw3RefHeC6/o9luc+lPr7el
	 NVqwQPm/WA3tYIdK659fzBN7rzZQmJD5HZt0wd3PHIM1DexZbQd3R1QalGVka6C2n2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333475;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sS9z66aGyzvJlKNzAHUWPvO52x4rzOKtUnFf1lE/wII=;
	b=UVgGwTvLIGli7VYOsJMzUh9todrvzDaQCt0Ta3zECafYMxGqQaP1BHclNS82RXYbj1Dg
	 nB0OAG37XiYtMmiHvJ7B/1uslxH/ImOSTuzsBKvg3AdvmuPZf0CDvVLHI57mGnLXUkENH
	 4NcUIllMvySVeYXQ+MczkVmWshyXAfhrPmHeXy5Pg11PN+ixo6ZaR24aInsHMM8o+L653
	 B6cPMhvJkDjMfAyaX0qd0DNB72qFzZhzV/+fkK4/sSIbXj57E6nd3cNVKnuc1wdusjH3x
	 Gz6eOtDCRpKH7t+UcxFYNBMN8cxOJceJrYirSyerPFHY0sgpVtSJ9/OXrrsdM5ji9MQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333475;
	bh=sS9z66aGyzvJlKNzAHUWPvO52x4rzOKtUnFf1lE/wII=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CAIhRwdhtGj7unAlNlc+zgv2vfMgXN/TAV5/sAU/WazdHK/lbnrlTFhUXC/DKWqRk
	 /TJXI+TSDbTrR/h6bXpX9a2d/lKvl8jWxtf8wwh24p6bJaMTfyN6kHkzBjfgstaVBa
	 Jsj+itV0LUsxA6CRqn2o6WYzAR9Sb3czVY/xm1gC6ERTHuFlVoE9AcXa/qC2vLp/ro
	 5sYDWt/UYkeSJj3UsSaadNPU1rO9OJXm406fD5k/vnIcdSWGVeevSZ8lh2ujQeaWwa
	 Bsy8Lj8SnSuRxO7aEGY7LcWT7xPjZXULVPzcYy7WYdPRsJ+Nkp5NTqHm3HKGO2d3JB
	 sd8+1aQJVre4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBA94073B;
	Sun, 18 Oct 2026 14:24:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDF11769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFD67400E0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVvzKZEcFLiC for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F0968400BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=s1gz09OexHf9fhAbFSSPVptFp40P/GAE/oAJsWRRflr3tIA9nfJBXmKkOul//urVurgY
 /7JznqKnGz8s8mINfkb+oGIIYjopAGaZf0bXcUe8CGy4z0Q6HmCHbU3yV79kwdBLsTsl7
 LG8t1kFNlbsUdTjSwCxiuBxbhzgQEPTxIxH/LRfBtx7YENHGljnnzIm3G4QTFC3SRMF7F
 ppMzYR5ho0D81CUgs5dIrYePlsBouIqjp2JTrVEKdGO1Yeb8KfVEv3O2hd3XFkjI0uAxA
 ngjZY9OA1hS8VUF0MERalqTM6RMIBpecJ8mzX1Cc+K4VPPxVxxP7Q60jxgcoihCkLmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h2Lcsh7YWtKGIsRtp3ByP/UoNZ3EvlaFfosHwo2Krq0=;
 b=Sr80nc+vWHHr6UlQBJsEvi4EEAPwm14l+Si6cp9cNt263gl4g3Fo2kB8IXuG1cxaVIjA
 6rPZI1Y2eWqtlPPeqjwKyMbqc5wZXE8ptRg0ebf/fStxvi60vvLc7LtnpCTgFt/xjR/6+
 lacAoXZuW5BLviiT+HaUy5odt3mURDG3xcGg2yvvprP7efj9LDyJy5rvfbjN7fqloZtEL
 qxBm6745tmcKL/wNV7Kcg9wZSLIk//wtTOHPtGEVzzUYDHd5Z6bZSeUaSGGCMuSpIu0j9
 bR54Q/FzLGWAntGh4XolDrB/6TQ8X6PRykNdewfFDnTsykjv5RPAIlgeU2nPTY3GaSg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0968400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1EC0976B0; Sun, 18 Oct 2026 14:23:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1200532cddb6422db3e3eb212cc0bed7a5dcbcb7
X-Git-Newrev: 4ace110ce2656eb9aff799fd78953e4a0f2f1fe8
X-Patchwork-Hint: ignore
Message-Id: <20261018142303.D1EC0976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ace110ce2656eb9aff799fd78953e4a0f2f1fe8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 80be2af490..d4d1d652ca 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  1cd0ee2e9db394c77d013ce31435c200  filelock-4.1.1.tar.gz
-sha256  7ba0927482c5a814b0a7f391d029ccdb8010f576f0a74c0dcde1811e8bc4c1b6  filelock-4.1.1.tar.gz
+md5  888c3cddadef907007cfc425640cddf5  filelock-4.2.0.tar.gz
+sha256  7a60906c75227cf04d0c273afadc8219400f11aeb13cc69591d4f6cdc6c8036e  filelock-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 376ab42dee..7c9494f8c3 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.1.1
+PYTHON_FILELOCK_VERSION = 4.2.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/c8/1d457d9150ff948f2ce6ada7715e0eeebbe5d3b58a45271a1e222474bcd3
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/f4/a9/1af41b37c3279712b22cdc63aac78a52432202b6fe1f9666a2a3d2831fb4
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
