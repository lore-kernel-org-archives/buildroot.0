Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCC4C19F2E
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 14:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D288111A;
	Thu, 27 Feb 2025 14:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39TLw6Ifvckd; Thu, 27 Feb 2025 14:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 455108115B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 455108115B;
	Thu, 27 Feb 2025 14:04:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F0069
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8621413EA
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gBAk8eDG4dG for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 14:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06907413C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06907413C1
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06907413C1
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 14:04:48 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30797730cbdso9030481fa.3
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 06:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740665087; x=1741269887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kRs6M8I0QYC3qa+hOO7M+tPp8OW0D66xvJUXTgJews=;
 b=VZ7agt4Kh8kijsnudNfYQs1bKmc4EsNIlNz1/0nhd6V6n0pxQGWbryoVG9GE/0SVkx
 vlLhsBKYTDvA1rE7wX7rchrh/0qvMhlH/1XzZwO8fyTN9YrNA7V0iPLzfwI2ZpaeCjcq
 pVevLa5WHrA5rModf8wAsmgo8SR4mYhbRoYvmH1NCir8hCyW5nuC+txiUZfzO7/fmD3t
 qZ7CWhF+Oer1LpDgUcx5VZfE+90S1bZZQUZ4rFAZNfF3PrgaDZ1+AQI4QDMXRoO4MIpx
 4Tkh/kmPvb2Y63SdU0Bz/LxzYkQETzq8sYDigJ0DOpKJvNr4W8WvmM+tO5ZbNDBuOF/m
 ZN4Q==
X-Gm-Message-State: AOJu0Yy6fk71YS2SuES4XbK/Z/+8iJDwoALMKKnSzZqS3LP3ri2w8vaV
 axB6s6p8U5dea1743sCI1ZkTzvegVNS40t9XN/Uvd7GOanEMSDa5xLkGua28vDWYgL2tqHw1fLu
 Dqh3igK/lkHBNvCbnRV4wmVSdtho3gdUO
X-Gm-Gg: ASbGncvRhyUErNp6UDSISHoy1EENJ2reUgj6KlBiFKfkzEJ6KBbUZKJzTzd5IT2+gXP
 GDcRzWPzL2JGHmWPZwdiVJGzjx7CR1IFkoGUWN2YVj9dyGUVxtJO9m59kAipVG5g07LbpCxV9GP
 ohwUhZp/Whd/NppwZJML06jICd7f0DIIBpLEt4EYU=
X-Google-Smtp-Source: AGHT+IEVYc6b864xLOgCMhh2jWJafh44ognWn3m3laV24CuiSKT6Hac9LQ2kdW1KVaD6f+vOGC3stMlyTcqxOkFpX8I=
X-Received: by 2002:a2e:9250:0:b0:30a:448a:463 with SMTP id
 38308e7fff4ca-30b79146f74mr38790621fa.4.1740665086075; Thu, 27 Feb 2025
 06:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20250226205144.1843356-1-festevam@gmail.com>
 <77f795b2-9f18-4e29-96fc-69d4b39747d2@armadeus.com>
In-Reply-To: <77f795b2-9f18-4e29-96fc-69d4b39747d2@armadeus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Feb 2025 11:04:33 -0300
X-Gm-Features: AQ5f1Jr_z1v4wxbvjCIbhX-gdMCFOqbFVX81Uzb6AeMEc2gwXXiuWZa2M61pUsM
Message-ID: <CAOMZO5BCEbKjLa7HWX_mAHxDsJ=FXQGSeN0MW0r8D2J8r44TDA@mail.gmail.com>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740665087; x=1741269887; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kRs6M8I0QYC3qa+hOO7M+tPp8OW0D66xvJUXTgJews=;
 b=LiOfUmqjQHeF+ZNUXcEH8N6V554LEhNFuVV4PDkfpw1AA4m1prkYz/Hb/4VEUrju0U
 gKzbc9h7d/vzY6K3co/ghf5Wx9fgBgojZJuiIEIbTeU2naUZY0kljpb5kXGROWuavtnR
 ICbd5uOi35+ZlQnJBVDFM/rB0wM/LVfe6Y7YnLpyfjRuNOetLEW00wMjqJfdaN6SYH+o
 uR0rHOCFDqRuVxyZrSY/mwBHN4HGcNyCrkOz2/qNkRzgXv2KjDfWkHAF6pgzIo65ugqI
 PllsfUavVTWyrw9XbCj2Fo/4QDlMfOfauEZfgNRKVKjMfKhx0yt+KSOX8gtX+aeht95x
 JV3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LiOfUmqj
Subject: Re: [Buildroot] [PATCH 1/2] package/freescale-imx: Allow firmware
 installation on i.MX93
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwKCk9uIFRodSwgRmViIDI3LCAyMDI1IGF0IDc6MzXigK9BTSBTw6liYXN0
aWVuIFN6eW1hbnNraQo8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoK
PiBXaXRoIHRoYXQgY2hhbmdlcywgdGhlIHVzZXIgY2FuIGNob29zZSBERFIgb24gaS5NWDl7MSwz
fSBzeXN0ZW1zIHdoZXJlYXMKPiBvbmx5IExQRERSIGlzIHN1cHBvcnRlZC4gVGhlIEREUjMgYW5k
IEREUjQgb3B0aW9ucyBzaG91bGQgYmUgaGlkZGVuIG9uCj4gaS5NWDkzLgoKR29vZCBjYXRjaC4g
SSB3aWxsIHdvcmsgb24gYSBwYXRjaCB0byBoaWRlIEREUjMgYW5kIEREUjQgb3B0aW9ucyBmb3Ig
aS5NWDkzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
