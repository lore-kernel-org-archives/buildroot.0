Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B312CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FA360B48;
	Sat, 10 Oct 2026 09:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alEZJMrsnPjZ; Sat, 10 Oct 2026 09:27:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2346960B36
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624453;
	b=R6R/DfZpLeZjT7/0xY7PQQVKuRqFBSIYp+oO8FOxclFkLB45HxRFL+lon5gq9xnz+yx6
	 n0UWTOTufGYqUT8ip63xq55onBn7DlMKlOaBvY6ya5NdWlQbry03KimBHjkogV6lPcqYT
	 0JnTXolFvhHBZCup2mDtsYxNNE4N+DJ3W9Z//xqlhFC/haD8C4QH1mdA/d6LHKbC89hvX
	 euhohkOiVWbXk1Al0SypKfgB9LWbVNu7Aqp5N+pmFQgSV0O7NgCSjnE0mvb2ENCh5xoUF
	 JTTMiSkUoJOGxf1lqfnsKtPRPbmPQYQjsHvUDr3CYbrpFVl0x81gyjD3pE5jki3Z4uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624453;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=62IuEPnYS1nFnEoA9wPK/oQQDlhtj1QUajVKras0CT4=;
	b=IImSnQOKQ/jYDn2EpYNk+Ov0W4OZr08qJmcYufJkmz8NEAMP8OPaKggyytHXjHRRrHf/
	 5EJNCWHgh6fu6rjgpOIAC7mfRpNWFMshAhBRg3A/06q1aU4U5lGpBftndvfSd1E0FM0me
	 X+5ZJwTrXfFz7gfypUmMgDs2F0TSMZZM3+xYlgYh2waxss/KDJg/YcMi48RsMKQmR6iaG
	 HpRIsbzEyreAwF1KJkV2k7Mofb6s7jeb12YnNcXkzrBmsrDBrkiCzlLhV0WPq3NfcsHlK
	 RBHWRoXqj0TbZo0mfEgHpR108K+yyj9nM157tPim9BoMdg7gLIOcoI8zk5QkBURmoJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624453;
	bh=62IuEPnYS1nFnEoA9wPK/oQQDlhtj1QUajVKras0CT4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=blUH5lgWdsJoBw+7rcBDzbTBkIudekIjNj4w6foW2rvNLJ6vclV5AJwhyO9XUarNh
	 d4vzzScQKl78ejR5zJGUswySvk9MlybVrTQ0DHdAVhcU3EKybpt9/86EdIlWiI2oGs
	 PnN08RnPMEFWQl0VbmuYg5gzfxS1iMQshznjdAyQ6m+nHYmYyLVTNoc4x2cKUaaXEy
	 XA3rPZSwA702t3foBxYOptNKnWo9qNL7X5aynpFtzL8jrkT7QgKzKnj6ddisGnWWU6
	 +6aadrqxQEfEtcYTgc6MKbE8Xf4ysYtl70e2OUfIUvUfEdufZ5r8EHOT3C4wYTdXTR
	 XAqUQZC2E402Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2346960B36;
	Sat, 10 Oct 2026 09:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB6BA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 166F1811E7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBBFwolY1QUk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6052881149
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=AOGKJwGQWvaeZ2LE1u0DoigoSawCpFTFDLkbwddohtsi7C0erczYU0/0jD/3FM4gDRkd
 1qy7BWSZto4lGJMwOaJu3OR1RQJNpbMS/8HyqlwlTjPlKYZprjP1TpYgSm4rF6yU4h7qy
 yKQFrAYbuz7I01L2bZGQgRslYTZfhCIYKAnv2JxgEMWqjhVqRFl5iSABkjwH9Di/MoGz2
 Sxaivzlj2bHVb8HqEg3do5lFJwzPDKzi/qqH4NdCpG1X8d0NVZZHi3L6dlHc4btUeOJWN
 RtrVwm1J2rknPS0AUn6k76uL2Kss5lbUbF9Lo9SX1zD850dddtJC/ZfvS4Wb0YfHFdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KaurfD0kQKeGbwna83Dg98NN3y9ra+d2xj1MIZ3r5BY=;
 b=o4WZNciEg1eCKYtJlzOGGz4rQmNwAXvM49Vwi+6cplyiRPVgA0erEthlhzUEuT5Arg0H
 9XdQ8Epkw8v+bgeFCVmjyC1uKZPC5nLQj8KwVSMkyEFz0bbgWd9MmdOv1HH4EKPImfB8U
 X+1QC6ImwI2Kt3DrbsULOozf0f4FLJTQyVNIN3ileIswrGwollgZTBAZHoiRUrI3ZKFCV
 YREvqpU3iq/S/3r+YFr7kT1+5zFmhzHPoYZhrz37wbTfWgHlQCiurFLFXe7RmDB2WVYdh
 lNXqHCbbQkPd94Q0/cxjjaI1qyYonRISjgLRwmf2A47ZSVZinhjc/pEZQGY/CFZUf9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6052881149
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A6868F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:50:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 886d11f39e38e95f755721c2d39cf61e29e6e0bc
X-Git-Newrev: 30f18d0456decbd22d7b92e6bc222250c1274e6b
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.4A6868F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pcre2: security
 bump to version 10.49
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
Content-Type: multipart/mixed; boundary="===============1798044228655170089=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1798044228655170089==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30f18d0456decbd22d7b92e6bc222250c1274e6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m:
https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 99ea0fbb3db76057a77bbd618cfbd188c69a6f86)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pcre2/pcre2.hash | 5 ++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 90991322a2..3d75858727 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking pgp signature:
-# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
-sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
+# From https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
+sha256  53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384  pcre2-10.49.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ea841f482e..a3e74e32b1 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.48
+PCRE2_VERSION = 10.49
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause

--===============1798044228655170089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1798044228655170089==--
