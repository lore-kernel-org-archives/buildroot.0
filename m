Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D112CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E41DF40607;
	Tue, 13 Oct 2026 08:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8xteSPc2lI3; Tue, 13 Oct 2026 08:12:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0054940609
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879174;
	b=jP75tHPgpvDIc5hcSQqzhsifH6sRN1+0sTLMcTow5gjV95SkFA7teMBSZThfuUlX1GJv
	 Qg4dZHbCCxgXxFnPPEXmrCgbkCE7oR1xobQTJiFFfF8LG1odvWPU5bwxHmgy23MRl9Jo9
	 SFyDiqYnJ6buy5c6idtYAXT/4ZiocSdL1WTpX7g9EXgER4x6Qyruz7SfgLAFrLwarPz8z
	 P7j2ZIUxp123hUzTDtr1RROKQ2scpjxP+WbxXUNCFOfyorKIVh73DBDxkEazCtExCs0Gc
	 NpOMm/uhpKSUOk6qaveD2cxJVd4M5MJ3XYiDeHhULXjMycJpwlKW1z2Ep61WAbMUP6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=51ciTdmtl1qZDbvClCbHO8CkxSik2BFD0xMtnTevZQU=;
	b=ouARYTfFldT3dBDlQQkbcA30aiXAk188hObF4LjxYiP5HidImaC75rk3T0VlmwB0Yxu/
	 hsQCPeZxnkIlHg99Og3durkZWrPDv2iSZ7hjStlSrktrcfMnZ6C9PEPRpjvNDJr9k9pDY
	 rp4boTtRElH8SQ02lon5wjHIe7eqnUKIwta0HcxoUNSOM23yrEFbNnK0IeUoMW3DNnwGF
	 LRYEfe2AvOWo3fDkm+V/Aspa3m8LzBIMr1voz/vmfjKpCeq6/vDAOsBJvJF3QM+Gs+bcn
	 6d+9vGuk6T6nfmXDIw/OFZss06olHNA5cMn3q772UQjOwQU5lz1rNNLRPZ7da3F/6Zg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879174;
	bh=51ciTdmtl1qZDbvClCbHO8CkxSik2BFD0xMtnTevZQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EqKv2+BtqqAHudSOVB37oF4uaH+wZg6AwFaUpb7sjxiSbqFvIAP9aJHoAD0k7kc2H
	 SIFCYzPTNGgicEf6TtUIOIDxluuPPh7vE7Oe2WavSWP/5AkaqEh0BeS3X42o3AtXaN
	 cELpVMpm2ogqPs/BNywGxCHuOnA1UBts/OOa4QTNwvGHK9YY1DU8lldpcNCwnTlwDY
	 W81UhT9hm97raLYBJvZNjyK7NNgN/p3a50ELyOXevOq6FuHVGiIRDMUVwna0VtEAcj
	 xEg5z9Zn5/0n0GHpSp6R9b6GN4dGuJVis6lq5X4Qk9JAVTQgdzigLn4LdMBLnzZ6lt
	 xVVjRS2I30V8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0054940609;
	Tue, 13 Oct 2026 08:12:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6C3A105
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0946074D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpnJ-NHW8fJ2 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:12:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B10A6073C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879172;
 b=DkhDH5YKk85kzmSmYyLsImv0551WAd9BHvR4V+dtKjvPlvpwvgJ4WGdMioDtZ1CalWjW
 2OSzfvuc/1UIGqJ5xIx/lPn0HOgo0QMiuQGbo4uPjvpGgoowy93H875b0E2t9tLt00a2A
 Dvb3CzEqBEQ7lkUgDpbpHlTjDJRncI9v+O/84Pt8Ykd8OpDfDNg0zv84lr332N31I8Vwe
 Pem6ujSORZzYy2GHBo8/PHl8UC9OtcEaWwQNTNBIImqPsZDauhrlUTzWjuCzG+GIFx5BH
 6uoOeUcbyt0AW3i9PZLBbBihmVFkK1Woc0vEzZJF8GsNi3DbEgt4JFN0mcYpTP2WKKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879172;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M1xqaxIBPAU8ZGsAQQaNvkD6ih83W3nKmsDUNgeHxe0=;
 b=Zz3KJ1aKXs6FuU97hooolcEEHxar3jMx8LMgb9cijlANPgB+shn0dulbYTVlRLWJyUoW
 wre1x5f2lLl2iWfkm3Il9os2ThcpmGpLdbiND4je2Yt2Zc+/wuCtnsK6z1NxLfFZTJTAo
 PWxEOxlTc3EiEMQOGAaAo+ZjTtAqstjV2VHvL0keiOWte+BZz7LgEDH3uT4phkFxRPkMG
 dFv9SSxVBIeGOqZJmbhD/wnHl5KN0aWOFQQzbq+SKH7swVhdD9UBvQZRcmkqsjwHVYYI5
 vZ8ElV/WzGn/lmOA9pkpeAGN1dy38W8oVnUrswBWGDT3mqlvsK1R1syEI0SpLQ7P+GQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B10A6073C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6007595474; Tue, 13 Oct 2026 08:11:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:10:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fde910991a14e492f391faf02c61f7f88d4f265
X-Git-Newrev: 747aa911f6a471558a5fb2a9e1b133d13104cae8
X-Patchwork-Hint: ignore
Message-Id: <20261013081132.6007595474@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2026.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/747aa911f6a471558a5fb2a9e1b133d13104cae8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announcement:
https://lists.u-boot-project.org/pipermail/u-boot/2026-October/634075.html

As described in the announcement, release archives are now published
on https://git.u-boot-project.org/, so update UBOOT_SITE
accordingly. Note that old releases have been added there, too, so
downloading old U-Boot releases should still work with the new
UBOOT_SITE.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 boot/uboot/uboot.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1eabd10407..d4e77fd0f8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.07"
+	bool "2026.10"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -368,7 +368,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.07/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index e992835582..2142f0c67c 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..96b8cd0d2e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -34,7 +34,7 @@ UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
-UBOOT_SITE = https://ftp.denx.de/pub/u-boot
+UBOOT_SITE = https://git.u-boot-project.org/u-boot/u-boot/-/releases/v$(UBOOT_VERSION)/downloads
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
