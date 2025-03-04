Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA437C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 21:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A3B81F17;
	Tue,  4 Mar 2025 21:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExDPTRVo4_-g; Tue,  4 Mar 2025 21:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E66A81F4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E66A81F4A;
	Tue,  4 Mar 2025 21:53:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2DDF944
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 21:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25D860DA5
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 21:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYi8Ra3EkZ5S for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 21:53:41 +0000 (UTC)
X-Greylist: delayed 2219 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 04 Mar 2025 21:53:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A709D60BEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A709D60BEA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A709D60BEA
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 21:53:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524A2sb1015641
 for <buildroot@buildroot.org>; Tue, 4 Mar 2025 21:16:40 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v365c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 21:16:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c3b53373f7so722169285a.0
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 13:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741123000; x=1741727800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F9V8Fv8VAbxqSVCFkRZ+ipfie/Dypzhn+LxnwYWqiOs=;
 b=KabCBXU44QzT15UOv6kKYeYD9aOatDZjmSJKZMTFor0qqNs1Th+jZnq7r3B/nTvxZ0
 zUKKSDHo4zTLipTLdz09d6D+Omwz+L8bR97PKnaskwe0RSacxQp4Z33HbgTA5YOFp5k8
 S0L9pt4njxEJjk0Vp/XQYEdLVr6jCv9Op6rVNzvDEcz5h7gjkcnSjq/HBCgoiUB3Nlui
 HjTkJYBPKKflSHCSuHPoODpNAhaBNG7UO/gkeMgDM/xY1P6GK8fyLvzfcx3cvUu3CMKt
 m0L11HTLEDYcDXkzfuizitwuUaDDtjOm9cDne1ZAGQO6FTRkh6OygUCoHpibnVKZkHIT
 vZ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEBiIDqm4k/tRf6SvaFR+h/vWHYVhn5BWcrsd3xy9WBn0kJanvJ8xQAt2aG8cpH5KjmjiKJF6m7X4=@buildroot.org
X-Gm-Message-State: AOJu0Yw5K6/1oNjrJzlWyNMrr1ro2VUv6EzauPPpTBpSEwUoE3/R7O+g
 WuYsqL5EN+25BxunPZDfG2GoUPk7+0Det6dKi11W3LyFT0Eld3J2KO+2XdFLrYLdQk+229znrQW
 wprYeH56idMmcdTbwfxhvsMiJ+LkaROKsVR0DeHLqPoikRyUH8Ztzi0Bg
X-Gm-Gg: ASbGncvv0yKcvlI8z9baEvubsF3CTKxAefxyx+IZYtRt/WO5Yspw6+mMgzy4ReXI25v
 u5IbdRtUYFa2W4UovRKvPUFqREzdz9lqswIXKt/+J08h6t7TbVkFrCZFYxzHjerbSCVjbxHQ52K
 2sciyUopifsIhEHa3mDejNW+nwdG/dK29JtTaNVmgTKRSKk6X4HDmc9q10LY2rggFrBrmpDbbFQ
 acxg9UtkWlFZ+3/5y2RvsP3vPTf382QcAZK/biek3PWv2yRZ404VjwaJ/vkslL5U4Yf/d2SC5WJ
 81K5mOoZrtxb5iNYosA5bRZNhUsdTHW3EzWuLOhG777iwCB4yIafBYett3oBL6Ldr0TW9PJeLQ=
 =
X-Received: by 2002:a05:620a:2815:b0:7c3:c676:ffb8 with SMTP id
 af79cd13be357-7c3d8e20f42mr136364885a.10.1741122999701; 
 Tue, 04 Mar 2025 13:16:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUd5lCjxnU2DwZ4X4k1MEIG5djCSn9kOqlU/MrsSqJCE9bJ9N2Ph3dcQWGlA1iqPqce2P7+w==
X-Received: by 2002:a05:620a:2815:b0:7c3:c676:ffb8 with SMTP id
 af79cd13be357-7c3d8e20f42mr136361385a.10.1741122999309; 
 Tue, 04 Mar 2025 13:16:39 -0800 (PST)
