Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFAC53209
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 19:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF8160670;
	Mon, 27 Jul 2026 19:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THIh-O4vSNVB; Mon, 27 Jul 2026 19:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DBD6068A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785181149;
	bh=t0QDOqbL272dtm6a0jVOJyn2h7FBZgZF4bu0WIX8KFI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vx00lnUBjYZGSsqLSYArqWa503UaHFVixOJJJEerWh0gXXqIGXFbZr+6uWcMHFM52
	 M3PqGSkykfc9oUC0aQp3K/7iiEqIizgxTXApGmvQ2ZvIQ7aqgfpyGelZ4q1aVmIM1G
	 y0z/ypz2OJfFLtYk1lxvJFA9846DBU08s/vpazk8kiLHVcrUQhKnHf5H0nFCSw+I07
	 6sX7X0WGrFja2QXV7nurDlD+vk2ltwknOl0/7ZTo099z7kH5EBCc1Lt/dD28/hyCNt
	 BbnHUG/frj60AKgsccZmPyHc2ktVwbZm9LCcG51VOaptKF2AJgsYxfKUdD/Qq6u/rr
	 qfvfNCoXIxAGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DBD6068A;
	Mon, 27 Jul 2026 19:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6742E5
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B5EF400CE
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1STFzJ7fOR3 for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 19:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 355E0400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 355E0400B8
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 355E0400B8
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:39:05 +0000 (UTC)
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com
 ([174.115.41.146]:40458 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.4) (envelope-from <rpjday@crashcourse.ca>)
 id 1woRAC-0000000B4Sx-2AUa for buildroot@buildroot.org;
 Mon, 27 Jul 2026 15:39:02 -0400
Date: Mon, 27 Jul 2026 15:38:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: buildroot@buildroot.org
Message-ID: <fdb46336-4f89-29f1-d418-e80fd7f88363@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9x1uhnOlQA2ZbNAoJQ5SdMUVzx0dZ1iuyL4jV53iTHY=; b=pLX20Sj/rXcI8+JIJn1//qdfBo
 UVjeafO6QYNhVq+vMcdzFSnTMn5ru2DYzuZOZkfd2JE/A/FslROx4fcjYA83XDbH4NMBBTY0brR2K
 SHvAFTzhRX3CrkuXCYV6oQjIGONKyVtzQWACiKHmRc/4cZ1i8dafGgtX9SbpNx3g0IsnyGoiQuF66
 dB+5cz9hPVsPfUKw+9mnjYz8B2VX1IcKcTz/6W4pt7/9e/P1BhpXMko+WWzngZb2Dv0PYCzSNkkX0
 sWkuT3ha6kghF52RfdFQgGcOipdSPBTEC1qbJNBitn+7/vu5ERa8EVn57A4e8rRE7DG5zqC6JdGXM
 UK80RaOg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=pLX20Sj/
Subject: [Buildroot] [PATCH] docs/manual: minor aesthetic cleanups in
 "Getting Buildroot"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Minor tweaks including proper capitalization.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
index b3a451f67d..4b5eae0150 100644
--- a/docs/manual/getting.adoc
+++ b/docs/manual/getting.adoc
@@ -15,14 +15,14 @@ available in `support/misc/Vagrantfile` in the Buildroot source tree
 to quickly set up a virtual machine with the needed dependencies to
 get started.

-If you want to setup an isolated buildroot environment on Linux or Mac
-Os X, paste this line onto your terminal:
+If you want to set up an isolated Buildroot environment on Linux or Mac
+OS X, paste this line into your terminal:

 ----
 curl -O https://buildroot.org/downloads/Vagrantfile; vagrant up
 ----

-If you are on Windows, paste this into your powershell:
+If you are on Windows, paste this into your PowerShell:

 ----
 (new-object System.Net.WebClient).DownloadFile(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
