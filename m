Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880B7C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 22:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4145F84177;
	Wed, 12 Feb 2025 22:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAD7TZPfTbNV; Wed, 12 Feb 2025 22:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDCA840DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDCA840DA;
	Wed, 12 Feb 2025 22:28:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79AF21A3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6902B40663
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8siGVMUaI396 for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 22:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55703405DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55703405DD
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55703405DD
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:28:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38dd0dc2226so120519f8f.2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739399305; x=1740004105;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jW5hMH1nytLRPSJBAQbGlEBXYAU8jb0yfgRJz9ke/mA=;
 b=qbsVRDoFigcY/6/s8d45zNodKiiSY4HdJpPFHIHjetydPX9eNrSP/lai0EJUZl/yAz
 RLSHcMbZXeJtOsIholsTUi21WXMqs+YMHzOt6qIydlqBhDTIdpI6ODoSGi2bhoi9AD5I
 hJyzTODVx+zsI5wW5D+Y56NB9fJ60+RoAlrpReVo4jocce08h4t/SrIenaiN3rEjmeuz
 prQAz8iOY9KjIZ169NAaHGgqbSHLU2oPp84poQvAZHGd8Mhta/RwpAUIyXKa3RM5xQ/4
 kJbyus5OjqhJrRHjbqPeg9hp8QhaDOkvMfggRbv1RrpgZskeysdx/fajBg7ZuVSEWN4N
 0hGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTO9Fz3TlbGdkcrgLj4BSzOMOONNRK+abzU+v509VMigvYMe1h0CMcBmumSZxVU0S7zuUP/qkEzME=@buildroot.org
X-Gm-Message-State: AOJu0YwrDWqREVG4o0HQ+Sp5giWljuk3hBfC//Z7mVrbo7avoquL6Nt6
 aVcoBSqfvxDdQ90IqOD/Rb0DW068WeBjDbpM4Yt1H+YsC95h0bm1DgxMwSQr6gY=
X-Gm-Gg: ASbGncsYygIvZlKxxNTHLKT/AjlovgV6BMKpq+iXAPI4E+JjzAHqQYdYR0p/LLpPwWa
 GTRrEZsT5sdJkBmEe5tmLC+axMqSsWZUkOPwH+vPwqhvz/Xe0n84f4P4b0fMs9GwOwAYarpYB4f
 QsZlz/Shc44FH9MCFq0DUR9UE4iVQGDh6IAx6ABYavksjTt1j/R5cXvgfFa6RfkbZKY7cWJylor
 gnze/rVKzD+9K/6v+A2TQ5i3RuSqmF1VBQE7pXf71fkwu/ZOsbcp33w+3iTV4JKK2AnhP97x9tx
 ddnRDrxBbipsN5qqByeQDkntHkDuT4ALNkFOfbjjPOp3UeKFVn6p4NUqPRX6884jDNM2lhdEYK0
 YoZFP+TdABDE3D3b+JNQDuwSgHIOjcQJUabYaL4MwfmBxPrC1II0=
X-Google-Smtp-Source: AGHT+IGlpqBR2Om0zX31g1zLnuCxmsf5TuKth6g0cWH8xhnnsxGgnu/bYY4glUL/2o/omYZSThYmAw==
X-Received: by 2002:a5d:5885:0:b0:38f:23ed:2c7 with SMTP id
 ffacd0b85a97d-38f23ed03d1mr1277934f8f.14.1739399305337; 
 Wed, 12 Feb 2025 14:28:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7bcsm31520895e9.28.2025.02.12.14.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 14:28:25 -0800 (PST)
Message-ID: <054b5615-4422-4943-9403-efd0fb7b6336@smile.fr>
Date: Wed, 12 Feb 2025 23:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jamie Gibbons <jamie.gibbons@microchip.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
References: <20250212092121.11699-1-jamie.gibbons@microchip.com>
Content-Language: fr
In-Reply-To: <20250212092121.11699-1-jamie.gibbons@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739399305; x=1740004105; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jW5hMH1nytLRPSJBAQbGlEBXYAU8jb0yfgRJz9ke/mA=;
 b=HdAbDLtrk8mdLBYYMlLQbe7wTUYBzC18rxl0vB7tvScSk+V1ZoKjWRNc75fJ5eedqU
 xcxyamfeYrx8O/BFKpLAUSyf4Jay6XH//xgSyfsmo0wzWnSnCpNg2V/zQzff9KrWVQFF
 GCkyLpkWZrviI2Vau3Ce2v5GEnT9OGNs0/HnU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HdAbDLtr
Subject: Re: [Buildroot] [PATCH v3 0/3] Fixup Update Gateware Feature
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

