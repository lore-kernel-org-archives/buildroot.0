Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D4DCCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 12:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7703780D52;
	Sat, 18 Oct 2025 12:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyciCs-hWYHy; Sat, 18 Oct 2025 12:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 845B380D6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 845B380D6D;
	Sat, 18 Oct 2025 12:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3CC41CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 12:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E9D407E0
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 12:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYaMPlSInsNj for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 12:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC48A407C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC48A407C9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC48A407C9
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 12:59:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4270a3464caso650213f8f.1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 05:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760792369; x=1761397169;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=60vPs6qw0Cud/twnBAZ7h0ytys9TZBRvI71BARQChGM=;
 b=Z3kVItIQ1BCh3/0QJoGCK4OmhASw5p3YU+HDbtS3OOtq6ocFPOozimoW2bTO6mYTZM
 Wf+XbWVUkqXiN6WM88UK0gCc7ugF9Bt2SKlSHre2K+6nUOIETEgwaNOdd2yXIgxRPUgT
 3ATbSK9zdvxAxcsIZLZeCT7E46OU9JZDvhWF0qfBAZRlrtBn0dIvfY7mBXw38WEimN3z
 uhoR1x8CKMN/11/bQ7Lm/K6zP3RHx1heoJYr3VJnYUeH/iSPPIyu36cb1UQL58xl+Qv2
 E+CvLPPCp1BMJsRRCGkvFkWT+W+kWDOD3Vz6xGsc33L5jdNzIB5KYLNqPVv/aklXAJxn
 RVzQ==
X-Gm-Message-State: AOJu0YxhDNAhUxSvNzPBtzClgLzHuZrJOSX7lZV/2ILQu+sn5PYPIa2j
 3nYqXOXmkD3Qmv3pxMEKwVEgDh6bLtspKh9+9UWtZdNPe42Ta3iTpSZM66Yl2g==
X-Gm-Gg: ASbGncu6mZgYguee1desENdeXL/KrM6UYtsxAXe+Cq+6qjEMU9jEtjVqxsQ420j9PN0
 /DCvH6nHJQ3AZE/WULaDrKShR9L0Zy6XopYEbb3tUbrxTT5DoIfpcDrBJkzVe7WEv+30d3N+ECd
 AMAxYJCtxBq8q9lvUO5+hTwNqK2Omyt7LhrurQlmmZLnJ/oCeYNSrly6O/yvRhPSP5zFKc8+M9G
 6XLdIr7n2eFofTm3JkG5oZzJSKoRYZDi+zFpfoPp2xHEGV8A6WCDZQNGn/9AUdFCpllgX1rSfbV
 NpaW7bBE2NP7rqLO9Hq3KgC0/IVZoGWQp/EdUcnS46Q8OhV5TQjn5aybGo0AYloeFjJUQX+pNRE
 CtCQAVxy3vL63NQ2BMm3daX/jKrHvtgUaW74uPJwtJCQ39yfLVLaTmHXkGt2OyXwWH5VF+uyDlh
 PImxsqlCCrUIo19eqUKDbJ5XH5rXYQGZvRxNUDJ6SzXx92lHBLxou2UotarCM=
X-Google-Smtp-Source: AGHT+IHcysx4RQ4kvm+3+uJLJeU2cjbAuJw1VmcmvYviSOZteFtBUlAAvlT/5jClVDwyqCsYFYLwPA==
X-Received: by 2002:a5d:64c7:0:b0:427:8bc:a3c5 with SMTP id
 ffacd0b85a97d-42708bca6b2mr3094551f8f.37.1760792369371; 
 Sat, 18 Oct 2025 05:59:29 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9853sm4985492f8f.33.2025.10.18.05.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:59:28 -0700 (PDT)
Message-ID: <cf218470-4b20-4aa8-882d-58306510ba07@gmail.com>
Date: Sat, 18 Oct 2025 14:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760792369; x=1761397169; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=60vPs6qw0Cud/twnBAZ7h0ytys9TZBRvI71BARQChGM=;
 b=kyN/ZsdsLcSJpV+HmdJmH+45vEjXMvZSRGnrOcjEjkj8+FwaL9fbQROQmz3iR9jd6i
 I3BA/mZz61rCqjAv5bO2Et8qA6gVB3kAnTI25r2pWW62aclL8fworqvFqIbwNT+orY9b
 iDlDWXjVp2TMh7gXXkTJyZoNqLl6GlxkVUOHmeqPzSuEzyxnkblKvkN/XchouahP9chW
 ay9x9pUWxDkc00rnyQ0BWuYIo+oI1UKoOdo0amhjQmwp2hdXdd0sgpJ3xIa7t2L8WHtT
 y5M28yHlnijEqBMrZhPJ7DvfRj5z049hJ9YtrEQaKRmj4CQEv1O4x3y1/9U0z0DtCu0z
 GIYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kyN/Zsds
Subject: Re: [Buildroot] [PATCH 0/4] Update for package/waffle
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

