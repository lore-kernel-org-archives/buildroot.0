Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEF7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 17:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888946332F
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 17:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 888946332F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3537F828BA;
	Mon, 20 Sep 2021 17:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiPmymih1xcZ; Mon, 20 Sep 2021 17:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6435482572;
	Mon, 20 Sep 2021 17:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF7621BF859
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 17:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF801403BA
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 17:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gq14VSK2ZOUi for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 17:30:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5B5140407
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 17:30:21 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g14so16966933pfm.1
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cvqhj8ybjrUkvSYS22MFcsfHC+SqhCr3tc7o5fxgbWM=;
 b=AxWfv9YmwE4G5H7BFijw+HBR7naq4lWiZ8rnAXbV0vVkvjTKuBQCzcRKLYVI9CP5wp
 g6WpQ1sI+bL+uNh8TevTWBVp5WunR/GivsLqrnCyxr737wmNIh16DcCVT4jLkBmgiKrz
 wQRdSdho/OXZ4FdDW+PxTumPEVgwMNRkX9V1yD7zViiBWRPXZRvfMboZhHkIUOQM4tnZ
 SQhTpnUSMPdH/wJCPITudAHp6JB1cIjyizWGfMB/QNnjJL6n+COWPuCUN81OWHTeHeP4
 TnBBLR3XDfvX9ThjtdCoyL0RVp6spE0XoKDIBe7g7r+rR/w1e+8r0ffiqsbLHf2byz6Z
 6nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cvqhj8ybjrUkvSYS22MFcsfHC+SqhCr3tc7o5fxgbWM=;
 b=7GMkuqE0E6qxIGeO+iTzIEVqlKF4dkupBVO/U+To7x5JFOK3jBY/AohRfG4EtsyJ8Q
 cqJBqWUQzPtwecDMp31CfUUjzO/OrNG7RlHmnYtoSRA2nhxkgZyOJcx6dw/3+DmSjd+K
 jWYALOY+tPG+Ty/KrdAt2JPe5h1L0xYTcf1dluWdC6AV44K4zG99Psu/nh+H1OyZgTZu
 HKZZiuYlhWYX84RIsxdKmd6Ct+LyFK2m3+LYjoAhwXPo1fWJ7/VFOSsSwQci1k3j0GYs
 U7qujv89HaSuqa7VCe+ODNnrAryKKhPmuHoAQdtzT5lu5AY3vxVLT+pB8zH47knON5Mi
 KvhQ==
X-Gm-Message-State: AOAM533EgnmyyEq6kqp2FpEQPaB6PMuKFx+IPVVyv6hdX+UddK8OJuZs
 ZTVLhG4uv6FYHVLu1BGPnhrDYGr9P8cmew==
X-Google-Smtp-Source: ABdhPJxYgH8eHTuXekMMX9+YIJvS8ypwx/DhsIsKNGSD6ox0WCVryJq26zLcOcayqyGF1I7QOc4UXQ==
X-Received: by 2002:a63:651:: with SMTP id 78mr24506828pgg.306.1632159020878; 
 Mon, 20 Sep 2021 10:30:20 -0700 (PDT)
Received: from adam.. ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm75870pjb.39.2021.09.20.10.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:30:20 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 10:30:17 -0700
Message-Id: <20210920173017.695537-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/libglib2: bump version to 2.68.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

