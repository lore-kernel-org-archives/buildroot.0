Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C1DC28B28
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 01:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CED13811ED;
	Mon, 10 Mar 2025 01:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lkseqpf0Db0r; Mon, 10 Mar 2025 01:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB222811B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB222811B0;
	Mon, 10 Mar 2025 01:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5D71C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A878119D
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEPrnaY23AJy for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 01:29:41 +0000 (UTC)
X-Greylist: delayed 2736 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 10 Mar 2025 01:29:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 997FF811B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 997FF811B0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 997FF811B0
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 01:29:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529N526i029371
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 00:44:05 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f2mb1ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 00:44:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54005ee2dso272594385a.0
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 17:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741567443; x=1742172243;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VK4rkrkeptui4tXRUbxvL0CJSTK+Vu42KHMxoaVqsYo=;
 b=U49F0DROAKHOX8wyCgGVCoqmrDR1j46Z1Y06w0K0CAXnwuzIqc9T3CypT3tN75w0ze
 WL80rrneNuSTWQA0aDG85Dzo973Db4/bV3lSWVRbnL+2eODZSeCHyt8LB4ODnIIp8DDP
 YCJ7/cgjTiZ0ceMZNE6VJLHj5kVbwJzdtNx3v4dspVJwIlNuJ4xxqBQrEYTj29jFjNqw
 KkLryVm8jd1Cm5DmbAgT77xFvMn6AX+UF/GVMCJpneiFhAtYoAIK41X7dsuhrShwfrMa
 U0DQXZHrzlIcC6htmaEdG6rHbb5c9v74EFVW01qR+Nqnqb1MSjiso1Z/WVkVeGdW5aAw
 /upA==
X-Gm-Message-State: AOJu0YxugYhAcdBlycYU9BP+ltGYRi1OrkdlFzHGMWsDMSr8wzCEW5eY
 seMNQELNcUvw7ajGENC55wRGT+7B9WgtzVCPQUxz6vmpZbpafX/uCll7eCb2Iys9O4hBL+oloQY
 jB6+ywbiJm9wHumkEIRxFpXkEhJz4DNVCWR6bheyBxIYqkLyXFAEy6HTv9JPq4lqf
X-Gm-Gg: ASbGncshFpWgLldT+grkAuum2MFeMQsLDroqqeAuHV0/mmVNG9FatpEW+9D8t23+o1r
 mY89kx4Wul+88E//WZXBpZSQK51dqmxUoAS6LqThoeLLc69IWfvrE6uUMZb/crhaaWsKju+d1IP
 QLVbUywCZKPC8rcjIB8xv0PhRcPAnoryOuy6IjDZri7+haMdNt/EoCyOeFxBjPgwXBx/SExDDpB
 wM0BqFcrjsoxiLW+fm7CwRCNeK5KVnGOyJ6/1EXs/FwT/qXxuIg6aCnAPW4ux1H595VPI9ZvW0z
 EkPyWFk37YBBc1iJCX104VabgBUBUHrA1gxMex0GTw==
X-Received: by 2002:a05:620a:2b85:b0:7c5:48d4:e8a2 with SMTP id
 af79cd13be357-7c548d4f1cbmr640179685a.2.1741567443362; 
 Sun, 09 Mar 2025 17:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZcmW6zY+Z/ONy6KIztdZakT8+agm4x2yPq+04lvCUdTDGB7HJum/fSiRgLDK8FVJU9smi5Q==
X-Received: by 2002:a05:620a:2b85:b0:7c5:48d4:e8a2 with SMTP id
 af79cd13be357-7c548d4f1cbmr640177885a.2.1741567443008; 
 Sun, 09 Mar 2025 17:44:03 -0700 (PDT)
