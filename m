Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA77C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7F940EC6;
	Thu, 24 Sep 2026 18:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxx7PGXty72r; Thu, 24 Sep 2026 18:58:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5B4D740EB0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276280;
	b=jqSM5SpW2HaO37tA6eFWoekD/VqU2w1RTTrwUYyiUE5iUptQydvBnQXaH1mjfN6U3z7R
	 v+M0266RrAY6j8eIuzWJTSFiXRonoKA/N1HI9vszeSdbfaF66/oFKAs8nSIJIZ/KnTDdo
	 NqAXIhVMx5Tv6XkJL/HqVyd+OqZe2BZfEYfxvqoipaOKhZHTXMX4NGoORyc/VwkUjGHOa
	 5pmU9xQ8p+qvbjLlNO2/1PLHdW80tuCxBjG7Lg8Zqvu5na8cuiTmSEBrDSCX5ud5TXr/c
	 XyouFc7zCbQy5gSPJDitinjdgevI6tVO39t6zdzHwMyXIrPPJUGy3J7mMBkr3nG5axg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=E5HNhzJVsJZ4AHa+T8eTaS59gmHcPZqeu3DdIJW/Ahc=;
	b=AMyJKprkItblgYYAZly86hsTHq/tvdrGctRjfsgxpUOmCaufPqcc0bdq/R4nbFZjKOXD
	 PCFIlunKGWD0jdjAgrmC6cdJO1ew/DnjrR4gFSosGn0JMsM4wwFiuohOQOWJjj2waVjOL
	 CweB/bhRlTLwPsQetFCpAt6TcZqD7zP0yv5WSHwfgU5oRjZFOiFA94G9v3JMH1EKXjQM/
	 sZdacxq1luAz8EPJtnJYLdGb4YRYHbmYtUfZTKGutg3jIRFQWcfg8BOAgk4jUmOLd3YOh
	 5FNsrP/twFdLf51xLXG/qXBlmoHHOCeq093GUuUlX+4R2b3LoFB7OtIYEstAFSthxVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276280;
	bh=E5HNhzJVsJZ4AHa+T8eTaS59gmHcPZqeu3DdIJW/Ahc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YBNNG5yp3TaIauvX/TNoFBd5gzhi6S3UImyEPFUyX/iI4B137OXKhux4mdLhAGRTc
	 FtemlpPYPwP41099wQ4/OSBW1XqajMfu76oxvpttvZb1pz/hdJljvjNxCPhbqR/3z8
	 9p3HzMYzIKUD5Z/4B/LUbtTux2YZCuDTIj8wfxUKAILv1Q8ixbSeasl0zgI5G/L8H0
	 7fML3I+Dn6pUdwmDUnXfcp0tKwo94ccwC3Hr9c8s/GqpbYaVw8wyGJE52J6t9djU1s
	 B8M35/s2scmSJsV9JQpBWCwCD2MQOTQhF6AdR077Amn9M0R1OmlkQu9osmw6clQhL+
	 3S8oszoM3es1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B4D740EB0;
	Thu, 24 Sep 2026 18:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E9B328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7549840ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rs8UJmnmU-K5 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4A98940AC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=qOGaJKpH4OS9PEa1F295xWk2QHVAVRWBp1g6w9oWWhvz1KEWO0njkx3ZzjDYyBYW+iHO
 j9ZNx5kiBAcZfy3rk3Bs3Tjzjx9UxME52vfYNYEeyonk9AT7RUfGVu+djfAJpOPZUz8Xs
 USQnMnB0uAkDLDx1hveI5u1DbW5jjLLJuL0hWSdCiAOFP0G7ov/vLmIhjYnrUennT8MBD
 IUg1NoJAFI6PeeJaSSXlOyO49XG2JpPbJCIELzkukGpJQcKKRfxgNLX9F6lQe3+Tavl6h
 kSg9ipjQa369o8pUhb06ZUUNKsnHfsvhUI1arMe9L/E9cI5bgGUONa4zD3anQUrq3IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xWrVuZNP/x5G+JKMiOFzR86r1wCSHXZp4HEyY7srcd4=;
 b=POwMQ3caSd3MkvXlYPT3hK/GgWlWlvGLyX60n1FXdbwKNQ/pB4jnzqLSYaxlqQ/AKL+U
 Ag+XpkLh1qZtr1ndVu1Eb/B8Ogrrisi+afY22dAoyT0CbjZI3PasOkDMhGjfJshErjulx
 nxkFIDtiCSlTU7jZyGLuEaKixSt81fgV27WkWiAZ5Ag2xlYe6ARx64jTaK+pfjL/g20n3
 dSpuYARLH63bksWiXPoTAaY63do8hOnu1Pkt+2J+RPK5qTJB3xIxaofBFb1MP2Oe4y4o0
 H7fCRQdLZm8q7dywe6n34HR+MpsYIE+Oo9ZDrrLV2p2kQva1gHtL6CORyVbiv+A/SwA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A98940AC6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF484982D9; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:34:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 539e6517886996c55b51a3229df3730e14835357
X-Git-Newrev: f1d99a9c2d7773e8418c09f43d2cf930e75b697f
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.DF484982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{glibc,
 localedef}: security bump to version 2.41-163
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
Content-Type: multipart/mixed; boundary="===============3200273028728174682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3200273028728174682==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1d99a9c2d7773e8418c09f43d2cf930e75b697f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes CVE-2026-8674, see
https://gitlab.com/gnutools/glibc/-/commit/c97fdd483232a831829aaff458a212307f1bf4bc

(alternative to commit 7162c4daa58c7881d0866f5a64c525bea1c58867)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0243dac049..b4549549a0 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  987c4f5951a25dbdcc0b76deddf4fcb97a122cc4f505d351fd44863936e7d903  glibc-2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e-git4.tar.gz
+sha256  b369d2b38357104ba1b3848bfe4139c6a4dfdaea28ac31b3cf2a3985fb008a93  glibc-2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index dfe599b912..34a6175855 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
+GLIBC_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e812ce36a7..3412db3c58 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
+LOCALEDEF_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git

--===============3200273028728174682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3200273028728174682==--