Received: from [10.222.168.90] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c36fee8abasm792381685a.7.2025.03.04.13.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 13:16:39 -0800 (PST)
Message-ID: <bf991fb2-96e9-44bb-8d1a-321ded7a4093@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 15:16:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Cain via buildroot <buildroot@buildroot.org>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-11-brian.cain@oss.qualcomm.com>
 <20250205122609.054fe9bd@windsurf>
Content-Language: en-US
In-Reply-To: <20250205122609.054fe9bd@windsurf>
X-Proofpoint-GUID: __oPLXfnReJKTTrfMlol_lwgrbFVJzM5
X-Proofpoint-ORIG-GUID: __oPLXfnReJKTTrfMlol_lwgrbFVJzM5
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c76db8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=YRHvXXt1AAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=fkU1pAsw74SoIdSlII0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9bw_jnHfPby8klRCszyn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040171
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F9V8Fv8VAbxqSVCFkRZ+ipfie/Dypzhn+LxnwYWqiOs=; b=c8ZJbYgjjXuiL0f1
 PUVPIVhr0VmUN7Qw9FwQJz8By8lT7s4JCuybnnkchFq3ElzHpBzRLov+rJiphZR6
 37vQqk8gKX6jgeNqUdYCLytPD/QsOycdW4XO/LRg6bgC4vu4wdJj/9u1ARkA8gP7
 pF4g8vP2DDS+Njzo7/3nE8xlf3GQyNpPWKC/fq+fNsAoTL8KiNvGTuI1QHfFUKfP
 WxFFSrj6vNaE1PaT2AyFiVPA1E8vei3OB+swvzVc+O+UVolZSWWHZrndo7APzJ84
 pc+y0JVbDsh59rXw5BYaJbArRYWd8Ur8lS19B+8bZtlT48zceKUvzh373MK3mWWj
 T0MmBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=c8ZJbYgj
Subject: Re: [Buildroot] [RFC v2 10/14] configs: add hexagon QEMU config
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

