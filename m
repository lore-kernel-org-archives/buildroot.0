Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2260C25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 11:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A18EA41727;
	Mon, 13 May 2024 11:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckEfhsgM0AtI; Mon, 13 May 2024 11:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5772D4168B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5772D4168B;
	Mon, 13 May 2024 11:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0539F1BF479
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E673382503
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBw5qgch2kAr for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 11:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE6BB82496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE6BB82496
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE6BB82496
 for <buildroot@buildroot.org>; Mon, 13 May 2024 11:44:59 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2b516b36acfso1130561a91.2
 for <buildroot@buildroot.org>; Mon, 13 May 2024 04:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715600699; x=1716205499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obvCeH+SJY3JfpAFLizjh1B7zJb+0S6d/2jFrMp9/c0=;
 b=q7slFqImKPMfDsO8TDm7TGXp54hIoPe+SfgcukHarAOecqoUmQSaBK8GDAFRpOlXHC
 B7saDpjy17pvB0yLxKsLNzZd/MxbUU05Y3K3fGltv1gbK5nzE3igJGP/3ogC1fGiQSHu
 yX02pZsIxs2SDHck+imsb1DaQ3EE72MXSfkxcgP5bBpuyTwBDsIagyFKdpea2eHCfZ+k
 pEejdQizIOYIBjFkqqGa9v1ae/Aj1YcfMWuTnyrU7yaNm9KJiUpWTcJJ8uCTBAfuHuDL
 YuV5VIKEfMlf1qWtTjCZS0pCM1MSAAVLPthCkaS7voujgHO2WWdgY+AShmnpncNHjBnl
 N4vw==
X-Gm-Message-State: AOJu0YzpJ8BkwkgSrCn++RbBxh2NiXl4a7MIy0BwYyydRPcd9TVa2UQD
 5iCD3HHE7acJp7BTQsdpJk+HL9inUyVQFxZZnaOUgaZyTMkYzH1GY0qFvLwUVlN+C35eSkZTv3K
 zHUz8wTtXJFJdGBFC6KCm9FKiUE8=
X-Google-Smtp-Source: AGHT+IFAwHX825VL3Mirqy8/ay4aV8nfPVQHPfLgZv/zoIB1gs2gzRUbuX2zUK3chzCNbjDz8mo0JNj6Y7XlL7rFtrY=
X-Received: by 2002:a17:90a:7308:b0:2af:6b92:ff6a with SMTP id
 98e67ed59e1d1-2b6ccedd5d3mr8622295a91.3.1715600699319; Mon, 13 May 2024
 04:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BFKyfF8WpZC9W=1uH0C4mNzZfHTADJTtDc4epxdnLDCg@mail.gmail.com>
In-Reply-To: <CAOMZO5BFKyfF8WpZC9W=1uH0C4mNzZfHTADJTtDc4epxdnLDCg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 May 2024 08:44:48 -0300
Message-ID: <CAOMZO5Dj5ivyM2Y89LMbKvOpc4BQoC8M5behSLDzy7nMMk4WJA@mail.gmail.com>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, 
 Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715600699; x=1716205499; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=obvCeH+SJY3JfpAFLizjh1B7zJb+0S6d/2jFrMp9/c0=;
 b=SFBxk2R6Vo1pnA9oCXo/Byooq9CKL4dNhc6UCLFfOfHLv4Em9uCwXahfoGQLkM6Zjw
 yOc/pA8z3hl0yv4ye5kZKXe4xVL69lABsBa0t7w6sZixN8Y8YwzucpXoi3mSqbZzsfh2
 BXfBn8XP3wpAurYh8QJprOq90BPrwj9enkPdxKTIczkecuKr/C1L9qz0pCqpW6PaEE/A
 JFTT4Phpqb7bqszRpM76wdJxiwcaJ0pKPq+1X7N+Qwtt/r+1B0lVS1ka5NSYz34J1VAj
 /Zz7MVPzL7yTwoti6aLsbaSzE6AuKAgCsVTTRtbBQsJzEzrHJHKXv/Jk0FjsXWE+RORG
 e+Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SFBxk2R6
Subject: Re: [Buildroot] imx93-evk: Fails to boot from the SD card
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgODozOeKAr0FNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFVJRDogMHg2MjgwYTg2MCAweDU4NDY1NTIwIDB4OTg4Mzc5
OWYgMHgzMTEwMTJmYgo+IGZsYXNoIHRhcmdldCBpcyBNTUM6MQo+IE1NQyBjYXJkIGluaXQgZmFp
bGVkIQo+ICoqIEJsb2NrIGRldmljZSBNTUMgMSBub3Qgc3VwcG9ydGVkCj4KPiBUaGUgU0QgY2Fy
ZCBpcyBub3QgcmVjb2duaXplZC4KPgo+IFdvdWxkIHlvdSBoYXBwZW4gdG8gaGF2ZSBhbnkgc3Vn
Z2VzdGlvbnM/CgpOZXZlcm1pbmQuIEkgdHJpZWQgYW5vdGhlciBTRCBjYXJkIGFuZCBpdCBib290
ZWQuCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
