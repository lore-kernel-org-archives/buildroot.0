Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8C510ED66E
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 12:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1374170B;
	Fri, 27 Mar 2026 12:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-4iuVjM3a3F; Fri, 27 Mar 2026 12:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F003D41703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774616277;
	bh=CUim8AhmtiAKedmvnZSRSNQes8olZH9ZKMFP8kcPQCY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A2gmBzpBw6VjujafPY0nhNAhsCGqRXelSROwfJ6XFq84hzb/TI/drKuU3C10YujNM
	 EFAXmjMKFP9kL43F8nCkGq4r+GUBJ9JVPHZFj11ZcFftU2TrjIBc/QlW6BLVlQGFfS
	 IorUZVthsONZ5jrR3KDk5Rjn8f+/IHV4lrdsHJBKsz1rsBynbovkOl2yGbYYdQltG5
	 NiqEV57Tb3llQXUchw41/WMJJrBPRbknHpE6miIyBKLMqKtIi0U5Z8t47/efeL23Kd
	 kzOQEYg1tBO25YYCkmdjGSpPqeR9dIwAb4TLqZO0nA13jbvy9tOyuC3Lv6hqRdusSV
	 7c8UcCMjX6sjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F003D41703;
	Fri, 27 Mar 2026 12:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1228E1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 12:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0332760BC3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 12:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_6Whx1H3G7l for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 12:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.99;
 helo=out30-99.freemail.mail.aliyun.com; envelope-from=cp0613@linux.alibaba.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B57460BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B57460BC1
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B57460BC1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 12:57:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037033178;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0X.oLp9X_1774616251; 
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X.oLp9X_1774616251 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 27 Mar 2026 20:57:36 +0800
From: cp0613@linux.alibaba.com
To: ju.o@free.fr
Cc: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 20:57:31 +0800
Message-ID: <20260327125731.1037-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <50127bcac46304384fa17899ac8fd5c6@free.fr>
References: <50127bcac46304384fa17899ac8fd5c6@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1774616258; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=lIsaLtI9YIS2oqxMXO+7Jb3BmAxvMJRRJqydgFLubk8=;
 b=t3bX+tB01wkHoUikVvc7RrtmOeckcNzIirnsN14tLdHN/JLa8lUNNeBqf3cUhoAb97v1JP59/lzFEFmHv//RaHJhXlopi865KSEq5KmQWxcxZMD9IgtP29HcJxBKju3Rxfd/K6khIPc+qScRzq+6+chw2gADuAZ5TgpEi89C0AE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=t3bX+tB0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/ndctl: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 19 Mar 2026 21:51:18 +0100, ju.o@free.fr wrote:

> > From: Chen Pei <cp0613@linux.alibaba.com>
> > 
> > A "device memory" enabling project encompassing tools and
> > libraries for CXL, NVDIMMs, DAX, memory tiering and other
> > platform memory device topics.
> > 
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> 
> Applied to master, thanks. For info, I relaxed the minimal
> toolchains headers to 5.10. Looking a bit more into this,
> I realized this was backported to 5.10 and 5.15.
> See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/039c1ae13ec12f7cebddf86f37080d0a1fee28e6
> 
> Doing this review, I also saw that a new v84 version was
> also released, in case you would like to update:
> https://github.com/pmem/ndctl/releases/tag/v84

Hi, Julien,

Thank you for your review and help. I did notice that a new v84 version was
also released. However, I will wait for the next version (which should be
v85) to be released before updating. I have already fixed the upstream bug
in ndctl that you found during my code review, and it has been merged. See:
https://github.com/pmem/ndctl/tree/pending

Thanks,
Pei

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
