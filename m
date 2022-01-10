Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F1BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6B560E52;
	Mon, 10 Jan 2022 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIFroKypo6F0; Mon, 10 Jan 2022 21:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6878260E4F;
	Mon, 10 Jan 2022 21:10:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 236201BF2B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 119E2830C0
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhLdXomwhFqx for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 21:09:58 +0000 (UTC)
X-Greylist: delayed 00:10:59 by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F014E82C75
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 21:09:57 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJEC8c006100; 
 Mon, 10 Jan 2022 21:02:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm5s4usd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 21:02:42 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AL0P8N003911;
 Mon, 10 Jan 2022 21:02:42 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm5s4ure-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 21:02:42 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AL2H1w004128;
 Mon, 10 Jan 2022 21:02:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3df288ym71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 21:02:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20AKrcFJ47907300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 20:53:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA6F5AE04D;
 Mon, 10 Jan 2022 21:02:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6930AE05D;
 Mon, 10 Jan 2022 21:02:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 10 Jan 2022 21:02:37 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 12AB122019F;
 Mon, 10 Jan 2022 22:02:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 22:02:33 +0100
Message-Id: <20220110210235.817082-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QJo7n5jNdeOb6QsZ24B9UxaFB58d4cTS
X-Proofpoint-ORIG-GUID: V3iSH0vfSzMkn0-sNQiBPRWSWQorKM-O
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=820 mlxscore=0
 adultscore=0 clxscore=1034 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100141
Subject: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv8
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UG93ZXJOViBpcyB0aGUgcGxhdGZvcm0gdXNpbmcgdGhlIE9QQUwgWzFdIGZpcm13YXJlIG9uIE9w
ZW5QT1dFUgpzeXN0ZW1zLiBPUEFMIGZpcnN0IGxvYWRzIGEga2VybmVsIGFuZCBhbiBpbml0cmFt
ZnMgaW1hZ2UgYmFzZWQgb24KYnVpbGRyb290IGluY2x1ZGluZyBhIHNlY29uZCBib290IGxvYWRl
ciBwZXRpdGJvb3QgWzJdLiBUaGUgbGF0dGVyCmRvZXMgZGV2aWNlIGRpc2NvdmVyeSBhbmQga2V4
ZWNzIGEgbmV3IExpbnV4IGltYWdlIGZyb20gZGlzayBvcgpuZXR3b3JrLgoKUUVNVSBpbXBsZW1l
bnRzIFBvd2VyTlYgbWFjaGluZXMgWzNdIGZvciB0aGUgUE9XRVI4LCBQT1dFUjkgYW5kClBvd2Vy
MTAgcHJvY2Vzc29ycyB3aGljaCBhcmUgdXNlZCBmb3IgZGV2IGFuZCB0ZXN0cy4gUE9XRVI4IGlt
YWdlcwpiZWluZyBjb21wYXRpYmxlIHdpdGggUE9XRVI5IGFuZCBQb3dlcjEwLCBzaW1wbHkgYWRk
IGEgc2luZ2xlCnFlbXVfcHBjNjRsZV9wb3dlcm52OCBib2FyZCBmb3IgYWxsLgoKVGhlIFFFTVUg
c2NyaXB0IGJvb3RzIGRpcmVjdGx5IGZyb20gYSBudm1lIGRpc2sgYmVjYXVzZSBpdCBpcyBzaW1w
bGUKZW5vdWdoIGJ1dCBhIHJlYWwgc3lzdGVtIHdvdWxkIGJvb3QgZnJvbSBhIHJhbWZzIGZpcnN0
LgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL3NraWJvb3QvYmxvYi9tYXN0ZXIv
ZG9jL292ZXJ2aWV3LnJzdApbMl0gaHR0cHM6Ly9naXRodWIuY29tL29wZW4tcG93ZXIvcGV0aXRi
b290LwpbM10gaHR0cHM6Ly9xZW11LnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9zeXN0ZW0vcHBj
L3Bvd2VybnYuaHRtbAoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4KLS0tCiBib2FyZC9xZW11L3BwYzY0bGUtcG93ZXJudjgvcmVhZG1lLnR4dCAgfCAgNSAr
KysrKwogY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIHwgMjkgKysrKysr
KysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9wcGM2NGxlLXBvd2VybnY4L3JlYWRtZS50eHQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25m
aWcKCmRpZmYgLS1naXQgYS9ib2FyZC9xZW11L3BwYzY0bGUtcG93ZXJudjgvcmVhZG1lLnR4dCBi
L2JvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52OC9yZWFkbWUudHh0Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMDU5ZjU1ZmJjOTE3Ci0tLSAvZGV2L251bGwKKysrIGIv
Ym9hcmQvcWVtdS9wcGM2NGxlLXBvd2VybnY4L3JlYWRtZS50eHQKQEAgLTAsMCArMSw1IEBACitS
dW4gdGhlIGVtdWxhdGlvbiB3aXRoOgorCitxZW11LXN5c3RlbS1wcGM2NCAtTSBwb3dlcm52OSAt
a2VybmVsIHZtbGludXggLWFwcGVuZCAiY29uc29sZT1odmMwIHJvb3R3YWl0IHJvb3Q9L2Rldi9u
dm1lMG4xIiAtZGV2aWNlIG52bWUsYnVzPXBjaWUuMyxhZGRyPTB4MCxkcml2ZT1kcml2ZTAsc2Vy
aWFsPTEyMzQgLWRyaXZlIGZpbGU9Li9yb290ZnMuZXh0MixpZj1ub25lLGlkPWRyaXZlMCxmb3Jt
YXQ9cmF3LGNhY2hlPW5vbmUgLWRldmljZSBlMTAwMGUsbmV0ZGV2PW5ldDAsbWFjPUMwOkZGOkVF
OjAwOjAxOjAzLGJ1cz1wY2llLjEsYWRkcj0weDAgIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1zZXJp
YWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgIyBxZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmln
CisKK1RoZSBsb2dpbiBwcm9tcHQgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHdpbmRvdy4K
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLmQ4ZWE2NjU1ZmNlMAotLS0gL2Rldi9udWxsCisrKyBiL2Nv
bmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwpAQCAtMCwwICsxLDI5IEBACisj
IEFyY2hpdGVjdHVyZQorQlIyX3Bvd2VycGM2NGxlPXkKK0JSMl9wb3dlcnBjX3Bvd2VyOD15CisK
KyMgU3lzdGVtCitCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKK0JSMl9TWVNU
RU1fREhDUD0iZXRoMCIKKworIyBGaWxlc3lzdGVtCitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkK
KyMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKKworIyBJbWFnZQorQlIyX1JPT1RG
U19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcWVtdS9wb3N0LWltYWdlLnNoIgorQlIyX1JPT1RG
U19QT1NUX1NDUklQVF9BUkdTPSIkKEJSMl9ERUZDT05GSUcpIgorCisjIExpbnV4IGhlYWRlcnMg
c2FtZSBhcyBrZXJuZWwKK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8x
NT15CisKKyMgS2VybmVsCitCUjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1ZFUlNJT049eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4x
NSIKK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJwb3dlcm52IgorQlIyX0xJTlVYX0tFUk5F
TF9WTUxJTlVYPXkKKworIyBob3N0LXFlbXUgZm9yIGdpdGxhYiB0ZXN0aW5nCitCUjJfUEFDS0FH
RV9IT1NUX1FFTVU9eQorQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkKLS0gCjIu
MzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
