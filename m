Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5FCCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F52280E0E;
	Sun,  4 Oct 2026 16:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IImhp46LpdqX; Sun,  4 Oct 2026 16:14:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6E6D280C98
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130494;
	b=Viv6PuU+9Ac6pn6a7ed6+Dlb5mJom5sfm4do7bVpcRKLkhBlE27Fny/Q6TjEm7S2RhDZ
	 2myR+G/+3MSkMTW3UHke8tyunQ4A7h7DZ/0RLyo4kB0cxg5qEZWkTAGDp2odI6XK/42fD
	 4VnHAjwTRyb4X3ttWzpA0l+03uqji24s+49h0TXVpJJeKt2nmgsXxcLunVO9C1DDvZ+R7
	 VPgxc31KpnuX10bOkMc7/fCMbicpol99u3b7ZNmDrLxbthGSFWnPCruTiFXWHqJb6DIls
	 O3vnvNftjF/05Yu67AHXlP0YPRTHmyG70D90ghbLivpH5iXfO//NSyzZx9pPfT9eC/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130494;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=oEHm+QxcHD4NOoVl7FCSoJOxmyCUjB40oDWpDERRFyk=;
	b=nKK1l1fs34ejfP3wQwmEBhDwommzdr1kG0CRhJlH44xrAwiLVqBkM/f6rwZf4lRY7DWh
	 47QdXE/Td5D78hCelNAcUpeJYjwI3hIfB8UCzxo4N7QbYq9MQmMpGG5nqnsa2eE6hbeA4
	 MlEK90PW+Gd9R5HcB3N5MtoqOLWYA3ysiL9RC+k4dWEiW9dWevMSdplanUfIvasssbAjk
	 TPoojmHL00r83bygbWpOr6945dDdUWSXmjDF8u1M0KknlZBolSpg3SuyC0hVEec0nVlKq
	 CmwI+YBRS8LcXazNxxC+p7uaH1N67jTIuSoXTySXEoc/DDUJSuaJPVS6lmrvk+eYV/w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130494;
	bh=oEHm+QxcHD4NOoVl7FCSoJOxmyCUjB40oDWpDERRFyk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SAo+3IJEhaTAxtGEZaL1ABpHMxnYZq5oWzgrabn3kGMQcvwZwYDxae24rfUXS4br/
	 znCWwr9YYsrtNbWT+7e1x3Ey9HNxxu79/3cEOiK6g/kZqqGyYe3Q3/ZaOsIf00K1Mg
	 iDPwRs8sA24g6nZuVF7Ymzf1QAUE4SX+pwwQQNW7l6esak+2SXWH1lyV/EBrhm9Cyz
	 LhyNz8Z3OvVbzihl2jDSPaKdyuZbbZ5LT7+Ii8GNQthgb/djxt1bCF0rLX/Zn2EBdW
	 vKWwxlzn0rK6PqbZc4KmICi0LIrSWX2PvJ085e0dhEghDGilsZme8C6Sc7EhpYg+kR
	 Fb2GMoK20d2ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E6D280C98;
	Sun,  4 Oct 2026 16:14:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B99CB34E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB8D740068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ll9YQP_f_Vzn for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 17ED240049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130492;
 b=HUk9wvEk0+520ryGhpVOaVls9Rn71HRsAjQApDTo/dbUMT+yDi7PKvJDUKhZZiqJPU2c
 cnkT1MI1BZUZqre0gNe2eXMkodm8JKGaAPMpsf/QriX2aJf6JRM6kg1zAKMsB7H5ZbKTs
 67tKtiJQ9QnqG8pxdVY6kudnymTcUnU2pWIDBmdyt+5Tk9lIk3ijdeReVGiiOlKRUTrli
 LVVwKFsVJACCjCIFDec2uouVzr369TyVM1nZMsHHtRmY9y9L/PhICjbVD3zKPGcQ3jpsV
 vLC+apT92T3MZSgY8joUCrwPDSHcBLYdIcI1jx7zNL6A0BQOYcVBHLlpoooY8kSDK4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130492;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LUpgYxEAKvVGo/v5SvGy5eSBs4Ky5izRBz+6SW5cP9A=;
 b=iVeOBD5QIyiBtfvfmS+BoGPd7eAXWBjNikGG4allxH+1w7J8jRoXunqhp42DtlBaHH58
 XyPo8E/RJX3ZOXxpymsq+y0oVHU4ZvNewfFIh0x6ucOjGU7emXyPY3DCGOh7Fj6wWcRe9
 J8HNT0ulIMirzihZWL1gR3/u2D28FUeaFMnvDMZNo1n7sYABzDEATCNqMM7KuGH2Z0Dz/
 pmwJ06JO1L/o3nj3T7y6FklY8Qbv+QY62MPzOfaRHMC823EP/+lLfIGCdaVIqIORan3gl
 ZHd0UGiCVQE8YH3qytynz2l+6/hSz9DJvlmatXx6+ai0kyKEg4kwC9Jhle0FDZCyVXg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17ED240049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD13C8D28E; Sun,  4 Oct 2026 16:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:13:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5feefc6be00f40e6333feb9b2a9710c0c463fee6
X-Git-Newrev: cb129a641b403cfc4c1b2ea9280b966e19837b62
X-Patchwork-Hint: ignore
Message-Id: <20261004161336.BD13C8D28E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf3: security bump version to
 3.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb129a641b403cfc4c1b2ea9280b966e19837b62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/esnet/iperf/blob/3.22/RELNOTES.md

Fixes CVE-2026-101283, CVE-2026-101276, CVE-2026-102253, CVE-2026-71217.

"The iperf-3.18 release notes were updated to reflect that a code change
 in that version addresses CVE-2026-71218."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index cce50581e6..92246b6915 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
-sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.22.tar.gz.sha256
+sha256  1c0d0fb02c52626111d6e132db80edfbf27bbaff8bd9245df2a371dcb0b35a92  iperf-3.22.tar.gz
 # Locally computed
 sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bff9a40865..2e9305692d 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.21
+IPERF3_VERSION = 3.22
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
