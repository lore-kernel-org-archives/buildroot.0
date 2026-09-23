Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D778EC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A611640F39;
	Thu, 24 Sep 2026 18:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aeq2-_RiQCt; Thu, 24 Sep 2026 18:59:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A55844122D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276396;
	b=AcnLZ9NuuEPSIpkz6mtLSOo3KyjFG3GkW5Ft7R/GIaz6m66/QnMOxL7fskKYFj8VQJ9i
	 yDyQK/LQRud1dr3x9KGTNVxJcrCD22N8EYi3UJt0kb7izO2cocYXxIpBWhrK1uWwNdlOG
	 o+FHJT29582qwFBCp7G5BmsVMhIBOu8xv/CkljE9n33F0/GwVbHuTF4qZklMJFYO8ZdjV
	 sNsOnGYVfA2FczXWSIS6Zv7F1AJTvRaKYIXoZtD8gLDAkKIuGD8LWYvAqMvbUHGX4ms+Z
	 yZxSavbzsMqZVujEU8dEyCrvBe21LuCGNesNyO+m/z9J4/PQnP+dtW6KZLMez/wRC6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VhD+QxZslTD7YMaGZSLKeU0BBiEtzO26Sf0h6dqLQPg=;
	b=tfWSyboWoFgLvuP51Z63LrHF8s9DExdZRCPFwJEJ3aV3G/Gr0DOtJv6U2VPKAtbT3C+A
	 RkCQFkS7awOKn6i46i9Lk/XMIbmIIEwAknTrzAMNi86bWlttZO3+m5oDAzI7PRJnEP3FA
	 ykKowUqcVkheVOYcqcXpKyMtAAxeQWDbV/jGA56evBS5lPDlLi3FpPuCMSa4o3YwPGAwl
	 d2K4ZV1c/i9wyFz30rnsc/z4zw4Ze+lWR5gutw5PeBwqcLIlbcr8cSrEcyz1Y4xoaop2N
	 IUCytYijn4pgNf0hriqlkEdegjji9HQzXuHGxa4b6S6+mip9fNTOjhtA8H/JeWbzk3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276396;
	bh=VhD+QxZslTD7YMaGZSLKeU0BBiEtzO26Sf0h6dqLQPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rlHQ6xQGBDVIhU/gPmk1ys/KrSTjeKET71GTJW6rmKsfWcGU9OcYNau4tiaVzK6nR
	 M7GezmlYF8Vij8ESDXuynCqCYAkXnB22sIjfZ2ySKPmHtZcX83nG8i9e2JpbIJggiz
	 XWun7lDnYdarumShchT2ArB0T10bzlexxhAFyMeLBQWh+t5a6Y27Qe0fyX/zuOLwIN
	 uSGiHLoUS/telgt3DU6CmaZxEqNVWRxditd6MN17bWvS6om2heatg6cQchWV1CZKCm
	 vfhIpABUsXVbP5nXUZat6jcJ8IkStA/lXFF5yCE/DA/O3YRiFOf99S+JL0HX2TZPHT
	 oL/c/ALOlj/8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A55844122D;
	Thu, 24 Sep 2026 18:59:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B31A392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CAD781218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-ziAvdjLMfg for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DF8788124B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=GbbukS7BZ9M65z90pXd9w8LMTvqniQmRpoSekOjZJJks57ZFY7jLFUylMETNQDYUX8W4
 wFcT1xn2url4T2iOHZQtoyRfq2GeIKC0OsI/Fyck6FLIQbCT6ISE14Jq+EOLkOe8z4uir
 vbGMlOb5OMVra2Sp9D2kbYU86UAEbpGTGwGFLFDKdvVhEd/aEMbMrqwR2Fg4mnraTRwmh
 lDlLqAboZeFNVpF9yRuLO81j2ieHOubzJyrt7tuIMXtKjYyc5KrDF8WwGwm30Ecm9Mojl
 tQP/kzosq42IbACJeaCxnp1AoFXVJByvaRgoOkj4juYGdL0RHtVQ5VFi2LUcrs5XcRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u9qO1wEgPWXnGjGUVPe1wSAW/ukmMNbAcaujh3OjaFM=;
 b=L4vbwQYbYEPmiynwj/FpU68IR3y89VN2cMhkOgmMOR/h6nW7/vPKcJTvGRjZXy2VdrLD
 ptQBK1ZXO6dQ1NS8RaGU7bR06Xyc2I3nIhnjxiHm2+6oCOKnaIbd2dnS5z8exbDYuQ0gU
 zWc5+YvOfuN7H7A+Nj0MdBejKZuGOzLUfM7+4PlNA4TZ3ea0k0dFd92blV5IzDSnuevxF
 moMdVrSdAVRr0E8oqqPMYmyX86gapsakga3uhXdFp7cB5832Jd75uSE8FpoW98g63k0+a
 ntB5j7qT2uDFtNMKw5cyDNmr+XuF+0U2aAUPrw2Xm5nHuYjZJ1r79i5D4JVgSmV9Rbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8788124B
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 823499828F; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:21 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 79c0acaa2d0d6b988d8f01da52a3caecdb7da1d5
X-Git-Newrev: 18f78bdd52b130b1f3aeddfa6ff9bb026ee6939a
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.823499828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/screen: install
 screenrc without executable rights
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
Content-Type: multipart/mixed; boundary="===============0874929519293679227=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0874929519293679227==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18f78bdd52b130b1f3aeddfa6ff9bb026ee6939a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

There is no reason to install a configuration file in /etc with
executable rights.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/174
Fixes: 98873717c2654e27ce069c44e9b5dbe3383c0f97 ("screen: enable terminfo and install screenrc")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 318d4ce4e55e862f61f5c79b877d228e9a264da2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/screen/screen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c279fed8bc..ed225d1983 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -28,7 +28,7 @@ SCREEN_CONF_OPTS += --disable-pam
 endif
 
 define SCREEN_INSTALL_SCREENRC
-	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
+	$(INSTALL) -m 0644 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 

--===============0874929519293679227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0874929519293679227==--
