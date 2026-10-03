Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB6ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE64681586;
	Sat,  3 Oct 2026 13:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zL0sBZaHuUzl; Sat,  3 Oct 2026 13:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB3BC815C6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035855;
	b=qbe9RuXis8pGqVRKVtDYdZk+65BCLUwscReoNfBgmjBFr11++bP6DqHWevBvnfE3mIxo
	 8XoUNpse3d11ommy2ok4ZrT/LBuyvyGu+pV7lQezgCGPiOEsSq7NK0HilhPDOvks2sCuz
	 rPRNCmwNcsYjyQdJAePqo4uZ1AjpCpHpLYaJXbpYR5aW6wi0IEbKxpLtcvLvJBNoLBrJ7
	 YATG+YbXM88JWv0DNUOsJWFcsS5uUnKw5Q3NZfhzBD5q5th/wgmzQeR2eKEr1mtsFt95h
	 Qpw4gCOfZtdWOA/+rDLz5XCtSfNQpLuIqhvhG9texiO5jV/8tZtU+fETaBYO6S/Ra/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vQMjivje/A+LcPvZ6eFEIrZm3NL1K6im3S8PLq/R3FU=;
	b=l8jbpWEbEFfXyiCvJVdf+yBl4JWmLRAUJMC766aXmX0ddp6nDmmdV3LQC8ObEm8oWKPE
	 N8tcGtR4SIRWPhpzzUa3ulDpQLzyRtKjvOyEqwcMcjd2xZPYm/Spnu0Ma1Thr+lPpSSDJ
	 JYsranhL+tG6Y0+Kq7AahhU/E/fKngbE9QUGygXHlUWyXh7ZlsFteIDy5AE6dCuGklxQS
	 brwkm6RA0UQP9tGRzhoXI+Id4XYFBgeYnk2zkKnWZ2rBLanv1b8WZfrELDCFTD/K8Shom
	 soZTrYowly+4f1nr3fVp9lMYwy2BkkuZYMYVOkbM3f+FM3Td2Cdf9l8yWTZOnCjV5VA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035855;
	bh=vQMjivje/A+LcPvZ6eFEIrZm3NL1K6im3S8PLq/R3FU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mhspoLi8WBA5DDKYLQQgB45UYnjkjcOxnckyCjAG2WzbVog7NcgYqJ9WArijX2FQM
	 V6aPZBwWrofacz0dXdM1vhaUnXcsinu1DzgsQW9z6CR7bMQGc6O5VWHm0L4ydbagad
	 /HyBb9M9BA2JD+NM54KvNYNy3Tsd9aDPY2bKsI6ZgH1w8cGFrxznkJxKViUhaWWuUh
	 GM5gVshHPgxum0jgVyzfnN7pJEL47KrqplFYpv3oImEiNiMCd05VzKz8vvwKimL+Ix
	 n2N31Bnv6QmB5hzHevEdsPlozJklQMHGziRkbIuInBB8FP115HZgh5fBMSTTtDLT9Z
	 i/EgxptMnnJcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3BC815C6;
	Sat,  3 Oct 2026 13:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04EFD179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACDB414E7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20D6C7L7vbF2 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 15998414EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=NzJpAV735HGpVwkFRSIcguMpAvKy0bbzzNYfsXbXDVqdAk/uoSRNtJIvsDwxkI0/Ws2Q
 C+dyf52vF3LTeoJFHYVINLdU57yH5YrpnF++vNk9dOP2MgT/7mjXOe/9IAdhlUg5JdBNc
 199/I/A4F1i/SZa+U5mVBiJpBceA4gNulShFLHd1saIkPCMtoRiXj+qipWoYX7BMay5TS
 uqo7PK68J1pvuk0qotVYjT5NRlz/buBiS4BTXIxVkzaGENDbjnikuG5ea6Cd8v3eHlQol
 fmx0I/iaKocqB0W/TePQFndfj24SbVSYa4jE2UqT39HP1F9GElFABl2onPHgz8ok4QQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9li2Z7yGyUOyiXuPFZut9/7RBpfRpxW8W5pWNKcwS14=;
 b=nXq1RcgWuf16dMGPHH12F5QzrThD0MXegd7AQw2jPwamPbxlmizA7d6Ubfst2fufgmPA
 AOovSu8+evANyWq/urG4nnoqM96q/HKfae+cVqgYBVp8vnGd7JpE+01M/GL4jVyqT3kuT
 svbdS6YZqtWq9adGF8lUav0/fVGBwx3i9Mpt5+zxxBQRdxqMcqX66uPShTOtfl1+ytSFJ
 HIvDBSGIxLqksqcZab72w6hY+qhtP3qbT2LOz6gTpCxvnTC/lMCfYYIHLI8hIey2lacfJ
 B1EkfiCdaAJqMFNaeveHXVrDCpffOqx+YQOJVMSPhySPod6C6JYtutvH2vcEOkIG5Rw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15998414EA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60FC08A318; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42803538e946b14e402580300ea75f17af3f111e
X-Git-Newrev: d2cada09f9a3a47e49d1bbdcc5775896b276dc13
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.60FC08A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-semver: bump to version
 3.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2cada09f9a3a47e49d1bbdcc5775896b276dc13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-semver/python-semver.hash | 4 ++--
 package/python-semver/python-semver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 50d30dd2fb..1cdd520bf5 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  a0d76b528e489bf7ce1255a0a1486123  semver-3.0.4.tar.gz
-sha256  afc7d8c584a5ed0a11033af086e8af226a9c0b206f313e0301f8dd7b6b589602  semver-3.0.4.tar.gz
+md5  ff4f4706f69eb233be39e08454bdf9b5  semver-3.1.0.tar.gz
+sha256  14bc073439513d7773662a338f4db9829cf16c12b74b9568e2d2689975fbd7fc  semver-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cc10179de9ced8655d7765bd3a8ac46438a61e663de7cf1c48d502d2baf9f3d5  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 3e4b167848..35e97178b7 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 3.0.4
+PYTHON_SEMVER_VERSION = 3.1.0
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/72/d1/d3159231aec234a59dd7d601e9dd9fe96f3afff15efd33c1070019b26132
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/92/f5/e1dfe8e1d91c54ce212fd93916eb01fd1c590f413be0a0978c39a97aa1bb
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
