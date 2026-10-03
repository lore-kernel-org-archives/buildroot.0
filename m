Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F6CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0769E41193;
	Sat,  3 Oct 2026 10:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTpiQOwpXYDO; Sat,  3 Oct 2026 10:07:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1CC3A411F7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022076;
	b=D77VZIdy9pNA56JDoxY+Fuk1jYKhw9T2EFDK7t1VQmbtIgKSwFCn35btJicG9qnULKFz
	 fMO4gRHRGUQNs4plrTDhyu7O1fqr3rPO4lZcXGRuf9EUCLAbBuqRQdFDjR9Uq1bbGuzIi
	 q5UIFnjmnS9OkIAHdXJJhFExbQvoMyuYwWf6GxcBjG4g4r0gETIZLoEIko9yz5eTYOxzk
	 YSnrO6r46FXGm7iOLHRzmFEHDe9NIDrNIN/sXoQZ1+rLSM2Qt0cD13pWy/bQUl8XcQ+vM
	 xjvboayAXC+uDt58mbAeZTsnXb+rQZ9Zh3Uv6pg72U4gx3whLUBX2uDLokJwBy/ozqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022076;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cNydQthMawugXcjkWUM1ezYD7BP8aiqEsk2LF3csOFs=;
	b=dEpyqDGfn35WdCjlrCdxxl4VvQGbPgWWAlukODMyltvabB0sQJnsMEmDIGY/JfhpFbI/
	 YN3p8Z8C/VUgqqOqxiQdan+zkLFDqF6E4MLhbZOjZLRh99b/MOOMkgwXEm5J4BRdU6NDG
	 OEF/pNGkifV6S40BYRpLnSSQ004hUf/eSm4nQuAIHsDT17y2CO4TOwzYNaQ6ITem4uRQ9
	 WmGvv0TIVJ16TO7VbtammKlSnm58vtmMUIm24K1tlF1syafOgPRYIx+5dhFgXohqr01oI
	 82Wbbc/uYAnge/t1kdjfEhZTsF/lYvmmqd7gov9ptP7M+gpj34ALoegeVa0nd3OfzFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022076;
	bh=cNydQthMawugXcjkWUM1ezYD7BP8aiqEsk2LF3csOFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RUXPKFwAscUHuzXL53C9R4zUDAUMdS97DDAwRNQlmoXSSvDzIhjoFu0il0GV/FWOQ
	 R8pPSmP0T92k1ME3eu/N0ZU8dP9X2s1XUrjSYiXQDly0kB1u850Ikouxl1bwrTBj9B
	 NcLZMReM/5rE+nABx22KuHV9FFaWDPz+NPpfk4sdlAsfWyVi66bz7wNBD+fAV8ZzMy
	 gpoUfEScYIjRs85xgag/lrCW0v4nDVMLJ3WE9UK253s5lz67sR0kndCBwQ0+b23QwL
	 CeGDBTlAu/mG9i+x9OTuMvF8SqzMWpQAkSjb3uDDhBCnaK4P1iT48+DjpewCR1Qy5p
	 PHL0WWI0L9ITw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC3A411F7;
	Sat,  3 Oct 2026 10:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3CE3179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4E360E82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFkNjUyPQdEx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5562E60E90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=ILIXwLcXaI/moMUFMtmnwfqnzl7NelTAFpNHiBJxfsVHLUwkJR4g6P0bVabW/ka/TF7u
 tvyF8rMzsMJjMaHY9Pj1PJ8qP9MsEiEnQs98mIERCpxI/rkz/gi+wK/bPCkzC6hgJ6WoR
 VKtjIu0drT5i7bubL8CjRAWRsltnT0ZEgs9UOUiCdSUlbL46pfC38KBD9R0pA9C2CNmju
 OcMcPWWyX9V9pA/f70rq6ays2xsEml7Y4+cgbYUs5FI7twXFTWwfAMD6XXcgSWUusF03k
 537T+NomwtBZJmAq3FOBK9ttwtvDtNDC9zRmTemFYXdmh1n11LX+987bUePJ8gwMQOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WLy8HvADTLutcaAKOzultsXuvG5lvJB9DG/FPBuhvRE=;
 b=aV9bR3D7+wAbd+4rKbSUxvziNL0woyp/hhHgQ+8Uj1Q0iwr2AjFGZZKEXr5JqaRzuB/b
 A+KZTrlOU7OqLRwFLnpVaDMg8jeoVtGOZKUrksyAHjJluxrcPOFtNzeqqSX8cDJ6dkmAQ
 ChMh2XZzqvI1vnUC2BWZ1ft+AneVjiU4xQH4CcuA9lJZwrCRlPMICpaJ4GoelDzxP2ehb
 Rj6UiVh9WU99975vwUz5ti87zAcHTPgjylppMhqU9MQ0ozOg4t6/+FwytyDOfSA2hNm28
 9tvHDvk7Ykjva7T84t03yJLzeA4SPnjJOh8PVnuAyF54a4QyCzSJk3Er2n6rYwdDnCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5562E60E90
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B486A8875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b411cce3d1aadfcc6de762fdf8d0ab44db8ec6a
X-Git-Newrev: 2c57957318c33414228ce7c46c3dea1e31f184dd
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.B486A8875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.12.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c57957318c33414228ce7c46c3dea1e31f184dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 3e2f4ea59a..a237667ad8 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  6b9f7a12243ab0609a433bcf2f641c6b  platformdirs-4.9.6.tar.gz
-sha256  3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a  platformdirs-4.9.6.tar.gz
+md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
+sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index c3a7df9037..d3463254f4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.9.6
+PYTHON_PLATFORMDIRS_VERSION = 4.12.2
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
