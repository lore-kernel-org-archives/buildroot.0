Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE47C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E34815D5;
	Thu, 24 Sep 2026 19:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-JOVme1Dub2; Thu, 24 Sep 2026 19:00:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7394D815D7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276409;
	b=BCLlzDnXxyG9HbTEVgfCLV8PURUPLERx1IhFI2alkFpoo8suLBaZoIC6QE/JcsAVvJQv
	 drIa75LtCofSn0qyj1yfmhXZdnBjIq1oDh6F9CZXAZt3xOWnP2FUMSpOOB6nsJyg0fnsK
	 zItFX0ZHsstggG5OQ93ubtleSGDo1IW71A5lrB4/z7CeI28kpEsqngMwNeyBMR/vbLLZ7
	 aKWon3NtnCi4l+ihl4Z4uNzjdghFbajA9H9wATQXcepdw5grTY4gfsCA3BIw6bNS6Mztr
	 60Szi2kPezUn/B+75Zx7baVPeWuOTVDKhLYOdt9c4laS+nPYpNiLgzAYGTU2iJLVPfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NFayHuNRudheWilT5zGxITugnD5Kc4YAMGNkYoW9M1c=;
	b=it/cXQSBD1HBQI+2oBxLE2cft0yg2BhzKOqoNX9V98XvmHq3pQtB8m6373CAYRfrFuiF
	 LEmRUYiPhrFa06lj/5Zi6H5vWEfeNISbJuoaVG7KuG4+EiK5Aehveg5rVhRXFYw35qwze
	 17deHOO8q0obb+M1f7ugGgRz4mIH8h0O+4H71G3GAihqHUIaUx+CpqqLT5YpYdjc0UhOz
	 uoZyLEZDy+68WRpwe+1QrZ29vtH/GY9Syz2qqHyQ74fumghtrXVSeMr4I1elKpj18qxEK
	 vx/6sQMCN3FGiNzOJbkZTmv+8+0Bs8BLvICwsYvwO13aRSfBaqZoibuyHKr5sK2tXFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276409;
	bh=NFayHuNRudheWilT5zGxITugnD5Kc4YAMGNkYoW9M1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rxd1ohOaruuRkIoqdBmwfrGpc9ovKD+OaowoEybb35Dl2lRjj/DWzNRSB2CAIOXbW
	 5STokHSNndXYG7wh1h4J2VR9BiaKS6gCK0dlm1n5OFQrT6TIwhziUKYIFX6TFmvlPm
	 IuofjsUSuNHRvKXNAd4TnaIfJa3ypHphrmk6Dx9uc3y+u7zX3Ktsl3/yVOhMA3AurC
	 E9uVDHw7ipRj59DP+pNCMXDASaTlXoji56N1C2VrckFKMUJW+m4Jg5NpkzaLxJn30Q
	 iGW0ceGzldTg30/GEADytnwepQtSPpXjYE1ArfpJ1lzZO7rO3evrEyeLP604UbuhI/
	 vYdkW09H7N53A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7394D815D7;
	Thu, 24 Sep 2026 19:00:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E80C417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E436404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ntNsAxZe-_N for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 933B04017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=liuHDFEaZ/mOHQTIesXePSk9GLjbP3jwoTHCH2HrW49ub9HXvhMY66V0MSDtidyrkRSB
 Vx7WYshRF5z6X1hYO54tNE4ZmpN5C+3xrbrC08DR/rd044+BcyXQ/ljdHCzuHIM8kYZPN
 wCTtXRZZvYLvnJbyR1qAMNJ6jRxt/WGveofmS2Kp1hRbhRoZwHS/k6iXYKACFP9RPi97H
 eycJEZMOO5NsOjT6LDuAFj+1oNbfjLRhOykeg+6bMpnytWaInxmyfT2w+aG+o4tLoq9PF
 sqOFsFrQuWFPlAF+LC9ZC9X6c/BPMG9CcTsLUuYmgrVuWV+AwiC62S30UhNBGrD8HCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DoBpFqB9G8NhdF5IHED6PSFyJS5MuCZl95cFM980rMc=;
 b=HtnemUH6NcgYlcpUEOXAvxGbF0HE4QO1G6lTyeoAFuxBPFHZFWdGqwZQyvDoWCLIHszl
 bKtitij9TNNBHTpzdkO23D5rKN48u2QD3l14SOmLTSk+xqus5raCDsb4jpFyenH3+i2tP
 0i+kKZov4oxYY4sHbq8H9KPoJyJHng/q0AGlDbuhBodM8zLN9va6og3oFzjhL+LIvMCNb
 TuWrS20TcpXxrvzAUu22Fm9Qma6EZKNRlASk+1Qpe4mrBrKCb+MV5xWXEPlXA9xtZT+Q0
 WueqUXcetKjz4y2lsy99vkPc5R2NsGiKr0h2L2pCW/2JFfAFC5rBIsnq4UwuygRSJrw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 933B04017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36370982D9; Thu, 24 Sep 2026 18:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:38:48 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 064d5eee96380e1c20b3498e6249944df1701a55
X-Git-Newrev: 2135ddb20ded56c38ac47ae38fef2a0ac2ad6b58
X-Patchwork-Hint: ignore
Message-Id: <20260924185544.36370982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/vboot-utils: fix
 build with OpenSSL >= 3.x
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
Content-Type: multipart/mixed; boundary="===============7008513312349151123=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7008513312349151123==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2135ddb20ded56c38ac47ae38fef2a0ac2ad6b58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Remove -Werror from CFLAGS to prevent build errors due to warnings of
deprecated functions:

futility/cmd_create.c: In function ‘vb1_make_keypair’:
futility/cmd_create.c:96:9: error: ‘PEM_read_RSAPrivateKey’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
   96 |         rsa_key = PEM_read_RSAPrivateKey(fp, NULL, NULL, NULL);

futility/cmd_create.c:155:9: error: ‘RSA_free’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  155 |         RSA_free(rsa_key);

futility/cmd_create.c:191:17: error: ‘PEM_read_RSA_PUBKEY’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  191 |                 rsa_key = PEM_read_RSA_PUBKEY(fp, NULL, NULL, NULL);

futility/cmd_create.c:199:9: error: ‘RSA_get0_key’ is deprecated:
 Since OpenSSL 3.0 [-Werror=deprecated-declarations]
  199 |         RSA_get0_key(rsa_key, NULL, NULL, &rsa_d);

cc1: all warnings being treated as errors

The oldest build error dates back to 2024 so a backport to LTS branches
should be considered.

Fixes:
https://autobuild.buildroot.net/results/375/37554c5ce784835a36f0068d9a0c1cd931212b44/
https://autobuild.buildroot.net/results/1fa/1fabca11c7839d2d7ed809f30482595719a29c92/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4463009364fa27d2f4a7675677e44fde550b0ec1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/vboot-utils/vboot-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index dc0b1365b7..14def4c708 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -33,6 +33,7 @@ define HOST_VBOOT_UTILS_BUILD_CMDS
 		CC="$(HOSTCC)" \
 		CPPFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
+		WERROR="" \
 		ARCH=arm \
 		futil cgpt
 endef

--===============7008513312349151123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7008513312349151123==--
