Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A8AC6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 15:33:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5DB86128D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 15:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5DB86128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA938277E;
	Thu, 22 Jul 2021 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80UnqzlHjwwj; Thu, 22 Jul 2021 15:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEAF1826B7;
	Thu, 22 Jul 2021 15:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A128E1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 15:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DD4E40148
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 15:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nX_U5IPWWmob for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 15:32:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D204010C
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 15:32:57 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6agvmVtbKp6qU6agvmmjxw; Thu, 22 Jul 2021 17:32:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626967974; bh=M2qrZ0mCywfEIKNgqnfE7G+Di6yuSHkNEYxSauWxEOY=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=n9NKholj1RFbgKhn1C6jILpezre1k7FpYdfhmBmZKPVRgGaAY3SAPFbHZMMQT13UL
 GA3AqzesK/rWpbxMnCQi4iQTB6szP1vStFvzfVB7zr3Ouu5KJsDxKBXFBWMYbYzLbq
 brfBz4ZCp6/Q/8lUqB4ucJ/B2oPK2547/BM2z/AN8vYSdGmJx9OojibotOMLY4jMYG
 OUZu5xY7Ok8NWpG4oPN9qRf5SoyWE8ZhbgOx6r9QdEyCmy7NzpdQohqI5hEk2o2eRj
 tm1ZbOgt/r2hv4FuHOeIv4M+fOuj1POIcN3pg+QdKUQy2OEoQr8vQrObaUwyQ/R4Z0
 cPNHfmSR9JfZQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 17:32:52 +0200
Message-Id: <20210722153252.1157045-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGL8Jns1WUdOHTSfRf5ZbVN8AmYvnFlcPhWb4rhBMQU06PGJun3cNKIA3gsXBEx+Ushu8TLXHus4I7ZATDwRkbuG3O/hi+Zxt117ZYOqVp4V+hqAO3QE
 4j4KD2A8Edgi+VNCqhDOZM/CX8C58tsFZKv6Lvwo69iUFMvj8P8GUOv4Tsjxw4i5uyASAoCZa+JK+jWVLYhCusYQ/WBX1J8k/Bz1e9wmVupMit+kl65xXXBr
 w/OJnqvVOTP50ueoYi6buEhnEbL/KGSkCJ9XBh1QLqsGP7DtOOZjFjuvrHIZxN9Y
Subject: [Buildroot] [PATCH] package/nfs-utils: fix time_t on 64-bits
 platforms build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

