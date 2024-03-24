Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70358C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3888A405F9;
	Sun, 24 Mar 2024 14:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9JstdkhaE8z; Sun, 24 Mar 2024 14:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBF240603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBF240603;
	Sun, 24 Mar 2024 14:57:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 290E71BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15497405F9
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArcwAO1elr3Y for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C173640635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C173640635
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C173640635
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:57:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33fd12a06fdso2479477f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292234; x=1711897034;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ti7hSmj+fAgoEq/qqVn9P75SrF9E76w3vVLKmWnaX3M=;
 b=QxMVTv1RPiAn5AKTQ3N6+EMEGtuncI8NLLXZuZnlduWSyzWZO4c0Ivj0OFS0XzXEF6
 UcE3D403uyFNvW2VrqsrmFSBPBv1ZMI/sYvlBsMNofqIjJko62EDAZw2fNcoZeuTZUEb
 225pX4i6adfoKof2kbQ1D6Ms8ZVPjdfjqJ4X4CzNJDwADjsKnyHLZjCje/eMuyh6K9xx
 ALKm7/A0u85tjr1FlEnAGW903d0modZSE+RoKPgDyipdHmo29DYqrhduxFdOhIrXkG2m
 WtgPoEvK+6NnUKE1DMkE/GKy0lx6AepbpQgAjF4YVm09kexzszHARcbJr4IG/rpyKUZ4
 tOmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPPITLfhkxxi6FN3bJWy5nIbpD0tUbfSdf1tD8sE2dnoUSpzhK9JdCYetNpTbsYihlPjOF5xR9ZIfmXcxGP8bV8KC4XNC49A==
X-Gm-Message-State: AOJu0Yyo0M0duiOxCrXWg8JXvGvC1T2i59gkAnVqJJgtlkoTAE1X6cwJ
 nCi+p17rmZ6Cvzbtlukl7pa9XER0JsCYYMxEeTEfrvbyIXPj/xEU6iO2J/Thzhk=
X-Google-Smtp-Source: AGHT+IHABDqQfM4eOh/nF1htTW2zgVVAtOYFnBKHNPvNd1viVkpAegQI2RaTz7L7gPcegFhD3Vutvw==
X-Received: by 2002:a05:6000:36c:b0:341:bdf0:f86e with SMTP id
 f12-20020a056000036c00b00341bdf0f86emr3488247wrf.67.1711292234720; 
 Sun, 24 Mar 2024 07:57:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:57:14 -0700 (PDT)
Message-ID: <1ee009f4-f6ee-40b1-9b8a-e7d67e2edad0@mind.be>
Date: Sun, 24 Mar 2024 15:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324123926.584023-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324123926.584023-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292234; x=1711897034; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ti7hSmj+fAgoEq/qqVn9P75SrF9E76w3vVLKmWnaX3M=;
 b=D0uAFjNjAaThBHvYpWacCCuPYPNxF6aZt6+U9Ov4RweUMRLZjgudEbbCHXO7I/E2t2
 dpGabRlpYtzFHcysm8Of/CVLG/6QngT9PRcYEDjmxqdMExrU6B3SewmwB6GxOKxXCfAm
 wW0VMyYQGZ+NiwbUPcT8iETArBElZSK8XFTR3nKkfx+2pfMiTDj2zBqm2Cfs5Tvky4qQ
 cQ6Cc0lf7U3KVd+vL6rDOh8yqacSzpdIqx3M6d59wve+WZRqUR9131liDywqVtLok1iS
 X1A8fTBuMgXnQpEYihefgRH+qTM1Eis/sC93Jx/sYarhP/cJELNEMb72UgMvBbHcJ32X
 jfBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D0uAFjNj
Subject: Re: [Buildroot] [PATCH 1/1] package/mpc: bump to version 1.3.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 13:39, Fabrice Fontaine wrote:
> https://gitlab.inria.fr/mpc/mpc/-/blob/1.3.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mpc/mpc.hash | 2 +-
>   package/mpc/mpc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
> index 0520a7b9b4..f69a5b66ca 100644
> --- a/package/mpc/mpc.hash
> +++ b/package/mpc/mpc.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459  mpc-1.2.1.tar.gz
> +sha256  ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8  mpc-1.3.1.tar.gz
>   sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
> diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
> index 364e4c3c85..467bed4dbe 100644
> --- a/package/mpc/mpc.mk
> +++ b/package/mpc/mpc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MPC_VERSION = 1.2.1
> +MPC_VERSION = 1.3.1
>   MPC_SITE = $(BR2_GNU_MIRROR)/mpc
>   MPC_LICENSE = LGPL-3.0+
>   MPC_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
