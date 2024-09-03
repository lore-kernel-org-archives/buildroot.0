Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F16CD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6A240549;
	Tue,  3 Sep 2024 21:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuNxOBeDZQxc; Tue,  3 Sep 2024 21:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30684052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30684052D;
	Tue,  3 Sep 2024 21:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95A441BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90D1E80B6E
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5qOnAm5WWs3 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:15:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0F28808A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F28808A9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F28808A9
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:15:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bbd0a40faso38687095e9.1
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 14:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725398113; x=1726002913;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Bk73oDQ0PHXx2LOPBlM8BYAfEs36mGWqB19tiSMqhY=;
 b=qJ2flkvvHUj7H+T1/+sVE5Tpao4/zMgXCKyuyqnUgGvGltq/TIBVaiL67SKBvNPGB/
 F1UviAyzLjODKV9ozbZVg+nCF+GXf4oY5iY7B22v6d7H/eySgJXcA/Xo0MJ4Hw3VFjzs
 zVn8CC/Z45GbhvoosvVvBjsAbJXqdNu0kdgUGVbBBI3cBnc0HXH/j8t2Nq6GbeLHyPQ4
 zkQ0K26qsAltMBn0a5aek3utg9rGUpB7UhWpmADdZF1bQQp7SAQieaKx2Pg+GmqRnX4i
 nhbEG0rOQdW31rlVfM/1gmi+b33/+HlkNogmvIKAkj3i5OrK4Vg8MdhI23pkLW6zgG5p
 h9qw==
X-Gm-Message-State: AOJu0YxJM1Wn7WP6DdWg7Lv6rm7U9+EAJnjhV6pKsl8OBXeCWw1Kvkyj
 8Gc17fI2t6VFdr3ylbtHrVGEFby/qe63YoO42BBUeNYGE9itJPoYW7HGhQ==
X-Google-Smtp-Source: AGHT+IEAge6kSAn5vCypTrngLKale3zzkZslyiBt2YuoiGj9Py9wd9q6nm0cqwwovr8JEyypHvEPhQ==
X-Received: by 2002:a05:600c:4ecb:b0:428:e09d:3c with SMTP id
 5b1f17b1804b1-42c88108630mr35044255e9.33.1725398112450; 
 Tue, 03 Sep 2024 14:15:12 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6f9b584sm181092415e9.16.2024.09.03.14.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 14:15:12 -0700 (PDT)
Date: Tue, 3 Sep 2024 23:15:04 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240903211504.GA817719@pevik>
References: <20240902181743.528003-1-petr.vorel@gmail.com>
 <20240903230222.0019371b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903230222.0019371b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725398113; x=1726002913; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Bk73oDQ0PHXx2LOPBlM8BYAfEs36mGWqB19tiSMqhY=;
 b=R0Crmrjz8TjjzsAJMYKsySTO41WI2/AJyi4OcylqAwJ+NrvZnn5NkuqzYD3sR8h4yd
 oSYG0FtnNKTBkwkZi95NszbHRLCPioHZZrsiJhSPzjfxHRLK4mu/H5K7+Hy1XfDAwPUZ
 D/TGMWpjoAqDtE9nt3J5tOc2irhxVlpZOnI7Ki0WnpaSvm1CZ709RyO8Wfgp1ZkdnwJf
 akkZK98G9F+IR/mI7SPLcygHsGYmNPizAHLeFVWsbyTTxXaa7NgX7G7tk5PNSC6ltBHK
 LUQ1v5McApJJNT8zuSc+ag9v5TlgZCZMz1JepIcV90S3alKRR1YnFQ/HLay/L5Hmzhyt
 kfrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R0Crmrjz
Subject: Re: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to
 1.6.2
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> On Mon,  2 Sep 2024 20:17:42 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > This version also reintroduced COPYING COPYING.LGPL, therefore add them
> > to IMA_EVM_UTILS_LICENSE_FILES.

> It would have been good to explain here why the LICENSES.txt file gets
> changed (since you change its hash).

> I fixed that up with an explanation (after diffing the file
> before/after), and applied to next. Thanks a lot!

Thanks a lot for review and (again) improving my patch!

Kind regards,
Petr

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
