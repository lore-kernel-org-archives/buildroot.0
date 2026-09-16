Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106ABC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C2840BA2;
	Fri, 18 Sep 2026 13:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuWtAytPDgzi; Fri, 18 Sep 2026 13:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D9EA40B8A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736763;
	b=gLHHF3z4F1GMR6axlPXiSYtbnItB+rTZ79Y24yzxtoLcIzChe1n6XbFWIEV5A8k/n08u
	 WFMcQxvc6rYyniwJiy9xzav8OqPkvny5LX+fjpI0SGRRZ8NEa5Kr7c14MFFiKarMflLn/
	 NrD8uyVkGE4PAVXzjUtZTA/RVHkXoZey7k6JXJKDuZ6BZrl3S0xsrQ1RDdYMfZ1hYcj2a
	 sSyYDSBnXLmIKsvGWlnFC5PlH8/QYBjVAzLqRQ7iuSNw6cD5g9RiAGupZE4BqXPkaN0Gv
	 gpHpNZOioxV5O1u3KkjagHhDExz46G1EJq2L8nv8GV0HN5QZwmyivtHuClxtfZLB3Kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w2FAMu6fEKw4Q5ogK+Re4SPKQScqcEft0g0Xh9Hh6Cc=;
	b=D+56YwsLcvrzxdAF2Vm5JK4JsXJTM1C+1leFjYy74VeFaAM1+kx5P0+zFKxysUO64sl2
	 4wPNb7VynftPs3lyPndbZXZ+KrQ7cMavqMAHiCo+7UJesCWqw+fCkYXrjyYmgdXNYEzYU
	 iBvIICZKG4fUBIMqYjw1/us4YHW685HtmxzPWRKvnCY16qNtDm93sLv4fr0erzOYAidSI
	 5DLjI7ASUcH4czNwfsrtzksyUAxN86qxGo0z9mJ8D1qtNrq8LdfiUrzNdmrLRGe+cB5y0
	 monCy+IR+aYbq7Qy9qI88aNT2XO8fGQCZW2VxkAO9qoGtrX4UCe255D+Xs+2zsfyqBQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736763;
	bh=w2FAMu6fEKw4Q5ogK+Re4SPKQScqcEft0g0Xh9Hh6Cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xs3DJCavYG6Gcm94S3VZPBEFe706hXZPsjxj4HTeR91Mm77hJ5Il4qWQE16zoTAcg
	 wJUjiz7vyheCPksX3MAVFN3OareFhLRlMZBIjNrp64CNbZMWT6REU0eO5Pyci+eu5p
	 896lgB5dS9ZNVpiv0yOPr8obkMvg69fJw4Rz8N0Qj0JMJPnhTbwck3vhWhOPK4mZkO
	 7M84IrW0Z1ByU757+YBLzjaXzdzCU/2NB/Ep8ljJjYhKZFrpzoT9Z2HioPAT5YAaPx
	 OAAbgAdovpnFnT4OfPtx9AJpn7NsV6v9TsEKlZcSIZiCxWRJ6l4M0+KDOJb/Ry8fL7
	 grB9ntu09mQkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9EA40B8A;
	Fri, 18 Sep 2026 13:06:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D1B1FC8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 636BB60D7E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8HWoO2DcNxy for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56E8160D65
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=PVjRjWrVJbKvA0GiKwJUQL5g/U/cJEkcITJ8h2cfI9efCqOxO1GDb7GCvwYRBiFs/uPl
 N2KoV7AFD2LRmaZDGF7Lf4Aj2NL4IshunIvFhdYpnpTy0qWD48plCdQ3vBbMEFIPfCQq1
 2+c0TuzuAZVM9oaRiiQ9ioWTcDLU6gdboEUL5059FaYKy7evJcOwZ8X6/69XY3JokXiju
 oZLE3Vmsb4z7sdnek70jQAJ97meyrlv0/58lhH32gHyIpDRRaHfUJCGNCuMp+5udcK+dr
 KBF3tqBwWslQwE+WNBHXSNFr6+ANEKc6hOldO+OYJ9mkeZGwn7IWfwE2GnkCrE+D6Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sGT6zzhI3Biw6PmmDHtT5TG2JJc/hE5cSSAmwOv0wI0=;
 b=NNHA9GiHkvD50F8x87oYYZC/UMaFefl4GhiaOeEnvz3eRR7d7Li5ItwGKMM8lk5NnN6f
 is3MQTLNztqLEeqJpnqhTolJma6m3HegPVHuAZ3HpzgUfVziz0xJdZvRNcDqy77BUnuks
 MEv9Ea4xmORebeqFd2KkIgylKlUDuWEKPVx1u1/zsDIoDuYOfBm6te+mm4FZxC52bsUgu
 wFahuPeI3I3GX7dWup0RYX5FQPM6BYa3cJjLn/viUCnEiSkIfuqSA1FXlLB7ovYSfb7uB
 8WTFNkSr5VWKkqefRojYQtKxYjINwYV2rqd98cVQ0s4s//P5H7Af5SmLfT9ZXGyb3ew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E8160D65
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0A96976A0; Fri, 18 Sep 2026 13:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 10:25:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a9b3d724c874fe4fa75c024bdb4878c72d574da8
X-Git-Newrev: 9f58ad72cb242aa6e0f003f2e56ae02b51e41933
X-Patchwork-Hint: ignore
Message-Id: <20260918130439.E0A96976A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/turbolua:
 security bump version to 2.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f58ad72cb242aa6e0f003f2e56ae02b51e41933
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/kernelsauce/turbo/releases/tag/v2.1.5

https://github.com/kernelsauce/turbo/releases/tag/v2.1.4
Security fixes:

HTTP header injection: header values were only checked for a literal
 \r\n, so a lone \r or \n could still split a header. Now rejected on
 either character.

Transfer-Encoding requests are now rejected with 501 instead of silently
 mishandled, closing a request smuggling avenue.

A real default request body size cap (128 MB) with a 413 response,
 previously unbounded.

Secure cookie signature now binds the cookie name, so a value signed for
 one cookie can no longer be replayed under a different name.
 Verification failures return the default value instead of raising.

Constant-time comparison for the secure cookie HMAC, previously a
 timing-leaky ==.

util.secure_random_bytes reads real OS entropy (/dev/urandom,
 BCryptGenRandom on Windows) for WebSocket masks and util.rand_str,
 previously math.random.

WebSocket: unmasked client frames are rejected per RFC 6455, and
 fragmented message reassembly is capped to max_buffer_size to close a
 memory exhaustion path.

StaticFileHandler decodes the request path before the traversal check,
 closing a bypass.

Fixed a 32-byte-per-malformed-request memory leak in the C header parser
 wrapper (found via libFuzzer).

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15a422cee13237b61a200c20f2a969ffe4d1bd33)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index 12c41c6e5c..253b12e47b 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3  turbolua-2.1.3.tar.gz
+sha256  65b602ae0638bd14405567de999ef57e8d49f0c8ebfa3561952f4ae7242e9d0c  turbolua-2.1.5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index a85256a3e1..6765654afa 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 2.1.3
+TURBOLUA_VERSION = 2.1.5
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,v$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
