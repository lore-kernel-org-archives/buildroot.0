Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEA0D6C2B4
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7580402CD;
	Tue, 19 Nov 2024 21:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w110nIWmCJ9P; Tue, 19 Nov 2024 21:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92811407A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92811407A9;
	Tue, 19 Nov 2024 21:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA0CDB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA15A400D0
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4dOgb6_FFFD for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BD8540114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD8540114
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BD8540114
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:55:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0E3C419F5A7;
 Tue, 19 Nov 2024 22:55:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40430])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 22:55:26 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 22:55:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Olivier Matz <zer0@droids-corp.org>,
 robin@jarry.cc
In-Reply-To: <egtut4qkub4u4bruoraffjyszw57jwso2m64h57hf2tlaf6znz@vogkglwpkttn>
References: <31efd2663d1b8e193e49c0cc76113384@free.fr>
 <20241117201744.31404-1-vjardin@free.fr>
 <f878eb52507a883446a6a4284656b9ef@free.fr>
 <egtut4qkub4u4bruoraffjyszw57jwso2m64h57hf2tlaf6znz@vogkglwpkttn>
User-Agent: Webmail Free/1.6.9
Message-ID: <052bea652baf0a859c2144787c4afcd9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732053330;
 bh=v8k9ab4jZMh3itAS1aneVFKXIOPXjYyhD23AJVh1fmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=buDk/NbqO3gkLP+35FXiVN6t9fc+/VLyKpgLdJFMhwGj2lSv3C0epJF7dkc7JkVCR
 8ZT4l8nVMtG7rnamGNBRy4HUkMmURuyFaJuj/DrBT+FJ+gpayqKdypjIH2/+r787uY
 UL02KEB4o7emAt6cI8tCIva+ohddv/fEQANvwuPLXx2M+I+yDw6CBBXC/tluHJViJh
 VQrnmOfSdHjajxZojlSDKUWuD146EvRMFcV5SJIx8lEmf/DWeQxnqylLEH/ARHXOFG
 8fpSxbCMDYvLpGUrpVKc5YnzlvJaUNYfG6/94SVUdTix0VpZOlESRBW1NTUGhsKDLg
 sNRZLm3S+ct/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=buDk/Nbq
Subject: Re: [Buildroot] [PATCH 1/1] package/libecoli: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On 19/11/2024 00:41, Vincent Jardin wrote:
> Hi Julien,
> 
> On Mon, Nov 18, 2024 at 11:40:20PM UTC, Julien Olivain wrote:
>> I applied this patch to next.
> 
> Thank you
> 
>> 
>> After doing some testing, I had to rework it a bit. See:
>> https://gitlab.com/buildroot.org/buildroot/-/commit/ba65c4dd4b0745eecd5692bbeba82907cb0df5eb
> 
> Which tests lead to those udpates of Config.in ? How could I have
> detected it ?

For the minor corrections I made:

For the select BR2_PACKAGE_LIBEDIT, see:
https://buildroot.org/downloads/manual/manual.html#depends-on-vs-select
Then the inherited libedit "depends on" dependencies needed to be added.

I also tested the patch with the command:

     utils/test-pkg -a -p libecoli

See the gitlab CI output:
https://gitlab.com/jolivain/buildroot/-/pipelines/1549781712

This is how I saw the static build was not working. I simply disabled
the static build.

>> Now, I'm expecting to see a patch proposal for dpdk/grout ;)
> 
> I need to wait for the next DPDK release, grout has some dependencies 
> on
> rte_ip6.h which is not available into the release supported by 
> Buildroot
> yet. I could not find a proper workaround yet, so it'll be easier to
> wait for the next release.
> 
> If you want, I can submit a RFC/Request For Comment patch but you 
> should
> wait before merging it.

Thanks for the RFC patch.  I'll start having a look while we are waiting
for the next DPDK release.

> Meanwhile, I'd like to submit some few updates on libecoli, maybe DPDK 
> and
> there are some few dependencies on mstflint that are pending
>   https://patchwork.ozlabs.org/project/buildroot/list/?submitter=89131
> 
> Best regards,
>   Vincent

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
