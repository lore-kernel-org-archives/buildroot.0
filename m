Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701FBC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 12:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E70F80F4E;
	Tue, 21 May 2024 12:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHvX2p15EkKS; Tue, 21 May 2024 12:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA6F80F52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA6F80F52;
	Tue, 21 May 2024 12:06:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15C761C5228
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 12:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02BAD605A5
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 12:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlC9wWX-ipeU for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 12:06:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADD2E6059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD2E6059C
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADD2E6059C
 for <buildroot@buildroot.org>; Tue, 21 May 2024 12:06:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE98061F8C;
 Tue, 21 May 2024 12:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876C8C2BD11;
 Tue, 21 May 2024 12:06:41 +0000 (UTC)
Mime-Version: 1.0
Date: Tue, 21 May 2024 15:06:39 +0300
Message-Id: <D1FB5V7D36KM.23ZP0JHCTE98F@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240521115727.25343-1-jarkko@kernel.org>
 <20240521115727.25343-3-jarkko@kernel.org>
In-Reply-To: <20240521115727.25343-3-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716293202;
 bh=9hU2pxAsKYELUrsJRPXykkGpbJrMfC1vo1+pE173o+Y=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=WxEFTDsGbR11Hv2fsRFjwx9ncF9bEwR14scWcIQwmpBXuFQGrHZ7srPG5Fa6m8GKE
 XDQqHwl4e3Ced7V59+ZZ93ii4F4P+wZphi9dxVNlbLrnLuqotmqLgeVP9Y9p375e9Q
 jsPmcnPB6CjZzXBTW2jvXzwEVJBHtOB7Brf8BMp4AAORoyhlHJDl4xaCKJJt72ObhN
 X4Wjf2ZBkqieP30P4EkSK1RTkZc85iX3kGvCYsa2NvO4KEG+lko4ebJdQs1sC6UQtJ
 v3VSuH1kWwnhMmisqs+jXSVB52ODyeuTcdf3znCr73g63r3tr+V0s2iZ5+O858gNP1
 qg1xw1z5q+gpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=WxEFTDsG
Subject: Re: [Buildroot] [PATCH v6 2/3] package/libtpms: add host package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue May 21, 2024 at 2:57 PM EEST, Jarkko Sakkinen wrote:
> Libtpms is a library that targets the integration of TPM functionality
> into hypervisors, primarily into Qemu. Libtpms provides a very narrow
> public API for this purpose so that integration is possible. Only the
> minimum of necessary APIs are made publicly available.
>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v6:
> - Remove Config.in.host entirely. Not required for pure deps.
> v5:
> - Config.in.host
> - s/"libtpms"/"host libtpms"/
> v4:
> - Changed in libtpms.mk to purely HOST_*.
> v3:
> - Use package deps in Kconfig as this just a library.
> - DEPENDENCIES and CONF_OPTS for the host build
> v2:
> - Use host packages in package/libtpms/Config.in.
> - Select BR2_HOST_PACKAGE_LIBOPENSSL.

I don't mind cycling this patch set as long as I don't do same
mistakes twice, and only do any other possible mistake ;-)

Good learnings given that I need to review changes to these in
the future. And yeah, most of the learnings have been really
carved into my brain by now..

And yeah, was a good idea to send the patch set so that I can
review also quota patches in the future. This address should
stick.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
