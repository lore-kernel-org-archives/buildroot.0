Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5F1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 19:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B9961076
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 19:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99B9961076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EFF781DB2;
	Sat,  6 Nov 2021 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsAvXRPGKfTj; Sat,  6 Nov 2021 19:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB7882479;
	Sat,  6 Nov 2021 19:01:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36C261BF350
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BDD82479
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 19:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWRhGKCHdNas for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 19:01:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E44081DB2
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 19:01:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso11997951wmd.4
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/7E+Y5bZSCL+nETl+RazzKUVKsUIp9vKW7ilbw0u4M=;
 b=m0HcBAHNfL57qJIVS8qU29788ytQUGqHhMGQ95jGr7VntOmFO81/DJywbj9KT4SdkB
 XpVJMMAllY2+tdYHVABJuor8iaqc7HfbUN8i4eQwdMzUNdM3etSq9cse3Wb12d+0Wp+w
 pPANzifOrKDX5wtgJ/LkSvmYtfp1D256dMRnVgqQAerPXqzaO6oezxp8UTcCOb+3y5Os
 ByCjDoRs/n+LQlvwGFwvYKzNCympE6S7jACQUeJEU4Y0JuEy17Dkr4rkiquBk1u2/IIi
 LwurwCsTrKSxGoIlRqA4BWuR/yv9gsADhze41CwtrktKfN3P/Ar/YDHgxD6BhruuPfbv
 KGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/7E+Y5bZSCL+nETl+RazzKUVKsUIp9vKW7ilbw0u4M=;
 b=X6cXCgZz5HVr5pFgmvZnXngBjN0wdBUVwLAGwgHIcNqbxs+8H51hHZU1HT7QAUnqhF
 3/MAaokUlBRiipKnYyc9vALSNaVa5yNv6DtBclLHHHrZPkx3HTrc1ejsll1GMpe1bPk7
 5fvm4RW8bXXakW03irOIxz7gg5LLH6nHWV/8/hp04uAL/0ibRocgd0fFfvg8lg4xS03o
 pUqpK4YlyLg1eyvhJsIyRvBBujJJzRuSgbOA5BgvSPwrjywzpRQNLeNUMbESnDwx9sBP
 xciuYH5J8bnQiZ+odPFc2odkUpYwYSa4wMA2Hyze8NxOT+AhpNGagbnXLsVO9O0BAy34
 a1BQ==
X-Gm-Message-State: AOAM533WubgmS4of0VwR0SEp6QMbeNUiL97N5gpMFydYfNgZKdDHDVef
 sCIL9qbmhRtWmzTMv2pXyl5bJB4uaK8=
X-Google-Smtp-Source: ABdhPJy3NWYJPAcLKoHPlONSAgecd0xAL/LGqsopwCn0kRSGoRnVVUCB/Evp4r5PtbpfNSkL8a3Drg==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr41081608wmp.165.1636225264929; 
 Sat, 06 Nov 2021 12:01:04 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id j38sm14742002wms.29.2021.11.06.12.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 12:01:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 20:00:57 +0100
