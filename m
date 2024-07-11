Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8B4C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 260C2411ED;
	Fri, 12 Jul 2024 07:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGKQBtGgFkpX; Fri, 12 Jul 2024 07:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2B26411F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2B26411F7;
	Fri, 12 Jul 2024 07:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE1121BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC298607C2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VU3UHCzMkflR for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83011607BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83011607BC
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83011607BC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ea7bdde68so1902657e87.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768002; x=1721372802;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dyDCZUrYw50ucOiY0+X3CcA+GrRplmb73pWiM7QDosQ=;
 b=nrZDDCvGglK082M3GgPNc+tZMJB+KIHjraUYV8saErnitCCMNjlQDLqEVaARHgU5Py
 lXyfJevfxJCs0aMl1HNyTsF0N2Q5gqlWg6+wPY88iDlX+JUUwoFcURHQiSehDC/aNmt2
 KcyRrSPtgiGc9WlU2N/U5VPLoKd8OjLOUqtmza2y9F3ClGfup+XAa5fpmJPFwW62qii8
 7s/qAMuPz3BCDAC8dlCRDCJeFQF1xzz1BcRgtToeudYqMNRZwdZB6hTBjGqOMqJO18v8
 Lc2Yi9nBc4qfidNOmTSCpAGLYHPu/IyRq7whI4JGoQPnTWGpBVET4484oXL9f8yKaCj0
 175A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc1nfBsnIcw80DUfdjPkrIlGFnGvikve8O/hmMFcw6WqIUApmZ6Qgarf7ghCHiyIwp9xiZBMvk2BEfS+wHCaR4S2hrSZUf+w==
X-Gm-Message-State: AOJu0Yw1BFix/IxXiEUKt2hYyFHTeSmBWwfHm1cCk7BKywQ8YOJeoLGp
 t+sqY2tKfrAKz1IFYDYMOHNY1UzpQmVzQpw+NXjUttkos+6wxYhbJdFSyHQNQPk=
X-Google-Smtp-Source: AGHT+IHcD1jT5nema9U9f92KjxdCpALX1CSR7OcJPtCJ2/vVxpT8uQm2soCbwANue01VPJG1WZoQ5w==
X-Received: by 2002:a05:6512:2807:b0:52c:df8c:72cc with SMTP id
 2adb3069b0e04-52eb99d1715mr7987098e87.43.1720768001942; 
 Fri, 12 Jul 2024 00:06:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23a000sm12491785e9.5.2024.07.12.00.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:06:41 -0700 (PDT)
Message-ID: <00011dae-3329-477c-8b45-793874be746a@mind.be>
Date: Fri, 12 Jul 2024 00:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Geoff Levand <geoff@infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <576922a7-90e6-4c0b-a03f-0225ddf175a7@infradead.org>
Content-Language: en-GB
In-Reply-To: <576922a7-90e6-4c0b-a03f-0225ddf175a7@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768002; x=1721372802; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dyDCZUrYw50ucOiY0+X3CcA+GrRplmb73pWiM7QDosQ=;
 b=gCxO9H/MCCJxIFeoOPdOiz1RfGMkmjNkyhn8Gu0e3nEN3jyvlpZFUffZOLBoZqxbyw
 yyLQFobpn+Ho+fSaZ2A84f9KFUijkTI5JAoZQcFOp7+duxmnSOkTxzBqNAHfrApLlj2X
 JkNpeVMEvyV/hqBcoo+p9P51Q8/u0ZI4WzZaECjsKCgN/YB+OyYCoticHpuBDK01mEqL
 LT0+Psgz3XH+NHKPVE/tCXcCkppGBbEWjvfmo1wIX+VtInBQv4Y0kG8EKaDvJxtp1TbT
 bfN3O7Zl0iUu3TEKEc696nDfGmSQtSSQW7wf2C/tjtMp6IiLubdKjDfRrPlamF83G0/S
 x/QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gCxO9H/M
Subject: Re: [Buildroot] [PATCH] package/flannel: Bump to version 0.25.3
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



On 10/06/2024 07:49, Geoff Levand wrote:
> Signed-off-by: Geoff Levand <geoff@infradead.org>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
> index 367c4f6ecf..b3caf907db 100644
> --- a/package/flannel/flannel.hash
> +++ b/package/flannel/flannel.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954  flannel-0.25.2-go2.tar.gz
> +sha256  73c832ab860ceae15d6f890fae7c71e265af4825f885b5c367a91bd884eb2c09  flannel-0.25.3-go2.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> index 317ad14ba3..ffbfad888f 100644
> --- a/package/flannel/flannel.mk
> +++ b/package/flannel/flannel.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FLANNEL_VERSION = 0.25.2
> +FLANNEL_VERSION = 0.25.3
>   FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
>   
>   FLANNEL_LICENSE = Apache-2.0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
