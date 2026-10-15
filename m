Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AFFCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E5260E9A;
	Fri, 16 Oct 2026 13:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsRUFfOA2Zju; Fri, 16 Oct 2026 13:11:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E290610AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156293;
	b=a7uE676sGqR0BNyUYclCC5lZYy/8JeadNw9dDp7NN3U2EnttXzpjVLvUcD2s6kQIYAea
	 47frrzYKLjY2HlPr7AWY7UtdySQrQKNgdLCeXupEFlz/w1K5C+eQ/g9FA3mYqjCiTPOYu
	 Bu4dPkXvgrT2+xXjl3DJE9cNPpl4V8UuKNoq4YUP1E+c8xJF7JVSbxgqQX/eEgwBZpSK2
	 x5aL1ZUt45b8/RDDTbXWR9TzfOy1+3pNvUpqA+I/Ilw/1R1AtLFWJMZgBQ3p9ku6rYnQu
	 qzNmNZyZfTknZ0SqBTs3YPP66j/6WiYIUaPlVgBACG0ih+p8N1C66l3+x+AAzLw2twQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=latHBHlQJH4oAdgHp9R529avVJwi14u3T2XfQiyzHTw=;
	b=ZRc5GRnSmZ/sIf0PwiFjwBvjzlFYtpVyaBnLusHNGDrKiAa8Of7o8zvVLyNOZPnNi2b/
	 ZJsTXWbPuYtCU57Mdc6lKrw1o5yuomkwaYxTE8PIBeGR4M2GcqawHTpSp/Lg2iRwUvKeX
	 SfVHlDcXGkaR5BkjcmirlDHfFv40Iynj45OEhH36XwVj/wcDtzqHmxJ+g0aP59nVn3Cvy
	 tIiEYyQLiiL7U2SQCd4vcA52/GrArwRENHtZiDDlu4ACEnIFw9ao5CL9Ece+dUMPFGdJ7
	 AbmBVwohR424n+XWjyIi9DSmZMWEsp6AxSTB2fieQLKeHG4xDDrqwnDadUgQwOdP78g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156293;
	bh=latHBHlQJH4oAdgHp9R529avVJwi14u3T2XfQiyzHTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X1StqeKFqdi1kyi7gzZJsOsFYNF8PmE4BlAegoyD18IYYuM2KX28NgnCvlSJmqi15
	 dXfPLX3gQWaElMc9SlFIIvlQXV3Baim888/VC3lxNpoJYeI/nWIZwPklvHNRjVgEv7
	 /6pr3IeyEDiatgfWvsUiDZ7vpwaiIn+SH3hjBWinpugcEoY2xw2px+1ETqTh38qttW
	 h9wpNTmuOpT0BmgcZACKL5RQYYnsmAV+zzWJ3OsuweD7lcJmOjhkGOFHuVbbceSJP7
	 VpuDquIOgsPRivc8iizw8l4H1B8QQI0LWCVLfy7B/zruH/t5gLrQwBNJ5dCtUWZOeu
	 pcgFv1H8qFC2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E290610AA;
	Fri, 16 Oct 2026 13:11:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF14F105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B3E40474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sa1QSHo4Q6u8 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EB42B40489
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=SBmUWojLO7g1aS1HxK2c3qRuNaImQXW/OLoK4NfT8SM44QN3WHEeAppqwYoOnt5yMdKz
 gCHn36DB4/IXuucLIiwBuYAEbtSJWKDKt5n4592DNpHpH6KGDp4gv0UZAAR6af5oRYb9u
 0k228cuwApsmMX2wdYQs2ygatJXJ6Dh/Xvfvdb7auhdSmh8/yljwIhrNH2J9/6aNKVUF2
 c6blHJyST0yNUiyzmJTIni8Eq2US8AePof4kYezN0dpd4KPVaddymZIwVCXY68P2HNYlp
 flGzUSqsGSyBcR8bkRbNoYaQmocR5dFV2rHIW3pjjrHCZMj96oSCdewZdUWPfquKVLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tsF+XrR8jCpwLxvMqqDunrkJqMuyaCBa75I11lcMdm8=;
 b=WqR0X3zm7JVVSb0gUn9lvSOFB73nCrbvqsM91XwjUe7AUMl5DLzS7fOOTkVUF26IcL3V
 dkUzvfylw2/n9tNOUDhjBbS8pMrLriwF9SJXsuMjZAbTH9kbJVbLi28Jqjo2xcyz30QeX
 nu5HDikLqf2r2c6xIs5mNEJFqY6jfPe3ORRRz/KOrdsSjys4aYzB2kHnixR5Lcyasabqn
 hpK7jE/fUje5e5yDJIDkt76Of9G7uxfi9kpRv31u0G4abgi0Anrd2e7EA4mYmuG8enWXK
 Mg8dog4Mi7GU+feXpKFs3gVeq8I332uyYYApt7se0RUd2dE465QmEU8elevYL5YuhFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB42B40489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAF69960DA; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:36:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4ff6a490e320834f474b5acfcd53e902d37415b5
X-Git-Newrev: 7baaf34fa5aea2a50d0e92a47b3de435b9a5af19
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.DAF69960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] boot/edk2: extend help
 text
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
Content-Type: multipart/mixed; boundary="===============0274370123636423595=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0274370123636423595==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7baaf34fa5aea2a50d0e92a47b3de435b9a5af19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ea0f27d64f84894f53170bec827aeff4370104fe)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 boot/edk2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 2620c79076..7d170fde3b 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -14,7 +14,9 @@ config BR2_TARGET_EDK2
 	help
 	  EDK II is a modern, feature-rich, cross-platform firmware
 	  development environment for the UEFI and PI specifications.
-
+	  Select this to build EDK II (and OVMF) to be able to boot
+	  Buildroot in QEMU (UEFI mode).
+	  
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2

--===============0274370123636423595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0274370123636423595==--
