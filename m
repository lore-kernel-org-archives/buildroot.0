Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E0C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A91606F6;
	Fri, 16 May 2025 11:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRVZtmVogxxg; Fri, 16 May 2025 11:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A67336071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A67336071E;
	Fri, 16 May 2025 11:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D78B13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F1EB60B0B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUq_7a7qVM3O for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC3CF6071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC3CF6071E
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC3CF6071E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:57:42 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 2190D440B04;
 Fri, 16 May 2025 14:57:18 +0300 (IDT)
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <1e53f695-653e-4506-82fe-3ed97d468b46@rnout.be> (Arnout
 Vandecappelle via buildroot's message of "Fri, 16 May 2025 12:41:26
 +0200")
References: <20250415141711.1940219-1-lancethepants@gmail.com>
 <1e53f695-653e-4506-82fe-3ed97d468b46@rnout.be>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 16 May 2025 14:57:38 +0300
Message-ID: <87ecwowyx9.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1747396638;
 bh=iA7ZB1en+3sbyGYFcGpJxIHGzEMaFQDvzKs/4G/JDwI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=wte3Y6YYZatn9x006yPfT+rKKjuIKiKl/9JzG4Q1NmlWZw3leniV3Ak+Bq/9rtqRz
 MBslMUAm43hJk2rEeRdZvvAyKSfqKzXFrPJAwN9csg1bOKqHFdXh64t0B8Q4fJJ9rA
 sxWuPyhAbI/z58kWMKCjbZfwIEZrcf9Ko7baPB8kKLIrLpqfw0fKw8Qcz1JmEkVCFq
 M1LO+myVyDS7RhGnz/h/Y6jTXGv+lTIDSeuxnN/gq1i3AZ3lhnVY4d5Pw6zOJy8UPc
 puwxGIYw9eJ8RI22hKC+sitGWB3LM/dAqDZrRt+jcNrXgaMoZQAyFKfKRlp9kYdwhB
 c9nDKu9CNmyuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=wte3Y6YY
Subject: Re: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.91
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Lance Fredrickson <lancethepants@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Fri, May 16 2025, Arnout Vandecappelle via buildroot wrote:
> On 15/04/2025 16:17, Lance Fredrickson wrote:
>> From: Lance Fredrickson <lancethepants@gmail.com>
>> Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG
>> Release notes:
>> https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2025q1/018079.html
>> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
>
>  Applied to 2025.02.x, thanks.

For some reason, this and all your other commits to stable branches are
signed off by Thomas Perale. Is that intended?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
