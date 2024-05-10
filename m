Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D0AC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 310C042BF8;
	Fri, 10 May 2024 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0iEQc7xTHOA; Fri, 10 May 2024 21:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3012C40643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3012C40643;
	Fri, 10 May 2024 21:03:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA131BF295
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73A544242F
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFzKNtg5hcKn for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25654420A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25654420A1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25654420A1
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:03:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DF8FFF804;
 Fri, 10 May 2024 21:03:04 +0000 (UTC)
Date: Fri, 10 May 2024 23:03:04 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240510230304.6894cc3b@windsurf>
In-Reply-To: <20240307160204.1923757-1-neal.frager@amd.com>
References: <20240307160204.1923757-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYtif9vSXMBhjw72DJ3HfGc4RZ0o59yiyeehVL7lSl0=;
 b=WxL2hz3Umy2q5D23SGfLBF5ZR6SyWqvL5jRZQm0SS6CwQzCjDDNRM6Yfrm2Raz/+M1amsI
 iNMgF/7BrjeIR0drlM/k6grPzGHDCQjr+X7ee/d61wlAxybqa+sAVuQSMtM1bQHrLJZcSS
 2NCXNTKuiYtXRMLjyQ1OyXEytI37JriRosO+LnaPCYB5yq6BPAPVdpaFkC/ss77k6W0KcR
 b53i/0epaBYMbKxFRnyl9q+UjJni5n6vyEKb/G98l21NpFlYVT5ZZrc29wTEjfwMS1C3J8
 AcHNFuPsT6T+BL7Ms3RssKelLCx5FiyrfuvHUpk5nZHnJcW2FYEnZ2GVmfBMXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WxL2hz3U
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: apply
 binutils 2.42 patches
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 7 Mar 2024 16:02:04 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Apply the same patches to binutils-bare-metal as binutils.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/binutils-bare-metal/2.42 | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 package/binutils-bare-metal/2.42

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
