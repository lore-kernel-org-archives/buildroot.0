Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4C6C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0FD821B7;
	Sun, 11 Feb 2024 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-vup5xQDJQA; Sun, 11 Feb 2024 21:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91EB83DE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91EB83DE6;
	Sun, 11 Feb 2024 21:27:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2F0D1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB38341832
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wfq3How3ani for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04EAA4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04EAA4011D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04EAA4011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:27:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3550CFF807;
 Sun, 11 Feb 2024 21:27:42 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:27:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211222741.501ddbc4@windsurf>
In-Reply-To: <20240209210801.880001-1-fontaine.fabrice@gmail.com>
References: <20240209210801.880001-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707686862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bjk73/Mc3diFjhhQYnqXR8U/RYM5bQjC3MxgYbf/ps=;
 b=Y2+k/BWNh9rcQgjIIWuCsUl2QfdV9H3UCAowCbs/wWE5OPyZfKk2pqqdNRfPsoI1laspI2
 IwUGRKFNJxGDhaQZLbwS9nLA7DWfApXgd86ZW6Xx6MGmhUs0b2uiN+ttuv+FtGkMvObRWM
 ZSZfEhJq0POGR45nG1ucjo0E+AydPrErBycHzjdrrUWYXbj1vWSWGnzaW3d0oLZcCbg7Ep
 NQg4VSAtkD0ouR6RKeABBw8CZQ2hPPbsR4bHg+p4irlxEtFaRR6L5srSAvaZ92SLjGkCDE
 Fi3ka0jBjVykrmIqSxoTF9CkgR+y7I/MmqQwLWRMwAH2nFDaPow0Yd/+lkcWBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y2+k/BWN
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Feb 2024 22:08:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 13:
> 
> In file included from /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/lib/cal/database.cpp:7:
> /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:86:24: error: 'uint8_t' was not declared in this scope
>    86 |     static std::vector<uint8_t> read_cal_data(const std::string& key,
>       |                        ^~~~~~~
> /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:14:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
>    13 | #include <functional>
>   +++ |+#include <cstdint>
>    14 |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cc52f2ed4fa43fe9c92713eb8561afcba29e12f3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...h-GCC-13-add-missing-cstdint-include.patch | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
