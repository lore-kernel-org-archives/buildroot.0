Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF96C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 19:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD3E4028D;
	Sat, 23 Mar 2024 19:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHow4zFic8du; Sat, 23 Mar 2024 19:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F0D40527
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F0D40527;
	Sat, 23 Mar 2024 19:01:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 433211BF2A5
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3118382353
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 19:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8JBaZeyz812 for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 19:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6543C8230A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6543C8230A
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6543C8230A
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 19:01:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 273AA60B2C;
 Sat, 23 Mar 2024 19:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDDBC433C7;
 Sat, 23 Mar 2024 19:01:08 +0000 (UTC)
Mime-Version: 1.0
Date: Sat, 23 Mar 2024 21:01:07 +0200
Message-Id: <D01D127N7TQ5.3I306UNF3JSIR@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <be88778f-53fc-493b-829a-2434ea0782ef@linux.ibm.com>
 <a043db624b2d3c57bf6f43c949b63e1b0d1dfbe9.camel@kernel.org>
 <72edf77b90bc03df925a5b3116c981e90a868e7e.camel@kernel.org>
 <D005ME2OYT34.NPTNEUOG5JFC@kernel.org>
 <72dda3ce-5cf6-4830-9f18-30a64a01af15@linux.ibm.com>
 <D00DINCDWI2B.1N6Q54IC0C3WQ@kernel.org>
 <267dc37d-86aa-407f-96e0-5be4d2464b13@linux.ibm.com>
 <D00FJ589HXI0.DRMQSWUMUDRW@kernel.org>
 <baa6bac2-394c-4dee-ac2b-65c3aebddd20@linux.ibm.com>
In-Reply-To: <baa6bac2-394c-4dee-ac2b-65c3aebddd20@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711220469;
 bh=XIKLv1Ja3w1Yg8H43vvMxblETFrlFvKfHXuFxorWMO8=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Tbuz2QtgO/EFLkggbPPMoE9MrsuffK8OqJSchk1hJ8a4s006bLftYwBpmww3Y0QBi
 OIBG0oj0HGOoWheQpvvCLGqO48pnJOLpZptI014m9fzdTGACu1LAjUH3tNexmRZ0es
 ir5teQBoHbTt39Fen6Ms5awBzVdWwJSTqAIdnZOoaBL1ZQSamItGO0+5PiR6/2SOmP
 1M1+R+jbOA28wN73pw1IOs+IMtcvSM9WmroXSYm60T3eZ8dvOWEisflUCigEbgOHz1
 X1WXBZzBqfYajhA87VzBzZ76XJWxe3Da643uG8NVFTKHdCRasex8FDTVj52j8iJLmG
 GXSioEAiHwxRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tbuz2Qtg
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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

On Sat Mar 23, 2024 at 4:51 PM EET, Stefan Berger wrote:
>
>
> On 3/22/24 12:46, Jarkko Sakkinen wrote:
> > On Fri Mar 22, 2024 at 5:48 PM EET, Stefan Berger wrote:
>
> >>
> >> I'll create v0.8.2 with only this patch.
> > 
> > OK, cool, thanks!
>
> I tagged it now.

I'll address the remarks from Arnout and bump the version, thanks.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
