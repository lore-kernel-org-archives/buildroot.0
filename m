Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B42C4320A
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 10:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 213D660FD7
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 10:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 213D660FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B2040538;
	Thu, 12 Aug 2021 10:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20pxTOkuju_d; Thu, 12 Aug 2021 10:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D680040584;
	Thu, 12 Aug 2021 10:53:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6B51BF3C9
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 10:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BFF760B7D
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 10:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zBbzh81nZ-G for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 10:53:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DAE1606F3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 10:53:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id m17so6171311ljp.7
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 03:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mDzJ7++NLy7IYV5HWXqagaDLPXuouhQtw/hlxfIl09o=;
 b=FDEUS8Hq6xAOXif+hLGz/ugget39vtGRiYR1lJvigzxQIgeELVmapSfYLvtlC2RsH9
 pXGPw9EDckRe3kJPHLbtnan8mli0D4Lgcs7UDaSib0eCikq+Qxn1x3o+ZclVsVUoHgJw
 3IoU737lyfhchc3MAh+/411Hzc8z7cCInRSWTYI/JbI6OrVhwOh848MwbYnekVQcivCq
 eJe3tyFt3v4r/A1BU0Iy7WeMqHqLdOwGun3JsKHe9pb8ykslbjuOk9I8Rg+qQleVtlE8
 ikW7mtz00HaQUHK+AbsqsJkSAW+2xG47VR3cbOr+LMIkfEiYs0Ce746ju2DEzf9tn5lB
 FJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mDzJ7++NLy7IYV5HWXqagaDLPXuouhQtw/hlxfIl09o=;
 b=oMY38h2MZDyn1/5AJ8Rs5r0AE7jh8nPYOLKeL66atOsdGlcJ+aI5QZiI1RRrTlH2m0
 lDzknv/R+eBJqAUy3XpevH6SZ68AbWHqsKqrIfg4hBzCo/vlUuobxpPsjd72iSmSrgV0
 Ln+KYZU6dE9XvBmTt1JrYDrvgq7dcSjYWJ4yBB+sBk0cP8Qg4pyN0Dt4ulhL6smTYpjR
 oM9boOQLSPys9M+WJN5YeLPPkSk6tYl3B9fCK/QFhjo/AqOim5xbrzxGCFFzMzzHaPbm
 l88Z3Qo+nGe4XdDR50//t/XXaL0+b1fYaoZEuuiLtYzMp+4tu6zWrSCH1NE/SK3YXzb4
 9BRA==
X-Gm-Message-State: AOAM530I567vH8xCsMh6ybq/5C6Cqm+k4/Pzx6HDcKc5xjyxGHovrzor
 x9sOGVrDSvCBOA0Zae352TEB2aBJ1rmxig==
X-Google-Smtp-Source: ABdhPJz4FNJaih7ucxwCARjZ8yiMGMwxY8H/ZMqmd+YI81GJnsojJXNAv0GE/tqigpaUjOVvnC6aZA==
X-Received: by 2002:a2e:b172:: with SMTP id a18mr1521359ljm.403.1628765581291; 
 Thu, 12 Aug 2021 03:53:01 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id f34sm227554lfv.22.2021.08.12.03.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:53:00 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 12:52:58 +0200
