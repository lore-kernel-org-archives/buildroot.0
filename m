Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AC9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA3B60F70
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BA3B60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65FFE6059F;
	Wed, 15 Sep 2021 21:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAOucvbF_UAs; Wed, 15 Sep 2021 21:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B866077F;
	Wed, 15 Sep 2021 21:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB5391BF2FB
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E863480C79
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfPlz4BV7uPB for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 21:14:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A718180C76
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 21:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631740440;
 bh=c/GLrQotdUDSj6ZO1iqMHoQBPUcfWlNVe1LGUY08AHA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=HV5xvB1I++9zeMsgeRm8eEuK0VUxoWnXZ6khUzIbFz3XX4twF198UadFWM8OoKNzD
 P03Q1aczvN5VrCQ/Ss0Pp0xY2qzpg39LxRgblcTH5/0C8P4OcQCbm6wsXQZIzHxuEB
 /nbMgh9GJW0xzMnJxzAtsYx7G5TH7jLB9gNl44II=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.112]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MGz1V-1mdWOp0Uuh-00E3v3; Wed, 15 Sep 2021 23:14:00 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 23:13:57 +0200
Message-Id: <20210915211357.31028-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:IEZ8HmaHs+tjQm+PaR4bpM7uFuyHBu6z+dN6YPdCIb2UtACJ9Hc
 tkKE2G+O9ZgISDAfYiaGY7yzfYMSjU5Iq9auf47NxQpCnuykHx3TsDTcNO8vOWOSUEunlN8
 6vqLO63jKuaEkM68Osjp06uRWEcIrxXE7XrbC3GW9+TVov3ch5Wf4eQQqX9vbOGPFRH7PDZ
 /imLBfHLnnmvmk7K+0fcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XF3JAO90dvE=:9DtVb2mHxKK1R//yufqGXm
 4eQ9akzoBE7ZaUy5oZQT5DI1gkThw6PCluWYbbb4OQNclBWUuSX5mWlUoAyFwzl9GmR8Aj/K7
 n7TaK6D9KlIR7dwB83/dGfw0Rqg8Ss9Hk36A9Jr/BQ39awL8wBnx/W5dON1MwSCcgYf49TZ8e
 gckoz6Tf+eyw8yYzNh7v0sFrZ8/HaF8na4j2IUDwl88LUu7ndfZ568NlLjI8diXJMO+ce2t3q
 iDaojbmLN/gWTHtGtBjzm405C1zQx5NDXzPj97WU9bCWbk3MyVwLNALWhggCkgwxGq/fSz+J0
 Xc2K7sfkyqHg+fOVD9ujyrxFqGmf7NyeJBsvhrGIlWJ3DxKcwVXO6bHVg/V1s0Uk38Ns3jXT5
 9xqBf9B9Jt4SjBJwYQbuG5Y2FmIh8F0JuR5gqkimSYjUn0MYuHXcuVGGbW3a2QSB3EmCeha16
 hCJfiViKNKxkFFd4/equpEy5Q1bkYamvuRWz1zWpOBaQxEkDfZHl+L3ctXF2T/SRAZputO7Yr
 OJKD76zVRPY0NLPspSC88alFku/OYi9ZE5I41OUAVpHLHPssIads+6FXgbf92DwLMuMvEiuo8
 pJwwqgajGmyocxjvojcqjCaros4FbmqdmT8PzOQU7hAcDDDDtkbJVEOB5vjMGJe4QJm+vzm5e
 OAtp94h95m58BfbLvi85N79aVoP/6JcT8qHg4qWpJqi/rgvUeFWTjx4h5c835Xe+Ly6+9liVn
 P3whQsonu8wblW+AAjXNyZ6cJiF1Ddk1iYMfOwUb47DRsirXfF6lrDpE8UuZyJ2wU8kyVHATJ
 63BCjS3s1OQ/wFVtAdoMQICruwotyg2igXy2Cp7YUhrR/ii5K6/+E2321hlTETVDidjiFx9Ca
 buPKyC+DMBstRyxhcLxgXVU/CjUMjGBldv7eEnHvnw3lgZ6tmzSjQvD2p0fu9HBJ6RTbAPii5
 iw93R1vqnLRx/ZSE7MscfZ0Z9hkKaH017lNpbxy1jGnx/2vc6YCFXPH0Vqpv5ji3rukFeNiCP
 d2SljUp0S6gHwgEoaWpK45Xu8eBz5XN551cTIL7q/NOIZS6aJeHNojzKfnEOElmaBOH8p2sQ+
 8J7AIaQOTLzIMw=
