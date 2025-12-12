Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96A4D4417D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 11:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B81408177A;
	Fri, 12 Dec 2025 11:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2RdrlAew9Pu; Fri, 12 Dec 2025 11:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC76581B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765537579;
	bh=rQ+Mcv9nKncJvibl9251C3dQ48ElvMuP7Z1abSqzA9w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UQjmdaN7i/kl7vukOtm58ZiADVcLtQ5zn55n3tHTZN+mwyoQjK/uAy4ntVixhk2OQ
	 YwLGMcvSe9JJf3kyuWM0f0CVtEuS9zc91wL04IA8OkW9rmHwc1AKRjxTEyKq21QwqL
	 0+Jk7dmBzfIfjlndi148SwhqV0YoGrcl1XTEBWiIj7HrCLWZTN6e8nomyThLs0590n
	 GFHt3Pxhsntju3rHuOO1fCXA0gt24xysp0zhAdbmLGV/hiRasCxxwNXOqDn0oAxtFs
	 eZb+u8+T1I27+1ZwtcSdad+9NYOEXRJhZSxJMbORheQOGEVmp0ykqSeUJcO1T0TO5c
	 Fjwe4gYsi/CGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC76581B23;
	Fri, 12 Dec 2025 11:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB2592C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 11:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914A840292
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 11:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w25HplnR4lwW for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 11:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=alvaro.gamez@hazent.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87B9A401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B9A401C9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87B9A401C9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 11:06:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so9187735e9.2
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 03:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765537575; x=1766142375;
 h=mime-version:user-agent:content-transfer-encoding:date:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1zDol88M1JmIAALam4YBjjT24lz+fjFzDsE4H2aFpO0=;
 b=UxsnibOxnb9+OJjovQYdmOwzCJwug8+mz0rUd/GqQ1JRyOw1bvYsEWXSLPNqczDWBv
 Lu7MFV6BbMYQVIdEx2JZqVxQ3fwoH0wY5hKWlTHJWFatB484MMYNQOsJwqa9aBV43AuI
 Iu4bPzMJbvQHXie7pEJnDqG4Ep89LwOdcSfAXQ6Dci+0AfbI8q9twFLD8xquOyAF3lpa
 Sr7DlNidJpusDwGeeJ9vKdS/jiculoPJrzaW0QbfUs262/LeotBLXhGaR2R8AakQk+iI
 NZdA79gHQBlSzh+OYuR3MPBlgrRAdeTfQMwlCIykfGch5zlW366xDCvpRKjblLAdY5Yr
 dS8w==
X-Gm-Message-State: AOJu0YxhueckJUOFiUq+JWUYqr1nc7LQR867wEkoh343juNqvss2EOrr
 iah/41a2kIht2MzJtHcx5Qr0XKpvpe3U+JPTquOP3knTXYRpYeWA7DlP+fTayWad50azGbN5n1k
 vUGE=
X-Gm-Gg: AY/fxX75dvg3EFTy2OKFC27VzC80+Nd8F1hOzbkSRt/lS7sQcD022LA5JRWhNgdtRg2
 CqE8j3Jr2wxt2RXPThcl6uHDuKnyZPN45Wyr2dk94issW+vjPnQXXp+pZMjfVj0wGfBuaXJ4LgD
 mwE5/SxRXqCiPPaGIA4EH4bpAaneyghKx6oWSkm9QztwKoJEPW6yHi92TaU5W3MAWlY9YxEnnRC
 ep/96ua5+wVifua5KwlFIgcW+6MM50sjLB4dBgyo8W05y6gZMVflR8Jc375BOj1ZUoMA7uuu9l3
 ZTFqu9fTbL/HOZ+qnlqbJBN0tUEnVxRbvkgWjyoWrk3Vvu8HpKUEeuCA9ig/UU2pfVCBtR221qL
 K2uIynY5de7FkFB0ZyhzONZeqW2PKeq1+liluuK+3GOPw4RjlX6sdZ/kz1WKz5yBvH7GaVf21DI
 T00wGTOGxHOAKhuDBuzpnI
