Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B554C021B5
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 439F46071B;
	Fri, 21 Feb 2025 22:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nt4yrYQLsbg8; Fri, 21 Feb 2025 22:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59BD5606BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BD5606BA;
	Fri, 21 Feb 2025 22:39:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BA36D92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46ECB60722
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gwov_vDT4X7y for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A699606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A699606BA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A699606BA
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:39:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so21944675e9.1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740177588; x=1740782388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=exwurgBmc7Ww5zazq97l7BKM6oxG6w8XGV/QKmO8kE8=;
 b=rmV1/DaLeRlePhk9wGDzEr5TLcgLow5a9B4OnW7OVUVetkazcj7KARjzzPSluVFWfN
 Uq6lPSjdfSc5MM+bJhm2anQTdqsIjtRYwONZK/8Ry1ClRbXYH6euuUrKG96sBoeDzcff
 2D/YevEp+yk1+zobKVuuIjhMFt7DEFPacSe+vZjhrAtS6W0OV902gzVakny/ToWvX40x
 lrVGahpPSfyNK7462NABLRA2Kitef6vvijvRdo+c4rwbS48x3BOXgVMvreMR/udxPPrO
 UuFI8u5g6mclxBM1worc9iIQ5/xqN7NMzpMoyy19rSK6LvzrHT1Ctkw6p5m1wt7YGpZ+
 Y0bw==
X-Gm-Message-State: AOJu0YyIWzwK2IA0Q41uFe1bG9BmXVpYBd+6Ex8cGyYeVHOzQ1WVssz5
 M+WUKs5+5hO0uQ3RSxznnHPTxiguBzshE6csRXnpqbHy4neUw3ItPW22AeuRrzHl8tib3wggXHF
 H
X-Gm-Gg: ASbGnctUziqo6N1kUXfA7gVkBxrE7EkpAaDRb/8hag7avCZ9/b3WLpFmaRTCdGnI9Cu
 EaYGSwbHFUbYsqPlvC78bG0k1lFcUw3qezzFue6gmIUTpbD2ubDPq/I2tlLtDmxfYXDdQvFgWn6
 w6xTZe0k+QCFPMszO8fI68eoFo7k0VDis7KYiFZdJVAFXvQkr81S2xVEhyBie42tLzNQHALY0RA
 DGs0MAZ99VCLKZB06VThF6/jmDkEQ00mnnPqGsfZksdG68wUhSf5XHQEBD3eRMqTnfyhEU7wXOB
 WlpjUEyy0t4FAbGa8h0Wap65ZhK1DWJL76TKb03SqavCORD84nYnvuzudaVk/AKZzZVOwxzIdkY
 PEpo6cF8V1OLjkV0ogqn7ksO2bUraMCqRu5ld1AEqUu/nz4WFG7UDPY7caukMOQ==
X-Google-Smtp-Source: AGHT+IFvYpgR+L1IdVBm3N9Iy+jj5gqm2eGHXwWOhJ+XvNkaWk6YhOXO6Fn1KgZ5DWBSk3G6bUp5aw==
X-Received: by 2002:a05:600c:5127:b0:439:9737:675b with SMTP id
 5b1f17b1804b1-439ae2eae86mr41023635e9.7.1740177588511; 
 Fri, 21 Feb 2025 14:39:48 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b0371db0sm29534585e9.37.2025.02.21.14.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 14:39:48 -0800 (PST)
Message-ID: <1b6a191b-9238-4208-b9d6-b2d6cf95792a@smile.fr>
Date: Fri, 21 Feb 2025 23:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-6-romain.naour@smile.fr> <Z7ctYoil-sJfLIAv@ryzen>
Content-Language: fr, en-US
In-Reply-To: <Z7ctYoil-sJfLIAv@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740177588; x=1740782388; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=exwurgBmc7Ww5zazq97l7BKM6oxG6w8XGV/QKmO8kE8=;
 b=wINFgybUaB4MGqY/FqRqBvu2MBvrsAYAZKrfogHQlMiPo6k1mL4kvtFhCdeinOCD0J
 J50fpCPMb9QEdkY51z2M6t+JVKUSzk9g67Jsjo15vPUB7NB4VFK46bTTdt+MYWhc4VdX
 DaORx2AXBlsaYSKGUkJR/hImAI+fFAwJuanBk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wINFgybU
Subject: Re: [Buildroot] [PATCH v5 6/6] [WIP] am57: add dtso example
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmlrbGFzLAoKTGUgMjAvMDIvMjAyNSDDoCAxNDoyNSwgTmlrbGFzIENhc3NlbCBhIMOpY3JpdMKg
Ogo+IE9uIFR1ZSwgRmViIDA0LCAyMDI1IGF0IDA1OjM2OjIxUE0gKzAxMDAsIFJvbWFpbiBOYW91
ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBPbmx5IGZvciB0ZXN0aW5nIGV4dGVybmFsIGR0c28g
YnVpbGQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNt
aWxlLmZyPgo+PiAtLS0KPiAKPiBOZWVkcyBhIHByb3BlciBjb21taXQgbWVzc2FnZSwgb3IgZHJv
cCB0aGUgcGF0Y2guCgpUaGVzZXMgcGF0Y2ggd2FzIHNlbnQgdG8gdGVzdCB0aGUgZGV2aWNldHJl
ZSBvdmVybGF5IGJ1aWxkIGFuZCB3YXNuJ3QgbWVhbnQgdG8KYmUgbWVyZ2VkIGFzIGlzIDopCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gCj4gS2luZCByZWdhcmRzLAo+IE5pa2xhcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
