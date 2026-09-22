Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5E5C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C9A80E8C;
	Tue, 22 Sep 2026 16:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gu99iXnz__Fx; Tue, 22 Sep 2026 16:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C000180E7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790095876;
	b=W29tfs/+f45hOpLavIOu4x4IHnu2uXSRXYfrZ0b6/Zg90bTr5AL2YwQspTf6qoPQALTK
	 BsRxzYAfzik557lbQj/A7OWuSOIdI50PNni1UtnifQZF6XjUptlx8roENv30kiv4Yb6fe
	 hWWvzK6K4ErHopn0qncrV5Lxx2m+jpqSqzxJ5rVXgD4yrfkrjBMW//K+3WDgfnyGnMIz4
	 JubiGhDV3rCmXbAvc0MRZByTkrmX74ikHc2bMdeEBUlZmxc9ZsDhy2oDNBC95yVhI3koH
	 +rGC4jZIEMeLjTKBuWYdRAi7TWCGQA5xLHKJ9ho4X3i0onslLSl+CM9oeRfKfWCgt7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790095876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0Po1Yp4/DF1zWHes5/gEhvooInalFXwVPR1yQD6/U4Q=;
	b=ACo/z20kVc5zmtpwBPGCTwUhDzwF+y7O4VNyuCnPkG2hV1dg44meCPFyxIlttmM2bL+U
	 KeenUAs9hZPXzG3KYZmJbkEXiONkCeE4+gvtRU/G9h60m/fGnBFDikWb2NxMpbMuOhB4R
	 2syStjB3t3Ll+L1lV2HC6Iv4rBAd4AZLuAl7NPY/qPDcXueeAWBXupUPVpncgEMxbHrBE
	 YIAfDacHfTw3VswKDdhMFKQwkE9xIAdGS4KJHf0C2tJAYaJWSUduV0znab9guzNTNrBgg
	 2KVVR7tMVAbrcYWjvFSrWybs9eUbP37HkHJpdHzJIsEulPQ2pbR+8rwtwLhlUaJD2ig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790095876;
	bh=0Po1Yp4/DF1zWHes5/gEhvooInalFXwVPR1yQD6/U4Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X+0d3EtxXTe63XBsr9KaOpZkyZuzbBZItmoHp0GGagN+7CDY2uLs7qAGyCsoocCAf
	 jhDCyLKbKDwqpRCNC4MMsY3WRp75nASFHqwxZjQIYC6XZHrAYH/s82Tdsdte6jhlMo
	 K/7+s20oBrqPRDUJQXo5ofrRxD6PwZ7QlzPdwoHrLMv30YbfvQn3xkEk4Zcqbjbt6k
	 7gmcmTcWxj+ceUNfgsdh68X6qndIKju81Rts77UgPDTlJCmi2bQeqwfER7VpE3+MaG
	 jGslGlbyVAPAkvN+EpqV7Ph7LoupEpz+gqItJU988HO7pl2bZDmckyaEur6inBC9Fm
	 Z8L5Rj0/jHWXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C000180E7D;
	Tue, 22 Sep 2026 16:51:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E39389CD
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9750606C1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBte62NYzDej for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:51:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1606C6067F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790095875;
 b=mGOQDtMeH+wRcSG6aXdnmT7IE/iwn1KCW+hZa4skf3kyxNY6NYtgf5/Kqshcy3saMZ7w
 anz1Ojrvce2a1nh7N7dZKeZHijL9nUtMoH/+TCF0oHM0V8UINOE9QIY+b1IR4SC6PT7KD
 MzWBwOvBps4ZNumDDhAui2V2eRjaAD0ENbKwD0V7dF9t/2BGzHreFz0/0p/7PVfv45oe2
 /rvscab7/6gbL1u2q4xDbKb6wGrTUiRXUkgfP48KFBZF4lz4icn+8Llrj0/XwwDO20Khw
 rrxG8fRnQlH9bM2z93f4qi9XNvgEXq5rgmplVa4zGbTB1pn+EUU/Q4eTGXSfYCu8i5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790095875;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OIRrYMb/KwJ1v5fHEOUgE8xIu4sFCwBuup/E3zCy6Yg=;
 b=n7Nv4e9R4EbvL+Ik0HlTZ9OficyR9CC+/iJ7j4SCfDL3wHcy8cOVD8T8M8Bm5SUyY0jp
 2Mvd3gJ3D4MzExn/T75HIO/0Jh97nFnDxQXdaNyIywqPEbRuGk0P9ROnXneYyno6BbmNj
 9M8tJMyeYsKfhbWIWFw/DR89r3YvLAdkDBQQaE6Ypub0Um6XB2YhrwFDrUAoxHXXCS29j
 i1SHGCtnjhuJbcI9fZGEr/WwWTiYsMBhTpWNBRPZldMLGfGRzB/YownHQiG4AJzw7VzHI
 /1s03FhhMyH9Hw8v+7bHDbVc9vYpashEXYYRdDh6dHbsT0edj7ADItWkexd94klnloQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1606C6067F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A52E59718A; Tue, 22 Sep 2026 16:50:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 18:50:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f18c4dbdcee9e4b42406a3ef96dc2a38e947d810
X-Git-Newrev: 309ea703677fe3067ab80b690fd03e45ce4db31d
X-Patchwork-Hint: ignore
Message-Id: <20260922165005.A52E59718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utfcpp: bump version to 4.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/309ea703677fe3067ab80b690fd03e45ce4db31d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/nemtrif/utfcpp/releases/tag/v4.2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 454903575d..9b3fa18330 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  54a8e96ea835a7359e8e53d03e30e9833d51350cc4615ff53f8449ef19ee46ab  utfcpp-4.2.0.tar.gz
+sha256  6d6a5493a111884cc085ee31babfe6d9960c8fb08fc80a64852eaeea8323dbc1  utfcpp-4.2.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 25cdb20ca4..e839261600 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.2.0
+UTFCPP_VERSION = 4.2.1
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
