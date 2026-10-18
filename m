Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F537CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6F560748;
	Sun, 18 Oct 2026 20:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZi6UXvTCrpw; Sun, 18 Oct 2026 20:51:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D6DBB60724
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356683;
	b=cOjbnQmDvQq9p4pUBWpu447EKaH4/iVo5omynzZdS21V8b5o7JlkYN8Z4IyukHbtymDZ
	 sgyjYd/iTnapQYrBJ3ELI3kiL8ygvejYqNGPKdgld6Z8lkWxidw4KSVN0PGfofhpL2t0q
	 Zt9wR/3JzWWLkjfSi8tKyqYzvQGt34HjqoG1u38TO3eD3nLC06+GG9iKmfc38zmyBQhDb
	 If+TqiNXzWLHGZI8PQQAdCgbfVLvpATMbD1KDig9qqGjAUfeWa8np5vDDmMeS703JI+Ft
	 kYgeiAb1li6vxR6AuPBqziKU3WOEZbS9LXNwkPuvL5n3HmmZpKcad/tgMZidK9d1mwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356683;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D1vY8Oj22ySGqtGaJjOlxQCIhhsADWA/3wlxHVI4Cw4=;
	b=Ma38CqL9CG612Z8jDBDMI5y93cd33JQdLed1Ntrqa+ZvDlVA3Gxc1AXL4R5cp8faCQY4
	 EZ34ggQqR4VBNxgnHMuE/nrwKUrXgz3jsOCST2C3ln2/wXXagoINglr+TCajW7Nmsin8Y
	 Oj7uMLVOfnCydaIrb+DttJMbFB4mlfqP+DxcByZxVvXdpa3aC/n8yrcJA9077AsXVz0Ve
	 HrVyR7S58ZNl9wKpA6dIjpgerBoUm6BTVHfyLoVYq/B/g23YQOVc00v0snrOGXEkZ8iy8
	 zp+wYviZcZiShlRImldlMeTy6NoBfxbxDGUQPkL3PiuYWItf90k9tj/Ce6U45zaPmfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356682;
	bh=D1vY8Oj22ySGqtGaJjOlxQCIhhsADWA/3wlxHVI4Cw4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=egfDFAGoa8Ej3W0CGTRTFVk+qNz6CYcD3nn+SVAUpaoMZ75Q+jrSZ0Z8txk9zVsg3
	 O+JfATDP/6F8aGPoML3eaCdAOWi3X1kvWRQND4kcalOUKhpEN17IYkvwZvh8NE1zmo
	 Nm930yjw0TkdDw5aSg7J04Zm0Tx7Dtk7OtgDwk8o+ZOTtucWIWyYFdSxBW9Gl4IwLC
	 FAMzycleqQq4rd04Pnp4fUmTFnVQh7ffcqRxMZba5hZT+0ZRlQ5Qet980xXqzuYG7b
	 do9yYFYvrs4pOry9C2+Jh2GXrtIDfFWxm0lClVntH/jwH+RtL1tor8Ljw8DMOnLcHc
	 GmcYkHa+eP+rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6DBB60724;
	Sun, 18 Oct 2026 20:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC63DC9
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84586406EC
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YTbf9gRR6oN for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 71814406D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356676;
 b=DS+caCaHJ9MQWHoMh982F07Is9Z4F6TSyiTFAAQCYsTTD4l/KT+NQZRwejRG0M8ZmDHt
 VT72Adzsd59EtLoucC7ugMsK9Pp/0/Bo+Q5zlVr6y44g2J03CpkKVgAGz9A+IErwKcpiT
 J1eEXZ/xni4SZjXs3W2AMllgQk/M/ap+iI4neZm9RzCJJFiLiPEGl6huYo/r7Nat/u3Ef
 /TfwWgJkbR3wxBzvxkn2BY3reA0V+4DN7Mh09rvLCAPgTtDv6Os6ZSGIfP/5kwf3EEc4Q
 E0P4DMx0Dw8dMS8wCBGcJ68IDbvUi4huYYDq3AajNpVZLqEvtFpYoHj15jn5hJkcuEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356676;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4ZnZNScxcodERFbfT+5v6TQnUGyyYvxZ1o1J92ZRyHg=;
 b=JDDtXp9puqMMEXocg2J6pcLqqsuvCmt0LmzLBA4bNKGw93aNqeRfPluanlPQ5v8LJR0e
 t7RNk8sb+f1VJfzM/pov9z+qIP0YANzJfPJlbvTN9ILwFn9ekOsAAmN0d6UGoGMv6t77p
 LubVb5zXxxFIFwl8c32VVzoq1LyIzsk6n/wdm7ROV1bvrRniTyW9U6w5Y28m69hfGyjoX
 lyKnBsfA9iAwDH/V6Vl2gXqwbkaZbAvQGLjZtni5h0MSneIVTcLLRHK39X9I3WYiQLwOf
 4WyXvDeVqwOyQM4DPBVSipwnfN/lbXPClEAbis+AR7Q9WhPeHQXtVUILZftmnqhyu3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71814406D2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14DF698438; Sun, 18 Oct 2026 20:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed800f27f749339035951b0aa975612642eaee56
X-Git-Newrev: 8f2cab663b9ccd2c3b32a0bbe2c0749a3a82b73c
X-Patchwork-Hint: ignore
Message-Id: <20261018204954.14DF698438@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.13.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f2cab663b9ccd2c3b32a0bbe2c0749a3a82b73c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index b9051298de..4948b75cd2 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
-sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
+md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
+sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index dba59abfdd..2e543d68f7 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.0
+PYTHON_PLATFORMDIRS_VERSION = 4.13.4
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
