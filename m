Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6C8C369D1
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 11:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A31C417CC;
	Thu, 24 Apr 2025 11:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_fZfKAsT4WY; Thu, 24 Apr 2025 11:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DD1417C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DD1417C2;
	Thu, 24 Apr 2025 11:24:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A59228C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 11:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E33CE813CE
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 11:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZooC5s3QcvA for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 11:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C551C811DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C551C811DD
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C551C811DD
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 11:24:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so475649f8f.3
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 04:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745493885; x=1746098685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5E25VHky5UwSFgI+nAKscfyjXfW1vlA9eazggMnAeYk=;
 b=w1YXwoSAv5nMfiWedypqTlaNANrKDKbhhKDr7qaU86l/QVt6Wj+sBOfzSWnvyJqC7f
 ZlukNAW2Ah63Esw+paroLD3bZvJZ758rLXn5b2TywxvK3Msjvd3IcCNJkk2zLvNQ8HE7
 /htClosOz14YhMV8A3ZAe0PDjYdagCqzz9t2ioUyxLILU7VjEsNFrkad56kZszKpF/lP
 quHVsJtf5gQwHJIHGMMhAsbGOJNoSxLOGjudjNOSfz00fRpK/r9NeuDdvtQlLxqMqth6
 vKkIdnVYu1r5OjVYh7VrnhSyNtl7I77bcq3t8vpDypka8dC4Xjz3ijSePx6Iw56Q3Ab0
 lyzw==
X-Gm-Message-State: AOJu0YybNFb1+MBTSRWcUU+1C9PSV3NVBluMCdjlDK/U1v6QTVqnJvNV
 NhPts6xzuRUdheMQGJ9ReMoXXWX7O+Nv7tPB9SNAmLO0Qd75Itsh1YbiJpIyVYY=
X-Gm-Gg: ASbGncuh+9mMZnpVDT8qk7PlSYHJNE7aO7DWQS/T6ZG+msq5RyPZten6egIHcmhLvVL
 VMLPeunUOlk7zG3MthvHaDOoNPJnNIiW6rg9SDmQ0MovktUvfFZGYOqDRwPqDJDR8cHwlBmdw+h
 aIW/ktcz/CyC+Fb0G1dolkvTHWXOjasLLvaRlAj7K3bNKnCaow3+NAonFerXADbk5X7HrtYbsV4
 m57Yh3xfDN7nNtmIF8Wu8+3D6RJy8G1XF4ZK6PHlluycoryE37BN/aUTYbYgZfC7cW/HN6RV+O0
 xC4XfbRyh7fIUsTMyrhqJdYMQI3COrIKn2bFAUzW9gtbA/FP/WJEN8l93HyRzssrqYEtjz5rDtG
 HnvJGJb6Klhj4phcZhTdKqXaJAlVm7hg=
X-Google-Smtp-Source: AGHT+IGRlkii2ER7yZga09k0xvMRxdyVJtvgEPzDHtWxsHG8uewf9UwawGrmuRU/T7YZSaYkTEfZzw==
X-Received: by 2002:a5d:59ae:0:b0:39e:e217:28d0 with SMTP id
 ffacd0b85a97d-3a06cf4e366mr1677811f8f.4.1745493884827; 
 Thu, 24 Apr 2025 04:24:44 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4a8070sm1820415f8f.18.2025.04.24.04.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 04:24:44 -0700 (PDT)
Message-ID: <977cdc9c-0d8c-4429-b9ac-a3f31d52af2e@smile.fr>
Date: Thu, 24 Apr 2025 13:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
 <c9ae19bbafb52e031db812448725f3ab@free.fr>
Content-Language: en-US
In-Reply-To: <c9ae19bbafb52e031db812448725f3ab@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745493885; x=1746098685; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5E25VHky5UwSFgI+nAKscfyjXfW1vlA9eazggMnAeYk=;
 b=bFtV1FFJBozymCdIc0ibqkDqq3LHOSMqWstGyBW9Lcl04Sa0lrAOAWRH3aR61Wgyfu
 d3xKo5s0Cm+4SSBksEHg5rfPAl/+coV1E4E4Yq0fsvN3jjlfy3PY6uuFlIXZ/lpObx6P
 LkEKReVj0etO1qKrJXnE+ejxe29GEy7jsrwwU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=bFtV1FFJ