Received: from [192.168.1.217] ([216.158.243.21])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c557a9433esm17348785a.58.2025.03.09.17.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 17:44:02 -0700 (PDT)
Message-ID: <93ea2aa0-9838-4d3c-a00b-c51880173f5b@oss.qualcomm.com>
Date: Sun, 9 Mar 2025 19:44:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20250205114909.18e5f9dd@windsurf>
Content-Language: en-US
In-Reply-To: <20250205114909.18e5f9dd@windsurf>
X-Proofpoint-GUID: a-rNwXIUFInN0r_FWfD-7RqjV0-pqqBH
X-Proofpoint-ORIG-GUID: a-rNwXIUFInN0r_FWfD-7RqjV0-pqqBH
X-Authority-Analysis: v=2.4 cv=ab+bnQot c=1 sm=1 tr=0 ts=67ce35d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=jCaHSKOc8xwm4VrxeLAdIg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=19pp28zur-r5DtOtyn4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_09,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VK4rkrkeptui4tXRUbxvL0CJSTK+Vu42KHMxoaVqsYo=; b=ZYFq8uq8b4WCjOSc
 PQenGzgt1qtNXPMXJ25SOvyBie20tC/eeXMlL7dDcOrnu/48DOyWcMi4GlURRQaZ
 AUX6wdlwqnDQmvAS/dRNPO3Slqxv9TMdEQ5w7P07Vw9P5IYc1zFz/lCBxQEinIs6
 JjlLlfXlpDR6b+2yPYk2bRKurErC4rWT0NNmu8SSBOnhkk4M1to/CL4Gqp7wXOpf
 O1UN32M394qTF7f20qjCZMJtSuPKtYM4Q0wwDaMvHPOURwNzmaaUVuIdZWCoVcUv
 CBmighHSLLxF0ypvV8q4YfeY8a2Bu+d62RrstvHZhcRqi8GIskC2K9XmAHWwFU4n
 9fOmZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ZYFq8uq8
