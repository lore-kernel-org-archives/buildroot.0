Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C764DCD4F26
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 07:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01C6380DF8;
	Fri, 26 Jun 2026 07:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeULabWJmw-D; Fri, 26 Jun 2026 07:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F28E80DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782457307;
	bh=52EY879RbsJrg9UFen30jhkcD8ngbMWlJ/umvuoRYIU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gIDwqH23AEHKKfyQE6XoCQQ3nOKrX8tQv85ftTnESzS1hYpyUuT5D/mexXi5OFoTp
	 TfX0pfS1MQzxAkdvyPZEBSFavYhXE6ycL/d9P++2m/T8S6QuLxVULPR9ilw4MKu4JY
	 Pj365ZNEl15W4/nYept2O+ohWnnottNGfD+oOebuZZUGxw8Hniro7AFusx5pQ9RGOs
	 wcf9LPFF0gtfSJjAdrIOsEhUuxtb5TuVg+uhK4uOUhvTB/UOSOcyST65g7ANnZPI2x
	 W1k7dp/tEdBsusBz8LZFg/mgsRUHBbhm3rff8Q0eWYIxXVRdgqVjMppkRko+hEIbKp
	 g2XzhY+jPLSpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F28E80DE1;
	Fri, 26 Jun 2026 07:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD042231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFA0380DE1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv2kLF9CQBbD for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 07:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EECF480DDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECF480DDE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EECF480DDE
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:01:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4923139e940so3490155e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 00:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782457302; x=1783062102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nGGcQi2lke2nrO5E4hdfhWfwyHZZmut0mMEiA2IaCXs=;
 b=UJy7bObgjcH1wHcAaZ/gMGj3kDMKZMyrqqDG3G+RlCLc/ZaLa3/bci+OYe6rAjQtxt
 smiX/MHuVw8Wqp0LRz06bdZUR3j2A7UDJ3Zryh48znLvTl3W93ditafjWZY3PkNMAtP1
 NSss8NM6UPxqxtk5VSK15ec75xNad4hwuM46P143CJn+tiGL0x+llXDg1mP09IIhupuV
 +4ik03HKUH+ukbW1FtWXeiZdnwInPAvILzebh7moGBHM8g9JrL+DD9YfOaIWsBmlqHKo
 WKMbY23/JSEZZ73i7We2DZARbD7p5miDlJ7ojeiveSR0/D4bdyUZ2iF30rYMl+LoYmKO
 Ci4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/o2V9igd+KL8bsSr6BGfKWjWuCAaKJLuVO1XaKLyMc4vyexEPPAhkkcIbet/hQSrtYmOY5IhxNkDg=@buildroot.org
X-Gm-Message-State: AOJu0Yz26fL8Lx48h3ZE9PdbiMZznV1Csk1enc8ZYYorJv59avUBf965
 pXuJIUKTARVvd9FEE2CxKxLcpKyWdy9dFibdnfDnsSyWHn8QSY6oKvySGbrLf12kZnw=
X-Gm-Gg: AfdE7clBDCxdpvWgJWJXt9iX0LTIe8JNBrRWfpN2KoQ1U7YPdlz2wTE4eiJJO4MGczi
 V8aAYQJr8IqnlK9U7iVh7b/PHtUQUOxJLSeb5I0OvrAqFctt1fOz+wgoXmwNdm/xiA3iews0Onx
 CHal7E59vd3cdEmgACo7Ai8aaE9868hk2aGvBwO+FYqWwBf1PcMILqhSIti2PomlYDnAYXD8Tkx
 xKx3iTaq7LlgYH/vkMAjEmLnhFWh7BcBRAZ4e6Gx/CRUkM/hlmnoYPkS+X3aUnVMCZxfSP8x0Qr
 7WhsbdIbtBy82CMTL6aidlJirK6PEUCSl+/cq2UwPWb8ATDeH4yz8ueXTPmn9gq2MYKTNHpzYGK
 dUaXeZLl2mzxBBrb8OwwhF4gLG6UnEmA1H6hh2h9PR6BTHm8fcXO+90k/DGRcsGzUjhA5o+Db6b
 gk341p
X-Received: by 2002:a05:600c:1551:b0:492:686f:372 with SMTP id
 5b1f17b1804b1-4926918e379mr41008165e9.12.1782457301987; 
 Fri, 26 Jun 2026 00:01:41 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269071d05sm59799195e9.11.2026.06.26.00.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 00:01:41 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz via buildroot <buildroot@buildroot.org>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jun 2026 09:01:40 +0200
Message-ID: <20260626070140.4195-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <877bnm7aye.fsf@dell.be.48ers.dk>
References: <877bnm7aye.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782457302; x=1783062102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGGcQi2lke2nrO5E4hdfhWfwyHZZmut0mMEiA2IaCXs=;
 b=Hwaorzfub+QL1cB2RvTYwvwDZ3YCwzIywkqELKpnbWCVnJlwVmGE3pj/M6UR7HmvhJ
 p2tdM5yowpQqvzcYy2eiUlDv/6MSEzspb2/zcIsrI53Qaky2HRBv5d7P8NxfxrY9IFeZ
 sF6z+1XwLBK1mXPYGWoEcoBV3/yQ/PzfSDDeHe+1fNgGGKCLE6zdI9RCGt1L8k05dUR3
 R/TylPQILdyCJXPhvMuOqWZ35ExMwul9206wM2ePX8IkkzOBTZecwxG3JliDgHGwZmcu
 cfsd9ilaPlVfHNwq2wXs2DM3Jqt7GkAPzGB0RChZAQw6rrgCiQJyj1ZFXR7F6EQ5cHCk
 5xwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Hwaorzfu
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

Hi Peter, Quentin,

In reply of:
> >>>>> "Quentin" == Quentin Schulz <quentin.schulz@cherry.de> writes:
> 
> Hello,
> 
>  >> Out of interest, why is that / what version of python does
>  >> generate-cyclonedx need?
>  >> 
> 
>  > list[] type hints aren't supported in Python < 3.9.
>  > As far as I understood, it needs to be typing.List[] in <3.9 but then
>  > it's also deprecated since 3.9 so not sure it's worth the trouble.
> 
>  > c.f. https://docs.python.org/3/library/typing.html#typing.List
> 
>  > From recollection, on 2025.02.14, if I remove the two list typing
>  > annotations (extract_cves_from_header and cyclonedx_patches) then it
>  > works.
>  > On master (and 2025.02.15?), I'm assuming we also need to remove the
>  > typing annotations in parse_uris?
> 
> Then I think that the pragmatic solution is to drop those list type
> hints. Thomas, I think you originally added them, what do you say?

Sure we can remove it. That line doesn't add much right now.
But would that mean that in the future we need to make python 3.9 a potential
target for any new changes ? That would be more annoying in the long run.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
