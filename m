Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580A3C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D8AB4091E;
	Thu, 25 Jul 2024 10:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7RBQd-P59K1; Thu, 25 Jul 2024 10:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DD240914
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DD240914;
	Thu, 25 Jul 2024 10:17:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 709541BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F5324022B
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IGlW6IC3b9l for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02DFE4052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02DFE4052D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02DFE4052D
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:17:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-427db004e36so5472405e9.3
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 03:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721902652; x=1722507452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSLd2LA53sG6osCnOCjhFWcAcF3eUUI7YO2yUQGBM74=;
 b=mHgnmJ76ha0vU0fLKnyUnuknYZroaE6+xvpmppoZSo4anl0LaTYVFSCDkN0rEQ8KBH
 fSReBW35oTClgYc1S/1voXL0NgO/JdtPjVcGaPCYfpXxNbD8/PLPbfpskaw8WHiJYaDf
 bbVIa/3B+ZAWT1qA923juyRe94x0WXBdiGTIwvsb/Gl/PlGZHl9XIyhqdaw3KVgax7x0
 yNtqGH2A3TnBE5f1C19R/lz4bhdoJwOMPWtB5TClNiiBY/2+lpGM8dR+IRF7Q8u+3VFL
 lCN+MkKgc5foqpEzvZ7kj9ffzCgVA2WYHjmxFBR9QdB9qeYUhr146Zvz2fG2vd27VW9n
 Y6YA==
X-Gm-Message-State: AOJu0YzDZyGuo2Y4W2B2LuWQsSnqrkHWy/i012uiVQnarPpuZPhMpeRP
 NC0f3DkvOwZFysT4YnxZNDzxZj33Q1IbuzPqG+6BWldWHtEK/MRIoifryz0ileY=
X-Google-Smtp-Source: AGHT+IE7dAmIdvYXNVDrBOR2OWOvc2IOPvwOrM9zygQ7lJroq3Rdmlw29+orjMfyJELZ39NN1ly+Wg==
X-Received: by 2002:a5d:6489:0:b0:367:991d:8b76 with SMTP id
 ffacd0b85a97d-36b319dec64mr1915309f8f.15.1721902652172; 
 Thu, 25 Jul 2024 03:17:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3686fdc5sm1629603f8f.114.2024.07.25.03.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:17:31 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 12:17:11 +0200
Message-ID: <20240725101711.2443524-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725101711.2443524-1-gael.portay@rtone.fr>
References: <20240725101711.2443524-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721902652; x=1722507452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSLd2LA53sG6osCnOCjhFWcAcF3eUUI7YO2yUQGBM74=;
 b=dhZOXj5Z17PnACYeWHBy/bLM9ZX1HPfBblt5aE+IoLMQlGCVx3i/nvKAVJ+oyJBTLn
 T10U7+McMmTpaMkNBhHLHFQULCsiScFUu1i5ZQ7ywu3xb4+4a63VkpEoN9AfeAKZN0g3
 hp9yVx5OeeBClPHb3nejlXIdxHRNL93uNHfjANLLcwQsZfRIVqVk0HB6YS4takuOrRzc
 9k6QwjiShvYaOJtNl+SIUPaXwyQ/4/VIMF9LBCAlLBD9EDQ3oEZWRhONnNBlCb7XfbXC
 OyWgWvtupAFgeALiVXBx3HWAXZyAJNsAwNcBj1R9N607fHBu8r0Wlju/FmdsfAltXXY+
 4sMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dhZOXj5Z
Subject: [Buildroot] [PATCH v2 2/2] package/rpi-userland: package is
 deprecated
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhpcyBhZGRzIHRoZSBtZXNzYWdlIGluIGl0cyBoZWxwLgoKWzFdOiBo
dHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlk
NWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQogcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmln
LmluIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmlnLmluIGIvcGFja2FnZS9ycGkt
dXNlcmxhbmQvQ29uZmlnLmluCmluZGV4IDQyMTliZGI5YzQuLmMzOWViNDU5OGYgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcnBpLXVzZXJsYW5kL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3JwaS11c2Vy
bGFuZC9Db25maWcuaW4KQEAgLTE2LDYgKzE2LDE3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9SUElf
VVNFUkxBTkQKIAkgIG1tYWwsIEdMRVN2MiwgdmNvcywgb3Blbm1heGlsLCB2Y2hpcV9hcm0sIGJj
bV9ob3N0LCBXRkMsCiAJICBPcGVuVkcuCiAKKwkgIEltcG9ydGFudDogVGhlIHBhY2thZ2UgaXMg
YW5jaWVudCBhbmQgZGVwcmVjYXRlZC4KKworCSAgSXQgbGFyZ2VseSBjb250YWlucyBjb2RlIHVz
aW5nIHByb3ByaWV0YXJ5IEFQSXMgdG8gaW50ZXJmYWNlCisJICB0byB0aGUgVmlkZW9Db3JlIGZp
cm13YXJlLiBJdCBoYXMgc2luY2UgbW92ZWQgdG8gc3RhbmRhcmQKKwkgIGxpbnV4IEFQSXMuCisK
KwkgIFY0TDIsIERSTS9LTVMgYW5kIE1lc2EgYXJlIHRoZSBBUElzIHlvdSBzaG91bGQgYmUgdXNp
bmcuCisKKwkgIFRoZSBmZXcgdXNlZnVsIHRvb2xzIGZyb20gaGVyZSAoZHRvdmVybGF5LCBkdG1l
cmdlLAorCSAgdmNtYWlsYm94LCB2Y2dlbmNtZCkgaGF2ZSBiZWVuIG1vdmVkIHRvIHRoZSBwYWNr
YWdlIHJwaS11dGlscy4KKwogCSAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJs
YW5kLwogCiBpZiBCUjJfUEFDS0FHRV9SUElfVVNFUkxBTkQgJiYgQlIyX2FybQotLSAKMi40NS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
