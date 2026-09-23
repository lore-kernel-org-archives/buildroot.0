Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87797C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F88640B18;
	Thu, 24 Sep 2026 18:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMNMDjvGwoj3; Thu, 24 Sep 2026 18:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4757940BB6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276271;
	b=HLgAfXqIqQcmvb2K70WmwCyKjS3Q3vpx5AQQES6LZEQgybutWA+6rF4H24ZskEN1UPsL
	 N5P7vOZvykjUJeEvkXgPWrrdvlmY7mBynPzlZ7aH9PgQ1nrQKitTRP55GW3uX0g+6IjFY
	 QmF47x0Td/V8/5OeoS1OB+0nhJ9zvPw9xZRaPstPRcY4jZZVrEyhwj2xzeHYAmA1vFYZM
	 rRBtLw0AN52QXiYLYEQFo5yzfJU7TkOiXkRLD8tUtNCp5b6dZUEpve3wI05Ru5BMZD1zh
	 5DohYiNTqYP+gBwR/+Fqj+W3Mh8QXUMLSB2HB/TDs8JsPtz02AuZGUP7SGPkiA1DLZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zBcmryT1h9TpNaBEflcclq+0Y7yZBSc4zxwMBa3CfFM=;
	b=kBQ1aMjb4x818HxvLyWFMEqPuA+rpnYfwILTQZskaZdywMOvkT3U7a2ynHW4HoLvSxZS
	 WOoBjEJpwkrZdwRf/eq32ytAuklQwiPV0aosyR1kTgRC2fL0EQe5CMIHERvK/E5XjrDmT
	 P2nLJYPpRnv8tqugOG6y5iPHR4gkH0K/R/vhuFBXUBpJlG1GrDN64vy6Xhqb5cPRp+mcs
	 fig7j6SleSa2f+OpV7uhox3PsSYhcvG9UNGMvPO4nJSipqUm8LSBZ4+aNMf19Hjp0GxRm
	 KDIhK08TwytSE0mGwL++96Xlr+NhyFABLtIXcMOKTCWil2UdOIl9cC3GHxBRrcSEg8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276271;
	bh=zBcmryT1h9TpNaBEflcclq+0Y7yZBSc4zxwMBa3CfFM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iCO9h4/Ob6MsfN/1LO32EIrMz+y0tP8m6hnip563LpD6mhQOD8oKdd5hDPdUqqrC3
	 wcBSHbHDUofVCpLQnxaBIkknYaWI0Sw6BHBNh1w3vSx4PA6g28R+VcpjQaCzGhHcEy
	 UKeFozSdgFwSNeqm5YeP/X8hZTRg/3gkfwTtiLb7NYeVJ3z+VEyLykbRoJYxAYtf66
	 sbVFYY6HKzP1KS97uzAaJgR0LyEHi5yqvyw930kpbBNdetzeBbbxIc4umFBLXlq+BL
	 fB6u4CI06nzUkFSL9lzlfx1plEHymof+lkRrCY2WGsKx8qNDtqjFcAbGlZPG6Pv+0m
	 rmUiJq0yH0GuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4757940BB6;
	Thu, 24 Sep 2026 18:57:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55C1C328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2826C40ABE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yos5YKc-gM5 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8735240AC1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=KZjXm1rcbNgvImw/PMqSgFmBpUsisXgqmigrv9Kme0AaJeKlfaVeTtrG8blpEHWZwfbn
 v8Yjp2HDRQwnkTNovouZ6duvqC5KHlw/gFUjVMzB27XFrLRheyaTKQA1tEa1VKi8STn7k
 ymr2DkE36KzHKLRG0Bbz98BzrgT3detkjrpfAyyqDDw+DGiOONDiExhztMbEWCgnTYvmn
 z8a4N7cAWxYBCTJN8pS7tKCQOZkgaLwc8DHhmcublBSkDsRWVs08SU9iAJuHrFOAru4oQ
 IkAiheRsfiAZyuva1hUMXsFi3eXe2Kj8WdTDLn1gcK+obrPuNWyoBA4R9rvgB9cpJdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B9QEY15bay7j80vkwU6QqIlj6T+u+H6EEQD3/R9LuRA=;
 b=q9ZHguy8eI9fQ5a2MVOvMBb/OGGk09Nsfb8snUGXKRqnbuHiDnF8NIEScLzqL93UclCr
 D79eaZfK4FAa7gcHamPvb8FHYxGRcRm8xQNiI0FjVV2/jxRGoH2xwORMD4e5GvRKxIkt2
 Lo8dUbO283LnjhMU66fguhgoNyj41r1mAjmEDDID4kYR0pgX6V3x1ichd/myZ2v+ysoik
 nzc4y0r9jFWIItoE6C6hpqCa0RqXtiCJbZFi+3JvePn2EVVJxwgb5kME+J+mPzs7SN8di
 s3rMmbcV+U3WrMn7aSeFXJ6R2uTlrhm0h9WqyZInLvpUs+NVlhoNDKaKldfxVWg20Vg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8735240AC1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AD2194AA9; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d22254b6c6a285157687a61d1d42ce49a6bc8f35
X-Git-Newrev: 79305a51859bc5c17b6b9d5fd2c4abe8a747e898
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.2AD2194AA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/unbound: security
 bump version to 1.26.1
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
Content-Type: multipart/mixed; boundary="===============5286242767444603552=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5286242767444603552==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79305a51859bc5c17b6b9d5fd2c4abe8a747e898
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-1

Fixes CVE-2026-81642, CVE-2026-81634, CVE-2026-82717, CVE-2026-77955,
CVE-2026-78227, CVE-2026-80225, CVE-2026-82720, CVE-2026-85501 &
CVE-2026-77860.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 098be4f99a33b9ca67e2edfc92c517a66097fb2a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index a6bab2218a..5a0a52a7c8 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.1.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
+sha256  35a6dc0e425a9282c3426d9a3043144011bf0534aed4b73ab62c52aee0af1503  unbound-1.26.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index a3a1baaa94..d6886d4a5d 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.26.0
+UNBOUND_VERSION = 1.26.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl

--===============5286242767444603552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5286242767444603552==--
