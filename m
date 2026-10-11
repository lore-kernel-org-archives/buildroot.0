Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF99CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E078960623;
	Sun, 11 Oct 2026 19:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDPuj79twfYO; Sun, 11 Oct 2026 19:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F37E360614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791746151;
	b=lYML7KVD5RLMQUgx9OrrBD9dyMc/Ax51OeZGihVTT6K5CQpXJ8kiAu2UuAo0hdk1CZbA
	 JEDsUTRhEMu3Pt9hMJ+OVrAst1QXpTXMKVAFt9ewJGGRz78aDhl2Gr9a3vbRRxkaesAMu
	 JqtJsM5FuIoeIlEydWatlq4WoEkOc1GfaNi2H7MzqfZh/1Jx9E//rI4fZg2918lrh2z3H
	 hdPxOB1aNyfqG3BmsbuJ3eVcOLOqNZWAkiqFC43qZbgo264/YMuAwZsa+kEF9VMO4uN/t
	 uvMpQuJCVGtJYtfen2WzbuzysnNKiXzFFN1E1M9DImf5OKV8iewchtqO8ejqvOR/Erw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791746151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4CZzGId6iL/I0fZgV7FRjwdkR1Xu9hgUTj6hbhF5TP4=;
	b=pHP5LG5VT8X+fYfbw2e+Y307aoCBo2fLF20aWAj/rvCsghSjefhbr60Usd38d/VpiUj/
	 0WaReIK5jElNW/K9gHUp+dUwTnos0G0ItUHA2YbmceKAPFLQqd4kdKdOn1OTetdgPwo85
	 QDy2OKcCtzmjz0nr1yiZ/ksLDcq5RD1z0dEiQ25X2ywPed+edp875S0SCHP/3rWC2Kxe7
	 33MCRGnr3mj1BmvaHv4Ob0ip2jT6eaFME/B7fSA+h9/Y79fd2J2+vloSgr4VM7EMe57OS
	 7ok8BUR78yi9zncVt/To705uIUf0o+Fygk/66EtEeXnl76L47LB0H8MCqjPt1jh33LQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791746151;
	bh=4CZzGId6iL/I0fZgV7FRjwdkR1Xu9hgUTj6hbhF5TP4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IfekVT/kLXcjP5MAF4A/+c67xDHebl8b6sl9N1cDDoWxdES/k/OC5cbE/1YtB5y0J
	 iPntuSskXWGulc31FDOJGrmFN73H1ism8j+rk4Li72PCjB5rhl2jsmfOn6aNUfJS8n
	 C1QXIQ+Hb2c8OJiD7Z4XxGBGkDgGDfuQJrNFple/YCA2Zb7kluyPdLLJNxGlOzQHJ0
	 uWMRzKiL2HmUqkiWpJ9Qvysfk3HqDxfnsfsYQ+Gtr9ek47fULTGuT2qZRBpJnZGoCq
	 kdkfU/+DZela4SKIa2QkRtuC9hjAK18FIzc9OzPT106qAyosrl0JPadBM1LSE1L2Ao
	 zBh6gzdUcC8eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F37E360614;
	Sun, 11 Oct 2026 19:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 764A175
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6815D40076
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skKifQdTWCVJ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:15:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A253C4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791746148;
 b=dUAdTqMqejh/Y9EhjBZF7GDoELdpytVrdvzoDoaFSgfs8LVn7MxAuuoz7OOUjMI0XmXl
 nYbSlwy+4viVSZDwsy+81PtbH+IjOKmFj/pTo22chG4imY0NNlbgCDbe78cZdudNDOKwf
 F9uHYfpYimdEQytI5N4ka525ZjuGJ8W4fG87fT/GhP1ih64c71BPrl/58VSphz0M4gMs+
 FDwR8sewC+1f1rrZHVmEucyFxI4NoF9qkr1rtcyBQCThlu79mcIbuNRuNcjurnZ0qSIum
 6iRQDi+30VECiHRCbFuk4Y+iRpbKZ1doo+DjMchxsFVz/qOoGKedWij3Ki6U+Cl4x5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791746148;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=avONKAGHIeRsGMhKEZofLRmUIKmJzN513PABrw9MiAY=;
 b=WR4pS6fIlT8acSU/yQmMjDpPgOLrIAqz1O2t/D1H7J4PLWjpZKpYB+6nOpxD/b1McMAz
 gsTBi8o0IZjH28A9jsjX/Ow9WCjE4toyJ44DOx2QuhUwjR2QEBAwahCfiHtCfaapLzPsM
 tzgkWZus3LH3Y8S5IP76ZWnO0vNy8NY/L3s7jgEYfW2NfQDFd/hZKtiC8kHYGRCmWx486
 YX8hcYPZyXZjmxCoci2dg5dh/teagtNc5mO1JGWQMAFFwCzCguQ4rRdWfab9rrRxF09fn
 35BANusIissgMqBsLKwLOPh30L67HhOFkORG3Nir0SmbYw6Z6rXpps2mi1T+cPBrKaw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A253C4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9D619525B; Sun, 11 Oct 2026 19:14:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 20:46:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afdd9c079de340ad2877baf7307555b271f04d87
X-Git-Newrev: 60d1b04a69c7735c3d2d4d5ef9f47ca501271c97
X-Patchwork-Hint: ignore
Message-Id: <20261011191429.C9D619525B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: allow non-matching
 globs for DTBs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6943642107968403579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6943642107968403579==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60d1b04a69c7735c3d2d4d5ef9f47ca501271c97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When installing DTBs from the rpi-firmware package
(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y, the default), there's no DTB
directly in the images directory because the kernel build doesn't
provide one. The DTBs from rpi-firmware are installed in the
rpi-firmware directory.

Using pre-compiled DTBs is discouraged, but useful for using mainline
kernels until suitable DTS can be merged, or to provide U-Boot with a
DTB (via the firmware bootloader) independent of whatever kernel DTB
is in use.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 board/raspberrypi/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index e4611d05dd..a3a2d8d620 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -13,6 +13,8 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
 	FILES=()
 
 	for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/rpi-firmware/*; do
+		# ignore literal globs that didn't match anything
+		[ -e "${i}" ] || continue
 		FILES+=( "${i#${BINARIES_DIR}/}" )
 	done
 

--===============6943642107968403579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6943642107968403579==--
