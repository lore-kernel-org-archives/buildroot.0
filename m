Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0410CCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0790860F80;
	Fri, 16 Oct 2026 13:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVyQxaLqCqmV; Fri, 16 Oct 2026 13:10:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C1C3060F4B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156211;
	b=PkxIs0Mz+HmBit/9ezWkLgsJRE1vNgr8axSXSUDKQec2Rj6TP9R4v609iD/cskCIUNNh
	 xyjZTT6liIYAZ+yTBWVruik3WFohcM3BjvcH2FcKLhZK1ytOiGRfftkyyMOyvG6bli5BW
	 3J5BoXUKGLI561pTuJrIac57rwBrxbnBsGcb3v6Z0z6euR92ANVNchwODO43UDGAyqeRG
	 NMp0CsdrZgL6QtofDBdXwT5+caUWWtxVqGMNtz/hVnDQ6Qxa8tsAJ6A0kdaV6HEqUeWBo
	 03hPvZlw20e6C60kA6ppHVR0cx+THLZxdlL1blWkw0AVqBlqzr9rJBrShwEjgNH178A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pVwCIukugDUpDsaJzz7lTRL+Pl9tTBZ/s8xfY8OcDz0=;
	b=FWhblQ99tsbpYXmY4+dUEbelZ7GLJxah07NWBaplQgni+cyazPisGo1p8wfSnOd8dUIT
	 cIp7dwRrcFzqHAwAN1EeXazslYAOetlo7/9E49/4qwgJT1v3G9TNFC9WszwQToGZW/bDv
	 rex8klwFCkbEkuu1D2fph9sFeiDWT1GLk4lyDPQ4nOfLi27DvxOGakYsrA5PJmBoFpWKT
	 1+a0pi0gHgO43w+7VJoVQdE8b3CPFDJh2XVUo5pH1gzyUmVkF5lWjoPibl/tHE7WSeW1t
	 MAnWH31GoLqgfGhaLHi7ufwwThYNtXRtLShTvtt7C4TtX1uUieE43TlDxuW89jUTflw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156211;
	bh=pVwCIukugDUpDsaJzz7lTRL+Pl9tTBZ/s8xfY8OcDz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mc83gSWzoatoOkicfF97F8kyJYIvG6IDCkIUzt/LwBdcNqqhzOE9nJKb1uwKI91eN
	 Pi0aNmj2D5qf31YBI3Fa0lDtqY/vONgYuu4mlII8uvDFv5/iJN83mYd9+v9wmrxcbh
	 jHi3iriwDnPdLljlfGGYywcwjga76DieMMp3vruQ8ZBEqBEpPZDYPBZEXsgQMkm0t+
	 WGrBYFiLD0r9Jmxa/PrUNXQZEEK8YPoZBS1XmZrOdeEySG2QhW2pKZW4ZEUAGlMpl2
	 VcOe/1GdoP0HtfeSyelBn7MEJ0bwUMLvKsPPxX+BzcXIAbORD8zneLbiSQ7y7XfisU
	 Z0PSfbYeHE3Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C3060F4B;
	Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C3EBF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 007E2814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvBsXiM5cyWX for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D0B43814DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=s6RgNYAlRYynZVQFVkkVTrMbiQfPGqPE6cw8XQNVnyz0yhUNYuzUx8fBCQrJIOubwCcb
 7Y69oePNLL/knXvEVZBeYs1w6ZxN53Jsh4sAENk5MDf6XdgkbCUFJHIcR7a3eNuFxfGmg
 BM5YtUwtVvGMGjkq+etxuIkfJkAYJ8ShVhz4cpn/f7yoF6DYEajdELNpHdtciTVaor19/
 axLEtwmKqGN97tDbW1KBZab21iPAMBclDFxDqltMPzkSvtG3GUYJa1xmbmTKgeZSMSp7n
 keU6yDm0mRb/pyUNWIwsTLNiRmNea1sPE4KFqQdZOoOjNwQXaaYMeb1p55rv5w+kByg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eKgU4/TlZ5505Q+rRlHSYTrd7LtY7g0aQZjSMoiFmAY=;
 b=W9wGgSpC99l5vNIPdI3OdTQ36/seDgfrj/AhSOzTYOUIfSCDp3PQKpp8wL+Gi5rS+Pa6
 Sh75LzXZ1qo/Pv2CWGE6aGfh/SZ4OYq8fXNekRW1AVlAeRkoa7IoV5ydSLlUCyprrnlxJ
 waUu6IVlAB6ecJ4vKSW8CCrkb1xKZXgArglI12Q+AgRX3kZfSIQqSG6wmQNS42jDM2yXL
 e2GVVvd/BriYYCu1UZpeyt8p2HSYmwacRYuP4caFwNRbvzIrFAoKbl5/6AQsILOXbaCae
 hbWSNx3GnC67VpsuVo+sBzOmNJxg+yhBM4pdxih33IZOXWM1eL5EX7wVHXLXJT6KPMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B43814DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0AA4960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 43d552903fceaf95affbc835f545757becdc83fd
X-Git-Newrev: 0051bcb24ed42794fcd4626ecbdf4d27747c053b
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.C0AA4960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/m4: add CPE
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
Content-Type: multipart/mixed; boundary="===============8174059889882128925=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8174059889882128925==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0051bcb24ed42794fcd4626ecbdf4d27747c053b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:gnu:m4:1.4.21:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2008-1687

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7fa4b3c8b4eb62fb0e997cb3cde1d43756719d5c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/m4/m4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d498754b35..da739a5f0c 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,5 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
+M4_CPE_ID_VENDOR = gnu
 
 $(eval $(host-autotools-package))

--===============8174059889882128925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8174059889882128925==--
