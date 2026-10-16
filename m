Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F235CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 156B960AF2;
	Fri, 16 Oct 2026 13:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxCDtT_xfIro; Fri, 16 Oct 2026 13:09:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0426960BE4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156162;
	b=eH25Dz5q/Zvvw0NLd9TNL5GsONfYF8BznVWfZdMkLQ4jVpOMgjpU/QGX5mkHdFN0TRmE
	 +djoMQZyOIMnPXtK+8fnuZrdW/ikHVWS1ByGUZaWWgdQBmEabcdFBnN1FxBFo5azhuYe4
	 RxJE1HYLQYDn8h9DNtUw+pAzsWvf4AsiDa3yM4lwFf3ApBSq8O6NZ1CbpYaV55eQFm5Rt
	 6Tr2WDtG1sjn+46gdZdV7GV6EX59wgt0wgvHQ6NLPWHBtIwipWkcHmvAqMak3ctznEt/M
	 EJdNzqQ7ysVm+eci0tjzThYRIO3Q4RaR1wgY2lPLiA+9zQEwt276Ba4cDPi8J/wSmOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=cuXb85DrN4OkP2DPLutuBN+EKmP/An6MH5S5gIf9sLQ=;
	b=QdIGtQlPG6gMJ+RL2WO/Xi0yeD0XWzi4EREAKjQr0j9nOzdUDmi7CpO9FIFeKBTJoKE/
	 ooSJbdpIILS+lTkbKSAdC8INGPZBaxglaTmj3jq7Wk9gYP7jckDOxiVZ4NtPKqCkwWW1s
	 JLUPBLefHlC4tpdGu58PMe+pafsqw3rqkBlm2GbBwzOiVYqvpqAenekF8nAOajah/NcwM
	 dhD3+zU6J9LcY34K2K83ye1BKws/b7aK21GixN4eRLBb7GilYts8vZ0GLz9K3lGQgdIis
	 XXxOq03Klnm8r+QKLn9DMB50P+xPlxJfr5gEqkFicN8m/IaQjD8HSIXAOebRD9EKU5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156162;
	bh=cuXb85DrN4OkP2DPLutuBN+EKmP/An6MH5S5gIf9sLQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T2Zya7fOPWeJ/qoPee5p69abF0BNO/+Hnjzd9LloM8loSkBkUfxqoPcZchAzdq5L6
	 a3hOIPxdQMZlkDX2sVzr/YTGot8v/GWXehzJvdVs5wu4AdHtqC1I4T9GSTXljGC1Gz
	 BgrAsx3vcUUS8gB9wq7XC4/2QTsVqJBDyvVRPL23f7iLGRkzTEA0tb4MnccF4rrFZp
	 CsH25aqiOeVMD0ULmLsbAlG7lbi2jXIsm7WF3DPYSUi5AJuRPZym7remwAKo+iSrgZ
	 dsa+Y/8u4DNNuDpVCDX03lxi5IzrrOgHWbRRSvMZcC3XqJGI9PWfEvVaK72tE8Db4t
	 +yjS/rU1o+a6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0426960BE4;
	Fri, 16 Oct 2026 13:09:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00127920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E66EC409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQe5m4eW_QNw for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41934409F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=RcHwj3FpOzygjUsliLaQmGP0AoCKyAgWrgU8EqTLDACaawG8SqBBcgxSxUsU07RqmQ3h
 gIg9qtn/CcT6VvktKo4dtMCuGrJNKYkFTu01N5RiBwQGPWZvCoxCLsZJea8+ALmys0Q9C
 vLfq4ksxt6GHLTbLuumxh/bq7rQS2NNLBh9AGRrXmWj/nCOYUMRIe7oK+C0v4DFgkKDPX
 2jRhPoX95pqAJDabP7JR92ju2N2Qnhe74mdyo6lkBOnaD8OAOteE+/5hu+OtDZAS5iewB
 mwmOQKx8AKfd25YDNWOOdqLn7OorqhPqFO8x1UTAAcLojd/YPgl6sgNpCVsFQg6UsdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TWh0WA6/BvyhQB5uFeMCRyRNIjED+e1cS27LJ+B/2SE=;
 b=jboVautAvOmUs4XI/vi4or2yg8NFlDbheROCc/iSEPwgHfndvoJmo1JVeArafY2TkGGZ
 9efgNPlAgPIOVEwY74Bjm9/4UDLT2I3rWpkFnP+54BJyBj36KbNSTEDiJXWxmKR1z6Q6E
 YrP0vyYq6fHvMqsDG2wVCvc9YdZaT/MSHaIpoUZ80gAKTdYVaOQDTc+YM2UCqjvSbki2s
 v0ZcgtLwF+7+XS8DJV7kbl+944oL/m3yDhN72ygNbo52LgCa/80bIDAXoeJSQaDowIuSc
 1Plf/HbrcN+xJEFgDNpjhxsv4ejkRjfCXHioICH7Mi5gAll+fbAiixvs/MJvLiHbRMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41934409F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32C65960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 40164b1bba39d5eb0bde61f4d6e95a6ac0037537
X-Git-Newrev: 790005ab44fadf6389be659291cd51891ebdab70
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.32C65960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/edk2: extend help
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0385343432601594337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0385343432601594337==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/790005ab44fadf6389be659291cd51891ebdab70
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ea0f27d64f84894f53170bec827aeff4370104fe)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 boot/edk2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 4e6e7d122c..135804d706 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -13,7 +13,9 @@ config BR2_TARGET_EDK2
 	help
 	  EDK II is a modern, feature-rich, cross-platform firmware
 	  development environment for the UEFI and PI specifications.
-
+	  Select this to build EDK II (and OVMF) to be able to boot
+	  Buildroot in QEMU (UEFI mode).
+	  
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2

--===============0385343432601594337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0385343432601594337==--
