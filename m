Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9076C25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 13:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C80B8204F;
	Tue, 28 May 2024 13:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfvAfTjF5krT; Tue, 28 May 2024 13:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D09882051
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D09882051;
	Tue, 28 May 2024 13:31:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB1721D2844
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 13:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBA4640592
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 13:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzbbpYsC4Cu7 for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 13:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0DB04058A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0DB04058A
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0DB04058A
 for <buildroot@buildroot.org>; Tue, 28 May 2024 13:31:12 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 30D84440159;
 Tue, 28 May 2024 16:30:38 +0300 (IDT)
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20240528132218.2307479-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 28 May 2024 07:22:18 -0600")
References: <20240528132218.2307479-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 28 May 2024 16:31:08 +0300
Message-ID: <875xuy9i77.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1716903038;
 bh=v+bS0B92127UDpXov3dou/hz9TGh7XQrszwAZSldBQk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sjMLQZD2j8OjmUPg3SVfNBuYR+9Qb/CxZxG6VcMbb/EskOTybdbNnLWZ4x+XJI2DY
 jp6h+V2ngMKDw4wBh1Xr2CQVLWAxkNYncZUPV5Lz6cnMtG2buLo28LluLeOmowiaqs
 KzEKQw5Zgf06trxvDQzckowWi47KWkAgPbBF3c0MmI1z2lJRrVf6FU+4ZTKz6E+AED
 LHbku2okCKc2Ht4TdWiVot1ev5fzhowFnV7XTEBG8ApmJs78HyTCCdxWMKAGPYD48N
 S4xGDBFwOiwkz+F5dopC47p/QNJzMgw8c7WeBodBWfrkmtrfqLDcO3IqNjBttUv5A0
 mPORmGj+75CuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=sjMLQZD2
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: switch to
 async/await format
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Tue, May 28 2024, James Hilliard wrote:
> This requires python 3.5 or newer but is a bit cleaner than the
> previous coroutine method.

This requires an update of BR2_PYTHON3_VERSION_MIN in
support/dependencies/check-host-python3.mk.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