Message-Id: <20210812105258.21582-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/broadcom: add support for BCM4908
 platform devices
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQkNNNDkwOCBpcyBCcm9h
ZGNvbSdzIDY0LWJpdCBwbGF0Zm9ybSB3aXRoIEJyb2FkY29tJ3Mgb3duIEJyYWhtYS1CNTMKQ1BV
KHMpLiBJdCdzIG1vc3RseSB1c2VkIGZvciBob21lIHJvdXRlcnMuCgpLZXJuZWwgY29uZmlnIGlz
IGEgbWluaW1hbCBzZXR1cCByZXF1aXJlZCB0byBzdXBwb3J0IG9uLVNvQyBibG9ja3MgbGlrZQpO
QU5EIGNvbnRyb2xsZXIsIEV0aGVybmV0LCBzd2l0Y2gsIFVTQi4KClRvIG1ha2Uga2VybmVscyA1
LjEyKyBib290IHRob3NlIGJvYXJkcyByZXF1aXJlIGEgaGFja3kgcGF0Y2ggbW9kaWZ5aW5nCmh5
cC1zdHViLlMuIFRoYXQgYm9vdGluZyBwcm9ibGVtIHdpbGwgaG9wZWZ1bGx5IGdldCBmaXhlcyBv
biBkYXkgaW4KdXBzdHJlYW0ga2VybmVsIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnF
gmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQogYm9hcmQvYnJvYWRjb20vYmNtNDkwOC9saW51
eC5jb25maWcgICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKwogLi4uLzAwMDEtYXJt
NjQtZG9uLXQtaXNzdWUtSFZDLW9uLWJvb3QucGF0Y2ggIHwgMzIgKysrKysrKysrKysrKysKIGNv
bmZpZ3MvYnJvYWRjb21fYmNtNDkwOF9kZWZjb25maWcgICAgICAgICAgICB8IDEyICsrKysrKwog
MyBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvYnJvYWRjb20vYmNtNDkwOC9saW51eC5jb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2Fy
ZC9icm9hZGNvbS9iY200OTA4L3BhdGNoZXMvbGludXgvMDAwMS1hcm02NC1kb24tdC1pc3N1ZS1I
VkMtb24tYm9vdC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvYnJvYWRjb21fYmNt
NDkwOF9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ib2FyZC9icm9hZGNvbS9iY200OTA4L2xpbnV4
LmNvbmZpZyBiL2JvYXJkL2Jyb2FkY29tL2JjbTQ5MDgvbGludXguY29uZmlnCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjI4ZDdjMzkKLS0tIC9kZXYvbnVsbAorKysgYi9ib2Fy
ZC9icm9hZGNvbS9iY200OTA4L2xpbnV4LmNvbmZpZwpAQCAtMCwwICsxLDQyIEBACitDT05GSUdf
QkxLX0RFVl9JTklUUkQ9eQorQ09ORklHX0lOSVRSQU1GU19TT1VSQ0U9IiR7QlJfQklOQVJJRVNf
RElSfS9yb290ZnMuY3BpbyIKK0NPTkZJR19BUkNIX0JDTTQ5MDg9eQorQ09ORklHX05SX0NQVVM9
NAorQ09ORklHX0NNRExJTkU9ImVhcmx5Y29uPWJjbTYzeHhfdWFydCwweGZmODAwNjQwIGNvbnNv
bGU9dHR5UzAsMTE1MjAwIgorQ09ORklHX0NNRExJTkVfRk9SQ0U9eQorIyBDT05GSUdfR0NDX1BM
VUdJTlMgaXMgbm90IHNldAorQ09ORklHX05FVD15CitDT05GSUdfUEFDS0VUPXkKK0NPTkZJR19V
TklYPXkKK0NPTkZJR19JTkVUPXkKK0NPTkZJR19CUklER0U9eQorQ09ORklHX0JSSURHRV9WTEFO
X0ZJTFRFUklORz15CitDT05GSUdfTkVUX0RTQT15CitDT05GSUdfVkxBTl84MDIxUT15CitDT05G
SUdfUENJPXkKK0NPTkZJR19QQ0lFUE9SVEJVUz15CitDT05GSUdfUENJRV9CUkNNU1RCPXkKK0NP
TkZJR19ERVZUTVBGUz15CitDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQorQ09ORklHX01URD15CitD
T05GSUdfTVREX1JBV19OQU5EPXkKK0NPTkZJR19NVERfTkFORF9CUkNNTkFORD15CitDT05GSUdf
TkVUREVWSUNFUz15CitDT05GSUdfTkVUX0RTQV9CQ01fU0YyPXkKK0NPTkZJR19TRVJJQUxfQkNN
NjNYWD15CitDT05GSUdfU0VSSUFMX0JDTTYzWFhfQ09OU09MRT15CitDT05GSUdfSTJDPXkKK0NP
TkZJR19JMkNfQ0hBUkRFVj15CitDT05GSUdfSTJDX1NMQVZFPXkKK0NPTkZJR19TUEk9eQorQ09O
RklHX1BJTkNUUkw9eQorQ09ORklHX1BPV0VSX1JFU0VUX1NZU0NPTj15CitDT05GSUdfVEhFUk1B
TD15CitDT05GSUdfVVNCPXkKK0NPTkZJR19VU0JfWEhDSV9IQ0Q9eQorQ09ORklHX1VTQl9YSENJ
X1BMQVRGT1JNPXkKK0NPTkZJR19VU0JfRUhDSV9IQ0Q9eQorQ09ORklHX1VTQl9FSENJX0hDRF9Q
TEFURk9STT15CitDT05GSUdfVVNCX09IQ0lfSENEPXkKK0NPTkZJR19VU0JfT0hDSV9IQ0RfUExB
VEZPUk09eQorQ09ORklHX1JFU0VUX0NPTlRST0xMRVI9eQpkaWZmIC0tZ2l0IGEvYm9hcmQvYnJv
YWRjb20vYmNtNDkwOC9wYXRjaGVzL2xpbnV4LzAwMDEtYXJtNjQtZG9uLXQtaXNzdWUtSFZDLW9u
LWJvb3QucGF0Y2ggYi9ib2FyZC9icm9hZGNvbS9iY200OTA4L3BhdGNoZXMvbGludXgvMDAwMS1h
cm02NC1kb24tdC1pc3N1ZS1IVkMtb24tYm9vdC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwLi4zMmUyYjYzCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYnJvYWRjb20v
YmNtNDkwOC9wYXRjaGVzL2xpbnV4LzAwMDEtYXJtNjQtZG9uLXQtaXNzdWUtSFZDLW9uLWJvb3Qu
cGF0Y2gKQEAgLTAsMCArMSwzMiBAQAorRnJvbTogPT9VVEYtOD9xP1JhZmE9QzU9ODI9MjBNaT1D
NT04MmVja2k/PSA8cmFmYWxAbWlsZWNraS5wbD4KK0RhdGU6IFRodSwgMTIgQXVnIDIwMjEgMTE6
NTI6NDIgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gYXJtNjQ6IGRvbid0IGlzc3VlIEhWQyBvbiBi
b290CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0Jyb2FkY29tJ3MgQ0ZF
IGxvYWRlciBzZWVtcyB0byBtaXNzIHNldHRpbmcgU0NSX0VMMy5IQ0Ugd2hpY2ggcmVzdWx0cyBp
bgorZ2VuZXJhdGluZyBhbiBVTkRFRiBhbmQga2VybmVsIHBhbmljIG9uIHRoZSBmaXJzdCBIVkMu
CisKK0hWQyBnZXRzIGlzc3VlZCBieSBrZXJuZWxzIDUuMTIrIHdoaWxlIGJvb3RpbmcsIGJ5IGtl
eGVjIGFuZCBLVk0uIFVudGlsCitzb21lb25lIGZpbmRzIGEgd29ya2Fyb3VuZCB3ZSBoYXZlIHRv
IGF2b2lkIGFsbCBhYm92ZS4KKworV29ya2Fyb3VuZHM6IDBjOTNkZjk2MjJkNCAoImFybTY0OiBJ
bml0aWFsaXNlIGFzIG5WSEUgYmVmb3JlIHN3aXRjaGluZyB0byBWSEUiKQorU2lnbmVkLW9mZi1i
eTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorLS0tCisgYXJjaC9hcm02NC9r
ZXJuZWwvaHlwLXN0dWIuUyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL2h5cC1zdHVi
LlMgYi9hcmNoL2FybTY0L2tlcm5lbC9oeXAtc3R1Yi5TCitpbmRleCA0M2QyMTI2MTguLmZjOTVi
MTAzZSAxMDA2NDQKKy0tLSBhL2FyY2gvYXJtNjQva2VybmVsL2h5cC1zdHViLlMKKysrKyBiL2Fy
Y2gvYXJtNjQva2VybmVsL2h5cC1zdHViLlMKK0BAIC0yMzgsNyArMjM4LDcgQEAgU1lNX0ZVTkNf
U1RBUlQoc3dpdGNoX3RvX3ZoZSkKKyAKKyAJLy8gVHVybiB0aGUgd29ybGQgdXBzaWRlIGRvd24K
KyAJbW92CXgwLCAjSFZDX1ZIRV9SRVNUQVJUCistCWh2YwkjMAorKy8vCWh2YwkjMAorIDE6Cisg
CXJldAorIFNZTV9GVU5DX0VORChzd2l0Y2hfdG9fdmhlKQpkaWZmIC0tZ2l0IGEvY29uZmlncy9i
cm9hZGNvbV9iY200OTA4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYnJvYWRjb21fYmNtNDkwOF9kZWZj
b25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uYzYzMTBkZQotLS0gL2Rl
di9udWxsCisrKyBiL2NvbmZpZ3MvYnJvYWRjb21fYmNtNDkwOF9kZWZjb25maWcKQEAgLTAsMCAr
MSwxMiBAQAorQlIyX2FhcmNoNjQ9eQorQlIyX0xJTlVYX0tFUk5FTD15CitCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9IjUuMTMuOSIKK0JSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQorQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL2Jyb2FkY29tL2JjbTQ5MDgvbGlu
dXguY29uZmlnIgorQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VS
TkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtNDkwOC9iY200OTA2LW5ldGdlYXItcjgw
MDBwIGJyb2FkY29tL2JjbTQ5MDgvYmNtNDkwNi10cGxpbmstYXJjaGVyLWMyMzAwLXYxIGJyb2Fk
Y29tL2JjbTQ5MDgvYmNtNDkwOC1hc3VzLWd0LWFjNTMwMCIKK0JSMl9QQUNLQUdFX0xJTlVYX0ZJ
Uk1XQVJFPXkKK0JSMl9QQUNLQUdFX0JSSURHRV9VVElMUz15CitCUjJfVEFSR0VUX1JPT1RGU19J
TklUUkFNRlM9eQorIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAotLSAKMi4yNi4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
