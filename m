Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFF6EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 18:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2C5418DA;
	Mon, 26 Jun 2023 18:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D2C5418DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfH7K4e6LkXV; Mon, 26 Jun 2023 18:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27927410D2;
	Mon, 26 Jun 2023 18:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27927410D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D40A41BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD828405F5
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD828405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5eDoN9md1NB for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 18:23:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A0B24046A
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A0B24046A
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 18:23:12 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6a0d91e80so20869721fa.3
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803790; x=1690395790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+eMrFVRpj99Coz306V3+5D7Btcv8mG/iJNmeV8RpEw=;
 b=bVnCrQsg+0MRsSbUdC95yysa/SMqFN+a2PkNCXBN/ck+8FfkzvLY7I07sbI/hPlOJ4
 TdbXoiVqjcBuLPmvhrJcvGLFnet3FTebhZm3bN7MpwixMOkJCclF5ctVy6D5KwDgqjIU
 MWL4k/PQKfBjl1tLoaM/bzqjAXEHjKQOuCOGuW+SxN1/8K83kH1RZJjK1RZwIDPOk0Sp
 dNr+kUZtBaRlz/1o2mYj68iRdS1h47B0j4CUnVEyK4ORR6xBXKjL76G93BiycYGhfxEd
 CRdqGxXrIqwZl4cgHSIuG2Z80ApGc48KoIivBaubE+xhggkg0tpP+SPqsGdqahGd7Kzj
 Kt7g==
X-Gm-Message-State: AC+VfDxR3o9QXZrcQmvwO6cQ62Slb6raAjznzSlEw623kod0HVjIxAfw
 l+DiDIkcXQOIMCd+IrL2EjTx6LFb3QgluTOOZp8=
X-Google-Smtp-Source: ACHHUZ7/b7JU+P6IaR8BLO9pmDaTX3aHgYDnTqRGaGptvl7sFjhLMnbWSDdKMbyDY3RrWeiGSqf4Mg==
X-Received: by 2002:a2e:888b:0:b0:2b5:80e0:f18e with SMTP id
 k11-20020a2e888b000000b002b580e0f18emr11472474lji.3.1687803789983; 
 Mon, 26 Jun 2023 11:23:09 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 b18-20020aa7d492000000b0051da4b5bc8fsm283991edr.20.2023.06.26.11.23.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 11:23:09 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3fa7512e599so45761875e9.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:23:09 -0700 (PDT)
X-Received: by 2002:a7b:ca57:0:b0:3f9:b4a0:6062 with SMTP id
 m23-20020a7bca57000000b003f9b4a06062mr15910236wml.24.1687803788742; Mon, 26
 Jun 2023 11:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230606214556.174086-1-christian@aperture.us>
 <CADXxVSJN_s=UkATganO9Bdghec=fPuAdoLZAx2-V3M33UKd_Dw@mail.gmail.com>
In-Reply-To: <CADXxVSJN_s=UkATganO9Bdghec=fPuAdoLZAx2-V3M33UKd_Dw@mail.gmail.com>
Date: Mon, 26 Jun 2023 11:22:57 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pw8ZpZ43AeO3XVZ5ea4JhEN4TWbpErHYgCWL1Gv+JTqQ@mail.gmail.com>
Message-ID: <CA+h8R2pw8ZpZ43AeO3XVZ5ea4JhEN4TWbpErHYgCWL1Gv+JTqQ@mail.gmail.com>
To: Bryce Johnson <bryce@redpinelabs.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1687803790; x=1690395790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+eMrFVRpj99Coz306V3+5D7Btcv8mG/iJNmeV8RpEw=;
 b=qQATk2HO6Y+1yuIcP1NaFFBKkaxUVbn63FVQGlAfEos7SZuJshzMEjVclu0wCOMfV3
 D2b1kQqQJQ47Ubbum+L0mpZrkXpJ/RYS7XYhpEWGUYmFHufSw7/9/pbFc/JvqWpiNJys
 v7U337liEountqKqXQFTR9y/nQpHZP46hcttOZYpI2/lyJA3kG+SvKc8fu2jJdJPZguX
 1XEHFI0I4srIaeFBjczHvmbboZf5kO+RzzqS0CPmvBiuGTawDxy2Kx0kAfENutwPN0zb
 96QoXTb2/h7fxDKDVmbJS/02IF+LKLbAZYU52F86Lgo9jpLQPsWrfzZDFSfTLnoJ0BC9
 ea2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=qQATk2HO
