Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF65CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFEB608FB;
	Sat, 10 Oct 2026 09:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rxEcTI3d8eo; Sat, 10 Oct 2026 09:27:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6D9B460EE2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624475;
	b=AQIGGPZhIPyZvN/YUKcML8Ur5gmZg0vB00gep0jVYK3EcuHhRUF4LUn6LIc6TeGgN+Ad
	 CXt6zeCvx/fzeUlmKWjgvXv5UNdRVILZsr5Cn7CbHvQ6bwC/bJCi1JwN5PXsBzNpMXhYj
	 338dp2HxZ3axLXDT7We9UhDYoGPBtJyeGveohtu+YyhS1P+iNTvNHgn6HSHVoEjvzOEYU
	 mAPoe8Z5dw+uGRGg2dtBOyNUAiFNR/TO8Rmu7Nsjn8+ITiBMv3LoxIEok0i5x1EkN7EQm
	 +n3yRMG6/Uen11UBE1chrLSUpqRqRBpc4joTDHp7NNvyK1CzRvQIN2K2tkfa1LG9fsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624475;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=e87MEnrdGCwhjNn8QqyqQhvfhzrZQqHVF6zh8jhpf94=;
	b=MpSfXYmZR3r3ugcIuRFXVY6K3p8nAO9wfaoormIx6/GvEPI1P6EXYsNl2PX84VbBDGBc
	 Mv48LcTQMKwiFIoybv4NNfld21P8wh/7ZHPihP7YC2Z3lO4XyJ6AbxSwvadBS6pzDdqtV
	 emRoi/YiGDSwc1qwVttPfqBvzO0wCUmogLEHdDUp+W6Moc9U/TbBPeSuV8gnV/DzL7a9D
	 p3B6hGIPsZusMXPaERO+vLnmh7/9ti7q8qYpQ1N4aLO3SpJMxP2NjqwlBjv1n1xog5y2A
	 fbA2+MF8Ukbu1lrODIjjaNC5tIn7PCCeV8Fatcc0GuKmGOCHU2su55zgnMW+cQHqyTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624475;
	bh=e87MEnrdGCwhjNn8QqyqQhvfhzrZQqHVF6zh8jhpf94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VsbE2faHAg8e0C0+XLqoTrx7HhKXRlXjf6ke/wT5wlL12XDZLCo6sMuCUGhTMbYB6
	 ohxhP9cFDyO7eG76jPbSJnMzkag/PmoH63ebkM8HLFmzYo7wf0h6OpHVC/pXBVQgdO
	 qrNTq4LAlHr4PCfBHOAOsmxWLs/NVg1fT/YDwBi6EQCMMpBttqvUm+Bsw+3ah3t4hL
	 2cUmLVjpeAh9rX3rpo2RlWkDX77fyRROZccm0chk1DA3933eEbSZjgMrhJMs3i5foL
	 WGOEjkG0akxwq0KzMDBEpntAZYkUGQAD55UENQtJGB3HIe5O2uMqsK1K9dCoPs6lZN
	 oCD/JDY9jPX0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9B460EE2;
	Sat, 10 Oct 2026 09:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D50CDDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B21E80F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRi4-eobnZeJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1654C81186
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=f/8IfJ4cStdKpo1Ith3P73Eax7aiDBXiQl0CfrDf/PFlOk29I0RvxW6FLxchP/j1F+Ly
 dLip5Xwoqky6GAYUQoJlcl8n2IrblBotBi6rZC7O6Ms4GWWer4U/FnkStyGSJrq1TY0EY
 Yk5P+Gv9Fc7LAguTLV9LDCqck3e0OzS1jPcAM/r4IdAt/j8rV4GDsHqUYqEtGb7mGb7tx
 jYjTHBh3SrjW32vpTUpuBc3/tm8HiDXxuGmKYFseJewNfCHYuw67ap2iq3gBBKEQ1cQIr
 kKdgaWTsRkwOO6ORj9YrXyywbYjkDZeQwlRfiAcObXgmVXFnXjZcCAt++qN9+eibmGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6G9vMIeHD1Hy8buAuZonaQO5WMAoazwTz1iBK2s0zfI=;
 b=PW0oKcCe+0/G8qYfdBmhOMF5scfpeg43eogAO//WjH3rNUpDPhnGPBIUPVK1V05q1Ya+
 rvuA0BGeFoB3iCXoF3rT/mum5mphOYnwYaYKgJrh8MVDXlQRdsJhvB3RbIp7Albyu78gY
 GIdq0goSiFOYXdGKfHfFLvdUMaqJ1dskp+BHc1ZeQQzMldxI/i6NMLC0QTeuJrZkH3Xel
 5dTf2fkeoXYvLqGdGKAJPGrRdar6DYValDHUTyj0dIadfbe2i3NoKn24z4ou1FhfyoIBJ
 Y37Y4L9GzRDf9QzzZTA7eKFwlViFTbXlpsNbqLUSJRqSmQA+pGF4KwGHUygGBzNKUWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1654C81186
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F41B38F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b8d6d076888e5af4c6fdff7bbce2318b69be7bc4
X-Git-Newrev: bc6c924679d28d9f017222015fa5bcef87e74ee3
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.F41B38F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-twisted:
 security bump version to 26.4.0
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0044019881725224301=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0044019881725224301==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc6c924679d28d9f017222015fa5bcef87e74ee3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/twisted/twisted/blob/twisted-26.4.0/NEWS.rst

Fixes CVE-2026-42304.

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/ac504cc8088734e0bcb8c9b372d52534bf9252e9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e325baa39cc45b350ce142e1e209a134a1d62355)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index f3cf53bcaa..beb1c7f3b5 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
-sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
+md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
+sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
+sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8db5d3750c..09198d2afc 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 25.5.0
+PYTHON_TWISTED_VERSION = 26.4.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE

--===============0044019881725224301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0044019881725224301==--
