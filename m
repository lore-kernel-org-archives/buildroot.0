Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1F4D18133
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF90400AD;
	Mon, 14 Oct 2024 17:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1qkpmDFnw2U; Mon, 14 Oct 2024 17:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D5F402C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D5F402C2;
	Mon, 14 Oct 2024 17:16:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C287E1BF359
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 17:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE4CA60774
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 17:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nj11iC5jFOxp for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 17:16:05 +0000 (UTC)
X-Greylist: delayed 903 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Oct 2024 17:16:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66C2D60634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C2D60634
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.52;
 helo=sender4-of-o52.zoho.com; envelope-from=aaron@bubbl-tek.com;
 receiver=<UNKNOWN> 
Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com
 [136.143.188.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66C2D60634
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 17:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728925249; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aL3BhYYqITgD2EC2ZWcl4SRMsGdw8rJIbOuQi0tl3qZAPODw0si9+zEv//wBNX1UdETLMHxMF+FRRelG4mWjOsotQ+KGV7EftL3qJULAZGGXzavhpS7bTZac0AVdfUpC0pkEGmcPw0b+4P2LpeUmVnjXFpA2n1q4CgXOkWSyWlE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728925249;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=H0a1Nrm1zACZj+2OERaBI4YSNNfG2QMLvVTIlJNiD28=; 
 b=ZuUK05cxsWlS0QGPyYgA6rrzbcheg91gWt969DHWgYBX14bH2Gm45+0UZwvZakV/TN0yNrGtvOR63Awg3rMWNRouonACIfX7j0J6yNWzZ+cPkUHDrh7wp1ku2Y6m55A3mE5Pn6xNPg/+4RYwyYz5581G3WlCvrdIJdv+widmUTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=bubbl-tek.com;
 spf=pass  smtp.mailfrom=aaron@bubbl-tek.com;
 dmarc=pass header.from=<aaron@bubbl-tek.com>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1728925248600183.36995647934725;
 Mon, 14 Oct 2024 10:00:48 -0700 (PDT)
Date: Mon, 14 Oct 2024 12:00:48 -0500
From: Aaron Sierra <aaron@bubbl-tek.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Message-ID: <1928bf9ac30.11026c2a5160620.6141190462172193061@bubbl-tek.com>
In-Reply-To: <Zw067nX__jWPkt2d@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <Zw067nX__jWPkt2d@smile.fi.intel.com>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1728925249; 
 s=zmail; d=bubbl-tek.com; i=aaron@bubbl-tek.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=H0a1Nrm1zACZj+2OERaBI4YSNNfG2QMLvVTIlJNiD28=;
 b=zB8RmNkmzXn/gp5GFSr/LwyP/XgbRkNEugnz4zKazNqeXNrv2rpLkSqbDYIFVsDc
 ROCrKA4IXzkHBMrqZJsxgjKL2ib5cYJ7sSMVLi95lWmW2p4/YDWLDKKbuQjzvjbUfEL
 BonkHMjwPa+uWW69j/FZ7dpZvOfX5iJX4t8AO/xE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bubbl-tek.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Cc: Andy Yan <andyshrk@gmail.com>, Andy Yan <andyshrk@163.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---- On Mon, 14 Oct 2024 10:38:22 -0500 Andy Shevchenko  wrote ---
 >  
 > Can this be pulled eventually? Or is there any comment I have to address?
 >  
 > -- 
 > With Best Regards, 
 > Andy Shevchenko 
 >  

Hi Andy,
I contributed the {mem,mmio}_{load,dump} commands to your repo back in 2021 and had been considering submitting a package to Buildroot, since I find the utility so useful. It's the first package that I add to br2_external trees that I work with. Thanks for taking the lead.

There are a couple of things that I noticed in the patch that could easily be fixed.

1. Despite being tagged as v1.7, the Makefile VER_MINOR is still 6, so the resulting binary reports "version 1.6".
2. It would be nice if the package populated command symlinks in the target filesystem. That could be done in a number of way, like using an explicit list of commands maintained in the package Makefile (iotools.mk) or adding a host-build dependency and leveraging the --list-cmds output to get the list of embedded commands for linking.

-Aaron
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
