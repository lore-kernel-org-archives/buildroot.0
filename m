Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E85CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3745560DC0;
	Thu,  1 Oct 2026 14:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 4j15-tyxZ_Xk; Thu,  1 Oct 2026 14:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5BB6960D67
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864601;
	b=Zpn85D6sEzwvdPAYVYNDGnsBvwsujjttinBWJMOarqhppPRBLVG2qM5zLAnbxEFPz+UG
	 sKvRpXiBxwBP4Y65zBJXzoTVPoCBv7oKXDOQhI2bZBlQL+A2obBL6rluLM8PiRlimoFXd
	 iANPPuHnFsDUUEh3Eh5xPjU9rh2ipCkanrHU7/CE37OEZzv6hFdf/HX40u+/Nuju86/yG
	 P2+Tjs1uncXMT1srlo+pcuMXEW08nzbmJTiuX/7PKi5sfYXxgKf9eiDNq0/nnQAiQ08O2
	 ka3uoikOQ+6NIDuj3PDHLEDhbK7H8synJNKk3J72MIoHwTPKJywnRx1te04yZuOSJ+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5fgXYSKB7lc27WUVd8istZTHx0gHc1vXtoY0VSbd71Y=;
	b=mJMYwXCdIAbdKcrkTD95muSTi38nCn6gRFLe3Lqte+Y77QAzSJc1MIP2iLy2b9fTLaLo
	 uVtQEDQDMb2kntwidjUIvx0i4JsHTyPePUQ04OL8mauNvrmi5oxsgvRhyLrnQAGOIC7h+
	 j/URPtWIEBV3dJF8WU9cUuFEluTFBJ4adjO4v8RN8B8Je5W7jcCFYM/7YBMOl0qjsy+sB
	 eURieTCUbj/W7GxKYQv6nR7UOA3kTGdSVZ0Oh8xRoIEawj49pRWIDxoC4giBhaho9gpwA
	 /+juRc/MKYRZsymDHnOEJTNLzCA9/87CPjASmoPVhakG+uOcWTKlr30h1cA6+Oncwuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864601;
	bh=5fgXYSKB7lc27WUVd8istZTHx0gHc1vXtoY0VSbd71Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QvfwIfIA/1/LiWLi0HmaKZVYC7KoNmeXudSi1eaGr51XhnfIqUevC/HxeOoolbPLx
	 LxyfSsckpQkbG6nKB/6F+A9xfo2TdJBZr69D0azLCc1F8/rQ6yO8RB7Q7TGnsVKfj0
	 wkC+GjuXT4faSLxfbQxn+wGu9EpsFv8MtZxJCXefRDsf4p+tBDA3Fl1hmhxoD5Iui6
	 GHgYePUmeC9cKfPrLgVoDMLuDngG8DM0yfNoAuZu6faOmWmFiOb8VPdACTkzYnDIgH
	 0nGu9gxHTjQ1hvH2xuuXZ9Vl3JKwH4oH8DNTPf2a6s42EdLLsBzbI28uu9FXnt7Q6M
	 hTBY/loU1TiTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB6960D67;
	Thu,  1 Oct 2026 14:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A22FDD22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86BBA40538
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97wRqtnBNURB for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D508240512
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864562;
 b=WsbEYuJGlZxgEWmVbmLzXrPvAPJX38WcQfNevJ4llICGwucIHxX0UTRx2OjuMdWSFgaO
 FzPeDABQFIBJucNEM2HSM7BwfPT3sF9yl3USf0YpQv3KAuW5ShgBMclJ88WNDPWDyqGKn
 ZO807nmWuz9wF8W1Drcdv/QacxxXU8OQDxPu8cd2ba5bDTGuU248YSJnenUEcL0eddnLO
 uzEwAfP+BRut/2YkRQY2SuUBhQE1m0YLoYqDrmN4jvn9hA5hBs3DQ/6BTA1VLeSn+jNU3
 nt/riQeWuUuXzMltEfpBSr6ersmyba9qxPOftgjRsQbc18nImrQb6TF0xDzV6eEwXHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864562;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YgJi8xSvRjJh/xxXa7qNnrkF0ZRhIT7JXhVkd9JUHJk=;
 b=dI/EsR2Et9ousJZND8xk39K1r0xr2+r6/8tjVQGRGhX2CFkEijxRAxu6PW2jArCRBQqW
 e8twqeLB0IXOzc/FUrxBPSWtGHBuHzrIVVwVIAKrYTzSmvA7Z639cw68s5kPmBxjca0pQ
 arUgAjnDNvVM429hkvjb4Xhpz8eON8P26IdrJBuc03gbsWtbaLLdgCnCzjrG1Oaa/MXtq
 vpKQbY8v/YfFQ2I//5i73IBB+zjJTDTocf81NPzHhX7gkQ7BRKXyhW/zNx1cKTYNipEOm
 d8tRYK+i7oxAbe+2tyW4VXrXpRxisWZcw+ONNk5iJQr+ku2V8bGf+vO/n1agznaPsXA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D508240512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CAE49844E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:06:12 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b0bb3ff02dad7dcbcd83c40fb253c855519b4219
X-Git-Newrev: 3f0be30e3cae01cbd4bec36658d77f9b44e20975
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.1CAE49844E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/skopeo: use new
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
Content-Type: multipart/mixed; boundary="===============1336007735205792577=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1336007735205792577==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f0be30e3cae01cbd4bec36658d77f9b44e20975
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/skopeo/skopeo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 5a22658611..5d23cbf451 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SKOPEO_VERSION = 1.24.1
-SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
+SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE

--===============1336007735205792577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1336007735205792577==--
