Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85E1C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3FC4015E;
	Sat, 13 Aug 2022 20:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3FC4015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMn9PhlMGt8F; Sat, 13 Aug 2022 20:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68BEF40137;
	Sat, 13 Aug 2022 20:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68BEF40137
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA35B1BF276
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBFBF83E19
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFBF83E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRnC1Zsi1eeS for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 20:53:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0B4829B1
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB0B4829B1
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 20:53:22 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:7c59:325:cbde:fc22] (unknown
 [IPv6:2a01:e0a:947:6e20:7c59:325:cbde:fc22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5BE35BFA57;
 Sat, 13 Aug 2022 22:53:19 +0200 (CEST)
Message-ID: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
Date: Sat, 13 Aug 2022 22:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1660423999;
 bh=M1PzUIa0VTsdpP4o6nr3HX85M9TyVijTpmaNl5YWqzw=;
 h=Date:To:Cc:From:Subject:From;
 b=ZOvlMhdo7PbR9BCeZYltVvqggELdJlTOFn9YEXPDG8qmWw/wJm50g4+ro+SfcXNia
 J2CFdJzWmHf5psTNiAWRNea6cjao4n6YreJib2CGZxAS5/Gbaw9Y44O4IBkyw/A0MN
 zBUD1VsT40/SP93FyGvAFpWbVNKR4cWCKDyqLyRJjgjxGLYSvSeA4l3I77cIez1CKI
 MDujmkdqwchmp1vzHLivD4WhgT9ISoXs8xOb9Tt3Ew2WAnw1CqthQ90fWBKQ1O/X4U
 RMOW6lJ0fGsQMtlEVD7e+692EjqoNUQ/j4LjhdWCnUujT6eognULzjc58AgCHqOlv4
 nfebWLLfrsWNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=ZOvlMhdo
Subject: [Buildroot] [PATCH 1/1] package/busybox: speed up DHCP lease
 acquisition
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit c343e01ac4908f76520cf9a405ed87650e78dc62 made udhcpc send a
single DHCP request (instead of 3) before going to the background, thus
speeding up the boot process if the DHCP lease is not obtained
immediately. Unfortunately, this can also slow down the acquisition of
the lease as, after going to the background, udhcpc waits for 20 seconds
(instead of 3) before retrying.

Speed up the lease acquisition by setting the retry timeout to 3
seconds.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Hello!

While testing 2022.08-rc1 with acmesystems_acqua_a5_512mb_defconfig on a
real Acqua board (and Ubuntu 20.04 host), I noticed that my board became
very slow in getting a DHCP lease, which was a fast process on 2022.05.
Wireshark showed the following DHCP traffic ("<" = received from the
board, ">" = sent to the board):

    time (s)  packet
    ---------------------
    03.24 < DHCP Discover
    06.24 > DHCP Offer
    26.28 < DHCP Discover
    26.28 > DHCP Offer
    26.28 < DHCP Request
    26.28 > DHCP ACK

Looking at the log 2022.05..2022.08-rc1, I identified the regression to
be in commit c343e01ac4908f76520cf9a405ed87650e78dc62. This commit adds
the option -t1 to the udhcpc command, which makes it go to the
background after only one try, and has the unfortunate side effect of
introducing a 20-second delay.

With this patch applied, the lease is acquired much faster:

    03.26 < DHCP Discover
    06.26 > DHCP Offer
    09.28 < DHCP Discover
    09.29 > DHCP Offer
    09.29 < DHCP Request
    09.29 > DHCP ACK

Regards,

Edgar.

 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 2409cbcce1..137e44c870 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -b -R -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -A3 -b -R -O search"
 
 #
 # Print Utilities
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
