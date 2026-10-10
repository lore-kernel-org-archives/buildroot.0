Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EA2CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62086408F4;
	Sat, 10 Oct 2026 06:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzIaVKsjSD1Z; Sat, 10 Oct 2026 06:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7FA0740931
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791615242;
	b=RxJcr7y4xdg2QY+vo2OiJYzQomp8vAhhko5ipo4Ejy6M1u8WrydtxHgQrTj203OCn0MF
	 v/1V6swdo/g2bTBGVEqRSOYls0cZoX+oiFYCGIBWnXbuXOAI0Y0gk7glODBK7z0Jp3Zeq
	 89f+ArQ9nNXogousUdB5ps8IwGN2lD7J0atfald1Tfu8VjOeECO1MXXKZdinzJ4VEgYWr
	 gh7ZRK5ZgHRqFGmK0pHN/Ld97sLeSIdFC2nLcDomfEcEcu+WwMTFik3hAgfNsPNbyPChh
	 Uj+BMy3E9brljoiAXVWFbgn9Cjku3FFCe+FtZy5SBzlqck5Zm9VjEp4C8TALiyS8xpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791615242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PspSIjotmDHjkJmS1unADfl0mIJFkMwndMDJzvAmQJc=;
	b=dRf06pqUs01od9vLp6AZaEfRBSsjlS7xQjVsRDrAcHNiFdipymP5p96ApkQX82tnw+gh
	 XNVihJ+SPUzlofsaOnhfnp1zgMQRcCG061inxLLNftev8bZOBjKlIG3+pWeHmkQUdLi5i
	 Bb3WgLU3KkeYy03pj2b3VcVGkbppRjG/Zed61/ZBUSobemd2omRmLGriy6BR5LwvfSOdT
	 pb7/zJbo33SGvNJWXJ3UVXDicBHa1EwGOGQnAC6qkJ7GeJqIJuM63QqmPcU6bbWXiwksa
	 9/ncUPiT1BvPnubOI7ClO21h9MTAKgvYP8i5CcVg54B9LGFa7SK9uydEZE4gNRxUR/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791615242;
	bh=PspSIjotmDHjkJmS1unADfl0mIJFkMwndMDJzvAmQJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j2ONUIRCF2rjsIOALuEhsI3S7ScQF5fH9M4EiHcXKKzFk72w5LPQ+GRGMo2yzOM+I
	 OfHLypWvoyfdc3VGXH8SlxNtDQ+lysdcNvpxTRJln1K7ohbIrXGLF+KGxxbOggf7NO
	 ACjyJ0+UvIM1DnxsVRIv0tbdxmmARkS4SLjzlqRfxiBr9E2DoJSnmEBe9xXTeAsFCF
	 SQMQwgA28B0tC5x1ryChv1hhEW+xpRe+ymNofL/+nZkR1DYh2F3nAmDsu2MshfgqyV
	 GbnYbvrBQoSEKKyuy8T+6aCZPNdWh7ImvltDXfagpteeRm0v4gGxvaLOp/Ga3sgHbK
	 u+WLbDKkAZA6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA0740931;
	Sat, 10 Oct 2026 06:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9A8C75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 996CC81138
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvIp6CjX4jOV for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:54:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D84B881112
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791615240;
 b=iul/+N0ZlDnodQ127Sv0AjHSzTw/9h4w4PLDZP8+sPgAtx9o9okpu7wP8H6wLvjxMrJQ
 IG9/9/P0WQxNQyoyu6s/iYN1VuFBjggLpxjlPQYZhowjuGDcAu9+mdRVGUZ2NIk9ltnsw
 nR3PPXP9M7R2PR5B4PikSZwZL3bwso0OWggpBYDY8XGwaY5zFWZElBA4V8pHdp9fJ9odb
 GmFWY4msPK0SFnb1n5dsQV9EtPKmq776q3qq9k4zMOB4p0L5tJUeq86BOfZxdaLo98DxE
 3QMbtytcE0Zq0Ph5BhN/LIi8WWPWlfikgV+FFIWudrsvt5ZPBKSDplJ1L/naZ2oPjwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791615240;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VPz5YuQ9PpixuGqjlYtdQi1TbFzxDtUObOeI6BBNhvo=;
 b=ksY/+OpLLQx92QRAMPxq8I6xif59He9ppqKP9uyf2AS8KYVrjQQFjd3LKpJajp1SrCGA
 OWwDpf+4u00kg70E3e0OfWROeX64v1ISuVb1BM4sNKNnKjuuxEQb/ViqeStxwgfl1yOpO
 lmAzMlLmvnmnMcTdGKlfCAfZcywE4n084S8WkC58U3bC3OWdlGYVc+mN5uaGQuP/W4FW3
 YJnlXJhHS5yNBsFEmfwrXkSewD+43DYjpAK+84N5SAmcWh0VL+m6T83/09drycLhWnYyG
 Vf/urdEoebyn/7aVjj/+JLR+tT7LD4PtSC9zG7C8Y3b4CrxZP+JO/F5tJ7YfEDXZvHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D84B881112
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:54:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6DDE8E5E2; Sat, 10 Oct 2026 06:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 08:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e5609cf61077193b00b159ef6327f019db89545
X-Git-Newrev: 743365acd53797309018137e19b24be4cb68353e
X-Patchwork-Hint: ignore
Message-Id: <20261010065242.B6DDE8E5E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: bump version to 13.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/743365acd53797309018137e19b24be4cb68353e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Rebased patch set in two steps:
1.: downloaded patch set from home-assistant
    https://github.com/home-assistant/buildroot/tree/2025.02.x-haos/package/openvmtools
    which is based on 13.0.0
