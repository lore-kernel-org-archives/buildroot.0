Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CF9C87FC9
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 01:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6248B81E6B;
	Wed, 30 Jul 2025 01:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ny40-Kiwi2w; Wed, 30 Jul 2025 01:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7698581FFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7698581FFC;
	Wed, 30 Jul 2025 01:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A2D194
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 01:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F05C540902
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 01:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lY9GMArbxqzR for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 01:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCA34408D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA34408D9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCA34408D9
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 01:01:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D82E52003C3;
 Wed, 30 Jul 2025 03:01:16 +0200 (CEST)
Received: from [192.214.236.6:43198] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Jul 2025 03:01:16 +0200
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 03:01:16 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250728212614.37531-1-petr.vorel@gmail.com>
References: <20250728212614.37531-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <43de0eec2358debd402dc669592d6da0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753837278;
 bh=dEPkawS4JPsL9QVET5DScvlXAmFDEs+rxr/Ep8/gW6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N7AA9hT1FWlXaf/oo5ew0B5Z/Ppc8RgZoYmlY9wBLP8zjEwXzGutr4OR70odtVjl6
 SULvX+uEV7zZC3E7FrDhOu40umGOHRrAc7R8PFwCt7xlUL3kUXP0m+S7lCFc6PCVIk
 n/V3KSdM9IgDswKpg53T50wLKCWskjaEm4XEPF/gmV266nXAEJ0gJ+UXnvGjZxOQcu
 z6hUGF4cVm9kBOpBPs9+ieApu+del4RgTOZmA/eOuvtU0Bjabwr1Dp7aI4vXZcRoS2
 5IHpYMAaexKjkYL7CRs2Y0l7pvjG/rm3yWkic/NeMEgXJy1QUpcqhuDn7yuUDmNOKa
 d7nc8DlZidTfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N7AA9hT1
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Fix uclibc-ng
 build
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

On 28/07/2025 23:26, Petr Vorel wrote:
> Backport upstream fix.
> 
> Fixes:
> https://autobuild.buildroot.org/results/f3e/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20/
> https://autobuild.buildroot.org/results/856/856365f467efc449faee1951250e63d8d4442bbc/
> https://autobuild.buildroot.org/results/2ac/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a/
> https://autobuild.buildroot.org/results/59b/59b3ad33667b7e87c81e49dd434d5f494e189e0d/
> https://autobuild.buildroot.org/results/b1a/b1a36f9971c97300670d8d772ace11e5fedceaaa/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
