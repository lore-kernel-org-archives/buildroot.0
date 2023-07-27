Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF302EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F01184069;
	Thu, 27 Jul 2023 21:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F01184069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pE_f5oIEUEu; Thu, 27 Jul 2023 21:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A058283295;
	Thu, 27 Jul 2023 21:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A058283295
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 342B21BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B12C404D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B12C404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGsYKIw7I8UJ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:20:17 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 077954020B
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077954020B
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99b78fda9a8so200352966b.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 14:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690492815; x=1691097615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=soFesbqyItI75QaMpwO04BFMyqRRAkawm8pWzN9WnUw=;
 b=egtKozPysEqSG0LckCfmH10ZO5/jSHnJ+IDj5AygswOaSnkIKq1CxsqK/UuwRaW9pn
 lGeMj3hAwOF1T1XitAD7AyLUgjDvkKS82wXVBItgl8OFd6wPbPihskfgrjWTKL/wxsro
 QPsPyc/FmKxsy0g1UnWHkPsQvv7bhXZigs8LcvMr4NNhicJCbE0MVUA5zh1S9v7ATuZG
 aaucJyhtiOajxAbazUVZHSOrNsLl3GtNGiOxlnoWhPm5pFlgPhHcH14ehnyfbOG5B1dy
 GSOUMvq1i/cLbrzvWwTh5ECUvQ+0e0mJS5BBOVq7NtbwS0iQka2oPPW+E2lXAcC4FFNU
 nBwQ==
X-Gm-Message-State: ABy/qLYtZ3ZefU6KG9asi6dJe3ydpNV2dC1X2odOCIHXCLwzvtmjOZ3l
 Z9P/8PtGkKp1xlA7CDEpQH8+Vym5mpmqI+7Tq7E=
X-Google-Smtp-Source: APBJJlE7mKaiL9uu26pOqAz6zNxdpj0BKToowgt+kZ2fEj3zB43JWE6BlafWs+sjtpQv5SnHnO4Ntg==
X-Received: by 2002:a17:907:2c6b:b0:997:c5c3:32cc with SMTP id
 ib11-20020a1709072c6b00b00997c5c332ccmr318493ejc.66.1690492814604; 
 Thu, 27 Jul 2023 14:20:14 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 kb10-20020a1709070f8a00b00992b0745548sm1209847ejc.152.2023.07.27.14.20.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 14:20:13 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so199560166b.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 14:20:13 -0700 (PDT)
X-Received: by 2002:a17:906:3057:b0:99b:cf57:11e3 with SMTP id
 d23-20020a170906305700b0099bcf5711e3mr314367ejd.59.1690492813308; Thu, 27 Jul
 2023 14:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
 <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
In-Reply-To: <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
Date: Thu, 27 Jul 2023 14:20:02 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
Message-ID: <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690492815; x=1691097615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=soFesbqyItI75QaMpwO04BFMyqRRAkawm8pWzN9WnUw=;
 b=nlnUFclBNcBrG41uJRdvafUlOnZbGB2RNu7AebDz5Pw3YrKFTK5mu+k6dEE4Ozzbfr
 HwB3WuLEqjtDe4TYZTFVmB2IdVtMdrQ25JkQFddUnTJ6Rhb9EMx1QQf+6MIkmyqcdh3I
 3B2RgeOFYS0uZUCXEeBKT1LNTWVupb03NlyZgXg9b1qyv5zGy+HEUsal1qOC0GY7MM2E
 3DNfLL4WtfgkmU+Dn2WMF5gSKu9HSnpXSVnNTdZoxZb4OXTPzafa2P3tn2gOpwB5oxkF
 ZIzrBV7EDhCYexwueMgD7SoV/Qp+nDxVxVHajEy+PXpoEiwl+6b88nJzw7/PwkhdaSBf
 VzKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=nlnUFclB
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLAoKT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMTo0N+KAr1BNIFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPiBJdCBzZWVtcyB0aGUgZ28gYm9vdHN0cmFw
IGRvZXNuJ3Qgd29yayBldmVuIGFmdGVyIEdvIDEuMjAueCBtZXJnZSwKPiBzZWUgWzFdCgpJdCBk
ZWZpbml0ZWx5IHdvcmtzOyBJJ20gcnVubmluZyBtYW55IGJ1aWxkcyBhIGRheSB3aXRoIGl0LgoK
V2lsbCBjaGVjayBpbnRvIHdoeSB0aGlzIENJIGpvYiBmYWlsZWQgcmlnaHQgYXdheS4KCj4gPj4+
IGhvc3QtZ28gMS4yMC42IEJ1aWxkaW5nCj4gLi4uCj4gQnVpbGRpbmcgR28gdG9vbGNoYWluMSB1
c2luZyBbLi4uXXRlc3Qtb3V0cHV0L1Rlc3RNZW5kZXIvaG9zdC9saWIvZ28tMS4xOS4xMC4KPiBl
cnJvciBvYnRhaW5pbmcgVkNTIHN0YXR1czogZXhpdCBzdGF0dXMgMTI4Cj4gICAgICAgICBVc2Ug
LWJ1aWxkdmNzPWZhbHNlIHRvIGRpc2FibGUgVkNTIHN0YW1waW5nLgo+Cj4gWzFdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDcyNTE4NjUyNQoKSXMg
ImdpdCIgaW5zdGFsbGVkIGJ5IGFueSBjaGFuY2U/CgpUaGFua3MsCkNocmlzdGlhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
