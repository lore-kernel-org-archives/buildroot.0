Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E85C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 22:05:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDCFC60EE5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 22:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDCFC60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7B360BF6;
	Sun, 12 Sep 2021 22:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l51X9MMOqxfP; Sun, 12 Sep 2021 22:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B0060788;
	Sun, 12 Sep 2021 22:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45C511BF3EF
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3430C401D6
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 22:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mlT1FrKWva8 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 22:05:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 220BD401C9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 22:05:12 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id q14so8070628ils.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Slgu+av6Ad2nb7C9PZlcLuKLxgZdXI8KKOI2mA+dcM0=;
 b=TDSxkE7XnALNBCqYl0g4T/7UL3RQNFeWix/dWdWig3N9hDJr94HJqhSU4KSvGWgq2y
 279USiZZ6bq4MNXzKkUGnmkjrztGpA4nPuEHCPEz5TkO/15PMIrm4eGXsDGxd+u3UpVJ
 9KvazT4VcrXc3Dl6MdcznKJNpZFtGV2m7Z3gC/x6+40qnDRPbMcFrjxbLeQD6JhpyG7L
 9wHvZZEwun7EVrIGUFK4X8dvnSx35GWdufMaf5J0wMdJTKkCZb5vFmutm4dbFJi3U3g2
 DoTYKN9x39pbGmzu4a4N096tXKIMVapYK000Kcy9KhLyDfWXc8qw7TimCTPq50JX5xfj
 aRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Slgu+av6Ad2nb7C9PZlcLuKLxgZdXI8KKOI2mA+dcM0=;
 b=M3zt42BPAgUA0TzzOP0VRbdpwMoRW0N1lcVrl1AAiBICtmT2PKYxenr1pAB7cyCqLK
 3m5fq9WOu5WEr25ZqKNhAWcBaqiw9EfpYUnTW/DyVmTABCtP38KdBqRz0+PWxj1UlkdZ
 c7fmkge5zUmFc3relm35H0zzAcWXhcnsq7ZmhenrwwDsMM3adIGLloPNKSUHp+bpK5ka
 Vc7S0jZ+ATaR0wq51t7thxewm8GBvhVPS8b852Sk72LWDjBlJpL0k4ggfbp6MirOyEL8
 2DPAP+0jWmaOUZVqLvgpYyTDBmAgFK5EIXbOkDARTCN8WQ8k9mRrROugaW/CvLlPtJiW
 mMuA==
X-Gm-Message-State: AOAM533dXO4obCdN50wRtqMh0JWf+FpC6xYECROAx824xFeE61gko0FD
 8DXpjfCQ3X4VNqqn8ZSaSuz0rJsIdBg=
X-Google-Smtp-Source: ABdhPJzkiwqo425Oo9QyqJjMdlTfgN97Rhxnmov+Ye278vfYxcLQ6r4ikTEA1r8Nl0KCq++sWxe0gg==
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr5837915ilt.278.1631484312024; 
 Sun, 12 Sep 2021 15:05:12 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id o5sm3270731ilk.88.2021.09.12.15.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 15:05:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:04:57 -0600
Message-Id: <20210912220457.1007342-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireplumber: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

