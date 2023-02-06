Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56846C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 09:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDA7340328;
	Mon,  6 Feb 2023 09:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDA7340328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plfCAuFP2di2; Mon,  6 Feb 2023 09:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2AAE402F3;
	Mon,  6 Feb 2023 09:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AAE402F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C83F51BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A165360812
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A165360812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-hEmgcX-eji for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 09:46:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2C460759
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2C460759
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 09:46:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 877262000D;
 Mon,  6 Feb 2023 09:46:22 +0000 (UTC)
Date: Mon, 6 Feb 2023 10:46:21 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230206104621.5445bec9@windsurf>
In-Reply-To: <20230131133626.638374-1-marcus.folkesson@gmail.com>
References: <20230131133626.638374-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675676783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMrXFbvHDTWgcHDkZzHdHNim3LCfyZSRupxigWDDNPs=;
 b=iHKTf/REdmjnVBXSqqj32CSeymU6JfcdDgHrFaaMHANvjroD1kKEQ4V4No0VXFU1cPV9D3
 uQaZuPd6fHCRVm/eCGpcUJQB//R9a7SRl5WkCTAlie8GdMJtxRKSXyw8Tv06bonmV+O+mV
 QqDRFseiMTcZiwfu4bcIE2Iwiki3ygGIBQhXBJ3Nll2Ubb4oLJtrqRkrR0u14f/ZOndSz0
 sT+zt8J8TZPMAZoEk2b/t9BFaWqN1wKJ6JB63ri0LnUmN3RjH+aPfb5zsGD8octncsYydM
 QPApOFfZE/le9DYcFTEcwWpSo0EN4cX2c3Z/AWCXl1Fy3dBo86xXytZgh+vvTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iHKTf/RE
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: fix overflow
 conversion error
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 Jan 2023 14:36:26 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Upstream commit:
> https://github.com/raspberrypi/libcamera-apps/commit/a65682a97e19f96b86aeceb3ca3befb1687e3861
> 
> Fixes:
> - http://autobuild.buildroot.net/results/758631a9fcd62835844f78914a36dfb579e7beba/
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...ass-VIDIOC_QUERYCAP-as-unsigned-long.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch

Applied to master after adding a link to the upstream commit in the
patch itself. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
