Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BCDCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8B060F9D;
	Fri, 16 Oct 2026 13:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9p9-TQpPfsk; Fri, 16 Oct 2026 13:10:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B27860BAF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156225;
	b=pICFtXyAkoBLlyGh9O+M3uT5UJlICV1eH8K614fNSbape08kqrfjIJswAuHHxyjomfOF
	 X+i3Yapw5gofJciWZLNR9VYfWOEcvMRRS23H267MaKMJBhIg0gDkZd5cM9ifYoHTL8iPn
	 5pgbKI0Xx0XUJclq4mXrnR/ikXG87ucOvja2DSzxyVM7AV8t73NHfMFVThsjXADUFGz/I
	 OeenfhTUIUnuYQKydqyX3S++/K810sanxiFVG6YYDqHpwZrAcGp2Jt6vn3zQYPlW6Lzf3
	 lv/VUH8DGE7DZebF41awVNzEu0F/a3ETmNbycrym1AUWUu48akPrmvYYVOqsaWZjkbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=cktjUTZWwwNyg/0DWdBGdPlZNty3c3fNh3fjtpI9908=;
	b=RYAi+zPb6UUYPcObRsXtvljV6pUrDxOFxW+ab0gauN0WGhNZQMto6LoLs155ubV+3Vp6
	 hxqR5yNVS7kARjFXAaL/earqNJDWo/Jw/B5IpjlyQo5+Ug7dXT98QsdU8T6VK/U1xP1Cp
	 dowYJItlsX22awi7p4MNYFWTbJur4RWKkWvGC9i1p/2frwhmZIhiBK8USWsVAvtdNK3ow
	 w+D6MWnP1T8A/DeuaTOuMK/wacNgepyJC+w9a3tQgI4CfmoqCr2E6Sr0Z9CwFiA6yIQhn
	 tBZYDs/dV04myZE8RBGfxsAnLntUF/9bUb9Wov/7Oj52i4rgcv5/6xh7icQw6PXLgLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156225;
	bh=cktjUTZWwwNyg/0DWdBGdPlZNty3c3fNh3fjtpI9908=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VwGYItnCXwWDjn+P+2xgK2XDE/F3TzZFWZ0alaUpnxZ15B65P55QUYVmIod5C5KfZ
	 VoVtdF7A8o9rACLoD4VUrha14itgM0UFT3b3jbgf2zlIhzeqPpOJf+OLkeH1YVP2JI
	 ZCMZQg2COlQ7dK0Sxl3Nzf+NLNnakAiVPOvKWUGxjdcyQ4vNMIU3eoGbR1JnWEAGBa
	 ifyMIA8+Wrrbsm/WTo51OTBRGxC3upeoXsPruQAkT2/JjXX9B0933Jmf964u2VHf9d
	 zmPn9sc9lG/AUkMw2eO8oX0xJkmNXQjkm867TZ54qVBJyf7ysdkzh1iC1wvg+M8e6E
	 JCRf+PEru5HFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B27860BAF;
	Fri, 16 Oct 2026 13:10:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41843151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3326980772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMfikro368U5 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 675F6814FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=rN47GtxoiO5/TPpvnpvTvmZKBiGnbTVY7Kp3OFTrK5oX9oDY8l8THHYF/wNm/uMt3eOy
 5WZCawprl0+3zC39IRrAJsk+4fensmxGJMlpHnfw274bPukeUcMRZSWIAuXj6SwdDfFfu
 M48p9vrFj0JU3Tb0J7ZdfgX2YcS4CJ8IP49MrhNgqr0l+E6ZGo5qhqqIJ4Np5dWHiEc/P
 QqLH0prv9KrxxWHq6JPDyCIryOlQtjIbX05SnrXD8ZFdhHT5ChUUqwsXfMAa3+Hc4y0Gd
 7nG39sjwIjFXYOrfyeQnrBVirE+VdvhIkB9rVh/5U+LzopEKhlF67E3wZSBcEVkjLeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oxOHvg7edgWjRqOnwMbMO4IuOEnASWee0fazmka8UBs=;
 b=Ys04YLEn+o2KunrUBKXOb0sYcT4Ew4jf5wtjYi5ARniEOhxMRKGNH9/oePISxJSbAXjz
 gzGCw96HCyvCjgczp1gzzlP5LVsFDh45CUOQ1z71gxgXKXTFeCjiApWKI/gNTA+JjZ7gD
 n4OB5l+jpmhLhm/z+/vmmCEFxHxlyRWBYM/pP+qtEhvCyHu+F5xfC6gGHKIGK5I1M9d+c
 u86EbOkQ2Rdt/4aF2x6RdgsuhnK5zDG/Y4Smqw2flqFHehB1Z0bgcJ7KuBHOvbmC9p2FA
 evDrd6xwdh77Kmv1gcTR0kNm4yhxGm/Qe8JOgAA1hyUuRoq1tnaxRwoK5hcjAoQ9NoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 675F6814FE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 588B7960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 242795fcc59c3c2bbce0e201572db48dcb446380
X-Git-Newrev: 9887b3020f3a516adc8cab6d5af9005804ddb1dd
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.588B7960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iproute2: add
 optional dependency on libtirpc
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
Content-Type: multipart/mixed; boundary="===============2590382905870232291=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2590382905870232291==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9887b3020f3a516adc8cab6d5af9005804ddb1dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

iproute2's configure script probes for libtirpc through pkg-config and,
when found, enables HAVE_RPC and links ss against it. libtirpc was never
listed in IPROUTE2_DEPENDENCIES though, so whether the feature ends up
enabled depended on whether libtirpc happened to be built before
iproute2.

Add the missing optional dependency to make the build reproducible.

iproute2's configure script checks for libtirpc availability since
v5.18.0 of iproute2, which Buildroot started using in commit
10990c576b2ddd7636f094f510a2ad1a5a80e50d ("package/iproute2: bump version to 5.18.0")

Fixes: 10990c576b2ddd7636f094f510a2ad1a5a80e50d ("package/iproute2: bump version to 5.18.0")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b9d1a8aa671982583864ca050380120ccf6ee53)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/iproute2/iproute2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3faa2235b8..7760e937fb 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -25,6 +25,10 @@ ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 IPROUTE2_DEPENDENCIES += libselinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+IPROUTE2_DEPENDENCIES += libtirpc
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 else

--===============2590382905870232291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2590382905870232291==--
