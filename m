Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC76CA5FC4
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E549640B17;
	Wed, 30 Sep 2026 19:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVFvNN3kH3cS; Wed, 30 Sep 2026 19:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EEDAA40B0E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790796111;
	b=bIELoEu9GdFsf6HlKHHBK4gr+NBFfB8rD2/y8aUl6AWFt5eAvaZsMjj2M+zoqGgRkFfx
	 nKNGcZOleojRfAixQLsi3q/ec3kPgxgHRdKmQLDnaYeSahtdrCXblQ/oVuNVtCjjIdBHr
	 0zpSSiYnmkh7xUG6SzYUhCt+1pxKFpMInzvxmCK4P6+4/jXKNy7eCKeFTNu0lR1PlDTIX
	 UcSjZAfkWQXcRmyYnHvm4snRDf5Al/L48r+NX7+6fcAH7tpGwNgacrCOg9KsDXI0REu5E
	 xARw+TeYrJML0/VzfhQz3q9HdQjuZLwkm/mT+f5pWbpinu01TrII4gMdmjJNFA9D8Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790796111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bzTyIKTH6BoIZmsENgMKmqdIi2wnA1j+tI/ygPzE+IA=;
	b=sJdwkKbxbUzvRYNdaslJFuKJG1ProCeGYm3D8hgSKTDIC6MNmKzK2OIM3oIbOvfIz5WG
	 QjjqmEvjObpuUWs7ySQGZveq6SOgkaTFA1xDfQbi6k0ZACUxkNC2eMxaMEW+hjGJPcaJu
	 /h3/75BtY3t54cZafGFREIwIh1BhZPAPjrb4s4+wh/VPrxu1vuv5GxNJjdQiNlXVPpRTx
	 R5qXAdJnO0Kio7me+8tfsYO/HWuJb3tLaiBI7L0Ba6jJdYtGeq0UOsRsFQrkO1JYUPFOb
	 JSV1ZGb6k6UlJoYy3u1+QoS5g/b3jaUeAvVIOOYcFISj6CB7FqhF4IFbHqp+rWivz6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790796111;
	bh=bzTyIKTH6BoIZmsENgMKmqdIi2wnA1j+tI/ygPzE+IA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W7oVnJb4ehaCkSjRBiV9PAcIcowPS5R6TaP6g0LAZ7oPcEE3nDbMYSkZWBx2OFN1r
	 nptcpfJ0DUaFal9MaqkwMK9O19r/Xc4gTrHrMXXhfg9HdCFRp1/OuBBa3e+zvaEhlB
	 a9ZZZC+7jpiMc28EoqoZEn+lIio0nvakwiA5j/GP23eHWLtDGGWM3W5oFmdN5zehZ6
	 H0uA3cum8LFyT3yJ7uHaOxRbx5i2ZuxtqXsQBfqbhvDsrSVXMZ9mz3/ANoOHMl5nqu
	 Q3f2Ln5EUChgpwXzJwgDF6O1tXv6M3JclFB+SG406oNQJrtlPPnrVK1ZqR084c+IOJ
	 M6AIUAVOD/qnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEDAA40B0E;
	Wed, 30 Sep 2026 19:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF2103AC
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F6D4083D
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QefgWpMk7yRG for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D636440B0E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790796108;
 b=iVkbkTLV133joxGupJ5Ga2vekHTFbZWGfbcT+xUw3Dhn+MOKerEvyac+6VN/Uqrt01ls
 CNX2+MWta3x0stVZ7/QnwCfilwYLHUQ4+Id0uan2Ak0qAWJvUpFRuCpnPO5/ZxwuBe/40
 Bg1tzhAoU1C+Nce2YDPaZEnAcQkkaOFhC6nhslGnFLc2wXLQt0SGne7/0qW9nnptmosTE
 9at/73dH/PE+lPosKnmR1bHSnev9lySbJciP8IzAmB7SahDv9QHwxQD8QSaqWcdBvqs9L
 /Dr/T5FUcGC6ag+7R9xPbxqJ0keVobAFJh6v+fynQFcr/y1bOfI43c9VaW9pggot2zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790796108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4mLeH04xLHzJdEnYMhR72FOHTDwaZt1QxRMfkenymLo=;
 b=HbqUectY3U8/R9wfY22ch7LkjVn0/echg4KIcKt5V1i0C3yCCpRahfvcS+u2PhxUGpbF
 IhRdzmpmtcIBg30Hqfpvcj8QAVHR8kfMR9x/FeSOF50soyAF0FNJpQh2eznMuez8yFS0g
 yXwDngKuj4aaYHG8cwJRFgJ21G/mwMpNFwgXb9dcYV7mPGv/nhhKqXa2VoG1b/ZmaFzDK
 Kqiux7yjF0ySOTbHNafC7bZLY7tcOHHV1qBIcpI5YGqX5cZiPnVQ723uvN1O4GJJrPGnN
 NHgsT8LIxL7xDPdsHJZmgDFgtcLjBvPdaJWkAdaYMqPyYCSArXCJJJ4eva/uKcsx2Zg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D636440B0E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:21:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79FB698446; Wed, 30 Sep 2026 19:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 21:19:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c71fccc7a9ed80ab38c56d54b788bfe92090df35
X-Git-Newrev: 99ea0fbb3db76057a77bbd618cfbd188c69a6f86
X-Patchwork-Hint: ignore
Message-Id: <20260930192035.79FB698446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: security bump to version
 10.49
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99ea0fbb3db76057a77bbd618cfbd188c69a6f86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m:
https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pcre2/pcre2.hash | 5 ++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 90991322a2..3d75858727 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking pgp signature:
-# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
-sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
+# From https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
+sha256  53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384  pcre2-10.49.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ea841f482e..a3e74e32b1 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.48
+PCRE2_VERSION = 10.49
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
