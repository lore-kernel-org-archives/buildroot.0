Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13334C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 19:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 941646067C;
	Mon, 10 Jun 2024 19:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW66_1WsGdAa; Mon, 10 Jun 2024 19:08:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE81C6069A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE81C6069A;
	Mon, 10 Jun 2024 19:08:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEEB51BF3B8
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 19:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C820440654
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 19:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C62oId3Uq8aO for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 19:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C34104064D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C34104064D
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C34104064D
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 19:08:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AJ8GYv091096;
 Mon, 10 Jun 2024 14:08:16 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AJ8Gxv020764
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jun 2024 14:08:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 14:08:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 14:08:16 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AJ8GsT119861;
 Mon, 10 Jun 2024 14:08:16 -0500
Date: Mon, 10 Jun 2024 14:08:16 -0500
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240610190816.vq3vmlpzeaomecvk@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
 <d99de7e0-4775-4bd9-b60c-4ba79c513708@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d99de7e0-4775-4bd9-b60c-4ba79c513708@benettiengineering.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718046496;
 bh=p5qlglpw2iF889orlDHBrba/KARYKFBkBhTa9s5eQEQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bRGTv7/LkBMPTTI+ozpE5encYs0a5kHfeFpcbOUYxVq3GINAXcr0r1hLZ9cKrnKza
 X6AY3JjI18GsdGjIxgdhg1nBm/uatnMlTD1lCQ8SKL4NDrp9lFIl+YZ/cWAOhK8FSy
 p+YnsgCZWfV7zg7hV1dPlKsOiRBh1sozcNB5oyZA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bRGTv7/L
Subject: Re: [Buildroot] [PATCH -next 0/2] configs/ti_am6*: move to mainline
 Linux
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On June 10, 2024 thus sayeth Giulio Benetti:
> Hello Bryan,
> 
> On 10/06/24 20:20, Bryan Brattlof via buildroot wrote:
> > Hello everyone,
> > 
> > TI heavily encourages developers internally to work with the open source
> > community to enable all our SoCs there rather than develop these
> > features on our vendor trees. Because of this there are very few
> > features or bug fixes in our vendor trees that haven't been sent to the
> > project's source.
> > 
> > So for the next Buildroot release I would like to migrate TI's reference
> > boards to track the latest Linux release to ensure we will always have
> > the latest features and bug fixes for the reference boards and SoCs.
> > 
> > This small series moves the AM62x and AM64x to the latest Linux release.
> 
> You can't keep defconfigs without predetermined linux versions. The 2 TI
> defconfigs already point to mainline Linux. This is done for
> reproducibility. I don't know how  you can achieve what you mean to be
> honest.

Ah that makes sense. I guess if we need to keep a version pinned,
do you think some type of scripting in utils/ to update the various 
baseport packages be welcome?

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
