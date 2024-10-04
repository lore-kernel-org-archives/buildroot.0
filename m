Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0623CF885F
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 21:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F4B40E52;
	Fri,  4 Oct 2024 21:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9IHYGICuNTo; Fri,  4 Oct 2024 21:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C8B41812
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C8B41812;
	Fri,  4 Oct 2024 21:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3A511BF5F5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E936D4180D
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT1mRqMeo-R9 for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 21:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F173340D27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F173340D27
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F173340D27
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 21:54:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cb8dac900so25273185e9.3
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 14:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728078897; x=1728683697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4pETnEyQ3DNyQOp1K07gKBmG1ZeFehlEBN9dQrPr/A=;
 b=SS+cevT3ETJ6rBTRhIAWj6MY3BBvZCAstDekpyjaKJwPczCpIVWuruHWL/jUgiuZhc
 z4DqOW3j5wumsOZFwa5KjHm9UxU6N3kNBcFZCfTY+nKxbeuDTEllyfS/N1DNpspGBIxq
 TK0VXdG2onav8ACO9edXdqXmORE5eS9F+xRAXCS/tMbjPzsvG5QRRcZqsDVj4JkMCs5r
 CsArBUxr7EsLa1ws1NSEqTJpAYno0VwEm7Qivcy//+x45NrSwwzPhyz9WgXh3fD70PVG
 DaD3V93Qpz2It8b55QhFjm3xIM9+EQcRlnrivJY3wrkMt1SHIZylenlkBUBYcEC3lDKS
 7M3w==
X-Gm-Message-State: AOJu0YzTCsoF+Z/bLwiQUpS1oKCgx09Ws6nqYmxhTf/gJFX1t7y5SPb9
 +7YZvJGg9P/NC9l84zh5/UAAHRhq/NQ0Xr38TPfR0+Dzt9tboqLPSGGcdMQEZna/IYrXm6djWEH
 Juoo=
X-Google-Smtp-Source: AGHT+IEy2l19bZLwNbkmCb7pu5YtvUxCo1C+w/04kWB+rTmYf2DUoYFhhAKOjdHYKs0EUtVBxI2xgw==
X-Received: by 2002:a05:600c:b89:b0:42c:b1e1:a45b with SMTP id
 5b1f17b1804b1-42f85ab7faamr32424525e9.19.1728078896509; 
 Fri, 04 Oct 2024 14:54:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89e39aebsm6972005e9.0.2024.10.04.14.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 14:54:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 23:54:45 +0200
Message-ID: <20241004215451.1198861-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
References: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728078897; x=1728683697;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4pETnEyQ3DNyQOp1K07gKBmG1ZeFehlEBN9dQrPr/A=;
 b=lfkZsVHrZS9QQKFfkFnyUGnJCVU/EOkJBORgIbXuTkZhCTxcAROJba5ecpovo7p0/R
 iCR4nMUgh8ELq4O2fif9foCmLNbrsc8nyq3zSgVa6dIwSBlnluHa/1SlHvRx9KhxzGKW
 K5fSHDL0M94sI3fT2FN+LueJkeMIsk0aC6Eps=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lfkZsVHr
