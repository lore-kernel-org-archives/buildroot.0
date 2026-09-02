Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E3BC61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 21:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE9240B53;
	Wed,  2 Sep 2026 21:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEfw5N2RxxFM; Wed,  2 Sep 2026 21:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 72A5040B54
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788384667;
	b=ZIz4Vt37gMOQh9ioUdnxf9NE5SQ0G0Dz2CloPw/Lp0T7UO5vUBALxUo8Tzv/kOD3UDZV
	 swJIMAJdypKBsfqgLA1ArAjD43lIvtE+mufpO52WLZQKMX8NwqDbyqr1NtIpGRO2t0EhJ
	 XEj+oQ/3nDK5ntVCB8PfIlocHoIYsoL5JarJtbxBEp1e1hzsQtc5CoV0VY51/7Yhbcun2
	 N/YpBMmSAvDN+B11Xs1hawtSIyg/ccnsrosIRnh6m7+qmwlL5HdSNcFNEaDJp10CGjB3y
	 VjlI6Ll0M5k+id5i1q4lfyaKSh8lofa//QW8nqFuNkDFob7RW+0XBT9ZjLL0sL4+EpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788384667;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C+3lds7XBwI5R4/2XQuVqKeSPmMbKmOPJidX1iAauYA=;
	b=UjOsE9jSJ7zVjLIxrilI2Zv26qKcs6bMX3VrlbanpAgAjmvbbIKBUj/v7SkWjxO+YSNv
	 N/ORNuuAEBsZplq9ob+c8Fegt+Lc6ToUTeYBrxMo824PLrws5wVzVTQfCIiMRA3v0eWu3
	 51K9i9VqCRYqpqBaIpOdrnxP6ELTF4SIiQd+JP+eHLcQOkk0mQOULvx2v7ELPBiwqZHXy
	 2I1/E0T2ogTMbZ8cdbGDmmwt95wOotGoN1Hv4aX3Z8cpjYwl562sdJuSzxeqpq6CKwcZC
	 taYX6SXKAkpt+AfICdAeQdLnC84Hr0qra8Y/rvmC8+7hSyVvNHYNN5CPiLc1jL5dEgQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788384667;
	bh=C+3lds7XBwI5R4/2XQuVqKeSPmMbKmOPJidX1iAauYA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pRRb+pzy+oeBoKQjhWT1poZ+6RJhA/T44Ngg7A/liHvx1E90Sf3FDH5K8EJSEhaBP
	 SCu1qwAMw64TPZGhrYkhGnroWL7UisfuQJh1HshyVqDd6gunHxDSPAwLqn4SRfSMit
	 8MvjATNh8+mHxW2PlbcsqgPxYvu5qU0fo5mWKUemtb2fUrOxmMCbgeaEiRwOLJFB04
	 xV3Y5uLwKRW1aZnkSQF10CBzBWevaezIZ5tyY5YJpxpQgyp4RnzO3EYhHWGc/5XcCJ
	 5lTYr5bVDbv2MbOS6Ox/Ab7SaFuoradnmGxnRYyHPJE1KrEBzoLYDN3I47DzWvpBnz
	 j/He1IrMcXWVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A5040B54;
	Wed,  2 Sep 2026 21:31:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0689363
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920AE6078A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tahvgZbcxfz for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 21:31:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9BAA560738
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788384665;
 b=kngjdpnY61Yy2bdXyB0xsGecirbJNl/V31KjdvAVNoPBryFhYrODoFfW3o8vmWVCvVwt
 NZg1l3ldZMutmGYf5Y2Q9oJR3f52RPVTL4Xh2ADl0XYI47bbaUme8ivB4oDNqj3Vt5qIg
 3KVG8l8RwnxoPPWBZumx5x+sVlT1O6/kkKu4/6p7uKCwzb1+UG+BtTxc9mNrty/1C3IK4
 S5h2abm68xjUD3uS/huWLyvCZgPBmpJ+hvuAhb1Ds32SvXlL6EIb7ivH0SgsZWOP36Z1Y
 N6zWrfNTm5iACOymzZvljJtj/rH2yvxjZTuZvEwvT97r1MZIqVczitU4HJZx1liYzPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788384665;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=J0KOP66rPcmgbPpuIhW/k84Xb5wgF0Pb3+hmePrOVO8=;
 b=G4fKmCA4/045CcwlOfJD1ExZxpmW2UfTsQGyjZasbV4HHCXrTV6CKuCXNBDea/1sDSR5
 2oyPKcVzDAwMThJPG7lSV6ycRivJ+RrXq8rj3BsuA8ClahyI3Dtl5x6zJe1pLk3YHexSr
 6r35exKSMC/46LvKcyUVPxt6DRx3NNACebEbDu5LSBJ64aMXGBKw5S2hVj1/wjFIh3jqc
 1NH3UaFOs6c/mSLz/F1jzwC4/p68YMm7HLPlntWwRs+Vi8+leRuLdyFKBpuarr9alOUWb
 y+gT7MbHIjGyfk66RYoIkG2HsyuikZh7B56GMTIWP10M66AiWNZNLxS7Erhjw9PSiNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=u1Li6Dnz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BAA560738
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 21:31:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so1224159f8f.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 14:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788384662; x=1788989462;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J0KOP66rPcmgbPpuIhW/k84Xb5wgF0Pb3+hmePrOVO8=;
 b=kplGNICD97Dvo3BcIgSGH02GwXmxeKTNSplBuSTjZ0EVROWU4h4PHVzRWkKE3mYn37
 kUufVZn8ZW3uwrnPxpCb+ovuQAvFcDZuY1Ti4V3gN4K1Ug2POdtWxWOqSzc8qPCc5t0b
 N9mApCce030A6ntRMcLWCFE3XhhmXl1s1kI4uuQlDHrmT9eqwPGGCFrZJurDvShfpoAa
 m/Qi4mgMB8+CigGk8dcQV/7IgfVHq49AqkQZUQrvGR3MFdgIoIcRSqoJnhfeJoBNQr0f
 ORCAnthb05UlCSzfOh2XP8C/NTPC1HS7DZMrLPDh7FXCYw3FUTmypfXV0tBMlM2+hphR
 WHYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSgzn9IFV8TISZkubzxhF4CZEVnUwYl7lC5KElAglnRzpBzXJsbQiT/IZAFH4n58OrmgS3SVU2JM8=@buildroot.org
