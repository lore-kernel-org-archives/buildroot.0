Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62431CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4C360D89;
	Thu,  1 Oct 2026 14:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hse-kZC60lDF; Thu,  1 Oct 2026 14:23:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ED9AD60D8D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864613;
	b=LcYh3MKELTF6rAmdCs21834pdIrj9yRUUtG67jWKBGA4l1Oc3PxJ9pYZ7UDByr1QkQ3n
	 36V+ndNDe/zVZ23vVyJE4AvQMxvGeWQ35CR7PavjlbMSon61WPL2DxwD05ZoXWMwdqsd6
	 aGlQMvDZbH7bZ8+fQmftkcovLZksIDJRCrc825rSgErVSDR9Ign8TwpVpubbTpDMyj7GX
	 kwPXN7T5jb2McVxQ4vLKqhdj1k6guIjH/GEGCxaGIYq4vzqJmbjflbRgqyIBSV0/0T2Xr
	 3wGK0Yo+GMhJRv7F/nh97tM7zESZ/5GQvyhVUAmDhzrWYdRlDxnaZekSHfuyJuYl9ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DxwrIswXGCXyOpU6Q0ZjMklbbgcvt/xmdlLHD0HT/1A=;
	b=RwQ04Ltf020E71e3it430RFW+Szj2l8pYT4yEti/8Z1hb9Zk97TyYbYzHbkUjY7lp8Yc
	 vSjcaABEdnQOYk8vbldiImNTJv01EsDTEN4l5Wud6n148cNqiI8LOhf1ozrilejyntNOS
	 /mEVlND15PePD6+LtfaZ7tmD84MH3Nt7hccgbMNyAkNNMflSU/qeMSxovn5/CB72oJnfk
	 8f9LpKQa8HuIxOEzBkcgpB+DKENCQua8FpUL1g+irFW7jvZw5kC5kcnLbmzdSAgzVjefm
	 3+PlNkM/M9DVQY/8Ce/Okz8GNcj+HFgFcNT65VpAN9sCe4RvjG6RxV8oSIxROVPzPXA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864613;
	bh=DxwrIswXGCXyOpU6Q0ZjMklbbgcvt/xmdlLHD0HT/1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kcshjg8wuEZXQdJoXJqfeg5Bkrvd1biFvo2/CQ5EnRnjWuyiSjiGst5tJGzvyIh10
	 sAhQGO8tL6t7Sd0EWw5UFji+ec0rd8nEsbuZZOjbebOjERR+bbzVK8OBTV+gCkzwx1
	 HcaAt+szp9i3NRdFnpSmah2qlY+iUJIM5TryZt/A9aUFZNvrBom5W6AHLzp4cnyoWP
	 sRb50QXF7CISujYb9o2RIK1e/yvw5vnCEJ3kixAWIRf+ew67G7ziLus3nNuoQdQkNt
	 IxJYzWXgQPiSMR+UlxW+/oYqtOYs0VLI9jJ6VaSKurZbdIS5SZnhKkt4YKC1cmwTZ0
	 0H2E8bRumA1IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9AD60D8D;
	Thu,  1 Oct 2026 14:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B1532A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A098140A20
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydZ5S8pnm0yy for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC68B4085B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864562;
 b=h6THWVNgUf9ZWi32Wd8fbUWaQpLOzZRILbs9PPuhfnQ24IAtOTfmYVqsZh74X4GRs/Ef
 rQ1qT5/PLJKIeFHEmRcwxUNaPj5luj0OxRMUg+dkgmnZgBvQdVv7fCOdr5pSGXxO9nEIY
 qvKBFERci7jHBT5TCYkr4xq6n3KqvIW13PyjvON0qw1/+6ZWcqsnQzxwhoMDjfOR4kYvR
 Xo1svPeze4RegxxGyF401H6vs9iBXgZDrkqn9owitbDDkruregMVHw5J1ibZ0K6/crFZ1
 9Q0vKdfdr0F5x03HRVFDBdPwjzIXZec+qF0N/TN8tYH4xvDGNf/149AsDooHl3Mewsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864562;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SfvguvnXGlBq+Jg9futn5waossPcd3zRenV6Hwjs19o=;
 b=VG4NdLN5Po2cvgXAuE0EO9XRPA339/Kl1TT3s0MhcZO/5MAIXF3Ccu8t11M2OfTLLq1f
 aynaeh38Wn5uX4DUW+2DN7pTz8OIl1vcH76vdoADidV/5264TOi2EmrTcB5jrzDTMmTGI
 vkyqzPQ2vjoPU+2Wl/pcQ4F3IFh3ozSOVifcHpAeQKqS/X88FjIDn6EXViM+dZtBpUFy3
 4bW5xeCFBY/P02p8YAdIB2c9zFriTmv8/Oe4ShCdmiGmwEc7TH4ben/UELWDGEUbcEBy4
 vzX9+I5YSxpN/TgyiKHzibouYjJ0rwMPvCJYvp4J02X7i0XMfhKqM58S1m2oHoNMzww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC68B4085B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 146B39843E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 14:45:39 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f5ab048daed6e7d17f33ec9417ecda7f725501a3
X-Git-Newrev: b0bb3ff02dad7dcbcd83c40fb253c855519b4219
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.146B39843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/skopeo: security
 bump to version 1.24.1
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
Content-Type: multipart/mixed; boundary="===============6703838365175776653=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6703838365175776653==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0bb3ff02dad7dcbcd83c40fb253c855519b4219
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Changelog:
https://github.com/podman-container-tools/skopeo/releases/tag/v1.24.1

This releases brings in a fix for:
* CVE-2025-11395

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b2c69fe0a46294615202471f200390176d7e3bda)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 8a9fb22133..e496eb4410 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
+sha256  6a3f342a327ec7684198eb0e15114940b6101506db48d9a96590f5942cb3b335  skopeo-1.24.1-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 354998b175..5a22658611 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.24.0
+SKOPEO_VERSION = 1.24.1
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0

--===============6703838365175776653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6703838365175776653==--
