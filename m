Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA060C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDB540ACD;
	Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUrsvVIjgkwY; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F103240ABE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276208;
	b=S3g5MDH/zHr07VHA+ewrPn+mhVLbhqX1T0vWflUcZFPZuXiv4FJeGzxzRyS0mv1L0VYX
	 4+l90+oOK0o5Fm/XrurIgPMMIGedn2nq3kp4EDQ16UU80bwzX+7aw9rfEVNLT53Ho7bau
	 rH0okt7mnlXjS+WqeBvlk6Zxoe+p2+0Ez/uKnZvPPGRSdKPqRAHArrwSEJ/nfPSoh0qXa
	 TEf3fjpxE07jFdTnNOVvzEzP0eETAVKJ9Fsr3k61KOeroLWcp2uADGlw5n9pTzb/0bdvG
	 +he/hb01qWfY9CPQvbIln/c/cJwN7ZgEwjswOjknuB67RG76h9K/2/6Vs8kFU1ym69w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RskQhBlEZoG7/fuuzJs2odRrZRpCD2UkvaBzQVO6OM8=;
	b=FTn9ZHd2AHgQ5Rua86liSma5P64ciA3LF/EKs2gigXChzm+szBarFaLx6BucwyybWcXK
	 86o8hboRFgHMx5OEjIix/IPPdWGplxir1xnpzSv6anXnFeI4lg5Io0U+5ONrJEmq5KRxW
	 GTBeK9q10A9N3Cfaoxb2fyW6SjexuRJQrdtHIkTUN/pNWwP1bjttNOAIarY2fwW5mi6Fi
	 vnVMM0oRcJu4aiqALXvA1grz6PQcfea4Pp4SWwkfNsZpyV+S+D4edMILPzQMSyMEJ0PRh
	 DVCy8+aicchNwS0QXeRHcShMmywxYBiAv42nvBhq4aplD6HC+NuWxc/G3DQeAUkBDRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276208;
	bh=RskQhBlEZoG7/fuuzJs2odRrZRpCD2UkvaBzQVO6OM8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tGgNNfUqQ4RVLvtRIL7vbz/5NGerK5VUstfTT8WliO9x/mQ6+MP4ICwcBsVJlPnQh
	 6Q3DZlJnutC7z/b4YsWz4XcLfAZMS6OCrmtrr+wrn9+23lbiW9CoNnhZEppG48l2Va
	 s4Y5Lo8420hyO7+kDAEUntaCdcTGbu75zXF9q9dgIB3AC0vTAxTPWWngwmrKszRSoe
	 zrBQhwzjUVHbVgO8X4Ph3UpnoGLvn0deHfiqpBtpVCqYAWfI4LAPdcMGPDOVDhrtsx
	 9fyAT4szUr9BS8JUr9MBMdFb51eCisNYYQfCF0w4UpTZ188o3JHsM0y07RhnIiEYoN
	 hNjQetBV04qCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F103240ABE;
	Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17373392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 094D540AC9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciMAQx63SAyG for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C01F640AA7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276201;
 b=MKsR7bSzEf791f1YsIaQu9tEYXls5b/+w2EHifG9HcKifuneHl1M9swyaCNXrED/UmL4
 z9u118o6Ag9CfhovtXz/A5MB1XuZ7kvq7HGH07JFQRd62xdhXBg8Bfa4PtYb9700aq7kF
 LNNfTxjB9AukmJ+2pzLXRHH3Imkbw03LnV8Wa4uM/BFtHJ0SSD0LI1xjcl3Xt3COGahJj
 YXNgIz7b5vUSMqs6kXhs4dH/CJrHHvIq7iHKbfOhPPSn693RA4TCDgX+nO2pKlorrmfYz
 FoNhYSHX5HuyF2v6FdPALapzzIz33atKhInYIUTVr95BnY6lOhwrWD66n8/sS+r53Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276201;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZwQZEUmTReNHzyLd0FAIMzqOifeaSSL3R/+7WUtActc=;
 b=eaRitIZns1W+UUbBypcDA54d08jq79CwKVrsosb5b8qSzmzOe2HTuS6QDId/z6lp9BQU
 bWosaDiBDhYXDcs2221aAtBELtuZj8HnpQdz4YtjdHprZEnU8ea4SVibSXg5wR6riIoZk
 MlgSEtT3fZ8x9QMc28KqoF3esQeQ2AtirNeDaWxEu17FryZdWlb3tiItdBKLN45jT3PQ2
 eHpVD4dXmxCZk9fJpU+EwLF1qsKF5PnBvn7eBJl7QjDPvCmaal0bcOs6zccgpaVzsnqZ8
 8/k2YL+HjIPRz62z4Faon1R+o9IQ5DkQ/sUYuXcg7Xxn9c7/zZ821zjUvDk6quz0CxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01F640AA7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6195598387; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 16:57:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0374d408e609df8c88e2b804c2cc548d8a385c31
X-Git-Newrev: 03fe784a0afa0609723971577e3135d0a1f54e1a
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.6195598387@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lldpd: bump to
 version 1.0.20
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
Content-Type: multipart/mixed; boundary="===============6735559918735079091=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6735559918735079091==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03fe784a0afa0609723971577e3135d0a1f54e1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/lldpd/lldpd/releases/tag/1.0.20
https://github.com/lldpd/lldpd/releases/tag/1.0.19

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 779e7cd7a926671e487d83340d130553ef430ad7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 127480095e..f3cefe7b73 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.18.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.18.tar.gz.gpg lldpd-1.0.18.tar.gz
-sha256  4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7  lldpd-1.0.18.tar.gz
+# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
+sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 1b2cef9865..a3015e9e7d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.18
+LLDPD_VERSION = 1.0.20
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \

--===============6735559918735079091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6735559918735079091==--
