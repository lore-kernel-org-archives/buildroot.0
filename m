Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69480C54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 20:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291C960883;
	Fri, 23 May 2025 20:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCG9Zf6TDnfO; Fri, 23 May 2025 20:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0B160678
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0B160678;
	Fri, 23 May 2025 20:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C94119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D518A820E0
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5j6MD4q7KQZo for <buildroot@buildroot.org>;
 Fri, 23 May 2025 20:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E367F82093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E367F82093
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E367F82093
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:54:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-44b1f5b917fso1068375e9.3
 for <buildroot@buildroot.org>; Fri, 23 May 2025 13:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033639; x=1748638439;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/MMlGXOXLivnVdnQHLXQTO2d2FSiCMBdg+FuWBCIN4=;
 b=L4XyFhLspJv9jTeJDuDUiM9UK3XAlRgbmSrNsLQ3B7I2UFoZqcnj36as7dBFwvU5tN
 /jFYWmX5KBfC0Bj9DPKH5w9wjE3RtTGycBEV81zHTUDFPuc+dBoqDbuq+dTQXdnu9ZVP
 wkK+6rM+2H+cJ+sKRLxD3o8IxvIrwwT0gaEPPKZfucM8Ifgw9cclcjOBXANPk/TVG8tI
 CKiqPZPb6IfNaw899GfCmH5vWezCF/PYYHqgXP0lBhF6cfOsgCfpK3C7pT+BIvcZt8Ig
 51n93ROMGmk2EaeEnsfDEm352Uq2La3NWWF2+0kim6F6IiYk013thpp/bOcjYJl1/sXm
 MAMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmEXlMCJ4zsgomEH7UNsknD0EPbfvHKuvHzf3sJsNJs0glotLN336CTDmQ4K15S/WO+Bn/5NAj9S4=@buildroot.org
X-Gm-Message-State: AOJu0Yx4v9B6Am7Pz19ribc0KBTq0EQqgxVfc7aDZyyCqI+odMp9ACIF
 7rFrKMdW1itePU9pItrM/NmstESmmJ+YfhUQLhfuGi3OlVeSmDAzjO4Ezk+zEOyxtQQ=
X-Gm-Gg: ASbGncs4ctKbdqPpQjhTcd1vxItSh47UnMCNvIRVXrOshdlbn7duWPI0uY0gnDa1VQG
 gKfzlyBRs5ifqpNzCvVHHhXBt+ANdGFsFUIPGLnHKX1lOcCc10+x1h3wNv+Bakjqsorag6p717R
 7IUfUFJnKnaJpq48II7AtRCtA2FMWxOOy9q652L9K2MxWtzpuuTsi2nQ10MpH3JpivEH/oqGzKH
 6B2/CP/VGWRBp+3tXQiIAJkDafAC/VZ8fZsxPMuj5kgD5jIvj5AyCaIj+BwDE8ZcPHWiyKiSVE7
 PanTLCzZRVdKimcY3svNNEomHbUlwkunWuJyqdS/qXXwP+cdOfLvn2taspbSg/9PqG0m/ZYkMgD
 Q62ZWTDalFeozlbzzPyOkN+vMClZ3qLdItR6KXuxXT3qmG/dVw3yUYQqv8EUisZvhMdtNnqO7Q4
 eF/ZqKJgd7Bfd59g==
X-Google-Smtp-Source: AGHT+IFDJBpniARNG57OY5Hno8mh52cWC69kYP+SgOgfhXbD8O4zYqiT8yz1pDFGsrzRsP0FgH8YeQ==
X-Received: by 2002:a05:600c:82c3:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-44c919e0feemr4331175e9.9.1748033638927; 
 Fri, 23 May 2025 13:53:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cce08411sm53033f8f.51.2025.05.23.13.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 13:53:58 -0700 (PDT)