CgpMZSAwNS8xMC8yMDI1IMOgIDE1OjI0LCBSYXBoYWVsIEdhbGxhaXMtUG91IGEgw6ljcml0wqA6
Cj4gU2V2ZXJhbCBjb21taXQgZm9yIGEgc2luZ2xlIHBhY2thZ2UgdXBkYXRlOgoKSGksCgpKdXN0
IGEgZ2VudGxlIHBpbmcgcmVnYXJkaW5nIHRoaXMgcGF0Y2guCgpUaGFua3MgZm9yIHlvdXIgdGlt
ZS4KCkJlc3QgcmVnYXJkcywKUmFwaGHDq2w+Cj4gICAgKiBXZWJzaXRlIGhhcyBjaGFuZ2VkCj4g
ICAgKiBXYWZmbGUgaGFzIG1vdmVkIGZyb20gY21ha2UgdG8gbWVzb24KPiAgICAqIEJ1bXAgdG8g
bGF0ZXN0IHZlcnNpb24gc2luY2Ugb2xkIHJlZmVyZW5jZSB3YXMgb3ZlciA0eSBvbGQKPiAgICAg
IChwcm9qZWN0IGlzbid0IHRvbyBsaXZlbHksIGxhdGVzdCBjaGFuZ2UgaXMgZnJvbSBhIHllYXIg
YWdvKQo+ICAgICogVXNlIGdpdCBkb3dubG9hZCBtZXRob2Qgc2luY2UgbGF0ZXN0IGNoYW5nZSBp
c24ndCBhbiBvZmZpY2lhbAo+ICAgICogUmVtb3ZlIGRlcHJlY2F0ZWQgb3IgYWxyZWFkeSBtZXJn
ZWQgcGF0Y2hlcwo+ICAgICogRml4IGRlZmF1bHQgYnJlYWtpbmcgcGtnX2NvbmZpZ19wYXRoCj4g
Cj4gSXQgaXMgbXkgZmlyc3QgdGltZSB1cGRhdGluZyBhIHBhY2thZ2UsIHBsZWFzZSB0byBub3Qg
aGVzaXRhdGUgdG8KPiBjb21tZW50LiAgSSBpbml0aWFsbHkgdGhvdWdodCBhYm91dCBzcXVhc2hp
bmcgYWxsIGNvbW1pdHMgdG9nZXRoZXIsIGJ1dAo+IHNpbmNlIHRoaXMgaXMgYSBwcmV0dHkgY29t
cGxleGUgdXBkYXRlIEkgcHJlZmVycmVkIHNlbmRpbmcgYSBzZXJpZXMgaW4KPiBvcmRlciB0byBl
YXNlIHJlYWRhYmlsaXR5IGFuZCBjb2RlIHJldmlldy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBo
YWVsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+Cj4gLS0tCj4gUmFwaGFlbCBH
YWxsYWlzLVBvdSAoNCk6Cj4gICAgICAgIHBhY2thZ2Uvd2FmZmxlOiBmaXggd2Vic2l0ZSByZWZl
cmVuY2UKPiAgICAgICAgcGFja2FnZS93YWZmbGU6IGJ1bXAgdG8gNWYxZjQ4Mjg3ZTgwNjU0NGQ3
NDVlOWE4ZjVhZWQ0NzIzNGM2MTI5Mgo+ICAgICAgICBwYWNrYWdlL3dhZmZsZTogcmVtb3ZlIHBh
dGNoZXMKPiAgICAgICAgcGFja2FnZS93YWZmbGU6IGZpeCBwa2dfY29uZmlnX3BhdGggdmFsdWUK
PiAKPiAgIC4uLnJkLWNmbGFncy1mcm9tLS5wYy1maWxlcy10by13YWZmbGUtY2ZsYWdzLnBhdGNo
IHwgNDIgLS0tLS0tLS0tLS0tLS0tCj4gICAuLi4wMi13YXlsYW5kLWZpeC1idWlsZC1hZ2FpbnN0
LXZlcnNpb24tMS0yMC5wYXRjaCB8IDU5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHBhY2th
Z2Uvd2FmZmxlLzAwMDMtZHJvcC1DLWRlcGVuZGVuY3kucGF0Y2ggICAgICAgIHwgNDYgLS0tLS0t
LS0tLS0tLS0tLS0KPiAgIHBhY2thZ2Uvd2FmZmxlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgIHBhY2thZ2Uvd2FmZmxlL3dhZmZsZS5oYXNoICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgIHBhY2thZ2Uvd2FmZmxlL3dhZmZsZS5tayAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMzkgKysrKysrKy0tLS0tLS0KPiAgIDYgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTcwIGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29t
bWl0OiA3YmJjNjZhMzllNmUxOGQ1Mjk4NTY0MTY3YjQyZTU2YjgyYzkzNjBhCj4gY2hhbmdlLWlk
OiAyMDI1MTAwNS13YWZmbGUtMzI2NWVhYWRkNWUwCj4gCj4gQmVzdCByZWdhcmRzLAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
