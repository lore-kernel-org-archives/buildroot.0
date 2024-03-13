Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4363FC54E66
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 22:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF9B880BBC;
	Wed, 13 Mar 2024 22:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXUPKAPCNJQW; Wed, 13 Mar 2024 22:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C604F81277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C604F81277;
	Wed, 13 Mar 2024 22:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A12201BF3D9
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 22:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EB7060B00
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 22:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQj2IiomVugu for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 22:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FF0C60A70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF0C60A70
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FF0C60A70
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 22:50:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DD029C0CC8
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 22:46:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 355F3E0002;
 Wed, 13 Mar 2024 22:46:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Mar 2024 23:46:08 +0100
Message-ID: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1710369974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jns27VxkTiAbJi6PGiQl5OO/d4OEdKRCOMQ6usTKTAs=;
 b=Q4e/8C1ZMapdlOBZxxy/p7XVblfNoyyFce5bkofpJVmhJnE8PfVCASMCk452ZJg85MXDsU
 KzuekgG3B3i5qkrG+iu/2IiWIMfPGIlPRK/pz68GPMKJZ1Fdt6iKVAegwymnPnvCgv5VuQ
 ZMVI95CQXJlBsrEUtUHD8sVVRszzjSVI9f8qMtSLDzqzO/2IarZlhu1AmqrRRABJy0e2W0
 nSDT/WGyeNLVIxAXqzwdWaBke+y8ZfkwFdhQRb+fZy70QAuiUHVmlVNw5rOqIWtbd+WHyr
 Ilxn4GvipD/DlDycT0lflJeqyyoB6GWXzN34Ljpf/U1TCPcZWV9XdeoGyxTIWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q4e/8C1Z
Subject: [Buildroot] [PATCH 0/2] package/qt5/qt5webkit: backport upstream
 patches to fix build
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCndoaWxlIHVwZGF0aW5nIGEgbG9jYWwgYnVpbGRyb290IHRyZWUgdG8gMjAyNC4wMiwg
SSBvYnNlcnZlZCBzb21lIGJ1aWxkCmZhaWx1cmVzIGFyb3VuZCBxdDV3ZWJraXQsIHdoaWNoIGFy
ZSByZXByb2R1Y2libGUgd2l0aCB1cHN0cmVhbSB0cmVlIHdpdGgKdGhlIGZvbGxvd2luZyBtaW5p
bWFsIGRlZmNvbmZpZywgYm90aCBvbiAyMDI0LjAyIHRhZyBhbmQgbWFzdGVyOgoKQlIyX2FybT15
CkJSMl9jb3J0ZXhfYTk9eQpCUjJfQVJNX0VOQUJMRV9ORU9OPXkKQlIyX0FSTV9FTkFCTEVfVkZQ
PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJ
Tj15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WN19FQUJJSEZfR0xJQkNfU1RB
QkxFPXkKQlIyX1BBQ0tBR0VfUVQ1PXkKQlIyX1BBQ0tBR0VfUVQ1V0VCS0lUPXkKClRoZXJlIGFy
ZSB0d28gZGlmZmVyZW50IGlzc3VlcyBicmVha2luZyB0aGUgYnVpbGQuIEJvdGggYXJlIGFscmVh
ZHkgZml4ZWQKaW4gdXBzdHJlYW0gV2Via2l0IHJlcG9zaXRvcnksIGJ1dCB0aGUgY3VycmVudCBx
dDV3ZWJraXQgdmVyc2lvbiB0cmFja2VkIGluCmJ1aWxkcm9vdCBkb2VzIG5vdCBoYXZlIHRoZSBj
b3JyZXNwb25kaW5nIGZpeGVzLiBUaGlzIHNlcmllcyBicmluZ3MgdGhlIHR3bwpjb3JyZXNwb25k
aW5nIHBhdGNoZXMgZnJvbSB1cHN0cmVhbSBXZWJraXQgdG8gZml4IHRoZSBidWlsZC4KCkFsZXhp
cyBMb3Rob3LDqSAoMik6CiAgcGFja2FnZS9xdDUvcXQ1d2Via2l0OiBmaXggSmF2YVNjcmlwdENv
cmUgcGFyc2VyIGVycm9yCiAgcGFja2FnZS9xdDUvcXQ1d2Via2l0OiBmaXggV2ViQ29yZSBjb21w
YXRpYmlsaXR5IGlzc3VlIHdpdGggdXBkYXRlZAogICAgbGlieG1sMgoKIC4uLm5ncy13aXRoLW5l
d2VyLVJ1YnktdmVyc2lvbnMtaHR0cHMtYi5wYXRjaCB8IDQ4ICsrKysrKysrKysrKysrKwogLi4u
LWxpYnhtbDItdmVyc2lvbi0yLjEyLjAtZHVlLXRvLUFQSS1jLnBhdGNoIHwgNjEgKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NXdlYmtpdC8wMDA3LU9mZmxpbmVhc20td2FybmluZ3Mt
d2l0aC1uZXdlci1SdWJ5LXZlcnNpb25zLWh0dHBzLWIucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAwOC1CdWlsZC1mYWlscy13aXRoLWxpYnhtbDItdmVy
c2lvbi0yLjEyLjAtZHVlLXRvLUFQSS1jLnBhdGNoCgotLSAKMi40My4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
