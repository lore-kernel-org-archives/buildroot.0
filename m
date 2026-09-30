Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85404CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 459EA60D65;
	Thu,  1 Oct 2026 14:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrFdpKqBXt1T; Thu,  1 Oct 2026 14:22:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E0F5D60D78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864578;
	b=scQbtQnoqJI0FgVOp7rTAMFsFjPscHpjxwdxBkuEV+R2F0ydrPLUUf4gVqqW69ularHb
	 s0vtuGq3grYodjYMMqyScCk/XiglyK/XF0AMkmWLcwqPrj7YXSDxe83tap2mYT8bx+blv
	 LKsOFV0tPJNwgBI/8EBMDXAsoZG3Ii/8efdYiBh4zD3DGDQ4296xrDTUwpiBb/+MloIb2
	 X9VA1ub5jzhpwJLtKSbZMqj7W73fflWJKFQ0lTDdXlKn20mPt844RiNWWBJSZDFoBM5sF
	 Ic/J3gFwLmDOKiogDY13hHUoNivOugoG4z3zC6IKDg1wYFWhCF/Jz3AyBkV6QFRBltw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=MRSjzuvax+Bum4fiLdLszzjQfDPPgHgkn6wyU7n1Jko=;
	b=Ay8PNjlnl0NjXCZHchdhtBc85kxm6ciIWQVxGJrEy2WvHUMGEP1YGWsSeabCTe1lX3WH
	 0AHZ4xCqPSkilwotCMyTWCHF6rEwscstPdLRMwfsp2KWl5pBCuEe+AiJ7trCx/COdcodO
	 V3oekkMmqAM+pd1KMs5jv/KBAek3MNDYPZGsHSB7ifuUmFlFE64m6y/rTlSitpitucRnn
	 mDnqtNQJeUHvXWwfEG/SG/nobK3XXNDsfqPDv8oVwgGgGZu+2I/K/Ax0zS/pr8bEflCVq
	 GnT4EbJlTIBnXjxpJYHtAl3GF/ZZ/x+cwSH4KAXPzHQ5tnZsSD4JscTUyWmJUOLyb1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864578;
	bh=MRSjzuvax+Bum4fiLdLszzjQfDPPgHgkn6wyU7n1Jko=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dMTdCHIukTnaZdTNJD5COMdRr01id7nCzh5qd5SIgijtttCcTF4bonoukxDzimdvW
	 nXMajmXQjAtJWXd3Mh4YR3mGae9SeZjzevIoNlo/XwI4rFLs1CevcEeQ9gjTNcY7cw
	 kOSU6YR8hl0YjuaBk32Tw07Bl5yrvING1ePo0rqZ3LXgtkp81YMZ+i0mRhGI67+MHf
	 NX/7+F7ov2vqxzyEqMl48REMmT3SJ/nDpOyBXXsKO0mZ7cRXdpDhMlioPcUA0lrNP0
	 FpAsTolVeZz0OvUAj/ZumnezE8BIci71byIxAZ6SnOmu0W5eKxDWBTOzoerLx3Zr1+
	 hAkIwF8jmZayQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F5D60D78;
	Thu,  1 Oct 2026 14:22:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C64BD1FE8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B749F80EA1
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAg_mVyioEs1 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7CCFD80DD8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=XNGqeg8lO8KZpWTZxxTyoOcaf/QUHJa+iTZ/YF0Lj7d77qeiqJzmsdRwP/QjdSRW10a9
 QfNm2ptEiJrPGnWG/2+pDkU5qPXQRFUHWaxSI5Hfgx38OGhPBd4WJ0YaGix92gUHJwMgX
 6/PaLkPTwx2N7owgqNNpbCoTJny2XQn5uZU/NNarRASO8q+HT/05wOhcg6tJqqL46AS58
 8AHEsa7IoJqUpOsC+aMGPeKkux7ITxCqXtTXnFUs7g8yqwrA+ZnOjLdV85VH6JrSH3JRE
 NxjU3B8BAxQA0oFgBYI5bP9bkEa5Uo0FqNhSrDWHntVwh5qe5HEutNrj2GmVdFrXoqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lOCJlc8te45/oHVXzDj4HZzvPmcwbe5dL375evXN6AE=;
 b=XN6JYtIxnTfdZC9ZDhe0wDyM5wgdFglJLZ/N+rb6E1QurwrSv12p6/xLJNfXp72d54nd
 BLJsMDwGR+3/M5jK+1aC1g08a8IwDeIKtCmYG/GQNWbAeapwqWpiH325gxCQyTwAdcEop
 OEsJvVjzlFn/fVHXEkQ366M1fsv7kTu328ePLyeftpNyLbI9nx08ZD9iOjJYMXLBaR4cp
 cQrTlVz0TNvW3FbjZqFi1rv+tM6wCB/FBKs/DguROSGdvSNejb53DX8U//g2UVyj1dq5U
 +pYGmzMKAolWNR6ftJL7+6i5KrtLWVNWY/clg0ItwCXSA6kChE+KOPw+ya1JWoev1EA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CCFD80DD8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B38B99843B; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:05:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 67163f7e1d96208ce884e1359e95e8071794b181
X-Git-Newrev: ffcff64b60f2d95a0eec41306cebc04d31794aa4
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.B38B99843B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/skopeo: use new
 upstream location
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
Content-Type: multipart/mixed; boundary="===============2243545072349533712=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2243545072349533712==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffcff64b60f2d95a0eec41306cebc04d31794aa4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The upstream location has changed (with a forward from the old one, so
we did not notice earlier) [0] [1], with 1.23.0 the first release being
made from the new location, which was accounted for in 96aac440dd79
(package/skopeo: bump version to 1.23.0) as it required the change of
the gomod, but where the new location was missed.

Eventually switch to the new location now.

[0] https://github.com/podman-container-tools/skopeo/pull/2854
[1] https://github.com/podman-container-tools/go.podman.io/pull/6

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit a489e7c212b1e8b6d5ccc23bfa0b9c8e1a4621f4)
[raphael: resolve merge conflict]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/skopeo/skopeo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 8e3a302e8d..94e3a4210d 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SKOPEO_VERSION = 1.18.0
-SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
+SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE

--===============2243545072349533712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2243545072349533712==--
