Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F0EC77B7C
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 14:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C1440C34;
	Tue, 24 Jun 2025 14:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdvPLPcPkSSU; Tue, 24 Jun 2025 14:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3386040B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3386040B3C;
	Tue, 24 Jun 2025 14:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9524112C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 14:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 872FA40A7F
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 14:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpVULlh7s-BH for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 14:33:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9871540203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9871540203
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9871540203
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 14:33:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a589d99963so5305879f8f.1
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 07:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750775591; x=1751380391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5cfLkF8nZdKDf8PAJmiCN9dxsKbV2/+EWzeSEGrmcA=;
 b=kD0NOJkzhqLIaIustyuqleYQnpuKbW+xPkwDRYDl3ZqfQyjXug/4MEvlne9K4Um7Ih
 Uy8c1Z2CdnupUg0DTH6xiLa9eI01z5jBwikVcGF8KN3DJbzlnRBGAqnl/RudqVE24RnE
 3j53jouZjdUvAsdB+XooxlVU/saAIwPilkdrUD7etCkWAKwv5KHAhd3dm0H4Saz2xKIZ
 jyhtHke60EqVZ/yCICwkoaegys+MoprnHhMNIkjFCQfgSivaetBUMEzknm6bbK5v1cVh
 Ws9PolnWkBduGsko6NMbyrD0v6rvCaDRo09bg4LGNRSla/Vzk2zwW/fEbLrAtLETM9Y4
 o5oA==
X-Gm-Message-State: AOJu0YzvjbiZaS5e4Kq5aPceJr1qKUOthRzMswhVL81nFwFas/j2Vqxp
 26ptdMUdifChlophgdIjqtifirJ/cp7gXa/2XGFsPsFSKiV+GDMGTMWVGQY3KxOLrvTgkY0f5lV
 iFVyF
X-Gm-Gg: ASbGncvNHTjYGjY+weHghOSEho25KJVSUdlMYZgVLE/8E4e9X0aYozsS3CDr91VnVsh
 J/AuwyK9SGQnM9WfLzcjqK9ZSVDZu7Luu4k5ccZrzeVtj1IHUEoOfHrXfR67vRkWtnnVAE9DTf7
 n68xY0YerwANOlEZQyUeXSoORCG5/wKgsaxL6lPynAsEpXWsCkOnD4y48+yorR2rRaxZFk5ELsU
 +u+M8EAHCpSm3Kh7b68G1eAU//wYcfbmslAX3m+LARWPvKvkm4H16yVa4LecifhNCumjbPI2kOC
 wUEi5KyE8r/kOx/slk2DcPi+i2IKtt7jtz4mAE/XOXLN4Rc2rfK9ZIHZ8S2XQA5zXNN8F6ShCeT
 Tt/9TdcF/ncdu6TF8rf03xEBp4I7NE/Rn615aalGto/M+F7esvj0ZsNQrgXrpnpxsTzYY
X-Google-Smtp-Source: AGHT+IHAr6juewUbFTJ4yTIQgVewRc0c1SfB8PW7M9F53UBMlHiPhmI557aXTJjAkRrD46pBYbGV+g==
X-Received: by 2002:a05:6000:70d:b0:3a4:d6ed:8e2e with SMTP id
 ffacd0b85a97d-3a6d12e5d07mr9616443f8f.41.1750775590714; 
 Tue, 24 Jun 2025 07:33:10 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f2b8fsm2112510f8f.59.2025.06.24.07.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 07:33:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 16:32:34 +0200
