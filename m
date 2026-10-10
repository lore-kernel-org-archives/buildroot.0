Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436C1CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A7560752;
	Sat, 10 Oct 2026 20:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFjbJQUDqk-b; Sat, 10 Oct 2026 20:31:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EFBC460638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664307;
	b=EfOBwV/XCyyi9ZVOnJGMMUGKE8MaH4H6V0gw1c7cukzstwjwrUo1nQ8Z6c08LLFvxWgC
	 qUwAD10TogWCn0UjKupnfAjY2GarLKOUHE11S6Q227Uy0iJyAr03HtRVSHjEMGrysAX5Z
	 yP/XVQEjGadbSV4BH8KhnkJ4EeRK3VCke5VHFYtE0LowolWACNMfeThF6o5IKYKFWQIyV
	 vdKEA/Rqd+1x0lbRhHZ4NQWO/d48MwvyPLiq8IXBQWFg8e/4PZkT0m8kT1LxRVr9KeUUa
	 TPYCHxerbxpx+gstvDIIZ1IvhoorINWH2HbvVCbLF+Gcfdb+ghIJph6WYhflKE84sgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LJtFKYnhHbnVYLNDfknLkYg83F8TKf2Gz5nZHQ/PvR8=;
	b=PgJqN9Re8BzGEPRqpAi4TYVRy7y/a5x88qC6s/yj2OVP/1FpQOZthtB3luW+mSOsVfpp
	 3TklJQSb34XEtoTWuCEb8oA0C19St07oJ+1eW8PcHjKGqTqnWLAipbzNUgrbdniY9+Di1
	 oI5mE+BX0xMNnh7dNDspTtsoa8V8T3fLeAAFBSBkiLuSX8R+gDxQ2V/TgBlp0lvWbU3ZB
	 6HA6vhhmmg8a86GCfO2zVQpR3WzjKxjqBIVKc9+bbltHVm21F462GvUBapE+cQ6NJYdYe
	 tHLt3pT35I9FhBXGUQEFiG9DEtBuVlatBeQaIwWFnxjIzkdJMsn/oiLXbUrlpIf6Mgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664307;
	bh=LJtFKYnhHbnVYLNDfknLkYg83F8TKf2Gz5nZHQ/PvR8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WctGjqG9SStfkMkN6DORLzxvmilJ1wpsjkRqmFke5BMi2niWufCFawiAu1VgkJBv5
	 XBIL/n9W2wnhYQg37wQvlGGy9dEiIVqX6g4/nGhc83HfjaAIYcFWVMb/lMTxDw6Y1X
	 1YHmk+a/GhJwMWG4HJ1OJVzA84saEPqCw4ADr5pJZixGOPILnAzKMgaXLIKEcCbFxV
	 v4gk5N/weGvxQtbbaAWq13bdslVpHxm8CZvLJ9HkYn29STclX6WofHUP1K+4PTfEOL
	 8Uyksf6NDoNraEjcehYgQZzZ2CLIimvgOtQeitqbVZdMrqPxUvFXnljZpZoz9+mqvJ
	 hhUW0unP+5GMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFBC460638;
	Sat, 10 Oct 2026 20:31:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C539D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE8B2400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cu2Mrj0K5YcC for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:31:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AFF1D40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664302;
 b=FBvbZfY1gyEsH4JTcv8BsM6kh7tk3Mcfq+7Ox9OvGr3uOGT7aMlZHnyLx9o2bzafBZkq
 pcTI8tX5FoTNghHw2HUGa0UaehHVLFO1GksTbnyIoO0m0+TEXU04iaBYYZh2yIfycOqWA
 LBMRPjZKotPuw7frQ1065Mr8O69ICvnsTlkGaYDgcXEBJ/pX0m24Qysy+CXfH4qHbuSjR
 uCSlx3ZhlYs1lCkgFjrlhgt3pDylLspCnzy1J1jrfGMsoTNlh0xziJ1mxRPeWOcOI26iW
 34W0OB+UOSQBE0/yku+1IgaybGRnnyM1N5Nq4LjXfTuo3vKdset+K8cgv9qQ5HrBl+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664302;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+grnFkCl+I8c/Z3iazBb2xQasJduexS1e3Sk29TW/BE=;
 b=I12maXRBqtV/LeIwGlBx4PodCGmULy3I7CM+258hmjtzWjfqjrU38GY8UlL02+wyzRnz
 tCudUAdmPcvy3cFwLpHU+pFi08Y+gHoUUIMMp5HV1Ar8Rcqi4mvgtOfNQgWTDIZlPwjfM
 mhYLPNBnsFJ/lZ23ETlGVzNn1eQWP2llwprFh0CbIlHAaKjQzit04Mwg/9z5mRuX+s2js
 95lkOHAHaaLBdjX2qy3vWugv+/2qRQB06Fh+8qLGfbVQi7vVnUfCaKhEK/JSvwDn7eoqc
 0Nh5DzT9ucop+0QH0HcyGNaR2rX8UDLMjQYRIedgWI60hgO04yGLt/q49SMoxStaH9A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFF1D40068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:31:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 521618DA9C; Sat, 10 Oct 2026 20:30:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:31:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f3326812b3d40d97c1f31e4cababe489d55d0d0
X-Git-Newrev: 409b8bf716016f0b94e44e1122bf8b91cf255b50
X-Patchwork-Hint: ignore
Message-Id: <20261010203024.521618DA9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 2.13.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/409b8bf716016f0b94e44e1122bf8b91cf255b50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index ded810cefd..a818d02069 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  a6b8098934bfca79f0d99334f975c22a  pydantic-2.13.3.tar.gz
-sha256  af09e9d1d09f4e7fe37145c1f577e1d61ceb9a41924bf0094a36506285d0a84d  pydantic-2.13.3.tar.gz
+md5  38980d18ae9c2e8d54a2cdd46a46d40a  pydantic-2.13.5.tar.gz
+sha256  51a9c5f7b2f8e636f04c6cada605d9b6a3bf1348fdf945a3d8869b19bba0ee08  pydantic-2.13.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 71652bed0b..f9e1baef9a 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.13.3
+PYTHON_PYDANTIC_VERSION = 2.13.5
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/ef/fc4f868f4e2cee79f863883abffceff107875f569b848507319842d2a681
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
