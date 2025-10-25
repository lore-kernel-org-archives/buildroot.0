Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEDCCCF9E9
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0604181195;
	Sat, 25 Oct 2025 19:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ld3ya2fyHBWt; Sat, 25 Oct 2025 19:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2442B80E78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2442B80E78;
	Sat, 25 Oct 2025 19:05:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8602D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 19:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5AC080E6F;
 Sat, 25 Oct 2025 19:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw6PZhahDa4G; Sat, 25 Oct 2025 19:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.184.2.64;
 helo=mx1a.swcp.com; envelope-from=hudson@swcp.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 690D080E78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 690D080E78
Received: from mx1a.swcp.com (mx1a.swcp.com [216.184.2.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 690D080E78
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 19:05:02 +0000 (UTC)
Received: from ame3.swcp.com (ame3.swcp.com [216.184.2.120])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 59PJ517r004409
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:05:01 -0600
Received-SPF: pass (ame3.swcp.com: domain of hudson@swcp.com designates
 216.184.2.83 as permitted sender) receiver=ame3.swcp.com;
 client-ip=216.184.2.83; helo=hachi.swcp.com; envelope-from=hudson@swcp.com;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
DKIM-Filter: OpenDKIM Filter v2.10.3 ame3.swcp.com 59PJ4xMq054602
Received: from hachi.swcp.com (hachi.swcp.com [216.184.2.83])
 by ame3.swcp.com (8.17.2/8.17.1) with ESMTPS id 59PJ4xMq054602
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:04:59 -0600 (MDT)
 (envelope-from hudson@swcp.com)
Received: from hachi.swcp.com (localhost [127.0.0.1])
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTP id
 59PJ4wRl3612788
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 13:04:58 -0600
Received: (from hudson@localhost)
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Submit) id 59PJ4wuT3612787
 for buildroot@buildroot.org; Sat, 25 Oct 2025 13:04:58 -0600
Date: Sat, 25 Oct 2025 13:04:58 -0600
To: buildroot@buildroot.org
Message-ID: <aP0fWpti-9PiGKxn@hachi.swcp.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.86
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4
 (ame3.swcp.com [216.184.2.127]); Sat, 25 Oct 2025 13:04:59 -0600 (MDT)
X-Virus-Scanned: clamav-milter 1.2.1 at ame3
X-Virus-Status: Clean
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=trmm.net
Subject: [Buildroot] [PATCH 0/2] package/shairport-sync: Add support for
 AirPlay2
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
From: Trammell Hudson via buildroot <buildroot@buildroot.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These patches add support for streaming audio with the AirPlay2 protocol
to shairport-sync.  Configuring AirPlay2 support is optional since it
adds several other requirements such as ffmpeg, which may be too heavy
for some systems that only want to stream AirPlay1 music.

It also requires the nqptp helper package that provides not-quite-PTP
time synchronization for multi-zone audio.

Trammell Hudson (2):
  package/nqptp: Add version 1.2.4
  package/shairport-sync: Add support for AirPlay2

 package/Config.in                        |  1 +
 package/nqptp/Config.in                  |  6 +++++
 package/nqptp/S90nqptp                   | 24 ++++++++++++++++++
 package/nqptp/nqptp.hash                 |  3 +++
 package/nqptp/nqptp.mk                   | 31 ++++++++++++++++++++++++
 package/shairport-sync/Config.in         | 15 ++++++++++++
 package/shairport-sync/shairport-sync.mk |  5 ++++
 7 files changed, 85 insertions(+)
 create mode 100644 package/nqptp/Config.in
 create mode 100644 package/nqptp/S90nqptp
 create mode 100644 package/nqptp/nqptp.hash
 create mode 100644 package/nqptp/nqptp.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
