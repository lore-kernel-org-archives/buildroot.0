Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01D2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 14:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4AB61168
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 14:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C4AB61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF40040813;
	Wed, 22 Sep 2021 14:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmRgX6DT-cre; Wed, 22 Sep 2021 14:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EFAC41480;
	Wed, 22 Sep 2021 14:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95EFE1BF3AF
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 14:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8556460632
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0xFKw6Sl4hY for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 14:09:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70E37605BA
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:09:01 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 4B807BFBF6
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 16:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1632319738;
 bh=Dx0/G6vhqix8oxU3362lxJB4QiUPuAkO7zS5WDhRw6E=;
 h=To:From:Subject:Date:From;
 b=k6dtafDOmjsuTxRMK8wEb9jtS0TTwixCH0ACliVYeDgNs8B2DqSi784FRYVC34GMB
 E5R+WqDgUNvpDiLcOxKtJt0b1tus7y8l1WzVbfjvtT2iaDAPAmTpuIQwvT8cAAQZUn
 FyOsZ7k8MSemFe2u9QiuYaMdaMihKVolHIAiovpOsXOrpMCG7WWVM2bRfn1Xv5wugq
 DBMXA2jGtUsVq98mLYFIPVQJcpNQiFv56CxHoj8IB4ZVx1hrBNP7yP93DYTDfJrxA/
 LnCI+TvDDJwYoJIefQwHuJZx0ojwqP4Lse6mIcvprGizUBLoXLrVHTyqP69OYAbx2p
 pl4mLDy0esNTw==
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <2426ca2d-7fa8-d8a1-c542-0abbfcec3ec8@grenoble.cnrs.fr>
Date: Wed, 22 Sep 2021 16:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix compiler warnings
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Q29tcGlsaW5nIG9uIFVidW50dSAyMC4wNCBnZW5lcmF0ZXMgdGhpczoKCi4vdXRpbC5jOiBJbiBm
dW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmQouL3V0aWwuYzo1NDoxODogd2FybmluZzog4oCY
Li5jb25maWcudG1w4oCZIGRpcmVjdGl2ZSB3cml0aW5nIDEyIGJ5dGVzIGludG8gYSByZWdpb24g
b2Ygc2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KICAgNTQgfCAg
c3ByaW50ZihidWYsICIlcy4uY29uZmlnLnRtcCIsIGRpcik7CiAgICAgIHwgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn4KLi91dGlsLmM6NTQ6Mjogbm90ZTog4oCYc3ByaW50ZuKAmSBvdXRw
dXQgYmV0d2VlbiAxMyBhbmQgNDEwOSBieXRlcyBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA0
MDk3CiAgIDU0IHwgIHNwcmludGYoYnVmLCAiJXMuLmNvbmZpZy50bXAiLCBkaXIpOwogICAgICB8
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKYW5kIHNpbWlsYXIgd2Fybmlu
Z3Mgb24gY29uZmRhdGEuYywgbGluZXMgNzc4LCA5ODksIDk5NSwgMTAwMCwgMTAwNywKMTA0MCwg
MTA0NiBhbmQgMTA1NC4gQXZvaWQgdGhlIHdhcm5pbmdzIGJ5IGVubGFyZ2luZyB0aGUgZGVzdGlu
YXRpb24KYnVmZmVyIG9mIGZwcmludGYoKS4KClNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxi
b25ldEBncmVub2JsZS5jbnJzLmZyPgotLS0KIHN1cHBvcnQva2NvbmZpZy9jb25mZGF0YS5jIHwg
NCArKy0tCiBzdXBwb3J0L2tjb25maWcvdXRpbC5jICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQv
a2NvbmZpZy9jb25mZGF0YS5jIGIvc3VwcG9ydC9rY29uZmlnL2NvbmZkYXRhLmMKaW5kZXggODky
ZGE3NGZkYy4uOWFiOTgwZWRkOCAxMDA2NDQKLS0tIGEvc3VwcG9ydC9rY29uZmlnL2NvbmZkYXRh
LmMKKysrIGIvc3VwcG9ydC9rY29uZmlnL2NvbmZkYXRhLmMKQEAgLTc0NCw3ICs3NDQsNyBAQCBp
bnQgY29uZl93cml0ZShjb25zdCBjaGFyICpuYW1lKQogCXN0cnVjdCBtZW51ICptZW51OwogCWNv
bnN0IGNoYXIgKmJhc2VuYW1lOwogCWNvbnN0IGNoYXIgKnN0cjsKLQljaGFyIGRpcm5hbWVbUEFU
SF9NQVgrMV0sIHRtcG5hbWVbUEFUSF9NQVgrMV0sIG5ld25hbWVbUEFUSF9NQVgrMV07CisJY2hh
ciBkaXJuYW1lW1BBVEhfTUFYKzFdLCB0bXBuYW1lW1BBVEhfTUFYKzIwXSwgbmV3bmFtZVtQQVRI
X01BWCsxXTsKIAljaGFyICplbnY7CiAKIAlpZiAoIW5hbWUpCkBAIC05NzQsNyArOTc0LDcgQEAg
aW50IGNvbmZfd3JpdGVfYXV0b2NvbmYodm9pZCkKIAljb25zdCBjaGFyICpuYW1lOwogCUZJTEUg
Km91dCwgKnRyaXN0YXRlLCAqb3V0X2g7CiAJaW50IGk7Ci0JY2hhciBkaXJbUEFUSF9NQVgrMV0s
IGJ1ZltQQVRIX01BWCsxXTsKKwljaGFyIGRpcltQQVRIX01BWCsxXSwgYnVmW1BBVEhfTUFYKzIw
XTsKIAljaGFyICpzOwogCiAJc3RyY3B5KGRpciwgY29uZl9nZXRfY29uZmlnbmFtZSgpKTsKZGlm
ZiAtLWdpdCBhL3N1cHBvcnQva2NvbmZpZy91dGlsLmMgYi9zdXBwb3J0L2tjb25maWcvdXRpbC5j
CmluZGV4IDE4YThlNTIzOTEuLjg2NjVmNWJiODkgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQva2NvbmZp
Zy91dGlsLmMKKysrIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwpAQCAtMzUsNyArMzUsNyBAQCBz
dHJ1Y3QgZmlsZSAqZmlsZV9sb29rdXAoY29uc3QgY2hhciAqbmFtZSkKIGludCBmaWxlX3dyaXRl
X2RlcChjb25zdCBjaGFyICpuYW1lKQogewogCWNoYXIgKnN0cjsKLQljaGFyIGJ1ZltQQVRIX01B
WCsxXSwgYnVmMltQQVRIX01BWCsxXSwgZGlyW1BBVEhfTUFYKzFdOworCWNoYXIgYnVmW1BBVEhf
TUFYKzIwXSwgYnVmMltQQVRIX01BWCsxXSwgZGlyW1BBVEhfTUFYKzFdOwogCXN0cnVjdCBzeW1i
b2wgKnN5bSwgKmVudl9zeW07CiAJc3RydWN0IGV4cHIgKmU7CiAJc3RydWN0IGZpbGUgKmZpbGU7
Ci0tIAoyLjI1LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
