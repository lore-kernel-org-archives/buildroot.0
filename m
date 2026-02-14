Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C9DEDF15A
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 13:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2FD408DB;
	Sat, 14 Feb 2026 13:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mILxva39QFVS; Sat, 14 Feb 2026 13:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B31E40896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771075913;
	bh=n04Nm2wJglMVixZbOS4CpK8JBMrbo26NdFbZzLsQoTc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpWGoK65ifG2+HKu18d7gcyba4ls34/YGVYkn1Ix35eH02q1ahp6uWhnsyWX0bt5Z
	 /fzros7CB5JMsrdUXK8WX2tfTtpxO5qnlZt1tNtPflhDBw0UvhoxVkyLFvFfXBgZTf
	 /rCk+EkcgOipAWR8oHnSayTDsVP3tuReWAP63LUqO+ad5EffgWr/8VNFBLxLS9sGbK
	 UBz6dl4rmOwhjRJeIkv5LdHsglawtmnnp7ntRmW6TKHpM65RfueGWPJRViuocx/O71
	 e5n8RjTswyT1QKNo/OVAQKWVwq6SWkfhuhr5vjJQsm2Hx5F1j2hgFlxlHmE7ZUtq9f
	 hytNc08GWP91w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B31E40896;
	Sat, 14 Feb 2026 13:31:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5B7270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 13:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E630240109
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 13:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKAeDPTCJQOU for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 13:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AA3E4007B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA3E4007B
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AA3E4007B
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 13:31:49 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-59b672f8ec4so1704801e87.1
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 05:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771075907; cv=none;
 d=google.com; s=arc-20240605;
 b=aWFM49F/Mc+kQXMx1UJoAswphUWBvBi/RIndaG20XroNUdKmjqBcFw4c2CObeZF1jj
 1qwGF72t45aB6H2tseIorrJCyxNz/qaWSdwx1uHZkUBnkQe8fWZFpKoS5YxkLg/c96FH
 sOqt9w1Cmp4a9YCHeDXkr4NOrweoFWOCCE1msF8JFT3GuSB52Ez3jxwuMbaA8uAfOBjJ
 UvxXdCFVjTFmMrGWZvwr573Eui/iNL3uCVc/6qmf7VP3H0iVdKK9qtmPevilVX5Ypn37
 McIJTJycmT81HkMY44gxrX5cS36+hShgFGKPHbTs2rLDDIDVc104hARH15vn0B5V8zF0
 DxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7ykARYipRWIQ2N85rQvQ4OA5mKU84bG58RrCUX+usrA=;
 fh=cUU2nJxI3B/s5bj2bF3YCr+OFI3tjB0sNkGmLrWno7w=;
 b=ltVcE4B0bBfx45N8u+0UE93RMARdWPj2W7mFCZVj8ieCBGZWns5AVXt/xEgWrnQ5VW
 kE6b6w8QD3agPiraIEdypAGrdqsoK70FAhGGlbHPlnUZRQ542Aw1/D2/vlmNNGoyxRR/
 NQ0Bw0IwcuOU1KEXambA9ugN2FgsgbxOYKWzybq/F6DIEd0kukJ2RGDbvA7J+e0HllnO
 2vPZRadq0/g7ujMYB81RxHmviaUdnqxiR92WGWNDhVYcQmBpjkAU8Uw4dBEv2nBQ8vCt
 JzU8Ez+Kh/ghMjMIMkpouzo6p1KobJ+UEfTOy61qPwMe8MOfZryrrqsL/awcFn4YZZmx
 xt+A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771075907; x=1771680707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ykARYipRWIQ2N85rQvQ4OA5mKU84bG58RrCUX+usrA=;
 b=ZM56UC2E/xhYy0HoZXzlFMhbcj6pzlAxR2JosVkQZYrSOL4B1tOsPTiRCEeK7WHy+8
 WRzoq+IHmadbff55UREzr4CJ02g5BjFEGCvGly+KZ4zd/Y2v9GlFDBIpuepiHznaHj01
 dUuzoYRTn/TkR7BSR09igoUPGwz0isXI2rkDLVooQZuxlcWLJqlL0qEzkYj+rpMw6Ylu
 YfpsiMSfFOZXd+93xBPc2P1L2/uMdJcw+wNuz3b4vdYo04RmBOjvacIp/0vFy5eCvRyG
 AuH0Ms0Jel3sFXUcIZ0meVMv0Vtt9rEpQGnc36xlBx+vWGPpDqmWRzUo+N8fnYqMFzEB
 tH2w==
X-Gm-Message-State: AOJu0Yykuhuj+ViOUq8DhPBqJXbcYpre4QAc52ERXIYiIPvNOHNh1DcQ
 mBkKxqCyrT3NtWgx816M8Ho9T2ojAhUsvRkfEFfp5n1U/UvavvkVKEQjzqv+vmneXMfYIblNktK
 3UaXR33qh1/No+LQRpzbSyTjv0ZJwsww=
X-Gm-Gg: AZuq6aJikHBNJRTcORspBzFpqH/aSI+Qqflb2kY3BFrK0ufpKMqdfkBijrAoCzF+fXZ
 8TwQaN6uS/0B6PwOtRz7cYxTDiNPKOYuTksomxSw4vmWrB9PXhRAgUW0Yrz2rJCeRRCL+jhfG1u
 yeuSxwgnCwgRHI2ewQDa9H8sAtZmTxXeok3Qa2JfJpJkNBSjFoBp6pPZBMkUyZ2lVUXDtU/Rt8y
 M/WOXOgaOAW+KQo8IKJfbLwncrJlZY1KDGf4L0qp6W8VePwTTG7Eu4XY2Iq48wnzoeGUIYfDAtU
 480LPA3t2TXgEGOdB2Lzb9rXM88QArLjCuB5t0jEq6o2maI4ICQQnB85iGbHkXB/qfPt+Qe0ld3
 DYD82Ow==