Subject: [Buildroot] [PATCH 2/3] package/bsdiff: switch upstream
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Colin Percival <cperciva@freebsd.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBhc2tlZCBDb2xpbiBQZXJjaXZhbCwgdGhlIGNyZWF0b3Igb2YgYnNkaWZmLCBhYm91dCB0aGUg
ZmFpbHVyZSB0bwpkb3dubG9hZCBic2RpZmYtNC4zLnRhci5neiBmcm9tICBodHRwczovL3d3dy5k
YWVtb25vbG9neS5uZXQvYnNkaWZmLAphbmQgaGUga2luZGx5IHJlcGxpZWQgdGhhdCBoZSBpbnRl
bnRpb25hbGx5IGRpc2FibGVkIHRoZSBwYWNrYWdlCmRvd25sb2FkIGJlY2F1c2UgInRoYXQgY29k
ZSBoYXMgc29tZSBzZWN1cml0eSBidWdzIGFuZCBJIGRpZG4ndCBoYXZlCnRpbWUgdG8gcm9sbCBh
IG5ldyB0YXJiYWxsIHdpdGggdGhlbSBmaXhlZC4gR3JhYiB0aGUgYnNkaWZmIGNvZGUgZnJvbQpG
cmVlQlNEIG9yIENocm9taXVtLCBJJ20gcHJldHR5IHN1cmUgdGhleSBoYXZlIGFsbCB0aGUgZml4
ZXMuIgoKSSBjaG9zZSB0aGUgQ2hyb21pdW0gdmVyc2lvbiBiZWNhdXNlIHRoZSBGcmVlQlNEIG9u
ZSB3YXMgbGVzcyBzdWl0YWJsZQpmb3IgaW50ZWdyYXRpb24gaW50byBCdWlsZHJvb3QsIGdpdmVu
IHRoYXQgdGhlcmUgaXMgbm8gZ2l0IHJlcG9zaXRvcnkKZm9yIHRoZSBwcm9qZWN0IGl0c2VsZiwg
YnV0IHJhdGhlciBmb3IgYWxsIEZyZWVCU0Qgc291cmNlcyAoNC43IEdCKS4KCkMrKzExIGlzIG5v
dyBtYW5kYXRvcnkuCgpGaXhlczoKLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy8yMWJiODI3ZDNkYmY1NTNjNzlmNDlkN2MxODQwOTljNzVkZjNkNDVkCgpDYzogQ29saW4g
UGVyY2l2YWwgPGNwZXJjaXZhQGZyZWVic2Qub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLmNoZWNrcGFj
a2FnZWlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIC4uLi8wMDAxLUFk
ZC1taXNzaW5nLWhlYWRlci1mb3ItdV9jaGFyLnBhdGNoICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0t
LQogcGFja2FnZS9ic2RpZmYvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsr
Ky0KIHBhY2thZ2UvYnNkaWZmL2JzZGlmZi5oYXNoICAgICAgICAgICAgICAgICAgICAgfCAgNyAr
KystLS0tCiBwYWNrYWdlL2JzZGlmZi9ic2RpZmYubWsgICAgICAgICAgICAgICAgICAgICAgIHwg
MTggKysrKysrKystLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDMzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYnNkaWZmLzAwMDEt
QWRkLW1pc3NpbmctaGVhZGVyLWZvci11X2NoYXIucGF0Y2gKCmRpZmYgLS1naXQgYS8uY2hlY2tw
YWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQppbmRleCAwY2M3NDJiZjA5NjAuLjk4
YjM4YTM4NmYwMSAxMDA2NDQKLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9yZQorKysgYi8uY2hlY2tw
YWNrYWdlaWdub3JlCkBAIC0zNDMsNyArMzQzLDYgQEAgcGFja2FnZS9icmlja2QvUzcwYnJpY2tk
IFNoZWxsY2hlY2sgbGliX3N5c3YuSW5kZW50IGxpYl9zeXN2LlZhcmlhYmxlcwogcGFja2FnZS9i
cmlkZ2UtdXRpbHMvMDAwMS1maXgtYnVpbGQtb24tbXVzbC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJl
YW0KIHBhY2thZ2UvYnJsdHR5LzAwMDEtRml4LWxpbmtpbmctZXJyb3Itb24tbWlwczY0ZWwucGF0
Y2ggbGliX3BhdGNoLlVwc3RyZWFtCiBwYWNrYWdlL2JybHR0eS9TMTBicmx0dHkgU2hlbGxjaGVj
ayBsaWJfc3lzdi5JbmRlbnQgbGliX3N5c3YuVmFyaWFibGVzCi1wYWNrYWdlL2JzZGlmZi8wMDAx
LUFkZC1taXNzaW5nLWhlYWRlci1mb3ItdV9jaGFyLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQog
cGFja2FnZS9idXN0bGUvMDAwMS1NYWtlZmlsZS1maXgtcGNhcC1jb25maWctY2FsbC5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KIHBhY2thZ2UvYnVzeWJveC8wMDAxLW5ldHdvcmtpbmctbGliaXBy
b3V0ZS11c2UtbGludXgtaWZfcGFja2V0LmgtaW5zdGVhZC0ucGF0Y2ggbGliX3BhdGNoLlVwc3Ry
ZWFtCiBwYWNrYWdlL2J1c3lib3gvMDAwMi1NYWtlZmlsZS5mbGFncy1zdHJpcC1ub24tbC1hcmd1
bWVudHMtcmV0dXJuZWQtYnktcGtnLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9ic2RpZmYvMDAwMS1BZGQtbWlzc2luZy1oZWFkZXItZm9yLXVfY2hhci5wYXRj
aCBiL3BhY2thZ2UvYnNkaWZmLzAwMDEtQWRkLW1pc3NpbmctaGVhZGVyLWZvci11X2NoYXIucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDU2YWZmYjQxMDJjZS4uMDAwMDAwMDAw
MDAwCi0tLSBhL3BhY2thZ2UvYnNkaWZmLzAwMDEtQWRkLW1pc3NpbmctaGVhZGVyLWZvci11X2No
YXIucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxNyArMCwwIEBACi1ic3BhdGNoOiBGaXggbWlz
c2luZyBoZWFkZXIgPHN5cy90eXBlcy5oPiBmb3IgdV9jaGFyCi0KLUZpeGVzIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzMxYS8zMWE4MzdjZjZlMzRiMDJkY2U0OThmMmIx
MmU0MGQ2ZDE2YTVhOGU2LwotCi1TaWduZWQtb2ZmLWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmty
YXVzZUBlbWJlZGRlZC5yb2Nrcz4KLQotZGlmZiAtcHVyTiBic2RpZmYtNC4zLm9yaWcvYnNwYXRj
aC5jIGJzZGlmZi00LjMvYnNwYXRjaC5jCi0tLS0gYnNkaWZmLTQuMy5vcmlnL2JzcGF0Y2guYwky
MDE1LTA0LTMwIDEzOjQ3OjI2LjQ4NTkwMzM1OSArMDIwMAotKysrIGJzZGlmZi00LjMvYnNwYXRj
aC5jCTIwMTUtMDQtMzAgMTM6NDg6MTQuODA4OTA4NjcyICswMjAwCi1AQCAtMzUsNiArMzUsNyBA
QCBfX0ZCU0RJRCgiJEZyZWVCU0Q6IHNyYy91c3IuYmluL2JzZGlmZi9iCi0gI2luY2x1ZGUgPGVy
ci5oPgotICNpbmNsdWRlIDx1bmlzdGQuaD4KLSAjaW5jbHVkZSA8ZmNudGwuaD4KLSsjaW5jbHVk
ZSA8c3lzL3R5cGVzLmg+Ci0KLSBzdGF0aWMgb2ZmX3Qgb2ZmdGluKHVfY2hhciAqYnVmKQotIHsK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnNkaWZmL0NvbmZpZy5pbiBiL3BhY2thZ2UvYnNkaWZmL0Nv
bmZpZy5pbgppbmRleCAxMWZkOGI5ZDM1MjMuLjI1Mjk1ZjA2ZTcwZCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9ic2RpZmYvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvYnNkaWZmL0NvbmZpZy5pbgpAQCAt
MSw4ICsxLDEwIEBACiBjb25maWcgQlIyX1BBQ0tBR0VfQlNESUZGCiAJYm9vbCAiYnNkaWZmIgor
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgQysrMTEKIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfQlpJUDIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRElWU1VGU09SVAog
CWhlbHAKIAkgIEJpbmFyeSBwYXRjaC9kaWZmIGxpa2UgeGRlbHRhIGJ1dCBjcmVhdGVzIHNtYWxs
ZXIgZGlmZnMuCiAJICBOZWVkcyBiemlwMiBzdXBwb3J0LgogCi0JICBodHRwOi8vd3d3LmRhZW1v
bm9sb2d5Lm5ldC9ic2RpZmYvCisJICBodHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS9w
bGF0Zm9ybS9leHRlcm5hbC9ic2RpZmYvCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JzZGlmZi9ic2Rp
ZmYuaGFzaCBiL3BhY2thZ2UvYnNkaWZmL2JzZGlmZi5oYXNoCmluZGV4IDEwMjA4NmI5ZmMwNC4u
ZTE2ZDMyMDIzZTFjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2JzZGlmZi9ic2RpZmYuaGFzaAorKysg
Yi9wYWNrYWdlL2JzZGlmZi9ic2RpZmYuaGFzaApAQCAtMSw0ICsxLDMgQEAKLSMgRnJvbSBodHRw
Oi8vd3d3LmRhZW1vbm9sb2d5Lm5ldC9ic2RpZmYvOgotbWQ1ICBlNmQ4MTIzOTRmMGUwZWNjOGQ1
ZGYyNTVhYTFkYjIyYSAgYnNkaWZmLTQuMy50YXIuZ3oKLSMgbG9jYWxseSBjb21wdXRlZAotc2hh
MjU2ICBmYzBhNmU2MzRlZjc3ZGNmMTRiZjM2YzdiNmQxZTU3YmExYWM1YzQ4MDkwNzNkZmFhY2Iz
YjVmN2FiMjc3ZWI3ICBic2RpZmYuYworIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgNmY4
NGQzYjJmMGI3NThhOTdlNzlmNjI5NGVkODRkYTRjZDVjMWEyYWIwZjdjYjNkNWVkODBmYzIzNGUw
OWMzMiAgYnNkaWZmLThjMTdiZGMwZDc1OWM4ZTZkYTkwYzVmNzJiMDUyYmEyNjA1YTBhM2EtZ2l0
NC50YXIuZ3oKK3NoYTI1NiAgODJkNWY2OWEwMWJkNWIzOTYyZGRmNDJmOTM0NmFlZTQxYWI4MGJm
NGNiNjdlZDhhMWVkZTk2NmU4YjA4MGM1NCAgUkVBRE1FLmNocm9taXVtCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2JzZGlmZi9ic2RpZmYubWsgYi9wYWNrYWdlL2JzZGlmZi9ic2RpZmYubWsKaW5kZXgg
OTdhMWIzOTIxZGY0Li5lOWVlOWZhMWI5ZjIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYnNkaWZmL2Jz
ZGlmZi5taworKysgYi9wYWNrYWdlL2JzZGlmZi9ic2RpZmYubWsKQEAgLTQsMjMgKzQsMjEgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUJTRElGRl9WRVJTSU9OID0gNC4zCi1CU0RJ
RkZfU0lURSA9IGh0dHA6Ly93d3cuZGFlbW9ub2xvZ3kubmV0L2JzZGlmZgotQlNESUZGX0RFUEVO
REVOQ0lFUyA9IGJ6aXAyCitCU0RJRkZfVkVSU0lPTiA9IDhjMTdiZGMwZDc1OWM4ZTZkYTkwYzVm
NzJiMDUyYmEyNjA1YTBhM2EKK0JTRElGRl9TSVRFID0gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVz
b3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkvYnNkaWZmCitCU0RJRkZfU0lURV9NRVRI
T0QgPSBnaXQKK0JTRElGRl9ERVBFTkRFTkNJRVMgPSBiemlwMiBsaWJkaXZzdWZzb3J0CiBCU0RJ
RkZfTElDRU5TRSA9IEJTRC0yLUNsYXVzZQotQlNESUZGX0xJQ0VOU0VfRklMRVMgPSBic2RpZmYu
YworQlNESUZGX0xJQ0VOU0VfRklMRVMgPSBSRUFETUUuY2hyb21pdW0KIEJTRElGRl9DUEVfSURf
VkVORE9SID0gZGFlbW9ub2xvZ3kKIAogZGVmaW5lIEJTRElGRl9CVUlMRF9DTURTCi0JJChUQVJH
RVRfTUFLRV9FTlYpICQoVEFSR0VUX0NDKSAkKFRBUkdFVF9DRkxBR1MpICQoVEFSR0VUX0xERkxB
R1MpIFwKLQkJJChARCkvYnNkaWZmLmMgLWxiejIgLW8gJChARCkvYnNkaWZmCi0JJChUQVJHRVRf
TUFLRV9FTlYpICQoVEFSR0VUX0NDKSAkKFRBUkdFVF9DRkxBR1MpICQoVEFSR0VUX0xERkxBR1Mp
IFwKLQkJJChARCkvYnNwYXRjaC5jIC1sYnoyIC1vICQoQEQpL2JzcGF0Y2gKKwkkKFRBUkdFVF9N
QUtFX0VOVikgICQoTUFLRSkgLUMgJChARCkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpCiBlbmRl
ZgogCiBkZWZpbmUgQlNESUZGX0lOU1RBTExfVEFSR0VUX0NNRFMKLQkkKElOU1RBTEwpIC1EIC1t
IDc1NSAkKEBEKS9ic2RpZmYgJChUQVJHRVRfRElSKS91c3IvYmluL2JzZGlmZgotCSQoSU5TVEFM
TCkgLUQgLW0gNzU1ICQoQEQpL2JzcGF0Y2ggJChUQVJHRVRfRElSKS91c3IvYmluL2JzcGF0Y2gK
KwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSAkKFRBUkdFVF9DT05GSUdVUkVf
T1BUUykgXAorCQlERVNURElSPSQoVEFSR0VUX0RJUikgaW5zdGFsbAogZW5kZWYKIAogJChldmFs
ICQoZ2VuZXJpYy1wYWNrYWdlKSkKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
