Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689B8CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC8F60D78;
	Thu,  1 Oct 2026 14:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1O9u3hQK4185; Thu,  1 Oct 2026 14:23:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4833160B18
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864581;
	b=r8Zfv7GoOZM66M8tOjxIfqQm92czOVYuJeAZTilkgdw8UOJy/MrUUAL9rWhlOY+VBVAY
	 MXQ1qTXZbrZXHIu3hIPOs8gOIfN7muryWzzyHet5oW+o+/JtHU/zRdQ+sXYC4ASw6bynT
	 0wx0lCXGLNCXLI1aIH0B/tiYv1RjybQFThkZqOIIEqEiZrbk8ZhSMBNyUsm7QOFqDbGe0
	 T19pR9zpbAZu9e73Lgt9NIZvZNsp05sNrLwXC2YsWwU4bsn9rgEmD+2Nrosghbs9/uX+x
	 SDpUwBQkMVS1psmgyDcuoDaiv7d6dPMf29TmcNYuDmEL7u7xRlUUqhDehb2lEHGqYZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZatqM51HbD8j6aJ+sZp7G4ZrQVQe8sqaz8z3fD32Nzs=;
	b=rhiLuAStgtsuKkldkEQ82FnMSdLmHIGQxjw6OczCS5X2rylOliCGZznCFLn+lef50ImD
	 PB5Dkwh198MffQIklKVk8UiJQLU9EVEJRg2HSJ50QTUuuErmXIENaw9mwhIIzJ/0D9TjT
	 iGEuAw33cTPVt3f0tt7op65UjTXU/v0mZDDllv0cV/hgOlPjShDPDc8lduWFiFAukS7kP
	 WsHR0ekVdSWTJNFHTPbZ3BdY8bI2HYHxB17XDem0G9kHvXQ86ZklnCVw96PrJo04n1gCt
	 3yvs5Lbx92FIzCPN3JDAYtEqOmaIwBtqyNjCoAC4/1OlhSUZeU0Y+pLXIsypVGbQ+uA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864581;
	bh=ZatqM51HbD8j6aJ+sZp7G4ZrQVQe8sqaz8z3fD32Nzs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UqnJWbcXjsectlg9gkoUjOL7fkuRx+kR+ZOrM9VRO2EHVjgzAaTfLNUa34Stlcdkd
	 BH9hKQUuJYG/kpMyWaygyNCgvrKlvR9sl4KDLE0od6AunlhslHz6b2GLY8lR1JUqdK
	 l+hVq+VPnIp2oGxcIbPIQWV4oBaJtp/bGjlr0p7osmJTR9DyH22nzA1kHlOnesMu9t
	 dJ36180610bTiLViSBwtf+WUiXP5DKMbzeJigRqEzvlEUIuiZUGQ4McHhWm9PkFVs3
	 lLa3sSseuLPmg83seXjiWLAnov+5i7GM4z+38OjqCP0GJhmF3HijaevVdNrffbRxl8
	 25lnc67N0LwVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4833160B18;
	Thu,  1 Oct 2026 14:23:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D140F116C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B743C80DF4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oocdycKE7oYO for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A815680E0F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=XKB99ePLE/UiNL/gDWVXHawxuZvvET513PmGUUn3gKdRg9AO9Tuh2Sisy+vsQdog1Q0p
 SoOPAWmrcC3EmRL7S4Aq5w1A4Zo/Skc40niOE9wJlxD+7DknM5IxDTajSR/ygw6JY4NF+
 ajgbqgy6bKvLq0kVN0+oykdl8c9rncEZkCJVkwyP+KLXR2ynftjDRyQkICxtUdXYmbmG9
 HMJgRyuVNW+VSWijbzGh1L6K3gH1J1FxQioj6QyZArNWCM5gUOIAwzgzXYQiBjFMj6PGd
 IUNqH1mOT086Eslub5fhCNKrzqquKG1NGtYTm1JSLiB0lzIyAFH0t2RrqikPu92XdPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TiMTEolQinQ7SLIazrjGdH1iOZ6fmbqY2KvOlUv7UUk=;
 b=DrIOac4EIe1+ea3wivBcgWiqkszKEjtE+osQMABmvngT86VtWO4tTGLBdxI4siH/id/z
 dQHkh+C0v9IHgZJ3FT9IpyOgk8+pI9DIsBZIpigCoyKO5iUJSZt7PIjlIXAYNFt+yehHK
 zUmIB0/5Jj6Agsf8KWaoNej1I6WXVTpx/JB713Dk/ruoZIWO5rutMp5PyqRddIlt/u5Rj
 Ct1Kn50W+n/ToJk8yh3AQHS8Ix/yUTqWBlHWfBVg9c53cVEu3TeGe0RLmQEUZapsQPEpk
 GrZKFIIwPBFDlxkm4SsR6Z174+qd14ekmj5os8Z2iT2MGKxNP0Tyd8Gfl6MhyL/RFKw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A815680E0F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2F7995B8E; Thu,  1 Oct 2026 14:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:08:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7305127cb8b860ddf228a97a644e2fc6bf51526
X-Git-Newrev: 9efe87bc7d74b088816b8cc44a56d8d182e1a53b
X-Patchwork-Hint: ignore
Message-Id: <20261001142126.E2F7995B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.13
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
Content-Type: multipart/mixed; boundary="===============5416575606886245364=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5416575606886245364==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9efe87bc7d74b088816b8cc44a56d8d182e1a53b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.13/ReleaseNotes

TROVE-2026-012, TROVE-2026-030, TROVE-2026-038, TROVE-2026-041,
TROVE-2026-050, TROVE-2026-051, TROVE-2026-052, TROVE-2026-053,
TROVE-2026-056 & TROVE-2026-058.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc5cb8f02d6e8c24645e5f623e96067f7ad79840)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f0ebf5d909..92e5fd4782 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
-sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
+sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3fb4f52973..8de7ba50f9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.12
+TOR_VERSION = 0.4.9.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============5416575606886245364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5416575606886245364==--
