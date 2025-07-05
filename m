Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4DDC83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 21:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DCF86134D;
	Sat,  5 Jul 2025 21:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UG5W0236fsuQ; Sat,  5 Jul 2025 21:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C23061352
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C23061352;
	Sat,  5 Jul 2025 21:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2CCB15F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E02F861352
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzBqVEQv0SVv for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 21:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=jdknight@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F7F76134D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7F76134D
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F7F76134D
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:44:18 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60c79bedc19so3127709a12.3
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 14:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751751856; x=1752356656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FseS+03Z6A1TF2ly+eRlb7TnVMC8l/qV3qXpCXTpns=;
 b=U7alx6Z5+idEBq9mYxUDT4dwicEBnyGCPG6iWJkHSjzBxpE/iIdCbqcVgKgq8P721l
 2heg6thvPz34PJpS9Xlt2n6bSqXwegIVbur+lAKGcIKeewlp4lD+0WR8jO2j/+8Mk4zf
 uvy5sQuyLjjv19GGtf4Uic032nKX6iy/2MAqmsalkz7+sw+UHQ1FAdooiCxKysg/559s
 tszN9CWOaNwj8Qse07g1wRLr2fpR85r6Vz7DmdcLe3sIZ+af9ZhW2akqcfJRtdXzZWLE
 vv/dDow5vFKEQyMQW2JG/RLARHSq5hkSgH5bl2By4RU56SVMX4abKczbSGq2F2OKwjp+
 qbSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Xf8FtOp4P1lhitSvl8l1DbdZ/UGXjEza+BfM3TuCzbI1R0JQM6bKpn+sGkq52HsqpJWPU0mfFco=@buildroot.org
X-Gm-Message-State: AOJu0YxLWjjqJMFeC8ZAhRGSdOQGlEx5I6ZhoDWLtTQz2y8YKBX/qWZT
 MnTILoYlzvnNrvEA9qTWekmzrH1nmuXAN7iLZOKa0kLEXT5YvlPEVoRZ+TMV1ZPbcALXvW9kNSr
 45NYBoRMo+TXciOa55/EsfQr/J7Fy4WfLvBmkYeM8LQ==
X-Gm-Gg: ASbGncudS+Mt0gCqFMFng2Dh7ZsvxL+VKCfCxSMt5C8w122qiRAidgz3a89WIjeJIm6
 247r112Me97/FgS92HvVx3w3viLLKwf7Z0f8akB59y0wX6D8AaGA25Mduk8aIOevSyTEZo9j9Nz
 82dJqSfJhBoJs4CuWybYVmA/sLznETV2IMOZMytEMVx6M=
X-Google-Smtp-Source: AGHT+IH1ogKqFx6jCAiZFTVpZFeqgf5qmom8tC+pFMbeYOABrh4gCs1g+337Viic+1AF2gbeyYtYhJuxu4Xi3LZAf2U=
X-Received: by 2002:a05:6402:2355:b0:608:f399:d73b with SMTP id
 4fb4d7f45d1cf-60fd30da959mr6852092a12.15.1751751855885; Sat, 05 Jul 2025
 14:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
 <CALAjcgXUyyLUmB56DUEL67m3N+=iGQbOifH3asxZEjZ3nCj81A@mail.gmail.com>
 <CANLo3Jg0GBwx_MPyb+Efmj3H+b6ea7kkQ3v=qQ-NBZTuZoZr-g@mail.gmail.com>
 <bc8dbfe0-ab69-4c04-9efc-eaae23dbcad8@smile.fr>
In-Reply-To: <bc8dbfe0-ab69-4c04-9efc-eaae23dbcad8@smile.fr>
From: James Knight <git@jdknight.me>
Date: Sat, 5 Jul 2025 17:44:05 -0400
X-Gm-Features: Ac12FXwSN4JVVlWBHa1bMpjfhcPBGMvOA94vOC3M-wX9uO5fuIzLG8Ibds5R-n0
Message-ID: <CALAjcgV6iLvfhHmDeu40N-vckzRKDOXUawB+t09H1+ApGa0cvg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>, 
 buildroot <buildroot@buildroot.org>, Daniel Lang <dalang@gmx.at>, 
 Joseph Kogut <joseph.kogut@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 James Knight <git@jdknight.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751751856; x=1752356656;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FseS+03Z6A1TF2ly+eRlb7TnVMC8l/qV3qXpCXTpns=;
 b=yw3ASApjeCkLOFZ7OD7pNeR7B3hjt8UI2SL8kOw6fx/sR4k9GnD9g2dHHNnDe9rxPP
 xduuLIgGgBgHlyOJD1TfDQsSWArUHSFxfHmeaJeQlWxoEVEZHOq0LIN9U6R7utNXOv18
 dGqGg1b2ENkFHVowxuWnIFf0M7M/umPAOeLiwDZmHuVgYHBY5ODk3MOQjU5Oweyf/yi3
 U45kKDGnF1hX7MookJBnjwrr/BQp17/PNJUnUID8NbGH6WDa/furjpXyTvGVaI33V72+
 SPM1XD8YNxB8UmNleHpYkxxg3gSzB8+/nyevl9r9ew9Q1HgLhcbgtNW4TEHxseNCwdbW
 sqNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yw3ASApj
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix
 gcc-install-dir in clang
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

Um9tYWluLAoKT24gU2F0LCBKdWwgNSwgMjAyNSBhdCA1OjA34oCvUE0gUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IFBsZWFzZSwgcmVwbHkgd2l0aDoKPgo+IFRl
c3RlZC1ieTogSmFtZXMgS25pZ2h0IDxqZGtuaWdodEBqZGtuaWdodC5tZT4KClNvcnJ5LCB0aGF0
IHdhcyBteSBpbnRlbnQuIEkgd2FzIHRyeWluZyB0byBhZGp1c3QgdGhlIEZyb20gRW1haWwgYW5k
CmFjY2lkZW50YWxseSBoaXQgc2VuZCB3aGljaCBkaWRuJ3QgdXNlIHRoZSBFbWFpbCBhc3NvY2lh
dGVkIHdpdGggdGhlCm1haWxpbmcgbGlzdC4uLiBhbmQgZGlkbid0IHdhbnQgdG8gcHVzaCBhbm90
aGVyIEVtYWlsIGFnYWluIHRvIGFsbC4KU29ycnkgZm9yIGFkZGluZyBleHRyYSBub2lzZS4KClRl
c3RlZC1ieTogSmFtZXMgS25pZ2h0IDxnaXRAamRrbmlnaHQubWU+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
