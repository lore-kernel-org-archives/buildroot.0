Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06987CA9EC3
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F5E24095E;
	Sat, 10 Oct 2026 12:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTgMis5T4NOG; Sat, 10 Oct 2026 12:11:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63D7B40966
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634264;
	b=Nr9uloCmkhSbchw4QQ/FHTl0ZxcE5Ryn9b0lR/O5rg4yQFM/eP7P40ImIaH81JinZFzc
	 9ZB2xkDLDz75DX/0nP9/WplPtaeIipO3Q1y3Sbyk6+LUF8vzCBlM+6XD9GjN73UrRlsfR
	 MS0DInJ+isHX38Bh3IeHgAyO6F0d3Z6/0yrv9tXntC1WlgSBzrHqULZnxkPCmw83GiDPg
	 b6l+dNbVgzfvkDI63IR9NAwYuJPPK+2DLHOGLJROapXqagVsK0gLnYj3KZy3eazBcRufV
	 fKG52fiB5DJicj7LkswmA0f1Nxit0juCwrfLY/ecs6TQOXSHDR+uy/Zd9n7fBbffbCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kfp7VlqVGxOagjxvtWw7PWiu3bfV6R8UYvOabQasLjo=;
	b=b/8qK3bVsJ0lUV82/LsUAgPdZcguoDiCBhgvK54kQ7YecqSpaJzvvBNasN7vRBOW/ujF
	 HuNUR+MIBozKEG0k+/7T97k46RM0kFfvICQ1440+ScGOjKjYszlbZrJONulUEVwzJfdrz
	 VsSZxx3fGyJx2CZhuO6RIehOf4jAcTk4TRpa+KA0uwpZYsrRlBharwlM+VDL5DOiT1OaR
	 nIkDKTHZ9tG+3EjOrC2/wCGQ6IYjN9NmUgDBJA6VlYDWTrPoLcX2vIZNUnNpNxU3F6DIh
	 5c1o9ag9lmNv7xOYEkS07kiz6DKUyLu4xuWSxPlM9HJ5Frua58DhCCiAqbHbNofEATw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634264;
	bh=Kfp7VlqVGxOagjxvtWw7PWiu3bfV6R8UYvOabQasLjo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gwQPh8gx22ekdP0BHHI8FRAqY/0+AvxRpU4wbQJg2sOhRncHWCj0hdtgDAoVC4Srt
	 2ItsB14bmgMG3luqoFKBfueaBUM3wiWQ0sIRitsPy9BRZTIk2u+0jQM8Uk/rwtVPu+
	 yU/Z18TG0s2ZVJJ3dyuaSvysiIAQsHRJ3W0tWwQFLzJ9ttHrm6DxlFT8qYm8k4T95/
	 H1J/wHpCFw7DyrM6NOFq3RSEi5FqunpUUd1hFdCrXL/tJZeBbphGv/cQMgALpPwtY4
	 8a82eev+jJLGk5020t1FzP+GjRuOlfmtVIsvS6+PvFAb3P/olKxEgsAv3wCJD81SJo
	 YVv0dS/nkBsQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D7B40966;
	Sat, 10 Oct 2026 12:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2BB7DE2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C914C60672
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBjZBjFppEm8 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E3EE26066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634253;
 b=H+RHRpA8sW0sqJdVEFoptncVaBAOssNPmY8dRN/2I4y/8z5t7mozt7XFS3RMZb0cTec1
 I/jmEMrvG9GKiRInXq5F5ebQIhuOASn4xPO/M4r4zQe6K23W3QbPpim7Ophu4wKSvq5eY
 /lE0gRKuZCIcZV1vV4DPiAobewBK6kiqTKM165op7AdnLUBwE3E4o0W0LrctVlAEfuqql
 n+Lj7m7HbmduyJE6HbpeRGpD4p0MbX3LEQt6tIn//RhS8D3oKgU9M6JrZSOiWcKiyrGCt
 +0utmXswV3GqY4QOEeKlUvA0qu/+SK5WGxk6PghmhI6q3ZCaJBJ87rYlnEsk9ln/Ivw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634253;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=D5rJJ8hgd2RvC3omYuKiJsBBeSzjh2dw3Z/jNrHZBMI=;
 b=a2qyJoMGfScBXFwy9/s7w0bkk329O1QTHdOTvdB9DuXuDzMQbCTWWueyNrSjivRDJYFf
 l2I6pJU7dwNU3sEq2/kBz2oEbdtaUz6wOjj2aDGzPE6hgcRpAvPgPRo/EtiOw3UOGjbck
 58mQjl33kuXHj1L8H1PuXMTgWBrXm6/g6MT7rqVyXtV3C7ZBEnUaGwaRSYFNg1gYKRZR5
 u5HgcbRyE4NssbfAQSg3TA/2nltDf0m4G9j2ZIHmMcV3CdUnnfGRrUnuOVNzjSZLkDnqE
 hyInkddrpk3E0yABoNMteA5tJAm9Za9NNpifuEw8jz1ATnNkcHuh3S9hxxElOH54kJQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3EE26066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF0D5919E0; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49e16432d70629180168e8abd7aa6f6ca00a7e62
X-Git-Newrev: f32262ad1316884246b3f1c0479624ed1ac159a3
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.BF0D5919E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: bump to
 version 3.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f32262ad1316884246b3f1c0479624ed1ac159a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replace the host-python-mypy dependency with host-python-cython and
enable the Cython extensions instead of mypyc.

Drop the dependency check override now that the Cython requirement is
satisfied.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-charset-normalizer/python-charset-normalizer.hash | 4 ++--
 package/python-charset-normalizer/python-charset-normalizer.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 6a15683e1c..1257de8cfb 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  45256d816357f60e3e1880c5aa54a8fd  charset_normalizer-3.5.1.tar.gz
-sha256  6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3  charset_normalizer-3.5.1.tar.gz
+md5  0fd59692f546c0f8318af1728a12627f  charset_normalizer-3.5.2.tar.gz
+sha256  39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef  charset_normalizer-3.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index c2bfcc9e71..d8c69899a3 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.2
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/33/1c/f41d4e74c28ab327ff3acd36053f7ea506c55872d7a90b0fa71aa3ab0c89
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
-PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
-PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
+PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-cython
+PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_CYTHON=1
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
