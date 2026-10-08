Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2510CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4ECD60623;
	Sat, 10 Oct 2026 09:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVNmAAuQZaA4; Sat, 10 Oct 2026 09:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AECEA60A53
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624123;
	b=fGD0mXSzB3v3lZ25K4rTblt4GwzxePYRQm66a3Y+OmNwInzbFnD1IXJXWN89DHCS7X2L
	 O125kHKgNAqqGhIAu50FA1i4Hej21WEIv8mVda55x1uI9626u4yvVJ2QBsGS2w6VOZJqt
	 CoQGBqgSV94v04u1KDP/UIN/9nd/ii4lDJbm4otfje/a5lAd5ayzBbOklRZOSG+9aO3jn
	 np4euFVcObTyvatYq7HrNFi7JQ8qMH8PYgdkHi4+loSws8H1lQ86NU1sOiPthNYr1yl6l
	 fcokxBqkjiJlLtLu518wUJtNhPulDDjYbwhUuMcajQo14FsSVdkFe5YR87GY3WiqVzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0c+AtvRfdLZL4H39fsgJtCizjLdTIIkJVlD80qPAXNE=;
	b=UOVu9sdH6GGf9Hv5qwTlahlUM9iIAfO059Osoc4sOzpOuvmO9nasWO75fuIfSvkUg2uh
	 H0+auzDgG2tWj57ZdK2oFwGJ7Lgi4kgcMp8OYjrgIKBglFetRi824QHt8FvcZdtdZddN5
	 apwblioFmp7LCBAopM63lsurMez/PHbm5/+ZD9Pz9RxLVEl17WAURGj/5hOJ/MaftcVOf
	 1zpZHRuwMVPyiKByV1XIsFeWJhIyj+TVHI2iaudgwAKIcBIkPlK45Lhq8+JuZyzy8UIci
	 LkTFL8yX2T5m6hYeZbraFhhEV88QP8tbLsY93DShqNodLFRfSwtCPOtTAvja7NPdkGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624123;
	bh=0c+AtvRfdLZL4H39fsgJtCizjLdTIIkJVlD80qPAXNE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kJBooRkzzvtQFONGiV6xOt8iIgdGODLhwFqWr38nvi2FCNXIVpMTYHTPwm5cwafYD
	 tbqv/NbOti06FSYCTXYEmbdHOl8l0tg61QxBm3aHSN/m2/Am1DVX5+K+K6zO3p3RQT
	 5cs4RC38TFu76d40586YpC6DMR9xuIu01cWB0/dHdsUqGh7fyjEnmivN0pNoRhJvPH
	 7ZjlQRYOmRJRSZPbThdl/x4ZQyvGaCB+pxIyHSezxzuL4GiCdkVNMLk0SwxxooR8MT
	 RrMtDY8+IvkCkENvSfF6KEVCOEG88jZP5XAW6jnbiFa7LCuwtuW/R5kupnYYonA00O
	 OzHgSBAnYX+qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECEA60A53;
	Sat, 10 Oct 2026 09:22:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CAA8DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69759812B1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvnrEr9rfysu for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77826812E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=r21G684ZsLlpWq5ti7/AOOg8DG8G7slKyLra9Sg6gvkxfAbXgsSs0TBrpjKDvqM/BZ0I
 R/37gqaO1a66rpSvhlJs0Eku3FlOb+lJwktncHGAP7liTfbKjWdRiDmQnNaJll+2BCDCM
 k8Aycgkd1BRe2JpK9UQGbRJzYn/3xBRKGDaCjxlhg6cUhnZdINeFRYoorzITxMraS9XZ7
 cWZZAS1dqKEiFqN/7mU/rZQ0skhF8DX0zZ80eMIK2LAggi/Iz9jRFd2qtecERW+fL5T13
 BVmKqhWs3b7MPFFyHOAyaFsl/8MXNxatOMkCaGsjNSq5CmzhILf8SF0DbVCIb+I9Zuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6VR+6nkgbo2aaJGfYn25IORKA1KxgP88wdOh4KKXiBM=;
 b=d5PX3zbT/+BIvOEjWhYF+SFns72vA4aG14CbgbarVRHolbw9xxcUJy/H47PIg+D1Pspl
 YBfFFuxmUYTPlz+1zBUMtEv6m4TzBIm4C9wVFWUqAH6vFGCBhx3cv4vRUt6zW4qcO963J
 K1d9NyrxkoiVMk4JGaIwESzienNATHfG8bzVBEk1Oy9m3702Z7BVM9QAkO2Rns5C2S8fN
 lmfFycmKt7ieoplRq7+An6EH/A0xMKSfm+WEBR0Shjiueejf0xvv1irA/mMAvHoYBi6Mw
 RplL7evQ+b00tPf43NDGx78/+F96Jduqw/S6qQTInnI2pbBV1+Ej+zH6ejeTjM6PSPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77826812E0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 618B68F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0679bed2f647a89a747125c98a0af9ba599fdcf4
X-Git-Newrev: 999368b2a7b254532f4011dde548f7e7dfd6cbfa
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.618B68F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/e2fsprogs: enable
 libarchive for host package
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
Content-Type: multipart/mixed; boundary="===============7421624687218132972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7421624687218132972==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/999368b2a7b254532f4011dde548f7e7dfd6cbfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

mke2fs need libarchive to populate a newly created filesystem from a
tarball with "-d tarball|-". Enable it in HOST_E2FSPROGS_CONF_OPTS,
and add a dependency on host-libarchive.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1990243cad222ec438fe14ac26976b85981e08a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index d9ebf4c73d..e9dd367ce9 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -16,7 +16,7 @@ E2FSPROGS_INSTALL_STAGING = YES
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
+HOST_E2FSPROGS_DEPENDENCIES = host-libarchive host-pkgconf host-util-linux
 
 E2FSPROGS_SELINUX_MODULES = fstools
 
@@ -34,6 +34,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--enable-symlink-install \
 	--enable-elf-shlibs \
 	--with-crond-dir=no \
+	--with-libarchive=yes \
 	--with-udev-rules-dir=no \
 	--with-systemd-unit-dir=no
 

--===============7421624687218132972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7421624687218132972==--