2.: rebased again on 13.1.0 (no changes needed)

Added patches 0011 to fix build errors with glibc 2.43.
Renumbered patches.

Added tarball hash provided by upstream.

Removed CVE entries in openvmtools.mk due to patches 0013 and 0014
being added to upstream release.

Ported various configure options from home-assistant commit
https://github.com/home-assistant/buildroot/commit/3206b3fa58a636c7a98ff7a65f76fcf23a4302ee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   9 +-
 .../0001-configure.ac-disable-Werror.patch         |  32 +
 package/openvmtools/0001-no_cflags_werror.patch    |  18 -
 package/openvmtools/0002-dont-force-cppflags.patch |  21 -
 ...m4-do-not-force-I-usr-include-in-CPPFLAGS.patch |  36 +
 ...to-vm_poll-h-to-fix-build-failure-on-musl.patch | 813 ---------------------
 ....h-into-vm_poll.h-to-fix-build-failure-on.patch | 133 ++++
 ...mptions-about-glibc-being-only-libc-imple.patch |  27 +-
 ...05-Use-configure-test-for-struct-timespec.patch |  31 +-
 ...ix-definition-of-ALLPERMS-and-ACCESSPERMS.patch |  35 +-
 ...re-to-test-for-feature-instead-of-platfor.patch |  74 +-
 ...Use-configure-test-for-sys-stat.h-include.patch |  21 +-
 ...s-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch} |   8 +-
 ...nvertFromNtTimeNsec-aware-of-64-bit-time_.patch |  51 ++
 ...ization-discards-const-qualifier-from-poi.patch | 148 ++++
 ...nvertFromNtTimeNsec-aware-of-64-bit-time_.patch |  80 --
 ...void-GLib-g_free-macro-redefinition-erro.patch} |  11 +-
 ...eck-authorization-on-incoming-guestOps-re.patch |  41 --
 ...4-CVE-2025-22247-1100-1225-VGAuth-updates.patch | 383 ----------
 package/openvmtools/openvmtools.hash               |   3 +-
 package/openvmtools/openvmtools.mk                 |  22 +-
 21 files changed, 535 insertions(+), 1462 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
