Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F4D26D60
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 15:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B95A4093E;
	Fri,  9 Jan 2026 15:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1leRNooV9mI; Fri,  9 Jan 2026 15:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B1D4056C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767973603;
	bh=s5gpNu3DlxpiGXNaPabMuywRRz0F/vkujWPlv4eZAXM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mr+YT5WypP2DeeV82YVg+xm6L/53QFlpRxL8il+Ovwd1yoTaAUkTCmTpTqrv9ExuS
	 DtRb9BrEk551ay/J+nDgZJnS7/AfpuyXIi56p6G835dEK0sZXzOFmYsQOY3BMm4ATa
	 cis1Ro7l5ILnDFvx5nViedPyvcUXTHzymY8sjhw3DdDN84oH5AH1BoOz0UzB/T8z1t
	 qbGxhfhxQ+yuTeIzkM6dKgJUKr3jQ2Mfjw2i11SLyxBb6bAzDIgJdeDmt/lUz+cdGv
	 9LLpwloz1canTjtNdOyAXyBWesRSPr2OvwyaKmOvfwB7tS3yA6AFXHrR3ZCglIvCWT
	 G3/H4u4KG16KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7B1D4056C;
	Fri,  9 Jan 2026 15:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50D8D131
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 15:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 434B9813E7
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 15:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igqjwGnz7zzV for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 15:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D926812B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D926812B5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D926812B5
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 15:46:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so1391778f8f.2
 for <buildroot@buildroot.org>; Fri, 09 Jan 2026 07:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973599; x=1768578399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/rbO53k6PeJ1FLbK6bAHV5SzERozvrIjRM0+nn8GxI=;
 b=lzwpT6JezhiUeJHp/7yibaowKI/ioNlw2wwnqjG64/l5sYN1cNUSGMyZFTEISaAlNj
 UrBcZVSX/3jpMh8nt2Kln6JjuMehHSxSiHODyDg6xCVkY05reNG0315L26FlowkSwS/+
 s7LzYocXdEITiluhgCmyrwcAIHhoP6shzY8noMSDgDLmI65WQiun8TcciILWGfwQ1JSv
 ZbURlts1pF5hzYpyTYQeIpN4oZaf3n7mxyn9IORHHfOYLWHRf7m4gqp65M5MqVA/e6x3
 BsSA+tBatJzF8QlgQa6Zy3oPVYclmeIwEk9m0hkQBIAsDF47/plNZTwpBnW9mdUSYr4h
 K/qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqLnB0f0IP3EeqBqLK5HiCm6KeZQBG9WXuJlQBjVhl6gYPy1FHd8bdLJUjKxnlzmpbfDW4BPfcMvE=@buildroot.org
X-Gm-Message-State: AOJu0YzVK2t9Jkiu1PooWOQdtVkEHUwlfjuyP8439tVfpwW2tiaeYInD
 j/9uQzkKw2o3kcdfHc4ROQVd9UQG5URmlJSZsYrTOwO9mLH+FJ3brpzvqy7qbvlm09hVYIZcKtW
 MmowK
X-Gm-Gg: AY/fxX5idNnfpIOu75tnDy2OwnnIDenHLerRoVMErmY+fJKHQCeIii41Y5gXC9i+9D6
 WPOJy169hRujtL3qQkYj4TQIUx1HCIblwBimE03/AhWpEl4B5PU6sVqzD3kW5s03e6i7rL9gi5c
 Md4KC+4lIqkBAP8GpkGcaqrXTqqjAFOeO3KINTt3fq8E990TEpZIWor/1UZ0/af9bm/GEUl5yXZ
 exzWIi1UuitzS9/5leCNGtonEC9smFNeI1Ss8SeNeFTqj1bZPIxVV3m06CaCW1O5jPZzYjp3c3Z
 hS+i299SXAiUqBgwVfsDdRrl3WuEs6pZwLEIx7lkFU+1td7ToFVNB/PqnDoT6JaMOtSebwYnNQl
 AjlxRpskCpo8ZdjvRWLlAeUSnqdMC9d3HB8m41YximIJ15JJZTvInm3WQZAoR0KKLkgeKhkKTdV
 74kky73TpJgEKXE4tOUJxt/WWKW1wXyXRGQs4=
X-Google-Smtp-Source: AGHT+IEDlmdzCTMAfwsLuMC65UQNzY6fkB8RRO3aapyhWDha0paJDAYXaEsfbw1lZ7R4wsdEpNaHCw==
X-Received: by 2002:a05:6000:1449:b0:430:fa58:a03d with SMTP id
 ffacd0b85a97d-432c37a9c79mr12886973f8f.63.1767973598701; 
 Fri, 09 Jan 2026 07:46:38 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacd1sm22663845f8f.4.2026.01.09.07.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:46:38 -0800 (PST)
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  9 Jan 2026 16:46:37 +0100
Message-ID: <20260109154637.287873-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <be0e78c7-77eb-489e-92ef-d506eefb19de@gmail.com>
References: <be0e78c7-77eb-489e-92ef-d506eefb19de@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767973599; x=1768578399; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/rbO53k6PeJ1FLbK6bAHV5SzERozvrIjRM0+nn8GxI=;
 b=BeqC6Qcwa/hSTPAvrTWW/gbsNP/fuPzFcWv8AJ1JjWH16PJbrb9SMTGn/Xi8kbbR3j
 cOyePAdcaEmsxmgu/1pD8WvqlouErXtxYE3Imak0O8MBPkBwhDBt7GPM4N85+xtmvrCk
 N239un0CdK/bfkKX1FP2FkpsYlq5jR71VutbpsLAHY0LS7m05oPYpeCRpWlS9VsBcnPd
 P2sqmcbJYn5TCF0F+2mzmZHkzy4yDacIV8VLnYfRHY59oOHOUCTg35Z6RuhI9vAWCwQ6
 LgbuAt7MRnCKKxPCNck41EMKzCPjFIYGVqLBNxLiykbMUzaycr7gY3AOW7vBIG4BgA5k
 CHgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BeqC6Qcw
Subject: Re: [Buildroot] [PATCH v2 1/2] package/softether: fix various build
 errors
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Lance,

In reply of:
> The first commit fixes build errors in the package and then next commit
> removes the package? Not advocating for keeping the package, just looks
> puzzling.

This two step commit is useful for the maintenance of the LTS branch. This way
we can cherry-pick the fix to the LTS branch and remove the package immediately
in the master branch.

Another benefit is for users that may need that package at least if this breaks
their build they can still get the fix somewhere.

PERALE Thomas

> Lance
> 
> On 1/1/2026 10:37 AM, Thomas Petazzoni via buildroot wrote:
> > On Fri, 29 Aug 2025 09:45:06 +0200
> > Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
> >
> >> This patch add several upstream patches that fix build error we are
> >> experiencing on the autobuilder related to host-gcc15 and gcc14.
> > Thanks, I've applied both patches!
> >
> > Thomas
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
