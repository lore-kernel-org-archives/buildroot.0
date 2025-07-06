Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C061BC83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953CC40A3C;
	Sun,  6 Jul 2025 14:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVGMi-H4SrkX; Sun,  6 Jul 2025 14:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC53F40A48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC53F40A48;
	Sun,  6 Jul 2025 14:47:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB4712E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F4D040A17
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiMdXCFKfS81 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98EAF40A29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98EAF40A29
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98EAF40A29
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:47:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1228472f8f.3
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 07:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751813221; x=1752418021;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsW8sdK0+UuGCr6BB26u4diKzfN8vz0PyMSkcilRxPM=;
 b=bVGoFkvGFkrSomy1FkWeylYJBVfArSeqVoyRuI+RH57hsTm1DfQwdxyCpo9HbwI7DA
 wrEWoKDOPNJK2VrOIHkfPiJDbcJHsqQ0sCnr+p+Hu0aq3+o6ah6SXxyMImsBH3EPZkZf
 jSrsSr3YMcXFk9wHpc/KRBIgeXLQLbnBOVno0Q8suyZ0scr/wgIuTD0F5tIJEawjKcYT
 1XT6E3cKJ+ylOBQTofgJFB4uiQQ9ww8l2yOuGiDAFsW+IdiOqV04F11N2QNdfJI0gpaD
 cOreHYKVODY6HryXJveiasa8cbujRC6d2wv8Ble6yZQvGJYg9h7PpZXtFnEAVqtGJpsY
 yDfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMUwbAOnH2UP/mW+xKm4/TaCbeotEiraYKeGN54qEwPJjCYmjadR/Xc1Anfjf9lli1SugrRNRINqQ=@buildroot.org
X-Gm-Message-State: AOJu0YymDd2i+4Zn75Y4qut2A8PISx1/IKeeB9YEXJahc8oDG0ZpZ4bp
 BdnovmyDaR5LeWtu5BfwUsSbzRgSWhI8tx+RbeQtHucasM0qCm3SOoymqdPh3sMWYow=
X-Gm-Gg: ASbGncttW5z4XKJ2FVbJQYL28Qvqbr3f6ycXo30l88A2qapH5Qj7+q6pVCobmDp78L6
 zVlD/hJIR2D3xa5cZAO/7OFVj03GITrM2Ckow+A/i66MBTzF9YCr8t6PolrySIZXhuZL+TtWVGQ
 PlNIWbLEaeBkN/Wt0XnnVHckn9VatElwmy9m/SPh/3nsOgBPk29aa7A5iTL6kv3cOfBeb6WyMWu
 ja0C8XB2/0JOw0r+mj2q7fEQTkdPdVyZIjJrZvAVqzht84qPqoOhrDAPKrFQUIbKTI+E6A791ij
 7wfMwLLXpH+kBv4Xa30q/HOu9o42oRkZzxidnN8LkhkcD49khkEDMmxPdU5kkRwB3s/njsTWSHo
 YweBfo3sn3reaDYG2GMXl9HaNdLAvGLabY/f6XjUFZXHWNJoU9311xJixTz5+kvkb0xt47f5jt/
 HQK5PriKfyv2hbF3eD88W+aYD5
X-Google-Smtp-Source: AGHT+IERI3ivjQS0luZ35qX7zO6tXNsj7rxafZ1EyU0m5/3eEkDl53YqTphG+la/2wY9KS7ssQRYYw==
X-Received: by 2002:a5d:5f81:0:b0:3b3:ec10:75cb with SMTP id
 ffacd0b85a97d-3b49aa31072mr4759088f8f.26.1751813221436; 
 Sun, 06 Jul 2025 07:47:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a6fasm7484024f8f.81.2025.07.06.07.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 07:47:01 -0700 (PDT)
Message-ID: <9699ab29-aa44-4dd6-b715-2d03cd4eb7b4@smile.fr>
Date: Sun, 6 Jul 2025 16:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>
Cc: Romain Naour <romain.naour@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 buildroot <buildroot@buildroot.org>, Daniel Lang <dalang@gmx.at>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
 <CALAjcgXUyyLUmB56DUEL67m3N+=iGQbOifH3asxZEjZ3nCj81A@mail.gmail.com>
 <CANLo3Jg0GBwx_MPyb+Efmj3H+b6ea7kkQ3v=qQ-NBZTuZoZr-g@mail.gmail.com>
 <bc8dbfe0-ab69-4c04-9efc-eaae23dbcad8@smile.fr>
 <CALAjcgV6iLvfhHmDeu40N-vckzRKDOXUawB+t09H1+ApGa0cvg@mail.gmail.com>
Content-Language: fr
In-Reply-To: <CALAjcgV6iLvfhHmDeu40N-vckzRKDOXUawB+t09H1+ApGa0cvg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751813221; x=1752418021; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bsW8sdK0+UuGCr6BB26u4diKzfN8vz0PyMSkcilRxPM=;
 b=JRc30ifkzq8E/84JzcVwxr0yuiAVs8hw5D4lCg5HzYn34brHDTPRZGA1kGqcEILG2f
 1HXY1XsxQkBzlGzDC6bkMpVZoBCXvctL0c1hxBqpRv+iTomXz4uDKf1iScan2FK+gPFg
 VaSdJ0gkGvMN7X8/3NCcXP4PAndVIbHr3Omqo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=JRc30ifk
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix
 gcc-install-dir in clang
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

SGVsbG8gSmFtZXMsIEFsbCwKCkxlIDA1LzA3LzIwMjUgw6AgMjM6NDQsIEphbWVzIEtuaWdodCBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwKPiAKPiBPbiBTYXQsIEp1bCA1LCAyMDI1IGF0IDU6MDfigK9Q
TSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4+IFBsZWFzZSwg
cmVwbHkgd2l0aDoKPj4KPj4gVGVzdGVkLWJ5OiBKYW1lcyBLbmlnaHQgPGpka25pZ2h0QGpka25p
Z2h0Lm1lPgo+IAo+IFNvcnJ5LCB0aGF0IHdhcyBteSBpbnRlbnQuIEkgd2FzIHRyeWluZyB0byBh
ZGp1c3QgdGhlIEZyb20gRW1haWwgYW5kCj4gYWNjaWRlbnRhbGx5IGhpdCBzZW5kIHdoaWNoIGRp
ZG4ndCB1c2UgdGhlIEVtYWlsIGFzc29jaWF0ZWQgd2l0aCB0aGUKPiBtYWlsaW5nIGxpc3QuLi4g
YW5kIGRpZG4ndCB3YW50IHRvIHB1c2ggYW5vdGhlciBFbWFpbCBhZ2FpbiB0byBhbGwuCj4gU29y
cnkgZm9yIGFkZGluZyBleHRyYSBub2lzZS4KCkknbSBmaW5lIGlmIHlvdSBzZW5kIGEgc2Vjb25k
IGVtYWlsIHdpdGggdGhlIFRlc3RlZC1ieSB0YWcuCkl0IHdvdWxkIGJlIGEgYSBzaGFtZSB0byBu
b3QgaGF2ZSB5b3VyIHRlc3RpbmcgYWRkZWQgaW4gdGhlIGNvbW1pdCBsb2cuCgpUaGFua3MgZm9y
IHRlc3RpbmcgYW5kIGdpdmUgeW91ciBmZWVkYmFjayBpbiB0aGUgZmlyc3QgcGxhY2UuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGVzdGVkLWJ5OiBKYW1lcyBLbmlnaHQgPGdpdEBqZGtu
aWdodC5tZT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
