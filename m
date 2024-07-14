Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E70C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 08:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED96D4064D;
	Sun, 14 Jul 2024 08:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZExubaX2Dio; Sun, 14 Jul 2024 08:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA524064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA524064F;
	Sun, 14 Jul 2024 08:32:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 809281BF576
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CB6A4023E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UuwFA_l1DBm for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 08:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25FA140237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25FA140237
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25FA140237
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 08:32:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-367ab50a07aso2036462f8f.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 01:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720945970; x=1721550770;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BZ/JZG2UPz5enE3p4+MKMKfwdDf4rEJ1UyU9LA3T53M=;
 b=VyKJlQHMRJfekedBFmdcG/8U5aSenO46bqXKAkN7U5P1TlfHlaQEq0pttr/LWDaAg+
 zy3mQqS/sZtV8jkY8k00M/P/9P2zv6ao1aKpQtSQY2RDyWVcrIvz4h8YRNMx5pt8rekN
 LL0lgR494Fn9nJ98fSgIQ0gvvQIvvsfAMNgMr1jmi8i5OE3KS+jXpgckmMUsuy9id7g6
 jkz5XtAJcHch/2KSTmQXl2J4hfb/PyGV43GNrsaC0zZ5fi1sKT3HXLNM2X8+qfI6H+kW
 Xddzd95vCkG8A/f1XXvGKyBpcIh9rciuGABjMcatSRO7CmESMY8VFV+LieaggvUPMe5z
 Xw8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6J6gGg9c82Dymdj4hc+e86AdYk28xzii220Y71x6dxRNSb9opJeBXyR1fnCfEfkXhrSkGQL68c9+IrOJMuCEGDAUQcDuJUQ==
X-Gm-Message-State: AOJu0YyjY866Tn76Bfy+NN6jvrdQfCA/bFbASQGPg4bZMt09qWsUruyG
 tHnF3vIrZJcuK+qqKPJ3IXnyUqCIktFSuTulppohSEEDNXvXuqp/JbNf022N7Obj+MVrzzNUMgj
 icsU=
X-Google-Smtp-Source: AGHT+IGZszfLvPPDtttBCZa9FsH5kGjOj193DA2K9bks0VUWXPvRR4YzJUJhKcIeH8NJ08J0c/8ObA==
X-Received: by 2002:adf:e30b:0:b0:366:f041:935d with SMTP id
 ffacd0b85a97d-367cead92e6mr9790191f8f.60.1720945969541; 
 Sun, 14 Jul 2024 01:32:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccd68sm3274946f8f.63.2024.07.14.01.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 01:32:49 -0700 (PDT)
Message-ID: <157bb854-4f63-4cf1-b511-fe8cb98bc544@mind.be>
Date: Sun, 14 Jul 2024 10:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <8f7f18c9f67543b5e6b534bc0562c4a8a44a73c4.1717779951.git.yann.morin.1998@free.fr>
 <CADvTj4rcjwuSj_A-OQH7UCDu3u1OoUn1qA-dXaeYXJVaYiPOPA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CADvTj4rcjwuSj_A-OQH7UCDu3u1OoUn1qA-dXaeYXJVaYiPOPA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720945970; x=1721550770; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BZ/JZG2UPz5enE3p4+MKMKfwdDf4rEJ1UyU9LA3T53M=;
 b=EaueRnG02u3mAP3VmvIeEdmmVLH4Cqz6Do9UvIgOtS3kObzqR1KAnDFNQWCZ319PgG
 gm8DaDpGVVcemWyzD7Aguo3qOpFb+iVKAWENYeMlTIxHv55JD0DUyKhDUZ0VxI37h4hi
 2+isiA8IkopSRjNc/vQYhws6NfIiWs70ddNTtEXEx6rSwuXhf7HQ4AJvAt2JfbymhuDw
 lAJy5XD9c7xXJHk7U/nrI22AnEaS/JVeqXMKvUIhRvkH1Jemy8XLeRPunzoV/oEsgPJE
 +ka5l8r+ifwxvnwXrg3hVRQ2vSS0iKFyEFuBYAxvEXJRSzgZHmWoMIE53+iBIe1fCVP9
 4FZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EaueRnG0
Subject: Re: [Buildroot] [PATCH 12/20 v2] package/python-bcrypt: use
 post-process opts to pass Cargo manifest path
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wNi8yMDI0IDAwOjA0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBGcmksIEp1
biA3LCAyMDI0IGF0IDExOjA24oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZy
ZWUuZnI+IHdyb3RlOgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4KPj4gQ2M6IEFzYWYgS2FobG9uIDxhc2Fma2E3QGdtYWlsLmNvbT4K
Pj4gQ2M6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+PiBDYzog
WWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+PiAtLS0KPj4gICBw
YWNrYWdlL3B5dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5tayB8IDUgKystLS0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tYmNyeXB0L3B5dGhvbi1iY3J5cHQubWsgYi9wYWNrYWdlL3B5
dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5tawo+PiBpbmRleCBmMzEzNzQwMWQ3Li5mMDljNjc0
NDFlIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5t
awo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5tawo+PiBAQCAt
MTksOSArMTksOCBAQCBQWVRIT05fQkNSWVBUX0VOViA9IFwKPj4gICAgICAgICAgUFlPM19DUk9T
U19MSUJfRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9O
X01BSk9SKSIKPj4gICAjIFdlIG5lZWQgdG8gdmVuZG9yIHRoZSBDYXJnbyBjcmF0ZXMgYXQgZG93
bmxvYWQgdGltZQo+PiAgIFBZVEhPTl9CQ1JZUFRfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gY2Fy
Z28KPj4gK1BZVEhPTl9CQ1JZUFRfRE9XTkxPQURfUE9TVF9QUk9DRVNTX09QVFMgPSAtbSBzcmMv
X2JjcnlwdC9DYXJnby50b21sCj4+ICAgUFlUSE9OX0JDUllQVF9ET1dOTE9BRF9ERVBFTkRFTkNJ
RVMgPSBob3N0LXJ1c3RjCj4+IC1QWVRIT05fQkNSWVBUX0RMX0VOViA9IFwKPj4gLSAgICAgICAk
KFBLR19DQVJHT19FTlYpIFwKPj4gLSAgICAgICBCUl9DQVJHT19NQU5JRkVTVF9QQVRIPXNyYy9f
YmNyeXB0L0NhcmdvLnRvbWwKPj4gK1BZVEhPTl9CQ1JZUFRfRExfRU5WID0gJChQS0dfQ0FSR09f
RU5WKQo+IAo+IFRoZXJlJ3MgYSBwZW5kaW5nIHBhdGNoIHdoaWNoIGNvbnZlcnRzIHRoaXMgcGFj
a2FnZSB0byB1c2Ugc2V0dXB0b29scy1ydXN0Cj4gaW5mcmFzdHJ1Y3R1cmU6Cj4gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDYwMjIxMzMz
My4yNTk3OTgxLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KCiAgVGhhdCBvbmUgd2FzIGFs
cmVhZHkgYXBwbGllZCwgc28gSSBkcm9wcGVkIHRoaXMgcGF0Y2ggZnJvbSB0aGUgc2VyaWVzLgoK
ICBSZWdhcmRzLAogIEFybm91dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
