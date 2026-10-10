Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5179CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82EA0606EF;
	Sat, 10 Oct 2026 20:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyk7mU_HuU1A; Sat, 10 Oct 2026 20:31:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A14B760643
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664305;
	b=pzezFBz7QBRV86j42I9c7Z3FQVw0QzpoBl5u5PsrxEgEbLXaYpqnZe6z4xVqyVOk8hzT
	 biT1cK6caxaOFOwRh+MvyvJ6O6vkWCCLtoB/o17XfjnDe0ueN1nnF72bhzwb4NusWzF5t
	 9o8LCfBE66uY3ZoCF8eVtsFq5tj4Lw4bCAS0hkf6VUlL1bGU9Yl3gquOA6ivqefy8dh+b
	 yg4VIoM0zLI4PFQ0+8y2atD92CIgmjxD2qiUiLPMY5V7zY3fdjbNq7Xwfxw5I0MHfpr+c
	 /r8NTcNCrN4iOnD0CgZKQoaxRbepgyU5ha0ZvEs51WIpSFXwSymMUa96laeMeq3AKpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nr3DbDt1ThuWzNbDv1GtP1+6RHsvo1Z5ssF8otcf+S4=;
	b=VV71IGuDKLL4Lr9foEN3i+38IXm7V+WVjxntdUSv1e98jodPxwOwvSmQbMZ43+tQKfC8
	 PFvYjUNJywNGUNPu5THrYotwE1jwU82PVBJVtJaZjliDuNuyd11eXICW7lWuPhe07lk1f
	 5NQ0oWvCpAI4BxppAJMd8b5i8HNKXTH+gB7HFr6vf9lxY7xbwlpzZ6Wk0L66p7V6Za7VG
	 lcL7RnK2PHqkTllqdKX20JFh4i4ROi7veVfoEPDJF/+tkqmg27olqE0ay0/ZMgabfryh/
	 gaaIqQbJLfdLBZ0joiGPpurBvCHRvW8H23cdpUehiKzy371Uxfjg4TeH4/V86TfLd6Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664305;
	bh=nr3DbDt1ThuWzNbDv1GtP1+6RHsvo1Z5ssF8otcf+S4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YhyUNWTglfZRWSbPzjkWgLd+0CEJEa64xIeydKf6vc7YuUmHjBFOnlnnpQRzF8ThC
	 V3ErtJ4vfiztmImiM5kius1QprK1CBumgHMbAWEVALaxIFSnVDRC+fYbIEpkmLhI91
	 uyvldSkcvW8xnj646XaQqBsClR3cFI3GMh+K27jN68keMZbe19gBkICXSlZqYgK2af
	 X/opeI5vBjZk/m9ZSIl3L6dvY15ySO0GJ+SulZ+W4dZGDYOmWm1s3biL5j2E9sYquO
	 w3wzcsNjYrdFxHZah23S4xOLEAJxISBIZKrNOlw/ZUIH/9u5kCl7eCwrAxK3p6829h
	 WnobPQ2Cbe6EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A14B760643;
	Sat, 10 Oct 2026 20:31:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C46E5156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF93B400AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xT5-WqU5G_2 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:31:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A14A340004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664302;
 b=qXvpRC+s1sBv7xDkaFEbUurXJkEWJTKza6I/1wNoXfKvzhTuyLG8ymW1a6UNWAIxSBnf
 2PUy0EMRl90ReU78/1HQ0Yc0RiDa2nm4X+tz6VnIfyJAyyNVoPa/RIKk0k/l2zVNGvRwp
 O2ECGCmcbZGht87uUp7out7MnCbmLVh7m06Y/i4dmOLRJ19Q/SQWrkJTXMCReRRWNLndW
 XYKbJlxaovvHWCU1hW4RT/CyoJJ6G5OuliWKRIVGwYYdx1rIrQbPgJkZcWBHxfbkvjG1G
 EoOWM8h25tvLpIFB/GZYAqCK0I/UhutjwoxZ7+2E1isbZNj+SHNSVgLHPYwujrynGuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664302;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=io5xUCSk4oHYryEDaP6PRtQ5dLIrtsiQKBBa6eiFgCk=;
 b=P31LQ5tb7okge3GS3vIY5W56NSpXoSenOaO7RtmT5XdJydfVL/RQ3cLumuQMQU2mds7e
 UyIpS+KV94tcaZVK+5lbDobVCI/gb7FHkIyUB35VsAoSMPolztIYnwQYpm2Xw1fbxlM3X
 RwMHbfWjTSdzrogWhQn0lfUuYMkx93LvN9H6T7iO7FPV5KVViViA+pCQ8qTpx1yZckj14
 MXGpP9yueeRH/+3oN1a4dRYdmOgLKtVCBYgiNxGVTM+V2XZvyxrkU+dGGmXhPQTVo0Cyr
 MzsyqRMgk4VJbGtFbj0hMY4uoMU+ZcT8Vgfau3bGw6mrN2oUE7tZCvnn9VuOjj2oTUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14A340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:31:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4272793549; Sat, 10 Oct 2026 20:30:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:31:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d42fa9122749979e4e4226f85eca517fb64eb780
X-Git-Newrev: 9f3326812b3d40d97c1f31e4cababe489d55d0d0
X-Patchwork-Hint: ignore
Message-Id: <20261010203024.4272793549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-core: bump to
 version 2.46.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f3326812b3d40d97c1f31e4cababe489d55d0d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 92e97f6755..3c164a3dbf 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  a79f876fbf65e2568c30c9b8a5be0a2817bd314c2aa483b4aaeb80ba8443cc4d  python-pydantic-core-2.46.3-cargo6.tar.gz
+sha256  cdb7b581d5d92bb77c831b50d39cdd561b45649056e0ee0f67ea0c56cc33c831  python-pydantic-core-2.46.5-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 333c73a21a..0b5631f0f7 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.46.3
+PYTHON_PYDANTIC_CORE_VERSION = 2.46.5
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/af/f9/8a06bea35ef8daf588f707784c973a7046e0034c8d8cfb08828eeffb8b75
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
