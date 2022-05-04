Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323F4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 16:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39E183F36;
	Wed,  4 May 2022 16:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtdPTyjnpvhl; Wed,  4 May 2022 16:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F12283F2A;
	Wed,  4 May 2022 16:42:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE4B1BF3F4
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 16:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B784408AD
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 16:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qom1Ioqvyz1R for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 16:42:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C193C4035B
 for <buildroot@buildroot.org>; Wed,  4 May 2022 16:42:52 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id e128so1338336qkd.7
 for <buildroot@buildroot.org>; Wed, 04 May 2022 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vo8IIiH9JiATm8VF35YBlxf0BlqhQB56mwVomeK7eZw=;
 b=XOUeKELBhJVtMVF4Vgws8yOWr7YgDM6FpzukCF8J2RUmYGjGl85DPGpgWKaMjBe/Dh
 MvsRqFEYx7Lp1VCby47s4hZLOoj2nR00Ykk1gBeIIuGiode37z/bm0kpKvtelXqBIIsY
 I99RvIjNZY1J6IgPrWmPGpRVaCdJgTb4I/mm8v7tBOVSZVkTKXIOJP2MSvthnRB1+qDZ
 7ruMXAcvA7Xhz2+pVgfyxhsOJ3S78LHrZTLZkx+VBnP4fP4mz31WYxQEiW9uCk3B0dGx
 eoU0k3UiXRRdOtKRWURucc/0101Zp7nGCRvYipO1ICJeYzJf0iBYfRFUuiZ9KwugmO79
 zXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vo8IIiH9JiATm8VF35YBlxf0BlqhQB56mwVomeK7eZw=;
 b=JU6pIjg8zFlE1tIiBkdEc63JVKdmGh69CiuXRNHxPKbxU3+Ye/FZtAz2A88Jnmcp3Q
 i3jZh9mHw1OSMAMh1fmOZEjtjIfnfd2zWr8Ef0fHDikJpOGOBrfMDqVxoUzVVsOsf8Vd
 +bervAiSaGbDYL8SgHXn9vUGfG1hVbCNhezDgOxTsSesBFjTFOO8B0xDI4P+usrxffAb
 gTVnalR7WqJTDJEi5EZ2mAK83cpQIy0OKl5FeAAkQX7yHjUFNQ/P5DXXYemRIJ5toKAu
 DoS4sXDTR/ASeI+DBaSmqwDfMcvGpnqCCZFBQBFoQ8KOLh9L20O8pKOKlPDYFfWxUH4P
 z0zw==
X-Gm-Message-State: AOAM533MCKorQt/YCQpskZv5v4zVZZr/Ruk4QC5AP/NaNBp2LM1m/BMr
 soQm4RlCjFs9YDXui1tObZs+6mwzE0U=
X-Google-Smtp-Source: ABdhPJxZ0/WZWD+JO0fKUhZPHhvVBOdc88dnR3a4zG1coHkcJnKq933b1qYaG30KtVEnO9JAWLowtw==
X-Received: by 2002:ae9:edd5:0:b0:69f:d773:5327 with SMTP id
 c204-20020ae9edd5000000b0069fd7735327mr12157846qkg.481.1651682571201; 
 Wed, 04 May 2022 09:42:51 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 f3-20020ac86ec3000000b002f39b99f6c4sm8016149qtv.94.2022.05.04.09.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:42:50 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 12:42:14 -0400