X-Gm-Message-State: AFuF++nHJ4bECAGExkEdl3BxwMruitt/UUYPw/vB7Oz30BcFFqtnZZq6
 4TPDa2lV11sU06qJTIX61+2jrDOgjPpRzUw7kIx5zFay5yrSgmSCXpVQftxqBcU+iwo=
X-Gm-Gg: AYBFou2c0jZkHsyITf4oeqnyvhG4LLHiFJ5EuSfdDevbjRkDDj676ipAkausn0Oc1wR
 saV/qh8BomqWlQRXvYg+NTJ3Z3rvE5EtCCDn7yz2O1NqUL2/fQ2QOgf//37xELu7DcgYjYFvyfj
 SJ4CeDqxV2ixOSsfVFknYhmqZl5pwNxCXYZh4iMxzTDy+gXUfz9MZcEj2JYBwUPZSSC2A/0K1kc
 vNr/m57gWG4Hi8hd8JTcwx0QBcFFosj70fBvG3015GD3Sq0ggGTYq2rwjg9zKo4inMhERdpvE/p
 YDP3VdRJeIfDxcvZbGIT4fZ+2moM9cIx1jriLBB1jKYPLktkaFbaYdJ1kWfbnpC0w8sk1dhxnFP
 Zd/HV/emZ1n2axqfDKi2pldOObOqE9QqYP4kawkh7SgKi/oWbM1CkiAubpXxFkvrKOWi/cEkdUg
 aUJObU/Oyo5iKkwVRF0qyNehIhGiKatDM+wMpNQBRcKucKyxfnyfRmdBV7kmrLJunM9GA1ochV4
 KO4oGNWQA+nYR3xrsZcRdVqRPwKCGI7SmX2vWwe2ViXixb6rGWl83jhg5hJFT5r55N8UVOB0qJP
 2KpfGxhMRpPfoMiSWrEuG4i55sU=
X-Received: by 2002:a5d:59c3:0:b0:47f:e377:8d61 with SMTP id
 ffacd0b85a97d-48488dfa6b3mr14257831f8f.11.1788384661906; 
 Wed, 02 Sep 2026 14:31:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed2edfsm8578614f8f.23.2026.09.02.14.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 14:31:01 -0700 (PDT)
