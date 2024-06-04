Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F4C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 11:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D76C400FF;
	Tue,  4 Jun 2024 11:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvN7LgRV-1-A; Tue,  4 Jun 2024 11:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D6274010C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6274010C;
	Tue,  4 Jun 2024 11:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 408BC1BF83A
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 11:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D5934010C
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 11:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89r1Ex5448jX for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 11:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D384B400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D384B400FF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D384B400FF
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 11:21:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9477FFF807;
 Tue,  4 Jun 2024 11:21:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sESE8-005zSZ-2g;
 Tue, 04 Jun 2024 13:21:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20240603200025.1246055-1-giulio.benetti@benettiengineering.com>
 <87wmn5fd1w.fsf@dell.be.48ers.dk>
 <64d16992-68a4-4781-85e5-28338045b526@benettiengineering.com>
Date: Tue, 04 Jun 2024 13:21:16 +0200
In-Reply-To: <64d16992-68a4-4781-85e5-28338045b526@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 4 Jun 2024 12:48:21 +0200")
Message-ID: <87bk4heyxf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/esp-hosted: fix build failure on
 Linux 6.8.12+
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

Hi,

>> > ++#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
 >> > + 	hdev->dev_type = HCI_PRIMARY;
 >> > ++#endif
 >> It would be more robust to make this conditionally on if HCI_PRIMARY
 >> is
 >> defined in case this ever gets backported to earlier stable kernels,

 > This is a good idea and upstream still have to merge. I've checked and
 > HCI_PRIMARY has been defined during Linux commit
 > ca8bee5dde1f02c2dbe8c8453dce27f2dfafb21c as a rename of
 > HCI_BREDR(Linux 4.8-rc1).
 > So I should deal with HCI_BREDR too, something like:

That could be an additional improvement if the rest of the code works
with such old kernels, but not really related to 6.8.12+ support.

 > So I'm going to rework for upstream, so once merged I bump here in
 > Buildroot and drop this local patch.

Great, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