Message-Id: <20220504164214.1095968-1-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openocd: Fix segfault when using
 ST-Link driver
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
Cc: Yannick Brosseau <yannick.brosseau@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVjZW50IGNoYW5nZXMgaW4gbGlidXNiIGhhdmUgZXhwb3NlZCBhIGJ1ZyBpbiBPcGVuT0NEIHdo
aWNoIG5vdyBjcmFzaCB3aGVuIHRyeWluZwp0byB1c2UgdGhlIFNULUxpbmsgZHJpdmVyLgoKVXBz
dHJlYW0gaGFzIGEgZml4IGFzIGNvbW1pdCBjZmYwZTQxN2RhNThhZGVmMWNlZWY5YTYzYTk5NDEy
YzJjYzg3ZmYzLiBUaGlzIGFkZCB0aGUgY29tbWl0CmFzIGEgc3RhbmQgYWxvbmUgcGF0Y2guCgpT
aG91bGQgYmUgcmVtb3ZlZCB3aGVuIE9wZW5PQ0QgaXMgdXBkYXRlZCB0byBhIG5ld2VyIHJlbGVh
c2UgdGhhbiAwLjExCi0tLQogLi4uR1Ytd2l0aC1saWJ1c2ItdjEuMC4yNC0zMy1nMzJhMjIwNi0x
LnBhdGNoIHwgODggKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDg4IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW5vY2QvMDAwMy1zdGxpbmst
Zml4LVNJR1NFR1Ytd2l0aC1saWJ1c2ItdjEuMC4yNC0zMy1nMzJhMjIwNi0xLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9vcGVub2NkLzAwMDMtc3RsaW5rLWZpeC1TSUdTRUdWLXdpdGgtbGli
dXNiLXYxLjAuMjQtMzMtZzMyYTIyMDYtMS5wYXRjaCBiL3BhY2thZ2Uvb3Blbm9jZC8wMDAzLXN0
bGluay1maXgtU0lHU0VHVi13aXRoLWxpYnVzYi12MS4wLjI0LTMzLWczMmEyMjA2LTEucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNWRlM2M5MWZiZQotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2Uvb3Blbm9jZC8wMDAzLXN0bGluay1maXgtU0lHU0VHVi13aXRo
LWxpYnVzYi12MS4wLjI0LTMzLWczMmEyMjA2LTEucGF0Y2gKQEAgLTAsMCArMSw4OCBAQAorRnJv
bSBjZmYwZTQxN2RhNThhZGVmMWNlZWY5YTYzYTk5NDEyYzJjYzg3ZmYzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogQW50b25pbyBCb3JuZW8gPGJvcm5lby5hbnRvbmlvQGdtYWlsLmNv
bT4KK0RhdGU6IFdlZCwgMjMgSnVuIDIwMjEgMTY6NTI6MTYgKzAyMDAKK1N1YmplY3Q6IFtQQVRD
SF0gc3RsaW5rOiBmaXggU0lHU0VHViB3aXRoIGxpYnVzYiB2MS4wLjI0LTMzLWczMmEyMjA2ICgx
MTYxOCkKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworVGhlIHN0bGluayBk
cml2ZXIgaW5jb3JyZWN0bHkgdXNlcyBhIE5VTEwgcG9pbnRlciBmb3IgbGlidXNiJ3MKK3N0cnVj
dCBsaWJ1c2JfY29udGV4dC4KK1RoZSBjb3JyZWN0IHZhbHVlIHRvIGJlIHVzZWQgaXMgbG9jYWwg
aW4gbGlidXNiX2hlbHBlci5jLgorCitNb3ZlIGluIHRoZSBoZWxwZXIgZmlsZSwgaW4gYSB3cmFw
cGVyIGZ1bmN0aW9uLCB0aGUgb25seSBjYWxsIHRoYXQKK3JlcXVpcmVzIHRoZSBhYm92ZSB2YWx1
ZSwgYW5kIGxldCBzdGxpbmsgZHJpdmVyIHRvIHVzZSB0aGlzCit3cmFwcGVyLgorCitUaGlzIGlz
c3VlIGhhcyBub3QgdHJpZ2dlcmVkIGFueSB2aXNpYmxlIHByb2JsZW0gdW50aWwgYSBjb2RlCity
ZWZhY3RvcmluZyBbMV0gaW4gbGlidXNiIGhhcyBtYWRlIE9wZW5PQ0QgY3Jhc2hpbmcgb24gV2lu
ZG93cyBhbmQKK29uIE1hY09TLgorCitDaGFuZ2UtSWQ6IElkMTgxOGM4YWY3Y2YwZDRkMTdkZmEx
ZDIyYWFkMDc5ZGEwMWVmNzQwCitTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8Ym9ybmVv
LmFudG9uaW9AZ21haWwuY29tPgorRml4ZXM6IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Avb3Bl
bm9jZC90aWNrZXRzLzMwOC8KK0ZpeGVzOiBodHRwczovL2dpdGh1Yi5jb20vbGlidXNiL2xpYnVz
Yi9pc3N1ZXMvOTI4LworRml4ZXM6IDQyZDhmYTg5OWM2YSAoInN0bGlua191c2I6IFN1Ym1pdCBt
dWx0aXBsZSBVU0IgVVJCcyBhdCBvbmNlIHRvIGltcHJvdmUgcGVyZm9ybWFuY2UiKQorTGluazog
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ1c2IvbGlidXNiL2NvbW1pdC8zMmEyMjA2OTQyOGMK
K1JlcG9ydGVkLWJ5OiBBbmRyemVqIFNpZXLFvMSZZ2EgPGFzaWVyNzBAZ21haWwuY29tPgorQ28t
ZGV2ZWxvcGVkLWJ5OiBBbmRyemVqIFNpZXLFvMSZZ2EgPGFzaWVyNzBAZ21haWwuY29tPgorQ28t
ZGV2ZWxvcGVkLWJ5OiBYaWFvZmFuIENoZW4gPHhpYW9mYW5jQGdtYWlsLmNvbT4KK1Jldmlld2Vk
LW9uOiBodHRwOi8vb3Blbm9jZC56eWxpbi5jb20vNjMzMQorVGVzdGVkLWJ5OiBqZW5raW5zCitS
ZXZpZXdlZC1ieTogTWFyYyBTY2hpbmsgPGRldkB6YXBiLmRlPgorUmV2aWV3ZWQtYnk6IFhpYW9m
YW4gPHhpYW9mYW5jQGdtYWlsLmNvbT4KK1Jldmlld2VkLWJ5OiBBbmRyemVqIFNpZXLFvMSZZ2Eg
PGFzaWVyNzBAZ21haWwuY29tPgorUmV2aWV3ZWQtYnk6IE9sZWtzaWogUmVtcGVsIDxsaW51eEBy
ZW1wZWwtcHJpdmF0LmRlPgorUmV2aWV3ZWQtYnk6IEFuZHJlYXMgRnJpdGlvZnNvbiA8YW5kcmVh
cy5mcml0aW9mc29uQGdtYWlsLmNvbT4KKy0tLQorIHNyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hl
bHBlci5jIHwgNSArKysrKworIHNyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5oIHwgMSAr
Cisgc3JjL2p0YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMgICAgfCA3ICstLS0tLS0KKyAzIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBh
L3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5jIGIvc3JjL2p0YWcvZHJpdmVycy9saWJ1
c2JfaGVscGVyLmMKK2luZGV4IGYwMTIyZDUzNC4uMThmZTRiYWQ0IDEwMDY0NAorLS0tIGEvc3Jj
L2p0YWcvZHJpdmVycy9saWJ1c2JfaGVscGVyLmMKKysrKyBiL3NyYy9qdGFnL2RyaXZlcnMvbGli
dXNiX2hlbHBlci5jCitAQCAtMzYzLDMgKzM2Myw4IEBAIGludCBqdGFnX2xpYnVzYl9nZXRfcGlk
KHN0cnVjdCBsaWJ1c2JfZGV2aWNlICpkZXYsIHVpbnQxNl90ICpwaWQpCisgCisgCXJldHVybiBF
UlJPUl9GQUlMOworIH0KKysKKytpbnQganRhZ19saWJ1c2JfaGFuZGxlX2V2ZW50c19jb21wbGV0
ZWQoaW50ICpjb21wbGV0ZWQpCisreworKwlyZXR1cm4gbGlidXNiX2hhbmRsZV9ldmVudHNfY29t
cGxldGVkKGp0YWdfbGlidXNiX2NvbnRleHQsIGNvbXBsZXRlZCk7CisrfQorZGlmZiAtLWdpdCBh
L3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5oIGIvc3JjL2p0YWcvZHJpdmVycy9saWJ1
c2JfaGVscGVyLmgKK2luZGV4IGZhN2QwNmUyOC4uM2U3Nzg2NWQ2IDEwMDY0NAorLS0tIGEvc3Jj
L2p0YWcvZHJpdmVycy9saWJ1c2JfaGVscGVyLmgKKysrKyBiL3NyYy9qdGFnL2RyaXZlcnMvbGli
dXNiX2hlbHBlci5oCitAQCAtNjAsNSArNjAsNiBAQCBpbnQganRhZ19saWJ1c2JfY2hvb3NlX2lu
dGVyZmFjZShzdHJ1Y3QgbGlidXNiX2RldmljZV9oYW5kbGUgKmRldmgsCisgCQl1bnNpZ25lZCBp
bnQgKnVzYl93cml0ZV9lcCwKKyAJCWludCBiY2xhc3MsIGludCBzdWJjbGFzcywgaW50IHByb3Rv
Y29sLCBpbnQgdHJhbnNfdHlwZSk7CisgaW50IGp0YWdfbGlidXNiX2dldF9waWQoc3RydWN0IGxp
YnVzYl9kZXZpY2UgKmRldiwgdWludDE2X3QgKnBpZCk7CisraW50IGp0YWdfbGlidXNiX2hhbmRs
ZV9ldmVudHNfY29tcGxldGVkKGludCAqY29tcGxldGVkKTsKKyAKKyAjZW5kaWYgLyogT1BFTk9D
RF9KVEFHX0RSSVZFUlNfTElCVVNCX0hFTFBFUl9IICovCitkaWZmIC0tZ2l0IGEvc3JjL2p0YWcv
ZHJpdmVycy9zdGxpbmtfdXNiLmMgYi9zcmMvanRhZy9kcml2ZXJzL3N0bGlua191c2IuYworaW5k
ZXggYzY4YmJiM2NhLi43YjE5MzJiOWYgMTAwNjQ0CistLS0gYS9zcmMvanRhZy9kcml2ZXJzL3N0
bGlua191c2IuYworKysrIGIvc3JjL2p0YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMKK0BAIC00OTcs
MTMgKzQ5Nyw4IEBAIHN0YXRpYyB2b2lkIHN5bmNfdHJhbnNmZXJfd2FpdF9mb3JfY29tcGxldGlv
bihzdHJ1Y3QgbGlidXNiX3RyYW5zZmVyICp0cmFuc2ZlcikKKyB7CisgCWludCByLCAqY29tcGxl
dGVkID0gdHJhbnNmZXItPnVzZXJfZGF0YTsKKyAKKy0JLyogQXNzdW1pbmcgYSBzaW5nbGUgbGli
dXNiIGNvbnRleHQgZXhpc3RzLiAgVGhlcmUgbm8gZXhpc3RpbmcgaW50ZXJmYWNlIGludG8gdGhp
cworLQkgKiBtb2R1bGUgdG8gcGFzcyBhIGxpYnVzYiBjb250ZXh0LgorLQkgKi8KKy0Jc3RydWN0
IGxpYnVzYl9jb250ZXh0ICpjdHggPSBOVUxMOworLQorIAl3aGlsZSAoISpjb21wbGV0ZWQpIHsK
Ky0JCXIgPSBsaWJ1c2JfaGFuZGxlX2V2ZW50c19jb21wbGV0ZWQoY3R4LCBjb21wbGV0ZWQpOwor
KwkJciA9IGp0YWdfbGlidXNiX2hhbmRsZV9ldmVudHNfY29tcGxldGVkKGNvbXBsZXRlZCk7Cisg
CQlpZiAociA8IDApIHsKKyAJCQlpZiAociA9PSBMSUJVU0JfRVJST1JfSU5URVJSVVBURUQpCisg
CQkJCWNvbnRpbnVlOworLS0gCisyLjM1LjEKKwotLSAKMi4zNi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
