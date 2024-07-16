Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4CBC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 09:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B14280E7C;
	Tue, 16 Jul 2024 09:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNNJN2NzouOO; Tue, 16 Jul 2024 09:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876CF8109A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876CF8109A;
	Tue, 16 Jul 2024 09:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9594B1BF870
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 09:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A1A40930
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 09:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExTzsNg5RwJr for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 09:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D21F940106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21F940106
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D21F940106
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 09:21:31 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 7E1BD44070E;
 Tue, 16 Jul 2024 12:20:28 +0300 (IDT)
To: Joachim Wiberg <troglobit@gmail.com>
In-Reply-To: <cb3adec204d2306b78347de3d5e5b9185103fc1c.camel@gmail.com>
 (Joachim Wiberg's message of "Tue, 16 Jul 2024 11:10:06 +0200")
References: <20240709202438.27298-1-heiko.thiery@gmail.com>
 <20240710231351.32389974@windsurf>
 <cb3adec204d2306b78347de3d5e5b9185103fc1c.camel@gmail.com>
Date: Tue, 16 Jul 2024 12:21:27 +0300
Message-ID: <878qy14rqg.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1721121628;
 bh=5RYnpUImyhZPC67cw59sxiAvG+ix3ss10cI6PglY+t0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=wLrYfNwmsO2hEYNWPRWEZnxEBctp4tEdfPI5IPbOTNJB955OTodxMF6CX6/9WOZtJ
 dL41teGX5ZU0VehCJ+YGVfqyT+5Q8kxALyZo1NmNQJU/ozbin28pMGcdbZBnbo9rsf
 LTmQZIihhHb92zGvJUpG93O5d9ARUVVOjB+YNIGPUTbTczQtRrn7WggtES6zHcztDO
 8VFZVsOjYKh+hvn6QPWey0Ch/tpjJ1zG3qAhy1nma7iEnZe9lUCBmlAJxl7v/MNH38
 aBzxqJbwIO35CJzVCsPSzOA2aLPmfaLMBRocYOr2LV8+PDB6YSVx9Aya/6aujdQMYl
 7gk7RRBMLmIqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=wLrYfNwm
Subject: Re: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joachim,

On Tue, Jul 16 2024, Joachim Wiberg wrote:
> On 2024-07-10 at 23:13 +0200, Thomas Petazzoni wrote:
>> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>> > This fixes link time errors, undefined references to various
>> > ENGINE_* functions in case libopenssl backend is used.
>> Applied to master, after adding a reference to the autobuilder build
>> failure. Thanks!
>
> We have the same issue also on 2024.02.x, as of 2024.02.4 builds with
> libssh break unless you update your defconfig.  So it would be great if
> 62103be918e7a155749b1b3b680a9e4ecba6af87 could be cherry picked for the
> next LTS patch release.

Commit fed58dac5dea (Revert "package/libopenssl: no-engine") should have
fixed that in 2024.02.4. Are you sure libssh build is still broken?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
