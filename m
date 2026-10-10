Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A87CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57CC4094D;
	Sat, 10 Oct 2026 12:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie6_Hx6RQo3L; Sat, 10 Oct 2026 12:11:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C8BB540966
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634262;
	b=AVlGfxq6J8vltI5oftquU6shlXJ0liF5phcyS7VmGentPnoucoefOA4xuPY63HR1vIm5
	 QVWAPGHMfG1d4ud5X/NybK916QR9oKW31bwQ/PrpzIDgslZdaTVzKE235SjuHk494lmMk
	 dTB8lO53+E9ggAOTk8M03Cj1Fe9UffR09XLWXUMPleBj9bZfE6SC1yCD6NeXWCkt2ptQK
	 CzSKzAwoL1oFJAE/JIlQ0GkVpjwBlI08M0k2TEprhnru5ZUbW1ahKIRyJ+dYndwrxPhOl
	 qpoS5Hb0IlAeskdlbl0Msc9pB12bWTtkWIHqdoHcxaB696Y3tyDtvLjcaG2ZyoKk1nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8tf3kglc9nY9nM83/YbTaHUuqSiRXcwlfbNqpHK/Mhs=;
	b=JQ0vJmWYZ/X/7VDnn7MP7Iwm21+dBrKAkav8u1sF7bNhbk6QvBPOMWQDKHSnNPlsgw94
	 zO085yk4oTFNYrP5CjtQjPNNsD8VJb3XPYptCGNg60yGuODEf7xqQSue5PSnLCl6ZIytx
	 DgKhRDiEVnr8SHzagzlhhAln814c/4L/QLuHWv6XZRj3Ztl8FQ5ogrGYQMY1AUjRriA4x
	 AxyheXiFOgxCxlIBatVuqoRt0GdSi3C/hh+VCPd7qZ/h+40BU3EhbFlH5btJXsA+qpC9g
	 7w3b/VkrTEU+knKzDEVGxsv8rlW1N2NoyGz7uAB75+TwVE95d1O6kA8UxZgulPsA0xA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634262;
	bh=8tf3kglc9nY9nM83/YbTaHUuqSiRXcwlfbNqpHK/Mhs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IwQRUOWYGEY/kMD1qvEhldJ60ej1acol9natJB/KPMDA+cDB3IUW1ti1T8hn4mWg/
	 1IzaW6BT/r7mtC65FWZ5ONO+/XI/eHPRiJYB5gcBf6bnZFVwVIR0pWvQQ3ECtBd1l9
	 gfBGd7IOuuYBoJcgZcMQrODy6yWry7c2wRyqZJyoBeUhZEgvyeXfToL43Vvq0DL33o
	 aQ1rZuS3CE/ZPk1t07b9HaYuLVV1faHAkUCp5dTe6B7zVLwbw4sM3v7s+UJTXHL+sn
	 vfLTA/p4IkZ5MXGs/TVZ3UkLSv9Vvup4jUuU0Ep5ETLkiHAXU5b0XlYFbZKNk5rnKc
	 BBWuHG1Ul1pRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8BB540966;
	Sat, 10 Oct 2026 12:11:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5CC6DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B702F4018F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2Q9QsQrasOX for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CA30840004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634253;
 b=FPSa/iAUYCJw5AWvW7QnbYH2h8LN1H9Fj39zGODcOf3YFlWgaMq4skE8Fzxf7hmEgi9B
 sWl2Cwn50zJw42/dvLp+rrLnA8tdeWPBmfguKBLMfcaMEP8bAwDvuZbP+PIistcOvLo07
 AexwIiY34zlNK801pz5yOjJEEmJWd0hFln6luFO9FWJ7/h8rnWt6LPYb7nrO3KA0aie0s
 oMDaR7eMxZ1cmbALTMhM4tJtW7skwmr6XVT2h011XbCoF+0RxsrUyfyOE2QO54wgl/7Jf
 6wFT0veGjHt8xqF7zvse8gNhZNXJkz/bYLHgvH+X32XzqJctVixEwtZ0e/+Dw1cGaVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634253;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W6tVPmafOkAyvINyLWSt3BqYo1jTZSNYokQPhxz7aRo=;
 b=KB/uMXRdVhdiJAukRIlak1uPJdBORVl6wNcESMN5p/lZAaYEGVAVW6ZbbHtnNlAEF/OL
 y0F1Qztwm0exzuQX8Xcnh8mdiwSHnCCko8q3q2JPYgfTRWUTgJPS9nsf2VY//Yh6J9hD+
 txxzK2h1FCKYG9umKpwfdvQZWoruer3d+I5rxCP+twO+6l6UFTzE/6JMUriEUzyNFiUZX
 cOaIgUJsMZ64jT8L1u8lsch7BnEFW4k+sqKCpv76DHFlAgs260IY3xSpdWG4Uod4WOgEt
 /eIRcKWYII1KtwjmKark1ZVQxvRzw05KiEx40wMwt/0svkaU1X22m2esRew34Kipn7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA30840004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96C57919E0; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d672865ce4bb91e1b6fe74640fd77ece2fe17e0
