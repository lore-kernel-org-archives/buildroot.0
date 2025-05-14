Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F957C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 19:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68DB410BC;
	Wed, 14 May 2025 19:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlA-ji_izUNf; Wed, 14 May 2025 19:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55F640864
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55F640864;
	Wed, 14 May 2025 19:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C326153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5228940FD1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBTItA00Mxiw for <buildroot@buildroot.org>;
 Wed, 14 May 2025 19:17:24 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 14 May 2025 19:17:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C84640140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C84640140
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=210.118.77.12;
 helo=mailout2.w1.samsung.com; envelope-from=l.stelmach@samsung.com;
 receiver=<UNKNOWN> 
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C84640140
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:17:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250514191014euoutp028241187450d83b95994ef17a7f106d55~-enLwIEXO0540005400euoutp02v
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:10:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250514191014euoutp028241187450d83b95994ef17a7f106d55~-enLwIEXO0540005400euoutp02v
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250514191014eucas1p2285ef49df987aabbcfec5d5db83d4d29~-enLbNZNC3246932469eucas1p21;
 Wed, 14 May 2025 19:10:14 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250514191014eusmtip1faba59edb0802e60773940c7b5f89277~-enLXxnAU0532805328eusmtip1D;
 Wed, 14 May 2025 19:10:14 +0000 (GMT)
From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To: buildroot@buildroot.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Date: Wed, 14 May 2025 21:09:42 +0200
Message-Id: <20250514190942.1481011-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
X-CMS-MailID: 20250514191014eucas1p2285ef49df987aabbcfec5d5db83d4d29
X-Msg-Generator: CA
X-RootMTR: 20250514191014eucas1p2285ef49df987aabbcfec5d5db83d4d29
X-EPHeader: CA
X-CMS-RootMailID: 20250514191014eucas1p2285ef49df987aabbcfec5d5db83d4d29
References: <CGME20250514191014eucas1p2285ef49df987aabbcfec5d5db83d4d29@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1747249814;
 bh=dqg5xodG6DrIo1RTTH6PTrADeJn+6uW+HrBf12Z0Wcc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vAFzZC28ek4DlYhPB6AtvBpt9LFfistNhEidBdN6uM9+d2gqd+RPnwwlG4dPRFs9U
 45Rd/PQPZ3wy3BYeF+6VNP4isCDNLBLGiRGyxKS+lKkK/M+8Rke/vslVRW0UB80WU+
 dFzCXNfZNewlCev+VG5Z95x8FdXQ+FBBMSI46elM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=samsung.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=vAFzZC28
Subject: [Buildroot] [PATCH] docs/manual: mention Config.in in
 LIBFOO_DEPENDENCIES
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWVudGlvbiB0aGUgbmVlZCBmb3IgYSBwYXJhbGxlbCBkZXBlbmRlbmN5IHNwZWNpZmljYXRpb24K
aW4gYm90aCAqX0RFUEVOREVOQ0lFUyB2YXJpYWJsZXMgaW4gLm1rIGZpbGVzIGFzIHdlbGwgYXMK
aW4gQ29uZmlnLmluIGZpbGVzIHVzaW5nIHNlbGVjdCBhbmQvb3IgZGVwZW5kcyBvbi4KClNpZ25l
ZC1vZmYtYnk6IMWBdWthc3ogU3RlbG1hY2ggPGwuc3RlbG1hY2hAc2Ftc3VuZy5jb20+Ci0tLQog
ZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWdlbmVyaWMuYWRvYyB8IDUgKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCkkgYW0gbm90IHN1cmUg
dGhpcyBpcyBhY3R1YWxseSB0cnVlLCBidXQgaWYgaXQgaXMsIEkgZmlndXJlIGl0IHdvcnRoCm1l
bnRpb25pbmcuCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWdlbmVy
aWMuYWRvYyBiL2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1nZW5lcmljLmFkb2MKaW5kZXgg
ZjBiMDUwOGY1My4uOWI5MTM1MTEzOCAxMDA2NDQKLS0tIGEvZG9jcy9tYW51YWwvYWRkaW5nLXBh
Y2thZ2VzLWdlbmVyaWMuYWRvYworKysgYi9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ2Vu
ZXJpYy5hZG9jCkBAIC0zNzEsNyArMzcxLDEwIEBAIG5vdCBhbmQgY2FuIG5vdCB3b3JrIGFzIHBl
b3BsZSB3b3VsZCBleHBlY3QgaXQgc2hvdWxkOgogICBIb3dldmVyLCBtb2RpZmljYXRpb25zIHRv
IGNvbmZpZ3VyYXRpb24gb2YgdGhlc2UgZGVwZW5kZW5jaWVzIHdpbGwKICAgbm90IGZvcmNlIGEg
cmVidWlsZCBvZiB0aGUgY3VycmVudCBwYWNrYWdlLiBJbiBhIHNpbWlsYXIgd2F5LAogICArSE9T
VF9MSUJGT09fREVQRU5ERU5DSUVTKyBsaXN0cyB0aGUgZGVwZW5kZW5jaWVzIGZvciB0aGUgY3Vy
cmVudAotICBob3N0IHBhY2thZ2UuCisgIGhvc3QgcGFja2FnZS4gSW4gYWxsIGNhc2VzICgrTElC
Rk9PX0RFUEVOREVOQ0lFUyssCisgICtIT1NUX0xJQkZPT19ERVBFTkRFTkNJRVMrIGFzIHdlbGwg
YXMgdGhlIHZhcmlhYmxlcyBiZWxvdykgdGhlCisgIGRlcGVuZGVuY2llcyBuZWVkIHRvIGJlIHNw
ZWNpZmllZCBpbiBwYXJhbGxlbCB3aXRoICtzZWxlY3QrIG9yCisgICtkZXBlbmRzIG9uKyBpbiB0
aGUgK0NvbmZpZy5pbisgZmlsZS4KIAogKiArTElCRk9PX0VYVFJBQ1RfREVQRU5ERU5DSUVTKyBs
aXN0cyB0aGUgZGVwZW5kZW5jaWVzIChpbiB0ZXJtcyBvZgogICBwYWNrYWdlIG5hbWUpIHRoYXQg
YXJlIHJlcXVpcmVkIGZvciB0aGUgY3VycmVudCB0YXJnZXQgcGFja2FnZSB0byBiZQotLSAKMi4z
OS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
