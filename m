Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02E7CA6018
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 22:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CED60872;
	Thu,  8 Oct 2026 22:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzSqeMkqIr4k; Thu,  8 Oct 2026 22:11:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D9A960808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791497471;
	b=HCfFEuLcXprI3Ge+UOiY9s/vgPNsLjsraQK8Y68PEy58AsILkC2yOFOgw5cpOa0mLsc6
	 MOIK0XCEi82igWMzw1MWZYTx//G29Cd9qdaaQg2oQkgEFBbpVktPFwGSUz2FBDFbDraEP
	 JidL8JRwB7Q6Y4ClTl1yP54WUYxnmN7iDzyaSFkqTNqJIQ84/mnRbUUzmpBpMeHjJRZJh
	 vz53v4N5eQaakJw5GHzDsCcfWlB/oHkPB+yNHL5cq6tVl2nreN2vuCpmLQVaw8FG5Qmo3
	 k38TO6pV05fXHuf+xGnFPns7zkFDneS30EaKRrt0euKtZck7x5yAGSsEG6ZXuRiROnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791497471;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Qxv0TuR/S6sdgSOzWOhohmNQsePmhwuCtuNjp5cWpmU=;
	b=DMnaTMuaExkUbUP8jObNzVjfZLGaqbPudfe+uEOpiPIZTn3ceYnDUNB2sLllJzp8rAVH
	 ayexyr6qNMl0B120SnJro3LuawX6HfHs36B8WnO5PxGERgpGI6JoJWtR1xrewO3ZZCqMq
	 kXIcfM0GTfzinSuppvuUj8cW8RhLJzXJaMfEfSweAgR0aLEtYpKWEQHSbFSVyCwiRcEr/
	 Fx2ECgpN4G4cwJccdv8Y+dZT/Ogd54eqQVrf5BLzXQmYi4raLt6Tf+dhPwrwcBGdVRxi7
	 pRM4w2hd8Bf8NwNFy9fsFXYi90qFMLnZP8QXgrww6T5L5uc25+8L+T5wII7sp+od09w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791497471;
	bh=Qxv0TuR/S6sdgSOzWOhohmNQsePmhwuCtuNjp5cWpmU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YfD5xCKmUaEZgcZOAWMl8Ze3EloxJAN/Y8YAuhp64fs2vfgVlPl+OJ2VFDsOnHsYc
	 EG+DksOMuDUwUtvVrY7/qawKB/BbA/sNi95Kt9Zc/VJvysu0CjPWMO9RVxIsDRxb8+
	 C933C8Lv48ei8QnxwxNuGCGaYR9KF4A8iA6DOr1Dw+A1VxqNAihs9pxdQs0jt3aGke
	 FJ1cFfSSLL0Jih+CzoE5GmKjx5siYo2FcTOBzajb6+rl8svUfmmCIOxMrecog3/Awo
	 0JjGAQ/+3K72xRx6rYyY34yfocJW0WVnZd31KnUWHpXc51isMRXJI4DVMJky7uT5EU
	 d4BsTQWrmL/pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9A960808;
	Thu,  8 Oct 2026 22:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1EAC21A7
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A4440925
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zocsKPoossVg for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 028A24090C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791497465;
 b=W46NBqGRJ3It8iDOyGz9We0GMIuUX56eOZIF23fQ9Kkl8D0bxyOGjG+vs0BgPSGaYzOR
 I2qTl69qNnmi8DBWUfiYTQg0SPItODqsts7Spe+Qx9/ZjD30CWri5on8r7pWSn2Zya8OF
 4/AQmYvd2rJj0NZuRGdMTOVtGr8yF43g+Kr88w/7MBPA1l2nds0ggMgOoqMzBsRNeW2jE
 Y7oRoOAjyNr+UtsVDi2vZ7Gd1r4TuxbYUWol3waPk+tsT7qz/pmPK2KOCl3lNGNBkCSJz
 RC/pTMq6tSe1cjOsjWO1RWWTkGTWTbz7noHMErj6+1oP3gYTxlNJ7/tlE2DeEwDHrPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791497465;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bhTC+i1o+2vhmWhbhU9I9bAOwkbpgezhKX1+xkLEa18=;
 b=dVVXESH8lNVeFeIAIafaCUTrgJbxdjNa7c1WcilWAzRY/plE+GivgWZER7b3Kq/dfa1I
 pBkcLpMc3/aaayq/FcTjwLUNtoWrEtPGN99K4UmdC7BFzAZgyKhBeUr97Bk+Ch/7NW/iL
 cZXdG8pe3rVRzuOmQ0IzKYSDLZau04WRyvRU+A86BYMZjfz2C+3NMEKpHvr9tv6Gv0fcg
 xVOsqLwGnmnNaoUUTaOn94DPalqX7vNcuj5M+8CxRFRaL93eFG43MD4BXqn4//m3RD4yN
 +dFWWuzprPFQT2Px/9tE6edKt0U+Bid9szOfCsayMrKg5i2uJy/uVjjDA4gvW98tfqg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 028A24090C
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A0A58DBE3; Thu,  8 Oct 2026 22:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 00:09:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbf47e3028dcfeb3a52419e5ed6ea3a49cf09cbd
X-Git-Newrev: 6a9ea2a8bfecf9fc1bb4c8e14106ca11410af72e
X-Patchwork-Hint: ignore
Message-Id: <20261008220947.9A0A58DBE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump version to 1.27.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a9ea2a8bfecf9fc1bb4c8e14106ca11410af72e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://go.dev/doc/devel/release#go1.27.2
https://groups.google.com/g/golang-announce/c/U2fTuyDJznI/m/bAPU-QKAAQAJ

Fixes CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
CVE-2026-97030, CVE-2026-97031 & CVE-2026-97032.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bc6d026a6c..6a4b03ad35 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5  go1.27.0.src.tar.gz
-sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad  go1.27.0.linux-386.tar.gz
-sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685  go1.27.0.linux-amd64.tar.gz
-sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda  go1.27.0.linux-arm64.tar.gz
-sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b  go1.27.0.linux-armv6l.tar.gz
-sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255  go1.27.0.linux-ppc64le.tar.gz
-sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c  go1.27.0.linux-s390x.tar.gz
+sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
+sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
+sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
+sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
+sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
+sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
+sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a49dc206cc..df6f0049bf 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.0
+GO_VERSION = 1.27.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
