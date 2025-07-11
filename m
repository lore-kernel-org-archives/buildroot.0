Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F32C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 11:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E428460E32;
	Fri, 11 Jul 2025 11:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtofvlP-CQ2l; Fri, 11 Jul 2025 11:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2214A6062C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2214A6062C;
	Fri, 11 Jul 2025 11:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C29F31E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B442C608E2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkATBEjJUm2b for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 11:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC586605B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC586605B0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC586605B0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:08:47 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 80B4A4408FC;
 Fri, 11 Jul 2025 14:07:11 +0300 (IDT)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd@kuhls.net>,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20250711104505.824628-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 11 Jul 2025 12:45:05 +0200")
References: <20250704165437.3687660-1-bernd@kuhls.net>
 <20250711104505.824628-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 11 Jul 2025 14:08:45 +0300
Message-ID: <87a55bougy.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1752232031;
 bh=hkM82FP1EnoZwBHZxfkVdjYvWnhcr9dccC5bUpjuFcw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QrPuMENmdSL9u3RfEsU88dQXPA3PxdtVgIA3w89JA9xcmFYLGtbvVmoStKFLIoW9V
 3Ut36+CUrL3XJCi5MhpYkf2A4SGNVnlrOYEYJsRcX7cQ3YvttxuK7mqfvQGUUszEA5
 6iG5J6KzCOIa6+eBzlMuWQ4+2xG3y7z7v9ff5haeBmArBlz8NxPsrMR7DEtwAAw3bR
 CooubUfGyBr4Uc44+n+qGDvKcmXzjWg7rUSTf5xMCeZvkhlJKqGBn6iY3nv9bPHbNn
 NK/V0TOBglULw+TnFmTnv1Du4C/m1dE0JP1IxCrIzyUUVNVrhrOq+k17i/LjV94wcZ
 nfMYdzZfqLuuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=QrPuMENm
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.5.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tomas,

On Fri, Jul 11 2025, Thomas Perale via buildroot wrote:
> In reply of:
>> Fixes CVE-2025-4575:
>> https://github.com/openssl/openssl/releases/tag/openssl-3.5.1
>> 
>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>
> Applied to 2025.02.x & 2025.05.x. Thanks

Not in 2025.02.x as of commit 946b7ff2280aa
("support/dependencies/check-host-cmake.mk: set host-cmake max
version").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
