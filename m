Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04F8D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 673FA401EF;
	Sat, 26 Oct 2024 21:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKLvUALTi38k; Sat, 26 Oct 2024 21:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C454016B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C454016B;
	Sat, 26 Oct 2024 21:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E295C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1335040169
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ilv8rvyszRp for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:27:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F5704016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F5704016B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F5704016B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:27:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4B9DC0002;
 Sat, 26 Oct 2024 21:27:40 +0000 (UTC)
Date: Sat, 26 Oct 2024 23:27:39 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241026232739.471f9dc6@windsurf>
In-Reply-To: <Zs7Q89h62j3hCq5x@waldemar-brodkorb.de>
References: <Zs7Q89h62j3hCq5x@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729978061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdqU4HW/2Yt1LvLaq6GVYacTnp7ePkPYNP/BhfA/8ZE=;
 b=W493gJieCBfhzNzfoS7YIBToEH25rKVp66ETj599m9Qhb+OsOypwNpQUyn9yfqpt7r7flv
 R3YFaAMMnOsuPabty681Nfp6GGOA8vY2uqYBsAFRq1TfjC0zY5OfOB/aBbNjZw80Uuz2Jx
 0YUZ0mv7uaM9eWSxyyT2ZL2NfU1ho3TAr93YuM3SQm7adgvc167X0DK4iT62ENFiOyYzPc
 qRs42oNOw4QzioV1+nRt8y3BsNMHOl+czMxHOEvtNcQoDteYrchtqZ3zG32aC8ut64C2RM
 AftqQ8QO+gmHUeweu2et5dXcooKWAx9x8Kdb8By/c/bXdrNNWDLvn0expv4Q/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W493gJie
Subject: Re: [Buildroot] [PATCH v2] package/file: fix musl compile issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Aug 2024 09:25:39 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> It is not totally clear which update is responsible for the
> breakage. The breakage has been occurring for as long as Jan 2022.
> Therefore it should be backported to older supported buildroot releases.
> 
> Add a patch from Gentoo people, also reported Upstream to fix the
> issue.
> 
> Fixes:
> 
>  http://autobuild.buildroot.org/results/abf/abfe66cec3680d396c5774ba492f34599e513edc/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - rework commit message suggested by Thomas Petazzoni
> ---
>  .../0001-file-seccomp-fstatat64-musl.patch    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/file/0001-file-seccomp-fstatat64-musl.patch

I am not a big fan of non-upstreamable patches, especially as the real
issue seems to come from musl itself (as acknowledged by Rich Felker).
But OK, let's move forward, so I merged this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
