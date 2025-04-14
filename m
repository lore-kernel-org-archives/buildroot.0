Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50DFC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8389960AC1;
	Mon, 14 Apr 2025 18:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHLQipXFdYph; Mon, 14 Apr 2025 18:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC666606CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC666606CC;
	Mon, 14 Apr 2025 18:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB1D108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD7E40A4B
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxCEXqX6FpTG for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:15:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F20FA40B32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F20FA40B32
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F20FA40B32
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:15:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so30068845e9.1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744654520; x=1745259320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/PBuHHeG+aRuFJHLOwg6wEJyFRe65ycDKEw5tLBFsU=;
 b=eqH9WSrQMPyJXfzOnmkc/zMfI/9FT4q/sFWn6O9Bb4cLYK5qRAfdPIPIVMJG7dTpIv
 AZ3zd9Zywif2kZETUasBO5nKKqF6gYGpYyl5ox8iTq+ei1fhvrgtVNroFl0nAgktBbGl
 bFwzm4ZavayH29Ut4iH2m62e3BsHnLJ2/cbA22a1A6QcnQIZrDnzaBagV30n/7bKeDQI
 XRtBHo636FJ6DmnQtbsx3kMU23ABcbvyE0K8mG1rzgEWiwccfpoS3NfB+Gn36A+TbWUG
 +HOSy+OBvXvDqhiANp7iIMaQY7Ai6ntmj7XDh+J6w0U34c1qCZet64APzlR8U7FtRDMC
 63Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3c/XzOuAiU6VYaHDFTYAWht/JynvuAL+DS5fBZ3TSttVnDior9R129gbSK129Raw2UHEuteYE3Bk=@buildroot.org
X-Gm-Message-State: AOJu0YxFRKNPa66gfPpdVSlMYkpPxmFHk4O232FQIP4jNJwDhcjuQdtC
 v8EJmLUP6L+Cwd5CnKH2f8hh3itPpJaMRR5H5lkkquixMI5SIT9T
X-Gm-Gg: ASbGncvHLTUrSpEGngxqLb0Pvmk/1B8fza8gaDcODN2r1a8XXtFqunTr+tgblrebtIB
 GxYtxJzc25SatZPdqSgR4ItFGneRS2beEaTH+XvK1Iu2ImoF+v4GnuvUftk1nGNlrldqNzobQ5x
 V3S0cIaGlEI0cnewkWrIbTHwHMy/gQ3hNaITuqAyT1+iryeyR6Y7IZBX3nGyewYnA7h8auS8DJG
 iMAWF02tMbbZSopj++Bud5MbvmWjwr/D7guIPHHHKhlMdLDSnBaN9IAfQSy2gxjSBtKqVeAjqDw
 QdCI7w7hyZom1RvOdaYXvjcnzGVE12j9ULRymtawCB638RRxJAnns1NxH443Ny4vFPNuLX/S2dt
 MfaJPjGoV6w==
X-Google-Smtp-Source: AGHT+IHUFSb4dwJBlsAno/Ks5GRvrLZLVK/pCFcQlapGGxRVkUHHBkaXx9QMO404MtwPJMrS1SR5yw==
X-Received: by 2002:a05:600c:468f:b0:43d:b33:679c with SMTP id
 5b1f17b1804b1-43fa27bed9amr3288565e9.14.1744654519718; 
 Mon, 14 Apr 2025 11:15:19 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963f62sm11498499f8f.5.2025.04.14.11.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 11:15:19 -0700 (PDT)
Message-ID: <e24f698c-d92a-4b9a-af17-c5a194572e62@gmail.com>
Date: Mon, 14 Apr 2025 20:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744654520; x=1745259320; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/PBuHHeG+aRuFJHLOwg6wEJyFRe65ycDKEw5tLBFsU=;
 b=EC+SZr43TmqS6wwR9LAdqalAcY2PCiluoEAxqKUHHpj6vKhDlACkINaOHm139fuJTC
 pQTyd/Q61SDz1oiVudfTKFV8VMqL3Ryv8ga3yyHDM9ot1Kj8KI4uDSuo4gexc4TPJflW
 PPh9/uRGAyNfVFmrFqb0cT5dXq7ZRhBj2PDmULEQdyAFVwJncf2vWI4hVfB6UsX+FsJv
 G5Mptml6OVXhq2tqceqYO1dvaVfDZOKJYcjwQZEiIrq7wcbsjXRs4eUZvuzkls+2s1xG
 rk1CiDbwul3ASk/z2R4i7e4F+v83cdnWPER4ZexFdid7CbDb/XnGuBMfefXL2x/5JUaj
 qYig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EC+SZr43
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/stm32mp135f_dk: fix optee
 hash
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxMy8wNC8yMDI1IMOgIDE4OjQ3LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdMKgOgo+IFRo
ZSBidWlsZCBjb21tYW5kOgo+IAo+IG1ha2Ugc3RtMzJtcDEzNWZfZGtfZGVmY29uZmlnCj4gCj4g
ZmFpbHMgd2l0aCB0aGUgZXJyb3JzOgo+IAo+IEVSUk9SOiBObyBoYXNoIGZvdW5kIGZvciBvcHRl
ZS1jbGllbnQtNC4zLjAudGFyLmd6Cj4gRVJST1I6IE5vIGhhc2ggZm91bmQgZm9yIG9wdGVlLW9z
LTQuMy4wLnRhci5nego+IAo+IEZpeGVzOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzk2OTAzNjk2MjQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCgpIaSBEYXJp
bywKClJldmlld2VkLWJ5OiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwu
Y29tPgoKQmVzdCByZWdhcmRzLApSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
