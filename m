Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC23ACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5CB361191;
	Fri, 16 Oct 2026 13:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmtxIAd6Jnfc; Fri, 16 Oct 2026 13:11:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6536F610AC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156291;
	b=R75VWUW7R7qVG+UxFA6mHfT3GMHm75XeaVlGK9XoVgY0duVXb93+0BahgkFFovIKPD3L
	 bBFJ4pUrR0YuL1v2amN8+65nobaVK0rPFI8C9cHPXn0CGC5sRpAEinKS6GU1N4Z/8u3ZB
	 SRd+5EQiIRGoi0PFbqxfWij0kFbRatgz3iiToSiopLnot6XUe7QUD1dlm33TJgexVWfar
	 c2+OkFiqwKesCxZmNA5tnLOwHLB0iNWgdlIGmW8G+d/kYdGHa6qH6fIBoAAvVsS1ScwNJ
	 P4T4xYA8M1OgfEHYYWrRvcca5rscjhYRrFL+kay1bwwyiNzpCY4H+915Dw+Ns2uCcPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YwnDijdh2Vm1I6stpkodbfwb0ravkKWm+FisFXhmCao=;
	b=ICAGdWcsPi1eCSsk53hA7b4DUUboaQrOhtiwRVdnq4Pu97uVX7B+uXZjq2esdx6UPzfr
	 RN7irBH9VUvJgljiH6t1Bl3Pef1pBumOVVjbXazbVPKsZAd+3AGleqOoLFAXSS/Pc5ysb
	 Z1uqDIpt58CdzmX0fTRXi1O1q1a7rfs18BIHo5rFdMMZ44AEmWHPopMQHZ42FRhdV6BRN
	 4Ew7cRNlKnchN1gg2Ej4SfGdfpt8Ygx4pr8EhaxTLO2ucREwvdyUQvDUfxOTckAKcprk7
	 2y7wpPSFHxTGVGE+/ucxHP2YEFKrxA0MxB8qhBEwvJ+dq+Ti2XH2751gh8V9U3eJ7dQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156291;
	bh=YwnDijdh2Vm1I6stpkodbfwb0ravkKWm+FisFXhmCao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TVjRMBXP2fd58YU7etbfs70PzzfKDVvkz+J3El9R0Bw9yO6VQW5UfeCWVn2x+c+pv
	 Au7jQ1OyVA32t4YIozt72Gtts2tau7WAFqifPrnLJTc2KRPmLynH20XmtMzrb1ws38
	 AxhbVH15OqswtE5evKViQWm7TnGSZCIDi2odYyTdwWDzF+U4ooT0hS+zE+JRKxD0Mv
	 R1IPsnJI3VZCvY1dgX513B9FkHzJIlF7Sz4Bbh3dPmAAAtPQ9HH92HLh8E22NJgb9Q
	 675u+qwG7hP3YfOeSEkzi6pRMlERlKyo+ojVukt7V1sYre+2Dk8KwqktFzBRPffGBq
	 1MYI3dY9JSw0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6536F610AC;
	Fri, 16 Oct 2026 13:11:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ADA8F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BB0340490
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTqzj9prrc6q for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C8D3640474
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=TzZGG1EOyfrTsBb1mpHefbiCSDtvG/lj8jIOYgaJl1XFLKrZeL4ixHP/DwCFdLF5aQfO
 p4Qrym0EwwiTC/MORQBfSRbIaZ7UQfyhOIDW2GGzsNqpXrqwiCNHN7AKO17oDeRrL9kKt
 eWXW8mX4CRG4sEQFr8p4NtCMVDzcYBQrvn+iwl2VvuHMVGzCcBDsPlF8s4gW5xJzB5Oh6
 Bbn6YQBhj330ciwbKz7rhxMQBGjwLlUUBVO0t0waTpBoQaNCRJy+7MsxIaywKH+f/aSUh
 NMyY986gB3O+08epPuOXjfVXhPZZ+ZirI6pS1mRCtWOc1p5UfDhiTexJpu3GLB0AjZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yomFKf8ruKSdo5PlkQlW6hCW14wMpNkeOLttEOLpIRM=;
 b=ldI6X5N9OxSGdbKbxl24s+1Mj+hL18z2rF3TXg6Zs+e/wPHvnOk/jC5xWh8g255IGEqz
 bxFj8E6ytbT+dF61GaOcej2ZP+1kAtq74Ut9W8Ievu4r9Ge6+/NHKD9U5GEOZ4fZ/QCn5
 p7E6UoKucvOLbGm7tMqbnufvP4GjlvFFUEG3YxGB52Dkoylw3mDoV9PkkAj1iHovw5Yad
 rkf3dWzb27zldDNQjg0lgn1sLhEdnQGIAcPu2EVb68xf0aR/L8HtiNZVVkIjLB0IQlZoK
 lep2QAF+w4Q8Erw8Aix3i/yfXtY9vcJo7qhCrEX9W1nwt3ct4NfBLxJcEf7UK+0dEKg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D3640474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8BCD960DA; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:36:04 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0b981574068cdd6e77cd67ebf26a66556bd64cf1
X-Git-Newrev: c82b49c285c1c58908d8d608485186dfb2efc0b0
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.B8BCD960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-generic.mk:
 drop RAWNAME variable
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
Content-Type: multipart/mixed; boundary="===============7148206074913932179=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7148206074913932179==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c82b49c285c1c58908d8d608485186dfb2efc0b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This was added in commit 7a41cbf938 ("package: fix patching procedure for
host packages") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_RAWNAME, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ade0757d7f26314b421719e12e3f51b04d53fb3f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 09d6e5b20b..f8ffaa21c7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)

--===============7148206074913932179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7148206074913932179==--
