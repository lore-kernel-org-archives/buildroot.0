Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF55C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 17:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693A84259E;
	Thu, 23 Jan 2025 17:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCHiiOxAO74W; Thu, 23 Jan 2025 17:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5241B425A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5241B425A1;
	Thu, 23 Jan 2025 17:22:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 651C2B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F0134259E
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vw5fZhVe3jQy for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 17:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4193F425A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4193F425A1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4193F425A1
 for <buildroot@uclibc.org>; Thu, 23 Jan 2025 17:22:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862a921123so746144f8f.3
 for <buildroot@uclibc.org>; Thu, 23 Jan 2025 09:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737652935; x=1738257735;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0sfYY+NXYqvWN8qFZx+npBBBxwDUiIavCJcOUtXq3M=;
 b=uvBQS8TXD/IMh64rw2VvNci8PP6z/54kL4e2TlyJPE61IJ9TXWtFkXzyjM9vq0l0r1
 UmEmsjd1oc/siP+NwIMFOi9YlvpHa7IrTfFJy+w7RLcxi0f7cZxtngEsj/0hSQSKOMU4
 gRDovOoVEQ05Zm2S2bPKnzY8SfJR26mJb0VfOxm4uiqpKEcl9cbAHdrOy9Am1K3eOr9i
 QF6UZQ49HK81tx/bOJRGTVi68QYlmq3C23L9mAqneF4c/bTcj0tLzbqS1RxB11DYlp+Y
 xjFeokuWuHpdK30vSeQ/hPjt2tu23VD4cme0cmuin+nDoRGsFjVfN3fFL+CMc41ggvJY
 JTrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7IpOhJmZJ+YAz3paSZ/9v3OSGgU3/XE/PhgrrBeDkiBh+dmCoTlbwfrA4tmse0LNj8AyS2dZWGs8=@uclibc.org
X-Gm-Message-State: AOJu0Yxis6qV39w+0CEPB+h91W7s6h52Mps93/2dccqrLWyeKW9dHmwl
 dr8WUQRKxzrhbvUlgill6PU7eMR8jTDsKt0hk17WLV8EFtTCLUq5hfQN8sSq6XpUfIHyXKKlkBl
 g
X-Gm-Gg: ASbGnct7bIOifMofOb6t0b/0IeWiLb3GfCnsp1mpo4oErNDN+mY/NahCsp258kDovpv
 AD6EYdKk9JFgs3Npm8H34xz7CXtOVU+DVMKqgin/bSkI6LGq6eE1NOXTKSyZnPvTmfn8BhCrEi8
 VAc1j+pMhPk0fAOqzb2KNfcGIDIG+Fa+9wEEGsRNVfpm+qHAjA4+wQpsfwJj+TCAPUMqmW0Otsm
 wEHQDh2KtjHfV2++q3k67u1G9juBmaGIq5dgX9Lc5T5Ejo6dnO2KiCFVaaQ1G0YMCByhXo/aNeG
 H/O31PUwuFAW+zWApe7V85suec7DPM/fS6H8FLU=
X-Google-Smtp-Source: AGHT+IGhMqoKHo0Y0Ksr9HnQsBafQERpLsL8fuApTg6+72GkV8qY71Dn7r2EvDF6qc9C2xiT6ezd3Q==
X-Received: by 2002:adf:e8d1:0:b0:38b:da34:5915 with SMTP id
 ffacd0b85a97d-38bf566f5e5mr21561290f8f.23.1737652935102; 
 Thu, 23 Jan 2025 09:22:15 -0800 (PST)
Received: from [10.5.0.131] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17650esm252113f8f.12.2025.01.23.09.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 09:22:14 -0800 (PST)
Message-ID: <929cc71a-1d78-46b7-b99f-99936c9fff20@mind.be>
Date: Thu, 23 Jan 2025 18:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Grant Edwards <grant.b.edwards@gmail.com>, buildroot@uclibc.org
References: <vm633c$k42$1@ciao.gmane.io>
Content-Language: en-GB
In-Reply-To: <vm633c$k42$1@ciao.gmane.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1737652935; x=1738257735; darn=uclibc.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f0sfYY+NXYqvWN8qFZx+npBBBxwDUiIavCJcOUtXq3M=;
 b=QRmtUIZOS6x/Hhpkwx8F5g8E5//LIy2fr6JMPhDvYJKkO01C3kUwHhcV8D6ja5ggKo
 CA0HOLYyCXPFq5CLL0QNqnzPb3mNSeYnRlkmx3/FiCxTAEA89xg12Y04kR1dTlocIZG7
 Thstbhpgbcb8Y5WW9oo4iTWnf6gLSz90T3vseICYtyr9D0DtCTs4hW/uV63CA9vhfxKC
 k2/kANgjWgiOMeK+awtLGp971dMx+w5W+CTf6lKSw/p2RAcUYjH9FJT3eREvpTD+W0xJ
 1oizPDWjbeaqFhkqeKa1SlO9SqGmKxsJD2TkhzWrs7acZFdxcVNg9+VtDkOaHi35wech
 cReA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QRmtUIZO
Subject: Re: [Buildroot] Can we build static host tools (e.g. tar)?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2025 17:24, Grant Edwards wrote:
> I'm having problems with the SDK that Buildroot builds.  Things like
> opkg-build are failing because they're using buildroot's SDK version
> of tar, and the glibc version isn't compatible between the host where
> the sdk was built and the devleoper host where the sdk is being used.

  The SDK is meant to be relocatable, but it is very hard to make it possible to 
just run anywhere. Static linking can help but even with -static you may still 
get a shared binary. So even if we do that, there's no guarantee that it will 
work on another build machine.

  BTW I'm surprised you complain about tar - the compiler should have the same 
issue, no?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