Subject: Re: [Buildroot] [PATCH v6 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.10
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTE6MTjigK9BTSBCcnljZSBKb2huc29uIDxi
cnljZUByZWRwaW5lbGFicy5jb20+IHdyb3RlOgo+Cj4gQ2hyaXN0aWFuLAo+IEkgbmVlZGVkIHRv
IGFkZCBIT1NUX0dPX0JPT1RTVFJBUF9TVEFHRTFfREVQRU5ERU5DSUVTPXRvb2xjaGFpbiAgIHdp
dGgKPiBwZXIgcGFja2FnZSBidWlsZCBvcHRpb24gdG8gZ2V0IHRoZSBidWlsZCB3b3JraW5nLgo+
Cj4gQnJ5Y2UKClRoYW5rcyBmb3IgdGhlIHRpcCwgSSBoYWQgZHJvcHBlZCB0aGlzIGJlY2F1c2Ug
b2YgYSBwcmV2aW91cyBQUiByZXZpZXcKYnkgVGhvbWFzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnVpbGRyb290LzIwMjMwMzEyMjI1ODA2LjBiZjRiMGZkQHdpbmRzdXJmLwoKQ291bGQgeW91
IHByb3ZpZGUgdGhlIGVycm9yIHlvdSBzZWUgd2hlbiB0b29sY2hhaW4gZGVwZW5kZW5jeSBpc24n
dCB0aGVyZT8KClRob21hczogQ291bGQgeW91IHBsZWFzZSBoYXZlIGFub3RoZXIgbG9vayBhdCB0
aGlzIC0gdG9vbGNoYWluIGlzCnJlcXVpcmVkIGZvciBIT1NUQ0NfTk9DQ0FDSEUgZm9yIHdoYXRl
dmVyIHJlYXNvbi4KCj4gPiAgLSBEcm9wcGVkIGRlcGVuZGVuY3kgb24gdG9vbGNoYWluIGluIGdv
LWJvb3RzdHJhcC1zdGFnZTEKPiA+ICAtIERyb3BwZWQgdXBkYXRpbmcgc291cmNlcyB0aW1lc3Rh
bXBzIGluIGdvLWJvb3RzdHJhcC1zdGFnZXsxLDJ9Cj4gPiAgLSBVcGRhdGUgZ28tYm9vdHN0cmFw
LXN0YWdlMiB0byAxLjE5LjcKPiA+ICAtIERyb3AgdGhlc2UgY29tbWVudHMgYW5kIG1vdmUgdG8g
c2VwYXJhdGUgcGF0Y2g6Cj4gPiAgICAtIEZpeCB0eXBvIGluIGNvbW1lbnRzLgo+ID4gICAgLSBB
ZGp1c3RlZCBjb21tZW50IGJ1aWx0IGluIC0+IGJ1aWx0LWluLgo+ID4gICAgLSBBZGp1c3QgY29t
bWVudHMgcmVsYXRpbmcgdG8gY29weWluZyBzcmMvIHRvIGhvc3QvCj4gPiAgICAtIERyb3BwZWQg
b3V0ZGF0ZWQgY29tbWVudCByZWZlcnJpbmcgdG8gaXNzdWUgMjc3NS4KPiA+ICAtIFRoYW5rcyBU
aG9tYXMgZm9yIHRoZSByZXZpZXcuCgpUaGFua3MsCkNocmlzdGlhbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