U2lnbmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+Ci0tLQpDaGFu
Z2VzIFYxIC0+IFYyOgogIC0gUmVmYWN0b3IgYWdhaW5zdCBtYXN0ZXIgYnJhbmNoIGluc3RlYWQg
b2YgbmV4dC4KCiAuLi4vMDAwMi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoICAgICAgICAg
fCAgMiArLQogLi4udGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoIHwg
MzMgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoICAg
ICAgICAgICAgICAgIHwgIDQgKy0tCiBwYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDM3
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZ2xpYjIvMDAwNC1j
b3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2gKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYmdsaWIyLzAwMDItcmVtb3ZlLWNwcC1yZXF1aXJlbWVudC5wYXRjaCBi
L3BhY2thZ2UvbGliZ2xpYjIvMDAwMi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoCmluZGV4
IDkzOTNiZDI1OGEuLmM0MDJjYmFmYTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliZ2xpYjIvMDAw
Mi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoCisrKyBiL3BhY2thZ2UvbGliZ2xpYjIvMDAw
Mi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoCkBAIC0zNSw3ICszNSw3IEBAIGluZGV4IDRi
YmY0YzIuLmFjNTlmNGUgMTAwNjQ0CiBAQCAtMSw0ICsxLDQgQEAKIC1wcm9qZWN0KCdnbGliJywg
J2MnLCAnY3BwJywKICtwcm9qZWN0KCdnbGliJywgJ2MnLAotICAgdmVyc2lvbiA6ICcyLjY4LjIn
LAorICAgdmVyc2lvbiA6ICcyLjY4LjQnLAogICAgIyBOT1RFOiBXZSBrZWVwIHRoaXMgcGlubmVk
IGF0IDAuNDkgYmVjYXVzZSB0aGF0J3Mgd2hhdCBEZWJpYW4gMTAgc2hpcHMKICAgIG1lc29uX3Zl
cnNpb24gOiAnPj0gMC40OS4yJywKIEBAIC0xMCw3ICsxMCw2IEBAIHByb2plY3QoJ2dsaWInLCAn
YycsICdjcHAnLApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi8wMDA0LWNvcnJlY3RseS11
c2UtMy1wYXJhbWV0ZXJzLWZvci1jbG9zZV9yYW5nZS5wYXRjaCBiL3BhY2thZ2UvbGliZ2xpYjIv
MDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGJmY2E0YjE0ZWYuLjAwMDAwMDAwMDAKLS0tIGEv
cGFja2FnZS9saWJnbGliMi8wMDA0LWNvcnJlY3RseS11c2UtMy1wYXJhbWV0ZXJzLWZvci1jbG9z
ZV9yYW5nZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMzICswLDAgQEAKLUZyb20gYjcxMTE3
ZDg5NDM0ZGI4M2QzNGJjMWI5ODFjYTAzZDRiZTI5OTU3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBUaHUsIDggSnVs
IDIwMjEgMTc6MjY6NDMgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gY29ycmVjdGx5IHVzZSAzIHBh
cmFtZXRlcnMgZm9yIGNsb3NlX3JhbmdlCi0KLWxpYmMgaW1wbGVtZW50YXRpb24gaGFzIDMgcGFy
YW1ldGVyIGUuZy4KLWh0dHBzOi8vd3d3LmZyZWVic2Qub3JnL2NnaS9tYW4uY2dpP3F1ZXJ5PWNs
b3NlX3JhbmdlJnNla3Rpb249MiZmb3JtYXQ9aHRtbAotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgotCi1bUmV0cmlldmVkIGZyb206Ci1odHRwczovL2dpdGxh
Yi5nbm9tZS5vcmcvR05PTUUvZ2xpYi8tL2NvbW1pdC9iNzExMTdkODk0MzRkYjgzZDM0YmMxYjk4
MWNhMDNkNGJlMjk5NTc2XQotU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLS0KLSBnbGliL2dzcGF3bi5jIHwgMiArLQotIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEv
Z2xpYi9nc3Bhd24uYyBiL2dsaWIvZ3NwYXduLmMKLWluZGV4IDg5OTY0N2MyZi4uMzA3M2ExMGE0
IDEwMDY0NAotLS0tIGEvZ2xpYi9nc3Bhd24uYwotKysrIGIvZ2xpYi9nc3Bhd24uYwotQEAgLTE1
MjAsNyArMTUyMCw3IEBAIHNhZmVfY2xvc2Vmcm9tIChpbnQgbG93ZmQpCi0gICAgKgotICAgICog
SGFuZGxlIEVOT1NZUyBpbiBjYXNlIGl04oCZcyBzdXBwb3J0ZWQgaW4gbGliYyBidXQgbm90IHRo
ZSBrZXJuZWw7IGlmIHNvLAotICAgICogZmFsbCBiYWNrIHRvIHNhZmVfZmR3YWxrKCkuICovCi0t
ICBpZiAoY2xvc2VfcmFuZ2UgKGxvd2ZkLCBHX01BWFVJTlQpICE9IDAgJiYgZXJybm8gPT0gRU5P
U1lTKQotKyAgaWYgKGNsb3NlX3JhbmdlIChsb3dmZCwgR19NQVhVSU5ULCAwKSAhPSAwICYmIGVy
cm5vID09IEVOT1NZUykKLSAjZW5kaWYgIC8qIEhBVkVfQ0xPU0VfUkFOR0UgKi8KLSAgICh2b2lk
KSBzYWZlX2Zkd2FsayAoY2xvc2VfZnVuYywgR0lOVF9UT19QT0lOVEVSIChsb3dmZCkpOwotICNl
bmRpZgotLS0gCi1HaXRMYWIKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi9saWJnbGli
Mi5oYXNoIGIvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoCmluZGV4IDE1ZTAwODVmNzgu
LmQ0MjFlMDI1ZmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIuaGFzaAor
KysgYi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIGh0
dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvZ2xpYi8yLjY4L2dsaWItMi42OC4yLnNo
YTI1NnN1bQotc2hhMjU2ICBlY2M3Nzk4YTljYzAzNGVhYmRmZDdmMjQ2ZTZkZDQ2MWNkYmYxMTc1
ZmNjMmU5ODY3Y2M3ZGE3YjczMDllMGZiICBnbGliLTIuNjguMi50YXIueHoKKyMgaHR0cHM6Ly9k
b3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9nbGliLzIuNjgvZ2xpYi0yLjY4LjQuc2hhMjU2c3Vt
CitzaGEyNTYgIDYyZmQwNjFkMDhhNzU0OTI2MTdlNjI1YTczZTJjMDVlMjU5ZjgzMWFjYmI4ZTFm
OGI5YzgxZjIzZjc5OTNhM2IgIGdsaWItMi42OC40LnRhci54egogIyBMaWNlbnNlIGZpbGVzLCBs
b2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3
MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tayBiL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIu
bWsKaW5kZXggNGYxMzYyMmUzNi4uYWY3M2FlYjNiZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJn
bGliMi9saWJnbGliMi5taworKysgYi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCkBAIC01
LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAogTElCR0xJQjJfVkVSU0lPTl9N
QUpPUiA9IDIuNjgKLUxJQkdMSUIyX1ZFUlNJT04gPSAkKExJQkdMSUIyX1ZFUlNJT05fTUFKT1Ip
LjIKK0xJQkdMSUIyX1ZFUlNJT04gPSAkKExJQkdMSUIyX1ZFUlNJT05fTUFKT1IpLjQKIExJQkdM
SUIyX1NPVVJDRSA9IGdsaWItJChMSUJHTElCMl9WRVJTSU9OKS50YXIueHoKIExJQkdMSUIyX1NJ
VEUgPSBodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNlcy9nbGliLyQoTElCR0xJ
QjJfVkVSU0lPTl9NQUpPUikKIExJQkdMSUIyX0xJQ0VOU0UgPSBMR1BMLTIuMSsKLS0gCjIuMzAu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