Message-ID: <20250624143236.1286191-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750775591; x=1751380391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C5cfLkF8nZdKDf8PAJmiCN9dxsKbV2/+EWzeSEGrmcA=;
 b=ZSEEKk2wLP8HDlV2wbxG6aAAxe7wwbEC1uFptNiQMWl8jdnqsm7cmFezSMqLQOVViZ
 JmldLcCAh8rvntaZAorwtygY+dHdRUEKt7EvaZnCI7NcniV3XsuTf6O3MbsvxrGwV5wz
 I5bW2d+liZ+qiybrEQMESspEJap5uqfA3IDYOQ8Dn3p69ItsTFlnMYnzogHiFMy1ZgqY
 mIUFx2NgHUJEmKDhxS/u01N0duw4f0EmefQynusNhihFEw69VmYeURGM3e4emIncgG5s
 N/1VdEXHt6ah124dc4gmpYQf8G/OcwRkaU3nNVbLA6toz1L8Nx4R/Za3RUwpeCSotwed
 4vhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZSEEKk2w
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.13.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgpodHRwczovL2dpdGh1Yi5jb20vYm90by9zM3RyYW5zZmVyL2Jsb2IvMC4xMy4w
L0NIQU5HRUxPRy5yc3QKClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVs
Lm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1z
M3RyYW5zZmVyLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9u
LXMzdHJhbnNmZXIubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zl
ci9weXRob24tczN0cmFuc2Zlci5oYXNoIGIvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRo
b24tczN0cmFuc2Zlci5oYXNoCmluZGV4IDk4YjBkZGM1MDYuLjMyNDk5NzNkNDYgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIuaGFzaAorKysg
Yi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVyLmhhc2gKQEAgLTEs
NSArMSw1IEBACiAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3MzdHJh
bnNmZXIvanNvbgotbWQ1ICAwZTdiYmMxN2EyNTU1NjhjOTNhZWE5ZGQ1MmNiOWQ0YiAgczN0cmFu
c2Zlci0wLjExLjQudGFyLmd6Ci1zaGEyNTYgIDU1OWYxNjE2NThlMWNmMGE5MTFmNDU5NDA1NTJj
Njk2NzM1ZjVjNzRlNjQzNjJlNTE1ZjMzM2ViZWQ4N2Q2NzkgIHMzdHJhbnNmZXItMC4xMS40LnRh
ci5negorbWQ1ICBjYTUzZjdhN2JmMDgxNDFmZmI3MmFhNzIxZDFmNmQwMiAgczN0cmFuc2Zlci0w
LjEzLjAudGFyLmd6CitzaGEyNTYgIGY1ZTZkYjc0ZWI3Nzc2YTM3MjA4MDAxMTEzZWE3YWE5NzY5
NTM2ODI0MmIzNjRkNzNlOTFjOTgxYWM1MjIxNzcgIHMzdHJhbnNmZXItMC4xMy4wLnRhci5negog
IyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2
M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElD
RU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMz
dHJhbnNmZXIubWsgYi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVy
Lm1rCmluZGV4IDQ0YTY0ZTg1OWEuLmIzNzg5MDBiYmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0
aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIubWsKKysrIGIvcGFja2FnZS9weXRob24t
czN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9TM1RSQU5TRkVSX1ZFUlNJT04gPSAwLjExLjQK
K1BZVEhPTl9TM1RSQU5TRkVSX1ZFUlNJT04gPSAwLjEzLjAKIFBZVEhPTl9TM1RSQU5TRkVSX1NP
VVJDRSA9IHMzdHJhbnNmZXItJChQWVRIT05fUzNUUkFOU0ZFUl9WRVJTSU9OKS50YXIuZ3oKLVBZ
VEhPTl9TM1RSQU5TRkVSX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvMGYvZWMvYWExYTIxNWU1YzEyNmZlNWRlY2JlZTJlMTA3NDY4ZjUxZDljZTE5MGI5NzYz
Y2I2NDlmNzZiYjQ1OTM4CitQWVRIT05fUzNUUkFOU0ZFUl9TSVRFID0gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2VkLzVkLzlkY2MxMDBhYmM2NzExZTgyNDdhZjVhYTU2
MWZjMDdjNGEwNDZmNzJmNjU5YzNhZGVhOWE0NDllMTkxYQogUFlUSE9OX1MzVFJBTlNGRVJfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9TM1RSQU5TRkVSX0xJQ0VOU0UgPSBBcGFjaGUt
Mi4wCiBQWVRIT05fUzNUUkFOU0ZFUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLS0gCjIu
NDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