U2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Ci0tLQogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS93aXJlcGx1bWJlci9Db25maWcuaW4gICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKwogcGFj
a2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3dpcmVw
bHVtYmVyL3dpcmVwbHVtYmVyLm1rICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
d2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
d2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIubWsKCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5p
biBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IDg5OWI0OTMxODAuLmYyZjgwZGEzZmYgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0xNTM5
LDYgKzE1MzksNyBAQCBtZW51ICJHcmFwaGljcyIKIAlzb3VyY2UgInBhY2thZ2Uvd2F5bGFuZHBw
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbiIKIAlzb3Vy
Y2UgInBhY2thZ2Uvd2VicC9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3dpcmVwbHVtYmVy
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvd2xyb290cy9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3dvZmYyL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvd3BlYmFja2VuZC1m
ZG8vQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4g
Yi9wYWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi42NTI4YTJlMTAyCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS93aXJl
cGx1bWJlci9Db25maWcuaW4KQEAgLTAsMCArMSwyMiBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1dJ
UkVQTFVNQkVSCisJYm9vbCAid2lyZXBsdW1iZXIiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9Q
SVBFV0lSRQorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTFVBXzVfMyB8fCBCUjJfUEFDS0FHRV9M
VUFfNV80CisJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgbGliZ2xpYjIKKwlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBsaWJnbGliMgorCWRlcGVuZHMgb24gQlIyX1VT
RV9NTVUgIyBsaWJnbGliMgorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJHTElCMgorCWhlbHAKKwkg
IFdpcmVQbHVtYmVyIGlzIGEgbW9kdWxhciBzZXNzaW9uIC8gcG9saWN5IG1hbmFnZXIgZm9yCisJ
ICBQaXBlV2lyZSBhbmQgYSBHT2JqZWN0LWJhc2VkIGhpZ2gtbGV2ZWwgbGlicmFyeSB0aGF0CisJ
ICB3cmFwcyBQaXBlV2lyZeKAmXMgQVBJLCBwcm92aWRpbmcgY29udmVuaWVuY2UgZm9yIHdyaXRp
bmcKKwkgIHRoZSBkYWVtb27igJlzIG1vZHVsZXMgYXMgd2VsbCBhcyBleHRlcm5hbCB0b29scyBm
b3IKKwkgIG1hbmFnaW5nIFBpcGVXaXJlLgorCisJICBodHRwczovL3BpcGV3aXJlLnBhZ2VzLmZy
ZWVkZXNrdG9wLm9yZy93aXJlcGx1bWJlci8KKworY29tbWVudCAid2lyZXBsdW1iZXIgbmVlZHMg
YSB0b29sY2hhaW4gdy8gd2NoYXIsIHRocmVhZHMgYW5kIEx1YSA+PSA1LjMiCisJZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9QSVBFV0lSRQorCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKKwlkZXBlbmRz
IG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IFwKKwkJ
KCFCUjJfUEFDS0FHRV9MVUFfNV8zICYmICFCUjJfUEFDS0FHRV9MVUFfNV80KQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoIGIvcGFja2FnZS93aXJlcGx1
bWJlci93aXJlcGx1bWJlci5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLjU2MWZjYzJlNWUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3dpcmVwbHVtYmVyL3dp
cmVwbHVtYmVyLmhhc2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hh
MjU2ICA0MWYxNzRlYWFlNWE2MzBlMTk1MDAxZmRkNTgwOTE4ZmE1MTQzYTcxZWRjZWIwNTBiMzIw
Zjg1YThlNjVlNTNiICB3aXJlcGx1bWJlci0wLjQuMi50YXIuYnoyCitzaGEyNTYgIGZmMmViOWFm
NWIwNWQ5MmFjM2EzOGNmZmNhZDI3NTgyZWY1NTVhMzFmZjE3ODFlMWMxZDRlMDg3Zjc3YzljODEg
IExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIubWsg
Yi9wYWNrYWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjJkYWI2MDQyZWEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rCkBAIC0wLDAgKzEsMzkgQEAKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisjCisjIHdpcmVwbHVtYmVyCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IworCitXSVJFUExVTUJFUl9WRVJTSU9OID0gMC40LjIKK1dJUkVQTFVNQkVSX1NPVVJDRSA9IHdp
cmVwbHVtYmVyLSQoV0lSRVBMVU1CRVJfVkVSU0lPTikudGFyLmJ6MgorV0lSRVBMVU1CRVJfU0lU
RSA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2lyZS93aXJlcGx1bWJlci8t
L2FyY2hpdmUvJChXSVJFUExVTUJFUl9WRVJTSU9OKQorV0lSRVBMVU1CRVJfTElDRU5TRSA9IE1J
VAorV0lSRVBMVU1CRVJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKK1dJUkVQTFVNQkVSX0RFUEVO
REVOQ0lFUyA9IGhvc3QtcGtnY29uZiBkYnVzIHBpcGV3aXJlIGxpYmdsaWIyIGx1YQorCitXSVJF
UExVTUJFUl9DT05GX09QVFMgPSBcCisJLURkb2M9ZGlzYWJsZWQgXAorCS1Ec3lzdGVtLWx1YT10
cnVlIFwKKwktRHN5c3RlbS1sdWEtdmVyc2lvbj0KKworaWZlcSAoJChCUjJfUEFDS0FHRV9HT0JK
RUNUX0lOVFJPU1BFQ1RJT04pLHkpCitXSVJFUExVTUJFUl9ERVBFTkRFTkNJRVMgKz0gZ29iamVj
dC1pbnRyb3NwZWN0aW9uCitXSVJFUExVTUJFUl9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9u
PWVuYWJsZWQKK2Vsc2UKK1dJUkVQTFVNQkVSX0NPTkZfT1BUUyArPSAtRGludHJvc3BlY3Rpb249
ZGlzYWJsZWQKK2VuZGlmCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseSkKK1dJUkVQ
TFVNQkVSX0RFUEVOREVOQ0lFUyArPSBzeXN0ZW1kCitXSVJFUExVTUJFUl9DT05GX09QVFMgKz0g
XAorCS1Ec3lzdGVtZD1lbmFibGVkIFwKKwktRHN5c3RlbWQtc3lzdGVtLXNlcnZpY2U9dHJ1ZSBc
CisJLURzeXN0ZW1kLXVzZXItc2VydmljZT10cnVlCitlbHNlCitXSVJFUExVTUJFUl9DT05GX09Q
VFMgKz0gXAorCS1Ec3lzdGVtZD1kaXNhYmxlZCBcCisJLURzeXN0ZW1kLXN5c3RlbS1zZXJ2aWNl
PWZhbHNlIFwKKwktRHN5c3RlbWQtdXNlci1zZXJ2aWNlPWZhbHNlCitlbmRpZgorCiskKGV2YWwg
JChtZXNvbi1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlz
dHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