X-Google-Smtp-Source: AGHT+IEJd5NXwSXjCwf8mFTj2uT7KJx+c5OjvIQ+Uy2nZB4lCGvBDxT89jnK61a5bLlBFzv8dtmFCQ==
X-Received: by 2002:a05:600c:8115:b0:47a:7fd0:9eea with SMTP id
 5b1f17b1804b1-47a8f8a9c1bmr16861345e9.3.1765537574731; 
 Fri, 12 Dec 2025 03:06:14 -0800 (PST)
Received: from [192.168.2.3] ([109.227.150.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8f39c6sm25207995e9.14.2025.12.12.03.06.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 03:06:14 -0800 (PST)
Message-ID: <439ffc6f57ccba1e51776b2d319fdda995176f02.camel@hazent.com>
From: =?ISO-8859-1?Q?=C1lvaro?= "G. M." <alvaro.gamez@hazent.com>
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 12:06:13 +0100
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hazent-com.20230601.gappssmtp.com; s=20230601; t=1765537575; x=1766142375;
 darn=buildroot.org; 
 h=mime-version:user-agent:content-transfer-encoding:date:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1zDol88M1JmIAALam4YBjjT24lz+fjFzDsE4H2aFpO0=;
 b=3YwUybT2WOoxYZiSjnwevgCm7zvntmWaMPBOpG9/FrY1TMUtD+TWjzJ0IsTy2LtDny
 zKAwxdbEEyvwm4lxAlZEGyYOAYjxyprAfTk9aQFzUGdO8hslwXDZsk6zLNnWXzNpHXno
 OyRiUmM860qIN5LAK41qb6Z+M54l0Xl0c1I5iLE2DBCRSPyT82yuLCV3nDToHXqlZ1Gn
 HLOeNxIfUiSvcj1bfUN83xhSNmt1aTSExC+yZ98kTp+UWd+0MBjtFkaTGEStlLQXvDDc
 H2BEXnfWxtP0A6SZM5KnYDwjAKGoMtXgsuU0+mvk0scs+rWogLvKRdmS2HywZZawBMaS
 NIkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hazent.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hazent-com.20230601.gappssmtp.com
 header.i=@hazent-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3YwUybT2
Subject: [Buildroot] arm-trusted-firmware won't build because of circular
 dependency with uboot
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

SGkKCkknbSB1c2luZyBsYXRlc3QgbWFpbiBicmFuY2ggZnJvbSBnaXQgYW5kIEknbSB0cnlpbmcg
dG8gYnVpbGQgYSBzeXN0ZW0gZm9yIGEKWnlucW1wLiBUaGUgdGhpbmcgaXMgdGhhdCBJIGVuYWJs
ZSBhcm0tdHJ1c3RlZC1maXJtd2FyZSBhbmQgYXNrIGl0IHRvIGJ1aWxkIEJMMzEKZm9yIHVib290
LCBhbmQgYWxzbyBlbmFibGUgdWJvb3QgcmVxdWlyaW5nLCBvZiBjb3Vyc2UsIEFURl9CTDMxLiBI
b3dldmVyLCBhcm0tCnRydXN0ZWQtZmlybXdhcmUgd29uJ3QgYnVpbGQgYmVjYXVzZSBpdCBjYW4n
dCBmaW5kIG1raW1hZ2UsIGFuZCBpdCBjYW4ndCBmaW5kCm1raW1hZ2UgYmVjYXVzZSBpdCBkZWNp
ZGVzIHRvIGRyb3AgaG9zdC11Ym9vdC10b29scyBkZXBlbmRlbmN5LgoKSGVyZSdzIHRoZSBtZXNz
YWdlOgoKbWFrZVsyXTogQ2lyY3VsYXIgL2hvbWUvc3NsYXllci9Qcm95ZWN0b3MvQVJUL0RBUi9E
QVItCnVwZ3JhZGUuZ2l0L0RBUi9vdXRwdXQvYnVpbGQvYXJtLXRydXN0ZWQtZmlybXdhcmUtY3Vz
dG9tLy5zdGFtcF9jb25maWd1cmVkIDwtCmhvc3QtdWJvb3QtdG9vbHMgZGVwZW5kZW5jeSBkcm9w
cGVkLgoKQW5kIHRoZW4gaXQgZmFpbHMgYmVjYXVzZSBvZgovYmluL2Jhc2g6IGxpbmUgMTogL2hv
bWUvc3NsYXllci9Qcm95ZWN0b3MvQVJUL0RBUi9EQVItCnVwZ3JhZGUuZ2l0L0RBUi9vdXRwdXQv
aG9zdC9iaW4vbWtpbWFnZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQoKU28gaSd2ZSB0cmll
ZCB0byB0cmFjZSBiYWNrIHRoZSBjaXJjdWxhciBkZXBlbmRlbmN5OgoKJCBtYWtlIGFybS10cnVz
dGVkLWZpcm13YXJlLXNob3ctZGVwZW5kcwpob3N0LWNjYWNoZSBob3N0LXNrZWxldG9uIGhvc3Qt
dWJvb3QtdG9vbHMgc2tlbGV0b24gdG9vbGNoYWluCgokIG1ha2UgaG9zdC11Ym9vdC10b29scy1z
aG93LWRlcGVuZHMKaG9zdC1jY2FjaGUgaG9zdC1kdGMgaG9zdC1nbnV0bHMgaG9zdC1vcGVuc3Ns
IGhvc3Qtc2tlbGV0b24gdWJvb3QKCm1ha2UgdWJvb3Qtc2hvdy1kZXBlbmRzCmFybS10cnVzdGVk
LWZpcm13YXJlIGhvc3QtY2NhY2hlIGhvc3QtZHRjIGhvc3QtZ251dGxzIGhvc3Qtb3BlbnNzbCBo
b3N0LXBrZ2NvbmYKaG9zdC1weXRob24tanNvbnNjaGVtYSBob3N0LXB5dGhvbi1weWVsZnRvb2xz
IGhvc3QtcHl0aG9uLXB5bGliZmR0IGhvc3QtcHl0aG9uLQpweXlhbWwgaG9zdC1weXRob24tc2V0
dXB0b29scyBob3N0LXB5dGhvbi15YW1sbGludCBob3N0LXB5dGhvbjMgaG9zdC1za2VsZXRvbgpo
b3N0LXV0aWwtbGludXggc2tlbGV0b24gdG9vbGNoYWluIHhpbGlueC1lbWJlZGRlZHN3CgpTbywg
QVRGIGNvcnJlY3RseSBkZXBlbmRzIG9uIGhvc3QtdWJvb3QtdG9vbHMsIHdoaWNoIGluIHR1cm4g
c2VlbXMgdG8gZGVwZW5kIG9uCnVib290LCBhbmQgdWJvb3QgZGVwZW5kcyBvbiBhcm0tdHJ1c3Rl
ZC1maXJtd2FyZSBiZWNhdXNlIGl0IG5lZWRzIGl0IHRvIGdldCBCTDMxCmZpbGUuIE5vdywgd2h5
IGRvZXMgaG9zdC11Ym9vdC10b29scyBkZXBlbmQgb24gdWJvb3Q/IEkgZm91bmQgdGhpcyBjb21t
ZW50IG9uCnVib290LXRvb2xzLm1rIHRvIGV4cGxhaW4gaXQ6CgppZmVxICgkKEJSMl9QQUNLQUdF
X0hPU1RfVUJPT1RfVE9PTFNfRU5WSU1BR0UpLHkpCgpVQk9PVF9UT09MU19HRU5FUkFURV9FTlZf
RklMRSA9ICQoY2FsbApxc3RyaXAsJChCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0VOVklN
QUdFX1NPVVJDRSkpCgojIElmIEJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfRU5WSU1BR0Vf
U09VUkNFIGlzIGxlZnQgZW1wdHksIHdlCiMgd2lsbCB1c2UgdGhlIGRlZmF1bHQgZW52aXJvbm1l
bnQgcHJvdmlkZWQgaW4gdGhlIFUtQm9vdCBidWlsZAojIGRpcmVjdG9yeSBhcyBib290LWVudi1k
ZWZhdWx0cy50eHQsIHdoaWNoIHJlcXVpcmVzIGhhdmluZyB1Ym9vdCBhcyBhCiMgZGVwZW5kZW5j
eS4KIyBJZiBCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0VOVklNQUdFX1NPVVJDRSBpcyBu
b3QgZW1wdHksIGlzCiMgbWlnaHQgYmUgcmVmZXJyaW5nIHRvIGEgZmlsZSB3aXRoaW4gdGhlIFUt
Qm9vdCBzb3VyY2UgdHJlZSwgc28gd2UKIyBhbHNvIG5lZWQgdG8gaGF2ZSB1Ym9vdCBhcyBhIGRl
cGVuZGVuY3kuCmlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVCkseSkKSE9TVF9VQk9PVF9UT09MU19E
RVBFTkRFTkNJRVMgKz0gdWJvb3QKCiMgSGFuZGxlIHRoZSBjYXNlIHdoZXJlIEJSMl9QQUNLQUdF
X0hPU1RfVUJPT1RfVE9PTFNfRU5WSU1BR0VfU09VUkNFCiMgaXMgbGVmdCBlbXB0eSwgdXNlIHRo
ZSBkZWZhdWx0IFUtQm9vdCBlbnZpcm9ubWVudC4KaWZlcSAoJChVQk9PVF9UT09MU19HRU5FUkFU
RV9FTlZfRklMRSksKQpVQk9PVF9UT09MU19HRU5FUkFURV9FTlZfRklMRSA9ICQoQEQpL2Jvb3Qt
ZW52LWRlZmF1bHRzLnR4dApkZWZpbmUgSE9TVF9VQk9PVF9UT09MU19HRU5FUkFURV9FTlZfREVG
QVVMVFMKICAgICAgICBDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9TUykiIFwKICAgICAgICAg
ICAgICAgICQoVUJPT1RfU1JDRElSKS9zY3JpcHRzL2dldF9kZWZhdWx0X2VudnMuc2ggXAogICAg
ICAgICAgICAgICAgJChVQk9PVF9TUkNESVIpIFwKICAgICAgICAgICAgICAgID4gJChVQk9PVF9U
T09MU19HRU5FUkFURV9FTlZfRklMRSkKZW5kZWYKZW5kaWYgIyBVQk9PVF9UT09MU19HRU5FUkFU
RV9FTlZfRklMRQplbmRpZiAjIEJSMl9UQVJHRVRfVUJPT1QKCgpTby4uLiBob3cgc2hvdWxkIHdl
IHNvbHZlIHRoaXM/IFRoZSBlZmZlY3QgaXMgdGhhdCBlbmFibGluZwpCUjJfUEFDS0FHRV9IT1NU
X1VCT09UX1RPT0xTX0VOVklNQUdFIG1ha2VzIGl0IGltcG9zc2libGUgdG8gYnVpbGQgdWJvb3Qg
YW5kCkFURi4gSSByZW1vdmVkIHRoaXMgb3B0aW9uIGFuZCBpdCBzdWNjZWVkZWQuCgpUaGFua3Ms
IGJlc3QgcmVnYXJkcwoKCgotLSAKw4FsdmFybyBHLiBNLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