Subject: [Buildroot] [PATCH v1] package/qt5location: fix musl compile
 (pthread_getname_np)
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
Cc: Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

LSBwdGhyZWFkX2dldG5hbWVfbnAgbm90IGF2YWlsYWJsZSB3aXRoIG11c2wgbGliYywgYWRkIHBh
dGNoIHRvIGRpc2FibGUKICB1c2FnZSBmb3IgbXVzbCAocGF0Y2ggaW5zcGlyZWQvcG9ydGVkIGZy
b20gWzFdKQoKRml4ZXM6CgogIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3Vs
dHMvZWQzNzJhNGE4ZTUwZDllMjBiZTU4OWVlZGE0MGM5Mjg4OGQ3MDliYwoKICBwbGF0Zm9ybS9k
ZWZhdWx0L3RocmVhZC5jcHA6IEluIGZ1bmN0aW9uIOKAmHN0ZDo6c3RyaW5nIG1iZ2w6OnBsYXRm
b3JtOjpnZXRDdXJyZW50VGhyZWFkTmFtZSgp4oCZOgogIHBsYXRmb3JtL2RlZmF1bHQvdGhyZWFk
LmNwcDoxNDo1OiBlcnJvcjog4oCYcHRocmVhZF9nZXRuYW1lX25w4oCZIHdhcyBub3QgZGVjbGFy
ZWQgaW4gdGhpcyBzY29wZTsgZGlkIHlvdSBtZWFuIOKAmHB0aHJlYWRfc2V0bmFtZV9ucOKAmT8K
ICAgICAxNCB8ICAgICBwdGhyZWFkX2dldG5hbWVfbnAocHRocmVhZF9zZWxmKCksIG5hbWUsIHNp
emVvZihuYW1lKSk7CiAgICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgICAgfCAg
ICAgcHRocmVhZF9zZXRuYW1lX25wCgogICAgWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS92b2lkLWxp
bnV4L3ZvaWQtcGFja2FnZXMvYmxvYi9lNjRkZDY3ZjQzYzQwOWQyYjJkYjA4MjE0MDg0ZTg0MmQ5
MmFkNjIwL3NyY3BrZ3MvcXQ1L3BhdGNoZXMvMDAxNC1tdXNsLXNldF90aHJlYWRfbmFtZV9ucC5w
YXRjaAoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0Pgot
LS0KIC4uLmdsLW5hdGl2ZS1maXgtbXVzbC1jb21waWxlLXB0aHJlYWRfZy5wYXRjaCB8IDQ1ICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1bG9jYXRpb24vMDAwMS0zcmRwYXJ0eS1tYXBi
b3gtZ2wtbmF0aXZlLWZpeC1tdXNsLWNvbXBpbGUtcHRocmVhZF9nLnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9xdDUvcXQ1bG9jYXRpb24vMDAwMS0zcmRwYXJ0eS1tYXBib3gtZ2wtbmF0aXZl
LWZpeC1tdXNsLWNvbXBpbGUtcHRocmVhZF9nLnBhdGNoIGIvcGFja2FnZS9xdDUvcXQ1bG9jYXRp
b24vMDAwMS0zcmRwYXJ0eS1tYXBib3gtZ2wtbmF0aXZlLWZpeC1tdXNsLWNvbXBpbGUtcHRocmVh
ZF9nLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmY4M2FhMWIz
YTYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3F0NS9xdDVsb2NhdGlvbi8wMDAxLTNyZHBh
cnR5LW1hcGJveC1nbC1uYXRpdmUtZml4LW11c2wtY29tcGlsZS1wdGhyZWFkX2cucGF0Y2gKQEAg
LTAsMCArMSw0NSBAQAorRnJvbSBhY2Y3NTI3NTdlZTRiZjI5MTMyODllZTExNDJmNDk2OGZkYjIy
YTRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJl
cG9ydEBnbXgubmV0PgorRGF0ZTogV2VkLCAxNSBTZXAgMjAyMSAyMzowNTo1MiArMDIwMAorU3Vi
amVjdDogW1BBVENIXSAzcmRwYXJ0eTogbWFwYm94LWdsLW5hdGl2ZTogZml4IG11c2wgY29tcGls
ZQorIChwdGhyZWFkX2dldG5hbWVfbnApCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4
Yml0CisKKy0gcHRocmVhZF9nZXRuYW1lX25wIG5vdCBhdmFpbGFibGUgd2l0aCBtdXNsIGxpYmMg
KHBhdGNoIGluc3BpcmVkL3BvcnRlZAorICBmcm9tIFsxXSkKKworRml4ZXM6CisKKyAgcGxhdGZv
cm0vZGVmYXVsdC90aHJlYWQuY3BwOiBJbiBmdW5jdGlvbiDigJhzdGQ6OnN0cmluZyBtYmdsOjpw
bGF0Zm9ybTo6Z2V0Q3VycmVudFRocmVhZE5hbWUoKeKAmToKKyAgcGxhdGZvcm0vZGVmYXVsdC90
aHJlYWQuY3BwOjE0OjU6IGVycm9yOiDigJhwdGhyZWFkX2dldG5hbWVfbnDigJkgd2FzIG5vdCBk
ZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1lYW4g4oCYcHRocmVhZF9zZXRuYW1lX25w
4oCZPworICAgICAxNCB8ICAgICBwdGhyZWFkX2dldG5hbWVfbnAocHRocmVhZF9zZWxmKCksIG5h
bWUsIHNpemVvZihuYW1lKSk7CisgICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgorICAg
ICAgICB8ICAgICBwdGhyZWFkX3NldG5hbWVfbnAKKworWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS92
b2lkLWxpbnV4L3ZvaWQtcGFja2FnZXMvYmxvYi9lNjRkZDY3ZjQzYzQwOWQyYjJkYjA4MjE0MDg0
ZTg0MmQ5MmFkNjIwL3NyY3BrZ3MvcXQ1L3BhdGNoZXMvMDAxNC1tdXNsLXNldF90aHJlYWRfbmFt
ZV9ucC5wYXRjaAorCitTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdt
eC5uZXQ+CistLS0KKyBzcmMvM3JkcGFydHkvbWFwYm94LWdsLW5hdGl2ZS9wbGF0Zm9ybS9kZWZh
dWx0L3RocmVhZC5jcHAgfCAzICsrLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL3NyYy8zcmRwYXJ0eS9tYXBib3gtZ2wtbmF0
aXZlL3BsYXRmb3JtL2RlZmF1bHQvdGhyZWFkLmNwcCBiL3NyYy8zcmRwYXJ0eS9tYXBib3gtZ2wt
bmF0aXZlL3BsYXRmb3JtL2RlZmF1bHQvdGhyZWFkLmNwcAoraW5kZXggYzdjNzliNC4uM2YxMzVl
YiAxMDA2NDQKKy0tLSBhL3NyYy8zcmRwYXJ0eS9tYXBib3gtZ2wtbmF0aXZlL3BsYXRmb3JtL2Rl
ZmF1bHQvdGhyZWFkLmNwcAorKysrIGIvc3JjLzNyZHBhcnR5L21hcGJveC1nbC1uYXRpdmUvcGxh
dGZvcm0vZGVmYXVsdC90aHJlYWQuY3BwCitAQCAtMTEsOCArMTEsOSBAQCBuYW1lc3BhY2UgcGxh
dGZvcm0geworIAorIHN0ZDo6c3RyaW5nIGdldEN1cnJlbnRUaHJlYWROYW1lKCkgeworICAgICBj
aGFyIG5hbWVbMzJdID0gInVua25vd24iOworKyNpZiBkZWZpbmVkKF9fR0xJQkNfXykKKyAgICAg
cHRocmVhZF9nZXRuYW1lX25wKHB0aHJlYWRfc2VsZigpLCBuYW1lLCBzaXplb2YobmFtZSkpOwor
LQorKyNlbmRpZgorICAgICByZXR1cm4gbmFtZTsKKyB9CisgCistLSAKKzIuMzMuMAorCi0tIAoy
LjMzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