Subject: Re: [Buildroot] [RFC v2 00/14] add hexagon architecture
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
From: Brian Cain via buildroot <buildroot@buildroot.org>
Reply-To: Brian Cain <brian.cain@oss.qualcomm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIvNS8yMDI1IDQ6NDkgQU0sIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gSGVsbG8gQnJp
YW4sCj4KPiBPbiBXZWQsIDE4IERlYyAyMDI0IDIxOjMwOjM5IC0wODAwCj4gQnJpYW4gQ2FpbiA8
YnJpYW4uY2FpbkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+PiBJJ20gc2hhcmluZyB0aGlz
IHNlcmllcyB3aXRoIHRoZSBsaXN0IGZvciB0aGUgc2FrZSBvZiBkaXNjdXNzaW9uIGFib3V0Cj4+
IGhvdyB0aGUgYXBwcm9hY2ggdGFrZW4gY291bGQgaW1wcm92ZS4gIEl0J3MgbGlrZWx5IG5vdCBx
dWl0ZSByZWFkeSBmb3IKPj4gdXBzdHJlYW1pbmcgeWV0Lgo+IFRoYW5rcyBmb3IgdGhpcyBzZXJp
ZXMuIENvdWxkIHlvdSBzaGFyZSBzb21lIG1vcmUgZGV0YWlscyBhYm91dCB0aGUKPiBIZXhhZ29u
IGFyY2hpdGVjdHVyZSwgd2hhdCBpcyBpdHMgY3VycmVudCB1c2FnZSBhbmQgdXNlIGNhc2VzLCBy
b2FkbWFwPwo+IEluZGVlZCwgYWRkaW5nIHN1cHBvcnQgZm9yIGEgbmV3IGFyY2hpdGVjdHVyZSBp
biBCdWlsZHJvb3QgbWVhbnMgdGhhdAo+IG91ciBhdXRvYnVpbGRlcnMgd2lsbCB0cnkgYnVpbGRp
bmcgYWxsIHBhY2thZ2VzIGZvciB0aGlzIGFyY2hpdGVjdHVyZSwKPiB3aGljaCB3aWxsIGNlcnRh
aW5seSByYWlzZSBhIGxhcmdlIG51bWJlciBvZiBpc3N1ZXMsIHdoaWNoIHlvdSB3aWxsCj4gaGF2
ZSB0byBhZGRyZXNzIGFzIGEgbWFpbnRhaW5lciBvZiB0aGlzIENQVSBhcmNoaXRlY3R1cmUuIEhv
dyBjb21taXR0ZWQKPiBhcmUgeW91IHRvIHRoaXMgZWZmb3J0Pwo+Cj4gVGhpcyBpcyBldmVuIG1v
cmUgc2lnbmlmaWNhbnQgYXMgeW91ciBwcm9wb3NhbCBpcyB0byBzdXBwb3J0IHRoaXMKPiBhcmNo
aXRlY3R1cmUgd2l0aCBDbGFuZyBhcyBhIGNvbXBpbGVyLCB3aGljaCB3aWxsIGNlcnRhaW5seSBi
cmVhayBhIExPVAo+IG9mIHBhY2thZ2VzLCBjYXVzaW5nIGV2ZW4gbW9yZSB0cm91Ymxlcy4KPgo+
IFNvIHdoYXQgeW91J3JlIHByb3Bvc2luZyBoZXJlIGlzIGNlcnRhaW5seSB2ZXJ5IGludGVyZXN0
aW5nLCBidXQgaXQncyBhCj4gcmVhbGx5IGxhcmdlIGVuZGVhdm9yLCBhbmQgd2UgbmVlZCB0byB1
bmRlcnN0YW5kIHdoZXRoZXIgeW91J2xsIHN0aWxsCj4gYmUgYXJvdW5kIGluIDYgb3IgMTIgbW9u
dGhzIHRvIHN1cHBvcnQgdGhpcyBhbmQgYWRkcmVzcyBpc3N1ZXMuCgoKWW91IGJyaW5nIHVwIGdv
b2QgcG9pbnRzLsKgIFRoZSB1c2UgY2FzZXMgZm9yIHRoZSBoZXhhZ29uIGFyY2hpdGVjdHVyZSAK
YXJlIHNvIGZhcjogRFNQcyBpbiBRdWFsY29tbSBTb0NzLsKgIFRoZXkncmUgdXNlZCBhcyBlbmVy
Z3ktZWZmaWNpZW50IApjb21wdXRhdGlvbiBvZmZsb2FkLCBhdWRpbyBkZXZpY2VzLCBzZW5zb3Jz
LCBjZWxsIG1vZGVtcyBhbmQgbW9yZS4KClRoZSByb2FkbWFwIGlzIG5vdCBjbGVhciB0byBtZSAt
IG15IHRlYW0ncyByb2xlIGlzIHByaW1hcmlseSBmb2N1c2VkIG9uIApkZXZlbG9wZXIgdG9vbHMu
wqAgQW5kIHVuZm9ydHVuYXRlbHkgYnVpbGRyb290IGFuZCBsaW51eCBzdXBwb3J0IGZvciB0aGlz
IAphcmNoaXRlY3R1cmUgbWF5IG5vdCBiZSBhIGNvbW1lcmNpYWwgcHJpb3JpdHkgKHlldD8pLsKg
IEJ1dCBteSB0ZWFtIGlzIAppbnRlcmVzdGVkIGluIHByb21vdGluZyBpdCBhbmQgZXhwbG9yaW5n
IHRoZSBjYXBhYmlsaXR5LsKgIEknbGwgaGVscCAKcmFpc2UgYW5kL29yIGZpeCBidWdzIGluIHRo
ZSBwYWNrYWdlcyB0aGF0IGFyZSB1bmNvdmVyZWQgYnkgYnVpbGRpbmcgCndpdGggY2xhbmcgKGFz
IHdlbGwgd2l0aCBjbGFuZywgTExWTSBidWdzIGV4cG9zZWQgYnkgdGhlIHBhY2thZ2VzLCBpZiBh
bnkpLgoKSSdtIG5vdCBwbGFubmluZyB0byBnbyBhbnl3aGVyZSA6KQoKQXQgdGhlIHNhbWUgdGlt
ZSwgaXQgZmVlbHMgbGlrZSB3ZSdyZSByZWFsbHkganVzdCBzY3JhdGNoaW5nIHRoZSAKc3VyZmFj
ZS7CoCBTbyBmaXJzdCBvZmYgd2UnbGwgbWl0aWdhdGUgdGhlIGlzc3VlcyB5b3UgcmFpc2VkIGFu
ZCByZXZpc2l0IAp0aGluZ3MgYWZ0ZXIgdGhhdCwgaWYgaXQncyBva2F5IHcveW91LgoKCj4gSSdt
IGdvaW5nIHRvIHJlcGx5IHRvIHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMgd2l0aCBzb21lIG1vcmUg
Y29tbWVudHMsCj4gYnV0IEkgdGhpbmsgdGhpcyB0b3AtbGV2ZWwgZGlzY3Vzc2lvbiBpcyB0aGUg
bW9zdCBpbXBvcnRhbnQuCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
