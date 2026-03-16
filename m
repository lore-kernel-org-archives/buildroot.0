Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDBFEFCBD4
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFFA60719;
	Mon, 16 Mar 2026 08:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOv1-Sm6JKfU; Mon, 16 Mar 2026 08:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D1760E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773648983;
	bh=mjVsEnp6oQrd+YmH5NYRncgixCtYzNor4xWGO4TYvQE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zrcx1ZhUhlrtek8OhB0fAdwuGklxs+JgF3jHVVtQLrx709VWEgkI5nmptuw4IW3Sv
	 PWtSes7FcFrvJMJDrji98KSE1gAnihdGaWHrOF4HpL7FMK3MQfZdMrPoKOd5UBVi8c
	 MWTlEF2AQg5ubXi2TJBYhbwTsZaPsUJ9arbUoKdrfv8ct3308ACeICLNsEqTECRmrK
	 +5DfOSYjwRxa+g6S+L/Z2k9JInQqQma/TqjHifKCm9dxZ1zC6iGCT9fsb7nJiTIort
	 iGpX6XqwWhSAeSBHlqD1agtYKvW8ymaTVuyw9IaXjYqwdwoCbe6MvD8/RG8ZF74Zmw
	 P32IlqjRDnzBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D1760E69;
	Mon, 16 Mar 2026 08:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6B51B4
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D58260E69
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOFwzDEMYxLD for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:16:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2176360719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2176360719
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2176360719
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:16:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so48333615e9.3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773648978; x=1774253778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9g3WXnqDx6LRuzlOFsbv5CXWR0F//N/Qx9iPTKkIeY=;
 b=B/ULxFQFJflqgDAvUGPo6c9ST1NSZnmvNq4bPl2SZC4cdvFF7h4RLUcaq9Rc7S90zE
 90cCu3VkahwN2H47UMP0+0NSe2qh066CgfW1EAb1hnEBDyQRbpd5HEUXDMO0BdSGbTDz
 erI4ca26udk7jU/RbslgAJDW2YRYx7apVL6cnPCvaBzNhiSoWJGAAjxhn3qoHRZaRVBj
 mD637w9Nte8VmjbDGJ/Kz6GoY64HraWUN2zTYpZQh8btfUdNbf/knz2PIQvbbvaDDJlr
 o+l4ER/ileYWhhrVTdfKnxsSkH8S679aHbfCNeACIQu0cOmBMX76MFPpDIvP3syGYAcA
 G3IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMg4tKM0unP6F0HAn2QTH9zUMpNmkYdhB59cK6/I+7CJTdXQDtFyhVZZ08qGUBbirJ6ifhbsTADOE=@buildroot.org
X-Gm-Message-State: AOJu0Yz5nI5gtUbAQ5lcLTFcJjUrLaVLlbK3Z2nqvFLQTZUVEUduvALo
 HdNIDieK4tskhnxgC1x1x5WklMqElqizw136xJshj8+LwL7n/TkQB/pySPdgdFLJm4g=
X-Gm-Gg: ATEYQzw9QpQFVhK9wGLzVc7D8HprajAO65vZhRUAB5GC/Qpnqyl+tM/CavmZh8B6XCK
 N3paPTASdWSZ6o8cjo3PjAgggS+8hnImfwl3l0PTFLQnaPmzSotq7GWxfHiaxcTR7uD5cGCLbf3
 sXgBAQEWO8xiNjGn5RTffPqr52VrGFuPPvuREKQqRsOTZnd1fMcRpAzwK4IC47TKym9JD0zGL7x
 pLpnkXnOhUDHeIV2Oor5snq2Wo5brZtaKuhfUdfQTtjkpFDUqBNcXNT+gOjV/SHXVfFvOSj8iIa
 Z1LEUsWFdopACUNJANwfoIzVFVCSj8uoW3S/Sqz8YQ1AVu/fD+0xFRUVVBRhIfCSn1hrRH/CRf9
 o4bButAYnHTcrCF7uz6Xqf0ZC4XTFu1TJeRohZBX76TujxGeKfCTyw+ZWeAK9r/sOVOhk/jNmwM
 9MprpWZnzfACEXHCL0XbB20NOnHLPYJXVCCiWMcieMsVJcs32xPZbf7/PKvfEclQ+NviCOVuQsQ
 hplIfTgkdlX3d6tuQ==
X-Received: by 2002:a05:600c:3b14:b0:485:4526:ee06 with SMTP id
 5b1f17b1804b1-485566d70efmr203957795e9.11.1773648977860; 
 Mon, 16 Mar 2026 01:16:17 -0700 (PDT)