Message-ID: <a1c7723c-0cef-4c11-9566-99fefde68738@smile.fr>
Date: Fri, 23 May 2025 22:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250523174313.7056-6-vincent.stehle@laposte.net>
Content-Language: fr
In-Reply-To: <20250523174313.7056-6-vincent.stehle@laposte.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1748033639; x=1748638439; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8/MMlGXOXLivnVdnQHLXQTO2d2FSiCMBdg+FuWBCIN4=;
 b=J3rEubHxlJWwsIGK23ONeAGXt8ip15XyKFLtOJtKNtlq773WOUfnHCjE7/ovmiAXOd
 Vi7kYupSOHSjbaiN/Cn1tTbgEEW24gpJN7nh6aMda+aLZnGKCLTjSrV0iflVRJrqH2yb
 6hWDqVhxc9RchhYFsHp/4fMzWFpvYGZkYfl/8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=J3rEubHx
Subject: Re: [Buildroot] [PATCH 5/5] configs/qemu_hppa_b160l: new defconfig
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

SGVsbG8gVmluY2VudCwgQWxsLAoKTGUgMjMvMDUvMjAyNSDDoCAxOTo0MywgVmluY2VudCBTdGVo
bMOpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBBZGQgYSBkZWZjb25maWcgdG8gcnVuIExp
bnV4IG9uIGEgSFAgVmlzdWFsaXplIEIxNjBMIFBBLVJJU0MgV29ya3N0YXRpb24sCj4gZW11bGF0
ZWQgd2l0aCBRZW11Lgo+IAo+IFdoaWxlIGF0IGl0LCBhZGQgbXlzZWxmIGluIERFVkVMT1BFUlMu
CgojIHVuYW1lIC1hCkxpbnV4IGJ1aWxkcm9vdCA2LjEyLjI3LTMyYml0ICMxIFNNUCBGcmkgTWF5
IDIzIDIwOjIyOjA0IFVUQyAyMDI1IHBhcmlzYyBHTlUvTGludXgKCiMgY2F0IC9wcm9jL2NwdWlu
Zm8KcHJvY2Vzc29yCTogMApjcHUgZmFtaWx5CTogUEEtUklTQyAxLjFlCmNwdQkJOiBQQTczMDBM
QyAoUENYLUwyKQpjcHUgTUh6CQk6IDI1MC4wMDAwMDAKcGh5c2ljYWwgaWQJOiAwCnNpYmxpbmdz
CTogMQpjb3JlIGlkCQk6IDAKY2FwYWJpbGl0aWVzCTogb3MzMiBudmFfc3VwcG9ydGVkICgweDAy
KQptb2RlbAkJOiA5MDAwLzc3OC9CMTYwTCAtIE1lcmxpbiBMMiAxNjAgKDkwMDAvNzc4L0IxNjBM
KQpbLi4uXQoKV2VsbCwgaXQgd29ya3MgbWF5YmUgdGhlIG5leHQgc3RlcCBpcyB0byBhZGQgR05V
L0h1cmQgc3VwcG9ydCBpbiBCdWlsZHJvb3QgPyA6KQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0
ZS5uZXQ+Cj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAtLS0K
PiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgYm9hcmQvcWVt
dS9ocHBhLWIxNjBsL3JlYWRtZS50eHQgIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBjb25maWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcgfCAxOCArKysrKysrKysr
KysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBib2FyZC9xZW11L2hwcGEtYjE2MGwvcmVhZG1lLnR4dAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZmlncy9xZW11X2hwcGFfYjE2MGxfZGVmY29uZmlnCj4gCj4gZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggNDdmM2UwMzBlNS4uZjE4NTMwN2Y2
MCAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0zMzg1
LDggKzMzODUsMTAgQEAgRjoJYXJjaC9Db25maWcuaW4uaHBwYQo+ICBGOglhcmNoL2FyY2gubWsu
aHBwYQo+ICBGOglib2FyZC9hcm0vZm91bmRhdGlvbi12OC8KPiAgRjoJYm9hcmQvYmFuYW5hcGkv
YmFuYW5hcGktbTItemVyby8KPiArRjoJYm9hcmQvcWVtdS9ocHBhLWIxNjBsLwo+ICBGOgljb25m
aWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCj4gIEY6CWNvbmZpZ3MvYmFuYW5hcGlfbTJf
emVyb19kZWZjb25maWcKPiArRjoJY29uZmlncy9xZW11X2hwcGFfYjE2MGxfZGVmY29uZmlnCj4g
IEY6CWNvbmZpZ3MvdWV2bTU0MzJfZGVmY29uZmlnCj4gIEY6CXBhY2thZ2UvaTd6Lwo+ICBGOglw
YWNrYWdlL21zci10b29scy8KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9ocHBhLWIxNjBsL3Jl
YWRtZS50eHQgYi9ib2FyZC9xZW11L2hwcGEtYjE2MGwvcmVhZG1lLnR4dAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNzVlNTBlNDUxYgo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9ib2FyZC9xZW11L2hwcGEtYjE2MGwvcmVhZG1lLnR4dAo+IEBAIC0wLDAgKzEsMzEg
QEAKPiArSW50cm9kdWN0aW9uCj4gKz09PT09PT09PT09PQo+ICsKPiArVGhlIHFlbXVfaHBwYV9i
MTYwbF9kZWZjb25maWcgaXMgbWVhbnQgdG8gcnVuIExpbnV4IG9uIGEgSFAgVmlzdWFsaXplIEIx
NjBMCj4gK1BBLVJJU0MgV29ya3N0YXRpb24sIGVtdWxhdGVkIHdpdGggUWVtdS4KPiArCj4gK0J1
aWxkaW5nCj4gKz09PT09PT09Cj4gKwo+ICsgICQgbWFrZSBxZW11X2hwcGFfYjE2MGxfZGVmY29u
ZmlnCj4gKyAgJCBtYWtlCj4gKwo+ICtHZW5lcmF0ZWQgZmlsZXMgdW5kZXIgb3V0cHV0L2ltYWdl
czoKPiArCj4gKyogcm9vdGZzLmV4dDQ6IHRoZSByb290IGZpbGVzeXN0ZW0uCj4gKyogdm1saW51
eDogdGhlIExpbnV4IGtlcm5lbC4KPiArCj4gK1J1bm5pbmcgdW5kZXIgUWVtdQo+ICs9PT09PT09
PT09PT09PT09PT0KPiArCj4gK1J1biB0aGUgZW11bGF0aW9uIHdpdGg6Cj4gKwo+ICsgIHFlbXUt
c3lzdGVtLWhwcGEgXAo+ICsgICAgICAtbWFjaGluZSBCMTYwTCBcCj4gKyAgICAgIC1hcHBlbmQg
InJvb3R3YWl0IHJvb3Q9L2Rldi9zZGEiIFwKPiArICAgICAgLWhkYSBvdXRwdXQvaW1hZ2VzL3Jv
b3Rmcy5leHQ0IFwKPiArICAgICAgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL3ZtbGludXggXAo+ICsg
ICAgICAtbm9ncmFwaGljIFwKPiArICAgICAgLXNtcCAyICMgcWVtdV9ocHBhX2IxNjBsX2RlZmNv
bmZpZwo+ICsKPiArVGhlIGxvZ2luIHByb21wdCB3aWxsIGFwcGVhciBpbiB0aGUgdGVybWluYWwg
dGhhdCBzdGFydGVkIFFlbXUuCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9ocHBhX2IxNjBs
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMTg4ZjE5NWY3Ngo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9jb25maWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcKPiBAQCAtMCwwICsx
LDE4IEBACj4gK0JSMl9ocHBhPXkKPiArQlIyX3BhcmlzYzExPXkKPiArQlIyX1BBQ0tBR0VfSE9T
VF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzEyPXkKPiArQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJv
YXJkL3FlbXUvcGF0Y2hlcyIKPiArQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15Cj4g
K0JSMl9TWVNURU1fREhDUD0iZXRoMCIKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0i
Ym9hcmQvcWVtdS9wb3N0LWltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9
IiQoQlIyX0RFRkNPTkZJRykiCj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi4xMi4yNyIKPiArQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJ
Rz15Cj4gK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiArQlIyX1RBUkdF
VF9ST09URlNfRVhUMj15Cj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4gKyMgQlIyX1RB
UkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiArQlIyX1BBQ0tBR0VfSE9TVF9RRU1VPXkKPiAr
QlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
