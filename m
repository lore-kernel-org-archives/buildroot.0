Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7840C47DAF
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 22:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0C080EC3;
	Thu, 18 Jan 2024 22:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0C080EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6Aidmh5mCT1; Thu, 18 Jan 2024 22:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505738141A;
	Thu, 18 Jan 2024 22:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505738141A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73DAB1BF20F
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 22:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CFD280E48
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 22:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CFD280E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MANf0jpzl_B for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 22:23:23 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3029080C62
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 22:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3029080C62
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40IKa0Bm018617; Thu, 18 Jan 2024 22:23:20 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3vpph0nh7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jan 2024 22:23:20 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 40IMNJQ5022534
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jan 2024 22:23:19 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 40IMNJNU016739
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 18 Jan 2024 22:23:19 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 0C581601A9;
 Thu, 18 Jan 2024 16:23:19 -0600 (CST)
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 22:23:01 +0000
Message-ID: <20240118222310.62234-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_10,2024-01-17_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_10,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401180152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401180152
X-Proofpoint-GUID: qbJVxQFbq6qltZeEWNCh9Fz-yQYUAdke
X-Proofpoint-ORIG-GUID: qbJVxQFbq6qltZeEWNCh9Fz-yQYUAdke
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401180152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=POD051818;
 bh=V8OMd6pwb/O3Kq4YH7CkYbUyI+O9D4xZX4lPgnc+Yn4=;
 b=j95MKJCUJWGpteY1NTbjLiqewEPDZ/gzAAQbxljXuP4lcvSCSc6kBNNGN3pTI4TE44FE
 2YG4/wr77WolXayIWPibXCARbHCrZIFjCYUb/G2uQKwScz58b/QPTW6ZpfvKAcFu+qx2
 1K11+rxoDWH5I4bc48tBAZXhcNQmIJjTKukMVZBnRQHUJ5jP1bnKmUUKnbNXDch2u8mZ
 O88sd9oKNy20EHP2h8gnq+BZXfcKs3mxzzT9CwIzRfL75gTWcZd6PVKIQd/kM5J0UXAT
 ZWawFpLAUxTw/1KtIcyUqQA7O8MbvaiFX057hrRbQToelWXZDcpQNpctkoWbBoIuDdsQ zA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=j95MKJCU
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix build error on powerpc
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlIGludHJvZHVjdGVkIGJ5IE9wZW5TU0gg
djkuNnAxLgoKICBzc2hrZXkuYzogSW4gZnVuY3Rpb24gJ3NzaGtleV9zZXRfZmlsZW5hbWUnOgog
IHNzaGtleS5jOjM3MDU6MTogc29ycnksIHVuaW1wbGVtZW50ZWQ6ICctZnplcm8tY2FsbC11c2Vk
LXJlZ3MnIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyB0YXJnZXQKICAgMzcwNSB8IH0KCkZpeGVzOgpo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lYzcvZWM3ODBhZWQ1YjFjNGZk
ZjliOTFmNmU3YmU5OWU4ZDRjNDJlZmE1OAoKU2lnbmVkLW9mZi1ieTogQnJhbmRvbiBNYWllciA8
YnJhbmRvbi5tYWllckBjb2xsaW5zLmNvbT4KLS0tCiAuLi5jdGlvbi1vZi1icm9rZW4tZnplcm8t
Y2FsbC11c2VkLXJlZ3MucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL29w
ZW5zc2gvb3BlbnNzaC5tayAgICAgICAgICAgICAgICAgICAgfCAgMyArCiAyIGZpbGVzIGNoYW5n
ZWQsIDYwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW5zc2gv
MDAwMS1iZXR0ZXItZGV0ZWN0aW9uLW9mLWJyb2tlbi1memVyby1jYWxsLXVzZWQtcmVncy5wYXRj
aAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNzaC8wMDAxLWJldHRlci1kZXRlY3Rpb24tb2Yt
YnJva2VuLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLnBhdGNoIGIvcGFja2FnZS9vcGVuc3NoLzAwMDEt
YmV0dGVyLWRldGVjdGlvbi1vZi1icm9rZW4tZnplcm8tY2FsbC11c2VkLXJlZ3MucGF0Y2gKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNWMwNTYwMzNhOQotLS0gL2Rldi9u
dWxsCisrKyBiL3BhY2thZ2Uvb3BlbnNzaC8wMDAxLWJldHRlci1kZXRlY3Rpb24tb2YtYnJva2Vu
LWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLnBhdGNoCkBAIC0wLDAgKzEsNTcgQEAKK0Zyb20gMTAzNmQ3
N2IzNGE1ZmExNWU1NmY1MTZiODFiOTkyODAwNjg0OGNiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IERhbWllbiBNaWxsZXIgPGRqbUBtaW5kcm90Lm9yZz4KK0RhdGU6IEZyaSwgMjIg
RGVjIDIwMjMgMTc6NTY6MjYgKzExMDAKK1N1YmplY3Q6IFtQQVRDSF0gYmV0dGVyIGRldGVjdGlv
biBvZiBicm9rZW4gLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzCitNSU1FLVZlcnNpb246IDEuMAorQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0CisKK2djYyAxMy4yLjAgb24gcHBjNjRsZSByZWZ1c2VzIHRvIGNvbXBpbGUg
c29tZSBmdW5jdGlvbiwgaW5jbHVkaW5nCitjaXBoZXIuYzpjb21wcmVzc2lvbl9hbGdfbGlzdCgp
IHdpdGggYW4gZXJyb3I6CisKKz4gc29ycnksIHVuaW1wbGVtZW50ZWQ6IGFyZ3VtZW50IOKAmHVz
ZWTigJkgaXMgbm90IHN1cHBvcnRlZGN3Cis+IGZvciDigJgtZnplcm8tY2FsbC11c2VkLXJlZ3Pi
gJkgb24gdGhpcyB0YXJnZXQKKworVGhpcyBleHRlbmRzIHRoZSBhdXRvY29uZiB3aWxsLWl0LXdv
cmsgdGVzdCB3aXRoIGEgc2ltaWxhcmx5LQorc3RydWN0dXJlZCBmdW5jdGlvbiB0aGF0IHNlZW1z
IHRvIGNhdGNoIHRoaXMuCisKK1Nwb3R0ZWQvdGVzdGVkIGJ5IENvbGluIFdhdHNvbjsgYnozNjQ1
CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzaC9vcGVuc3NoLXBvcnRhYmxl
L2NvbW1pdC8xMDM2ZDc3YjM0YTVmYTE1ZTU2ZjUxNmI4MWI5OTI4MDA2ODQ4Y2JkLnBhdGNoCitT
aWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGNvbGxpbnMuY29tPgor
LS0tCisgbTQvb3BlbnNzaC5tNCB8IDEyICsrKysrKysrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9tNC9vcGVuc3No
Lm00IGIvbTQvb3BlbnNzaC5tNAoraW5kZXggNWQ0YzU2MjgwZmMuLjAzM2RmNTAxYzNkIDEwMDY0
NAorLS0tIGEvbTQvb3BlbnNzaC5tNAorKysrIGIvbTQvb3BlbnNzaC5tNAorQEAgLTIwLDE4ICsy
MCwyNCBAQCBjaGFyICpmMihjaGFyICpzLCAuLi4pIHsKKyAJdmFfZW5kKGFyZ3MpOworIAlyZXR1
cm4gc3RyZHVwKHJldCk7CisgfQorK2NvbnN0IGNoYXIgKmYzKGludCBzKSB7CisrCXJldHVybiBz
ID8gImdvb2QiIDogImdvb2RlciI7CisrfQorIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikgeworLQkodm9pZClhcmd2OworIAljaGFyIGJbMjU2XSwgKmNwOworKwljb25zdCBjaGFyICpz
OworIAkvKiBTb21lIG1hdGggdG8gY2F0Y2ggLWZ0cmFwdiBwcm9ibGVtcyBpbiB0aGUgdG9vbGNo
YWluICovCisgCWludCBpID0gMTIzICogYXJnYywgaiA9IDQ1NiArIGFyZ2MsIGsgPSA3ODkgLSBh
cmdjOworIAlmbG9hdCBsID0gaSAqIDIuMTsKKyAJZG91YmxlIG0gPSBsIC8gMC41OworIAlsb25n
IGxvbmcgaW50IG4gPSBhcmdjICogMTIzNDVMTCwgbyA9IDEyMzQ1TEwgKiAobG9uZyBsb25nIGlu
dClhcmdjOworKwkodm9pZClhcmd2OworIAlmKDEpOworLQlzbnByaW50ZihiLCBzaXplb2YgYiwg
IiVkICVkICVkICVmICVmICVsbGQgJWxsZFxuIiwgaSxqLGssbCxtLG4sbyk7CisrCXMgPSBmMyhm
KDIpKTsKKysJc25wcmludGYoYiwgc2l6ZW9mIGIsICIlZCAlZCAlZCAlZiAlZiAlbGxkICVsbGQg
JXNcbiIsIGksaixrLGwsbSxuLG8scyk7CisgCWlmICh3cml0ZSgxLCBiLCAwKSA9PSAtMSkgZXhp
dCgwKTsKKy0JY3AgPSBmMigiJWQgJWQgJWQgJWYgJWYgJWxsZCAlbGxkXG4iLCBpLGosayxsLG0s
bixvKTsKKysJY3AgPSBmMigiJWQgJWQgJWQgJWYgJWYgJWxsZCAlbGxkICVzXG4iLCBpLGosayxs
LG0sbixvLHMpOworKwlpZiAod3JpdGUoMSwgY3AsIDApID09IC0xKSBleGl0KDApOworIAlmcmVl
KGNwKTsKKyAJLyoKKyAJICogVGVzdCBmYWxsdGhyb3VnaCBiZWhhdmlvdXIuICBjbGFuZyAxMCdz
IC1XaW1wbGljaXQtZmFsbHRocm91Z2ggZG9lcwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3No
L29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawppbmRleCBlYzllNjYxM2Iw
Li5lZjUzMGNjODUwIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5taworKysg
Yi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawpAQCAtMTMsNiArMTMsOSBAQCBPUEVOU1NIX1NJ
VEUgPSBodHRwOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUK
IE9QRU5TU0hfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgQlNELTItQ2xhdXNlLCBQdWJsaWMgRG9t
YWluCiBPUEVOU1NIX0xJQ0VOU0VfRklMRVMgPSBMSUNFTkNFCiAKKyMgMDAwMS1iZXR0ZXItZGV0
ZWN0aW9uLW9mLWJyb2tlbi1memVyby1jYWxsLXVzZWQtcmVncy5wYXRjaAorT1BFTlNTSF9BVVRP
UkVDT05GID0gWUVTCisKIE9QRU5TU0hfQ09ORl9FTlYgPSBcCiAJTEQ9IiQoVEFSR0VUX0NDKSIg
XAogCUxERkxBR1M9IiQoVEFSR0VUX0NGTEFHUykiIFwKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