Received: from [10.5.90.77]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6b95sm433679135e9.6.2026.03.16.01.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 01:16:17 -0700 (PDT)
Message-ID: <7f33fdff-23ee-4d1a-aee8-f1c9a526dd2a@smile.fr>
Date: Mon, 16 Mar 2026 09:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
 <20260313161825.1224877-4-elmehdi.younes@smile.fr>
 <474ac709-3c95-4689-a55e-949923490fb6@gmx.de>
Content-Language: en-US
In-Reply-To: <474ac709-3c95-4689-a55e-949923490fb6@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773648978; x=1774253778; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9g3WXnqDx6LRuzlOFsbv5CXWR0F//N/Qx9iPTKkIeY=;
 b=s9h2aoLGExjDxnTkjgWylDKiI0Ygpuo//+foEdvFI26Gx4UTRnfEtseW9aKpW8sWMJ
 AeAp6Nf9u526QOPlJnaBzN3khfsH5OXDLNRdw+U1jvaYkZT3R4Fl4ZJyiMlg0UMqbtIV
 iDkjp4a31LOH9zO96Lmg53EaTqK0PtlMUhqFw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=s9h2aoLG
Subject: Re: [Buildroot] [PATCH v2 4/6] linux: split HOSTCC from flags
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

SGkgRmlvbmEsIEhpIGFsbCwKCk9uIDMvMTMvMjYgMTg6MjMsIEZpb25hIEtsdXRlIHdyb3RlOgo+
IEFtIDEzLjAzLjI2IHVtIDE4OjE4IHNjaHJpZWIgRWwgTWVoZGkgWU9VTkVTIHZpYSBidWlsZHJv
b3Q6Cj4+IFJ1c3QtZm9yLUxpbnV4IGludm9rZXMgcnVzdGMgbGlrZToKPj4gwqDCoCAkKFJVU1RD
X09SX0NMSVBQWSkgJChydXN0X2NvbW1vbl9mbGFncykgJChydXN0Y190YXJnZXRfZmxhZ3MpIFwK
Pj4gwqDCoMKgwqAgLUNsaW5rZXItZmxhdm9yPWdjYyAtQ2xpbmtlcj0kKEhPU1RDQykgKHNlZToK
Pj4gwqDCoMKgwqBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIv
cnVzdC9NYWtlZmlsZSNMNDA3KS4KPgo+IFR3byBuaXRwaWNrczoKPgo+IGEpIExpbmtpbmcgdG8g
Im1hc3RlciIgaXMgbm90IGdvaW5nIHRvIGJlIHN0YWJsZSBpZiBjaGFuZ2VzIHRvIHRoYXQgCj4g
TWFrZWZpbGUgYXJlIG1lcmdlZCAoaW5kZWVkIHJpZ2h0IG5vdyBMNDA3IGRvZXMgbm90IHBvaW50
IGF0IHRoYXQgCj4gc25pcHBldCksIHlvdSBuZWVkIHRvIHBpY2sgYSBmaXhlZCB0YWcgKHByZWZl
cmFibHkpIG9yIGNvbW1pdC4KPgo+IGIpIFRoZSBhdXRob3JpdGF0aXZlIExpbnV4IGtlcm5lbCBy
ZXBvc2l0b3J5IGlzIHRoZSBvbmUgb24gCj4gZ2l0Lmtlcm5lbC5vcmcgWzEsIDJdLCBub3QgdGhl
IEdpdGh1YiBtaXJyb3IsIHBsZWFzZSBsaW5rIHRoYXQgb25lLgo+ClRoYW5rcywgSSB3aWxsIGNo
YW5nZSB0aGUgbGlua3MuCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCgpCZXN0IHJlZ2FyZHMsCgpF
bCBNZWhkaQoKPgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvCj4gWzJdIAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvdjYuMTkvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNvYnRhaW4t
YS1jdXJyZW50LXNvdXJjZS10cmVlCj4KPj4gV2hlbiBCdWlsZHJvb3QgZW1iZWRzIGZsYWdzIGlu
dG8gSE9TVENDIChlLmcuIEhPU1RDQz0iZ2NjIDxjZmxhZ3M+IAo+PiA8bGRmbGFncz4iKSwKPj4g
cnVzdGMgdHJlYXRzIHRoZSBlbnRpcmUgdmFsdWUgYXMgdGhlIGxpbmtlciBwcm9ncmFtIG5hbWU7
IGFuZCBpdCBmYWlscy4KPj4KPj4gVGhpcyBwYXRjaCBwYXNzZXMgYSBjbGVhbiBIT1NUQ0MgYW5k
IG1vdmVzIGZsYWdzIHRvIHRoZSBkZWRpY2F0ZWQgCj4+IGhvc3Qtc2lkZQo+PiB2YXJpYWJsZXMg
YWNjZXB0ZWQgYnkgS2J1aWxkOgo+PiDCoMKgIC0gSE9TVENDwqDCoMKgwqDCoCA6PSAkKEhPU1RD
QykKPj4gwqDCoCAtIEhPU1RDRkxBR1PCoCA6PSAkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vi
c3QgLUkgLywtaXN5c3RlbSAKPj4gLywkKEhPU1RfQ0ZMQUdTKSkpCj4+IMKgwqAgLSBIT1NUTERG
TEFHUyA6PSAkKEhPU1RfTERGTEFHUykKPj4KPj4gU2luY2UgTGludXggdjQuMTksIEtidWlsZCBw
cm92aWRlcyBleHBsaWNpdCB2YXJpYWJsZXMgZm9yIGhvc3QgZmxhZ3MsIAo+PiBzbyBzcGxpdHRp
bmcKPj4gY29tcGlsZXIgdnMgZmxhZ3MgaXMgc3VwcG9ydGVkIHVwc3RyZWFtIChzZWU6Cj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvOTZmMTRmZTczOGI2OWRkOTdh
MzNlZmUzY2M4YWIzMzBhZjVmZDFmMQo+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGlu
dXgvY29tbWl0L2I5MGEzNjgwMDBhYmU1ZTAxNWUwYjA0NWNhMmZmN2MyMTczYjk0YzAKPj4gaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9mOTJkMTllMGVmOWJiYmIyOTg0
ODQ1NjgyZTc0MDkzNGFkNDU0NzNiIAo+PiApLgo+Pgo+PiBCdXQgd2l0aCB0aGlzIGNoYW5nZSB3
ZSBjYW4gaGF2ZSBwcm9ibGVtcyB3aXRoIG9sZGVyIGtlcm5lbCB2ZXJzaW9ucwo+PiAoPCA0LjE5
KSwgYXMgdGhlIEJ1aWxkcm9vdCBjb21taXQgYmVsb3cgd2FybmVkIHdoZW4gYXZvaWRpbmcgSE9T
VENGTEFHUwo+PiB0byBub3Qgb3ZlcnJpZGUgaW50ZXJuYWwga2VybmVsIGZsYWdzOgo+PiBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZGRlMDkwYzI5
OWIwMzU3ZmRiMWE0ZWM0NGFkOGQzMzJhYzU3ZjY1ZQo+Pgo+PiBJbiB0aGlzIGNhc2Ugd2UgQWRk
ZWQgY29uZGl0aW9uIG9uIEJSMl9MSU5VWF9LRVJORUxfUlVTVF9TVVBQT1JUIHRvIAo+PiBzcGxp
dCBIT1NUQ0MKPj4gb25seSB3aGVuIGtlcm5lbCBydXN0IHN1cHBvcnQgaXMgYWN0aXZhdGVkLCB3
aGljaCBpdCBtZWFucyBvbmx5IGZvcgo+PiBrZXJuZWwgdmVyc2lvbnMgPiA2LjEKPj4KPj4gQlIy
X0xJTlVYX0tFUk5FTF9SVVNUX1NVUFBPUlQgaXMgYWxzbyBpbnRyb2R1Y2VkIGluIENvbmZpZy5p
biBhcyBhIAo+PiBoaWRkZW4gc3ltYm9sCj4+IHRvIHN1cHBvcnQgdGhpcyBjb25kaXRpb25hbCBs
b2dpYywgd2hpbGUgdGhlIGZ1bGwgdXNlci1mYWNpbmcgCj4+IGNvbmZpZ3VyYXRpb24gYW5kCj4+
IGl0cyBkZXBlbmRlbmNpZXMgd2lsbCBiZSBjb21wbGV0ZWQgaW4gdGhlIG5leHQgY29tbWl0Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFbCBNZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxl
LmZyPgo+PiAtLS0KPj4gwqAgbGludXgvQ29uZmlnLmluIHzCoCAzICsrKwo+PiDCoCBsaW51eC9s
aW51eC5ta8KgIHwgMTEgKysrKysrKysrKy0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9saW51eC9Db25maWcu
aW4gYi9saW51eC9Db25maWcuaW4KPj4gaW5kZXggODAzMzM2MWU4Mi4uNTBiMzA0MjE5NCAxMDA2
NDQKPj4gLS0tIGEvbGludXgvQ29uZmlnLmluCj4+ICsrKyBiL2xpbnV4L0NvbmZpZy5pbgo+PiBA
QCAtNTY4LDYgKzU2OCw5IEBAIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfUFlU
SE9OMwo+PiDCoMKgwqDCoMKgwqDCoCBFbmFibGUgdGhpcyBvcHRpb24gaWYgeW91IGdldCBhIExp
bnV4IGtlcm5lbCBidWlsZCBmYWlsdXJlCj4+IMKgwqDCoMKgwqDCoMKgIHN1Y2ggYXMgInB5dGhv
bjM6IG5vdCBmb3VuZCIuCj4+IMKgICtjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9SVVNUX1NVUFBP
UlQKPj4gK8KgwqDCoCBib29sCj4+ICsKPj4gwqAgIyBMaW51eCBleHRlbnNpb25zCj4+IMKgIHNv
dXJjZSAibGludXgvQ29uZmlnLmV4dC5pbiIKPj4gwqAgZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4
Lm1rIGIvbGludXgvbGludXgubWsKPj4gaW5kZXggYzYxMDg5YmZlMC4uODE2ZTZkOGNmNCAxMDA2
NDQKPj4gLS0tIGEvbGludXgvbGludXgubWsKPj4gKysrIGIvbGludXgvbGludXgubWsKPj4gQEAg
LTE1Nyw3ICsxNTcsNiBAQCBlbmRpZgo+PiDCoCAjIERpc2FibGUgYnVpbGRpbmcgaG9zdCB0b29s
cyB3aXRoIC1XZXJyb3I6IG5ld2VyIGdjYyB2ZXJzaW9ucyBjYW4gYmUKPj4gwqAgIyBleHRyYSBw
aWNreSBhYm91dCBzb21lIGNvZGUgCj4+IChodHRwczovL2J1Z3MuYnVzeWJveC5uZXQvc2hvd19i
dWcuY2dpP2lkPTE0ODI2KQo+PiDCoCBMSU5VWF9NQUtFX0ZMQUdTID0gXAo+PiAtwqDCoMKgIEhP
U1RDQz0iJChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lz
dGVtIAo+PiAvLCQoSE9TVF9DRkxBR1MpKSkgJChIT1NUX0xERkxBR1MpIiBcCj4+IMKgwqDCoMKg
wqAgQVJDSD0kKEtFUk5FTF9BUkNIKSBcCj4+IMKgwqDCoMKgwqAgS0NGTEFHUz0iJChMSU5VWF9D
RkxBR1MpIiBcCj4+IMKgwqDCoMKgwqAgSU5TVEFMTF9NT0RfUEFUSD0kKFRBUkdFVF9ESVIpIFwK
Pj4gQEAgLTE2Niw2ICsxNjUsMTYgQEAgTElOVVhfTUFLRV9GTEFHUyA9IFwKPj4gwqDCoMKgwqDC
oCBSRUdFTkVSQVRFX1BBUlNFUlM9MSBcCj4+IMKgwqDCoMKgwqAgREVQTU9EPSQoSE9TVF9ESVIp
L3NiaW4vZGVwbW9kCj4+IMKgICtpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfUlVTVF9TVVBQT1JU
KSx5KQo+PiArTElOVVhfTUFLRV9GTEFHUyArPSBcCj4+ICvCoMKgwqAgSE9TVENDPSIkKEhPU1RD
QykiIFwKPj4gK8KgwqDCoCBIT1NUQ0ZMQUdTPSIkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vi
c3QgLUkgLywtaXN5c3RlbSAKPj4gLywkKEhPU1RfQ0ZMQUdTKSkpIiBcCj4+ICvCoMKgwqAgSE9T
VExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIKPj4gK2Vsc2UKPj4gK0xJTlVYX01BS0VfRkxBR1Mg
Kz0gXAo+PiArwqDCoMKgIEhPU1RDQz0iJChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8s
JChzdWJzdCAtSSAvLC1pc3lzdGVtIAo+PiAvLCQoSE9TVF9DRkxBR1MpKSkgJChIT1NUX0xERkxB
R1MpIgo+PiArZW5kaWYKPj4gKwo+PiDCoCBpZmVxICgkKEJSMl9SRVBST0RVQ0lCTEUpLHkpCj4+
IMKgIExJTlVYX01BS0VfRU5WICs9IFwKPj4gwqDCoMKgwqDCoCBLQlVJTERfQlVJTERfVkVSU0lP
Tj0xIFwKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