QWRkIHBhdGNoIHRvIGZpeCB0aW1lX3QgYnVpbGQgZmFpbHVyZSBvbiA2NC1iaXRzIHBsYXRmb3Jt
cy4KCkZpeGVzOgpodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85YmMxZDQz
YTU4ODMzOGI3Mzk1YWY3YmM5NzUzNWVlMTZhNmVhMmQ5LwoKU2lnbmVkLW9mZi1ieTogR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Ci0tLQogLi4u
bWVfdC1idWlsZC1lcnJvci1vbi02NC1iaXRzLXBsYXRmb3JtLnBhdGNoIHwgNTIgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL25mcy11dGlscy8wMDAxLW5mcy11dGlscy1maXgtdGltZV90LWJ1aWxk
LWVycm9yLW9uLTY0LWJpdHMtcGxhdGZvcm0ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25m
cy11dGlscy8wMDAxLW5mcy11dGlscy1maXgtdGltZV90LWJ1aWxkLWVycm9yLW9uLTY0LWJpdHMt
cGxhdGZvcm0ucGF0Y2ggYi9wYWNrYWdlL25mcy11dGlscy8wMDAxLW5mcy11dGlscy1maXgtdGlt
ZV90LWJ1aWxkLWVycm9yLW9uLTY0LWJpdHMtcGxhdGZvcm0ucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMWRlYzQ5NGYyNgotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvbmZzLXV0aWxzLzAwMDEtbmZzLXV0aWxzLWZpeC10aW1lX3QtYnVpbGQtZXJyb3Itb24t
NjQtYml0cy1wbGF0Zm9ybS5wYXRjaApAQCAtMCwwICsxLDUyIEBACitGcm9tIDlkMjVmYWFlMTIx
NjI1OGI2MTdkZDJkYjEzNGJjMWQ5ZmEwZmQ3M2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNv
bT4KK0RhdGU6IFRodSwgMjIgSnVsIDIwMjEgMTY6MTM6MTQgKzAyMDAKK1N1YmplY3Q6IFtQQVRD
SF0gbmZzLXV0aWxzOiBmaXggdGltZV90IGJ1aWxkIGVycm9yIG9uIDY0LWJpdHMgcGxhdGZvcm1z
CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1doZW4gcGFzc2luZyB0aW1l
X3QgdHlwZSB0byAiJWxkIiBvbiA2NC1iaXRzIHBsYXRmb3JtcyB3aGVyZSB0aW1lX3QgaXMgYQor
J2xvbmcgbG9uZycgd2UgZW5jb3V0ZXIgdGhpcyBidWlsZCBmYWlsdXJlOgorZXJyb3I6IGZvcm1h
dCDigJglbGTigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGxvbmcgaW504oCZLCBidXQg
YXJndW1lbnQgNCBoYXMgdHlwZSDigJh0aW1lX3TigJkge2FrYSDigJhsb25nIGxvbmcgaW504oCZ
fSBbLVdlcnJvcj1mb3JtYXQ9XQorCitTbyBsZXQncyBjaGFuZ2UgIiVsZCIgbWFya2VycyB0byAi
JWxsZCIgYXNzdW1pbmcgaXQgdG8gYmUgYSA2NC1iaXRzIGFuZAorY2FzdCB2YXJpYWJsZXMgdG8g
Jyhsb25nIGxvbmcpJyBpZiB0aGUgdHlwZSBpcyBhIHRpbWVfdC4KKworU2lnbmVkLW9mZi1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cist
LS0KKyB1dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0cmFjay5jIHwgMiArLQorIHV0aWxzL25mc2Rj
bHRyYWNrL3NxbGl0ZS5jICAgICAgfCA0ICsrLS0KKyAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3V0aWxzL25mc2RjbHRyYWNr
L25mc2RjbHRyYWNrLmMgYi91dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0cmFjay5jCitpbmRleCBl
OTI2ZjFjMC4uNDM3NDc3YmIgMTAwNjQ0CistLS0gYS91dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0
cmFjay5jCisrKysgYi91dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0cmFjay5jCitAQCAtNTI1LDcg
KzUyNSw3IEBAIGNsdHJhY2tfZ3JhY2Vkb25lKGNvbnN0IGNoYXIgKnRpbWVzdHIpCisgCWlmICgq
dGFpbCkKKyAJCXJldHVybiAtRUlOVkFMOworIAorLQl4bG9nKERfR0VORVJBTCwgIiVzOiBncmFj
ZSBkb25lLiBncmFjZXRpbWU9JWxkIiwgX19mdW5jX18sIGdyYWNldGltZSk7CisrCXhsb2coRF9H
RU5FUkFMLCAiJXM6IGdyYWNlIGRvbmUuIGdyYWNldGltZT0lbGxkIiwgX19mdW5jX18sIChsb25n
IGxvbmcpZ3JhY2V0aW1lKTsKKyAKKyAJcmV0ID0gc3FsaXRlX3JlbW92ZV91bnJlY2xhaW1lZChn
cmFjZXRpbWUpOworIAorZGlmZiAtLWdpdCBhL3V0aWxzL25mc2RjbHRyYWNrL3NxbGl0ZS5jIGIv
dXRpbHMvbmZzZGNsdHJhY2svc3FsaXRlLmMKK2luZGV4IGY3OWFlYmIzLi42ZTYwMzA4NyAxMDA2
NDQKKy0tLSBhL3V0aWxzL25mc2RjbHRyYWNrL3NxbGl0ZS5jCisrKysgYi91dGlscy9uZnNkY2x0
cmFjay9zcWxpdGUuYworQEAgLTU0NCw4ICs1NDQsOCBAQCBzcWxpdGVfcmVtb3ZlX3VucmVjbGFp
bWVkKHRpbWVfdCBncmFjZV9zdGFydCkKKyAJaW50IHJldDsKKyAJY2hhciAqZXJyID0gTlVMTDsK
KyAKKy0JcmV0ID0gc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIkRFTEVURSBGUk9NIGNsaWVu
dHMgV0hFUkUgdGltZSA8ICVsZCIsCistCQkJZ3JhY2Vfc3RhcnQpOworKwlyZXQgPSBzbnByaW50
ZihidWYsIHNpemVvZihidWYpLCAiREVMRVRFIEZST00gY2xpZW50cyBXSEVSRSB0aW1lIDwgJWxs
ZCIsCisrCQkJKGxvbmcgbG9uZylncmFjZV9zdGFydCk7CisgCWlmIChyZXQgPCAwKSB7CisgCQly
ZXR1cm4gcmV0OworIAl9IGVsc2UgaWYgKChzaXplX3QpcmV0ID49IHNpemVvZihidWYpKSB7Cist
LSAKKzIuMjUuMQorCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gu
bmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