X-Received: by 2002:a05:6512:6c1:b0:59e:1665:c264 with SMTP id
 2adb3069b0e04-59f69c68598mr1704835e87.39.1771075906563; Sat, 14 Feb 2026
 05:31:46 -0800 (PST)
MIME-Version: 1.0
References: <20251227212244.3098285-1-festevam@gmail.com>
 <20260106220704.3283de69@windsurf>
 <CAOMZO5B=YqjBzNVgoEug-hHT6U8MuSYJHqoKyyP3EuGVP3nMhQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B=YqjBzNVgoEug-hHT6U8MuSYJHqoKyyP3EuGVP3nMhQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 14 Feb 2026 10:31:35 -0300
X-Gm-Features: AZwV_QjTFD9lrPLv0gcws9nYQeQCggyb6jqAHZRtawI_6vF5z4-IMYSmA_WFuns
Message-ID: <CAOMZO5BOi+P+Ws_8nc-HQzto73zDb=UBadvVs=Cvd-oDvH_4yA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771075907; x=1771680707; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ykARYipRWIQ2N85rQvQ4OA5mKU84bG58RrCUX+usrA=;
 b=kXzxSNQjHvQPxSypRqUxXPjyPS25IFaL7Ueci++LV9Ypctcd2o0jFRGnhC9yY2fa2D
 qd/ecdq7aIe8QFtzLVCSmaZhZrzj55AdHLrOUS9Q19fiHMme3LsklPtN7DuCvYIcx9ZU
 4l4Rd7ILXOjTzIsDRJm+F3KFgI/2EJLo5PfXWeXcB07frGFNxDaz2eijuvS6ftAjVt22
 2ohL85rM39dnwpXclxmN698SJjxQIIDVRQmBUThwFAK2MQMePxaYJzL2veiP0j9/12L/
 A+FRFXgKZq4vk1OJDZE/bx/wjufEVJQVObdE9WMgbkyLSXkGutlUc/5IY8U6VTdLVbmc
 6E8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kXzxSNQj
Subject: Re: [Buildroot] [PATCH] package/crucible: disable cgo to fix 32-bit
 build failures
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAxMTowNuKAr1BNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBUaG9tYXMsCj4KPiBPbiBUdWUsIEphbiA2LCAyMDI2
IGF0IDY6MDfigK9QTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+IHdyb3RlOgo+Cj4gPiBJbiBjb21taXQgbG9ncywgd2UgbGlrZSB0byBoYXZlIHNvbWUg
ZGV0YWlscyBvbiB3aGF0IGluaXRpYWxseQo+ID4gaW50cm9kdWNlZCB0aGUgcHJvYmxlbSwgc28g
dGhhdCB3ZSBjYW4gdW5kZXJzdGFuZCB3aGV0aGVyIHRoZSBwYXRjaCBpcwo+ID4gYSBmaXggdGhh
dCBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBvdXIgTFRTIHJlbGVhc2UuIElkZWFsbHkgYSBwb2lu
dGVyCj4gPiB0byB0aGUgQnVpbGRyb290IGNvbW1pdCBpbnRyb2R1Y2luZyB0aGUgcHJvYmxlbS4g
SWYgbm90LCBhdCBsZWFzdCBzb21lCj4gPiBpbmRpY2F0aW9uIHRoYXQgdGhlIHByb2JsZW0gZXhp
c3RzIHNpbmNlIDxzb21lIHRpbWU+ICh0byBiZSBzcGVjaWZpZWQsCj4gPiB3aXRoIGFuIG9sZCBh
dXRvYnVpbGRlciBmYWlsdXJlKS4gSW4gb3VyIGNhc2UsIHdlJ3JlIG1vc3RseSBpbnRlcmVzdGVk
Cj4gPiBpbiB1bmRlcnN0YW5kaW5nIHdoZXRoZXIgdGhhdCBmaXggc2hvdWxkIGJlIGJhY2twb3J0
ZWQgdG8gQnVpbGRyb290Cj4gPiAyMDI1LjAyLnguIFNvIGlmIHRoZSBwcm9ibGVtIGFscmVhZHkg
ZXhpc3RlZCBwcmlvciB0byBGZWJydWFyeSAyMDI1LCB3ZQo+ID4gd2lsbCB3YW50IHRvIGJhY2tw
b3J0IGl0Lgo+Cj4gVGhpcyBmYWlsdXJlIGhhcyBiZWVuIHByZXNlbnQgc2luY2UgdGhlIGludHJv
ZHVjdGlvbiBvZiB0aGUgY3J1Y2libGUKPiBzdXBwb3J0IGluIEJ1aWxkcm9vdC4KPgo+IEl0IGlz
IE9LIHRvIGJhY2twb3J0IHRoaXMgZml4IHRvIG9sZGVyIHJlbGVhc2VzLgoKUGluZy4gSSBrZWVw
IHJlY2VpdmluZyBlbWFpbHMgb2YgY3J1Y2libGUgYnVpbGQgZmFpbHVyZXMuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
