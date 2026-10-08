Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8385DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4399C4095F;
	Sat, 10 Oct 2026 09:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-DShT4QYgUk; Sat, 10 Oct 2026 09:21:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 419B54095A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624107;
	b=D2X3hY217pVBq+bPiv1py+axnRN3uP8TGAiLXnsk2adDHe2rTZpCXruKoIlrl0VNlJA9
	 hsn5AeXbaFMgL7Ss+x7+Y9QiHGGpX+5kYON4xhG4R4JMJvUrPqvsxbws6QkXRByi4Flht
	 0Y68xZnnq3pIfvsnsa204uVINQf9g1+frE7hDQPsapCpeVXA4jRlmG3oIOJVXRFH93vpp
	 zYXuAWrhYGslqfMr9PmiwBbRHHDihWmu0eHtlqiuBWP3D4EConbDYmkfytUPuuCnJVGyo
	 xDhGjzimX2M9ykDol4RnFsWI7wToAjI8JVpgTzgDN+wGvyT/ltf7cTlvH1u/WSsRYig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=L5v9MrJ+aaI7CgDA9++AooL5Fav9HHfthGLVlO9Jsf4=;
	b=DVv5nHJ404BZyQSVG57ID9UDmKOvwRbCTmVKEddcSZpzCnnQUQXEQHPkwz44FSi72DTB
	 YIY7xa6Acfu74JWUoDFAjdCqcaWw/mWrVpTJAcAgdy0NObzyxKv0spCI55H2zNRQ5EuI7
	 N5KH/DYLT0VfM1pgCqv9G0kw+czXaNSA0naKPf6YBgN98YlWLjOvxZEJ99qSErZoq+fvz
	 UQS3IOcv2F+DTFXJDt+PrepNcmjMCv6tkE+ZmppdKbf7NbzvORBmHyzlp9y4nKTbataYa
	 +JjOPu93ah3Yi/q1G353MjA3/9BxXc954RWsyPvrcOOZt9HBBPdtmxqBEefx4g+69Tw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624107;
	bh=L5v9MrJ+aaI7CgDA9++AooL5Fav9HHfthGLVlO9Jsf4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qXj6YdTChcviE8noQcIUCWI1M5NPQtTwK8Lth99F+eqfKTMpNaNdt+9i4T05AjDb3
	 l/uMcmOE0b7U0vG6Z8Mv7FWOZywSsNgu6BVJuCLiRHANcmXzBvIOpYOtHtEiBmalc6
	 sAV6k+sOh73UbAYvRPOwxPaltdLLoaHZ/T/9zo3OGo+wn80OQTvpIB5fqA3+dYUv3v
	 4YoEhaNAR+YNBYT9c82E26Am96wEfQ5UQUDpSSY+65sGxAxaIqAZrC9oSsw8Z0sQug
	 m6qbZn3q0fzcDMCuIHNG2Gf5o58O6Lh6uzoq+wBkS2JdQhh85Gkp0UJ0rCEdg+15V+
	 m6TM98cnF234g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 419B54095A;
	Sat, 10 Oct 2026 09:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C16A2A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC57B81316
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aQXxRd6RkmJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D6DF8121D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=Y5NQmK6BRkRSboDB8PcM5+VXbuVx/SiPDWYqci9ciFS9M3WtjzAvMusn0fwlyxrujZCt
 oh8zTlCrHxoj/pq/T5pxHMuu5aPaQd0D0Ns2qh9D0mwQ3Ync+DtI/jDeDf3wHgowqAozG
 laD6QFBxDYawx6cON4DxvU2R4x1PApAoiXKlAiOssrtIixJ0g+eGCljEVdDdcbvH+5Dy0
 oEf3R869AVnSKzuUjS4V9wGcPpt3yiuXjFwDe9BP8Z0fEQDphWro2yNy/B6/hCypmKeId
 yGjKFSIa38Omqe/R3BtEW9oQHhW7Bz2lZvPdEHECqw99QHIAWIGOMUYow/M3jtQY7eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fP3rDa5WerlOfNtNatpLfMlciyVeWnmpVway4GZwYoQ=;
 b=lyFwk7L6gQv1zN5ONRK+avo1EfQz6MJ4m0/RKCqDMLxmXMwXLVFh08jvFaBeGsgHHaJw
 F/15FjGkhfsbPJLD0UGIo98uVceTifDTxWtethwCzKBanDA3YnmDfF3SMwh4e0de3xPbb
 sfuMIo7gH8n98p7EF0uVLXsUkh1nZudkqNEMu6oklrTqOLgq4rUx5QIQoNRKwl2HvrK2l
 Or3LVI10wKEZLOqBMKVvCLi8GQfe2aSfCZjbcBR3hSAk7XS4ksEuu/0VoH7jt6k8H1LJx
 F708DE3foOr2EH4zTiRzpu3Hs9+C+fPtZfuODcgTWwtgRBup4X+o8aw40TiPz5WHA+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D6DF8121D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 778778F0B1; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:50:38 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5b418e0645ea26dfa031f70a06d39c2cb0af4216
X-Git-Newrev: b73bf11d5f58232c74f04f3a6c0c946382e52ad0
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.778778F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python3: security
 bump version to 3.14.8
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
Content-Type: multipart/mixed; boundary="===============0028917507508669541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0028917507508669541==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b73bf11d5f58232c74f04f3a6c0c946382e52ad0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://www.python.org/downloads/release/python-3148/
https://docs.python.org/release/3.14.8/whatsnew/changelog.html

Security content in this releases

CVE-2026-19445 gh-156293
Use-after-free of a server-side SSLContext when sni_callback switches
contexts

CVE-2026-19553 gh-156793
SSLContext.wrap_bio() missing validation of server_hostname parameter

CVE-2026-82049 gh-157190
tarfile extraction filters allow file modification and content
disclosure via hard link to symlink

CVE-2026-15310 gh-156002
Memory exhaustion in zipfile in bzip2/LZMA/Zstandard decompression

CVE-2026-19672 gh-155999
tarfile extraction filter bypass allows creation of directories outside
the destination

CVE-2026-15806 gh-155694
urllib.request.HTTPPasswordMgr credentials for one URL scheme sent over
another scheme

CVE-2026-17084 gh-155292
StringPrep algorithm considered Unicode codepoint attributes outside
Unicode 3.2.0

gh-158446
Reject float format precision near INT_MAX

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6e0a068475062968db52c102ec2b7185f8a90d1b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 97302bc750..ae4a00c319 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3147/
-sha256  3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81  Python-3.14.7.tar.xz
+# From https://www.python.org/downloads/release/python-3148/
+sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cb5e1a4b85..788d993d75 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============0028917507508669541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0028917507508669541==--
