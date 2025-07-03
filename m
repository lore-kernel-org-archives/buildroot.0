Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248DDC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 15:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF20D83B3F;
	Thu,  3 Jul 2025 15:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcPtxZF1Yuca; Thu,  3 Jul 2025 15:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0CFD83B35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0CFD83B35;
	Thu,  3 Jul 2025 15:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E40F275
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 15:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA11B40757
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 15:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-HqCfLoIAAh for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 15:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 985784078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 985784078F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 985784078F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 15:00:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so123299f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 08:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751554807; x=1752159607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vS0mER5ursr0rQrmKoRoO2JpRER0OYwpGMvwvtB31To=;
 b=fElY+9ZnwunjJpiVi+yY2WizQmkne3Oewj2rVy/u+ZJikaP4NmyCD/ZH6M52DfxrkH
 89eqzkHXvYtvEfPYi1rLHlp2KgvwJ+/zvoD3AAK+1Y3GO9Z1boyoGPakNKJSrsWn7ZCo
 24fTu3Xj5q1RD7qjRYsOa+r/69K7kFriqpvDN6fFLupeHp1rd+H7PkJsKPf3AMV0vQAS
 u9AR1bFf0obBmE33NiCRTCNmg8rjMaTS955YM55Qikk3HXgFPDL4tyhmW+vOVnYXEcET
 Quo611bM7mpVR1dkLgC6CXU/URG+ElXDyS92+PSyc8ZA8sG76fAfnVhSgoIbbjzCtNpa
 Pluw==
X-Gm-Message-State: AOJu0YyqlYV/+JJxO/olCaDJoNfGKGREyA8VVENAkzOY5yDZ11n6Fj9Q
 D0mYW3BuGtr7ywHha/aA6Lz0uyp4ITHui2pJkoeZ79EMKyY7zY64nWJNB5j2G2d8OM/qmm3R2kF
 w88ST
X-Gm-Gg: ASbGncuOdnGdfpCT7oaqbN38KPmy6teqw6g+lx1DV/Tl9TfNKUkRcj13IwPBo57FKYt
 9OpwWmyTjU+3NaVNxV4j29R8v3BcbBYOfnDWIW9qDAPJgbHHte+BG9uw6reLrNQY0ZZQMMKWzhV
 2Z47ebmlJh7EQJyYEW7pE0w0WJN7iSYHpeTT4u3KmQpTkuEz0eGTY2VF6Bwc0eiOUvdCI0gwau/
 0eGIgjnnZok+eK+VbjvoknM+wjN72ZTJMT4m4EPJF8iijgOhziSLcGzJ+0BmkdEu7q83rBdvhZ8
 8gogk8kOitES+0B9YgNB8IcjHseBx1xspQvWoG+v5wqHynyzHK1MIrMusDLKenvwoaV7PR6+LMt
 /6fcDvK+czF1HlZOpxBRuA2klvA/e/d6Gy62dcqHWgtp8xHE0YNfCO1vy
X-Google-Smtp-Source: AGHT+IFtVyWrxQV8X9rh3CDKR2iVEL8l7uPGo4V6+ahyzUJojicd1gLsdnMYdGUkGNSCIBPnRGOThA==
X-Received: by 2002:a05:6000:2d07:b0:3a4:ffec:ee8e with SMTP id
 ffacd0b85a97d-3b2001ac8a8mr4174409f8f.36.1751554807210; 
 Thu, 03 Jul 2025 08:00:07 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030bd4dsm32581f8f.7.2025.07.03.08.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 08:00:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Knight <git@jdknight.me>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu,  3 Jul 2025 16:59:55 +0200
