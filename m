Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54945C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA9640B8C;
	Thu, 24 Sep 2026 18:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3j8KC3GKCIOh; Thu, 24 Sep 2026 18:57:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D833C40ABE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276230;
	b=IPUgxDYkhjCY7tKDn5Ib3PKsvdyqDl3Q/SNLR/8HdUzTpVshkJJ3Wl+FkBgd6tPHO0GW
	 bLAA97JnTiivfKxtzmGws3OBDe+xPP+godGFDFu86LeObXkem0JcwSSjWoXx0KIaDKsfI
	 wpcv+ZTfA1oJEo6dIIpLzj7IgeH3fFS2bOZXjjcI5PmMiu8TK5rSFkjYpMqd4oPPQj6cO
	 YP4CXzDtmSpnZ1WuaGKT1S9s3UaAJvOuY0haT8DTURFH6NGWLcMRVZ/aitVctFhO8SZK/
	 OlJMTHzH/U9m1e8qgcncGmWLoX8ftYzueWWtGhyGJLKgdtwhcYnfMqBsk/QnPwdUe+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/sSrNNYwFellQ+NYi0vQi933PA3CMHd8CGDhU0HpZyM=;
	b=Q87pCuj/1queO+QL6Mnbms53DZBZO6j3/X2dRK0xkv12JvF/Vu7rRKrn8HggY+8FLHP8
	 JqAoPDe9eCfPm8J5+6v2/h6UcJ53uFESUgV/xuj49co4ZjWIGt5KhDQRas0tW+m23RfAE
	 KQHAwTbWqriiHVQEyTqxSAhaK4v+QRK4Nm7JzoXvORdeQSU3O5krZNoos+PhsVWuxAe8p
	 BKpoPvtEVjyrlyDknPmrMb+j/GXz0EDAvliL7S55dxvPMox3fT2jh0usj1RGJdQSzrt9h
	 +RJgo1lLD91G9THd476iHlgGRVdEyA8iiibKeyRbJ6Y1Ji1WBv6s1FvYrWH9afi7lPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276229;
	bh=/sSrNNYwFellQ+NYi0vQi933PA3CMHd8CGDhU0HpZyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JByVcm6u5HFo6aaYTvFazuxvL526YCv14h6Q06AfP2kZTVy4IQFBA5FsIZf9R1ZF6
	 RpZDLyyqeDJ9L3BXiCZvjTAfkHaCihrHBz4+qS9mbnyHqUk8h+Y/YldVoJlbzH01Dw
	 h8/UUAb47rpC+UUrmyTMXlrGSI0afvJgUJ74lgclg/FIC5WYCyKRpgpX91h7wTBkQX
	 5Dub3t2E7+xNprBsycfaIkAsWhi3RO6et3r1aB4Lv3HPA9UQVPj9oqEXI64fJ9OPr/
	 wKI7lUA04CvUpLDSaxUz/0uQyzQhMKYY1uBvRDka7oKZ0By+kiYDf3lhQ/w1nb1u1z
	 SVnXVn3M4X6lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D833C40ABE;
	Thu, 24 Sep 2026 18:57:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37145A32
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27DE640ABF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNuCzzlCbfKX for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BEA4B40AC2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=IuEpAPB+1TJJhljKy8E0I5GkQ8srMzTZYqmtKD3R7cxsHzeV5+3xjdx9O0/KZMK7bGxp
 Wy8ApyBlmsc5h4O5v66ePZnnH0pE7LpKBPA8ns/afh5AQ81i6+efkO2gpZeEgqSQgoAyg
 8SETdzfZqmo2SbvyNpBptpn+R1nnUNG6HoROo4VsSSjVibtmklXqe/TWtIr0KD8AdQUjX
 CJd4lrIaClnQCuU6lOcDhfbnG+Z29ebwwW6fmM1VdkU21n4iFbo/38+yTWnpBOjNnExuw
 dZAkx3IAIRv2/IsRp1hnnBCjj9Pj1LIAhIVWZyiKUvYZd+YGRZCN1npo1+Vz+B4PmgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dCcfbUYS6ju2yGVZwhrWiE3nzkvijpkXWAij70Fjny4=;
 b=r2XG03Z5dr7kKajQaTWla7Z2P6BJ0al+eyK0g4gH+rsWUfgwnVBPHAjDsEed3KHQ81+6
 aA5hrNxLfsxt9/kjr/SocjC45Fp8OAiicKCYWmdeu+qKlc0/yU7KDkaig8wFO6MRFauEH
 9LPPw9OYE5LNz9sJMfJuvS479IlRAzcAXjYZXQeoeiDr3oMmE7NdltpEdbe6iok/IX/KJ
 Jy8VNJF1rWuUy4/iRIcCQl7iPF28mdHl9lbuz4GB1iOCocbVLXWjkh0PkzXNsgPQ9HL4t
 73encmNWNsJWY4JSeALj0knlSJiOZE3ceW14ubvfGsyNSpQNdoY3ydG3vc1ylLPlvzw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEA4B40AC2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62B3D98383; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d432920a769af24e8d340608d02320a4f7e8b243
X-Git-Newrev: 8ef0ee30da574187ce9749ac75983e84cd22f6ad
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.62B3D98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glslsandbox:
 harmonize BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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
Content-Type: multipart/mixed; boundary="===============2270512951293902105=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2270512951293902105==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ef0ee30da574187ce9749ac75983e84cd22f6ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS needs the full blown version of
bash and coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but
it does so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense,
but is not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22540e0d41382a8085af110462e2aea6508da4d5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/glslsandbox-player/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 530c158fc3..0877fe8657 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_BASH # runtime
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (timeout)
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_IMAGEMAGICK # runtime

--===============2270512951293902105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2270512951293902105==--
