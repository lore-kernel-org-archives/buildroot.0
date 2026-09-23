Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299DDC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3DB440EB7;
	Thu, 24 Sep 2026 18:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwhRCSD6m7pQ; Thu, 24 Sep 2026 18:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2A206411AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276373;
	b=JtqkDMVTJiTam1oFjIBjyLGpGyYCEyvFJGsOh5vs4+M/uwYFNuPXOXCxq6hHe6IAALBo
	 OOfaNdcwro970rfQPIznTVwUVXDS3ofVd/Z/z2CP/FgIhgNdAfaJOkcm6rZr+zNPR/C3u
	 KTyq4tr/iYO5ExhYbctXrfqdfor1cB2cv0qaENONaFBESwcHTvwKADSoVknyf4ikhodJm
	 Xcs8G5YWKnHc6Q7rdLiZFvZxoGNhpdQ/8hJVl/qY9d2rw01PCybmmHHAJ5y5HmBs3tIqr
	 Sdx4iSV9UzIyTa4sage7CnCR8djnwUx4yzYwhzRXCesDf2MiWAgm230OzUikAUGPA1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276373;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/9UtvmZoUiORc76c/AmaXvN7TELpxHs9j/q5UNjcsMs=;
	b=chJX8pM9K6xvq3hM/0UUOAe1MJHfNCIS/8b1HjVp3XwNUslwwbame6Ju/dqZbPxI7YPh
	 XBsdF8zdaqfEYYAlRiop1SQL2wl7Um8vcYgiYwoP7suqC8f9dvWlweU3Y7aai50wqkj9h
	 3ZM8ohqPlHzHUJyACGef9xdJ8eocPRrbPcrNeLlHOovki4XXWyvm/Qc1jkwieuaexuZGH
	 FWFr3pikdXmMSdTktM5PMNkRcVpBCoB53Bn3uwPwz0WYOttVM973quTq6zvGNl9t8uvJb
	 uX8SrrodhC5NxrVWh2aj5CZcKnqbnnB8jKytaTdWGJ4KFHZXQ5PXRdWz50ILWHWTCSw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276373;
	bh=/9UtvmZoUiORc76c/AmaXvN7TELpxHs9j/q5UNjcsMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D8LqqV2yO7UjJdePKdriGQTUlhgI2gWO51QmwBTSSsKAiaHt5afbe7qO1tOlBmoh8
	 RvVgrnwg5xsX9MoZXg9swZUKgU9vApIhYo01yPTETcz7T5kHBNrTzwex1iuF9whnKj
	 3tufdatmvC2IGhqmTKL47rs1/gh8/W+Zn7hbX01G1Kpyunvd/xmm70SgJ3pOyTaAKa
	 Q1M/OunRZXMY6ZUiO0nb3Nb9V5BlLcTNTP0Y54S0NiGDdRldzcZAHttI6YEeX/PvBB
	 keBX8ibF0H0lyZlo1rq6v5vBMefJxp3ckdAfwmEEQf1zH86myeXStx1UbyHJeRVfx1
	 7KCRsuftElFmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A206411AE;
	Thu, 24 Sep 2026 18:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3215F328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23BBE404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqYpuVU9pmiM for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 57029404C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=Ha3op33skUaSf+sTVO/C72FF0PsUZNUMRUsjgqg1I0CuzEQkhr7pOW5mq0slKVbg1hR7
 Izkgh/0j5XXNT1OhtDg1io2bS3+Z2M9JBndMnNO5go5SiAC3Ra2FcVzMjFXLNhbzSvhB6
 HcthwQ8/1O1twvWtXmmm1PVLa0ilto99E6ch8jlhzsh1iK0qb7yGoBz46wsil9ZzPgu69
 HLQD5E1SVv0kP0R5WznlnQ3yGa3TS2Jfj7iWZvJG+NIezDGlUg/5Dp89Lr/4e56mEmMXl
 bks6QIGMwIJnl4zfttlYpWXvdAy/PC+47F6LWv28hBRvE6T/HF6s7ieGNrN/bM1p2ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NniG1aF2Ns2X4KdVIYMSiZFwT9oTmFvagtBrMDBe/Ro=;
 b=CthsembBTV0zzWqkh0NVd9DrncoA4X7jBd9sliMR6SYHPxzP1m13D/CvmTBw88ymFNgM
 zdnjn0S7lA5oBsIToDM7T1uUGSe9tgULWw1K59L/TaGsKMceESO6IWUVw/ya75VkiU7yY
 z9WMZ6dmZm5jIaRWBJkiKg3eXh8gH8d3IzSAiL2rRLxKYPuyVeHvi5rPep+T9CT4NWkYa
 TFLI1hkHQe4iVlidIPer2OzVjgAN9PkaihggsMXAXJba63PnkC3XneuwXYepTkI/cGweH
 BBZJBh6RI3qw3MQ7/M+6DZxPei7yyXFZoB3XPTkCyTt8PzWJDEOCnHMBRD6tzztRlKQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57029404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE7E6982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:44 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a2d0ad8ca1d31c73b48f23ef1db74a5af0dab816
X-Git-Newrev: c18415c2d991a2fd57ca8c84dbb5693e59a4dd09
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.EE7E6982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/unbound: security
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
Content-Type: multipart/mixed; boundary="===============0666059674894649627=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0666059674894649627==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c18415c2d991a2fd57ca8c84dbb5693e59a4dd09
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============0666059674894649627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0666059674894649627==--