Message-ID: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751554807; x=1752159607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vS0mER5ursr0rQrmKoRoO2JpRER0OYwpGMvwvtB31To=;
 b=G6U7ULdVhzfJ2KryWeXWURRQT1DvCVxiaNHA/SvX/A9kiNsUBQTTUTuAM4PPCL9ZyN
 lCmRHqiG5qJVbkc0paqxTVd/3S7yNnQ7G7cgNt/qlaAFJBQTE2IN9x17p2MJzZjN/4Bf
 KlF+wiyiQUxqW586GvAGiz7SWbDpdPWJbYwR0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=G6U7ULdV
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: fix gcc-install-dir
 in clang
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHByZXZpb3VzIG1ldGhvZCB1c2VkIHRvIGRldGVybWluZSB0aGUgLS1nY2MtaW5zdGFsbC1k
aXIgcmVsaWVkIG9uCidscycgb3ZlciB0aGUgZ2NjIGluc3RhbGxhdGlvbiBwYXRoLCB3aGljaCB3
YXMgZnJhZ2lsZSBhbmQgZmFpbGVkIGluCmNhc2VzIHdoZXJlIHRoZSBleHRlcm5hbCB0b29sY2hh
aW4gY29udGFpbmVkIG11bHRpcGxlIGdjYyB2ZXJzaW9ucyBvcgpwYXRocyBbMV0uCgpXZSByZXBs
YWNlIGl0IGEgbW9yZSByZWxpYWJsZSBhcHByb2FjaCB1c2luZzoKJChUQVJHRVRfQ0MpIC1wcmlu
dC1zZWFyY2gtZGlycwoKVGhpcyBoZWxwcyBzZXR1cCB0byByZWdpc3RlciB0aGUgZGVzaXJlZCBH
Q0MgYXJjaGl0ZWN0dXJlIGlmIGEKZ2l2ZW4gdG9vbGNoYWluIHBhY2thZ2VzIGluY2x1ZGVzIG11
bHRpcGxlIEdDQyBhcmNoaXRlY3R1cmUKaW5zdGFsbGF0aW9ucy4gV2hpY2ggaXNuJ3QgcG9zc2li
bGUgdXNpbmcgdGhlIGFjdHVhbCBtZXRob2QgdXNpbmcgJ2xzJy4KCkZvciBleGFtcGxlIGZyb20g
SmFtZXMncyByZXBvcnQ6CgogICAg4pSU4pSA4pSAIC9vcHQvY29udGFpbmVyL215LXRvb2xjaGFp
bi0yMDI1LjAxLjAxLjEyMzQ1L2xpYi9nY2MvCiAgICAgICAg4pSc4pSA4pSAIGFhcmNoNjQtZXhh
bXBsZS1saW51eC1nbnUvCiAgICAgICAg4pSCICAg4pSU4pSA4pSAIC4uLgogICAgICAgIOKUnOKU
gOKUgCBpNjg2LWV4YW1wbGUtbGludXgtZ251LwogICAgICAgIOKUgiAgIOKUlOKUgOKUgCAuLi4K
ICAgICAgICDilJTilIDilIAgeDg2XzY0LWV4YW1wbGUtbGludXgtZ251LwogICAgICAgICAgICDi
lJTilIDilIAgLi4uCgpUaGFua3MgdG8gUm9tYWluIE5hb3VyIGZvciBzdWdnZXN0aW5nIHRoaXMg
aW1wcm92ZWQgbWV0aG9kLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9k
MWM3NzNkYy04MzQ2LTQwNzctOTQ2YS0wZDNiNGUzMGE2YzhAc21pbGUuZnIvVC8jdAoKUmVwb3J0
ZWQgYnk6IEphbWVzIEtuaWdodCA8Z2l0QGpka25pZ2h0Lm1lPgpTaWduZWQtb2ZmLWJ5OiBFbCBN
ZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZyPgotLS0KUm9tYWluIHN1Z2dlc3Rl
ZCB1c2luZyBzZWQsIGJ1dCB3ZSBjaGFuZ2VkIGl0IHRvIGF3ayBmb3IgYmV0dGVyIGNsYXJpdHku
Ci0tLQogcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsgfCAzICstLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rIGIvcGFja2FnZS9sbHZtLXByb2plY3Qv
Y2xhbmcvY2xhbmcubWsKaW5kZXggYTVjOGI5OTBhYS4uMmYxN2EwNGVmYyAxMDA2NDQKLS0tIGEv
cGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKKysrIGIvcGFja2FnZS9sbHZtLXBy
b2plY3QvY2xhbmcvY2xhbmcubWsKQEAgLTExNSw4ICsxMTUsNyBAQCBDTEFOR19DT05GX09QVFMg
Kz0gLURMTFZNX0RZTElCX0NPTVBPTkVOVFM9YWxsCiBpZmVxICgkKEJSMl9UT09MQ0hBSU5fRVhU
RVJOQUwpLHkpCiBkZWZpbmUgSE9TVF9DTEFOR19JTlNUQUxMX0NPTkZJR19GSUxFCiAJbWtkaXIg
LXAgJChIT1NUX0RJUikvbGliL2NsYW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikKLQl0b3VjaCAk
KEhPU1RfRElSKS9saWIvY2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdOVV9UQVJHRVRf
TkFNRSkuY2ZnCi0JZWNobyAiLS1nY2MtaW5zdGFsbC1kaXI9JChUT09MQ0hBSU5fRVhURVJOQUxf
SU5TVEFMTF9ESVIpL2xpYi9nY2MvJCQobHMgJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9E
SVIpL2xpYi9nY2MvKS8kJChscyAkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGli
L2djYy8kJChscyAkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGliL2djYy8pLyki
ID4gJChIT1NUX0RJUikvbGliL2NsYW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikvJChHTlVfVEFS
R0VUX05BTUUpLmNmZworCWVjaG8gIi0tZ2NjLWluc3RhbGwtZGlyPSQkKCQoVEFSR0VUX0NDKSAt
cHJpbnQtc2VhcmNoLWRpcnMgfCBhd2sgLUYgJzogJyAnJCQxPT0iaW5zdGFsbCIge3ByaW50ICQk
Mn0nKSIgPiAkKEhPU1RfRElSKS9saWIvY2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdO
VV9UQVJHRVRfTkFNRSkuY2ZnCiAJZWNobyAiLS10YXJnZXQ9JChHTlVfVEFSR0VUX05BTUUpIiA+
PiAkKEhPU1RfRElSKS9saWIvY2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdOVV9UQVJH
RVRfTkFNRSkuY2ZnCiBlbmRlZgogCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
