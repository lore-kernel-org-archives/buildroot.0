Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0012C27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307D6403E4;
	Wed, 12 Jun 2024 18:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v521zJf8Oy_Z; Wed, 12 Jun 2024 18:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1EE1403D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1EE1403D0;
	Wed, 12 Jun 2024 18:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEB331BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B663B829EE
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2bOpCqvP_xQ for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EF1E826A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EF1E826A4
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EF1E826A4
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:23:18 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CG1S79007460; Wed, 12 Jun 2024 18:23:16 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yqeu4sqqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 18:23:13 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIMkFe022140
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 18:22:47 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CIMkqY025559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 18:22:46 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 3972B300E320;
 Wed, 12 Jun 2024 13:22:46 -0500 (CDT)
Date: Wed, 12 Jun 2024 18:22:46 +0000
MIME-Version: 1.0
Message-Id: <20240612-ppd-merge-b4-v2-1-81044690d046@collins.com>
X-B4-Tracking: v=1; b=H4sIAHXnaWYC/5WOvw6CMBjEX4V0tqT9+KuTg6wOOhqGthRpQlvyl
 RAN4d2tJD6A493lfncrCRqNDuSUrAT1YoLxLgo4JEQNwj01NV3UBBjkrORAp6mjVmMMZE5rVUI
 mRSXkkZFYmVD35rXjHuTW3JvrhbTR79FbOg+oxQ+WcWCcV6woIOU1cEY5lShc511qhdF4Vn4cj
 Qup8vaLHkyYPb73owvsA39j2m3bPpwxkAPyAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_09,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_09,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120131
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406120131
X-Proofpoint-GUID: 0LEyJXUIdLDgFDlnB1rNGqzAitReO8h-
X-Proofpoint-ORIG-GUID: 0LEyJXUIdLDgFDlnB1rNGqzAitReO8h-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_09,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406120131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=3zAHzmpHgRS8+CPNIQNy3XpGUK9yeJnoqWQAPGnRnww=;
 b=B1p+LDV6Vl4+7e5hOu7JZHEf1BBfzwoo5ygJQp2P+3Pvn/Weafez7LuvKmQpM8P+E1S9
 YiQzesFCBS6PQli5wB6bwFl953IJSgaUPETsxjDPV0l6YRIjjyKNFLg0Z8XI3oz4iha0
 A+tR9Vk9VrbO/ih+C4tG8F9wfldgAQkHj911x2zIoSsM2QgvEj18FMI8h2ifgDRyXMb6
 D85MSKE5GgIu/AVYI8Ud0cr41lUgyHiSLhisUDQXRynP1mSdRAzHDnh08MWOE3GyKUw5
 rdXbN3LdelXU1I+3ei/ROb5MXwy0/XUK6ClFUTYAwwFNOkisFGt3mQEBczyNjPkF1qN4 nw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=B1p+LDV6