Message-Id: <20211106190057.2487641-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Revert "package/luajit: back to mainline and
 bump to 05f1984e"
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA5NDUwYjUzYzhlMDZmMWI1YTc1ODQwYjgyYzBmNDY2M2E1ZDc1
YzQ1IHNpbmNlIGl0CmludHJvY3VkZSBhIHJlZ3JldGlvbiB0byBsdXZpIHBhY2thZ2UgWzFdLgoK
bHV2aSBkb2Vzbid0IHdvcmsgc2luY2UgdGhlIGx1diBzdGF0aWMgbGlua2luZyBkb2Vzbid0IHNl
ZW1zIHRvCndvcmsgYW55bW9yZS4KKHNlZSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2aS9j
b21taXQvYTlkYzhkYWUyZWI2OWQ0YTc1NGEwY2Y1YzA4NjIyZDcwZjZiNzA2NykKCiAjIGx1dmkg
LXYKCltzdHJpbmcgInJldHVybiByZXF1aXJlKCdpbml0JykoLi4uKSJdOjE6IG1vZHVsZSAnaW5p
dCcgbm90IGZvdW5kOgoKCW5vIGZpZWxkIHBhY2thZ2UucHJlbG9hZFsnaW5pdCddCglubyBmaWxl
ICcuL2luaXQubHVhJwoJbm8gZmlsZSAnL3Vzci9zaGFyZS9sdWFqaXQtMi4xLjAtYmV0YTMvaW5p
dC5sdWEnCglubyBmaWxlICcvdXNyL2xvY2FsL3NoYXJlL2x1YS81LjEvaW5pdC5sdWEnCglubyBm
aWxlICcvdXNyL2xvY2FsL3NoYXJlL2x1YS81LjEvaW5pdC9pbml0Lmx1YScKCW5vIGZpbGUgJy91
c3Ivc2hhcmUvbHVhLzUuMS9pbml0Lmx1YScKCW5vIGZpbGUgJy91c3Ivc2hhcmUvbHVhLzUuMS9p
bml0L2luaXQubHVhJwoJbm8gZmlsZSAnLi9pbml0LnNvJwoJbm8gZmlsZSAnL3Vzci9sb2NhbC9s
aWIvbHVhLzUuMS9pbml0LnNvJwoJbm8gZmlsZSAnL3Vzci9saWIvbHVhLzUuMS9pbml0LnNvJwoJ
bm8gZmlsZSAnL3Vzci9sb2NhbC9saWIvbHVhLzUuMS9sb2FkYWxsLnNvJwoKc3RhY2sgdHJhY2Vi
YWNrOgoJW0NdOiBpbiBmdW5jdGlvbiAncmVxdWlyZScKCVtzdHJpbmcgInJldHVybiByZXF1aXJl
KCdpbml0JykoLi4uKSJdOjE6IGluIG1haW4gY2h1bmsKCmx1dmkgbm93IHRyeSB0byBsb2FkIGlu
aXQubHVhIHNjcmlwdDoKaHR0cHM6Ly9naXRodWIuY29tL2x1dml0L2x1dmkvYmxvYi92Mi4xMi4w
L3NyYy9tYWluLmMjTDE3NgoKTHV2aSBzZWVtcyB0byByZWx5IG9uIHNvbWUgbW9vbmppdCBleHRl
bnRpb25zIFsyXSBub3QgYXZhaWxhYmxlIHlldCBpbgpsdWFqaXQuCgpbMV0gaHR0cDovL2xpc3Rz
LmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMS1PY3RvYmVyLzYyNzEzNC5odG1s
ClsyXSBodHRwczovL2dpdGh1Yi5jb20vbW9vbmppdC9tb29uaml0L2Jsb2IvbWFzdGVyL2RvYy9l
eHRlbnNpb25zLm1kCgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBn
bWFpbC5jb20+CkNjOiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4K
Q2M6IErDtnJnIEtyYXVzZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgotLS0KIHBhY2th
Z2UvbHVhaml0L0NvbmZpZy5pbiAgIHwgMiArLQogcGFja2FnZS9sdWFqaXQvbHVhaml0Lmhhc2gg
fCA0ICsrLS0KIHBhY2thZ2UvbHVhaml0L2x1YWppdC5tayAgIHwgNCArKy0tCiAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2x1YWppdC9Db25maWcuaW4gYi9wYWNrYWdlL2x1YWppdC9Db25maWcuaW4KaW5kZXggZTRl
MTI0OTI0MC4uZWIzZWIwMTk5OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdWFqaXQvQ29uZmlnLmlu
CisrKyBiL3BhY2thZ2UvbHVhaml0L0NvbmZpZy5pbgpAQCAtMjcsNyArMjcsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfTFVBSklUCiAJICBBQkktY29tcGF0aWJsZSB0byB0aGUgc3RhbmRhcmQgTHVh
IGludGVycHJldGVyIGFuZCBjYW4gYmUKIAkgIGRlcGxveWVkIGFzIGEgZHJvcC1pbiByZXBsYWNl
bWVudC4KIAotCSAgaHR0cHM6Ly9sdWFqaXQub3JnL2x1YWppdC5odG1sCisJICBodHRwczovL2dp
dGh1Yi5jb20vbW9vbmppdC9tb29uaml0CiAKIGlmIEJSMl9QQUNLQUdFX0xVQUpJVAogCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2x1YWppdC9sdWFqaXQuaGFzaCBiL3BhY2thZ2UvbHVhaml0L2x1YWpp
dC5oYXNoCmluZGV4IDE0OTdlZTlkZjQuLjUzMmVjMGIyOTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bHVhaml0L2x1YWppdC5oYXNoCisrKyBiL3BhY2thZ2UvbHVhaml0L2x1YWppdC5oYXNoCkBAIC0x
LDUgKzEsNSBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYjFiMTlmOTI0NTFhNjYx
YmExMTY3ZWUwYjI1OTI5OTYxNmNiM2ExY2RhZjVhYjA1ZDdjY2ZmYWZmZWI0YTBmYiAgbHVhaml0
LTA1ZjE5ODRlMWE4NjJlNGIzZDNjM2IzNzBjNzczNDkyZTJlZGY4NGEudGFyLmd6CitzaGEyNTYg
YzNkZThlMjlhYTYxN2ZjNTk0YzA0M2Y1NzYzNmFiOWFkNzFhZjJiNGEzYTUxMzkzMmIwNWY1Y2Rh
YTQzMjBiMiAgbHVhaml0LTIuMS4yLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hh
MjU2ICA0M2ZjMjUxMTc5ZDkwMGY5OTQ4ZTUxZGQzY2M5MzczM2QxMjE5ZjJkYjA2MGZhYWEwYzgx
MDBhZDA1NGY1NGQ4ICBDT1BZUklHSFQKK3NoYTI1NiBhYTY0YTc3MDZkZWQ3NzMwMTFiOTMzZjQy
MzBkN2IzNWJhNjYyNTk4MTk3ZjgyYWMyYzdiY2E2MmFiZGFhNGQ3ICBDT1BZUklHSFQKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbHVhaml0L2x1YWppdC5tayBiL3BhY2thZ2UvbHVhaml0L2x1YWppdC5t
awppbmRleCBmYmJkOGViYzcwLi5kZWZhMjFkZDNmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YWpp
dC9sdWFqaXQubWsKKysrIGIvcGFja2FnZS9sdWFqaXQvbHVhaml0Lm1rCkBAIC00LDggKzQsOCBA
QAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTFVBSklUX1ZFUlNJT04gPSAwNWYxOTg0
ZTFhODYyZTRiM2QzYzNiMzcwYzc3MzQ5MmUyZWRmODRhCi1MVUFKSVRfU0lURSA9ICQoY2FsbCBn
aXRodWIsTHVhSklULEx1YUpJVCwkKExVQUpJVF9WRVJTSU9OKSkKK0xVQUpJVF9WRVJTSU9OID0g
Mi4xLjIKK0xVQUpJVF9TSVRFID0gJChjYWxsIGdpdGh1Yixtb29uaml0LG1vb25qaXQsJChMVUFK
SVRfVkVSU0lPTikpCiBMVUFKSVRfTElDRU5TRSA9IE1JVAogTFVBSklUX0xJQ0VOU0VfRklMRVMg
PSBDT1BZUklHSFQKIAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
