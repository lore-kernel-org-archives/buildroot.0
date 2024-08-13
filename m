Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E38C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 07:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C5E081766;
	Tue, 13 Aug 2024 07:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdQ1itojjVxe; Tue, 13 Aug 2024 07:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D1D81772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D1D81772;
	Tue, 13 Aug 2024 07:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9764F1BF951
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 07:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84E6240248
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 07:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuCKc6y5Z4QS for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 07:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5186640207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5186640207
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5186640207
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 07:23:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 28E853520C9B; Tue, 13 Aug 2024 09:23:30 +0200 (CEST)
Date: Tue, 13 Aug 2024 09:23:29 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrsJ8SVroNPEWSXC@waldemar-brodkorb.de>
References: <ZrhLQMty5kRy7Oo4@waldemar-brodkorb.de>
 <20240812221448.40e4d87a@windsurf>
 <ZrsED1PkoKznI94O@waldemar-brodkorb.de>
 <20240813091927.32682ebe@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240813091927.32682ebe@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723533810; bh=D/ix88o8zq6z6UsJtt3tOVz+N57hWaCxsuloYdlzkLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPCoD49PwLxPnzG3HwdW3aM3GKRc6h9hI838wEvMPcUB0NwycqOwE5J4g1l84Obr+
 dTxw/YqMjrd8PqHusIeF1rF5JPD3gVZtN2QPg1CAXBm4RxzjxaQMSuzYgOUL1Zu20G
 4r4PrVbPsRHyDKJKa0G0Sj9QDJ6tr1Ig+sgymSXWKkKByG7BGB9rLzE/zMm6qr9VSy
 cTdOsC/67ydtOFV2Z0VUdGHrLw9pLOur+7Bfn021V3MMAvvPVxvmnho6lfNYSS8ERo
 mtwPINGY326d77iViH9O23HmaI6yWVvrlfMOspnCD9CZW4IwxC1szWX2dv8+NXNpEL
 CjaEBLcCVehIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=rPCoD49P
Subject: Re: [Buildroot] [PATCH next] package/hiawatha: update to 11.6
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

Hi Thomas,
Thomas Petazzoni wrote,

> On Tue, 13 Aug 2024 08:58:23 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > > Successful before your bump, fails after your bump.  
> > 
> > I only tested with TLS on, sorry.
> > 
> > It seems upstream is broken regarding ENABLE_TLS=OFF.
> > I tried to patch CMakeFiles.txt to add the missing sha3.c, but then
> > other symbols are missing. I added 5 missing files and still no go.
> > Uptream is not very active anymore, he mentions on his website that
> > he is doing releases, but no active development anymore.
> > 
> > We could remove TLS off case entirely and still have a small secure
> > webserver. What do you think?
> 
> Would be OK for me. However, if upstream is not active anymore, should
> we drop the package instead?

He is still doing releases and added TLS 1.3 support recently.
I would like to update it and keep the package. I can sent him an
email to report the issue with TLS off and see what he says.

Would you like two patches, one with URL updates for master and
the update and TLS removal for next?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
