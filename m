Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C862C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E3AD412C0;
	Fri,  9 Aug 2024 11:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJLyaxV4WIYk; Fri,  9 Aug 2024 11:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD53541319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD53541319;
	Fri,  9 Aug 2024 11:27:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 496791BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44BF781E7F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2L59POsWS3d for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EA9F81E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA9F81E92
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EA9F81E92
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:27:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so13954075e9.2
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 04:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723202872; x=1723807672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Yl+roFQa7AcwjL60JlpHNM6WbYRnJeBVVn7nlMB+WU=;
 b=cY1bvOtUyzQvM4eHfze0CySM0cBz1vTtcey0IFLzrdvq0m6lVsADwAudjYlxNKeQzO
 yagfpGsnjapOO8EaV5y9fdrdlNCNTtBXeyuxcG/JkNtai4N+9iy8nxWe1t7AnCUmQgz/
 tymfoXGGz5t8SZcwOtp7OsDVW0e43gGytc/yefrfXMgZ56L8TZEf4Qo3H15xAU2DLrUK
 gDLZivPrazk+oVPeVux+NW8l01jkrBAZ75h0t9h4Wn1zSxi7G+a69Lazfi/2Tc4U8nG0
 y7xqPBdsZ4BI+8JSRstVt1pJT2J5sCgCZEmgiicOLHwD1O71yEzvC9iSDxd6SWFCuMB2
 dwMA==
X-Gm-Message-State: AOJu0YwsaglBqoFPvJymI9+Q7SY39kK8CHWeMtPaQLxTidFAIMS4FYth
 Tsi1lMCk9ecqNcNv+Q0gA7s0X8af7B/Y5I5354d7owyo4rNOlDt5g1aU3AnNV3O+YQ==
X-Google-Smtp-Source: AGHT+IHM/gG8hwlx8AnOUS+VnToFK93V/giJFgDPcnsUXzd4piEbm7HnILQS2k0Iz+xXcA27X+MdJA==
X-Received: by 2002:a05:6000:d04:b0:368:6911:6758 with SMTP id
 ffacd0b85a97d-36d5fd7fb09mr888149f8f.40.1723202871915; 
 Fri, 09 Aug 2024 04:27:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d272291c9sm4989102f8f.97.2024.08.09.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 04:27:51 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 13:27:39 +0200
Message-ID: <20240809112739.690823-4-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240809112739.690823-1-gael.portay@rtone.fr>
References: <20240809112739.690823-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723202872; x=1723807672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Yl+roFQa7AcwjL60JlpHNM6WbYRnJeBVVn7nlMB+WU=;
 b=P+FIK33HOLbtU9Dhhi15EImTWm9zTAr+nx3NAls1+lFDbPj4F8t0j9EyOT3A0eB32/
 +NVXrsnOIA3PWPnZ3PHeDqqSFADYHgFM6tP0LUQ60HNryhkiIsN/mhVlzJQuXKv89Tbp
 Am7uX3q5BlcX9Hp/Mnz3Tqv83MN80WjoA9d1v8NRSWU+6CtDz7i8KS68DmzgHnBGHhz4
 xy+li4l62/XmGpktp4X6Kk8sZIRsuUG/ZlbitbgIEVpm5RwUQyqcVwmfJxW7agX/cBhd
 zftIyCNPwkK16OIDPDwXQmK0zXAje34ZhOGpKHwXK92SchqMc4K18FvXRg28XXoBeAsi
 arOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P+FIK33H
