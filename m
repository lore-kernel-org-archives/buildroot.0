Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF2ACD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18B4561AAF;
	Sun, 31 May 2026 06:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYQy9z416dPy; Sun, 31 May 2026 06:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC2D61AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208744;
	bh=DrI4gKg+8vaBWN92SpEk1avzw7/f08L1lj3+6z17G/s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EpEZ1ohU0BOOJKR1v+GjLP3l7xrLkrJjXobc6uAWFRhJeJsNMI1XEsRZAcvJH4XKN
	 D6Y4VKRYRbJH1vTGUy8nw7rJAvaHonFBONCfuuqo58eJbck2o6f+uRcB5p5fNuUWt5
	 Jf0gdbN0+YLQrgcSCdSiF01juTxiRwA7y0OgL7gpgmWKnPJrnL3+hHMjMMiF9y5AAe
	 nmQ0SV2I2k12tbWtjk7YF5tYHefZLnpAKpnyIeiMq/BWxraU7veNweaAIaNsmfQuB+
	 PYa1z7hwKJqQ7hLku5idXJqpLbXP7rxaGk8O7pMiu3I0suQmie3xXon0LZFYkx+Y+W
	 iEvDb2gWSD9ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC2D61AC4;
	Sun, 31 May 2026 06:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6C3257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B11FB84F4D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJWByYvtX9iU for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A15BB84F4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A15BB84F4C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A15BB84F4C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:25:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CEDDEA4C35B9;
 Sun, 31 May 2026 08:25:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50040)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTZby-000000000BO-3U5D;
 Sun, 31 May 2026 06:25:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 31 May 2026 08:25:24 +0200
Message-ID: <20260531062526.7792-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531062526.7792-1-bernd@kuhls.net>
References: <20260531062526.7792-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780208726;
 bh=TPu4vfQNHIUbCddvK/YrdwGVS7QfBknMLmilODzH3V0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MaCf1athmvfdlCYhe3f60czeS1YdxFWMvOVBavar1Tf6AnZ6eik250t1LLk1kHYCI
 wyLAkxTVcv3hSqxWFijeP2BXXRP/7tW+POTfjJPFdIdFNU4/dJibtB6cJPuvF+YuaW
 N3Oo/k964PsJRzS0Knh2TzsNif2+AdMedsGEm3fo9wsCXla0m08rTGTxt4kInZLS1Y
 4I7ldRwFtmO/I6NqGq+cG3aaLY4gBoVajyTdM8DRc8SHZtOGOfDR09GCkg8fgnxb0p
 r8JC+cbvaQW+YoDCGt23K7kYLyE9GO91SglgHfeFUdXat/+/O3mDfBezsDi/e8ojGU
 09AB3YaPA8bOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MaCf1ath
