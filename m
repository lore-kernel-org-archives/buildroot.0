Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0855F106ACCF
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C2E802EC;
	Thu, 12 Mar 2026 16:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nzWFI3d8dym; Thu, 12 Mar 2026 16:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81516802E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773334535;
	bh=hY1Ae4mtWye5pHY36pKgqVtEZwezFTGf7cCO0i2FhJQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXuVKiAJpX98VT7a1kOsvKeWLoJrydIML9Cp/344nKev29LjdE25ND5Vq3ZS5fkce
	 +GXG+dX9sIX7Wn/huMK6NRV4HX0nqWpiAJW8FXPQW1iwW0O9PrD1EVjdlY+M9RLH4j
	 blY1X+PjoOTWf5O98pVR5n17+T5vw0HPDn7PW6DQuKGkX1pgSJXSRfu+IN83Kt3i/4
	 NBdISDLr5JyHmb49w/9BZE1NCU2L3b88Ss2YFJw6/9VlXw+d+B3brkbPCTce4hJcab
	 BxhoK4t7Qjlcmm11YFiH6sMGNeXoPHzV6m5VjCtah9zG1DDfiSfjbVACsPFrJohUQQ
	 Fh62l1pEoajXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81516802E9;
	Thu, 12 Mar 2026 16:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D75228
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF55340022
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0I71t0Ql0y-n for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D67E40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D67E40012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D67E40012
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D8C4A4C0EBC;
 Thu, 12 Mar 2026 17:55:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60208)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0jJf-0000000068u-0b5c;
 Thu, 12 Mar 2026 16:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Mar 2026 17:55:16 +0100
Message-ID: <20260312165518.3312453-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312165518.3312453-1-bernd@kuhls.net>
References: <20260312165518.3312453-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773334519;
 bh=faryiQRnbEAfldZh5stV83LTWIJdZoDvyUD8M2fKBv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kEOBJmC1P5V+PQRvVODKGoaiQPJnDbaVCPZUNulA+hQhXujXCpXGCkEci+9zRKgs7
 77/vKffJee6GlqoBzSiBIKis1Cx6sDF70UkJPkOULHkl7M/ZxmQ1oMqS3f5fElhESD
 PUt/F0bNAw8dYztw+EAwOdEG43ETaYCh/lWD3t8akPf98XBmSwEAZgsSk1IzwfN3Jy
 16FvGuVmcIp5/uMYFI5y3pvq+EEGkiiLpqBzqCwPeGWgKe3XPmgmDTwNh/8V0rxKNH
 9ntPxuoRktwHJ8g3Jk3ZXW8HMa5kyrsrMvbmKio5ARrVVddfT8UjNw7bdmlL1/QqvE
 XL8T9BEoO/SLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kEOBJmC1
Subject: [Buildroot] [PATCH v2 2/4] package/wireplumber: mark broken on
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
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQp2Mjogbm8gY2hhbmdlcwoKIHBhY2thZ2Uvd2lyZXBs
dW1iZXIvQ29uZmlnLmluIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2lyZXBsdW1iZXIvQ29uZmln
LmluIGIvcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4KaW5kZXggNjUyOGEyZTEwMi4uZTQz
ZjFlZDUyYSAxMDA2NDQKLS0tIGEvcGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4KKysrIGIv
cGFja2FnZS93aXJlcGx1bWJlci9Db25maWcuaW4KQEAgLTQsNiArNCw3IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9XSVJFUExVTUJFUgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTFVBXzVfMyB8fCBC
UjJfUEFDS0FHRV9MVUFfNV80CiAJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgbGliZ2xpYjIK
IAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBsaWJnbGliMgorCWRlcGVu
ZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMgIyBnZXR0aWQKIAlkZXBlbmRzIG9uIEJS
Ml9VU0VfTU1VICMgbGliZ2xpYjIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCR0xJQjIKIAloZWxw
CkBAIC0xNSw4ICsxNiwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0lSRVBMVU1CRVIKIAogCSAg
aHR0cHM6Ly9waXBld2lyZS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvd2lyZXBsdW1iZXIvCiAKLWNv
bW1lbnQgIndpcmVwbHVtYmVyIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzIGFu
ZCBMdWEgPj0gNS4zIgorY29tbWVudCAid2lyZXBsdW1iZXIgbmVlZHMgYSBnbGliYyBvciBtdXNs
IHRvb2xjaGFpbiB3LyB3Y2hhciwgdGhyZWFkcyBhbmQgTHVhID49IDUuMyIKIAlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX1BJUEVXSVJFCiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogCWRlcGVuZHMg
b24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgXAorCQlC
UjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDIHx8IFwKIAkJKCFCUjJfUEFDS0FHRV9MVUFfNV8zICYm
ICFCUjJfUEFDS0FHRV9MVUFfNV80KQorCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