Subject: [Buildroot] [PATCH v2 3/3] configs/raspberrypizero2w_64: new
 defconfig
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeSBQaSBa
ZXJvIDIgVwooNjQtYml0KS4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXlAcnRvbmUuZnI+Ci0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8yd182NGJpdC50
eHQgfCAzMiArKysrKysrKysrKysrKysKIGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVm
Y29uZmlnICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
ODAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3Jhc3BiZXJyeXBpL2Nv
bmZpZ196ZXJvMndfNjRiaXQudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9yYXNwYmVy
cnlwaXplcm8yd182NF9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9j
b25maWdfemVybzJ3XzY0Yml0LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMndf
NjRiaXQudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjg4MjA2ZTli
MTQKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3XzY0
Yml0LnR4dApAQCAtMCwwICsxLDMyIEBACisjIFBsZWFzZSBub3RlIHRoYXQgdGhpcyBpcyBvbmx5
IGEgc2FtcGxlLCB3ZSByZWNvbW1lbmQgeW91IHRvIGNoYW5nZSBpdCB0byBmaXQKKyMgeW91ciBu
ZWVkcy4KKyMgWW91IHNob3VsZCBvdmVycmlkZSB0aGlzIGZpbGUgdXNpbmcgQlIyX1BBQ0tBR0Vf
UlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFLgorIyBTZWUgaHR0cDovL2J1aWxkcm9vdC5vcmcvbWFu
dWFsLmh0bWwjcm9vdGZzLWN1c3RvbQorIyBhbmQgaHR0cDovL2VsaW51eC5vcmcvUlBpY29uZmln
IGZvciBhIGRlc2NyaXB0aW9uIG9mIGNvbmZpZy50eHQgc3ludGF4CisKK3N0YXJ0X2ZpbGU9c3Rh
cnQuZWxmCitmaXh1cF9maWxlPWZpeHVwLmRhdAorCitrZXJuZWw9SW1hZ2UKKworIyBUbyB1c2Ug
YW4gZXh0ZXJuYWwgaW5pdHJhbWZzIGZpbGUKKyNpbml0cmFtZnMgcm9vdGZzLmNwaW8uZ3oKKwor
IyBEaXNhYmxlIG92ZXJzY2FuIGFzc3VtaW5nIHRoZSBkaXNwbGF5IHN1cHBvcnRzIGRpc3BsYXlp
bmcgdGhlIGZ1bGwgcmVzb2x1dGlvbgorIyBJZiB0aGUgdGV4dCBzaG93biBvbiB0aGUgc2NyZWVu
IGRpc2FwcGVhcnMgb2ZmIHRoZSBlZGdlLCBjb21tZW50IHRoaXMgb3V0CitkaXNhYmxlX292ZXJz
Y2FuPTEKKworIyBIb3cgbXVjaCBtZW1vcnkgaW4gTUIgdG8gYXNzaWduIHRvIHRoZSBHUFUgb24g
UGkgbW9kZWxzIGhhdmluZworIyAyNTYsIDUxMiBvciAxMDI0IE1CIHRvdGFsIG1lbW9yeQorZ3B1
X21lbV8yNTY9MTAwCitncHVfbWVtXzUxMj0xMDAKK2dwdV9tZW1fMTAyND0xMDAKKworIyBFbmFi
bGUgVUFSVDAgZm9yIHNlcmlhbCBjb25zb2xlIG9uIHR0eUFNQTAKK2R0b3ZlcmxheT1taW5pdWFy
dC1idAorCisjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQg
bmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKK2R0cGFyYW09a3JuYnQ9b24KKworIyBlbmFibGUg
NjRiaXRzIHN1cHBvcnQKK2FybV82NGJpdD0xCmRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3BiZXJy
eXBpemVybzJ3XzY0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVm
Y29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjg2NjQyN2RiYzEK
LS0tIC9kZXYvbnVsbAorKysgYi9jb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3XzY0X2RlZmNvbmZp
ZwpAQCAtMCwwICsxLDQ4IEBACitCUjJfYWFyY2g2ND15CitCUjJfY29ydGV4X2E1Mz15CitCUjJf
QVJNX0ZQVV9WRlBWND15CisKKyMgcGF0Y2hlcworQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJk
L3Jhc3BiZXJyeXBpL3BhdGNoZXMiCitCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkK
KworIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuNiBzZXJpZXMKK0JSMl9QQUNL
QUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKKworQlIyX1RPT0xDSEFJTl9CVUlM
RFJPT1RfQ1hYPXkKKworQlIyX0xJTlVYX0tFUk5FTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9UQVJCQUxMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQo
Y2FsbCBnaXRodWIscmFzcGJlcnJ5cGksbGludXgsNTc2Y2MxMGUxZWQ1MGE5ZWFjZmZjN2EwNWM3
OTYwNTFkNzM0M2VhNCkvbGludXgtNTc2Y2MxMGUxZWQ1MGE5ZWFjZmZjN2EwNWM3OTYwNTFkNzM0
M2VhNC50YXIuZ3oiCitCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iYmNtcnBpMyIKKworIyBC
dWlsZCB0aGUgRFRCIGZyb20gdGhlIGtlcm5lbCBzb3VyY2VzCitCUjJfTElOVVhfS0VSTkVMX0RU
U19TVVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9i
Y20yNzEwLXJwaS16ZXJvLTItdyIKKworQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5T
U0w9eQorCitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkU9eQorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1X
QVJFX0JPT1RDT0RFX0JJTj15CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QST15
CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfQ09ORklHX0ZJTEU9ImJvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ196ZXJvMndfNjRiaXQudHh0IgorCisjIFJlcXVpcmVkIHRvb2xzIHRvIGNyZWF0ZSB0
aGUgU0QgaW1hZ2UKK0JSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15CitCUjJfUEFDS0FHRV9I
T1NUX0dFTklNQUdFPXkKK0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKKworIyBGaWxlc3lzdGVt
IC8gaW1hZ2UKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQorQlIyX1RBUkdFVF9ST09URlNfRVhU
Ml80PXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKKyMgQlIyX1RBUkdFVF9S
T09URlNfVEFSIGlzIG5vdCBzZXQKK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJk
L3Jhc3BiZXJyeXBpL3Bvc3QtYnVpbGQuc2giCitCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBU
PSJib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoIgorCisjIEVuYWJsZSBjb21wcmVzc2Vk
IGtlcm5lbCBtb2R1bGUgc3VwcG9ydAorQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15
CitCUjJfUEFDS0FHRV9LTU9EX1RPT0xTPXkKK0JSMl9QQUNLQUdFX1haPXkKK0JSMl9QQUNLQUdF
X0tNT0Q9eQorQlIyX1BBQ0tBR0VfSE9TVF9LTU9EX1haPXkKLS0gCjIuNDYuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
