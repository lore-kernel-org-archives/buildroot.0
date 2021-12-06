Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8280C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C9A3410A7;
	Mon,  6 Dec 2021 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yecbp0FxKV8G; Mon,  6 Dec 2021 21:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E84410AB;
	Mon,  6 Dec 2021 21:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECA391BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8A16404B9
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rH5PrVMaUIHI for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:45:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6496404B1
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638827094;
 bh=KDIjSnmI5VVtDnnZoLd1Iwd2hUs0/qltwJEUjqKs7Qo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=f8mz8NLcO3qdZsIDKq5/r3XBr303Kr3F7kKG5wZbcxsxr38jHRUebL7i2cBoUG33f
 cTk2JEEJK5bbWHfzgOPQ8U9MKS1juzeIQcOyNINxnOIHAYT2fFopFxXGDar32n/Nu0
 3GNB42BfQGjD47CS2Rgkvft77lpL83PjDjyEWDDQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.208.26]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1nBBom3jNN-00J1fN; Mon, 06
 Dec 2021 22:44:53 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 22:44:52 +0100
Message-Id: <20211206214452.510-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:s07DnK6WsAtLrTlVdJTMZeUJA9f2najwEoCAfLm25OIiTcDrtoM
 iKAFNfyPDYyl2UDK6OJxqpjYudnL/Ikq8q82g1rMutvOnTQERLUVr76ZQCpguk13B0DHeIM
 pfG+V3/mn5md5rQytm1dxsX/68dNfdJ8bJNj9tqcT83j+PrbCq/eBekoKVU3mbr7en8f9fI
 sfAR+yXK6VBz4ux0+KyBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LeLq+qvNL7A=:l+iJ6vmWnpmDbEdf+Q6mRb
 RSDP8tQMHsgW/AZOrNUzwn+Au3CVhI7N2PiODRPdYLgFHOW3qrBThiSxP/F/8an3DbfEzdwTC
 nxn1rx+g35VAWnVrASj2Gk+aoyl1FOWbsI6KaUsOK3NjHPS4Z/6WkXM1JIEZ2wXxSNN7luQrz
 A1A5onTGsyVUC51MFDFtS1oBNJTN9Hp4a3dvwD+t9B+Aj25HbBHpwSez2rJAU2WDNpDwuDDPJ
 9Mvji/ScRVRrtGwR3hXZHL3CI14uohbXp0BBwZ+Sj07fgzNztRCxVFJ5h7NijFZfMQwEZoBN6
 +k/bqEXxDZbHPE8XFOsJt3WE4fHj/XlxGjyjtM2w/dnZLZ5UMcoWyFdPFac9tj1vZ5FNn0X1w
 Z2GnQGpysh+IlPB7vRw9QkvaB9nA/NhAhXWSrzjrAPlm11YchpfaQyEH94yh4eb7PJDRbfcHC
 YISNfcTSvWBHOpJdwgjCYr2dK0xxSQT+BwkyLUVp4RP884I+YvqqhD5KrjJM7IDDb7JtLQZ/E
 49gbLlz1eaRi+54D7ECFviRua+fG12DklFnlWFF4D5tlSElF4GGETOBpB47DeerjxgMT1kAc2
 stbjxhL3cO6OXgQUwQb4uCKfbzT6iZMZpJOgogS5hBiFEqlwaIkD8r6rJX58TDV/qyJdDjwFN
 afFK1UnQQqaZVwtQ8zzieInW2oVjdPM8ymOrs+7TGqB6W1zVnrrIxrUnt7aFwd32gXDsQ5WRH
 FG1DyKRcGW3aPvc/0QI4gDcxNLunocZhtDFazZ3240uUtH28OOYe9XuIORWxvBKtNKT+OtjY1
 xPFPeSOLq8ULDiPLosH6BU0+VHHZk/SGvTCu6SGoIgrG2mDOmEvlwy909SNwyZ5YYn1IrZ6g7
 PX980/IYIheIqeqkMECoU0YM9xhVC7OwPbjQYB99/0Tstp+ROnoT48Zf4Omc5e1asDVashKqu
 lGtGKXl1OzTH5qw/qUbTCXzOVERIt0ZA9XG+I3wcquesVhCp2eB3T6HVg1jdQAKg2h3+o3qOT
 z9L4ceO0aLAweeTuG8PjHvdfIj/ct5240CUaLtjmQe1LLflgjEmh3N3AqnmZG8huZRi3wTns7
 KS4050/Q6KnWlE=
Subject: [Buildroot] [PATCH v1] package/iperf: bump version to 2.1.5
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog ([1]):

  - fix some HAVE_IPV6 conditional changes
  - fix SO_TIMEOUT regressiony
  - ren sockets.c to socket_io.c
  - fix compile breakage per abs() returning an int instead of float
  - support for gettcpinfo on Mac OS X (tested on both M1 and x86 silicon)
  - move setsock_blocking from sockets into PerfSocket.cpp
  - don't require -V for v6, instead try v6 when v4 hostname lookup fails,
    client only
  - add assert in writen
  - add tcp RTT variance to client output
  - use setsockopt to get the nagle status
  - show Nagle and TOS settings on client
  - more on connect-only testing
  - sample and output the initial rtt and cwnd in the connect report
  - fix multiple fullduplex regressions
  - fix for HAVE_TCP_STATS in configure, then linux compile
  - writen can have more than one write, fix accounting when this occurs
  - fix tos with --reverse and --full-duplex
  - add support for --tos-override <value> on server
  - add support for  --tcp-drain, add mmm stats, histograms - experimental
    feature
  - multiple man page updates
  - fix partial histogram print to not show (f)
  - some new scripts in python flows
  - fixes to incr-srcport
  - fixes for --incr-dstport
  - fix regression on very first UDP packet having transit latency of zero
  - fix --reverse and --isochronous when --trip-times not set
  - fix client_init regression, pull out tcp_shutdown
  - fix reporter startup race and one second delay by setting the threads
    ready predicate and issuing the signal under a lock
  - fix first send accounting for small -n
  - fix configure.ac to use '=' instead of '=='

[1] https://sourceforge.net/projects/iperf2/files/readme.txt/download

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iperf/iperf.hash | 2 +-
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 35ed2a10c1..bd5643af95 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  f1b7835eb74094b1a1849faeafe35b7c362f4ab5  iperf-2.1.4.tar.gz
+sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
 
 # Locally computed:
 sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 34cbe532fd..a3d95535b3 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.4
+IPERF_VERSION = 2.1.5
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