SGVsbG8gSmFtaWUsIEFsbCwKCkxlIDEyLzAyLzIwMjUgw6AgMTA6MjEsIEphbWllIEdpYmJvbnMg
dmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IEhpIGFsbCwKPiAKPiBUaGUgZm9sbG93aW5nIHBh
dGNoc2V0IGZpeGVzIHRoZSBnYXRld2FyZSB1cGRhdGUgZmVhdHVyZSBmb2xsb3dpbmcgdGhlCj4g
YWRkaXRpb24gb2YgdGhlIGZpcm13YXJlIHVwbG9hZCBBUEkgaW4gbGludXggdjYuNi4gVXNpbmcg
ZGVidWdmcyBmb3IgZmlybXdhcmUKPiB1cGRhdGluZyBoYXMgbm93IGJlZW4gcmVtb3ZlZC4gVGhl
IHVwZGF0ZS1nYXRld2FyZSBzY3JpcHQgbm93IG1ha2VzIHVzZSBvZiB0aGUKPiBmaXJtd2FyZSB1
cGxvYWQgQVBJIHdpdGggc3lzZnMgYW5kIGVuYWJsZXMgYXBwbHlpbmcgb3ZlcmxheXMgZHVyaW5n
IGJvb3QuCj4gVGhlIFJFQURNRSBzdGVwcyBmb3IgdXBkYXRpbmcgdGhlIGZpcm13YXJlIGhhdmUg
YWxzbyBiZWVuIG9wdGltaXNlZCwgbWFraW5nIGl0Cj4gZWFzaWVyIGZvciB0aGUgdXNlci4KPiBU
aHJlZSBjb25maWdzIGhhdmUgYmVlbiBhZGRlZDoKPiAJMS4gV2hlbiBhcHBseWluZyBvdmVybGF5
cyBhdCBib290IHRpbWUgYWxsIGR0YnMgbmVlZCB0byBiZSBjb21waWxlZCB3aXRoCj4gCXRoZSBg
LUBgIGZsYWcuCj4gCTIuIFRoZSB1cGRhdGVkIHVwZGF0ZS1nYXRld2FyZSBzY3JpcHQgdXNlcyBg
c3RhdGAgb24gdGhlIHRhcmdldCB0byBnZXQgdGhlCj4gCXNpemUgb2YgZmlybXdhcmUgZmlsZXMg
LSBhZGQgY29yZXV0aWxzIGFuZCBpdCdzIGRlcGVuZGVuY3kKPiAJKGJ1c3lib3hfc2hvd19vdGhl
cnMpIGZvciB0aGlzLgoKVGhhbmtzIGZvciB0aGlzIG5ldyB2ZXJzaW9uLgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaGFua3MsCj4gSmFt
aWUuCj4gCj4gdjIgLT4gdjM6Cj4gLSBzd2FwIHBhdGNoIDEgYW5kIDIgb3JkZXJpbmcKPiAtIGFk
ZCBmaXhlcyB0YWcgYXMgYXBwcm9wcmlhdGUKPiAtIHVwZGF0ZSBjb25maWdzL2JlYWdsZXZfZmly
ZSBjb21taXQgbWVzc2FnZSB0byBiZSBtb3JlIGFwcHJvcHJpYXRlCj4gLSB1cGRhdGUgdXBkYXRl
LWdhdGV3YXJlLnNoIHN0ZXBzIGluIFJFQURNRS50eHQKPiAKPiB2MSAtPiB2MjoKPiAtIHVzZWQg
ZndfdXBsb2FkIGludGVyZmFjZSB0byB3cml0ZSB0aGUgb3ZlcmxheSBmaWxlLCBpLmUuIHJlbW92
ZSB1c2Ugb2YKPiAgIGBzdGF0YCBhbmQgYGRkYAo+IC0gcmVtb3ZlZCBjb3JldXRpbHMgcGFja2Fn
ZQo+IAo+IEphbWllIEdpYmJvbnMgKDMpOgo+ICAgY29uZmlncy9iZWFnbGV2X2ZpcmU6IGFkZCBz
dXBwb3J0IGZvciBvdmVybGF5cyBhbmQgdXBkYXRlIHNjcmlwdAo+ICAgYm9hcmQvYmVhZ2xlYm9h
cmQvYmVhZ2xldl9maXJlOiBmaXggdXBkYXRlIGdhdGV3YXJlIGZlYXR1cmUKPiAgIGJvYXJkL2Jl
YWdsZWJvYXJkL2JlYWdsZXZfZmlyZTogY2xlYW51cCBnYXRld2F0ZSB1cGRhdGUKPiAKPiAgYm9h
cmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL1JFQURNRS50eHQgICAgIHwgMTUgKystLQo+ICBi
b2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvYm9vdC5jbWQgICAgICAgfCAgMSArCj4gIC4u
Li91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaCAgICB8IDcxICsrKysrKysr
KysrKysrLS0tLS0KPiAgY29uZmlncy9iZWFnbGV2X2ZpcmVfZGVmY29uZmlnICAgICAgICAgICAg
ICAgIHwgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0
aW9ucygtKQo+ICBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTAwNzU1IGJvYXJkL2JlYWdsZWJvYXJk
L2JlYWdsZXZfZmlyZS9yb290ZnMtb3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1n
YXRld2FyZS5zaAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