Message-ID: <3c877955-886b-46da-98d4-89a0753e72b9@smile.fr>
Date: Wed, 2 Sep 2026 23:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>, buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
References: <20260831-wip-obbardc-package-dtui-fix-armv5-v2-0-42eceaa12f55@oss.qualcomm.com>
 <20260831-wip-obbardc-package-dtui-fix-armv5-v2-1-42eceaa12f55@oss.qualcomm.com>
 <4d6becee-42df-46d3-bb2d-7d2fdc18c13c@smile.fr>
Content-Language: fr
In-Reply-To: <4d6becee-42df-46d3-bb2d-7d2fdc18c13c@smile.fr>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/rustc: add
 BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64
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

TGUgMDIvMDkvMjAyNiDDoCAyMzoyNCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
Q2hyaXN0b3BoZXIsIEFsbCwKPiAKPiBMZSAzMS8wOC8yMDI2IMOgIDE3OjQ5LCBDaHJpc3RvcGhl
ciBPYmJhcmQgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+PiBSdXN0IGRvZXMgbm90IHByb3Zp
ZGUgNjQtYml0IGF0b21pY3Mgb24gZXZlcnkgdGFyZ2V0IEJ1aWxkcm9vdCBjYW4KPj4gZ2VuZXJh
dGUuIHJ1c3RjIHNldHMgbWF4X2F0b21pY193aWR0aCA9IDMyIGZvciB0aHJlZSBvZiB0aGUgMjUg
dGFyZ2V0cwo+PiBsaXN0ZWQgaW4gUlVTVF9UQVJHRVRTIGluIHV0aWxzL3VwZGF0ZS1ydXN0LCBz
bwo+PiBjb3JlOjpzeW5jOjphdG9taWM6OkF0b21pY1U2NCBhbmQgQXRvbWljSTY0IHNpbXBseSBk
byBub3QgZXhpc3QgdGhlcmU6Cj4+Cj4+ICAgJCBydXN0YyAtLXByaW50IGNmZyAtLXRhcmdldCA8
dGFyZ2V0PiB8IGdyZXAgdGFyZ2V0X2hhc19hdG9taWMKPj4gICBhcm12NXRlLXVua25vd24tbGlu
dXgtZ251ZWFiaSAgICAgIjE2IiAiMzIiICI4IiAicHRyIgo+PiAgIGFybXY1dGUtdW5rbm93bi1s
aW51eC1tdXNsZWFiaSAgICAiMTYiICIzMiIgIjgiICJwdHIiCj4+ICAgcG93ZXJwYy11bmtub3du
LWxpbnV4LWdudSAgICAgICAgICIxNiIgIjMyIiAiOCIgInB0ciIKPj4KPj4gRXZlcnkgb3RoZXIg
c3VwcG9ydGVkIHRhcmdldCwgaW5jbHVkaW5nIGFybXY2LCBhcm12NywgYWFyY2g2NCwgYWxsIHRo
ZQo+PiB4ODYgdmFyaWFudHMsIHJpc2N2NjQsIHMzOTB4LCBzcGFyYzY0IGFuZCBib3RoIDY0LWJp
dCBwb3dlcnBjcywgaGFzCj4+IHRoZW0sIGUuZy46Cj4+Cj4+ICAgYXJtLXVua25vd24tbGludXgt
Z251ZWFiaSAgICAgICAgICIxNiIgIjMyIiAiNjQiICI4IiAicHRyIgo+PiAgIGFybXY3LXVua25v
d24tbGludXgtZ251ZWFiaWhmICAgICAiMTYiICIzMiIgIjY0IiAiOCIgInB0ciIKPj4KPj4gQSBj
cmF0ZSB0aGF0IHVzZXMgNjQtYml0IGF0b21pY3Mgd2l0aG91dCBhIGNmZyh0YXJnZXRfaGFzX2F0
b21pYyA9ICI2NCIpCj4+IGd1YXJkIHRoZXJlZm9yZSBmYWlscyB0byBidWlsZCBvbiB0aG9zZSB0
aHJlZSB0YXJnZXRzIHdpdGg6Cj4+Cj4+ICAgZXJyb3JbRTA0MzJdOiB1bnJlc29sdmVkIGltcG9y
dCBgc3RkOjpzeW5jOjphdG9taWM6OkF0b21pY1U2NGAKPj4gICAgICB8Cj4+ICAgICAgfCAgICAg
ICAgIGF0b21pYzo6e0F0b21pY1U2NCwgQXRvbWljVTgsIEF0b21pY1VzaXplLCBPcmRlcmluZ30s
Cj4+ICAgICAgfCAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXiBubyBgQXRvbWljVTY0YCBpbiBg
c3luYzo6YXRvbWljYAo+Pgo+PiBUaGlzIGhhcyBiZWVuIGhpdCBhdCBsZWFzdCB0d2ljZSBhbHJl
YWR5OiBieSBwYWNrYWdlL2R1c3QsIHdvcmtlZCBhcm91bmQKPj4gaW4gY29tbWl0IDNhYmMzYjk3
YmFkOSAoInBhY2thZ2UvZHVzdDogYnVtcCB0byB2ZXJzaW9uIDEuMS4yIikgYnkgbW92aW5nCj4+
IHRvIGEgcmVsZWFzZSBpbiB3aGljaCB1cHN0cmVhbSBoYWQgYWRkZWQgdGhlIGd1YXJkIGFuZCBi
eSBwYWNrYWdlL2R0dWksCj4+IHdoaWNoIGhhcyBubyBzdWNoIHJlbGVhc2UgYXZhaWxhYmxlIGFu
ZCBoYWQgdG8gb3Blbi1jb2RlIHRoZSBhZmZlY3RlZAo+PiBhcmNoaXRlY3R1cmVzIGluc3RlYWQu
Cj4gCj4gVGhlIGNvbW1pdCAzYWJjM2I5N2JhZDkgKCJwYWNrYWdlL2R1c3Q6IGJ1bXAgdG8gdmVy
c2lvbiAxLjEuMiIpIHdhcyBhYm91dCB0aGUKPiBhcm12NyBhcmNoaXRlY3R1cmUgYnV0IGl0IHNl
ZW1zIHRvIGJlIGEgbWlzdGFrZSBzaW5jZSB0aGUgdG9vbGNoYWluIHVzZWQgYnkKPiBkZWZhdWx0
IGlzIGluZGVlZCBmb3IgYXJtdjUKPiAoQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FS
TVY1X0VBQklfR0xJQkNfU1RBQkxFKS4KPiAKPj4KPj4gSXQgaXMgbGlrZWx5IHRvIGtlZXAgcmVj
dXJyaW5nOiBpbmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHCj4+IGJ1aWxkcyB3
aXRoIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WNV9FQUJJX0dMSUJDX1NUQUJM
RSwgc28KPj4gZXZlcnkgcnVudGltZSB0ZXN0IHRoYXQgZG9lcyBub3Qgb3ZlcnJpZGUgdGhlIHRv
b2xjaGFpbiBjb21waWxlcyBmb3IKPj4gYXJtdjV0ZSwgb25lIG9mIHRoZSB0aHJlZSBhZmZlY3Rl
ZCB0YXJnZXRzLiBUaGF0IGlzIGV4YWN0bHkgaG93IHRoZSB0d28KPj4gZmFpbHVyZXMgYWJvdmUg
d2VyZSBmb3VuZC4KPj4KPj4gQWRkIGEgaGlkZGVuIHN5bWJvbCBzbyBwYWNrYWdlcyBjYW4gZXhw
cmVzcyB0aGlzIGNvbnN0cmFpbnQgb25jZSwgcmF0aGVyCj4+IHRoYW4gZWFjaCBvcGVuLWNvZGlu
ZyBCUjJfQVJNX0NQVV9BUk1WNSBhbmQgQlIyX3Bvd2VycGMgYW5kIG5lZWRpbmcgdG8KPj4gdXBk
YXRlIHdoZW5ldmVyIHJ1c3QgZ2FpbnMgb3IgY2hhbmdlcyBhIHRhcmdldC4KPj4KPj4gTm90ZSB0
aGF0IGFybXY1dGUgYW5kIDMyLWJpdCBwb3dlcnBjIGFyZSBvbmx5IHN1cHBvcnRlZCBieSBydXN0
IGZvcgo+PiBnbGliYyBhbmQgbXVzbCwgc28gdGhlIHVjbGliYyB2YXJpYW50cyBvZiB0aG9zZSBh
cmNoaXRlY3R1cmVzIGFyZQo+PiBhbHJlYWR5IGV4Y2x1ZGVkIGJ5IEJSMl9QQUNLQUdFX0hPU1Rf
UlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMuCj4+Cj4gCj4gVmVyeSBnb29kIGNvbW1pdCBsb2ch
Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoK
QXMgVGhvbWFzIG5vdGljZWQsIHRoZSBvcHRpb24gc2hvdWxkIGJlOgoKY29uZmlnIEJSMl9QQUNL
QUdFX0hPU1RfUlVTVENfQVJDSF9IQVNfQVRPTUlDX1U2NAoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZXIgT2JiYXJkIDxjaHJpcy5vYmJhcmRAb3NzLnF1YWxjb21tLmNvbT4KPj4gLS0tCj4+
ICBwYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0IHwgMTYgKysrKysrKysrKysrKysrKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcnVzdGMvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0Cj4+
IGluZGV4IDljZDkxMmZjNzQuLjUzOTkyNjE0NGIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcnVz
dGMvQ29uZmlnLmluLmhvc3QKPj4gKysrIGIvcGFja2FnZS9ydXN0Yy9Db25maWcuaW4uaG9zdAo+
PiBAQCAtMTEyLDYgKzExMiwyMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJH
RVRfQVJDSF9TVVBQT1JUUwo+PiAgCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8
ICFCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAo+PiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQ19BUkNIX1NVUFBPUlRTCj4+ICAKPj4gKyMgTm90IGFsbCB0aGUgdGFyZ2V0cyBhYm92
ZSBwcm92aWRlIDY0LWJpdCBhdG9taWNzOiBydXN0YyBzZXRzCj4+ICsjIG1heF9hdG9taWNfd2lk
dGggPSAzMiBmb3IgYXJtdjV0ZS11bmtub3duLWxpbnV4LXtnbnUsbXVzbH1lYWJpIGFuZCBmb3IK
Pj4gKyMgcG93ZXJwYy11bmtub3duLWxpbnV4LWdudSwgc28gY29yZTo6c3luYzo6YXRvbWljOjp7
QXRvbWljVTY0LEF0b21pY0k2NH0KPj4gKyMgZG8gbm90IGV4aXN0IHRoZXJlLiBUaGlzIGNhbiBi
ZSBjaGVja2VkIHdpdGg6Cj4+ICsjICAgcnVzdGMgLS1wcmludCBjZmcgLS10YXJnZXQgPHRhcmdl
dD4gfCBncmVwIHRhcmdldF9oYXNfYXRvbWljCj4+ICsjIFRhcmdldCBydXN0IHBhY2thZ2VzIHdo
b3NlIGNyYXRlcyB1c2UgNjQtYml0IGF0b21pY3MgdW5jb25kaXRpb25hbGx5LAo+PiArIyBpLmUu
IHdpdGhvdXQgYSBjZmcodGFyZ2V0X2hhc19hdG9taWMgPSAiNjQiKSBndWFyZCwgc2hvdWxkIGRl
cGVuZCBvbgo+PiArIyB0aGlzIG9wdGlvbi4KPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1JV
U1RDX1RBUkdFVF9IQVNfQVRPTUlDXzY0Cj4+ICsJYm9vbAo+PiArCSMgRXhjbHVkZXMgYXJtdjV0
ZS11bmtub3duLWxpbnV4LXtnbnUsbXVzbH1lYWJpIGFuZAo+PiArCSMgcG93ZXJwYy11bmtub3du
LWxpbnV4LWdudS4gQlIyX3Bvd2VycGMgaXMgMzItYml0IG9ubHk6Cj4+ICsJIyBCUjJfcG93ZXJw
YzY0IGFuZCBCUjJfcG93ZXJwYzY0bGUgYXJlIHNlcGFyYXRlIHN5bWJvbHMsIGJvdGgKPj4gKwkj
IHNlbGVjdGluZyBCUjJfQVJDSF9JU182NCwgYW5kIGFyZSBub3QgYWZmZWN0ZWQuCj4+ICsJZGVm
YXVsdCB5IGlmICFCUjJfQVJNX0NQVV9BUk1WNSAmJiAhQlIyX3Bvd2VycGMKPj4gKwo+PiAgY29u
ZmlnIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSAo+PiAgCXN0cmluZwo+PiAgCWRlZmF1bHQg
ImFybXY1dGUiIGlmIEJSMl9BUk1fQ1BVX0FSTVY1Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
