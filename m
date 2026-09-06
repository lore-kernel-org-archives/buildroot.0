Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1660C79FA0
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B651060657;
	Sun,  6 Sep 2026 12:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaEMs4fTupcQ; Sun,  6 Sep 2026 12:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 44E9760623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697134;
	b=YdxtUsx3bpusUx7KWm2YvABvJn99AyCIF/x/sWLxzWfCleaevYB8ebNQGgSDy9SQ8PN+
	 wYE30A/Af5NCrydhvlhPd1+YNA4sGMHo13ZSvn3bCJmznbv0TDKGpMb4NxQPIrsGSKqYP
	 aYHyrHJGZzXArfcY3X/Dhh+9WJtOUnra4OgqV8juWcznPUll+D/tnfHrIXTE7EXz84Sm/
	 h6dzmfl8mNNvU45sdAvtfh1zzjBAtYcEKKeobEPs0I5zWg8tCtD6eE1XKrkwSRrGwq1q4
	 ct1SON+/KygimXtbt9zEA3URm2itLgfANjE3DfWYfrXyxtUfGLW9iJvOYo3EwK747bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HwSuZ43BB5S3zBKCSWGAnkOEP37d18lI9pvkkT4UTUs=;
	b=H+gS2WHIH+TFG/u97Ssh/2XchQTuMkaAGr+kcPjnzvYdpf+8wL/cRGn233dg175J6Oal
	 7ASn94tsECxbrUL5vKGkl7S+hPZBcByHTcucKzPaXAb8S/IVRPxCQ6Ocf7Oj0MVZmAZeW
	 TEY33mgGGq0hbjwHEne4TcXgotD+btzqKoSz4R61CYrDZnKiz7xY6uv3DX7Z7iODxcYcr
	 zoeljI4XWHZsNSMLpU1d21v4cjWOTtPoWDd+NrrdddcCLlPlBPxaz1F4u/rYdbzUeV6kC
	 c+7fc8YSn4kCZf2DjDg69fxdY1I9L6n2SQKMIYVvV3Ujqn/kTZSvfVyRnQbDY7ZE/Gw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697134;
	bh=HwSuZ43BB5S3zBKCSWGAnkOEP37d18lI9pvkkT4UTUs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dEKtkWbyRqE5O4H8KcUrNCD5T7yATzUIvTKMrgvNa83bzcyWjs5U4wO2NiNQ+rPsE
	 jN2gAWNjedx6CrU8SqiUkrMoIry2tftT11n7aEJPUOYXfZlrwDkH+AeEFNBmbjcprr
	 qUu8gKpkSY+BDjA1hEoRAv5v8Pu2SCxeJopj8awDLZ5InMNeHDRVor2sKpS8AZem3H
	 OL3dA74hrG4DCMJ7BVqjTCuCVcLEzc2+idNi6xEFjBeuB5of2RORtckvx90lNoWiQM
	 hpIHpou2oudxSNgF1KRsIIsBOq8MTY2H+xwPuG7QS9xccmwePNju6fy56zTgVEy/Jg
	 zZcB04Z3S7ZAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E9760623;
	Sun,  6 Sep 2026 12:18:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45DA13AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 380214006B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBjV2fy9_Z8X for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 20DF740068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697128;
 b=hK6qcnKa8LuBUsBoUPbJ50dwvcLBUKgRgyoIKJGE1sSRDstrFGUbZ/YsTlQR59B3osKK
 XA2KcYL/M2J0uYytVH96D/L2TsEI73mxggEVBEIY9564oHbclvCTxVzb0K8tdoQfs2Q2S
 Qr51bhWU/W/8bC80DN9QZh7lWu4qtwRq5PSeFEv9J+KDJoJzV2TVDRZ43AjtGyUfPRfpF
 4aeic7JrLDzUdJa2e6YE0UF9BPv/JkPFHXK9ecs7ncMx736ACr9oVUROv4zoaX6sas196
 /ecDSkUVCqSzNVGtF0jvMGnfK45HOcgFY/H29TpZMhXibDzYKz5bfe9k+CQEzztT6Vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697128;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sk+KoMSNuRQ9LAEMAEjeB14lXnJTsRhCOpO/EisRulA=;
 b=Ja90QKt9PfG4Z1+G8S6Dbo7++G9zHYsaBmfymePgP4+8VFnzj/Ks5Cii+0FzyhP0L+1C
 uAtOerbzejJnnNSS5nqD43BN1yvWgp/BxWBKAKfkGkMhF9ZSwqK9Nd8HGJktGBLuBAA4t
 SIgkqNnuC+Xff6DQUHNvfE2Tdu4FPPToN8W5UhUe6hXAre6CWv8Obq/lkwGIA0LsM7Pry
 Nr8N0iVHVD1wB6diJrL1l4EtI7EactHsOcTzu+IN+iKVDrGqUiSDWvckzO3nj3UpI+gH9
 236E1y27bzW5B94kToBf/Adb7k5If4UeccejUnLzsCaVBqNc9fPWyRnMAeBE7SjYQlw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20DF740068
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F4E995331; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:56:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4c3a288e64e5d0fd2578c4a21459842506a4035
X-Git-Newrev: c70effd711ad70bfb0266328d24b9244359f74ff
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.9F4E995331@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: make binutils 2.46.1 be
 the default
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c70effd711ad70bfb0266328d24b9244359f74ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that support for binutils 2.47 has been introduced, we follow our
policy of making binutils 2.46.1 the default version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index fc8733bfec..af00a10b9f 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_45_X
+	default BR2_BINUTILS_VERSION_2_46_X
 	help
 	  Select the version of binutils you wish to use.
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 93a2e82834..ca1bfb89b3 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,7 +8,7 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
-BINUTILS_VERSION = 2.45.1
+BINUTILS_VERSION = 2.46.1
 endif # BINUTILS_VERSION
 
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
