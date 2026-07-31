Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85391C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535B7410D7;
	Fri, 31 Jul 2026 12:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Km-NjIwdE-Cu; Fri, 31 Jul 2026 12:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802EB410C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500520;
	bh=moAx6IQ+jfTYGUrb6eznZz/qa3YKXdh/htQqwcGlu9s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q+1aM0tZVuRIjHQ0sY7gF+rqhm9K/u/Zic32in+9Z/dkdcIUVDytX52DgvY5q6Ye8
	 Y2l9RbbL+MmGWvVVjHxIpTdoWn+ETp1ak8Kog4WzvPXbucfSxVvgJ/1ebuWv5yABeQ
	 eBnIQBkMfok2cKPx1Jc0LDDKSUvb6yy+XG5J5dSN7JkovLMYLeHesNMjq/e6Zdz3fl
	 eRE6LA+CYMcU1fQUa3bGkwitNKy2OVi1UEvGHrVYvo+472U/bKat8iS2N/XMxVcHqn
	 W9B82udLdROEwMqSpkDZEt7zh9LPwKNBp7XVRqmbu/zGxHdIz4fuXW+rmpUsb2Z8Hh
	 Gd07pwGjizqVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802EB410C4;
	Fri, 31 Jul 2026 12:22:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 523D52E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4453B40463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX48o_7KiiOC for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38AF840470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38AF840470
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38AF840470
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:21:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c1f5208b38dso162294666b.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500513; x=1786105313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AqCFH52khaqSJwcEmDDeOuhvXmybLO+XX7fzh2ZRFrM=;
 b=mFlaq2QWhtOeWk4s3X0pqQaRy2Cs4HmCyMg+mKOdbwFKqW8kmNFMwr6DFJ+WpQbfUU
 OFISTrBNUHwNBZY/zN3DesNkP3Agq+25mT+JQolNLkCDzwoS8Hr0HhM4otRQgEv/jBRU
 O8Imr6+f+2zvTrI/kQ33n8pB41+afLxfgZK6tTAZuoLncRKb4S6GvqYXxPpAA8Fy8Fw/
 m6kiFaslRoErNFjbN6u1CFmWlV3G8Ja5O70oNg8iSZave/WtyWhztJWBcEZiOMQne8Pj
 83s/5Lq0V5yHsmn4q44RwWn5T4R+5CIgvm/ehy/SAnkL3g+LObot87LIZSVmhld5+7J6
 MjpA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoS3mz18BJA9mrjIYcR4LcIjAJl1yeLexRU8HAIX9J3oLUBGUeaU16oxbhPXrSssnbKq9ryqDcxLJA=@buildroot.org
X-Gm-Message-State: AOJu0YwAI5h5imt7wYeqE9Sr8ZOF6bg6Kq8Bzr3TUyChswi1oWqcCGXb
 a7ImZzlQ/6LPOe1Hjc5fUOPlAM/qbYwDeNhJ6E+H1gtdzoZvcJSMzNazKjyjGFPlTTM=
X-Gm-Gg: AR+sD10wzyZWfujslIljo89xDuQYr/FR/96kitm9AmQ7nnVoU5qCEVzGVZijTkW5hTn
 Dzd/wG+7bPofdNblPYYuILqSjOaivYzOYUHvSV82Wy7FuiMDx5/6D2mmBKXBBt0uvsEMlFlngzY
 C9CUwG2esCaocuL5+jLd+wiOppIuB767if1Lz4ZzQZ9EMdpUptl0ZrIJSBNcSmgmy3hvUasZGZC
 LvUBgVkB+nj7M+7gFtI7ZIKN794h8bT8uOBd/rgIetduetYw5XT12EXWmVpivt1BRSdOTRDh+HM
 pvSMGu0wbBcVn9iidhO+jld7DJ380Vrm/fO6RPyzfhbcOPDaVOBG/99sejfMw2whXuUjHapYUok
 tRV+OlmWH1m8xycESu41ZMpgxD/JlCGFl0U1ri2UZHciQxfWqJxNvHLikaF/APGan3ybMnWjg+W
 tLaT8IZnotSRqI19eVjTxmXe3Sp5TpNVDWtqPAEhvs1Wu1aoRBlLHJmqS6+MjaS5gYe7pyAz0gt
 AVEu3eocfvtJfSjK9v+NA==
X-Received: by 2002:a17:907:d1e:b0:c12:b2db:873d with SMTP id
 a640c23a62f3a-c1fd238c91dmr95421966b.5.1785500513035; 
 Fri, 31 Jul 2026 05:21:53 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41cfdc6sm4330934f8f.8.2026.07.31.05.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:21:52 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:21:52 +0200
Message-ID: <20260731122152.155524-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722205142.674788-1-fiona.klute@gmx.de>
References: <20260722205142.674788-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500513; x=1786105313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AqCFH52khaqSJwcEmDDeOuhvXmybLO+XX7fzh2ZRFrM=;
 b=HLDHIoRNXCSHgTZTktXiplbVHfOOaN/bDvZ/wYS/0kDFVwQv8a5zAyMbGb1Djw1X09
 S3hfG/BU8sR+Z+iB7jQno0PuDxNeF39kNnB9hBJztyaymGRnZDynehTS6ygeBGYnSj9e
 0YpwpdMur9rK+M5C1wshMbPKOTcsa2uvwgt9Xz6oW2i7DZ9Rv23ulaYtDmO1+lPC7EqT
 CmZ2ZPq8klqLLtXm6ziA7eyCdvs+WQofFWvx+AoBJihiD1YAe7JtdUatRfrE+lCPBhvi
 rly80VfTZ3UCeo/e1M/Me6d1nIPEvpQiQpGrgS7+0hhdMWLQXYCMicSTJrnUNfk4a51G
 4vcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HLDHIoRN
Subject: Re: [Buildroot] [PATCH 1/2] package/ugetty: use correct SPDX
 license identifier
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

In reply of:
> BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
> in the LICENSE file, and LICENSE.0BSD matches the 0BSD license text
> [1].
> 
> [1] https://spdx.org/licenses/0BSD.html
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.05.x. Thanks

> ---
>  package/ugetty/ugetty.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
> index d3424bee42..6214498094 100644
> --- a/package/ugetty/ugetty.mk
> +++ b/package/ugetty/ugetty.mk
> @@ -6,7 +6,7 @@
>  
>  UGETTY_VERSION = f1b7858778800b7256e9874f266c1d16ced22a6e
>  UGETTY_SITE = $(call github,ryancdotorg,ugetty,$(UGETTY_VERSION))
> -UGETTY_LICENSE = BSD-0-Clause or MIT or CC0-1.0
> +UGETTY_LICENSE = 0BSD or MIT or CC0-1.0
>  UGETTY_LICENSE_FILES = LICENSE LICENSE.0BSD LICENSE.CC0 LICENSE.MIT-0
>  
>  define UGETTY_BUILD_CMDS
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
