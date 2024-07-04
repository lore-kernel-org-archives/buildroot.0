Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCCEC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7ED44073C;
	Thu,  4 Jul 2024 12:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlRzyaGpHOsM; Thu,  4 Jul 2024 12:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B06A40748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B06A40748;
	Thu,  4 Jul 2024 12:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00DCD1BF321
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBC18405FB
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vW-FCiqs8Tkh for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9D5C40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D5C40139
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9D5C40139
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:41:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77c1658c68so39490366b.0
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 05:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720096881; x=1720701681;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AeE/AgS8MhLic/2IOr28yX8iqLAGVOrlCkhCtNT1WDM=;
 b=SLVDpCFqcVuXsaGgoHgHxAmeb3FhbNUM3iKDR2znenIRn6IkZzk8kRCQi2lLJ/AKsN
 oUg4xfW7Vkk6D7LcGMm8xbrVy3M631DA0OnwRkXUvcM99+QUmTS5J9jWipU713Yzjmz5
 eCm75g1OYsdYaFMCgpVmPFbS93z6WGHDocxHAiub4EgA4KvZ7iQGxVH+UxVKtcsku+bN
 M0KKjiTa5zdjyf5Uql2YqwkKzfNra2cECrArN4aPBfe9T3NwyxheN5JAARUNniyPD3KK
 n96wsiH+oeSkLGsXniYAsr7JEo+PRGJMchlooeJlSybLIfYHcznXUfQkVTdsYdloNsnC
 ew3Q==
X-Gm-Message-State: AOJu0YygHen1AJjlPDOoNKZkXxU5VFzhVb1dVTdtAx5u9KN07uuX7ACs
 uiFPIjNLc225024AQS/H8gUqHmjbAofPlV8BplYNuNVuNsZBzaZfMpf/ycpZ
X-Google-Smtp-Source: AGHT+IH7rCzVj/ktZUPwB4GICfUIzjgVa1c64ySZkaTrlqWTbb/DsC7w+1AkCmiYI5I7hoKNws+q0w==
X-Received: by 2002:a17:906:7954:b0:a6f:586b:6c1 with SMTP id
 a640c23a62f3a-a77ba712686mr125536966b.56.1720096881230; 
 Thu, 04 Jul 2024 05:41:21 -0700 (PDT)
Received: from gimli.local (h-79-136-22-50.NA.cust.bahnhof.se. [79.136.22.50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08cfccsm594449466b.148.2024.07.04.05.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 05:41:20 -0700 (PDT)
Message-ID: <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>, Baruch Siach
 <baruch@tkos.co.il>, Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jul 2024 14:41:19 +0200
In-Reply-To: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
Organization: Addiva Elektronik
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720096881; x=1720701681; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AeE/AgS8MhLic/2IOr28yX8iqLAGVOrlCkhCtNT1WDM=;
 b=b4odvQEeOt0+am82NdW4z5n8Ul/SEiGS7YPoGKmd0uLDJRrUTtKtmRZ1VzWPMT/Ar1
 pvSYniQxlQPdTUkV01pNGkwiEwCQssKBtvw01ARvhrYTFt/J6/SvUZjhIhZwNZVNrQec
 KDo4PVTSJ3KNCe2kePOsGvRBmrojN8XviaUUvmPdv5dLi0ke42Q67je8c+QwF8JUX4ok
 9Tk0/5i8/O1UwXwmiL4p8Y6XEBkZ4cQ/ETNMzc/zV1pdzI+o9rNJSWUpK4y6Ag4PehAP
 VDkAgKVi2hkGNxFJvx2Nm7Ibl74CoU+O8AIOSJNy+W8Rw7Rs6ZyjCb6Rfx1g4XX5uHEB
 rg2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b4odvQEe
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2024-07-02, Christian Stewart via buildroot wrote:
> Please backport openssh 9.8p1 to 2024.05.x.
> 4ac2cc5beec0eac4991fb28f286707a5659fa67e
> It contains a security fix.

+1 for 2024.02.x with the additional fix for sshd-session in

11d2ad31046263d80da5ff6b36c3d25b1bbc0d82

Best regards
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