Subject: [Buildroot] [PATCH/next v2 2/4] package/wireplumber: mark broken on
 uClibc
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Li4vbGliL3dwL2xvZy5jOjc4MDo0OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmGdldHRpZOKAmTsKIGRpZCB5b3UgbWVhbiDigJhnZXRnaWTigJk/IFstV2ltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDc4MCB8ICAgZ19hdXRvZnJlZSBnY2hhciAqdGlk
ID0gZ19zdHJkdXBfcHJpbnRmKCIlZCIsIGdldHRpZCgpKTsKClRoZSBwcm9ibGVtIHdhcyBoaWRk
ZW4gYnkgcGlwZXdpcmUgYmVpbmcgYnJva2VuIHdpdGggdUNsaWJjIHNpbmNlIGF0CmxlYXN0IFNl
cCAyMDI0OiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZWU1L2VlNTBj
ODMzMTk0NjgxNGMyZmVjYjBjYTU2Y2E1MWMxYmIwYmM1NTEvCgpQaXBld2lyZSB3YXMgYnVtcGVk
IGZyb20gMC4zLjgxIHRvIDEuMi4yIGluIEF1ZyAyMDI0IHdpdGggYnVpbGRyb290IGNvbW1pdAo5
M2I3MjY5MmMzNmY4MzU3ZTg2NzY1MGY0YjhmYWM5MWRmZjM3NWY1IHdoaWNoIGFmYWljcyBjYXVz
ZWQgYWxsIHVDbGliYwpidWlsZHMgdG8gZmFpbCBkdWUgdG8gbWlzc2luZyB0c3NfdCgpIHdob3Nl
IHVzYWdlIHdhcyBhZGRlZCB0byBwaXBld2lyZSBpbgp2ZXJzaW9uIDEuMS44MSAoaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3BpcGV3aXJlLy0vY29tbWl0LwpkZTBkYjQ4
ZjE3YWEzOTE5MTdmZjViNDMwYjdiOWZlMWRhYzQ0M2ZlKSBhbmQgbGF0ZXIgcmVtb3ZlZCB3aXRo
IGh0dHBzOi8vCmdpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUvcGlwZXdpcmUvLS9jb21t
aXQvCjljMTkyODRmN2YwNjJhNTBlMDU5YjA1OTMwNjg0MjliMzQ1YWNmMzQgaW4gdmVyc2lvbiAx
LjMuODEuCgpJbiB3aXJlcGx1bWJlciB0aGUgcmVsZXZhbnQgcGFydCBvZiBjb2RlIHdpdGggZ2V0
dGlkKCkgd2FzIGFkZGVkIGluCnZlcnNpb24gMC41LjkuIEJ1aWxkcm9vdCBidW1wZWQgd2lyZXBs
dW1iZXIgZnJvbSAwLjUuNSBkaXJlY3RseSB0byAwLjUuMTAKd2l0aCBjb21taXQgYzQyYjI2YmI0
NzFhMjYwZTJiYjNkYTc5ODhhZjc3Zjc4YjJiNDI4MC4KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQp2MjogR2l0bGFiIHBpcGVsaW5lcyBwYXNzZWQ6Cmh0
dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy8xMzI5YTEzMDdiMmNh
ZWI5ODliOTBmNTIyODlkMmRlY2ZjNGY2Y2UxCgogcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcu
aW4gfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3dpcmVwbHVtYmVyL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
d2lyZXBsdW1iZXIvQ29uZmlnLmluCmluZGV4IDY1MjhhMmUxMDIuLjVmMDdhN2M2NjQgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2Uvd2lyZXBsdW1iZXIvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uvd2lyZXBs
dW1iZXIvQ29uZmlnLmluCkBAIC00LDYgKzQsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0lSRVBM
VU1CRVIKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xVQV81XzMgfHwgQlIyX1BBQ0tBR0VfTFVB
XzVfNAogCWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGxpYmdsaWIyCiAJZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGliZ2xpYjIKKwlkZXBlbmRzIG9uICFCUjJfVE9P
TENIQUlOX1VTRVNfVUNMSUJDICMgZ2V0dGlkCiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGxp
YmdsaWIyCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkdMSUIyCiAJaGVscApAQCAtMTUsOCArMTYs
OSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0lSRVBMVU1CRVIKIAogCSAgaHR0cHM6Ly9waXBld2ly
ZS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvd2lyZXBsdW1iZXIvCiAKLWNvbW1lbnQgIndpcmVwbHVt
YmVyIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzIGFuZCBMdWEgPj0gNS4zIgor
Y29tbWVudCAid2lyZXBsdW1iZXIgbmVlZHMgYSBnbGliYyBvciBtdXNsIHRvb2xjaGFpbiB3LyB3
Y2hhciwgdGhyZWFkcyBhbmQgTHVhID49IDUuMyIKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1BJ
UEVXSVJFCiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogCWRlcGVuZHMgb24gIUJSMl9VU0VfV0NI
QVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgXAorCQlCUjJfVE9PTENIQUlOX1VT
RVNfVUNMSUJDIHx8IFwKIAkJKCFCUjJfUEFDS0FHRV9MVUFfNV8zICYmICFCUjJfUEFDS0FHRV9M
VUFfNV80KQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