Subject: Re: [Buildroot] [PATCH 1/2] support/test: new dust runtime test
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBoaSBhbGwsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpJJ3ZlIGp1c3Qgc2Vu
dCB0aGUgdjIgb2YgdGhpcyBwYXRjaCwgYWRkcmVzc2luZyB0aGUgcmVxdWVzdGVkIGNoYW5nZXMu
CgpMZXQgbWUga25vdyBpZiBhbnl0aGluZyBlbHNlIGlzIG5lZWRlZC4KCkJlc3QgcmVnYXJkcywK
CkVsIE1laGRpCgpMZSAyMy8wNC8yMDI1IMOgIDIxOjMwLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3Jp
dMKgOgo+IEhpIEVsIE1laGRpLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghCj4KPiBPbiAyMi8w
NC8yMDI1IDE2OjU1LCBFbCBNZWhkaSBZT1VORVMgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gQWRk
IGEgcnVudGltZSB0ZXN0IGZvciB0aGUgJ2R1c3QnIHBhY2thZ2UgdG8gdmVyaWZ5IHRoYXQgdGhl
IGJpbmFyeQo+PiBleGVjdXRlcyBjb3JyZWN0bHkgaW4gYSBtaW5pbWFsIGJ1aWxkcm9vdCByb290
ZnMuIFRoZSB0ZXN0IGNoZWNrcyB0aGF0Ogo+PiAtICdkdXN0IC0tdmVyc2lvbicgcnVucyB3aXRo
b3V0IGVycm9yCj4+IC0gJ2R1c3QnIGNhbiBhbmFseXplIGEgZGlyZWN0b3J5IHN0cnVjdHVyZSB3
aXRoIGZpbGVzCj4+IC0gVGhlIG91dHB1dCBpbmNsdWRlcyB0aGUgZXhwZWN0ZWQgZGlyZWN0b3J5
IG5hbWVzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3Vu
ZXNAc21pbGUuZnI+Cj4+IC0tLQo+PiDCoHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfZHVzdC5weSB8IDMxICsrKysrKysrKysrKysrKysrKysrKysKPj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMzEgaW5zZXJ0aW9ucygrKQo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X2R1c3QucHkKPj4KPj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHVzdC5weSAKPj4gYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X2R1c3QucHkKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5k
ZXggMDAwMDAwMDAwMC4uODVjMDU5MzRlNQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHVzdC5weQo+PiBAQCAtMCwwICsxLDMxIEBA
Cj4+ICtpbXBvcnQgb3MKPj4gK2ltcG9ydCBpbmZyYS5iYXNldGVzdAo+PiArCj4+ICsKPj4gK2Ns
YXNzIFRlc3REdXN0KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4+ICvCoMKgwqAgY29uZmlnID0g
aW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKPj4gK8KgwqDCoMKgwqDC
oMKgICIiIgo+PiArwqDCoMKgwqDCoMKgwqAgQlIyX1BBQ0tBR0VfRFVTVD15Cj4+ICvCoMKgwqDC
oMKgwqDCoCBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPj4gK8KgwqDCoMKgwqDCoMKgICMgQlIy
X1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPj4gK8KgwqDCoMKgwqDCoMKgICIiIgo+PiAr
Cj4+ICvCoMKgwqAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+PiArwqDCoMKgwqDCoMKgwqAgY3Bpb19m
aWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAKPj4gInJvb3Rmcy5j
cGlvIikKPj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12NyIs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGtlcm5lbD0iYnVpbHRpbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG9wdGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKPj4gK8Kg
wqDCoMKgwqDCoMKgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+PiArCj4+ICvCoMKgwqDCoMKgwqDC
oCAjIENoZWNrIHRoYXQgZHVzdCBpcyBpbnN0YWxsZWQgYW5kIGNhbiBiZSBleGVjdXRlZAo+PiAr
wqDCoMKgwqDCoMKgwqAgc2VsZi5hc3NlcnRSdW5PaygiZHVzdCAtLXZlcnNpb24iKQo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoCAjIENyZWF0ZSBhIHRlc3QgZGlyZWN0b3J5IHN0cnVjdHVyZSB3aXRo
IHNvbWUgZmlsZXMKPj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0UnVuT2soIm1rZGlyIC1w
IHRlc3RkaXIvc3ViZGlyIikKPj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0UnVuT2soImRk
IGlmPS9kZXYvemVybyBvZj10ZXN0ZGlyL2EgYnM9MUsgY291bnQ9MTAiKQo+PiArwqDCoMKgwqDC
oMKgwqAgc2VsZi5hc3NlcnRSdW5PaygiZGQgaWY9L2Rldi96ZXJvIG9mPXRlc3RkaXIvc3ViZGly
L2IgYnM9MUsgCj4+IGNvdW50PTUiKQo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCAjIFJ1biBkdXN0
IG9uIHRoZSB0ZXN0IGRpcmVjdG9yeSBhbmQgY2FwdHVyZSB0aGUgb3V0cHV0Cj4+ICvCoMKgwqDC
oMKgwqDCoCBvdXRwdXQgPSBzZWxmLmVtdWxhdG9yLnJ1bigiZHVzdCB0ZXN0ZGlyIiwgdGltZW91
dD0xMCkKPgo+IEkgaGF2ZSB0aGUgc2FtZSBjb21tZW50IGFzIGluIHRoZSAiYmF0IiBydW50aW1l
IHRlc3QuCj4KPiBUaGUgZW11bHRvci5ydW4oKSBmdW5jdGlvbiByZXR1cm5zIGEgdHVwbGUgKG91
dHB1dCwgZXhpdF9jb2RlKS4gU2VlIFsxXS4KPgo+IENvdWxkIHlvdToKPiAxLiBnZXQgdGhlIG91
dHB1dCBhcnJheSBhbmQgdGhlIHJldHVybiBjb2RlIGluIHNlcGFyYXRlIHZhcmlhYmxlcwo+IMKg
IChpbiB5b3VyIHBhdGNoIG91dHB1dFsxXSBpcyBpbiBmYWN0IHRoZSBlcnJvciBjb2RlIHdoaWNo
IGlzCj4gwqDCoCBub3QgY2hlY2tlZCkKPiAyLiBjaGVjayB0aGUgcmV0dXJuIGNvZGUgaXMgYSBz
dWNjZXNzIChiZWZvcmUgY2hlY2tpbmcgdGhlCj4gwqDCoCBvdXRwdXQgY29udGVudCkKPiAzLiBq
b2luIHRoZSBvdXRwdXQgc3RyaW5nIHdpdGggYSBuZXctbGluZSwgZS5nLiAiXG4iLmpvaW4ob3V0
cHV0KQo+IMKgwqAgdG8gaGF2ZSBhIHN0cmluZyB0aGF0IHdpbGwgYmV0dGVyIGxvb2sgbGlrZSB0
byB0aGUgYWN0dWFsCj4gwqDCoCBvdXRwdXQuCj4KPiBTZWUgZm9yIGV4YW1wbGUgWzJdLgo+Cj4g
SSBhbHJlYWR5IGFwcGxpZWQgdGhlIHNlY29uZCBwYXRjaCBvZiB0aGlzIHNlcmllcywgc28geW91
IGNhbgo+IHNpbXBseSBzZW5kIGEgdjIgb2YgdGhpcyBydW50aW1lIHRlc3QuCj4KPj4gK8KgwqDC
oMKgwqDCoMKgIHNlbGYuYXNzZXJ0SW4oInRlc3RkaXIiLCAnICcuam9pbihvdXRwdXRbMF0pKQo+
PiArwqDCoMKgwqDCoMKgwqAgc2VsZi5hc3NlcnRJbigic3ViZGlyIiwgJyAnLmpvaW4ob3V0cHV0
WzBdKSkKPgo+IFsxXSAKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9ibG9iLzIwMjUuMDIuMS9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkjTDE4
Nwo+IFsyXSAKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9i
bG9iLzIwMjUuMDIuMS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2F0dHIucHkj
TDYyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
