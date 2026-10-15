Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C285CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0BF3611E7;
	Fri, 16 Oct 2026 13:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 6hyT1S_8vr6u; Fri, 16 Oct 2026 13:12:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6EAC661263
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156366;
	b=eNYUzlCk6hQhOnRK9MYBHyjeKazqVDRRmxfAgR63Ah1TGvQLvX6Yy+Qtdk8Hp8/9oZv7
	 42lcXqGDnuPQri/phhQ/JpifHBlEJ55u2wH5gP0uVYMf51Lgq/Q4unT8B0rHyKCqj9iav
	 n35+zFuPWJXR/V3znOyQ3NHesCh4n9BB6hGPnFUM/XIw3LfEHM8Kk3YT2XFA1yhCAQxni
	 BFAPb/XbNenJEIcJbG0efkccrfzKyqwj9eeuuw+W2u+RouBa87hysYVnyW7MlxW0c0mu3
	 1mARJc8j0s8IFZ8O0rDo+VxL/v8TSYUELTfp5UICW12sIzQBUQ8Y9WJ1RlILrcbppnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=l7M1eBF79DTJxTi3XwEsfFf/yY2V4Sng5EFhbiqvX2I=;
	b=fc+0m1YhTzasWXb8yIddiypM8HRz+ClwzhyvCl+uSLKCCnN4MwipfNO9AJNmrX/wRgvp
	 hwBYaB6mhlLESlv9r1z0v8SznOyexqaerQsY/ejcJjM+wBD37dj6kky9kpZF4VSIdZ2VQ
	 qgCWJzKyGfoi52AZo8phS3QmyIkSliVgYPBblRLrg2NGlhUOcSAYUrtJrs/k1jeG/4nMV
	 KKZOcMbZ+TNbSWFXGBR8zktVNtLc1bcPUrpPGIpF5u+AYl/psmlPKr5341ibNzMuTJ06+
	 9yiCybOReSKvyO3lDIypS6F1HDhWF1vs9p/l9uPuo+CiwFswC8pqdQfcCODgM8VT2ew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156366;
	bh=l7M1eBF79DTJxTi3XwEsfFf/yY2V4Sng5EFhbiqvX2I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LA/a5xoH+aY0WeP+5vG79uhFIKB1ReJxEi46btPj83W8HeIzDFg+UzFI3Rfb8+XF8
	 DkP0dK30175CEbMyyDGIiTlJY3vencJQYID0gdAxtIfVJzYLxttNcFYoOhImSDXN0H
	 qE/oPPevDA70G5dkrmkmTm+N0OuE7rynhMqWi23nYPc2V/Edt+tBZ7htfS/czTuk03
	 aGOqBaA/GPio6OTE6v73HBEisk1mZlTvrBxOYzAAjbbfUNg2nDOicJbsNG5tsZInEp
	 LGM3ucTZMSZaTj4WmobnD7LuUNu6Mkab4zv4c0mcfHh85U8g7uJrI1jI/HLPq3ehQV
	 +xn0EGgLetM2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAC661263;
	Fri, 16 Oct 2026 13:12:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEB1B920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C125F60F1B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAjQNRrwiToL for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E8D760F2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=Nbs8rhdZ/rAKTiDBYwJkvRdnhUEY2dnvUKFFDgvAKm24llOsdIrlAKIIjpJkk5HwITVf
 kWEyWkvZdvgQyYq4oB47+XHYHTeksOapDq4AKq3dlLhA/TuMZAACfrzU3037zdxumyo1T
 Ukiz0wdz0lEsCThx+VSV7jcAaXH0dqoJ4sCE229SPOmvnB7kKuXGgGso+EaegR0JerapX
 6t+fOp0hFfJW+ZvtfeZd8wlq7xKPr77/Q+2e0pOR3vvlcgv6ZQNBiU8opCR8o3iF68/9g
 Z+2y+tEnTyDCyuRpr/Y5p23kiG39pbblW0VmkBLy88uDaq06IcgzVTEfEojluXTjdug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+1ffgN9WrNSTws2WSlVWonPcA9As+dz3h3WDWFHpFoY=;
 b=f+tlqbVsIyq2x/7Y5Kzb+hVPz8nbeia6yty1no7IZe5SLUB2IALtf6gHF5bqmaFVIuOi
 iAyEjMF36MkF7A3Lg02kgEvEqRGpAdcfTCnTzmY6Tge7Ckf+0o7roHofa9Pcxr1lM+mAT
 /J3PXd5Ctw0fxN1HZwJ6Fk3NN9hCecZCAB2DDDIn41PewHLCmriUgmVBPMqJBmIeimDe3
 4XN6VsAqrnkX3iZ94Mrvb6e4C6fiZI5ryMEFT7llLHd6/TbfwtOp7CnpZqHGyEQ/6XfMR
 eqxr/7Q3rmvnLFUnaZNCaEHKIr0xcZF30+xUAgj6D4Itc/h6zkCecEO64dpzP2uiYpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E8D760F2C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2DFB960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:51 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a049d34e641e9c29523795a17b817ebe0a23ced2
X-Git-Newrev: 23e6fb3ef2e8d67ed474b867fb9a8cbf7606dfae
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.F2DFB960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sqlitecpp: fixup
 Config.in comment
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
Content-Type: multipart/mixed; boundary="===============4535861777598622956=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4535861777598622956==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23e6fb3ef2e8d67ed474b867fb9a8cbf7606dfae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 8b651fd817a9e0c11ebab12bd558ee6e80b86cd4 added a dependency on
gcc >= 4.9 and as part of that updated the Config.in comment to
mention C++11 instead of C++. This is not consistent with Buildroot
convention, where we only mention C++, and separately the GCC version
requirement. This commit aligns the Config.in comment with the
Buildroot convention.

Fixes: 8b651fd817a9e0c11ebab12bd558ee6e80b86cd4 ("package/sqlitecpp: require C++11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c12e9327c7c0f6ff86557eee40e854d8034aac2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sqlitecpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 614c46cb54..8e98b16137 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+comment "sqlitecpp needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============4535861777598622956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4535861777598622956==--
