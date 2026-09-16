Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA67C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C104860EB7;
	Fri, 18 Sep 2026 13:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iN10b8QGO8fc; Fri, 18 Sep 2026 13:07:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9AD6960EB1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736863;
	b=DUU3gXvMklyNk3vpZ556VPn7ryZWWs05B15qyTE/VxpAZ63zsCpynIGqvinqoDVpR8SF
	 9rk2z9Ba5xCRDfkl+ZTDzJJgrB4Nq2Xo+n8MuugZksu+QPWGGYWgpQzsVDYYWRsXORPjC
	 dWDOL4toHiT0coSIB9V2m/Dqv6JdfYkryLWRGZm+iinOb6LmY/B31EXh+wlUX2EfIu+J8
	 hX3d30BcChGIC+Y7ZyWkl3V37BColgTj0/+ps0u2V8XGiejFNGz3vI+TL2ylbo22KiNj5
	 L5Q0IgKYg0g2KjGGEzsk9MtmO6hAHW2rYUJOHXZrNnq2N6Wf+6qH9hwJ8YXkrZigT7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PW2DjSZlrDUA6iSjBmvym+bLehUkSuNWR+Mp/M8S5ds=;
	b=jh3bJeZngnocaJMbeQkoi2+I50UtyNV8eERdqF5a/NrXXHLM4Fo9c90U/AuJifg1/1rK
	 tsvTCLBl3cVDyuxbGh+/47qWAg1EljK3nxN25lyqOYnZ3eDG2tleQmh0A1odElGKBOb/v
	 LQ90Fv5vhSh752N38kIbtIbwrwU/83/aJfa8FQ5FXPlGdr6HNfRwgs4lyo4do/h1Cij3C
	 nlK6WVR7DM5J3g1c3SoE3eo4qrKRJtltkwggy7r9T/7Cn7+qGYqcZrYZOJ38OMQK5hFkJ
	 indBwqrW8/NsytblZkYLXB/o9Zh/ABgs/Oak9MBxusKDltpXZIy7+vH6Nu7vNXWCaoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736863;
	bh=PW2DjSZlrDUA6iSjBmvym+bLehUkSuNWR+Mp/M8S5ds=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qyNFjFoNhXL06x1RZYEXvIjj2oO52rt6BY8UUOqhtrXUjdpAe5Byiic0lZ63gFsco
	 gVTFcZKNmZCUT7vy0l8PSejiDtsnQnF81RsCEko3qXnJYcdUEy564XwwGHghld74oY
	 CiVR+UFzNtdkwCd7p6S52c+/F8fxtokBmazEPcSgl4mTDTevjGHciBJ71Li6XaVRUI
	 xf5lMk27GW4/70R5rU47WPaPWq6+SrozFjmXIsGlTDYnVFz/+ykeFmbhiZpgOiE2Ro
	 ejtcoUVYY809bC6P1IDJgWzRaD4pcPhyN5aX2B//at/r9Zi1WgFSLG1AjNYLdVdfWC
	 4/LzNf5y3+DVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD6960EB1;
	Fri, 18 Sep 2026 13:07:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 019AE224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E86DA60DA1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTMzWBseSp9k for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 710B160E24
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=Jrc3pgmWzIFSIKgEtVVKVzeFrjF7i6ew14Cp02GQSGjojIXsOkOPqYa+ndgBSzuQnuNf
 4Na0HKqA8bWyeomQf7V39m1pEDWjAA0z0uoGRFhf++XQwmoPIoEYnIOXk4iBRKhpTzkAc
 WFJkR7EThVV0i2rLcXHnD3mUP2JNoEkJsRDA49xJTzyQVwRRIzjtjCAYDSfA8ATupC2d3
 Xhjyi4nAt1GATWyHY6IBJCwe8ynkMfeIcojw5SqV8jV5wDfBUQu+iPjwmej6zXdxLA1Xe
 sCozVuL1e9AfBFN5KQ+ot1jVnc43iwVwDsLsXpyAGF4Y0bgRfdJ0UnHxKrNYy+tkUIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1UbPxWZpljMNw47aP+2kWQem3KvcVa1VZP7LFXOOdFc=;
 b=ZmIG6I3Bajm8oMvXrKy0RYH2RJISg+6QWsH9nIxa0AWno/fnUZecS3Xe/bDOrkogKOsj
 +xdBBrosBTdjvcLl5h6UevVArK8R+03CBGbwxGI7LmI2W17ZU1IuKshS8bCXtq5YLil/b
 vK9/c+9wlVcjbabN2h8RafrvyvVcV8LvdVU4FftCPKtOcKjBujo7dyvojpzm3JKOFjw54
 nP57192nNHze85pGtme0an9lkokEMJ7KSNkdBkb7q+N9HSlt6+0P3NJpJTQP+adHawtOe
 JJVdg+9P4+FjXH1vCfsGVGTQSdktUneqEtYBH8c8GKaYo4NHcMyvk8U+6OyljxiztkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 710B160E24
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A1DC976A0; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:19:01 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b1661d3ac4409d75bac589aa080e3328f122e643
X-Git-Newrev: b65a2ca6efd75f8af99ea6caa2ed9b0cfb3f8c64
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.2A1DC976A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pulseview: add
 missing 'select BR2_PACKAGE_QT5GUI'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b65a2ca6efd75f8af99ea6caa2ed9b0cfb3f8c64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_PULSEVIEW selects BR2_PACKAGE_QT5BASE_PNG and
BR2_PACKAGE_QT5BASE_WIDGETS, which both depend on
BR2_PACKAGE_QT5BASE_GUI. It ends working because we also select
BR2_PACKAGE_QT5SVG, which selects BR2_PACKAGE_QT5BASE_GUI, so there is
no bug, but it's bit inconsistent to select sub-options that have a
"depends on" without selecting the option they depend on.

This not a bug fix, it has no functional implication.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aff091c39dd49c418edc406879c03dd2eb0cdf8f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pulseview/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index b1f9dc25d7..b9dbd88c28 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
