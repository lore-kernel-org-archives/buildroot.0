Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0E6C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 07:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A244076E;
	Sun,  2 Jun 2024 07:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TViyf47S9rW2; Sun,  2 Jun 2024 07:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B5D407BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B5D407BE;
	Sun,  2 Jun 2024 07:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22CAA1BF3DB
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 07:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FAB7606BF
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 07:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N61QGcahREr6 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 07:28:42 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 884526061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 884526061B
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 884526061B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 07:28:40 +0000 (UTC)
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sDfdp-0000000FCwy-3wTA; Sun, 02 Jun 2024 07:28:35 +0000
Message-ID: <f01af2e5-4683-47e2-86d9-737f07279724@infradead.org>
Date: Sun, 2 Jun 2024 16:28:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Geoff Levand <geoff@infradead.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=RCcIFuq6mVsA10hv4+9A9rdO/3VXnjFFON0y7Ksw0pA=; b=iuPPQiaKTqr2m7QITAahusbzqE
 MSyMG2rT4XI/wZZAxzKKrijcplNeHp4b2MhllUMQJGzjabauAoNm08t3vOoxRZf9UaY482k4xgWlf
 VlZdWjMwXgdZ2wdlr5ZLmIkI02yj+gCOay0hqKS4MF4o9LY3LrKu9fdrbFrnDvUFGp3enchlmgUCu
 Kd0Q/dgI5onvFz+hggANcd1yiuBxO7N2Qs3MyjQ7AVHedf2/l5fz/4ODPA5gIgptFzbMi1a1JWRMZ
 TDK7yXRS/giTFZOhQC9WubWRCPT3RWpBU4y2Ozr0bnmr42nuXeCZJiFOG/Tq6zZx8rwwFHS7G31D3
 Y1AqXrJg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=infradead.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=iuPPQiaK
Subject: [Buildroot] flannel riscv64 build failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/20/24 13:06, Thomas Petazzoni wrote:
> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot autobuilders
> in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those
> build failures and sending patches to fix them.
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   riscv64    |         flannel-0.25.1         | http://autobuild.buildroot.net/results/d2be77d8b9236db45c4f3a558f3198f199c0c568

Hi,

I posted about the riscv64 build failure to the flannel project, and one developer said
it might be due to buildroot setting CGO_ENABLED=1 for the riscv64 build.  
The report is here:

  https://github.com/flannel-io/flannel/issues/1988

I'm not sure if setting CGO_ENABLED=0 just for the flannel build will solve the problem,
nor do I how to do that.  Any help will be appreciated.

-Geoff
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
