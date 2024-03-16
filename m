Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCFCC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56714400D6;
	Sat, 16 Mar 2024 20:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0J_HFuKkWcDo; Sat, 16 Mar 2024 20:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73F9640141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F9640141;
	Sat, 16 Mar 2024 20:00:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC9D1BF294
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08B276066A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akgYejumdFBB for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 20:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 771A6605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 771A6605D0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 771A6605D0
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 20:00:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3A47C0008;
 Sat, 16 Mar 2024 20:00:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlaCR-000Ymg-3C;
 Sat, 16 Mar 2024 21:00:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240209210801.880001-1-fontaine.fabrice@gmail.com>
Date: Sat, 16 Mar 2024 21:00:11 +0100
In-Reply-To: <20240209210801.880001-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 9 Feb 2024 22:08:01 +0100")
Message-ID: <87wmq2lzg4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/uhd: fix build with gcc >= 13
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc >= 13:
 > In file included from /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/lib/cal/database.cpp:7:
 > /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:86:24: error: 'uint8_t' was not declared in this scope
 >    86 |     static std::vector<uint8_t> read_cal_data(const std::string& key,
 >       |                        ^~~~~~~
 > /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:14:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
 >    13 | #include <functional>
 >   +++ |+#include <cstdint>
 >    14 |

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cc52f2ed4fa43fe9c92713eb8561afcba29e12f3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