Subject: [Buildroot] [PATCH RESEND v2] ppd-merge: speed up per-package-rsync
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQnJhbmRvbiBNYWllciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zz4KClRoZSBwZXItcGFja2FnZS1yc3luYyBzdGFnZSBjYW4gYWRkIGEgc2lnbmlmaWNhbnQgYW1v
dW50IG9mIHRpbWUgdG8KYnVpbGRzLiBUaGV5IGNhbiBhbHNvIGJlIGFubm95aW5nIGFzIHRoZSB0
YXJnZXQtZmluYWxpemUgYW5kCmhvc3QtZmluYWxpemUgdGFyZ2V0cyBhcmUgdGhlIHNsb3dlc3Qg
YW5kIHJ1biBvbiBldmVyeSBgbWFrZSBhbGxgLCB3aGljaAppcyB1c2VkIGZyZXF1ZW50bHkgZm9y
IHBhcnRpYWwgcmVidWlsZHMuCgpUaGUgcGVyLXBhY2thZ2UtcnN5bmMgaXMgc2xvdyBiZWNhdXNl
IGl0IGxhdW5jaGVzIGEgbmV3IHJzeW5jIGZvciBlYWNoCnNvdXJjZSB0cmVlLCBhbmQgZWFjaCBy
c3luYyBtdXN0IHJlc2NhbiB0aGUgZGVzdGluYXRpb24gZGlyZWN0b3J5IGFuZApwb3RlbnRpYWxs
eSBvdmVyd3JpdGUgZmlsZXMgbXVsdGlwbGUgdGltZXMuIFdlIGNhbiBpbnN0ZWFkIG1lcmdlIGFs
bCB0aGUKcnN5bmMgY2FsbHMgZG93biBpbnRvIG9uZSBjYWxsLCBhbmQgcnN5bmMgaXMgc21hcnRl
ciBhYm91dCBzY2FubmluZyBhbGwKdGhlIHNvdXJjZSBkaXJlY3RvcmllcyBhbmQgb25seSBjb3B5
aW5nIG92ZXIgdGhlIGZpbGVzIGl0IG5lZWRzIHRvLgoKV2UgZmVlZCB0aGUgc291cmNlIHRyZWVz
IHRvIHJzeW5jIGluIHJldmVyc2Utb3JkZXIsIGFzIHRoaXMgcHJlc2VydmVzCnRoZSBvcmlnaW5h
bCBiZWhhdmlvdXIuIEkuZS4gd2hlbiB1c2luZyBtdWx0aXBsZSByc3luY3MsIHRoZSBsYXN0IHNv
dXJjZQp0cmVlIHdvdWxkIG92ZXJ3cml0ZSBhbnl0aGluZyBpbiB0aGUgZGVzdGluYXRpb24uIE5v
dyB3aGVuIHVzaW5nIGEKc2luZ2xlIHJzeW5jLCB3ZSBwdXQgdGhlIGxhc3QgdHJlZSBmaXJzdCBh
cyByc3luYyB3aWxsIHNlbGVjdCB0aGUgZmlyc3QKZmlsZSBpdCBmaW5kcy4KClRoaXMgb25seSBz
dXBwb3J0cyB0aGUgJ2NvcHknIG1vZGUsIHdoaWNoIGlzIHVzZWQgaW4gdGhlIGZpbmFsaXplIHN0
ZXAuClRoZSAnaGFyZGxpbmsnIG1vZGUgcmVxdWlyZXMgc3BlY2lmeWluZyBlYWNoIHNvdXJjZSB0
cmVlIHdpdGggdGhlCi0tbGluay1kZXN0IGZsYWcgYnV0IGVuZm9yY2VzIGEgbWF4aW11bSBvZiAy
MCB0cmVlcy4KCkJlbG93IGlzIGEgYmVuY2htYXJrIHJ1bm5pbmcgdGhlIGhvc3QtZmluYWxpemUg
dGFyZ2V0IGZvciBhIGJ1aWxkIHdpdGgKMjAwIHBhY2thZ2VzLgoKQmVuY2htYXJrIDE6IGJlZm9y
ZSBjb3B5CiAgVGltZSAobWVhbiDCsSDPgyk6ICAgICAyNy4xNzEgcyDCsSAgMC43NzcgcyAgICBb
VXNlcjogNi4xNzAgcywgU3lzdGVtOiAxNC44MzAgc10KICBSYW5nZSAobWluIOKApiBtYXgpOiAg
IDI2LjM0MyBzIOKApiAyOC41NjYgcyAgICAxMCBydW5zCgpCZW5jaG1hcmsgMjogYWZ0ZXIgY29w
eQogIFRpbWUgKG1lYW4gwrEgz4MpOiAgICAgIDYuMjk2IHMgwrEgIDAuMTk2IHMgICAgW1VzZXI6
IDIuODc0IHMsIFN5c3RlbTogNS42MDAgc10KICBSYW5nZSAobWluIOKApiBtYXgpOiAgICA2LjA5
NCBzIOKApiAgNi43MDkgcyAgICAxMCBydW5zCgpTdW1tYXJ5CiAgYWZ0ZXIgY29weSByYW4KICAg
IDQuMzIgwrEgMC4xOCB0aW1lcyBmYXN0ZXIgdGhhbiBiZWZvcmUgY29weQoKQ2M6IEhlcnZlIENv
ZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgpDYzogWWFubiBFLiBNT1JJTiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25p
QGJvb3RsaW4uY29tPgpSZXZpZXdlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9v
dGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEJyYW5kb24gTWFpZXIgPGJyYW5kb24ubWFpZXJAY29s
bGlucy5jb20+Ci0tLQp2MTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDIzMTEyNzIyNDEzOS4zNTk2OS0xLWJyYW5kb24ubWFpZXJAY29sbGlu
cy5jb20vCgp2MjoKLSBTaW1wbGlmeSBsb2dpYyBmb3IgJ2NvcHknIG1vZGUKLSBEcm9wIHN1cHBv
cnQgZm9yICdoYXJkbGluaycgbW9kZQotLS0KIHBhY2thZ2UvcGtnLXV0aWxzLm1rIHwgMTggKysr
KysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy11dGlscy5tayBiL3BhY2thZ2UvcGtn
LXV0aWxzLm1rCmluZGV4IGQxOTY0Mjk5YWYuLjNhYjllOWZlNTIgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvcGtnLXV0aWxzLm1rCisrKyBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCkBAIC0yMjEsMTggKzIy
MSwxMiBAQCBpZmVxICgkKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUykseSkKICMgJDQ6IGxp
dGVyYWwgImNvcHkiIG9yICJoYXJkbGluayIgdG8gY29weSBvciBoYXJkbGluayBmaWxlcyBmcm9t
IHNyYyB0byBkZXN0CiBkZWZpbmUgcGVyLXBhY2thZ2UtcnN5bmMKIAlta2RpciAtcCAkKDMpCi0J
JChmb3JlYWNoIHBrZywkKDEpLFwKLQkJcnN5bmMgLWEgXAotCQkJLS1oYXJkLWxpbmtzIFwKLQkJ
CSQoaWYgJChmaWx0ZXIgaGFyZGxpbmssJCg0KSksIFwKLQkJCQktLWxpbmstZGVzdD0kKFBFUl9Q
QUNLQUdFX0RJUikvJChwa2cpLyQoMikvLCBcCi0JCQkJJChpZiAkKGZpbHRlciBjb3B5LCQoNCkp
LCBcCi0JCQkJCSQoZW1wdHkpLCBcCi0JCQkJCSQoZXJyb3IgcGVyLXBhY2thZ2UtcnN5bmMgY2Fu
IG9ubHkgImNvcHkiIG9yICJoYXJkbGluayIsIG5vdCAiJCg0KSIpIFwKLQkJCQkpIFwKLQkJCSkg
XAotCQkJJChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLyBcCi0JCQkkKDMpJChzZXApKQor
CSQoaWYgJChmaWx0ZXIgaGFyZGxpbmssJCg0KSksIFwKKwkJJChmb3JlYWNoIHBrZywkKDEpLFwK
KwkJCXJzeW5jIC1hIC0taGFyZC1saW5rcyAtLWxpbmstZGVzdD0kKFBFUl9QQUNLQUdFX0RJUikv
JChwa2cpLyQoMikvIFwKKwkJCQkkKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoMikvICQoMykk
KHNlcCkpLCBcCisJCXByaW50ZiAiJXMvJCgyKS9cbiIgJCgxKSB8IHRhYyBcCisJCQl8IHJzeW5j
IC1hIC0taGFyZC1saW5rcyAtLWZpbGVzLWZyb209LSAtLW5vLVIgLXIgJChQRVJfUEFDS0FHRV9E
SVIpICQoMykpCiBlbmRlZgogCiAjIHByZXBhcmVzIHRoZSBwZXItcGFja2FnZSBIT1NUX0RJUiBh
bmQgVEFSR0VUX0RJUiBvZiB0aGUgY3VycmVudAoKLS0tCmJhc2UtY29tbWl0OiAxMmIyODYwZDc1
NjJkNWNmMWI3NDkyYjU4ZjRmMTBmMDQwNTQ0NGM0CmNoYW5nZS1pZDogMjAyNDA2MTItcHBkLW1l
cmdlLWI0LThjNjIzYmE3YWI5MAoKQmVzdCByZWdhcmRzLAotLSAKQnJhbmRvbiBNYWllciA8YnJh
bmRvbi5tYWllckBjb2xsaW5zLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