Ck9uIDIvNS8yMDI1IDU6MjYgQU0sIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gSGVsbG8gQnJp
YW4sCj4KPiBPbiBXZWQsIDE4IERlYyAyMDI0IDIxOjMwOjQ5IC0wODAwCj4gQnJpYW4gQ2FpbiB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPj4gU2lnbmVk
LW9mZi1ieTogQnJpYW4gQ2FpbiA8YnJpYW4uY2FpbkBvc3MucXVhbGNvbW0uY29tPgo+IE5pY2Ug
dG8gc2VlIHRoYXQgdGhlcmUgaXMgUWVtdSBzdXBwb3J0ISBJcyB0aGlzIHN1cHBvcnRlZCBpbiB1
cHN0cmVhbQo+IFFlbXU/CgoKTm90IHlldCAtIHRoZXJlJ3MgYSBkb3duc3RyZWFtIGZvcmsgaW4g
Z2l0aHViLmNvbS9xdWljL3FlbXUvIGFuZCBwYXRjaGVzIAp1bmRlciByZXZpZXcgZm9yIHVwc3Ry
ZWFtLgoKCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3Fjb21fZHNwX3FlbXVfZGVmY29uZmlnIGIv
Y29uZmlncy9xY29tX2RzcF9xZW11X2RlZmNvbmZpZwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
PiBpbmRleCAwMDAwMDAwMDAwLi5jYzliNzE1N2FkCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
Y29uZmlncy9xY29tX2RzcF9xZW11X2RlZmNvbmZpZwo+PiBAQCAtMCwwICsxLDQ0IEBACj4+ICtC
UjJfaGV4YWdvbj15Cj4+ICtCUjJfSEVYQUdPTl92NzM9eQo+PiArQlIyX1NUQVRJQ19MSUJTPXkK
PiBUaGlzIGlzIGNoYW5nZWQgaW4gYSBmb2xsb3ctdXAgcGF0Y2gsIHdoaWNoIGlzbid0IGdvb2Qs
IHBsZWFzZSB1c2UgdGhlCj4gY29ycmVjdCBzZXR0aW5nIGZyb20gdGhlIHN0YXJ0Lgo+Cj4+ICtC
UjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPj4gK0JSMl9UT09MQ0hBSU5fRVhURVJOQUxfQ1VTVE9N
PXkKPiBXaHkgZG9uJ3QgeW91IHVzZSB0aGUgdG9vbGNoYWluLWV4dGVybmFsLWhleGFnb24gcGFj
a2FnZSBoZXJlPwo+Cj4+ICtCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPj4gK0JS
Ml9ST09URlNfREVWSUNFX0NSRUFUSU9OX1NUQVRJQz15Cj4gV2UgcmVhbGx5IHdhbnQgdG8gdXNl
IHRoZSBkZWZhdWx0IGZvciB0aGlzLgo+Cj4+ICtCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RI
RVJTPXkKPj4gK0JSMl9QQUNLQUdFX0JaSVAyPXkKPj4gK0JSMl9QQUNLQUdFX1pMSUI9eQo+PiAr
QlIyX1BBQ0tBR0VfTE9DS0RFVj1uCj4+ICtCUjJfUEFDS0FHRV9MSUJFVkVOVD1uCj4+ICtCUjJf
UEFDS0FHRV9BVEZUUD1uCj4+ICtCUjJfUEFDS0FHRV9EUk9QQkVBUj15Cj4+ICtCUjJfUEFDS0FH
RV9MU0g9eQo+PiArCj4+ICtCUjJfUEFDS0FHRV9CQVNIPXkKPj4gK0JSMl9QQUNLQUdFX1pTSD15
Cj4+ICsKPj4gK0JSMl9QQUNLQUdFX0xJUVVJRF9EU1A9eQo+PiArQlIyX1BBQ0tBR0VfR05VUkFE
SU9fRkZUPXkKPj4gKwo+PiArQlIyX1BBQ0tBR0VfWElORVREPW4KPj4gK0JSMl9QQUNLQUdFX0NP
UkVVVElMUz15Cj4+ICtCUjJfUEFDS0FHRV9IRVhBR09OTVZNPXkKPiBQbGVhc2UgcmVtb3ZlIGFs
bCBvZiB0aGlzIGN1c3RvbSBwYWNrYWdlIHNlbGVjdGlvbiwgZXhjZXB0Cj4gQlIyX1BBQ0tBR0Vf
SEVYQUdPTk1WTT15IG1heWJlIGlmIGl0J3MgcmVhbGx5IG5lZWRlZCBmb3IgdGhlIHBsYXRmb3Jt
Cj4gdG8gYm9vdC4KPgo+PiArQlIyX1RBUkdFVF9ST09URlNfVEFSX0daSVA9eQo+PiArQlIyX1RB
UkdFVF9ST09URlNfSU5JVFJBTUZTPXkKPj4gKwo+PiArQlIyX0xJTlVYX0tFUk5FTD15Cj4+ICtC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9HSVQ9eQo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
UkVQT19VUkw9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2JjYWluL2xpbnV4LmdpdCIKPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVkVSU0lP
Tj0iYmNhaW4vYm9vdF9xZW11X3Y2LjExIgo+IElzIHRoaXMgYSBicmFuY2ggb3IgYSB0YXJnZXQ/
IFdlIGRvbid0IHdhbnQgdG8gdXNlIGEgYnJhbmNoLgo+Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0RF
RkNPTkZJRz0icWVtdSIKPj4gKwo+IEFsc28sIHBsZWFzZSBhZGQgYSBib2FyZC9xZW11LyBkaXJl
Y3RvcnkgZm9yIHRoaXMgY29uZmlndXJhdGlvbiwgd2l0aCBhCj4gcmVhZG1lLnR4dC4gSW4gcGFy
dGljdWxhciwgdGhlIHJlYWRtZS50eHQgc2hvdWxkIGluY2x1ZGUgdGhlIGV4YWN0IFFlbXUKPiBj
b21tYW5kIGxpbmUgdG8gdXNlIHRvIGJvb3QgdGhlIHN5c3RlbS4KPgo+Cj4+IGRpZmYgLS1naXQg
YS9saW51eC9saW51eC5oYXNoIGIvbGludXgvbGludXguaGFzaAo+PiBpbmRleCBjY2Y2MjM1MTY2
Li4zYzVlYWVhNjc2IDEwMDY0NAo+PiAtLS0gYS9saW51eC9saW51eC5oYXNoCj4+ICsrKyBiL2xp
bnV4L2xpbnV4Lmhhc2gKPj4gQEAgLTksNiArOSw3IEBAIHNoYTI1NiAgMGQwZmZhZTViZjBlNmY5
YzZhMWNlNDJkYTJiYzJhODY5NmNhNTU3MjFjMTAzNDk3ZWIxMjQ1YmU4Y2MwNGIyMCAgbGludXgt
Cj4+ICAgIyBMb2NhbGx5IGNvbXB1dGVkCj4+ICAgc2hhMjU2ICBmYjBlZGMzYzE4ZTQ3ZDJiNjk3
NGNiMDg4MGEwYWZiNWMzZmEwOGY1MGVlODdkZmRmMjQzNDk0MDVlYTVmOGFlICBsaW51eC1jaXAt
NS4xMC4xNjItY2lwMjQudGFyLmd6Cj4+ICAgc2hhMjU2ICBiNTUzOTI0M2YxODdlM2Q0NzhkNzZk
NDRhZTEzYWFiODM5NTJjOTRiODg1YWQ4ODlkZjZmYTk5OTdlMTZhNDQxICBsaW51eC1jaXAtNS4x
MC4xNjItY2lwMjQtcnQxMC50YXIuZ3oKPj4gK3NoYTI1NiAgYTk3YTZmZGM4MTRiNTdiMTUxMDcx
Mzk5NzgzNjlkNGVmZDE0NzQxNDI5MTFlOGY3NmIwNTA4NzRjYzllZTNlNCAgbGludXgtYmNhaW5f
Ym9vdF9xZW11X3Y2LjExLWdpdDQudGFyLmd6Cj4gTm9wZSwgeW91IGNhbm5vdCAicG9sbHV0ZSIg
bGludXgvbGludXguaGFzaCB3aXRoIHlvdXIgY3VzdG9tIGhhc2guIExvb2sKPiBhdCBvdGhlciBk
ZWZjb25maWdzLCB0aGV5IHVzZSBCUjJfR0xPQkFMX1BBVENIX0RJUkVDVE9SWSB0byBwcm92aWRl
Cj4gYWRkaXRpb25hbCBoYXNoIGZpbGVzLgoKU29ycnkhwqAgSSBzaG91bGQgaGF2ZSBiZWVuIGNs
ZWFyZXIgYWJvdXQgdGhpcyBzZXJpZXMgLSBpdCdzIGRlZmluaXRlbHkgCm5vdCByZWFkeSB0byBs
YW5kIGFzLWlzLsKgIFRoYW5rcyBmb3IgdGFraW5nIHlvdXIgdGltZSB0byByZXZpZXcgdGhlc2Ug
CnBhdGNoZXMgYW5kIEknbGwgYWRkcmVzcyB5b3VyIGNvbW1lbnRzLgoKVGhlc2UgImJjYWluIiBy
ZWZlcmVuY2VzIGFyZSBmb3IgdGhlIHNha2Ugb2Ygb3RoZXJzIHdobyBtaWdodCBsaWtlIHRvIApy
ZXByb2R1Y2UgdGhlIGNvbmZpZ3VyYXRpb24uwqAgSSB3aWxsIG5vdCBpbmNsdWRlIHJlZmVyZW5j
ZXMgdG8gbXkga2VybmVsIAp0cmVlIGZvciBpbmNsdXNpb24gaW4gYnVpbGRyb290LiA6KQoKCj4g
VGhhbmtzIQo+Cj4gVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
