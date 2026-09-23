Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE16C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E78411B7;
	Thu, 24 Sep 2026 18:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCB9Iq7zvlmm; Thu, 24 Sep 2026 18:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF47B411F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276386;
	b=TsCuc3KPM4cHJX5x2mREdSPicNZwRjxAFds9uHDPFwpAACv3t8jyn7zOqgYEFb1JbrVk
	 Z/EeCLvNaVOimXnifOF5uc6Bp2TSlCd7r3qsmoCY8VwKZyn9nwy74EOuGKYPTvLbekipw
	 nmXlPgFnJBA5x9PKOWGZd3HOvBYokzeG8f2Rv9m5wWxwFxOey7mRaFf2rdtlDZ2hjoWvG
	 pZcvolzDIqfoLUmx9r29dPK/FHAurktNnwD21NVh91HVKZwmVW8G5BV9ZozwDm09C92jl
	 IWMW3qEbjcfW7BPpM7Vbw30zHfyDHIbsZ7kFxd16G1Le/pEQm9b2bIliTplHtyz4PAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276386;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=D3UtC5/LUtNAseWL74Qa37VdZMYUcXclwteuO/n6oxU=;
	b=A7tuA144ShkZMMtEg7F7m1cKduG7V6JFr21/gfZGF+7Jo1T0Wdbv+kVrnJk504elxH04
	 kFFjjXALJMlyEsPXNadwngYQfWMMAMZY5GMBF5eAmW7+zULKU2o7KDa7IA81bZVFxppvY
	 Mf8tFxigVsMxSbs8fSt2xiJ033Z5o0OOJpQgPgIpwAv684MjpBA+0RNpisniq406I5WD0
	 /PiKEv5HK51CVpW2SYlolTcvGZwcUdy/D/HPaUT1cQ9908f3NeA0Ib0d3bf6sB+Nckqpg
	 wiu8gx/SGwMZnSQ7Hdi7LfzDlcUj0aavM3w9EKK2uU+eHfnTyHSt9XU8QU8zeDFSwCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276386;
	bh=D3UtC5/LUtNAseWL74Qa37VdZMYUcXclwteuO/n6oxU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C3iBNh4ieNQuNThQA9I9g2z00lbBtiJo+9g4HV8i+qrzfuTComtMFBtFVF0ky9Qyd
	 8rjRuHRt+t1lwRvBmAgRrq+ZEL/oqepbf5vMLN93+Cfes6WdtSM4JO0oSqXrnoy4cJ
	 jyh9ooTFxnqHnVAVXwSkxrVWrWd8/w4PbRq9xAByS8IbPuMLFRBty3PLLhdPtZjF8i
	 s9iJasrAeYalwS959Tx3ZegumvlmK5hORTyc/+0TNu9fgMHftVgmn0EeW23xsdEQ7E
	 XXDZ3gHB6xv/Tf3Ty15TfzEcJ+UEqOnUzsBnaVx5pT+W7uAubBixdTiG2lIwJAbLFq
	 dPTejlpVBy19g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF47B411F5;
	Thu, 24 Sep 2026 18:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C40A9328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B549581225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q25YsM0yY-Bc for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 46A258123E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=V1hTp7KIXHdYJOBbFPNyhUfo259PDY8LixB0FbjSkL6u5HW2TobdjMnY65ETaaQfZQcj
 LoxWw3NZNevIhfICjh7t7KwAe/Wqol9YIKn07021LuECWynK5NVcwRFx+vKk8JAb0go3J
 q+7rjEog2UBn5LS0FWmPgn6Rtl+7wbnXPQvJFnXP2X8VsgRXiWA7q0yDtGAcr/xXcqvv8
 LWKWkdflrRvYTCiSsuWlQqETRg1t56HKqjmESevecvG3Q5GHo4iTstiCdfFzfDMBmxL8z
 57pRkLjLjNryjFVX/NKN5M6z5EtwS+F1luPuNB3jqIBrPcDCEkrFDHWAB3BaT4p2vcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pReheDA7Ek/8+YaILbjY5rRjm0hfAYEuG8C1+P43v38=;
 b=RmvMXRMZe3/UzZo0Lk3+nFWYAAPfsFlQW1EHcnxrYoTgv61dsVQFlgup/do0704qBQl5
 yekhjTJozIXKbYUQhvFGxQPuBX8ykMXr+632SBzh6yYHOdnt5KbmeN6wJ+BZIpCdIJA5G
 cfb8k5T7EoOYEUISGENKyOxVYynNzT8JomwW0kum76GTA5UVQjlDidIq6BJh5AJ8RJUtp
 H47CHjF0L1MYIzMIBeUsysblUMhM1+WAI/o5eKqHTfWWkqCi7X7QgizhI5kneHYyFl6GD
 YCJhkCUWPFTjZBpsQDt0tDU6WD9z9UKGSqOEzYpbLMQFi5U1C4qY4J6Xmxc4Dz/uF3w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46A258123E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF86998323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:32 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4a11b107c05cfc58402546d99110e2ae71b73976
X-Git-Newrev: a2d0ad8ca1d31c73b48f23ef1db74a5af0dab816
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.DF86998323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/unbound: bump
 version to 1.26.0
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
Content-Type: multipart/mixed; boundary="===============5426398006180720861=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5426398006180720861==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2d0ad8ca1d31c73b48f23ef1db74a5af0dab816
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 531be778bd4bfc98142f372d1f4136d8a0759d8d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 85724ca243..a6bab2218a 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
+sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 46fca5e2d2..a3a1baaa94 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.25.2
+UNBOUND_VERSION = 1.26.0
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl

--===============5426398006180720861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5426398006180720861==--