X-Git-Newrev: 920c2b8326d22425015c84c917b8ab513b90a9d8
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.96C57919E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webencodings: bump to
 version 0.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/920c2b8326d22425015c84c917b8ab513b90a9d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the flit build backend.

Use the standalone license file, including the updated notices:
https://github.com/CourtBouillon/webencodings/commit/42e8f38a90d62379cbe448f778883e920722aa10

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-webencodings/python-webencodings.hash | 6 +++---
 package/python-webencodings/python-webencodings.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-webencodings/python-webencodings.hash b/package/python-webencodings/python-webencodings.hash
index 87c41a9632..8d7903d564 100644
--- a/package/python-webencodings/python-webencodings.hash
+++ b/package/python-webencodings/python-webencodings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webencodings/json
-md5  32f6e261d52e57bf7e1c4d41546d15b8  webencodings-0.5.1.tar.gz
-sha256  b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923  webencodings-0.5.1.tar.gz
+md5  47dfd43da448410f24fbc08d597ac72d  webencodings-0.6.1.tar.gz
+sha256  565f9ad031c702dae404e27a099e3e09186a3ab1b9520f06d215502b651fd910  webencodings-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  c27693b0174d6d04dafd0242857ae72763f5404b675972c777fd865bc3c0abe1  PKG-INFO
+sha256  e06ef33485e7498ad592887c41fa79cc8a7fecde576c7210e11bfdddef58040e  LICENSE
diff --git a/package/python-webencodings/python-webencodings.mk b/package/python-webencodings/python-webencodings.mk
index 63c6d37373..f7c3fcc862 100644
--- a/package/python-webencodings/python-webencodings.mk
+++ b/package/python-webencodings/python-webencodings.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WEBENCODINGS_VERSION = 0.5.1
+PYTHON_WEBENCODINGS_VERSION = 0.6.1
 PYTHON_WEBENCODINGS_SOURCE = webencodings-$(PYTHON_WEBENCODINGS_VERSION).tar.gz
-PYTHON_WEBENCODINGS_SITE = https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47
-PYTHON_WEBENCODINGS_SETUP_TYPE = setuptools
+PYTHON_WEBENCODINGS_SITE = https://files.pythonhosted.org/packages/d5/a0/8fd707bcb776a7be556bad06a2ea5fb9bd519df78ef8e26f70ccf0f38bff
+PYTHON_WEBENCODINGS_SETUP_TYPE = flit
 PYTHON_WEBENCODINGS_LICENSE = BSD-3-Clause
-PYTHON_WEBENCODINGS_LICENSE_FILES = PKG-INFO
+PYTHON_WEBENCODINGS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
