Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7A2CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FBC40781;
	Sun, 18 Oct 2026 14:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okj6Yjx1FvOZ; Sun, 18 Oct 2026 14:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6474B4070C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333480;
	b=VDP0fgQI46YmXjwnQZuqcqBjFZrDYNK3TdMUASS3NhbTz0AsBO5ZHuTTB0RILYpjB3/N
	 u+IZMA0eU88NzGGHHsy9hZZLN51V5jddx0cJekwflyfy1X/Xpytm/0sLp0O+MpOXDRRrg
	 Nkf/t/5I6zwoGu+0EmraacBFgR1dmC8VgNfd3BZUbm4z3XOCedERSSKnm0DIK40nlscjw
	 JJXiCrKcCl+iJvEbD5/hmtvGUsSoN/7ZI9hYCkb5jXOTkA6vHhvdUOOdmDQCmGjQTa12H
	 GjrVI1y/oIRNF1JLeAeTVvHvorhneMrON3YehmDrRgMpxpIjjlDgbBEhvaN3PfUbk0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4BWR77XR7yfxJwkfdOl4PC23b4qXrNI/zWHVJ8BR+EY=;
	b=RExhKHkf2XHSzknMhTrcLsS+CQ+iavdhdS3+tOFQpJDWvzbOyOeCcD3jiAhNs9g1oJVs
	 pTSD/IHiGIUAhtvcty3SlNmahL/pYKagbLFgwrvOTBqZfJWjes1pV69LqX4GHNKOvCXFT
	 hJOSQvhb8mcuBGtwgizbwTKVXuFCEdklE1f2Ad/TeUAINFhAD80gNmukR1PDpBJVlPL5c
	 7X7g9TrAMUvaSAk0B+A0XnbmivNZ554tcnGK8Vv6uKHTf6KzKTPnFEVkbg1zbxcT3U+Ej
	 7FYEA1r8U7Au/RHbtw9htbPRsXwStcZWKG7Br6GpKqd7ym79M2uNwvUsrwjw3wEjX1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333480;
	bh=4BWR77XR7yfxJwkfdOl4PC23b4qXrNI/zWHVJ8BR+EY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DNbW9LvZzZphCMw03ZkUcZBgvNG2ik1uZt88+B6hi1myFVIh/DSUujTZMMdoosCHH
	 iSaNs40hwbBpGNIBLFT9HJbdsGHNW5b4yzq5XtII5bbGGeh+KJLmwyEfCEDPmMMVl7
	 7AsI17MeSneHKNBbKAW/w1i+luRJGrx8xTFC4Re0L/LjF1rQn3c2bIuLpdUueU44ya
	 jQoEbXJFaVeSIMxB07VMOyJtHYKWvBUo3GVsbceVk6yfjnRdL0Jq4XQQ+XOdwv3Cwu
	 0uQyOvaeHW2Sc8S2Fh1G+oYYZHrxYQhEITn0/BwmLqd/E+F0hut8UmcehOnruZacDT
	 NT/t0YoYUp5Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6474B4070C;
	Sun, 18 Oct 2026 14:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E919B769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB369400E0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iaxgb3_3n5Ry for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 226CC400EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=TiW33hPQqFE9OrypYoUFy8op2M8rIXInvdb6wUlo8o9f94rOFpE8XElOxKYtGlEMLr7y
 XF/o0OMrMnopMDQYzpJhLUNZ4fl+rXxP18jMb+WOzHJ5aUhb5TiR2Fs2UhS6Dt9Pt8x6K
 ZP78aoAZZIOJKVzjy7cuUpY0GJwKyTgvqTHSXEv26WxQAYYig/QYWT9cbuUsFW8h/jnxE
 fy13Mj5rfeSIvZ+IhQ9iE0SdYj2JiAfpJCrA6HFT8zm66VhgIi7gEz6WWRu/onjrtceZr
 VDPEDHa3AR0Zf9Y/MhPQAghaLdcO94lUhWGvBMaRHeL5/RJ2ZAQQCs0P7nNnTEhg3Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HH9f9gUZhRsjFzzzez2j1cxPtFq2iSXvDIBM6N2oLt8=;
 b=ppwIOU3iVePfgWoHDumX8YaYJFCgxFP1reOxAHTJdaGyav7cC2noE2KNl2hfQgsdx5m/
 w4XZgQUFw1BZk48BWCyS433JUsFG22+8tI+uJ937dQswrdUZETIVvV5RH0N4OEK8J42VY
 QiscQbFvL80jZAtKCTs++9wQFl9rfBybGknVVRbIfiurUPixwung1GXgCw5WyG+jVimTd
 ltUcUsKRKduhCqW2M+QZhzmhvWZvRXaOr6hHelJnEZosipDlk1CBcXbaFVJu/NVdFVOCr
 ufjOPsn63tVAx/TgDSxx9kf/dmR53LgAqXcO09aCNIqyXoO6JhiGr998yZ25O6qb3gA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 226CC400EF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 119A498283; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 568e20810739758e3f9da6ea967a3eb3582f5b23
X-Git-Newrev: af2a965cd6e6c73209e67270eb1bf3ada50e442f
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.119A498283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hiredis: bump to version
 3.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af2a965cd6e6c73209e67270eb1bf3ada50e442f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 786c9d206a..f58478b6a0 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  af5fa7a3efd797b3cf705a347eb54a20  hiredis-3.4.2.tar.gz
-sha256  9a566dc70e9dd84be3550babc56a8e109bb65cafcac635aea027fa425196a7d7  hiredis-3.4.2.tar.gz
+md5  35a8f576be9d497fabedf4ef16939029  hiredis-3.5.0.tar.gz
+sha256  c227592cc56b7df247abe4755c26723965be68972be2149fa441ac33d82131ba  hiredis-3.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index bf6d8edcf7..3550179ef6 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.4.2
+PYTHON_HIREDIS_VERSION = 3.5.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/38/da/41b341ebed1eb6f1074112936af98bb52880724737887ae9bade9d7ce107
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/b4/72/64065841e93c3b8b507d7889d7de371e5f397b5efd60f18c2d82d5bd3636
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
