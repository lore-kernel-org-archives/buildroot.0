Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DDAC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C510A4129D;
	Thu, 24 Sep 2026 19:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOpxW1BKdNKE; Thu, 24 Sep 2026 19:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7D7DD412A7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276412;
	b=lPEhqt56M/bS+6crPeFsXTwETzfGs6vEPKFlKwCe4d5sH4L2mLgiWS8NlDT5WbST4V8Z
	 HWPUMK7yLtpZ44vWANlzpZPwd/z8dBnNnWxaynmZ/LQ273utiRN4qMkDhVHhAC4cWRXxX
	 nLz+87KmvdbxUoJzwZc/GUfkDBuEU4uVFtTmoUtZyxtNeSlJ9ihqaC4SGx+f20fSRjgWF
	 vxPVVQeBijb9bCqzuHfeqdsQgCdcY2ZtpXXoVqwykztYpaC/e0SMLMbB4HglqRkLIIo/O
	 t2DIv27lK/GldJjXzu+Dz3iude01Cu6l5wXnnhZ5OdlqadMvS3lyq11Z4IH1kbzGILg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=AfjCl27kv5nkWelhRa5JzV3iPfGYXq5nzDMYmXxGOpM=;
	b=V9juGnquME5F7NGfz7xuU9loyMTqaLODX5Hw/GkiL/QMJaiocEI73jwFkcHKyKuWKJ9o
	 LmLRwabnBRhPFnNhCQhDvzR/Yk44d3p0Ir7iq7/cnmAjwV41srajgB2Su+dXYcHcZp+XY
	 kte1ePM69QeUTAhCuzVIBmRW4ElQxmprun6KsuI4XSayEE4hPaiysQEPhALg5M5rjKvoe
	 jKADudWpfPp+DrmbXZJdjddQPMKdyCuhyx2dR2uRqMnhynnCpE1WBgnm9DDx2WkR7q1aX
	 CWWcikeRjDe3/U8UPmj97drCp8wrlkyZfKj9muFyJU2JhGlMck1vvBVkeZqrFh1QSxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276412;
	bh=AfjCl27kv5nkWelhRa5JzV3iPfGYXq5nzDMYmXxGOpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GJho1TNxXv8YuAueSxOxTnKmISeMz+Qay/829rodil+9V1VJIaUM2+jOZO9jHrpjg
	 VgR9ySSaR/yNOxuqV80WzZKdK6o/iwSw/t9K4IDpGRTItdCyloPO4keyQj+buF510k
	 8+rEN89OKrAEk4TCJUTwEM3/HiVHZVP12vLSGEQATbn+Cn2nDa6LPDwat+gJg6SpbQ
	 0G4b4P3xGIjBUBHBXBW2OzzO4KbGxdGBq8fiolTIIjbaG5Vj4G3+FmWyIGmMFl7dBx
	 B8Vy/OqWpULaB1LE/MULIWUrjm7cnXNfR8ArU0cH3nRzgEYruJIaXJXjEcVFr23nZz
	 kr5eX2qHUdcIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7DD412A7;
	Thu, 24 Sep 2026 19:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A2D328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E52D4017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCJr0pE5ecnA for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A61EB404C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=Bc/KZU+7YKOBN7DNNKPm7qxFOS4R6fZ8BPMc7PaDv5s1MKSWnVfmUBo61jgiY95m7uy2
 xFd8JQcx/R4JzDUXwsAfVwxhZejlA7L8GBmBdGPOIqV8e+Z4cZk3QwaJJeAcoeiawpeMQ
 kI2JKBuSs3dD+q2mekSGyUBKoYalRa7rCJ2UEhlUYvYh/RYFTvPWE8CVS6/3SqDNUBH55
 Ax0k9Fv3uhJ2v32rY0Fuw1m2axFUJWJZhVOZY7Q70P1ALZjvEKa8Fx9czCXoKnKsK4mYb
 TGK8qHq0YswlVPHR2cWsogShg4wxcAwLTKVKqNAvsF9aa54ktezqLOu9+AhSkdUIvfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AepjRkMnuKgrzkyWgb8fTMfN311bAMvoIjwLUPvAOkk=;
 b=RZT9S0fKH26hqyHVpenBpbJgVzFuitX+mpg35Lj4pIFyCgETTOPCHVlSP+d6jagOSr38
 kRFPGjNhZ+EP3MnOVuBJzVSN9M3rKR/nW2ft85nz9R0oscuuO2zA9UFp7Q1nXGir6DzaZ
 Yx2HZ//lGKPRHxaBEveQNqr/V1ZU0H2imIv2aE0zcmE6DTbcQGc6F7L26oUdasG2l77SG
 t86wob/GCIBVK1hnVXJYwYtnlY/w91TGIINyyBPxrekgKVbGNf1/e6EHiRVbXWMimTDw2
 4ABiUl7E2qR4JlOnttKXx3OXIGjeqGaWEnpstOzt4Ruhg2ZLaEndeq8pQzLtR1vJnAQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A61EB404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49B289828F; Thu, 24 Sep 2026 18:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:38:54 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2135ddb20ded56c38ac47ae38fef2a0ac2ad6b58
X-Git-Newrev: 7e523d398dbf4e828ee0ecf8ffcd84819cd84e1b
X-Patchwork-Hint: ignore
Message-Id: <20260924185544.49B289828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/stunnel: fix
 build on ARM Thumb-1
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
Content-Type: multipart/mixed; boundary="===============3414845241478331928=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3414845241478331928==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e523d398dbf4e828ee0ecf8ffcd84819cd84e1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

stunnel's configure unconditionally probes -fstack-clash-protection
using AX_APPEND_COMPILE_FLAGS. The probe compiles a trivial conftest.c,
which succeeds, so the flag ends up in CFLAGS. However, on ARM Thumb-1
gcc implements stack clash protection through -fstack-check=specific,
which it refuses for any real function body, so every source file fails
to build:

  stunnel.c:1003:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1

Force the corresponding autoconf cache variable to "no" on Thumb-1, in
the same way cmocka already works around this gcc limitation, and
consistently with the existing -fstack-protector-strong override.

Fixes:
https://autobuild.buildroot.org/results/3d691184ba83ba4d881632f2b2bb4da5aa50f491/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15ccf339c999e79222e031e9b265d9aeac1b5252)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/stunnel/stunnel.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index a8eb652bff..473fc81900 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -17,6 +17,11 @@ STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
 STUNNEL_CPE_ID_VENDOR = stunnel
 STUNNEL_SELINUX_MODULES = stunnel
 
+# gcc for ARM Thumb1 doesn't implement -fstack-clash-protection
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+STUNNEL_CONF_ENV += ax_cv_check_cflags___fstack_clash_protection=no
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
 else

--===============3414845241478331928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3414845241478331928==--
