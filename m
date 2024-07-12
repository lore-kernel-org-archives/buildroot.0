Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961C3C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA9C408CF;
	Fri, 12 Jul 2024 13:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uO7ofzwsKLpu; Fri, 12 Jul 2024 13:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D78410A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D78410A7;
	Fri, 12 Jul 2024 13:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 478DE1BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34ED560651
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7niPcPHCV9on for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6B5E60652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B5E60652
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6B5E60652
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:42:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso18552515e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720791722; x=1721396522;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFx7I5mOs4y8Lj4FjwulImB54tzOFL4yDA5Zvj7BymY=;
 b=xEhw4SU47dljlpj2Y5+TuoKfkdXP2rXz2veOHnG7a9sGsgg8lBKNPqxRI+5vxcaBUc
 mN4XejruRcvEywoiumiBnSLoCjOS8CmMVvUXECNQamphAxZ2wZ2DteMAoirR7ISF6mXj
 QFb+/wBAxJWWXNL27Y4VBtxCUMXvszVaP1XDIPTpCz6kIdELgZYu71j5qWaVkreton6L
 IM40a9moI2HG7JdqjNzhC9ydle0J8QM2bCyt8ZXTE7LLettTQMhCY1G5h5NNOQms7YCK
 PNmGRziARc50Db1Ny0IkadnIe7Iha39ORhIwAOJTbHPw5wK5d3Q2XKlOjeJg0UjFhDV5
 gYVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3sUVA9qruVGX4w1AIfEradwom5F62JelZw3Dz02xnCAQ5KVSkgScawjXNz1fSMD7s1K06oJBV63pteBPWdzWIkNwzzkKQGw==
X-Gm-Message-State: AOJu0YywRNyOQDNYSZ3KyfNea2PLGuZlvxF/MsawIIuvykgNGgybV/Gh
 uAUmtG6B/D/Iul1fo6060/Ono46Sj4lIpF1DScKQnF6OQkX64aVBsN+V2j+g8wQ=
X-Google-Smtp-Source: AGHT+IGnHBGpSjLV3aduN9uM5Gvo6cbLK8adwMcfM6hm9c5R+5iEEIDilflLYZuHwRLTYKS6i6KjMA==
X-Received: by 2002:a05:600c:4196:b0:426:5b52:84fb with SMTP id
 5b1f17b1804b1-4279dacef9amr24646885e9.7.1720791722143; 
 Fri, 12 Jul 2024 06:42:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368051abcc7sm1467683f8f.100.2024.07.12.06.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 06:42:01 -0700 (PDT)
Message-ID: <bae05249-8ad9-4acc-90dc-15c783e8e921@mind.be>
Date: Fri, 12 Jul 2024 15:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720791722; x=1721396522; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DFx7I5mOs4y8Lj4FjwulImB54tzOFL4yDA5Zvj7BymY=;
 b=FVOq+nfEgaXu0Azb0yuWtunLNbaVMjLECJftUue+DE2btz26WlWoQtU5uyyhC4Ip9c
 KYfTgTN9jIUznXQx+rTTUpY5y05s29BGfY2GeRGWd4MxvW9I6qF2AxV7kFFAtkd1ss4V
 AQpsAcowDy+uJEj6nlg0MJDXticvJWemqopf9r6xoliYRFcZrdGiFpXFmvHz/Cd8FaYk
 ra1CNlsDVl4Q3AIOOXKhgzWatsAcm5mbpHvjV9kqy9/HtuYXY/Gg6xoBMtWLkgzMvv+Q
 UadEkMOmfNROXL1+rZvPs9WW3G78rSoJIQpbO8aAIjXK5QkhbaRQu8gnzanq8c4YzEHG
 kmMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FVOq+nfE
Subject: Re: [Buildroot] [PATCH 0/2] Fix fail2ban
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
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2024 23:32, Angelo Compagnucci wrote:
> This series fixes fail2ban not installing configuration files in /etc anymore.
> While fixing the problem, I discovered a bug in the way we invoke the
> pyinstaller.py in pep517 compatibility.
> Basically, pyinstaller.py will install data_files defined in setup.py
> and tarballed in the wheel inside the directory pointed by the --data parameter,
> which is nowadays pointing to /usr of TARGET/STAGING directory.
> 
> I consider this wrong, because the data folder shall point to the
> TARGET_DIR/STAGING_DIR to be correct and we shall trust the destination path
> expressed in the setup.py.
> 
> In the case of fail2ban, configuration files end up being installed in
> /usr/etc/fail2ban instead of /etc/fail2ban.
> 
> v1 -> v2:
> Fix signed off with correct email.
> v2 -> v3:
> Fix commit author too
> 
> 
> Angelo Compagnucci (2):
>    package/fail2ban: fix data_files installation path
>    package/pkg-python: fix pep517 data files installation

  Applied both to master, thanks.

  I added the Upstream: tag as suggested by Fiona. Still, I think it would be 
good to report the issue upstream, so they can take it into account when they 
eventually get around to migrating to a pep517 build system.

  I also changed the order of the two commits, and removed the Fixes entry from 
the one in pkg-python.

  Do you know if this issue also occurs on 2024.02.x and 2024.05.x?

  Regards,
  Arnout

> 
>   ...001-setup.py-fix-data-relative-paths.patch | 73 +++++++++++++++++++
>   package/pkg-python.mk                         |  4 +-
>   2 files changed, 75 insertions(+), 2 deletions(-)
>   create mode 100644 package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
