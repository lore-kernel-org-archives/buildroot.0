Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634BC83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 19:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8435B40F17;
	Tue, 15 Jul 2025 19:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fh-ro8Gtk42e; Tue, 15 Jul 2025 19:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCA5140EC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA5140EC5;
	Tue, 15 Jul 2025 19:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9994911AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 19:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F2FC40EC5
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlKrROylmO7Q for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 19:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A90940EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A90940EA0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A90940EA0
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 19:23:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AD481B0055A;
 Tue, 15 Jul 2025 21:23:40 +0200 (CEST)
Received: from 2a01:cb1e:33:3c7d:d7a8:5eb2:1bdc:c756
 via 2a01:cb1e:33:3c7d:d7a8:5eb2:1bdc:c756 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Jul 2025 21:23:40 +0200
MIME-Version: 1.0
Date: Tue, 15 Jul 2025 21:23:40 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <725a89cbad59708b94cac3eddb422dc5a0d305dc.1752554987.git.yann.morin@orange.com>
References: <725a89cbad59708b94cac3eddb422dc5a0d305dc.1752554987.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <73df7afc8ce6058344f3704689bdfa51@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752607421;
 bh=medtcJLAxWYyrA1NBCqsFC3cVnHnks+l7m8KjeMvj7s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QEHxcA/QMxHFYgj9hGqHXxbInUxv76B1xsCVGvoGpsGn5kc6km19+U9RQQOMoK76a
 y6rA0cey2rsEhr6WfePDUOmBAgaKIxUEh3EEqxAxFaa0E1HuDiJQVNadicd/lPrkTI
 nxfiaidoJcfOUtCDa/uBlbBMt7TBYgVO+MO0ElVxFpwhXkeP8MylNyhY2bAUh7GNC5
 0NqX+jN0AEC5vpzf5jr0Sn+zEnLaDjRD/KbycrlW9bykQIbw/rElT7O7vWGaE72+D2
 AZ7FN7w9LPmWdDLRcDmRAY86PldhDqfQhik+dmBfvQJJhC+5b6KTWVLORAl+RMOZiP
 RxjH5tZ3IxevQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QEHxcA/Q
Subject: Re: [Buildroot] [PATCH] package/passt: needs headers >= 5.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/07/2025 06:49, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Upstream passt only documents runtime dependencies; and they advertise
> being able to run on kernel 3.8 or later. However, they do not document
> the build dependencies.
> 
> As reported by Julien, since 2024_12_11.09478d5, upstream requires
> kernel headers >= 5.0, as they make use of linux/vhost_types.h, only
> introduced in 5.0.
> 
> Add a dependency to kernel headers, and propagate it to podman's passt
> backend.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
