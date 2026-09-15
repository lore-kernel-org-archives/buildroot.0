Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612FEC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FEE64050C;
	Tue, 15 Sep 2026 10:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QczwhfiJ6vx; Tue, 15 Sep 2026 10:21:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4CBBB4057E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789467674;
	b=lzC9k2q/wynnOdXyyjkvDdq+96nRg7w39nq+VLWa85lk6jhL13TgVw/YR7qKcQUDr80u
	 GEMBi3sqOqUZfZTsXMSMELHI6epJuGcNAs5NOmsn9XgJawUhLRNyk4TQ/MDVtqrhI9lzl
	 RX+BNF8MKKGoijtLnNMCxme1K8nmjQqvbvdLV/pHDSmFTyIlX7D8TK3kPyBnUBoQlXSlV
	 IVVlxXtBO0Oj1rEOZD7AT1Tk1nWjJz7Vn5SH02+72LjnfaxTB/EaC1SzzJ3FFzsW22w0k
	 yTNg+T3FawQ1K8AVdGSuQwCRbOv95r5wPz3p+WFshnHF4v2YRvZZSViMYvlkqnxMTyA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789467674;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=dCq/dYr9z76fj9YSTGZl5OHwWa4FTLX2OgXT5aFlcXo=;
	b=LblHuFSlOtmFJWJP+9vPbNUhjeI0GEHJnsGGSuYqFvK0j2GNrZWmaSUWSr4SOHQpWx3B
	 VEmEWu8uvZWpk8xygyU48i0oa41/wEBYpUJkPa2ou3plreQSm/X5b7SdutZjlQP0Eb6Io
	 BqdeaDykxGX/iT4pTdh1rhAvubX0NxogQ1Jj8Mq3aFmfIUKlWSiBiHIUUOWx6sQ0lUc1j
	 VJIqAcmD/k65RhETsc0hVNUwwy0j/VQC046j8wFqF6gClGyH9JENIu/r1zvhsy8HXupIR
	 7Mf0XHbMYUS7BlhmSUGqpvJstylJvPr3u38wI5cf7b8fmi6FVwa4JaO6eP/d4NOdORA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oike+tds;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789467674;
	bh=dCq/dYr9z76fj9YSTGZl5OHwWa4FTLX2OgXT5aFlcXo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0kq3pqG9+eWTHQPFK9OEWhEHscUmGuVbxi+2A3jL0FcBwBNCVqbYV6eCMCVtHNdW
	 ar4Dk20vEiYwTMI4Qwss/YnBbuEYfdD5KsiQd+rytEzijeZX4paR3jXlrO4dRsqydp
	 rTJ1UGffgAOmKhJ9gB5vkldLJmuYuYBOZWu+oy7FzA4+PPS3+jFzULuZKzKux8DmGk
	 9hWXD1sS0c1Sh5oDnXecbE6+jKFWx23g7bZ35RNzc+yBZ4OYQMWR0ythYPu4utl6P3
	 UBE+uk9hIpJfJfEsN2U2ghQvAZ/zMqCud74x3gUDjOS69EWG3EtphnfqhQ66nqf1n2
	 y6PbTRioytC9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CBBB4057E;
	Tue, 15 Sep 2026 10:21:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C22259
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC38B4057E
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6EvxzGJGKj7 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 10:21:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 546254050C
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789467667;
 b=Mbs0qWI4wAUWvJiJ0MCBImUb/srr3co1c8nqWKONfzngh6hfRnanWnsB1IFqvkik24yc
 Hggm4ykeQkVAAVNpcDwVIZJD+AkqoiLlsujSXxQtKWymj6lDnRfgptPaqmtpvjiOqWV+Q
 CK5aqHbxe+CKTCZLr40JFu3PuBxxDyCTVmQnSGjY4Jk6i7pwGV7e3BQDDMrb/o8XWkZkL
 +bk1lCEG4N4B/91S8FlHbddQ8m2E6MokL02wQaZye6WFO0+S1pynT7FiRRKjqGJydRZGE
 ZSFLclX0VqaNM9l6Q46FUUPrrQtJHZHgLr/urbb0zou9PA6RUdpURnuhk/U+8VHiGvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789467667;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=pjtn0ANcAryRB1UxxD/GLATVfeMI6x/txled1P5mIw0=;
 b=fQsfwg4lPvzrexRE6fpsq7mFgNY1YOGQDeKSZpkgVc9myQpBssPxr6jJx9h+hLsXPp5F
 0+ZXVgbiEFHOq4LPA5dCNSg2486mdnsTR02YxrfzpQWRaXDUXbveSWAke+AWrkoWckFDI
 7LTFcHMDT2sJ0UhSgoWPx2L8G0vRkd9AfZAWEq6w8sQ5XLOWKwX22Hqc1Uk9Ve7UPzwKp
 PucztCxAQRzL/fPufWmeUYCWYShSD+R0hU5bjRPt3zexmU866zmrI2p4X5kMBxdZexxmR
 ATa9hFKWyuqZpJeImeVGvFrZN1zLj0JCn0Va9EH1HUhaPiF0rPcWi+xPCwaD6Y+1neQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oike+tds; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oike+tds
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 546254050C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:21:05 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c29385fb97cso43642466b.3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 03:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467664; cv=none;
 d=google.com; s=arc-20260327;
 b=Pjngtbxr5/bjxmeTBPBmmnqMnXBhgJ/9oyOjnyuu5WGMy3HJKYyx311JRaEnimAVHw
 Ps8t4OB9ft2UW9CtxU3INFw2EtZpPDI5iIPFN1r6aDIKlwXjfHr/eGrtwUTD/yX6fm3A
 C/5o37gKKDAviNzRtefQTQdKtyZFS5VJuN9ikDZJ2GR9dXA/DkT5lN++dhsNRtGoEyaS
 3UM171KqtjYwEuvo37arKaSG3a/pCdR13IvOzpyQxil93yHL1AGpCEPVmerI0a/NPofl
 eLOLZegnV150ZNDRxglkcHPT/HMP3+Dggbb7HK6CsFWH/VPqceefGHjvYU8fW43J45or
 yPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pjtn0ANcAryRB1UxxD/GLATVfeMI6x/txled1P5mIw0=;
 fh=v39vw1RVa+etVr36IJY6HNIwUwZAMQh/gk9zL4km/aA=;
 b=Hpadt5HuzSYR67bloWV0RtOUPaF++LmmqEkhjJpPkGafkzB5zD3MxnkxxHj6RNqSpA
 TlaK1212DrOoHN9RR/wmu89FPUtivPzv+mvCNfutndGnEPKKo56EuiJJUUyOpvJYQTyf
 O01EaSQJhY7RHLRUI3lC+RCjysJ7lnsYcg3NPxeuF2u6SkLW8tDBj4TfuLwjcC3FJUWS
 aABuTj5A9mDRyoDCWoSuLPSnKJwoy5emvvRo2dnEm4C2qgGT2X+S6ce26ATe1r7q0AIe
 cLwCB8AI0p4w1m5S4ex1fO/6c0xup/thmA2u3ASTiIiIN9s35d3H6nPDV3S0qOzlOH2q
 2gdw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1789467664; x=1790072464;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pjtn0ANcAryRB1UxxD/GLATVfeMI6x/txled1P5mIw0=;
 b=oike+tdsmshnqNfDtpqRFWSq1int25iCZ0BYFVthsMxq/IhBlYmOI4G7gDZ0rroaii
 GGbGCOxXMb5I6qYvabnCyJV3AMm8zDR05GR4h1nxwmB9p4rffAcqYnn6X15JHj52l4dJ
 xG9Cd/XKByvskAB6MNjwCxsP79jtVYvRVwx24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789467664; x=1790072464;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pjtn0ANcAryRB1UxxD/GLATVfeMI6x/txled1P5mIw0=;
 b=VsdUW3ef+K1IRJG/6T566Xnn+H8PKfDC/DqvZ01Gztr87kx95rCGjXhN3uX9Vl02XV
 BfprKBDjfmUmp4OTjYHThSpDMRw6pIdEIVNpIR/0Gl9mr1geXONPwYB1spPfjCWR4/wW
 TVHkJFEG96OqMbt/tB00OplJywA5HKvRoTbHWRC2Gl/tJQlDUGFJCnSF9Ws0T/z03VyS
 0Fs6/PaKDNkPEbmRRjqE2eAj/qNlkwQHWdeHDzYzgxmfOhu8dyFoA+spfjQW8bqMD3Tq
 PrXwG4Rv/qEwJDz9oUTF6bBv2EU5fTh7sMjappimvldwKwn+PV/7o06CTzfEhu/FWEiS
 NN0g==
X-Gm-Message-State: AFuF++naiGPHzr6zrql5V8LI1h5ThvI7ZAQX03g8HAn8/7wazXTJadeS
 rqyKeGG01J7v678moSIelAutkKuV4bko5VobV0pMxKP2ZjNSDvqVbSHsBpTE8sfIaW/bnQCN0ye
 0seXgDulFYNY8G1OzDJ+sOuOKH2MH0tZ+U01lBLkQFg==
X-Gm-Gg: AYBFou3EIeJg1zfqYX186s5/i0ZvRLMtRZqxe5d1cR2Ol0IK3JrmYpJGReftOunW60/
 XfFdr9k8ZO00xUFmhb1t+DrA4NvTlQtqU+j2oBJO+GurluhMXLWR7DA0jeqh1gk49Sk65KIw7b7
 W5UhvZZjbjmAVP5XCrlWPkUbkTr7zSPVSLfRCD04B57IUovPWV5ldCOT+PAd6rakdrZZo9SnGKf
 4xF8DSIYSkPf8kvvTBB7RlsAFewUBRA4CK7P1gKG9BMF6aiOwbwdSuAtLgmJdMJ2Ec87wHj3BMf
 412ITPWKpEfoLGhsHmTkADgktu2ZJ813ljUl/YEhCqkr4Cw88tOX90uw+IZehUu1X3UsJz0GIP8
 K1i9QWvoMXCkhFYc2d/gVqd9Ej66+R6SQUl8nfwUZmOJC4A==
X-Received: by 2002:a17:907:1c0c:b0:c16:1290:11a7 with SMTP id
 a640c23a62f3a-c29b83c2175mr524564966b.1.1789467662902; Tue, 15 Sep 2026
 03:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260914210536.3378924-1-bernd@kuhls.net>
In-Reply-To: <20260914210536.3378924-1-bernd@kuhls.net>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 15 Sep 2026 12:20:50 +0200
X-Gm-Features: AcwNN1UPbvpLGTM92UFLeYxH2gb4LZBbqQhDAqcWIupyVSL1cAOvwej0WwdRXHk
Message-ID: <CAHDQB6NOuBJQFmwXoiO06i32Rv2MP9wZwV2pH4iZs5w6FfsTFw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH/RFC 1/1] Remove mender packages
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
Content-Type: multipart/mixed; boundary="===============3427709601527839876=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3427709601527839876==
Content-Type: multipart/alternative; boundary="000000000000627d9b065b82e8ad"

--000000000000627d9b065b82e8ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernd;

At this point I agree. I have submitted several patches to try and bring
these packages, and especially
mender itself up to C++, and the patch series are ignored.

I maintain a branch with modern mender support located here:
https://github.com/mendersoftware/buildroot-mender


On Mon, 14 Sept 2026 at 23:05, Bernd Kuhls <bernd@kuhls.net> wrote:

> Building the current mender version 3.5.3 with OpenSSL 4.0.2 is broken:
>
> hostname.c: In function 'do_check_string':
> hostname.c:248:15: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   248 |         if (!a->data || !a->length)
>       |               ^~
> hostname.c:248:27: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   248 |         if (!a->data || !a->length)
>       |                           ^~
> hostname.c:252:34: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   252 |                 if (cmp_type !=3D a->type)
>       |                                  ^~
> hostname.c:255:39: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   255 |                         return equal(a->data, a->length, b, blen)=
;
>       |                                       ^~
> hostname.c:255:48: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   255 |                         return equal(a->data, a->length, b, blen)=
;
>       |                                                ^~
> hostname.c:256:22: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   256 |                 if (a->length =3D=3D (int)blen && !memcmp(a->data=
, b,
> blen))
>       |                      ^~
> hostname.c:256:56: error: invalid use of incomplete typedef 'ASN1_STRING'
> {aka 'struct asn1_string_st'}
>   256 |                 if (a->length =3D=3D (int)blen && !memcmp(a->data=
, b,
> blen))
>       |                                                        ^~
> hostname.c: In function 'do_x509_check':
> hostname.c:338:14: warning: assignment discards 'const' qualifier from
> pointer target type [-Wdiscarded-qualifiers]
>   338 |         name =3D X509_get_subject_name(x);
>       |              ^
> hostname.c:343:20: warning: assignment discards 'const' qualifier from
> pointer target type [-Wdiscarded-qualifiers]
>   343 |                 ne =3D X509_NAME_get_entry(name, i);
>       |                    ^
> hostname.c:344:21: warning: assignment discards 'const' qualifier from
> pointer target type [-Wdiscarded-qualifiers]
>   344 |                 str =3D X509_NAME_ENTRY_get_data(ne);
>       |                     ^
>
> shim.c: In function 'X_SSLv3_method':
> shim.c:484:16: error: implicit declaration of function 'SSLv3_method'; di=
d
> you mean 'SSLv23_method'? [-Wimplicit-function-declaration]
>   484 |         return SSLv3_method();
>       |                ^~~~~~~~~~~~
>       |                SSLv23_method
> shim.c:484:16: error: returning 'int' from a function with return type
> 'const SSL_METHOD *' {aka 'const struct ssl_method_st *'} makes pointer
> from integer without a cast [-Wint-conversion]
>   484 |         return SSLv3_method();
>       |                ^~~~~~~~~~~~~~
> shim.c: In function 'X_TLSv1_method':
> shim.c:491:16: error: implicit declaration of function 'TLSv1_method'; di=
d
> you mean 'X_TLSv1_method'? [-Wimplicit-function-declaration]
>   491 |         return TLSv1_method();
>       |                ^~~~~~~~~~~~
>       |                X_TLSv1_method
> shim.c:491:16: error: returning 'int' from a function with return type
> 'const SSL_METHOD *' {aka 'const struct ssl_method_st *'} makes pointer
> from integer without a cast [-Wint-conversion]
>   491 |         return TLSv1_method();
>       |                ^~~~~~~~~~~~~~
> shim.c: In function 'X_TLSv1_1_method':
> shim.c:496:16: error: implicit declaration of function 'TLSv1_1_method';
> did you mean 'X_TLSv1_1_method'? [-Wimplicit-function-declaration]
>   496 |         return TLSv1_1_method();
>       |                ^~~~~~~~~~~~~~
>       |                X_TLSv1_1_method
> shim.c:496:16: error: returning 'int' from a function with return type
> 'const SSL_METHOD *' {aka 'const struct ssl_method_st *'} makes pointer
> from integer without a cast [-Wint-conversion]
>   496 |         return TLSv1_1_method();
>       |                ^~~~~~~~~~~~~~~~
> shim.c: In function 'X_TLSv1_2_method':
> shim.c:504:16: error: implicit declaration of function 'TLSv1_2_method';
> did you mean 'X_TLSv1_2_method'? [-Wimplicit-function-declaration]
>   504 |         return TLSv1_2_method();
>       |                ^~~~~~~~~~~~~~
>       |                X_TLSv1_2_method
> shim.c:504:16: error: returning 'int' from a function with return type
> 'const SSL_METHOD *' {aka 'const struct ssl_method_st *'} makes pointer
> from integer without a cast [-Wint-conversion]
>   504 |         return TLSv1_2_method();
>       |                ^~~~~~~~~~~~~~~~
>
> This error blocks the update to OpenSSL 4.0.2 in buildroot.
>
> Upstream rewrote the package in c++ in version 4.0 and will not provide
> updates for the version used in buildroot:
>
> https://hub.mender.io/t/mender-to-rewrite-client-using-c-and-retain-go-fo=
r-its-backend/5332
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/67c6d1b12c430313c492d=
c66b2280d447917feb5
>
> To not block the OpenSSL bump we remove the mender package and its
> dependencies.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> To start the discussion for a possible bump of OpenSSL to 4.0.2 I split
> this patch from my local series because it is from my POV the biggest
> obstacle, other packages have fewer to no dependencies and are not
> (well) maintainted upstream.
>
> This patch depends on
>
> https://patchwork.buildroot.org/project/buildroot/patch/20260914192045.16=
48017-1-bernd@kuhls.net/
> from the Boost 1.92.0 series.
>
>  .checkpackageignore                           |   2 -
>  Config.in.legacy                              |  35 +++
>  DEVELOPERS                                    |   3 -
>  board/mender/x86_64/genimage-efi.cfg          |  43 ---
>  board/mender/x86_64/linux.config              |  64 -----
>  board/mender/x86_64/mender_grubenv_defines    |  25 --
>  board/mender/x86_64/overlay/etc/fstab         |   7 -
>  .../x86_64/overlay/etc/mender/mender.conf     |  11 -
>  board/mender/x86_64/post-build.sh             |  48 ----
>  board/mender/x86_64/post-image-efi.sh         |  92 -------
>  board/mender/x86_64/readme.txt                |  69 -----
>  configs/mender_x86_64_efi_defconfig           |  54 ----
>  package/Config.in                             |   4 -
>  package/Config.in.host                        |   1 -
>  package/mender-artifact/Config.in.host        |  19 --
>  package/mender-artifact/mender-artifact.hash  | 106 --------
>  package/mender-artifact/mender-artifact.mk    | 118 ---------
>  package/mender-connect/Config.in              |  34 ---
>  package/mender-connect/S43mender-connect      |  53 ----
>  package/mender-connect/mender-connect.hash    |  35 ---
>  package/mender-connect/mender-connect.mk      |  60 -----
>  package/mender-grubenv/Config.in              |  43 ---
>  package/mender-grubenv/mender-grubenv.hash    |   3 -
>  package/mender-grubenv/mender-grubenv.mk      |  90 -------
>  package/mender-update-modules/Config.in       | 250 ------------------
>  .../mender-update-modules.hash                |   3 -
>  .../mender-update-modules.mk                  |  77 ------
>  package/mender/Config.in                      |  45 ----
>  package/mender/S42mender                      |  44 ---
>  package/mender/device_type                    |   1 -
>  package/mender/mender-client.service          |  13 -
>  package/mender/mender.conf                    |  11 -
>  package/mender/mender.hash                    |  47 ----
>  package/mender/mender.mk                      | 110 --------
>  package/mender/readme.txt                     | 132 ---------
>  package/mender/server.crt                     |  22 --
>  support/testing/tests/package/test_mender.py  |  72 -----
>  .../tests/package/test_mender/post-build.sh   |  25 --
>  .../rootfs-overlay/etc/mender/artifact_info   |   1 -
>  .../rootfs-overlay/usr/bin/fw_printenv        |   6 -
>  40 files changed, 35 insertions(+), 1843 deletions(-)
>  delete mode 100644 board/mender/x86_64/genimage-efi.cfg
>  delete mode 100644 board/mender/x86_64/linux.config
>  delete mode 100644 board/mender/x86_64/mender_grubenv_defines
>  delete mode 100644 board/mender/x86_64/overlay/etc/fstab
>  delete mode 100644 board/mender/x86_64/overlay/etc/mender/mender.conf
>  delete mode 100755 board/mender/x86_64/post-build.sh
>  delete mode 100755 board/mender/x86_64/post-image-efi.sh
>  delete mode 100644 board/mender/x86_64/readme.txt
>  delete mode 100644 configs/mender_x86_64_efi_defconfig
>  delete mode 100644 package/mender-artifact/Config.in.host
>  delete mode 100644 package/mender-artifact/mender-artifact.hash
>  delete mode 100644 package/mender-artifact/mender-artifact.mk
>  delete mode 100644 package/mender-connect/Config.in
>  delete mode 100644 package/mender-connect/S43mender-connect
>  delete mode 100644 package/mender-connect/mender-connect.hash
>  delete mode 100644 package/mender-connect/mender-connect.mk
>  delete mode 100644 package/mender-grubenv/Config.in
>  delete mode 100644 package/mender-grubenv/mender-grubenv.hash
>  delete mode 100644 package/mender-grubenv/mender-grubenv.mk
>  delete mode 100644 package/mender-update-modules/Config.in
>  delete mode 100644
> package/mender-update-modules/mender-update-modules.hash
>  delete mode 100644 package/mender-update-modules/mender-update-modules.m=
k
>  delete mode 100644 package/mender/Config.in
>  delete mode 100644 package/mender/S42mender
>  delete mode 100644 package/mender/device_type
>  delete mode 100644 package/mender/mender-client.service
>  delete mode 100644 package/mender/mender.conf
>  delete mode 100644 package/mender/mender.hash
>  delete mode 100644 package/mender/mender.mk
>  delete mode 100644 package/mender/readme.txt
>  delete mode 100644 package/mender/server.crt
>  delete mode 100644 support/testing/tests/package/test_mender.py
>  delete mode 100755 support/testing/tests/package/test_mender/post-build.=
sh
>  delete mode 100644
> support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artif=
act_info
>  delete mode 100755
> support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_print=
env
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 2b61ff3bab..8e1cf9298d 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -103,7 +103,6 @@ configs/imx6ulpico_defconfig
> lib_defconfig.ForceCheckHash
>  configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
>  configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
>  configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
> -configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
>  configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
>  configs/microchip_sam9x60ek_mmc_dev_defconfig lib_defconfig.ForceCheckHa=
sh
>  configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
> lib_defconfig.ForceCheckHash
> @@ -595,7 +594,6 @@ package/matchbox-startup-monitor/0001-true-false.patc=
h
> lib_patch.Upstream
>  package/matchbox/0001-defaulttheme.patch lib_patch.Upstream
>  package/matchbox/0002-src-Fix-build-with-gcc-10.patch lib_patch.Upstream
>  package/memstat/0001-PATH_MAX.patch lib_patch.Upstream
> -package/mender-connect/S43mender-connect Shellcheck
>  package/menu-cache/0001-Support-gcc10-compilation.patch lib_patch.Upstre=
am
>  package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
> lib_patch.Upstream
>  package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-f=
or.patch
> lib_patch.Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4f5c91c0ec..f7008c76c7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,41 @@ endif
>
>  comment "Legacy options removed in 2026.11"
>
> +config BR2_PACKAGE_MENDER
> +       bool "mender has been removed"
> +       select BR2_LEGACY
> +       help
> +         The mender packages have been removed because they are
> +         incompatible with OpenSSL >=3D 4.x
> +
> +config BR2_PACKAGE_MENDER_UPDATE_MODULES
> +       bool "mender-update-modules has been removed"
> +       select BR2_LEGACY
> +       help
> +         The mender packages have been removed because they are
> +         incompatible with OpenSSL >=3D 4.x
> +
> +config BR2_PACKAGE_MENDER_GRUBENV
> +       bool "mender-grubenv has been removed"
> +       select BR2_LEGACY
> +       help
> +         The mender packages have been removed because they are
> +         incompatible with OpenSSL >=3D 4.x
> +
> +config BR2_PACKAGE_MENDER_CONNECT
> +       bool "mender-connect has been removed"
> +       select BR2_LEGACY
> +       help
> +         The mender packages have been removed because they are
> +         incompatible with OpenSSL >=3D 4.x
> +
> +config BR2_PACKAGE_HOST_MENDER_ARTIFACT
> +       bool "host mender-artifact has been removed"
> +       select BR2_LEGACY
> +       help
> +         The mender packages have been removed because they are
> +         incompatible with OpenSSL >=3D 4.x
> +
>  config BR2_PACKAGE_LIBCPPRESTSDK
>         bool "libcpprestsdk has been removed"
>         select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 97eb2d9cac..442a9c5b7a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -39,7 +39,6 @@ F:    package/flutter-packages/flutter-rfw-local-exampl=
e/
>  F:     package/flutter-pi/
>  F:     package/flutter-sdk-bin/
>  F:     package/ivi-homescreen/
> -F:     package/mender-update-modules/
>  F:     support/testing/tests/package/test_flutter.py
>
>  N:     Adam Heinrich <adam@adamh.cz>
> @@ -237,8 +236,6 @@ F:  package/jq/
>  F:     package/libapparmor/
>  F:     package/libb64/
>  F:     package/libdill/
> -F:     package/mender/
> -F:     package/mender-artifact/
>  F:     package/mono/
>  F:     package/mono-gtksharp3/
>  F:     package/monolite/
> diff --git a/board/mender/x86_64/genimage-efi.cfg
> b/board/mender/x86_64/genimage-efi.cfg
> deleted file mode 100644
> index 9c2723d8fb..0000000000
> --- a/board/mender/x86_64/genimage-efi.cfg
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -image efi-part.vfat {
> -       vfat {
> -               file EFI {
> -                       image =3D "efi-part/EFI"
> -               }
> -               file grub-mender-grubenv {
> -                       image =3D "efi-part/grub-mender-grubenv"
> -               }
> -               file bzImage {
> -                       image =3D "bzImage"
> -               }
> -       }
> -
> -       size =3D 16M
> -}
> -
> -image disk.img {
> -       hdimage {
> -               partition-table-type =3D "gpt"
> -       }
> -
> -       partition boot {
> -               partition-type-uuid =3D U
> -               offset =3D 32K
> -               image =3D "efi-part.vfat"
> -               bootable =3D true
> -       }
> -
> -       partition roota {
> -               partition-type-uuid =3D 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B=
709
> -               image =3D "rootfs.ext2"
> -       }
> -
> -       partition rootb {
> -               partition-type-uuid =3D 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B=
709
> -               image =3D "rootfs.ext2"
> -       }
> -
> -       partition data {
> -               partition-type-uuid =3D L
> -               image =3D "data-part.ext4"
> -       }
> -}
> diff --git a/board/mender/x86_64/linux.config
> b/board/mender/x86_64/linux.config
> deleted file mode 100644
> index f17fc18edb..0000000000
> --- a/board/mender/x86_64/linux.config
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -CONFIG_SYSVIPC=3Dy
> -CONFIG_SMP=3Dy
> -CONFIG_HYPERVISOR_GUEST=3Dy
> -CONFIG_PARAVIRT=3Dy
> -CONFIG_EFI=3Dy
> -CONFIG_MODULES=3Dy
> -CONFIG_MODULE_UNLOAD=3Dy
> -CONFIG_NET=3Dy
> -CONFIG_PACKET=3Dy
> -CONFIG_UNIX=3Dy
> -CONFIG_INET=3Dy
> -CONFIG_NETFILTER=3Dy
> -CONFIG_IP_NF_IPTABLES=3Dy
> -CONFIG_IP_NF_FILTER=3Dy
> -CONFIG_CFG80211=3Dm
> -CONFIG_CFG80211_WEXT=3Dy
> -CONFIG_MAC80211=3Dm
> -CONFIG_PCI=3Dy
> -CONFIG_DEVTMPFS=3Dy
> -CONFIG_DEVTMPFS_MOUNT=3Dy
> -CONFIG_VIRTIO_BLK=3Dy
> -CONFIG_BLK_DEV_SD=3Dy
> -CONFIG_SCSI_VIRTIO=3Dy
> -CONFIG_ATA=3Dy
> -CONFIG_NETDEVICES=3Dy
> -CONFIG_VIRTIO_NET=3Dy
> -CONFIG_ATH9K=3Dm
> -CONFIG_ATH9K_HTC=3Dm
> -CONFIG_CARL9170=3Dm
> -CONFIG_ATH10K=3Dm
> -CONFIG_RT2X00=3Dm
> -CONFIG_RT73USB=3Dm
> -CONFIG_RT2800USB=3Dm
> -CONFIG_RT2800USB_RT3573=3Dy
> -CONFIG_RT2800USB_RT53XX=3Dy
> -CONFIG_RT2800USB_RT55XX=3Dy
> -# CONFIG_RTL_CARDS is not set
> -CONFIG_RTL8XXXU=3Dm
> -CONFIG_INPUT_EVDEV=3Dy
> -CONFIG_SERIAL_8250=3Dy
> -CONFIG_SERIAL_8250_CONSOLE=3Dy
> -CONFIG_VIRTIO_CONSOLE=3Dy
> -CONFIG_HW_RANDOM_VIRTIO=3Dm
> -CONFIG_DRM=3Dy
> -CONFIG_DRM_VIRTIO_GPU=3Dy
> -CONFIG_FB_VESA=3Dy
> -CONFIG_SOUND=3Dy
> -CONFIG_SND=3Dy
> -CONFIG_USB=3Dy
> -CONFIG_USB_XHCI_HCD=3Dy
> -CONFIG_USB_EHCI_HCD=3Dy
> -CONFIG_USB_STORAGE=3Dy
> -CONFIG_VIRTIO_PCI=3Dy
> -CONFIG_VIRTIO_BALLOON=3Dy
> -CONFIG_VIRTIO_INPUT=3Dy
> -CONFIG_VIRTIO_MMIO=3Dy
> -CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> -CONFIG_EXT4_FS=3Dy
> -CONFIG_FUSE_FS=3Dy
> -CONFIG_VFAT_FS=3Dy
> -CONFIG_SQUASHFS=3Dy
> -CONFIG_NLS_CODEPAGE_437=3Dy
> -CONFIG_NLS_ISO8859_1=3Dy
> -CONFIG_UNWINDER_FRAME_POINTER=3Dy
> diff --git a/board/mender/x86_64/mender_grubenv_defines
> b/board/mender/x86_64/mender_grubenv_defines
> deleted file mode 100644
> index 77f68fe6b2..0000000000
> --- a/board/mender/x86_64/mender_grubenv_defines
> +++ /dev/null
> @@ -1,25 +0,0 @@
>
> -########################################################################=
########
> -# Mandatory
>
> -########################################################################=
########
> -# Warning: This file is an example and should be customized to fit your
> needs!
> -
> -# Partition index of root filesystem A
> -mender_rootfsa_part=3D2
> -
> -# Partition index of root filesystem B
> -mender_rootfsb_part=3D3
> -
> -# Device file corresponding to the root filesystem partitions, without
> index.
> -mender_kernel_root_base=3D/dev/vda
> -
> -# Name of the storage device containing root filesystem partitions in GR=
UB
> -# format.
> -mender_grub_storage_device=3Dhd0
> -
> -# Type of kernel (bzImage or zImage)
> -kernel_imagetype=3DbzImage
> -
> -# Type of initrd image.
> -# Note: An initrd image is not strictly necessary, and the system will
> boot and
> -#       update without a initrd image.
> -# initrd_imagetype=3Dinitrd.img
> diff --git a/board/mender/x86_64/overlay/etc/fstab
> b/board/mender/x86_64/overlay/etc/fstab
> deleted file mode 100644
> index 45a7ba0260..0000000000
> --- a/board/mender/x86_64/overlay/etc/fstab
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# <file system>     <mount pt>      <type>      <options>
>                <dump>  <pass>
> -/dev/root           /               ext4        rw,noauto
>                    0    1
> -/dev/vda1           /boot           vfat        defaults
>                   0    0
> -/dev/vda4           /var/lib/mender ext4        rw,relatime
>                    0    0
> -proc                /proc           proc        defaults
>                   0    0
> -devpts              /dev/pts        devpts
> defaults,gid=3D5,mode=3D620,ptmxmode=3D0666       0    0
> -sysfs               /sys            sysfs       defaults
>                   0    0
> diff --git a/board/mender/x86_64/overlay/etc/mender/mender.conf
> b/board/mender/x86_64/overlay/etc/mender/mender.conf
> deleted file mode 100644
> index 5f423fb2cb..0000000000
> --- a/board/mender/x86_64/overlay/etc/mender/mender.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -{
> -  "InventoryPollIntervalSeconds": 1800,
> -  "UpdatePollIntervalSeconds": 1800,
> -  "RetryPollIntervalSeconds": 300,
> -  "RootfsPartA": "/dev/vda2",
> -  "RootfsPartB": "/dev/vda3",
> -  "ServerCertificate": "/etc/mender/server.crt",
> -  "ServerURL": "https://docker.mender.io",
> -  "TenantToken": "dummy",
> -  "DeviceTypeFile": "/etc/mender/device_type"
> -}
> diff --git a/board/mender/x86_64/post-build.sh
> b/board/mender/x86_64/post-build.sh
> deleted file mode 100755
> index 9e909e9281..0000000000
> --- a/board/mender/x86_64/post-build.sh
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -#!/usr/bin/env bash
> -set -e
> -DEVICE_TYPE=3D"buildroot-x86_64"
> -
> -parse_args() {
> -    local o O opts
> -    o=3D'a:o:d:'
> -    O=3D'artifact-name:,data-part-size:,device-type:'
> -    opts=3D"$(getopt -o "${o}" -l "${O}" -- "${@}")"
> -    eval set -- "${opts}"
> -    while [ ${#} -gt 0 ]; do
> -        case "${1}" in
> -        (-o|--data-part-size)
> -            # Ignored to have same options as other scripts
> -            shift 2
> -            ;;
> -        (-d|--device-type)
> -            DEVICE_TYPE=3D"${2}"; shift 2
> -            ;;
> -        (-a|--artifact-name)
> -            # Ignored to have same options as other scripts
> -            shift 2
> -            ;;
> -        (--)
> -            shift; break
> -            ;;
> -        esac
> -    done
> -}
> -
> -# Create a persistent directory to mount the data partition at.
> -mender_fixup() {
> -    pushd "${TARGET_DIR}"
> -    # The common paradigm is to have the persistent data volume at /data
> for mender.
> -    if [[ ! -L data ]]; then
> -        ln -s var/lib/mender data
> -    fi
> -
> -    popd
> -}
> -
> -main() {
> -    parse_args "${@}"
> -    mender_fixup
> -    echo "device_type=3D${DEVICE_TYPE}" >
> "${TARGET_DIR}/etc/mender/device_type"
> -}
> -
> -main "${@}"
> diff --git a/board/mender/x86_64/post-image-efi.sh
> b/board/mender/x86_64/post-image-efi.sh
> deleted file mode 100755
> index a3e262f8fe..0000000000
> --- a/board/mender/x86_64/post-image-efi.sh
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -#!/usr/bin/env bash
> -set -e
> -BOARD_DIR=3D"$(realpath "$(dirname "$0")")"
> -DATA_PART=3D"${BINARIES_DIR}"/data-part
> -DATA_PART_SIZE=3D"32M"
> -DEVICE_TYPE=3D"buildroot-x86_64"
> -ARTIFACT_NAME=3D"1.0"
> -
> -# Parse arguments.
> -parse_args() {
> -    local o O opts
> -    o=3D'a:o:d:'
> -    O=3D'artifact-name:,data-part-size:,device-type:'
> -    opts=3D"$(getopt -o "${o}" -l "${O}" -- "${@}")"
> -    eval set -- "${opts}"
> -    while [ ${#} -gt 0 ]; do
> -        case "${1}" in
> -        (-o|--data-part-size)
> -            DATA_PART_SIZE=3D"${2}"; shift 2
> -            ;;
> -        (-d|--device-type)
> -            DEVICE_TYPE=3D"${2}"; shift 2
> -            ;;
> -        (-a|--artifact-name)
> -            ARTIFACT_NAME=3D"${2}"; shift 2
> -            ;;
> -        (--)
> -            shift; break
> -            ;;
> -        esac
> -    done
> -}
> -
> -# Create the data partition
> -make_data_partition() {
> -    "${HOST_DIR}/sbin/mkfs.ext4" \
> -        -d "${DATA_PART}" \
> -        -F \
> -        -r 1 \
> -        -N 0 \
> -        -m 5 \
> -        -L "data" \
> -        "${BINARIES_DIR}/data-part.ext4" "${DATA_PART_SIZE}"
> -}
> -
> -# Generate a mender bootstrap artifact.
> -# See
> https://github.com/mendersoftware/mender/blob/3.5.3/Documentation/automat=
ic-bootstrap-artifact.md
> -generate_mender_bootstrap_artifact()
> <https://github.com/mendersoftware/mender/blob/3.5.3/Documentation/automa=
tic-bootstrap-artifact.md-generate_mender_bootstrap_artifact()>
> {
> -
> -  rm -rf "${DATA_PART}"
> -  mkdir -p "${DATA_PART}"
> -  img_checksum=3D$(sha256sum "${BINARIES_DIR}"/rootfs.ext4 |awk '{print
> $1}')
> -
> -  "${HOST_DIR}"/bin/mender-artifact \
> -    write bootstrap-artifact \
> -    --compression none \
> -    --artifact-name "${ARTIFACT_NAME}" \
> -    --device-type "${DEVICE_TYPE}" \
> -    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
> -    --provides "rootfs-image.checksum:${img_checksum}" \
> -    --clears-provides "rootfs-image.*" \
> -    --output-path "${DATA_PART}"/bootstrap.mender \
> -    --version 3
> -}
> -
> -# Create a mender image.
> -generate_mender_image() {
> -    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mende=
r"
> -    "${HOST_DIR}/bin/mender-artifact" \
> -        write rootfs-image \
> -        --compression none \
> -        -t "${DEVICE_TYPE}" \
> -        -n "${BR2_VERSION}" \
> -        -f "${BINARIES_DIR}/rootfs.ext2" \
> -        -o "${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
> -}
> -
> -generate_image() {
> -    support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
> -}
> -
> -# Main function.
> -main() {
> -    parse_args "${@}"
> -    generate_mender_bootstrap_artifact
> -    make_data_partition
> -    generate_image
> -    generate_mender_image
> -    exit $?
> -}
> -
> -main "${@}"
> diff --git a/board/mender/x86_64/readme.txt
> b/board/mender/x86_64/readme.txt
> deleted file mode 100644
> index 01a0254511..0000000000
> --- a/board/mender/x86_64/readme.txt
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Mender UEFI PC sample config
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -1. Build
> -
> -  $ make mender_x86_64_efi_defconfig
> -
> -  Add any additional packages required. Update the files in
> board/mender/x86_64
> -  and change /dev/vda to what is relevant for your platform: typically
> -  /dev/mmcblk0p for eMMC and /dev/sda for USB or SATA.
> -
> -  $ make
> -
> -2. Write the image
> -
> -  The build process will create a all-in-one image called disk.img in
> -  output/images.
> -
> -  Write the image to a pendrive:
> -
> -  $ dd if=3Doutput/images/disk.img of=3D/dev/sdX; sync
> -
> -  Once the process is complete, insert it into the target PC and boot.
> -
> -  Remember that if said PC has another boot device you might need to
> -  select this alternative for it to boot.
> -
> -  You might need to disable Secure Boot from the setup as well.
> -
> -3. Enjoy
> -
> -Emulation in qemu
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Run the emulation with:
> -
> -qemu-system-x86_64 \
> -    -M pc \
> -    -drive file=3Doutput/images/disk.img,if=3Dvirtio,format=3Draw \
> -    -net nic,model=3Dvirtio \
> -    -net user \
> -    -serial stdio \
> -    -bios </path/to/OVMF_CODE.fd>
> -
> -Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
> -firmware image for qemu. It may be provided by your distribution as an
> -edk2 or OVMF package, in a path such as /usr/share/edk2/ovmf/OVMF_CODE.f=
d.
> -
> -Optional arguments:
> - - -enable-kvm to speed up qemu. This requires a loaded kvm module on th=
e
> host
> -    system.
> - - Add -smp N to emulate an SMP system with N CPUs.
> -
> -The login prompt will appear in the serial window.
> -
> -Tested with QEMU 4.1.1 on Fedora 31
> -
> -Creating a mender-artifact
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The mender artifact is created in
> output/images/buildroot-x86_64-1.0.mender
> -
> -You may wish to change --artifact-name=3D1.0 to a name that best suits y=
our
> -particular needs, as this option changes the mender artifact name.
> -
> -Using mender
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Please read the mender documentation at:
> -https://docs.mender.io
> diff --git a/configs/mender_x86_64_efi_defconfig
> b/configs/mender_x86_64_efi_defconfig
> deleted file mode 100644
> index 219f02839c..0000000000
> --- a/configs/mender_x86_64_efi_defconfig
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -BR2_x86_64=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy
> -BR2_INIT_SYSV=3Dy
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy
> -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyS0"
> -BR2_ROOTFS_OVERLAY=3D"board/mender/x86_64/overlay"
> -BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/mender/x86_64/post-build.sh"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/mender/x86_64/post-image-efi.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"--data-part-size=3D32M
> --device-type=3Dbuildroot-x86_64 --artifact-name=3D1.0"
> -BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.12.28"
> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/mender/x86_64/linux.config"
> -BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> -BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> -BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=3Dy
> -BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=3Dy
> -BR2_PACKAGE_ACPID=3Dy
> -BR2_PACKAGE_CONNMAN=3Dy
> -BR2_PACKAGE_CONNMAN_WIFI=3Dy
> -BR2_PACKAGE_CONNMAN_CLIENT=3Dy
> -BR2_PACKAGE_MENDER=3Dy
> -BR2_PACKAGE_MENDER_GRUBENV=3Dy
>
> -BR2_PACKAGE_MENDER_GRUBENV_DEFINES=3D"board/mender/x86_64/mender_grubenv=
_defines"
> -BR2_TARGET_ROOTFS_EXT2=3Dy
> -BR2_TARGET_ROOTFS_EXT2_4=3Dy
> -BR2_TARGET_ROOTFS_EXT2_SIZE=3D"128M"
> -# BR2_TARGET_ROOTFS_TAR is not set
> -BR2_TARGET_GRUB2=3Dy
> -BR2_TARGET_GRUB2_X86_64_EFI=3Dy
> -BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI=3D"boot linux ext2 fat squash4
> part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256
> test regexp sleep"
> -BR2_TARGET_GRUB2_INSTALL_TOOLS=3Dy
> -BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> -BR2_PACKAGE_HOST_GENIMAGE=3Dy
> -BR2_PACKAGE_HOST_MENDER_ARTIFACT=3Dy
> -BR2_PACKAGE_HOST_MTOOLS=3Dy
> diff --git a/package/Config.in b/package/Config.in
> index aa94d44eca..472e60bad0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2849,10 +2849,6 @@ menu "System tools"
>         source "package/libvirt/Config.in"
>         source "package/lxc/Config.in"
>         source "package/makedumpfile/Config.in"
> -       source "package/mender/Config.in"
> -       source "package/mender-connect/Config.in"
> -       source "package/mender-grubenv/Config.in"
> -       source "package/mender-update-modules/Config.in"
>         source "package/mfoc/Config.in"
>         source "package/moby-buildkit/Config.in"
>         source "package/mokutil/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 595caf9e7f..dfd9317e8a 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -66,7 +66,6 @@ menu "Host utilities"
>         source "package/lpc3250loader/Config.in.host"
>         source "package/lttng-babeltrace/Config.in.host"
>         source "package/lzma-alone/Config.in.host"
> -       source "package/mender-artifact/Config.in.host"
>         source "package/meson-tools/Config.in.host"
>         source "package/mfgtools/Config.in.host"
>         source "package/microchip-hss-payload-generator/Config.in.host"
> diff --git a/package/mender-artifact/Config.in.host
> b/package/mender-artifact/Config.in.host
> deleted file mode 100644
> index 39353b23e7..0000000000
> --- a/package/mender-artifact/Config.in.host
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -config BR2_PACKAGE_HOST_MENDER_ARTIFACT
> -       bool "host mender-artifact"
> -       depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> -       select BR2_PACKAGE_HOST_GO
> -       help
> -         The mender-artifact tool is a CLI implementation of the
> -         Mender artifacts library.
> -
> -         A Mender artifact can be recognized by its .mender suffix.
> -         Mender artifacts can contain binaries, metadata, checksums,
> -         signatures and scripts that are used during a deployment.
> -         The artifact format acts as a wrapper, and uses the tar
> -         format to bundle several files into one.
> -
> -         In its simplest form, an artifact contains just a rootfs
> -         image, along with its checksum, id and device type
> -         compatibility.
> -
> -         https://github.com/mendersoftware/mender-artifact
> diff --git a/package/mender-artifact/mender-artifact.hash
> b/package/mender-artifact/mender-artifact.hash
> deleted file mode 100644
> index 5dffdbb7df..0000000000
> --- a/package/mender-artifact/mender-artifact.hash
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -# Locally computed:
> -sha256  c7002052028496f230c34ef6f0488bf5e8ca32b075b7a96555532fe928aed984
> mender-artifact-4.4.1-go2.tar.gz
> -sha256  0e7c48f6471ca81a2fce9e3f605dffeb0385afd4dc3b5eb7f4e86ece4aa9b068
> LIC_FILES_CHKSUM.sha256
> -
> -# License hash extracted from LIC_FILES_CHKSUM.sha256 using the
> -# following command:
> -#
> -#     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
> -
> -# Apache 2.0 licenses.
> -sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47
> LICENSE
> -sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
> vendor/github.com/minio/sha256-simd/LICENSE
> -sha256 <http://github.com/minio/sha256-simd/LICENSE-sha256>
> 132fb47b89947cd5f98e380186bc412af5561c70669d37d3a83b36f03a0ddae5  vendor/
> github.com/mendersoftware/progressbar/LICENSE
> -sha256 <http://github.com/mendersoftware/progressbar/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> google.golang.org/genproto/LICENSE
> -sha256 <http://google.golang.org/genproto/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> google.golang.org/genproto/googleapis/api/LICENSE
> -sha256 <http://google.golang.org/genproto/googleapis/api/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> google.golang.org/genproto/googleapis/rpc/LICENSE
> -sha256 <http://google.golang.org/genproto/googleapis/rpc/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> google.golang.org/grpc/LICENSE
> -sha256 <http://google.golang.org/grpc/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> cloud.google.com/go/kms/LICENSE
> -sha256 <http://cloud.google.com/go/kms/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> cloud.google.com/go/iam/LICENSE
> -sha256 <http://cloud.google.com/go/iam/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> cloud.google.com/go/compute/metadata/LICENSE
> -sha256 <http://cloud.google.com/go/compute/metadata/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> cloud.google.com/go/auth/LICENSE
> -sha256 <http://cloud.google.com/go/auth/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> cloud.google.com/go/auth/oauth2adapt/LICENSE
> -sha256 <http://cloud.google.com/go/auth/oauth2adapt/LICENSE-sha256>
> 73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/
> github.com/mendersoftware/openssl/LICENSE
> -sha256 <http://github.com/mendersoftware/openssl/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> github.com/googleapis/enterprise-certificate-proxy/LICENSE
> -sha256
> <http://github.com/googleapis/enterprise-certificate-proxy/LICENSE-sha256=
>
> dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  vendor/
> github.com/go-jose/go-jose/v3/json/LICENSE
> -sha256 <http://github.com/go-jose/go-jose/v3/json/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> github.com/go-jose/go-jose/v3/LICENSE
> -sha256 <http://github.com/go-jose/go-jose/v3/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> github.com/google/s2a-go/LICENSE.md
> -sha256 <http://github.com/google/s2a-go/LICENSE.md-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> github.com/Keyfactor/signserver-go-client-sdk/LICENSE
> -sha256
> <http://github.com/Keyfactor/signserver-go-client-sdk/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> github.com/kylelemons/godebug/LICENSE
> -sha256 <http://github.com/kylelemons/godebug/LICENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> go.opentelemetry.io/otel/trace/LICENSE
> -sha256 <http://go.opentelemetry.io/otel/trace/LICENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> go.opentelemetry.io/otel/LICENSE
> -sha256 <http://go.opentelemetry.io/otel/LICENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> go.opentelemetry.io/otel/metric/LICENSE
> -sha256 <http://go.opentelemetry.io/otel/metric/LICENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/LICENSE
> -sha256
> <http://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/LIC=
ENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgr=
pc/LICENSE
> -sha256
> <http://go.opentelemetry.io/contrib/instrumentation/google.golang.org/grp=
c/otelgrpc/LICENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> go.opentelemetry.io/auto/sdk/LICENSE
> -sha256 <http://go.opentelemetry.io/auto/sdk/LICENSE-sha256>
> b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  vendor/
> github.com/go-logr/logr/LICENSE
> -sha256 <http://github.com/go-logr/logr/LICENSE-sha256>
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/
> github.com/go-logr/stdr/LICENSE
> -#
> -# BSD 2 Clause licenses.
> -sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86
> vendor/github.com/pkg/errors/LICENSE
> -sha256 <http://github.com/pkg/errors/LICENSE-sha256>
> 4801bb0c5d70b980b3e1f63d1d2df8d84fec22548e3d73f03a68df1fb808791f  vendor/
> github.com/pkg/browser/LICENSE
> -#
> -# BSD 3 Clause licenses.
> -sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477
> vendor/github.com/pmezard/go-difflib/LICENSE
> -sha256 <http://github.com/pmezard/go-difflib/LICENSE-sha256>
> 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/
> golang.org/x/sys/LICENSE
> -sha256 <http://golang.org/x/sys/LICENSE-sha256>
> 0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/
> github.com/klauspost/compress/LICENSE
> -sha256 <http://github.com/klauspost/compress/LICENSE-sha256>
> 75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/
> github.com/russross/blackfriday/v2/LICENSE.txt
> -sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad
> vendor/golang.org/x/net/LICENSE
> -sha256 <http://golang.org/x/net/LICENSE-sha256>
> 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/
> golang.org/x/oauth2/LICENSE
> -sha256 <http://golang.org/x/oauth2/LICENSE-sha256>
> 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/
> golang.org/x/text/LICENSE
> -sha256 <http://golang.org/x/text/LICENSE-sha256>
> 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/
> golang.org/x/crypto/LICENSE
> -sha256 <http://golang.org/x/crypto/LICENSE-sha256>
> 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/
> golang.org/x/time/LICENSE
> -sha256 <http://golang.org/x/time/LICENSE-sha256>
> 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  vendor/
> golang.org/x/sync/LICENSE
> -sha256 <http://golang.org/x/sync/LICENSE-sha256>
> 110244b02140866ee37d17fa7449436a377ec3b85a481fbb208f4c87964382de  vendor/
> google.golang.org/api/LICENSE
> -sha256 <http://google.golang.org/api/LICENSE-sha256>
> fc0a2f71df4e8f047902da53d1f85301be43e0f360fc167057a2d04658ed2ba9  vendor/
> google.golang.org/api/internal/third_party/uritemplates/LICENSE
> -sha256
> <http://google.golang.org/api/internal/third_party/uritemplates/LICENSE-s=
ha256>
> 4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20  vendor/
> google.golang.org/protobuf/LICENSE
> -sha256 <http://google.golang.org/protobuf/LICENSE-sha256>
> b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3bac4722  vendor/
> github.com/googleapis/gax-go/v2/LICENSE
> -sha256 <http://github.com/googleapis/gax-go/v2/LICENSE-sha256>
> f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/
> github.com/klauspost/compress/internal/snapref/LICENSE
> -sha256
> <http://github.com/klauspost/compress/internal/snapref/LICENSE-sha256>
> 701cbcc144a7c865b072f27547e66ddbf17ac44a3bd21f71149ace02518f107c  vendor/
> github.com/ulikunitz/xz/LICENSE
> -sha256 <http://github.com/ulikunitz/xz/LICENSE-sha256>
> 0a8d61ed3cbfd5312326e8126c31ce9c627a283adc99131b56896d29ada04b2d  vendor/
> github.com/google/uuid/LICENSE
> -#
> -# ISC licenses.
> -sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251
> vendor/github.com/davecgh/go-spew/LICENSE
> -sha256 <http://github.com/davecgh/go-spew/LICENSE-sha256>
> 480be5fb1be03ff19fd71d863f453f16262e98d4e568f5bccfcb7aa3ccf8cf0d  vendor/
> github.com/decred/dcrd/dcrec/secp256k1/v4/LICENSE
> -#
> -# MIT licenses.
> -sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189
> vendor/github.com/stretchr/testify/LICENSE
> -sha256 <http://github.com/stretchr/testify/LICENSE-sha256>
> 2be6c75f36f3022ea015fea7b1b7135ce67d477ee721d0fc6c98678badb13b8b  vendor/
> github.com/urfave/cli/LICENSE
> -sha256 <http://github.com/urfave/cli/LICENSE-sha256>
> 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/
> github.com/sirupsen/logrus/LICENSE
> -sha256 <http://github.com/sirupsen/logrus/LICENSE-sha256>
> 7709cc030f078b17809884f92f33a2016944e1180312dc3f1371b02313d313ed  vendor/
> github.com/klauspost/pgzip/LICENSE
> -sha256 <http://github.com/klauspost/pgzip/LICENSE-sha256>
> a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor/
> github.com/cpuguy83/go-md2man/v2/LICENSE.md
> -sha256 <http://github.com/cpuguy83/go-md2man/v2/LICENSE.md-sha256>
> d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/
> gopkg.in/yaml.v3/LICENSE
> -sha256 <http://gopkg.in/yaml.v3/LICENSE-sha256>
> 08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/
> github.com/mattn/go-isatty/LICENSE
> -sha256 <http://github.com/mattn/go-isatty/LICENSE-sha256>
> 5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/
> github.com/klauspost/cpuid/v2/LICENSE
> -sha256 <http://github.com/klauspost/cpuid/v2/LICENSE-sha256>
> 22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff4354a07f26  vendor/
> github.com/mitchellh/go-homedir/LICENSE
> -sha256 <http://github.com/mitchellh/go-homedir/LICENSE-sha256>
> 22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff4354a07f26  vendor/
> github.com/mitchellh/mapstructure/LICENSE
> -sha256 <http://github.com/mitchellh/mapstructure/LICENSE-sha256>
> 38049e50b486f5394e40b786388f4a006401996e46c7c1cd18925afe7c3b4e34  vendor/
> github.com/ryanuber/go-glob/LICENSE
> -sha256 <http://github.com/ryanuber/go-glob/LICENSE-sha256>
> 5c0476add4c38b55d0ed5ac11b85e00c38f26e1caee20dfe3ab58190103d1fbc  vendor/
> github.com/cenkalti/backoff/v3/LICENSE
> -sha256 <http://github.com/cenkalti/backoff/v3/LICENSE-sha256>
> f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a1c9a79c  vendor/
> github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
> -sha256  646f8936b8ddcd14e13e578ff6857e368780b0d1a4f6066bee89211923a373e2
> vendor/github.com/Azure/azure-sdk-for-go/sdk/internal/LICENSE.txt
> -sha256  646f8936b8ddcd14e13e578ff6857e368780b0d1a4f6066bee89211923a373e2
> vendor/github.com/Azure/azure-sdk-for-go/sdk/azidentity/LICENSE.txt
> -sha256  a096a435e19bb6b631da46992c011a39be563e97ce7366879ad516c772904632
> vendor/
> github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal/LICENSE.=
txt
> -sha256  a096a435e19bb6b631da46992c011a39be563e97ce7366879ad516c772904632
> vendor/
> github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys/LICENSE.tx=
t
> -sha256  646f8936b8ddcd14e13e578ff6857e368780b0d1a4f6066bee89211923a373e2
> vendor/github.com/Azure/azure-sdk-for-go/sdk/azcore/LICENSE.txt
> -sha256  9906940f61b1f0b533fa7d99baf55178b2808fbe113ea51dfbfad8572ccd5f2b
> vendor/github.com/AzureAD/microsoft-authentication-library-for-go/LICENSE
> -sha256
> <http://github.com/AzureAD/microsoft-authentication-library-for-go/LICENS=
E-sha256>
> a707cd425201945d57500566c47c74dc9fb8cd02ef91b9a761abddeb2401e6a7  vendor/
> github.com/goccy/go-json/LICENSE
> -sha256 <http://github.com/goccy/go-json/LICENSE-sha256>
> fe26ca41577b9b2b4448050a24b25e5753af66b5d5945d5d36094e7790bfcb2f  vendor/
> github.com/golang-jwt/jwt/v5/LICENSE
> -sha256 <http://github.com/golang-jwt/jwt/v5/LICENSE-sha256>
> d5c8d4935994cfcfbc53d12fe756b28316858736d6e0a61acaff5fe4a84fca12  vendor/
> github.com/lestrrat-go/iter/LICENSE
> -sha256 <http://github.com/lestrrat-go/iter/LICENSE-sha256>
> b9b5b03485eb7446da7ecad22178664a53c7fcecceb74d69f905819a807d710e  vendor/
> github.com/lestrrat-go/blackmagic/LICENSE
> -sha256 <http://github.com/lestrrat-go/blackmagic/LICENSE-sha256>
> e148deed982672627e875fe0cb03b9aa0d3e315e0f59992973c3c34dbcf5f322  vendor/
> github.com/lestrrat-go/backoff/v2/LICENSE
> -sha256 <http://github.com/lestrrat-go/backoff/v2/LICENSE-sha256>
> d5c8d4935994cfcfbc53d12fe756b28316858736d6e0a61acaff5fe4a84fca12  vendor/
> github.com/lestrrat-go/httpcc/LICENSE
> -sha256 <http://github.com/lestrrat-go/httpcc/LICENSE-sha256>
> b9b5b03485eb7446da7ecad22178664a53c7fcecceb74d69f905819a807d710e  vendor/
> github.com/lestrrat-go/option/LICENSE
> -sha256 <http://github.com/lestrrat-go/option/LICENSE-sha256>
> 0c4868a07b1c2dbb67c75767b4f1b2936c392d02ca2c7ee9827cac1a9d60ab1d  vendor/
> github.com/lestrrat-go/jwx/LICENSE
> -#
> -# MPL-2.0 licenses.
> -sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d
> vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE
> -sha256
> <http://github.com/hashicorp/go-secure-stdlib/strutil/LICENSE-sha256>
> 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/
> github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE
> -sha256
> <http://github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE-sha256>
> bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor/
> github.com/hashicorp/errwrap/LICENSE
> -sha256 <http://github.com/hashicorp/errwrap/LICENSE-sha256>
> bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor/
> github.com/hashicorp/hcl/LICENSE
> -sha256 <http://github.com/hashicorp/hcl/LICENSE-sha256>
> 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/
> github.com/hashicorp/go-cleanhttp/LICENSE
> -sha256 <http://github.com/hashicorp/go-cleanhttp/LICENSE-sha256>
> 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/
> github.com/hashicorp/go-rootcerts/LICENSE
> -sha256 <http://github.com/hashicorp/go-rootcerts/LICENSE-sha256>
> d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e8644af77d3  vendor/
> github.com/hashicorp/go-retryablehttp/LICENSE
> -sha256 <http://github.com/hashicorp/go-retryablehttp/LICENSE-sha256>
> 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  vendor/
> github.com/hashicorp/go-sockaddr/LICENSE
> -sha256 <http://github.com/hashicorp/go-sockaddr/LICENSE-sha256>
> d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e8644af77d3  vendor/
> github.com/hashicorp/vault/api/LICENSE
> -sha256 <http://github.com/hashicorp/vault/api/LICENSE-sha256>
> a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff  vendor/
> github.com/hashicorp/go-multierror/LICENSE
> -sha256 <http://github.com/hashicorp/go-multierror/LICENSE-sha256>
> 8108e14b5cb2b6bcd51583d3849ef0c2b5c4de61758256c20308bc70d1775dbb  vendor/
> github.com/felixge/httpsnoop/LICENSE.txt
> diff --git a/package/mender-artifact/mender-artifact.mk
> b/package/mender-artifact/mender-artifact.mk
> deleted file mode 100644
> index 9f235b55bd..0000000000
> --- a/package/mender-artifact/mender-artifact.mk
> +++ /dev/null
> @@ -1,118 +0,0 @@
>
> -########################################################################=
########
> -#
> -# host-mender-artifact
> -#
>
> -########################################################################=
########
> -
> -HOST_MENDER_ARTIFACT_VERSION =3D 4.4.1
> -HOST_MENDER_ARTIFACT_SITE =3D $(call
> github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
> -HOST_MENDER_ARTIFACT_LICENSE =3D Apache2.0, BSD-2-Clause, BSD-3-Clause,
> ISC, MIT, MPL-2.0
> -# Vendor license paths generated with:
> -#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
> -HOST_MENDER_ARTIFACT_LICENSE_FILES =3D \
> -       LICENSE \
> -       LIC_FILES_CHKSUM.sha256 \
> -       vendor/github.com/minio/sha256-simd/LICENSE \
> -       vendor/github.com/mendersoftware/progressbar/LICENSE \
> -       vendor/google.golang.org/genproto/LICENSE \
> -       vendor/google.golang.org/genproto/googleapis/api/LICENSE \
> -       vendor/google.golang.org/genproto/googleapis/rpc/LICENSE \
> -       vendor/google.golang.org/grpc/LICENSE \
> -       vendor/cloud.google.com/go/kms/LICENSE \
> -       vendor/cloud.google.com/go/iam/LICENSE \
> -       vendor/cloud.google.com/go/compute/metadata/LICENSE \
> -       vendor/cloud.google.com/go/auth/LICENSE \
> -       vendor/cloud.google.com/go/auth/oauth2adapt/LICENSE \
> -       vendor/github.com/mendersoftware/openssl/LICENSE \
> -       vendor/github.com/googleapis/enterprise-certificate-proxy/LICENSE
> \
> -       vendor/github.com/go-jose/go-jose/v3/json/LICENSE \
> -       vendor/github.com/go-jose/go-jose/v3/LICENSE \
> -       vendor/github.com/google/s2a-go/LICENSE.md \
> -       vendor/github.com/Keyfactor/signserver-go-client-sdk/LICENSE \
> -       vendor/github.com/kylelemons/godebug/LICENSE \
> -       vendor/go.opentelemetry.io/otel/trace/LICENSE \
> -       vendor/go.opentelemetry.io/otel/LICENSE \
> -       vendor/go.opentelemetry.io/otel/metric/LICENSE \
> -       vendor/
> go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/LICENSE \
> -       vendor/
> go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgr=
pc/LICENSE
> \
> -       vendor/go.opentelemetry.io/auto/sdk/LICENSE \
> -       vendor/github.com/go-logr/logr/LICENSE \
> -       vendor/github.com/go-logr/stdr/LICENSE \
> -       vendor/github.com/pkg/errors/LICENSE \
> -       vendor/github.com/pkg/browser/LICENSE \
> -       vendor/github.com/pmezard/go-difflib/LICENSE \
> -       vendor/golang.org/x/sys/LICENSE \
> -       vendor/github.com/klauspost/compress/LICENSE \
> -       vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
> -       vendor/golang.org/x/net/LICENSE \
> -       vendor/golang.org/x/oauth2/LICENSE \
> -       vendor/golang.org/x/text/LICENSE \
> -       vendor/golang.org/x/crypto/LICENSE \
> -       vendor/golang.org/x/time/LICENSE \
> -       vendor/golang.org/x/sync/LICENSE \
> -       vendor/google.golang.org/api/LICENSE \
> -       vendor/
> google.golang.org/api/internal/third_party/uritemplates/LICENSE \
> -       vendor/google.golang.org/protobuf/LICENSE \
> -       vendor/github.com/googleapis/gax-go/v2/LICENSE \
> -       vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
> -       vendor/github.com/ulikunitz/xz/LICENSE \
> -       vendor/github.com/google/uuid/LICENSE \
> -       vendor/github.com/davecgh/go-spew/LICENSE \
> -       vendor/github.com/decred/dcrd/dcrec/secp256k1/v4/LICENSE \
> -       vendor/github.com/stretchr/testify/LICENSE \
> -       vendor/github.com/urfave/cli/LICENSE \
> -       vendor/github.com/sirupsen/logrus/LICENSE \
> -       vendor/github.com/klauspost/pgzip/LICENSE \
> -       vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
> -       vendor/gopkg.in/yaml.v3/LICENSE \
> -       vendor/github.com/mattn/go-isatty/LICENSE \
> -       vendor/github.com/klauspost/cpuid/v2/LICENSE \
> -       vendor/github.com/mitchellh/go-homedir/LICENSE \
> -       vendor/github.com/mitchellh/mapstructure/LICENSE \
> -       vendor/github.com/ryanuber/go-glob/LICENSE \
> -       vendor/github.com/cenkalti/backoff/v3/LICENSE \
> -       vendor/
> github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
> -       vendor/github.com/Azure/azure-sdk-for-go/sdk/internal/LICENSE.txt
> \
> -       vendor/
> github.com/Azure/azure-sdk-for-go/sdk/azidentity/LICENSE.txt \
> -       vendor/
> github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal/LICENSE.=
txt
> \
> -       vendor/
> github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys/LICENSE.tx=
t
> \
> -       vendor/github.com/Azure/azure-sdk-for-go/sdk/azcore/LICENSE.txt \
> -       vendor/
> github.com/AzureAD/microsoft-authentication-library-for-go/LICENSE \
> -       vendor/github.com/goccy/go-json/LICENSE \
> -       vendor/github.com/golang-jwt/jwt/v5/LICENSE \
> -       vendor/github.com/lestrrat-go/iter/LICENSE \
> -       vendor/github.com/lestrrat-go/blackmagic/LICENSE \
> -       vendor/github.com/lestrrat-go/backoff/v2/LICENSE \
> -       vendor/github.com/lestrrat-go/httpcc/LICENSE \
> -       vendor/github.com/lestrrat-go/option/LICENSE \
> -       vendor/github.com/lestrrat-go/jwx/LICENSE \
> -       vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE \
> -       vendor/github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE \
> -       vendor/github.com/hashicorp/errwrap/LICENSE \
> -       vendor/github.com/hashicorp/hcl/LICENSE \
> -       vendor/github.com/hashicorp/go-cleanhttp/LICENSE \
> -       vendor/github.com/hashicorp/go-rootcerts/LICENSE \
> -       vendor/github.com/hashicorp/go-retryablehttp/LICENSE \
> -       vendor/github.com/hashicorp/go-sockaddr/LICENSE \
> -       vendor/github.com/hashicorp/vault/api/LICENSE \
> -       vendor/github.com/hashicorp/go-multierror/LICENSE \
> -       vendor/github.com/felixge/httpsnoop/LICENSE.txt
> -
> -HOST_MENDER_ARTIFACT_DEPENDENCIES =3D host-pkgconf host-openssl host-xz
> -
> -ifeq ($(BR2_PACKAGE_HOST_ZSTD),y)
> -HOST_MENDER_ARTIFACT_DEPENDENCIES +=3D host-zstd
> -endif
> -
> -HOST_MENDER_ARTIFACT_GO_ENV +=3D \
> -       PATH=3D$(BR_PATH) \
> -       PKG_CONFIG=3D"$(PKG_CONFIG_HOST_BINARY)" \
> -       PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 \
> -       PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 \
> -
>  PKG_CONFIG_LIBDIR=3D"$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconf=
ig" \
> -       PKG_CONFIG_PATH=3D"$(HOST_DIR)/lib/pkgconfig" \
> -       PKG_CONFIG_SYSROOT_DIR=3D"/"
> -
> -HOST_MENDER_ARTIFACT_LDFLAGS =3D -X
> github.com/mendersoftware/mender-artifact/cli.Version=3D$(HOST_MENDER_ART=
IFACT_VERSION)
> -
> -$(eval $(host-golang-package))
> diff --git a/package/mender-connect/Config.in
> b/package/mender-connect/Config.in
> deleted file mode 100644
> index d478e468c2..0000000000
> --- a/package/mender-connect/Config.in
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -config BR2_PACKAGE_MENDER_CONNECT
> -       bool "mender-connect"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, mender
> -       depends on BR2_USE_WCHAR # libglib2 -> gettext
> -       depends on BR2_USE_MMU # dbus -> fork()
> -       select BR2_PACKAGE_DBUS # runtime
> -       select BR2_PACKAGE_HOST_GO
> -       select BR2_PACKAGE_LIBGLIB2
> -       select BR2_PACKAGE_MENDER # runtime
> -       select BR2_PACKAGE_OPENSSL
> -       help
> -         mender-connect is a daemon responsible for handling
> -         bidirectional (websocket) communication with the Mender
> -         server. The daemon is responsible for implementing a range of
> -         troubleshooting features to the device as well as several
> -         enhancement to the mender-client.
> -
> -         Mender Connect is loosely coupled with the Mender Client. The
> -         main information passed between mender-client and
> -         mender-connect is the device authorization status. Since only
> -         accepted devices can interact with the Mender Server, the
> -         Mender Client passes over DBus the authorization token which
> -         Mender Connect uses to establish a Websocket connection to the
> -         server.
> -
> -         https://github.com/mendersoftware/mender-connect
> -
> -comment "mender-connect needs a toolchain w/ threads, wchar"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on BR2_USE_MMU
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> diff --git a/package/mender-connect/S43mender-connect
> b/package/mender-connect/S43mender-connect
> deleted file mode 100644
> index 4cc21510c4..0000000000
> --- a/package/mender-connect/S43mender-connect
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -#!/bin/sh
> -DAEMON=3D"mender-connect"
> -DAEMON_PATH=3D"/usr/bin/mender-connect"
> -PIDFILE=3D"/var/run/${DAEMON}.pid"
> -
> -MENDER_CONNECT_ARGS=3D""
> -
> -# shellcheck source=3D/dev/null
> -[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> -
> -start() {
> -       printf 'Starting %s: ' "${DAEMON}"
> -       umask 077
> -       # shellcheck disable=3DSC2086 # we need the word splitting
> -       start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} \
> -               -- -daemon ${DAEMON_ARGS}
> -       status=3D$?
> -       if [ "$status" -eq 0 ]; then
> -               echo "OK"
> -       else
> -               echo "FAIL"
> -       fi
> -       return "$status"
> -}
> -
> -stop() {
> -       printf 'Stopping %s: ' "${DAEMON}"
> -       start-stop-daemon -K -q -p "$PIDFILE"
> -       status=3D$?
> -       if [ "$status" -eq 0 ]; then
> -               echo "OK"
> -       else
> -               echo "FAIL"
> -       fi
> -       return "$status"
> -}
> -
> -restart() {
> -       stop
> -       sleep 1
> -       start
> -}
> -
> -case "$1" in
> -       start|stop|restart)
> -               "$1";;
> -       reload)
> -               # Restart, since there is no true "reload" feature.
> -               restart;;
> -       *)
> -               echo "Usage: $0 {start|stop|restart|reload}"
> -               exit 1
> -esac
> diff --git a/package/mender-connect/mender-connect.hash
> b/package/mender-connect/mender-connect.hash
> deleted file mode 100644
> index 2872bb467c..0000000000
> --- a/package/mender-connect/mender-connect.hash
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -# Locally computed:
> -sha256  b04331f447b9d21c5962d5aef2670f1de861e3065522a1b298af0904a8ee6400
> mender-connect-3.0.0-go2.tar.gz
> -sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6
> LIC_FILES_CHKSUM.sha256
> -
> -# Vendor licenses
> -# Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /'
> LIC_FILES_CHKSUM.sha256
> -
> -#
> -# Apache-2.0
> -sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47
> LICENSE
> -sha256  a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152944
> vendor/github.com/mendersoftware/go-lib-micro/LICENSE
> -#
> -# BSD-2-Clause
> -sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86
> vendor/github.com/pkg/errors/LICENSE
> -sha256 <http://github.com/pkg/errors/LICENSE-sha256>
> 1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88fd80b9a2  vendor/
> github.com/vmihailenco/msgpack/v5/LICENSE
> -sha256 <http://github.com/vmihailenco/msgpack/v5/LICENSE-sha256>
> 0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor/
> github.com/vmihailenco/tagparser/v2/LICENSE
> -#
> -# BSD-3-Clause
> -sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477
> vendor/github.com/pmezard/go-difflib/LICENSE
> -sha256 <http://github.com/pmezard/go-difflib/LICENSE-sha256>
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/
> golang.org/x/sys/LICENSE
> -sha256 <http://golang.org/x/sys/LICENSE-sha256>
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/
> golang.org/x/net/LICENSE
> -sha256 <http://golang.org/x/net/LICENSE-sha256>
> 0b77fdea862f869ef4f201ac5649bdbd38ccb055c7f6454dffae9e2adb4941c1  vendor/
> github.com/gorilla/websocket/LICENSE
> -#
> -# ISC
> -sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251
> vendor/github.com/davecgh/go-spew/LICENSE
> -#
> -# MIT
> -sha256  a2a1cea59d9c2d71908082f516f86bb560abf857646ecf69d70c121ead14aef4
> vendor/github.com/creack/pty/LICENSE
> -sha256 <http://github.com/creack/pty/LICENSE-sha256>
> caa932df46551b53643952fe03b351d55db97be73b5393b986dcf6b05d3c416a  vendor/
> github.com/go-ozzo/ozzo-validation/v4/LICENSE
> -sha256 <http://github.com/go-ozzo/ozzo-validation/v4/LICENSE-sha256>
> 92a328e1d5f3269b42e2ce32b4494eafdb3132f204a911c5c95cf3d8465490e4  vendor/
> github.com/satori/go.uuid/LICENSE
> -sha256 <http://github.com/satori/go.uuid/LICENSE-sha256>
> 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/
> github.com/sirupsen/logrus/LICENSE
> -sha256 <http://github.com/sirupsen/logrus/LICENSE-sha256>
> b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/
> github.com/stretchr/objx/LICENSE
> -sha256 <http://github.com/stretchr/objx/LICENSE-sha256>
> f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/
> github.com/stretchr/testify/LICENSE
> -sha256 <http://github.com/stretchr/testify/LICENSE-sha256>
> da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/
> github.com/urfave/cli/v2/LICENSE
> -sha256 <http://github.com/urfave/cli/v2/LICENSE-sha256>
> d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/
> gopkg.in/yaml.v3/LICENSE
> diff --git a/package/mender-connect/mender-connect.mk
> b/package/mender-connect/mender-connect.mk
> deleted file mode 100644
> index 98fdfe16df..0000000000
> --- a/package/mender-connect/mender-connect.mk
> +++ /dev/null
> @@ -1,60 +0,0 @@
>
> -########################################################################=
########
> -#
> -# mender-connect
> -#
>
> -########################################################################=
########
> -
> -MENDER_CONNECT_VERSION =3D 3.0.0
> -MENDER_CONNECT_SITE =3D $(call
> github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
> -MENDER_CONNECT_LICENSE =3D Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, =
MIT
> -
> -# Vendor license paths generated with:
> -#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
> -MENDER_CONNECT_LICENSE_FILES =3D \
> -       LIC_FILES_CHKSUM.sha256 \
> -       LICENSE \
> -       vendor/github.com/mendersoftware/go-lib-micro/LICENSE \
> -       vendor/github.com/pkg/errors/LICENSE \
> -       vendor/github.com/vmihailenco/msgpack/v5/LICENSE \
> -       vendor/github.com/vmihailenco/tagparser/v2/LICENSE \
> -       vendor/github.com/pmezard/go-difflib/LICENSE \
> -       vendor/golang.org/x/sys/LICENSE \
> -       vendor/golang.org/x/net/LICENSE \
> -       vendor/github.com/gorilla/websocket/LICENSE \
> -       vendor/github.com/davecgh/go-spew/LICENSE \
> -       vendor/github.com/creack/pty/LICENSE \
> -       vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE \
> -       vendor/github.com/satori/go.uuid/LICENSE \
> -       vendor/github.com/sirupsen/logrus/LICENSE \
> -       vendor/github.com/stretchr/objx/LICENSE \
> -       vendor/github.com/stretchr/testify/LICENSE \
> -       vendor/github.com/urfave/cli/v2/LICENSE \
> -       vendor/gopkg.in/yaml.v3/LICENSE
> -
> -MENDER_CONNECT_DEPENDENCIES =3D \
> -       dbus \
> -       libglib2 \
> -       mender \
> -       openssl
> -
> -MENDER_CONNECT_LDFLAGS =3D -X
> github.com/mendersoftware/mender-connect/config.Version=3D$(MENDER_CONNEC=
T_VERSION)
> -
> -define MENDER_CONNECT_INSTALL_CONFIG_FILES
> -       $(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender
> -
> -       $(INSTALL) -D -m 0644 $(@D)/examples/mender-connect.conf \
> -               $(TARGET_DIR)/etc/mender/mender-connect.conf
> -endef
> -MENDER_CONNECT_POST_INSTALL_TARGET_HOOKS +=3D
> MENDER_CONNECT_INSTALL_CONFIG_FILES
> -
> -define MENDER_CONNECT_INSTALL_INIT_SYSTEMD
> -       $(INSTALL) -D -m 0644 $(@D)/support/mender-connect.service \
> -               $(TARGET_DIR)/usr/lib/systemd/system/mender-connect.servi=
ce
> -endef
> -
> -define MENDER_CONNECT_INSTALL_INIT_SYSV
> -       $(INSTALL) -D -m 0755 $(MENDER_CONNECT_PKGDIR)/S43mender-connect =
\
> -               $(TARGET_DIR)/etc/init.d/S43mender-connect
> -endef
> -
> -$(eval $(golang-package))
> diff --git a/package/mender-grubenv/Config.in
> b/package/mender-grubenv/Config.in
> deleted file mode 100644
> index 8505458793 <(850)%20545-8793>..0000000000
> --- a/package/mender-grubenv/Config.in
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -config BR2_PACKAGE_MENDER_GRUBENV
> -       bool "mender-grubenv"
> -       depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_MENDER # runtime
> -       depends on BR2_TARGET_GRUB2
> -       depends on !(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT &&
> BR2_TARGET_GRUB2_HAS_EFI_BOOT)
> -       select BR2_PACKAGE_UTIL_LINUX
> -       select BR2_PACKAGE_UTIL_LINUX_BINARIES # flock -w
> -       help
> -         Contains the boot scripts and tools used by Mender to
> -         integrate with the GRUB bootloader.
> -
> -         The following Grub modules must be selected for this package:
> -         loadenv hashsum echo halt gcry_sha256 test regexp
> -
> -         https://github.com/mendersoftware/grub-mender-grubenv
> -
> -if BR2_PACKAGE_MENDER_GRUBENV
> -
> -config BR2_PACKAGE_MENDER_GRUBENV_DEFINES
> -       string "path to grubenv defines"
> -       help
> -         Specify a path to the mender grubenv defines file.
> -         If no path is specified, the example file in the source
> -         directory will be used.
> -
> -         The example file in the source directory sets the following:
> -         mender_rootfsa_part=3D2
> -         mender_rootfsb_part=3D3
> -         mender_kernel_root_base=3D/dev/mmcblk0p
> -         mender_grub_storage_device=3Dhd0
> -         kernel_imagetype=3DbzImage
> -
> -endif
> -
> -comment "mender-grubenv needs a grub2 bootloader"
> -       depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_MENDER
> -       depends on !BR2_TARGET_GRUB2
> -
> -comment "mender-grubenv does not support both legacy and EFI grub2
> bootloaders at the same time"
> -       depends on BR2_PACKAGE_MENDER
> -       depends on BR2_TARGET_GRUB2_HAS_LEGACY_BOOT &&
> BR2_TARGET_GRUB2_HAS_EFI_BOOT
> diff --git a/package/mender-grubenv/mender-grubenv.hash
> b/package/mender-grubenv/mender-grubenv.hash
> deleted file mode 100644
> index 06456f6818..0000000000
> --- a/package/mender-grubenv/mender-grubenv.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256  9200dfc8ce8d9e5fae13947857fec44961df87c5bee92f90e37049279a94fb6f
> mender-grubenv-ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4.tar.gz
> -sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47
> LICENSE
> diff --git a/package/mender-grubenv/mender-grubenv.mk
> b/package/mender-grubenv/mender-grubenv.mk
> deleted file mode 100644
> index d93159802d..0000000000
> --- a/package/mender-grubenv/mender-grubenv.mk
> +++ /dev/null
> @@ -1,90 +0,0 @@
>
> -########################################################################=
########
> -#
> -# mender-grubenv
> -#
>
> -########################################################################=
########
> -
> -MENDER_GRUBENV_VERSION =3D ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4
> -MENDER_GRUBENV_SITE =3D $(call
> github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
> -MENDER_GRUBENV_LICENSE =3D Apache-2.0
> -MENDER_GRUBENV_LICENSE_FILES =3D LICENSE
> -# Grub2 must be built first so this package can overwrite the config fil=
es
> -# provided by grub.
> -MENDER_GRUBENV_DEPENDENCIES =3D grub2 util-linux
> -
> -MENDER_GRUBENV_MAKE_ENV =3D \
> -       $(TARGET_CONFIGURE_OPTS) \
> -       $(TARGET_MAKE_ENV)
> -
> -MENDER_GRUBENV_DEFINES =3D \
> -       $(or $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV_DEFINES)),\
> -               $(@D)/mender_grubenv_defines.example)
> -
> -# These grub modules must be built in for the grub scripts to work
> properly.
> -# Without them, the system will not boot.
> -MENDER_GRUBENV_MANDATORY_MODULES =3D loadenv hashsum echo halt gcry_sha2=
56
> test regexp
> -
> -ifeq ($(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT),y)
> -MENDER_GRUBENV_MODULES_MISSING_PC =3D \
> -       $(filter-out $(call
> qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
> -               $(MENDER_GRUBENV_MANDATORY_MODULES))
> -
> -MENDER_GRUBENV_MAKE_ENV +=3D BOOT_DIR=3D/boot
> -
> -define MENDER_GRUBENV_INSTALL_I386_CFG
> -       mkdir -p $(BINARIES_DIR)/boot-part/grub
> -       cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
> -               $(TARGET_DIR)/boot/grub/grub.cfg
> -       cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
> -               $(TARGET_DIR)/boot/grub-mender-grubenv \
> -               $(BINARIES_DIR)/boot-part/
> -endef
> -MENDER_GRUBENV_TARGET_FINALIZE_HOOKS +=3D MENDER_GRUBENV_INSTALL_I386_CF=
G
> -endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
> -
> -ifeq ($(BR2_TARGET_GRUB2_HAS_EFI_BOOT),y)
> -MENDER_GRUBENV_MODULES_MISSING_EFI =3D \
> -       $(filter-out $(call
> qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
> -               $(MENDER_GRUBENV_MANDATORY_MODULES))
> -
> -MENDER_GRUBENV_MAKE_ENV +=3D BOOT_DIR=3D/boot/EFI/BOOT
> -
> -define MENDER_GRUBENV_INSTALL_EFI_CFG
> -       mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
> -       cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
> -               $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg
> -       cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
> -               $(BINARIES_DIR)/efi-part/EFI/BOOT
> -       cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub-mender-grubenv \
> -               $(BINARIES_DIR)/efi-part/
> -endef
> -MENDER_GRUBENV_TARGET_FINALIZE_HOOKS +=3D MENDER_GRUBENV_INSTALL_EFI_CFG
> -endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
> -
> -ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
> -ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)
> -$(error The following missing grub2 efi modules must be enabled for
> mender-grubenv \
> -       to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))
> -endif
> -ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)
> -$(error The following missing grub2 pc modules must be enabled for
> mender-grubenv \
> -       to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))
> -endif
> -endif
> -
> -define MENDER_GRUBENV_CONFIGURE_CMDS
> -       $(INSTALL) -m 0644 $(MENDER_GRUBENV_DEFINES)
> $(@D)/mender_grubenv_defines
> -endef
> -
> -define MENDER_GRUBENV_BUILD_CMDS
> -       $(MENDER_GRUBENV_MAKE_ENV) $(MAKE) -C $(@D)
> -endef
> -
> -define MENDER_GRUBENV_INSTALL_TARGET_CMDS
> -       $(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=3D$(TARGET_DIR) -C $(@=
D) \
> -               install install-boot-env
> -       # The grub-mender-grubenv-* utilities use this file to function.
> -       echo 'ENV_DIR=3D/boot/grub-mender-grubenv' >
> $(TARGET_DIR)/etc/mender_grubenv.config
> -endef
> -
> -$(eval $(generic-package))
> diff --git a/package/mender-update-modules/Config.in
> b/package/mender-update-modules/Config.in
> deleted file mode 100644
> index 88e0805976..0000000000
> --- a/package/mender-update-modules/Config.in
> +++ /dev/null
> @@ -1,250 +0,0 @@
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES
> -       bool "mender-update-modules"
> -       depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_MENDER
> -       select BR2_PACKAGE_HOST_MENDER_ARTIFACT
> -       help
> -         community supported Update Modules. An Update Module is an
> -         extension to the Mender client for supporting a new type of
> -         software update, such as a package manager, container,
> -         bootloader or even updates of nearby microcontrollers.
> -         An Update Module can be tailored to a specific device or
> -         environment (e.g. update a proprietary bootloader), or be
> -         more general-purpose (e.g. install a set of .deb packages.).
> -
> -         https://github.com/mendersoftware/mender-update-modules
> -
> -if BR2_PACKAGE_MENDER_UPDATE_MODULES
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
> -       bool "DFU"
> -       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
> -       select BR2_PACKAGE_DFU_UTIL
> -       help
> -         The DFU Update Module is able to update peripheral devices
> -         connected to the device running Mender.
> -         Example use-cases:
> -           - Deploy firmware updates to peripheral devices using the
> -             USB Device Firmware Update (DFU) protocol
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/dfu
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY
> -       bool "dir-overlay"
> -       help
> -         The Directory Overlay Update Module installs a user defined
> -         file tree structure into a given destination directory in the
> -         target.
> -
> -         Before the deploy into the destination folder on the device,
> -         the Update Module will take a backup copy of the current
> -         contents, allowing restore of it using the rollback mechanism
> -         of the Mender client if something goes wrong. The Update
> -         Module will also delete the current installed content that was
> -         previously installed using the same module, this means that
> -         each deployment is self contained and there is no residues
> -         left on the system from the previous deployment.
> -
> -         Example use-cases:
> -           - Deploy root filesystem overlays
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/dir-o=
verlay
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
> -       bool "dirty"
> -       help
> -         The dirty Update Module: modify your device state without
> -         installing an artifact
> -         Example use-cases:
> -           - You have a specific action on the device that you want to
> -             run multiple times
> -
> -           - You want to avoid re-creating artifacts just for the sake
> -             of a new version/name
> -
> -           - You don't want the artifact the show up in the list of
> -             installed artifacts
> -
> -           - The module will always fail the update process, which
> -             means it can never be marked as installed. So it can be
> -             attempted any number of times without having to recreate
> -             newly versioned artifacts.
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
> -       bool "docker"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS #
> docker-engine, docker-cli
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS #
> docker-engine, docker-cli
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
> -       depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
> -       depends on BR2_USE_MMU # containerd
> -       depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker-engine
> -       depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> -       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2 # docker-engine
> -       select BR2_PACKAGE_DOCKER_ENGINE
> -       select BR2_PACKAGE_DOCKER_CLI
> -       select BR2_PACKAGE_JQ # runtime
> -       help
> -         The Docker Update Module handles the Docker images that shall
> -         be running in the device. A deployment with this module will
> -         stop all currently running Docker containers in the device,
> -         and start new containers with the provided list of Docker
> -         images in the Mender Artifact.
> -
> -         In case of an unforeseen error during the process, the module
> -         will use the rollback mechanism of the Mender client to
> -         restore the previously running Docker containers.
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/docke=
r
> -
> -comment "docker support needs a glibc or musl toolchain w/ threads,
> headers >=3D 5.2"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> -               BR2_TOOLCHAIN_USES_UCLIBC || \
> -               !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
> -       depends on BR2_USE_MMU
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
> -       bool "ipk"
> -       depends on BR2_USE_MMU # opkg
> -       depends on BR2_USE_WCHAR # opkg -> libarchive
> -       select BR2_PACKAGE_OPKG
> -       help
> -         The IPK Update Module allows opkg-based packages to be
> -         installed on a device
> -
> -         Example use-cases:
> -           - Deploy any ipk package
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/ipk
> -
> -comment "ipk support needs a toolchain w/ wchar"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_USE_WCHAR
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
> -       bool "podman"
> -       depends on BR2_USE_MMU  # podman
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # podman
> -       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
> -       depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
> -       depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
> -       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
> -       depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
> -       depends on BR2_USE_WCHAR  # podman
> -       select BR2_PACKAGE_JQ # runtime
> -       select BR2_PACKAGE_PODMAN
> -       help
> -         The Podman Update Module handles the Podman container images
> -         that shall be running on the target device. A deployment with
> -         this module will stop all currently running Podman containers
> -         on the device and start new containers based on the list of
> -         Podman images provided in the Mender Artifact.
> -
> -         In case of any unforeseen error during the process, the module
> -         will trigger the rollback mechanism of the Mender client to
> -         restore the previously running Podman containers.
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/podma=
n
> -
> -comment "podman support needs a toolchain w/ headers >=3D 4.14, threads,
> wchar"
> -       depends on BR2_USE_MMU
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
> -               || !BR2_TOOLCHAIN_HAS_THREADS \
> -               || !BR2_USE_WCHAR
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
> -       bool "reboot"
> -       help
> -         The reboot Update Module: reboot your device remotely.
> -
> -         Example use-cases:
> -           - Something went wrong and you have to reboot your device
> -             remotely, and all access to the device you have is Mender.
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/reboo=
t
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
> -       bool "rootfs version check"
> -       depends on BR2_USE_WCHAR # python3
> -       depends on BR2_USE_MMU # python3
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> -       depends on !BR2_STATIC_LIBS # python3
> -       select BR2_PACKAGE_PYTHON3 # runtime
> -       help
> -         The rootfs-version-check Update Module implements a full image
> -         update with additional checks to protect against replay
> -         attacks.
> -
> -         This is functionally equivalent to the built-in full image
> -         update with an extra check to ensure the artifact name
> -         follows a specific format and that installing "older" images
> -         is rejected. For this reference implementaton, we simply use
> -         a numeric identifier and ensure that it is larger than the
> -         version installed. For actual device fleet use, you may need
> -         to customize this based on your artifact naming scheme.
> -
> -         Example use-cases:
> -           - Deploy root filesystem updates and ensure only newer
> -             artifacts are installed
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/rootf=
s-version-check
> -
> -comment "rootfs version check needs a toolchain w/ threads, dynamic
> library, wchar"
> -       depends on BR2_USE_MMU
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -               !BR2_USE_WCHAR
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
> -       bool "rpm"
> -       depends on !BR2_STATIC_LIBS # dlfcn.h
> -       depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -       depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
> -       depends on BR2_TOOLCHAIN_HAS_THREADS
> -       select BR2_PACKAGE_RPM
> -       help
> -         The Rpm Update Module updates software on the device using
> -         the native local package manager.
> -
> -         A Mender Artifact containing one or more software packages
> -         is sent to the device, where the Update Module will call
> -         the package manager to install them in alphabetical order.
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
> -
> -comment "rpm needs a toolchain w/ dynamic library, threads and lua >=3D =
5.3"
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> -               || !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
> -       depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -
> -config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
> -       bool "swupdate"
> -       depends on !BR2_STATIC_LIBS
> -       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate
> -       select BR2_PACKAGE_JQ # runtime
> -       select BR2_PACKAGE_SWUPDATE
> -       help
> -         The SWU Update Module allows deploying an SWUpdate-based
> -         artifact to the device.
> -
> -         Example use-cases:
> -           - Extend an existing platform using SWUpdate with OTA.
> -
> -
> https://github.com/mendersoftware/mender-update-modules/tree/master/swu
> -
> -comment "swupdate support needs a toolchain w/ dynamic library"
> -       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -       depends on BR2_STATIC_LIBS
> -
> -endif
> -
> -comment "mender-update-modules needs mender"
> -       depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> -       depends on !BR2_PACKAGE_MENDER
> diff --git a/package/mender-update-modules/mender-update-modules.hash
> b/package/mender-update-modules/mender-update-modules.hash
> deleted file mode 100644
> index ec879f46a1..0000000000
> --- a/package/mender-update-modules/mender-update-modules.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541
> mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
> -sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688
> LICENSE
> diff --git a/package/mender-update-modules/mender-update-modules.mk
> b/package/mender-update-modules/mender-update-modules.mk
> deleted file mode 100644
> index 0024acc189..0000000000
> --- a/package/mender-update-modules/mender-update-modules.mk
> +++ /dev/null
> @@ -1,77 +0,0 @@
>
> -########################################################################=
########
> -#
> -# mender-update-modules
> -#
>
> -########################################################################=
########
> -
> -MENDER_UPDATE_MODULES_VERSION =3D d8c4683e6660af6c65069e10ee4b8ee50ec1af=
46
> -MENDER_UPDATE_MODULES_SITE =3D $(call
> github,mendersoftware,mender-update-modules,$(MENDER_UPDATE_MODULES_VERSI=
ON))
> -MENDER_UPDATE_MODULES_LICENSE =3D Apache-2.0
> -MENDER_UPDATE_MODULES_LICENSE_FILES =3D LICENSE
> -MENDER_UPDATE_MODULES_DEPENDENCIES =3D host-mender-artifact mender
> -
> -MENDER_UPDATE_MODULES_MODULES =3D script
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D dfu
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D dir-overlay
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D dirty
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D docker
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D ipk
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D podman
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D reboot
> -define MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
> -       $(INSTALL) -D -m 0755 $(@D)/reboot/reboot-gen \
> -               $(HOST_DIR)/bin/reboot-artifact-gen
> -endef
> -MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS +=3D
> MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK),y)
> -MENDER_UPDATE_MODULES_DEPENDENCIES +=3D python3
> -MENDER_UPDATE_MODULES_MODULES +=3D rootfs-version-check
> -define MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
> -       $(INSTALL) -D -m 0755
> $(@D)/rootfs-version-check/mender-compare-versions \
> -               $(TARGET_DIR)/usr/bin/mender-compare-versions
> -endef
> -MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS +=3D
> MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D rpm
> -endif
> -
> -ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU),y)
> -MENDER_UPDATE_MODULES_MODULES +=3D swu
> -endif
> -
> -define MENDER_UPDATE_MODULES_INSTALL_TARGET_CMDS
> -       $(foreach f,$(MENDER_UPDATE_MODULES_MODULES), \
> -               $(INSTALL) -D -m 0775 $(@D)/$(f)/module/$(f) \
> -                       $(TARGET_DIR)/usr/share/mender/modules/v3/$(f); \
> -               if [ -d $(@D)/$(f)/module-artifact-gen ]; then \
> -                       $(INSTALL) -D -m 0775
> $(@D)/$(f)/module-artifact-gen/$(f)-artifact-gen \
> -                               $(HOST_DIR)/bin/$(f)-artifact-gen; \
> -               fi; \
> -       )
> -endef
> -
> -$(eval $(generic-package))
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> deleted file mode 100644
> index c9b9d0b757..0000000000
> --- a/package/mender/Config.in
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -config BR2_PACKAGE_MENDER
> -       bool "mender"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on BR2_TOOLCHAIN_HAS_THREADS
> -       select BR2_PACKAGE_HOST_GO
> -       select BR2_PACKAGE_OPENSSL
> -       select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> -       select BR2_PACKAGE_LIBOPENSSL_ENGINES
> -       select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
> -       select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
> -       help
> -         Mender is an open source over-the-air (OTA) software updater
> -         for embedded Linux devices. Mender comprises a client
> -         running at the embedded device, as well as a server that
> -         manages deployments across many devices.
> -
> -         Notes:
> -         For systems using uboot as the bootloader:
> -           - uboot must have the mender uboot patches applied.
> -           - uboot-tools must be selected.
> -           - fw_printenv must be functional on the device.
> -         The Mender Uboot patches are at:
> -         https://github.com/mendersoftware/meta-mender/
> -
> -         For more information on Manual U-Boot integration, see:
> -
> https://docs.mender.io/2.6/system-updates-yocto-project/board-integration=
/bootloader-support/u-boot/manual-u-boot-integration
> -
> -         For systems using Grub2 as the bootloader:
> -           - Mender depends on the mender-grubenv package.
> -           - The mender-grubenv package provides a fw_printenv script,
> -             which is not compatible with the uboot-tools fw_printenv
> -             script.
> -
> -         The mender project recommends using uboot to load Grub2 as a
> -         secondary bootloader whenever possible. Using Grub2 as a
> -         secondary bootloader prevents users from porting the patches
> -         for uboot to each new device.
> -
> -         https://github.com/mendersoftware/mender
> -
> -comment "mender needs a toolchain w/ threads"
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/mender/S42mender b/package/mender/S42mender
> deleted file mode 100644
> index 70116ed4eb..0000000000
> --- a/package/mender/S42mender
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -#!/bin/sh
> -#
> -# Starts mender service.
> -#
> -DAEMON=3D"mender"
> -DAEMON_PATH=3D"/usr/bin/mender"
> -PIDFILE=3D"/var/run/${DAEMON}.pid"
> -DAEMON_ARGS=3D"daemon"
> -
> -start() {
> -       printf "Starting mender service: "
> -       umask 077
> -       start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} --
> ${DAEMON_ARGS}
> -       status=3D$?
> -       [ "${status}" =3D 0 ] && echo "OK" || echo "FAIL"
> -}
> -
> -stop() {
> -       printf "Stopping mender service: "
> -       start-stop-daemon -Kqp "$PIDFILE"
> -       status=3D$?
> -       [ "${status}" =3D 0 ] && echo "OK" || echo "FAIL"
> -}
> -restart() {
> -       stop
> -       start
> -}
> -
> -case "$1" in
> -       start)
> -               start
> -               ;;
> -       stop)
> -               stop
> -               ;;
> -       restart|reload)
> -               restart
> -               ;;
> -       *)
> -               echo "Usage: $0 {start|stop|reload|restart}"
> -               exit 1
> -esac
> -
> -exit $?
> diff --git a/package/mender/device_type b/package/mender/device_type
> deleted file mode 100644
> index a097ef2b3a..0000000000
> --- a/package/mender/device_type
> +++ /dev/null
> @@ -1 +0,0 @@
> -device_type=3DBUILDROOT_DEVICE
> diff --git a/package/mender/mender-client.service
> b/package/mender/mender-client.service
> deleted file mode 100644
> index 47e439993c..0000000000
> --- a/package/mender/mender-client.service
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -[Unit]
> -Description=3DMender OTA update service
> -After=3Dsystemd-resolved.service
> -
> -[Service]
> -Type=3Didle
> -User=3Droot
> -Group=3Droot
> -ExecStart=3D/usr/bin/mender daemon
> -Restart=3Don-abort
> -
> -[Install]
> -WantedBy=3Dmulti-user.target
> diff --git a/package/mender/mender.conf b/package/mender/mender.conf
> deleted file mode 100644
> index 2393948f8e..0000000000
> --- a/package/mender/mender.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -{
> -  "InventoryPollIntervalSeconds": 1800,
> -  "UpdatePollIntervalSeconds": 1800,
> -  "RetryPollIntervalSeconds": 300,
> -  "RootfsPartA": "/dev/mmcblk0p2",
> -  "RootfsPartB": "/dev/mmcblk0p3",
> -  "DeviceTypeFile": "/var/lib/mender/device_type",
> -  "ServerCertificate": "/etc/mender/server.crt",
> -  "ServerURL": "https://docker.mender.io",
> -  "TenantToken": "dummy"
> -}
> diff --git a/package/mender/mender.hash b/package/mender/mender.hash
> deleted file mode 100644
> index 17fe08c827..0000000000
> --- a/package/mender/mender.hash
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -# Locally computed:
> -sha256  35e369759b8d4f012153e538b5daf1e0cebe842205811e708332c5a092270ac5
> mender-3.5.3-go2.tar.gz
> -
> -# Vendor licenses
> -# Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /'
> LIC_FILES_CHKSUM.sha256
> -
> -# Apache-2.0 license.
> -sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688
> LICENSE
> -sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a
> vendor/github.com/mendersoftware/mender-artifact/LICENSE
> -sha256 <http://github.com/mendersoftware/mender-artifact/LICENSE-sha256>
> 73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/
> github.com/mendersoftware/openssl/LICENSE
> -sha256 <http://github.com/mendersoftware/openssl/LICENSE-sha256>
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/
> github.com/minio/sha256-simd/LICENSE
> -sha256 <http://github.com/minio/sha256-simd/LICENSE-sha256>
> 8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/
> github.com/mendersoftware/progressbar/LICENSE
> -#
> -# BSD 2 Clause license.
> -sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86
> vendor/github.com/pkg/errors/LICENSE
> -sha256 <http://github.com/pkg/errors/LICENSE-sha256>
> e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad8b95128  vendor/
> github.com/godbus/dbus/LICENSE
> -sha256 <http://github.com/godbus/dbus/LICENSE-sha256>
> 2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/
> github.com/gorilla/websocket/LICENSE
> -#
> -# BSD 3 Clause license.
> -sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf
> vendor/github.com/klauspost/compress/LICENSE
> -sha256 <http://github.com/klauspost/compress/LICENSE-sha256>
> 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/
> github.com/pmezard/go-difflib/LICENSE
> -sha256 <http://github.com/pmezard/go-difflib/LICENSE-sha256>
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/
> golang.org/x/sys/LICENSE
> -sha256 <http://golang.org/x/sys/LICENSE-sha256>
> 0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/
> github.com/bmatsuo/lmdb-go/LICENSE.md
> -sha256 <http://github.com/bmatsuo/lmdb-go/LICENSE.md-sha256>
> 87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/
> github.com/remyoudompheng/go-liblzma/LICENSE
> -sha256 <http://github.com/remyoudompheng/go-liblzma/LICENSE-sha256>
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/
> golang.org/x/term/LICENSE
> -#
> -# ISC license.
> -sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251
> vendor/github.com/davecgh/go-spew/LICENSE
> -#
> -# MIT license.
> -sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685
> vendor/github.com/klauspost/pgzip/LICENSE
> -sha256 <http://github.com/klauspost/pgzip/LICENSE-sha256>
> f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/
> github.com/klauspost/compress/internal/snapref/LICENSE
> -sha256
> <http://github.com/klauspost/compress/internal/snapref/LICENSE-sha256>
> f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a1c9a79c  vendor/
> github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
> -sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212
> vendor/github.com/klauspost/cpuid/v2/LICENSE
> -sha256 <http://github.com/klauspost/cpuid/v2/LICENSE-sha256>
> 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/
> github.com/sirupsen/logrus/LICENSE
> -sha256 <http://github.com/sirupsen/logrus/LICENSE-sha256>
> f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/
> github.com/stretchr/testify/LICENSE
> -sha256 <http://github.com/stretchr/testify/LICENSE-sha256>
> ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/
> github.com/ungerik/go-sysfs/LICENSE
> -sha256 <http://github.com/ungerik/go-sysfs/LICENSE-sha256>
> da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/
> github.com/urfave/cli/v2/LICENSE
> -sha256 <http://github.com/urfave/cli/v2/LICENSE-sha256>
> b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/
> github.com/stretchr/objx/LICENSE
> -sha256 <http://github.com/stretchr/objx/LICENSE-sha256>
> d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/
> gopkg.in/yaml.v3/LICENSE
> -sha256 <http://gopkg.in/yaml.v3/LICENSE-sha256>
> 08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/
> github.com/mattn/go-isatty/LICENSE
> -#
> -# OpenLDAP Public License
> -sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569
> vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
> -
> -# sha256 of all the vendor licenses combined
> -sha256  86407bd98d5ea7fb0f09ab771c3333e975d06565b809a2dd95f864dc1e3a09b3
> LIC_FILES_CHKSUM.sha256
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> deleted file mode 100644
> index 76dc28d547..0000000000
> --- a/package/mender/mender.mk
> +++ /dev/null
> @@ -1,110 +0,0 @@
>
> -########################################################################=
########
> -#
> -# mender
> -#
>
> -########################################################################=
########
> -
> -MENDER_VERSION =3D 3.5.3
> -MENDER_SITE =3D $(call github,mendersoftware,mender,$(MENDER_VERSION))
> -MENDER_LICENSE =3D Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT,
> OLDAP-2.8
> -MENDER_CPE_ID_VENDOR =3D northern.tech
> -# CVE-2024-46948 only affects mender-server
> -MENDER_IGNORE_CVES =3D CVE-2024-46948
> -
> -# Vendor license paths generated with:
> -#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
> -MENDER_LICENSE_FILES =3D \
> -       LICENSE \
> -       LIC_FILES_CHKSUM.sha256 \
> -       vendor/github.com/mendersoftware/mender-artifact/LICENSE \
> -       vendor/github.com/mendersoftware/openssl/LICENSE \
> -       vendor/github.com/minio/sha256-simd/LICENSE \
> -       vendor/github.com/mendersoftware/progressbar/LICENSE \
> -       vendor/github.com/pkg/errors/LICENSE \
> -       vendor/github.com/godbus/dbus/LICENSE \
> -       vendor/github.com/gorilla/websocket/LICENSE \
> -       vendor/github.com/klauspost/compress/LICENSE \
> -       vendor/github.com/pmezard/go-difflib/LICENSE \
> -       vendor/golang.org/x/sys/LICENSE \
> -       vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
> -       vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
> -       vendor/golang.org/x/term/LICENSE \
> -       vendor/github.com/davecgh/go-spew/LICENSE \
> -       vendor/github.com/klauspost/pgzip/LICENSE \
> -       vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
> -       vendor/
> github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
> -       vendor/github.com/klauspost/cpuid/v2/LICENSE \
> -       vendor/github.com/sirupsen/logrus/LICENSE \
> -       vendor/github.com/stretchr/testify/LICENSE \
> -       vendor/github.com/ungerik/go-sysfs/LICENSE \
> -       vendor/github.com/urfave/cli/v2/LICENSE \
> -       vendor/github.com/stretchr/objx/LICENSE \
> -       vendor/gopkg.in/yaml.v3/LICENSE \
> -       vendor/github.com/mattn/go-isatty/LICENSE \
> -       vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
> -
> -MENDER_DEPENDENCIES =3D host-pkgconf openssl
> -
> -MENDER_LDFLAGS =3D -X
> github.com/mendersoftware/mender/conf.Version=3D$(MENDER_VERSION)
> -
> -MENDER_UPDATE_MODULES_FILES =3D directory single-file
> -
> -define MENDER_INSTALL_CONFIG_FILES
> -       $(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
> -       echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
> -
> -       $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
> -               $(TARGET_DIR)/etc/mender/mender.conf
> -       $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.crt \
> -               $(TARGET_DIR)/etc/mender/server.crt
> -
> -       $(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
> -
>  $(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
> -       $(foreach f,bootloader-integration hostinfo network os
> rootfs-type, \
> -               $(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f)=
 \
> -
>  $(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
> -       )
> -
> -       $(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
> -                       $(TARGET_DIR)/etc/mender/device_type
> -
> -       mkdir -p $(TARGET_DIR)/var/lib/mender
> -       $(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
> -               $(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)=
)
> \
> -                       $(TARGET_DIR)/usr/share/mender/modules/v3/$(notdi=
r
> $(f))
> -       )
> -endef
> -
> -MENDER_POST_INSTALL_TARGET_HOOKS +=3D MENDER_INSTALL_CONFIG_FILES
> -
> -ifeq ($(BR2_PACKAGE_XZ),y)
> -MENDER_DEPENDENCIES +=3D xz
> -else
> -MENDER_TAGS +=3D nolzma
> -endif
> -
> -ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
> -MENDER_DEPENDENCIES +=3D libglib2
> -define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> -       $(INSTALL) -D -m 0755
> $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
> -
>  $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
> -
> -       $(INSTALL) -D -m 0755
> $(@D)/support/dbus/io.mender.UpdateManager.conf \
> -
>  $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
> -endef
> -MENDER_POST_INSTALL_TARGET_HOOKS +=3D
> MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> -else
> -MENDER_TAGS +=3D nodbus
> -endif
> -
> -define MENDER_INSTALL_INIT_SYSTEMD
> -       $(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
> -               $(TARGET_DIR)/usr/lib/systemd/system/mender-client.servic=
e
> -endef
> -
> -define MENDER_INSTALL_INIT_SYSV
> -       $(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender \
> -               $(TARGET_DIR)/etc/init.d/S42mender
> -endef
> -
> -$(eval $(golang-package))
> diff --git a/package/mender/readme.txt b/package/mender/readme.txt
> deleted file mode 100644
> index 56d6204583..0000000000
> --- a/package/mender/readme.txt
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -=3D=3D=3D Notes on using Mender on Buildroot
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Mender is an open source over-the-air (OTA) software updater for
> -embedded Linux devices. Mender comprises a client running at the
> -embedded device, as well as a server that manages deployments across
> -many devices. There is also various tooling around the Mender project,
> -such as 'mender-artifact' which is used to create Mender Artifacts
> -that are compatible with the Mender client and server.
> -
> -Mender aims to address this challenge with a robust and easy to use
> -updater for embedded Linux devices, which is open source and available
> -to anyone.
> -
> -Robustness is ensured with atomic image-based deployments using a dual
> -A/B rootfs partition layout. This makes it always possible to roll
> -back to a working state, even when losing power at any time during the
> -update process.
> -
> -The official documentation is a good resource to get an in depth
> -understanding of how Mender works:
> -
> -    https://docs.mender.io
> -
> -In Buildroot the following packages are provided:
> -
> -- BR2_PACKAGE_MENDER
> -    - This will install the client on target rootfs
> -- BR2_PACKAGE_HOST_MENDER_ARTIFACT
> -    - This will install the 'mender-artifact' tool in host rootfs.
> -- BR2_PACKAGE_MENDER_CONNECT
> -    - This installs a client that allows for remote terminal access
> -      to mender clients registered on a mender server.
> -- BR2_PACKAGE_MENDER_GRUBENV
> -    - This package provides boot scripts to integrate mender into grub.
> -      Mender recommends every client to use this package, including boar=
ds
> -      using uboot as the primary bootloader.
> -
> -To fully utilize atomic image-based deployments using the A/B update
> -strategy, additional integration is required in the bootloader. This
> -integration is board specific.
> -
> -Currently supported bootloaders are GRUB and U-boot. Buildroot provides
> -a reference integration at board/mender/x86_64/ using the
> -mender_x86_64_efi_defconfig file.
> -
> -Additional support and integrations are found at:
> -
> -    https://github.com/mendersoftware/buildroot-mender
> -
> -Default configurations files
> -----------------------------
> -
> -Buildroot comes with a default configuration and there a couple of
> -files that need your attention:
> -
> -- /etc/mender/mender.conf
> -    - main configuration file for the Mender client
> -    -
> https://docs.mender.io/client-installation/configuration/configuration-op=
tions
> -
> -- /var/lib/mender/device_type
> -    - A string that defines the type of device
> -
> -Mender server configuration
> ----------------------------
> -
> -The Mender server can be setup in different ways, and how you
> -configure the Mender client differs slightly depending on which server
> -environment is used.
> -
> -- Mender demo environment
> -
> -This is if you have followed the Getting started documentation where
> -you launch a Mender server locally and to configure your environment
> -to connect to this local server you need to provide the IP address of
> -the server on the local network.
> -
> -By default the demo environment will connect to 'docker.mender.io' and
> -'s3.docker.mender.io' and we need to make sure that these are resolved
> -to the local IP address of the running server by adding the following
> -entry to '/etc/hosts'
> -
> -    <ip address of demo environment> docker.mender.io s3.docker.mender.i=
o
> -
> -This is required because the communication between client and server
> -is utilizing TLS and the provided demo server certificate (server.crt)
> -is only valid for 'docker.mender.io' and 's3.docker.mender.io'
> -domains.
> -
> -- Hosted Mender
> -
> -To authenticate the Mender client with the Hosted Mender server you
> -need a tenant token.
> -
> -To get your tenant token:
> -
> -- log in to https://hosted.mender.io
> -- click your email at the top right and then =E2=80=9CMy organization=E2=
=80=9D
> -- press the =E2=80=9CCOPY TO CLIPBOARD=E2=80=9D
> -- assign content of clipboard to TenantToken
> -
> -Example mender.conf options for Hosted Mender:
> -
> -    {
> -      ...
> -      "ServerURL": "https://hosted.mender.io",
> -      "TenantToken": "<paste tenant token here>"
> -      ...
> -    }
> -
> -
> -Creating Mender Artifacts
> --------------------------
> -
> -To create Mender Artifacts based on Buildroot build output you must
> -include BR2_PACKAGE_HOST_MENDER_ARTIFACT in your configuration, and
> -then you would typically create the Mender Artifact in a post image
> -script (BR2_ROOTFS_POST_IMAGE_SCRIPT). See the generate_mender_image
> -method in board/mender/x86_64/post-image-efi.sh for a working example.
> -
> -Additionally, mender requires a bootstrap.mender file which is also
> -generated using the host-mender-artifact package. See the
> -generate_mender_bootstrap_artifact method in
> -board/mender/x86_64/post-image-efi.sh for an example
> -
> -Configuring Mender with certificates
> -------------------------------------
> -
> -Mender uses TLS to communicate with the management server, and if you
> -use a CA-signed certificate on the server, you must include
> -BR2_PACKAGE_CA_CERTIFICATES in your configuration to authenticate TLS
> -connections.
> diff --git a/package/mender/server.crt b/package/mender/server.crt
> deleted file mode 100644
> index 79a57e15e7..0000000000
> --- a/package/mender/server.crt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> ------BEGIN CERTIFICATE-----
> -MIIBfTCCASOgAwIBAgIJAJOS76a0qWuZMAoGCCqGSM49BAMCMBsxGTAXBgNVBAMM
> -EGRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1MjQ2
> -WjAbMRkwFwYDVQQDDBBkb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0CAQYIKoZI
> -zj0DAQcDQgAE7AVYis6MWGPGQYU1/tlLEnskRifDIhvkRb8Y4nQPekRkLkiBYYT3
> -iJ46wHrnejbHaLstU9GRdKWOmOuU6HGdO6NQME4wHQYDVR0OBBYEFGOIU4q++Vz8
> -9HuT1jg9V+wFeJcyMB8GA1UdIwQYMBaAFGOIU4q++Vz89HuT1jg9V+wFeJcyMAwG
> -A1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIhAPLnEeWPNeN7eDCEYRitBfyO
> -X1yf2kzOm4ohBE5GY9gzAiBCq7HOSkzQDkelmQCCCpGXf/UwYNgQJjSoeGfk0j1a
> -TQ=3D=3D
> ------END CERTIFICATE-----
> ------BEGIN CERTIFICATE-----
> -MIIBhDCCASmgAwIBAgIJALQrf4QDot4IMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM
> -E3MzLmRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1
> -MjQ2WjAeMRwwGgYDVQQDDBNzMy5kb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0C
> -AQYIKoZIzj0DAQcDQgAEEc/Y3T+l3DvINePkpvVZORMIdHVs29jgsl48ia7z/NRX
> -HlKtKxVGJyFN5Y7sBZeLgBYH3F4Bo3KfmxI7ad0tI6NQME4wHQYDVR0OBBYEFIUm
> -cip00QZYpe4ULflbGNJan+Y9MB8GA1UdIwQYMBaAFIUmcip00QZYpe4ULflbGNJa
> -n+Y9MAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhANHij9VZBDHOUPaC
> -pFiagnWnYL2HBR72W1xTKQbrLLTXAiEAvpwA4HzSnGmLd3010+jqQuMRHArN5WaX
> -h0fy7niBbIQ=3D
> ------END CERTIFICATE-----
> diff --git a/support/testing/tests/package/test_mender.py
> b/support/testing/tests/package/test_mender.py
> deleted file mode 100644
> index 14440c9527..0000000000
> --- a/support/testing/tests/package/test_mender.py
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -import os
> -
> -import infra.basetest
> -
> -
> -class TestMenderInfra(infra.basetest.BRTest):
> -    config =3D infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -             """
> -             BR2_PACKAGE_MENDER=3Dy
> -             BR2_PACKAGE_HOST_MENDER_ARTIFACT=3Dy
> -             BR2_TARGET_ROOTFS_CPIO=3Dy
> -             BR2_ROOTFS_POST_BUILD_SCRIPT=3D"{}"
> -             BR2_ROOTFS_OVERLAY=3D"{}"
> -             """.format(
> -
>  infra.filepath("tests/package/test_mender/post-build.sh"),
> -                 # overlay to add a fake 'fw_printenv', used by Mender
> -
>  infra.filepath("tests/package/test_mender/rootfs-overlay"))
> -
> -    def base_test_run(self):
> -        cpio_file =3D os.path.join(self.builddir, "images", "rootfs.cpio=
")
> -        self.emulator.boot(arch=3D"armv5", kernel=3D"builtin",
> -                           options=3D["-initrd", cpio_file])
> -        self.emulator.login()
> -
> -    def run_mender_test(self):
> -        self.assertRunOk("ps aux | egrep [m]ender")
> -
> -        # Check if a simple Mender command is correctly executed
> -        self.assertRunOk("mender -log-level debug show-artifact")
> -        self.assertRunOk("mender -log-level debug show-artifact | grep
> 'RUNTIME_TEST_ARTIFACT_NAME'")
> -        cmd =3D "mender show-artifact 2>&1 | grep -i 'err'"  # Check if =
no
> 'error' among the traces
> -        _, exit_code =3D self.emulator.run(cmd)
> -        self.assertEqual(exit_code, 1)
> -
> -
> -class TestMenderRW(TestMenderInfra):
> -    def test_run(self):
> -        TestMenderInfra.base_test_run(self)
> -
> -        # Check if the Daemon is running
> -        self.assertRunOk("ls /var/run/mender.pid")
> -        self.run_mender_test()
> -
> -
> -class TestMenderRO(TestMenderInfra):
> -    config =3D \
> -        """
> -        {}
> -        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> -        """.format(TestMenderInfra.config)
> -
> -    def test_run(self):
> -        TestMenderInfra.base_test_run(self)
> -
> -        # Check if the Daemon is running
> -        self.assertRunOk("ls /var/run/mender.pid")
> -        self.run_mender_test()
> -
> -
> -# gitlab-runner: large
> -class TestMenderSystemd(TestMenderInfra):
> -    config =3D \
> -        """
> -        {}
> -        BR2_INIT_SYSTEMD=3Dy
> -        """.format(TestMenderInfra.config)
> -
> -    def test_run(self):
> -        TestMenderInfra.base_test_run(self)
> -        output, _ =3D self.emulator.run("systemctl is-active mender-clie=
nt")
> -        self.assertEqual(output[0], "active")
> -        self.run_mender_test()
> diff --git a/support/testing/tests/package/test_mender/post-build.sh
> b/support/testing/tests/package/test_mender/post-build.sh
> deleted file mode 100755
> index 1afa231082..0000000000
> --- a/support/testing/tests/package/test_mender/post-build.sh
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -#!/usr/bin/env bash
> -set -e
> -DEVICE_TYPE=3D"buildroot-arm"
> -ARTIFACT_NAME=3D"RUNTIME_TEST_ARTIFACT_NAME"
> -
> -generate_mender_bootstrap_artifact() {
> -  "${HOST_DIR}"/bin/mender-artifact \
> -    write bootstrap-artifact \
> -    --artifact-name "${ARTIFACT_NAME}" \
> -    --device-type "${DEVICE_TYPE}" \
> -    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
> -    --clears-provides "rootfs-image.*" \
> -    --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
> -    --version 3
> -}
> -
> -function mender_fixup() {
> -  rm -rf "${TARGET_DIR}"/var/lib/mender
> -  mkdir -p "${TARGET_DIR}"/var/lib/mender
> -  echo "device_type=3D${DEVICE_TYPE}" >
> "${TARGET_DIR}"/var/lib/mender/device_type
> -
> -}
> -
> -mender_fixup
> -generate_mender_bootstrap_artifact
> diff --git
> a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/art=
ifact_info
> b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/art=
ifact_info
> deleted file mode 100644
> index 4d54b8f89c..0000000000
> ---
> a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/art=
ifact_info
> +++ /dev/null
> @@ -1 +0,0 @@
> -artifact_name=3DRUNTIME_TEST_ARTIFACT_NAME
> diff --git
> a/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_pri=
ntenv
> b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_pri=
ntenv
> deleted file mode 100755
> index c002a0f2b8..0000000000
> ---
> a/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_pri=
ntenv
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/bin/sh
> -
> -# Fake 'fw_printenv' because UBoot is not installed: print some plausibl=
e
> 'key-value'
> -echo "bootcount=3D0"
> -echo "mender_boot_part=3Drootfs"
> -echo "upgrade_available=3D0"
> --
> 2.47.3
>
>

--000000000000627d9b065b82e8ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bernd;</div><div><br></div><div>At this point I ag=
ree. I have submitted several patches to try and bring these packages, and =
especially</div><div>mender itself up to C++, and the patch series are igno=
red.=C2=A0</div><div><br></div><div>I maintain a branch with modern mender =
support located here:</div><div><a href=3D"https://github.com/mendersoftwar=
e/buildroot-mender">https://github.com/mendersoftware/buildroot-mender</a><=
/div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 14 Sept 2026 at 23:05, Be=
rnd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Building th=
e current mender version 3.5.3 with OpenSSL 4.0.2 is broken:<br>
<br>
hostname.c: In function &#39;do_check_string&#39;:<br>
hostname.c:248:15: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 248 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!a-&gt;data || !a-&gt;len=
gth)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~<br>
hostname.c:248:27: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 248 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!a-&gt;data || !a-&gt;len=
gth)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
hostname.c:252:34: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 252 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (cmp_type !=3D a-&gt;type)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>
hostname.c:255:39: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 255 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return equal(a-&gt;data, a-&gt;length, b, blen);=
<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~<br>
hostname.c:255:48: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 255 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return equal(a-&gt;data, a-&gt;length, b, blen);=
<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>
hostname.c:256:22: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 256 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (a-&gt;length =3D=3D (int)blen &amp;&amp; !memcmp(a-&gt;data, b, blen))<b=
r>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>
hostname.c:256:56: error: invalid use of incomplete typedef &#39;ASN1_STRIN=
G&#39; {aka &#39;struct asn1_string_st&#39;}<br>
=C2=A0 256 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (a-&gt;length =3D=3D (int)blen &amp;&amp; !memcmp(a-&gt;data, b, blen))<b=
r>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br=
>
hostname.c: In function &#39;do_x509_check&#39;:<br>
hostname.c:338:14: warning: assignment discards &#39;const&#39; qualifier f=
rom pointer target type [-Wdiscarded-qualifiers]<br>
=C2=A0 338 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D X509_get_subject_nam=
e(x);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
hostname.c:343:20: warning: assignment discards &#39;const&#39; qualifier f=
rom pointer target type [-Wdiscarded-qualifiers]<br>
=C2=A0 343 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
e =3D X509_NAME_get_entry(name, i);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^<br>
hostname.c:344:21: warning: assignment discards &#39;const&#39; qualifier f=
rom pointer target type [-Wdiscarded-qualifiers]<br>
=C2=A0 344 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
tr =3D X509_NAME_ENTRY_get_data(ne);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
<br>
shim.c: In function &#39;X_SSLv3_method&#39;:<br>
shim.c:484:16: error: implicit declaration of function &#39;SSLv3_method&#3=
9;; did you mean &#39;SSLv23_method&#39;? [-Wimplicit-function-declaration]=
<br>
=C2=A0 484 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return SSLv3_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SSLv23_method<br>
shim.c:484:16: error: returning &#39;int&#39; from a function with return t=
ype &#39;const SSL_METHOD *&#39; {aka &#39;const struct ssl_method_st *&#39=
;} makes pointer from integer without a cast [-Wint-conversion]<br>
=C2=A0 484 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return SSLv3_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~<br>
shim.c: In function &#39;X_TLSv1_method&#39;:<br>
shim.c:491:16: error: implicit declaration of function &#39;TLSv1_method&#3=
9;; did you mean &#39;X_TLSv1_method&#39;? [-Wimplicit-function-declaration=
]<br>
=C2=A0 491 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 X_TLSv1_method<br>
shim.c:491:16: error: returning &#39;int&#39; from a function with return t=
ype &#39;const SSL_METHOD *&#39; {aka &#39;const struct ssl_method_st *&#39=
;} makes pointer from integer without a cast [-Wint-conversion]<br>
=C2=A0 491 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~<br>
shim.c: In function &#39;X_TLSv1_1_method&#39;:<br>
shim.c:496:16: error: implicit declaration of function &#39;TLSv1_1_method&=
#39;; did you mean &#39;X_TLSv1_1_method&#39;? [-Wimplicit-function-declara=
tion]<br>
=C2=A0 496 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_1_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 X_TLSv1_1_method<br>
shim.c:496:16: error: returning &#39;int&#39; from a function with return t=
ype &#39;const SSL_METHOD *&#39; {aka &#39;const struct ssl_method_st *&#39=
;} makes pointer from integer without a cast [-Wint-conversion]<br>
=C2=A0 496 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_1_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~<br>
shim.c: In function &#39;X_TLSv1_2_method&#39;:<br>
shim.c:504:16: error: implicit declaration of function &#39;TLSv1_2_method&=
#39;; did you mean &#39;X_TLSv1_2_method&#39;? [-Wimplicit-function-declara=
tion]<br>
=C2=A0 504 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_2_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 X_TLSv1_2_method<br>
shim.c:504:16: error: returning &#39;int&#39; from a function with return t=
ype &#39;const SSL_METHOD *&#39; {aka &#39;const struct ssl_method_st *&#39=
;} makes pointer from integer without a cast [-Wint-conversion]<br>
=C2=A0 504 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TLSv1_2_method();<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~<br>
<br>
This error blocks the update to OpenSSL 4.0.2 in buildroot.<br>
<br>
Upstream rewrote the package in c++ in version 4.0 and will not provide<br>
updates for the version used in buildroot:<br>
<a href=3D"https://hub.mender.io/t/mender-to-rewrite-client-using-c-and-ret=
ain-go-for-its-backend/5332" rel=3D"noreferrer" target=3D"_blank">https://h=
ub.mender.io/t/mender-to-rewrite-client-using-c-and-retain-go-for-its-backe=
nd/5332</a><br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/67c6d1b12c43=
0313c492dc66b2280d447917feb5" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/commit/67c6d1b12c430313c492dc66b2280d4=
47917feb5</a><br>
<br>
To not block the OpenSSL bump we remove the mender package and its<br>
dependencies.<br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br>
Cc: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com" t=
arget=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
Cc: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagnucci@gmail.com" =
target=3D"_blank">angelo.compagnucci@gmail.com</a>&gt;<br>
---<br>
To start the discussion for a possible bump of OpenSSL to 4.0.2 I split<br>
this patch from my local series because it is from my POV the biggest<br>
obstacle, other packages have fewer to no dependencies and are not<br>
(well) maintainted upstream.<br>
<br>
This patch depends on<br>
<a href=3D"https://patchwork.buildroot.org/project/buildroot/patch/20260914=
192045.1648017-1-bernd@kuhls.net/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://patchwork.buildroot.org/project/buildroot/patch/20260914192045.1648017=
-1-bernd@kuhls.net/</a><br>
from the Boost 1.92.0 series.<br>
<br>
=C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 35 +++<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 -<br>
=C2=A0board/mender/x86_64/genimage-efi.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 43 ---<br>
=C2=A0board/mender/x86_64/linux.config=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 64 -----<br>
=C2=A0board/mender/x86_64/mender_grubenv_defines=C2=A0 =C2=A0 |=C2=A0 25 --=
<br>
=C2=A0board/mender/x86_64/overlay/etc/fstab=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 -<br>
=C2=A0.../x86_64/overlay/etc/mender/mender.conf=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
11 -<br>
=C2=A0board/mender/x86_64/post-build.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 48 ----<br>
=C2=A0board/mender/x86_64/post-image-efi.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 92 -------<br>
=C2=A0board/mender/x86_64/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 69 -----<br>
=C2=A0configs/mender_x86_64_efi_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 54 ----<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
=C2=A0package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0package/mender-artifact/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 19 --<br>
=C2=A0package/mender-artifact/mender-artifact.hash=C2=A0 | 106 --------<br>
=C2=A0package/mender-artifact/<a href=3D"http://mender-artifact.mk" rel=3D"=
noreferrer" target=3D"_blank">mender-artifact.mk</a>=C2=A0 =C2=A0 | 118 ---=
------<br>
=C2=A0package/mender-connect/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 34 ---<br>
=C2=A0package/mender-connect/S43mender-connect=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
53 ----<br>
=C2=A0package/mender-connect/mender-connect.hash=C2=A0 =C2=A0 |=C2=A0 35 --=
-<br>
=C2=A0package/mender-connect/<a href=3D"http://mender-connect.mk" rel=3D"no=
referrer" target=3D"_blank">mender-connect.mk</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 60 -----<br>
=C2=A0package/mender-grubenv/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 43 ---<br>
=C2=A0package/mender-grubenv/mender-grubenv.hash=C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 -<br>
=C2=A0package/mender-grubenv/<a href=3D"http://mender-grubenv.mk" rel=3D"no=
referrer" target=3D"_blank">mender-grubenv.mk</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 90 -------<br>
=C2=A0package/mender-update-modules/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
50 ------------------<br>
=C2=A0.../mender-update-modules.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 -<br>
=C2=A0.../<a href=3D"http://mender-update-modules.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">mender-update-modules.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 77 ------<br>
=C2=A0package/mender/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 45 ----<br>
=C2=A0package/mender/S42mender=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 ---<br>
=C2=A0package/mender/device_type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0package/mender/mender-client.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 -<br>
=C2=A0package/mender/mender.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 -<br>
=C2=A0package/mender/mender.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 47 ----<br>
=C2=A0package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer" target=
=3D"_blank">mender.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 110 --------<br>
=C2=A0package/mender/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 132 ---------<br>
=C2=A0package/mender/server.crt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 --<br>
=C2=A0support/testing/tests/package/test_mender.py=C2=A0 |=C2=A0 72 -----<b=
r>
=C2=A0.../tests/package/test_mender/post-build.sh=C2=A0 =C2=A0|=C2=A0 25 --=
<br>
=C2=A0.../rootfs-overlay/etc/mender/artifact_info=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 -<br>
=C2=A0.../rootfs-overlay/usr/bin/fw_printenv=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 -<br>
=C2=A040 files changed, 35 insertions(+), 1843 deletions(-)<br>
=C2=A0delete mode 100644 board/mender/x86_64/genimage-efi.cfg<br>
=C2=A0delete mode 100644 board/mender/x86_64/linux.config<br>
=C2=A0delete mode 100644 board/mender/x86_64/mender_grubenv_defines<br>
=C2=A0delete mode 100644 board/mender/x86_64/overlay/etc/fstab<br>
=C2=A0delete mode 100644 board/mender/x86_64/overlay/etc/mender/mender.conf=
<br>
=C2=A0delete mode 100755 board/mender/x86_64/post-build.sh<br>
=C2=A0delete mode 100755 board/mender/x86_64/post-image-efi.sh<br>
=C2=A0delete mode 100644 board/mender/x86_64/readme.txt<br>
=C2=A0delete mode 100644 configs/mender_x86_64_efi_defconfig<br>
=C2=A0delete mode 100644 package/mender-artifact/Config.in.host<br>
=C2=A0delete mode 100644 package/mender-artifact/mender-artifact.hash<br>
=C2=A0delete mode 100644 package/mender-artifact/<a href=3D"http://mender-a=
rtifact.mk" rel=3D"noreferrer" target=3D"_blank">mender-artifact.mk</a><br>
=C2=A0delete mode 100644 package/mender-connect/Config.in<br>
=C2=A0delete mode 100644 package/mender-connect/S43mender-connect<br>
=C2=A0delete mode 100644 package/mender-connect/mender-connect.hash<br>
=C2=A0delete mode 100644 package/mender-connect/<a href=3D"http://mender-co=
nnect.mk" rel=3D"noreferrer" target=3D"_blank">mender-connect.mk</a><br>
=C2=A0delete mode 100644 package/mender-grubenv/Config.in<br>
=C2=A0delete mode 100644 package/mender-grubenv/mender-grubenv.hash<br>
=C2=A0delete mode 100644 package/mender-grubenv/<a href=3D"http://mender-gr=
ubenv.mk" rel=3D"noreferrer" target=3D"_blank">mender-grubenv.mk</a><br>
=C2=A0delete mode 100644 package/mender-update-modules/Config.in<br>
=C2=A0delete mode 100644 package/mender-update-modules/mender-update-module=
s.hash<br>
=C2=A0delete mode 100644 package/mender-update-modules/<a href=3D"http://me=
nder-update-modules.mk" rel=3D"noreferrer" target=3D"_blank">mender-update-=
modules.mk</a><br>
=C2=A0delete mode 100644 package/mender/Config.in<br>
=C2=A0delete mode 100644 package/mender/S42mender<br>
=C2=A0delete mode 100644 package/mender/device_type<br>
=C2=A0delete mode 100644 package/mender/mender-client.service<br>
=C2=A0delete mode 100644 package/mender/mender.conf<br>
=C2=A0delete mode 100644 package/mender/mender.hash<br>
=C2=A0delete mode 100644 package/mender/<a href=3D"http://mender.mk" rel=3D=
"noreferrer" target=3D"_blank">mender.mk</a><br>
=C2=A0delete mode 100644 package/mender/readme.txt<br>
=C2=A0delete mode 100644 package/mender/server.crt<br>
=C2=A0delete mode 100644 support/testing/tests/package/test_mender.py<br>
=C2=A0delete mode 100755 support/testing/tests/package/test_mender/post-bui=
ld.sh<br>
=C2=A0delete mode 100644 support/testing/tests/package/test_mender/rootfs-o=
verlay/etc/mender/artifact_info<br>
=C2=A0delete mode 100755 support/testing/tests/package/test_mender/rootfs-o=
verlay/usr/bin/fw_printenv<br>
<br>
diff --git a/.checkpackageignore b/.checkpackageignore<br>
index 2b61ff3bab..8e1cf9298d 100644<br>
--- a/.checkpackageignore<br>
+++ b/.checkpackageignore<br>
@@ -103,7 +103,6 @@ configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHa=
sh<br>
=C2=A0configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash<br>
-configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHas=
h<br>
=C2=A0configs/microchip_sam9x60ek_mmc_dev_defconfig lib_defconfig.ForceChec=
kHash<br>
=C2=A0configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig lib_defconfig.Forc=
eCheckHash<br>
@@ -595,7 +594,6 @@ package/matchbox-startup-monitor/0001-true-false.patch =
lib_patch.Upstream<br>
=C2=A0package/matchbox/0001-defaulttheme.patch lib_patch.Upstream<br>
=C2=A0package/matchbox/0002-src-Fix-build-with-gcc-10.patch lib_patch.Upstr=
eam<br>
=C2=A0package/memstat/0001-PATH_MAX.patch lib_patch.Upstream<br>
-package/mender-connect/S43mender-connect Shellcheck<br>
=C2=A0package/menu-cache/0001-Support-gcc10-compilation.patch lib_patch.Ups=
tream<br>
=C2=A0package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.pa=
tch lib_patch.Upstream<br>
=C2=A0package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-i=
n-for.patch lib_patch.Upstream<br>
diff --git a/Config.in.legacy b/Config.in.legacy<br>
index 4f5c91c0ec..f7008c76c7 100644<br>
--- a/Config.in.legacy<br>
+++ b/Config.in.legacy<br>
@@ -146,6 +146,41 @@ endif<br>
<br>
=C2=A0comment &quot;Legacy options removed in 2026.11&quot;<br>
<br>
+config BR2_PACKAGE_MENDER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender has been removed&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender packages have been removed be=
cause they are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0incompatible with OpenSSL &gt;=3D 4.x<br=
>
+<br>
+config BR2_PACKAGE_MENDER_UPDATE_MODULES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender-update-modules has been remov=
ed&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender packages have been removed be=
cause they are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0incompatible with OpenSSL &gt;=3D 4.x<br=
>
+<br>
+config BR2_PACKAGE_MENDER_GRUBENV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender-grubenv has been removed&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender packages have been removed be=
cause they are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0incompatible with OpenSSL &gt;=3D 4.x<br=
>
+<br>
+config BR2_PACKAGE_MENDER_CONNECT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender-connect has been removed&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender packages have been removed be=
cause they are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0incompatible with OpenSSL &gt;=3D 4.x<br=
>
+<br>
+config BR2_PACKAGE_HOST_MENDER_ARTIFACT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;host mender-artifact has been remove=
d&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender packages have been removed be=
cause they are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0incompatible with OpenSSL &gt;=3D 4.x<br=
>
+<br>
=C2=A0config BR2_PACKAGE_LIBCPPRESTSDK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;libcpprestsdk has been removed&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_LEGACY<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 97eb2d9cac..442a9c5b7a 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -39,7 +39,6 @@ F:=C2=A0 =C2=A0 package/flutter-packages/flutter-rfw-loca=
l-example/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-pi/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-sdk-bin/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/ivi-homescreen/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/mender-update-modules/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0support/testing/tests/package/test_flutter.py<b=
r>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Adam Heinrich &lt;<a href=3D"mailto:adam@adamh.=
cz" target=3D"_blank">adam@adamh.cz</a>&gt;<br>
@@ -237,8 +236,6 @@ F:=C2=A0 package/jq/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libapparmor/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libb64/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libdill/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/mender/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/mender-artifact/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mono/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mono-gtksharp3/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/monolite/<br>
diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/gen=
image-efi.cfg<br>
deleted file mode 100644<br>
index 9c2723d8fb..0000000000<br>
--- a/board/mender/x86_64/genimage-efi.cfg<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-image efi-part.vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file EFI {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0image =3D &quot;efi-part/EFI&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file grub-mender-gr=
ubenv {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0image =3D &quot;efi-part/grub-mender-grubenv&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file bzImage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0image =3D &quot;bzImage&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 16M<br>
-}<br>
-<br>
-image disk.img {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-table-typ=
e =3D &quot;gpt&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition boot {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid=
 =3D U<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 32K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;efi=
-part.vfat&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D true<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition roota {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid=
 =3D 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid=
 =3D 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition data {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type-uuid=
 =3D L<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;dat=
a-part.ext4&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.c=
onfig<br>
deleted file mode 100644<br>
index f17fc18edb..0000000000<br>
--- a/board/mender/x86_64/linux.config<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-CONFIG_SYSVIPC=3Dy<br>
-CONFIG_SMP=3Dy<br>
-CONFIG_HYPERVISOR_GUEST=3Dy<br>
-CONFIG_PARAVIRT=3Dy<br>
-CONFIG_EFI=3Dy<br>
-CONFIG_MODULES=3Dy<br>
-CONFIG_MODULE_UNLOAD=3Dy<br>
-CONFIG_NET=3Dy<br>
-CONFIG_PACKET=3Dy<br>
-CONFIG_UNIX=3Dy<br>
-CONFIG_INET=3Dy<br>
-CONFIG_NETFILTER=3Dy<br>
-CONFIG_IP_NF_IPTABLES=3Dy<br>
-CONFIG_IP_NF_FILTER=3Dy<br>
-CONFIG_CFG80211=3Dm<br>
-CONFIG_CFG80211_WEXT=3Dy<br>
-CONFIG_MAC80211=3Dm<br>
-CONFIG_PCI=3Dy<br>
-CONFIG_DEVTMPFS=3Dy<br>
-CONFIG_DEVTMPFS_MOUNT=3Dy<br>
-CONFIG_VIRTIO_BLK=3Dy<br>
-CONFIG_BLK_DEV_SD=3Dy<br>
-CONFIG_SCSI_VIRTIO=3Dy<br>
-CONFIG_ATA=3Dy<br>
-CONFIG_NETDEVICES=3Dy<br>
-CONFIG_VIRTIO_NET=3Dy<br>
-CONFIG_ATH9K=3Dm<br>
-CONFIG_ATH9K_HTC=3Dm<br>
-CONFIG_CARL9170=3Dm<br>
-CONFIG_ATH10K=3Dm<br>
-CONFIG_RT2X00=3Dm<br>
-CONFIG_RT73USB=3Dm<br>
-CONFIG_RT2800USB=3Dm<br>
-CONFIG_RT2800USB_RT3573=3Dy<br>
-CONFIG_RT2800USB_RT53XX=3Dy<br>
-CONFIG_RT2800USB_RT55XX=3Dy<br>
-# CONFIG_RTL_CARDS is not set<br>
-CONFIG_RTL8XXXU=3Dm<br>
-CONFIG_INPUT_EVDEV=3Dy<br>
-CONFIG_SERIAL_8250=3Dy<br>
-CONFIG_SERIAL_8250_CONSOLE=3Dy<br>
-CONFIG_VIRTIO_CONSOLE=3Dy<br>
-CONFIG_HW_RANDOM_VIRTIO=3Dm<br>
-CONFIG_DRM=3Dy<br>
-CONFIG_DRM_VIRTIO_GPU=3Dy<br>
-CONFIG_FB_VESA=3Dy<br>
-CONFIG_SOUND=3Dy<br>
-CONFIG_SND=3Dy<br>
-CONFIG_USB=3Dy<br>
-CONFIG_USB_XHCI_HCD=3Dy<br>
-CONFIG_USB_EHCI_HCD=3Dy<br>
-CONFIG_USB_STORAGE=3Dy<br>
-CONFIG_VIRTIO_PCI=3Dy<br>
-CONFIG_VIRTIO_BALLOON=3Dy<br>
-CONFIG_VIRTIO_INPUT=3Dy<br>
-CONFIG_VIRTIO_MMIO=3Dy<br>
-CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy<br>
-CONFIG_EXT4_FS=3Dy<br>
-CONFIG_FUSE_FS=3Dy<br>
-CONFIG_VFAT_FS=3Dy<br>
-CONFIG_SQUASHFS=3Dy<br>
-CONFIG_NLS_CODEPAGE_437=3Dy<br>
-CONFIG_NLS_ISO8859_1=3Dy<br>
-CONFIG_UNWINDER_FRAME_POINTER=3Dy<br>
diff --git a/board/mender/x86_64/mender_grubenv_defines b/board/mender/x86_=
64/mender_grubenv_defines<br>
deleted file mode 100644<br>
index 77f68fe6b2..0000000000<br>
--- a/board/mender/x86_64/mender_grubenv_defines<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-##########################################################################=
######<br>
-# Mandatory<br>
-##########################################################################=
######<br>
-# Warning: This file is an example and should be customized to fit your ne=
eds!<br>
-<br>
-# Partition index of root filesystem A<br>
-mender_rootfsa_part=3D2<br>
-<br>
-# Partition index of root filesystem B<br>
-mender_rootfsb_part=3D3<br>
-<br>
-# Device file corresponding to the root filesystem partitions, without ind=
ex.<br>
-mender_kernel_root_base=3D/dev/vda<br>
-<br>
-# Name of the storage device containing root filesystem partitions in GRUB=
<br>
-# format.<br>
-mender_grub_storage_device=3Dhd0<br>
-<br>
-# Type of kernel (bzImage or zImage)<br>
-kernel_imagetype=3DbzImage<br>
-<br>
-# Type of initrd image.<br>
-# Note: An initrd image is not strictly necessary, and the system will boo=
t and<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0update without a initrd image.<br>
-# initrd_imagetype=3Dinitrd.img<br>
diff --git a/board/mender/x86_64/overlay/etc/fstab b/board/mender/x86_64/ov=
erlay/etc/fstab<br>
deleted file mode 100644<br>
index 45a7ba0260..0000000000<br>
--- a/board/mender/x86_64/overlay/etc/fstab<br>
+++ /dev/null<br>
@@ -1,7 +0,0 @@<br>
-# &lt;file system&gt;=C2=A0 =C2=A0 =C2=A0&lt;mount pt&gt;=C2=A0 =C2=A0 =C2=
=A0 &lt;type&gt;=C2=A0 =C2=A0 =C2=A0 &lt;options&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;dump&gt;=C2=A0 &lt;pass&gt;<br>
-/dev/root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext4=C2=A0 =C2=A0 =C2=A0 =C2=A0 rw,noauto=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 1<br>
-/dev/vda1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/boot=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0vfat=C2=A0 =C2=A0 =C2=A0 =C2=A0 defaults=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 0<br>
-/dev/vda4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/lib/mender ext4=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 rw,relatime=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00=C2=A0 =C2=A0 0<br>
-proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /proc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 defaults=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 0<br>
-devpts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/pts=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 devpts=C2=A0 =C2=A0 =C2=A0 defaults,gid=3D5,mode=3D620,pt=
mxmode=3D0666=C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 0<br>
-sysfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysfs=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 0<br>
diff --git a/board/mender/x86_64/overlay/etc/mender/mender.conf b/board/men=
der/x86_64/overlay/etc/mender/mender.conf<br>
deleted file mode 100644<br>
index 5f423fb2cb..0000000000<br>
--- a/board/mender/x86_64/overlay/etc/mender/mender.conf<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-{<br>
-=C2=A0 &quot;InventoryPollIntervalSeconds&quot;: 1800,<br>
-=C2=A0 &quot;UpdatePollIntervalSeconds&quot;: 1800,<br>
-=C2=A0 &quot;RetryPollIntervalSeconds&quot;: 300,<br>
-=C2=A0 &quot;RootfsPartA&quot;: &quot;/dev/vda2&quot;,<br>
-=C2=A0 &quot;RootfsPartB&quot;: &quot;/dev/vda3&quot;,<br>
-=C2=A0 &quot;ServerCertificate&quot;: &quot;/etc/mender/server.crt&quot;,<=
br>
-=C2=A0 &quot;ServerURL&quot;: &quot;<a href=3D"https://docker.mender.io" r=
el=3D"noreferrer" target=3D"_blank">https://docker.mender.io</a>&quot;,<br>
-=C2=A0 &quot;TenantToken&quot;: &quot;dummy&quot;,<br>
-=C2=A0 &quot;DeviceTypeFile&quot;: &quot;/etc/mender/device_type&quot;<br>
-}<br>
diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-b=
uild.sh<br>
deleted file mode 100755<br>
index 9e909e9281..0000000000<br>
--- a/board/mender/x86_64/post-build.sh<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-#!/usr/bin/env bash<br>
-set -e<br>
-DEVICE_TYPE=3D&quot;buildroot-x86_64&quot;<br>
-<br>
-parse_args() {<br>
-=C2=A0 =C2=A0 local o O opts<br>
-=C2=A0 =C2=A0 o=3D&#39;a:o:d:&#39;<br>
-=C2=A0 =C2=A0 O=3D&#39;artifact-name:,data-part-size:,device-type:&#39;<br=
>
-=C2=A0 =C2=A0 opts=3D&quot;$(getopt -o &quot;${o}&quot; -l &quot;${O}&quot=
; -- &quot;${@}&quot;)&quot;<br>
-=C2=A0 =C2=A0 eval set -- &quot;${opts}&quot;<br>
-=C2=A0 =C2=A0 while [ ${#} -gt 0 ]; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;${1}&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-o|--data-part-size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignored to have same options a=
s other scripts<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-d|--device-type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVICE_TYPE=3D&quot;${2}&quot;; =
shift 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-a|--artifact-name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignored to have same options a=
s other scripts<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (--)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift; break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-=C2=A0 =C2=A0 done<br>
-}<br>
-<br>
-# Create a persistent directory to mount the data partition at.<br>
-mender_fixup() {<br>
-=C2=A0 =C2=A0 pushd &quot;${TARGET_DIR}&quot;<br>
-=C2=A0 =C2=A0 # The common paradigm is to have the persistent data volume =
at /data for mender.<br>
-=C2=A0 =C2=A0 if [[ ! -L data ]]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s var/lib/mender data<br>
-=C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 popd<br>
-}<br>
-<br>
-main() {<br>
-=C2=A0 =C2=A0 parse_args &quot;${@}&quot;<br>
-=C2=A0 =C2=A0 mender_fixup<br>
-=C2=A0 =C2=A0 echo &quot;device_type=3D${DEVICE_TYPE}&quot; &gt; &quot;${T=
ARGET_DIR}/etc/mender/device_type&quot;<br>
-}<br>
-<br>
-main &quot;${@}&quot;<br>
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/po=
st-image-efi.sh<br>
deleted file mode 100755<br>
index a3e262f8fe..0000000000<br>
--- a/board/mender/x86_64/post-image-efi.sh<br>
+++ /dev/null<br>
@@ -1,92 +0,0 @@<br>
-#!/usr/bin/env bash<br>
-set -e<br>
-BOARD_DIR=3D&quot;$(realpath &quot;$(dirname &quot;$0&quot;)&quot;)&quot;<=
br>
-DATA_PART=3D&quot;${BINARIES_DIR}&quot;/data-part<br>
-DATA_PART_SIZE=3D&quot;32M&quot;<br>
-DEVICE_TYPE=3D&quot;buildroot-x86_64&quot;<br>
-ARTIFACT_NAME=3D&quot;1.0&quot;<br>
-<br>
-# Parse arguments.<br>
-parse_args() {<br>
-=C2=A0 =C2=A0 local o O opts<br>
-=C2=A0 =C2=A0 o=3D&#39;a:o:d:&#39;<br>
-=C2=A0 =C2=A0 O=3D&#39;artifact-name:,data-part-size:,device-type:&#39;<br=
>
-=C2=A0 =C2=A0 opts=3D&quot;$(getopt -o &quot;${o}&quot; -l &quot;${O}&quot=
; -- &quot;${@}&quot;)&quot;<br>
-=C2=A0 =C2=A0 eval set -- &quot;${opts}&quot;<br>
-=C2=A0 =C2=A0 while [ ${#} -gt 0 ]; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;${1}&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-o|--data-part-size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DATA_PART_SIZE=3D&quot;${2}&quot=
;; shift 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-d|--device-type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVICE_TYPE=3D&quot;${2}&quot;; =
shift 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (-a|--artifact-name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARTIFACT_NAME=3D&quot;${2}&quot;=
; shift 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (--)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift; break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-=C2=A0 =C2=A0 done<br>
-}<br>
-<br>
-# Create the data partition<br>
-make_data_partition() {<br>
-=C2=A0 =C2=A0 &quot;${HOST_DIR}/sbin/mkfs.ext4&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -d &quot;${DATA_PART}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -F \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -r 1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -N 0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 5 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -L &quot;data&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${BINARIES_DIR}/data-part.ext4&quot; &qu=
ot;${DATA_PART_SIZE}&quot;<br>
-}<br>
-<br>
-# Generate a mender bootstrap artifact.<br>
-# See <a href=3D"https://github.com/mendersoftware/mender/blob/3.5.3/Docum=
entation/automatic-bootstrap-artifact.md-generate_mender_bootstrap_artifact=
()" rel=3D"noreferrer" target=3D"_blank">https://github.com/mendersoftware/=
mender/blob/3.5.3/Documentation/automatic-bootstrap-artifact.md<br>
-generate_mender_bootstrap_artifact()</a> {<br>
-<br>
-=C2=A0 rm -rf &quot;${DATA_PART}&quot;<br>
-=C2=A0 mkdir -p &quot;${DATA_PART}&quot;<br>
-=C2=A0 img_checksum=3D$(sha256sum &quot;${BINARIES_DIR}&quot;/rootfs.ext4 =
|awk &#39;{print $1}&#39;)<br>
-<br>
-=C2=A0 &quot;${HOST_DIR}&quot;/bin/mender-artifact \<br>
-=C2=A0 =C2=A0 write bootstrap-artifact \<br>
-=C2=A0 =C2=A0 --compression none \<br>
-=C2=A0 =C2=A0 --artifact-name &quot;${ARTIFACT_NAME}&quot; \<br>
-=C2=A0 =C2=A0 --device-type &quot;${DEVICE_TYPE}&quot; \<br>
-=C2=A0 =C2=A0 --provides &quot;rootfs-image.version:${ARTIFACT_NAME}&quot;=
 \<br>
-=C2=A0 =C2=A0 --provides &quot;rootfs-image.checksum:${img_checksum}&quot;=
 \<br>
-=C2=A0 =C2=A0 --clears-provides &quot;rootfs-image.*&quot; \<br>
-=C2=A0 =C2=A0 --output-path &quot;${DATA_PART}&quot;/bootstrap.mender \<br=
>
-=C2=A0 =C2=A0 --version 3<br>
-}<br>
-<br>
-# Create a mender image.<br>
-generate_mender_image() {<br>
-=C2=A0 =C2=A0 echo &quot;Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFAC=
T_NAME}.mender&quot;<br>
-=C2=A0 =C2=A0 &quot;${HOST_DIR}/bin/mender-artifact&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write rootfs-image \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --compression none \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -t &quot;${DEVICE_TYPE}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -n &quot;${BR2_VERSION}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -f &quot;${BINARIES_DIR}/rootfs.ext2&quot; \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o &quot;${BINARIES_DIR}/${DEVICE_TYPE}-${ARTI=
FACT_NAME}.mender&quot;<br>
-}<br>
-<br>
-generate_image() {<br>
-=C2=A0 =C2=A0 support/scripts/genimage.sh -c &quot;${BOARD_DIR}/genimage-e=
fi.cfg&quot;<br>
-}<br>
-<br>
-# Main function.<br>
-main() {<br>
-=C2=A0 =C2=A0 parse_args &quot;${@}&quot;<br>
-=C2=A0 =C2=A0 generate_mender_bootstrap_artifact<br>
-=C2=A0 =C2=A0 make_data_partition<br>
-=C2=A0 =C2=A0 generate_image<br>
-=C2=A0 =C2=A0 generate_mender_image<br>
-=C2=A0 =C2=A0 exit $?<br>
-}<br>
-<br>
-main &quot;${@}&quot;<br>
diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.tx=
t<br>
deleted file mode 100644<br>
index 01a0254511..0000000000<br>
--- a/board/mender/x86_64/readme.txt<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-Mender UEFI PC sample config<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-1. Build<br>
-<br>
-=C2=A0 $ make mender_x86_64_efi_defconfig<br>
-<br>
-=C2=A0 Add any additional packages required. Update the files in board/men=
der/x86_64<br>
-=C2=A0 and change /dev/vda to what is relevant for your platform: typicall=
y<br>
-=C2=A0 /dev/mmcblk0p for eMMC and /dev/sda for USB or SATA.<br>
-<br>
-=C2=A0 $ make<br>
-<br>
-2. Write the image<br>
-<br>
-=C2=A0 The build process will create a all-in-one image called disk.img in=
<br>
-=C2=A0 output/images.<br>
-<br>
-=C2=A0 Write the image to a pendrive:<br>
-<br>
-=C2=A0 $ dd if=3Doutput/images/disk.img of=3D/dev/sdX; sync<br>
-<br>
-=C2=A0 Once the process is complete, insert it into the target PC and boot=
.<br>
-<br>
-=C2=A0 Remember that if said PC has another boot device you might need to<=
br>
-=C2=A0 select this alternative for it to boot.<br>
-<br>
-=C2=A0 You might need to disable Secure Boot from the setup as well.<br>
-<br>
-3. Enjoy<br>
-<br>
-Emulation in qemu<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
-<br>
-Run the emulation with:<br>
-<br>
-qemu-system-x86_64 \<br>
-=C2=A0 =C2=A0 -M pc \<br>
-=C2=A0 =C2=A0 -drive file=3Doutput/images/disk.img,if=3Dvirtio,format=3Dra=
w \<br>
-=C2=A0 =C2=A0 -net nic,model=3Dvirtio \<br>
-=C2=A0 =C2=A0 -net user \<br>
-=C2=A0 =C2=A0 -serial stdio \<br>
-=C2=A0 =C2=A0 -bios &lt;/path/to/OVMF_CODE.fd&gt;<br>
-<br>
-Note that &lt;/path/to/OVMF.fd&gt; needs to point to a valid x86_64 UEFI<b=
r>
-firmware image for qemu. It may be provided by your distribution as an<br>
-edk2 or OVMF package, in a path such as /usr/share/edk2/ovmf/OVMF_CODE.fd.=
<br>
-<br>
-Optional arguments:<br>
- - -enable-kvm to speed up qemu. This requires a loaded kvm module on the =
host<br>
-=C2=A0 =C2=A0 system.<br>
- - Add -smp N to emulate an SMP system with N CPUs.<br>
-<br>
-The login prompt will appear in the serial window.<br>
-<br>
-Tested with QEMU 4.1.1 on Fedora 31<br>
-<br>
-Creating a mender-artifact<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
-<br>
-The mender artifact is created in output/images/buildroot-x86_64-1.0.mende=
r<br>
-<br>
-You may wish to change --artifact-name=3D1.0 to a name that best suits you=
r<br>
-particular needs, as this option changes the mender artifact name.<br>
-<br>
-Using mender<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
-Please read the mender documentation at:<br>
-<a href=3D"https://docs.mender.io" rel=3D"noreferrer" target=3D"_blank">ht=
tps://docs.mender.io</a><br>
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_ef=
i_defconfig<br>
deleted file mode 100644<br>
index 219f02839c..0000000000<br>
--- a/configs/mender_x86_64_efi_defconfig<br>
+++ /dev/null<br>
@@ -1,54 +0,0 @@<br>
-BR2_x86_64=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy<br>
-BR2_INIT_SYSV=3Dy<br>
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy<br>
-BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyS0&quot;<br>
-BR2_ROOTFS_OVERLAY=3D&quot;board/mender/x86_64/overlay&quot;<br>
-BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/mender/x86_64/post-build.sh&quo=
t;<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/mender/x86_64/post-image-efi.sh=
&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;--data-part-size=3D32M --device-type=
=3Dbuildroot-x86_64 --artifact-name=3D1.0&quot;<br>
-BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.12.28&quot;<br>
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/mender/x86_64/linux.conf=
ig&quot;<br>
-BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
-BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=3Dy<br>
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=3Dy<br>
-BR2_PACKAGE_ACPID=3Dy<br>
-BR2_PACKAGE_CONNMAN=3Dy<br>
-BR2_PACKAGE_CONNMAN_WIFI=3Dy<br>
-BR2_PACKAGE_CONNMAN_CLIENT=3Dy<br>
-BR2_PACKAGE_MENDER=3Dy<br>
-BR2_PACKAGE_MENDER_GRUBENV=3Dy<br>
-BR2_PACKAGE_MENDER_GRUBENV_DEFINES=3D&quot;board/mender/x86_64/mender_grub=
env_defines&quot;<br>
-BR2_TARGET_ROOTFS_EXT2=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;128M&quot;<br>
-# BR2_TARGET_ROOTFS_TAR is not set<br>
-BR2_TARGET_GRUB2=3Dy<br>
-BR2_TARGET_GRUB2_X86_64_EFI=3Dy<br>
-BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI=3D&quot;boot linux ext2 fat squash4 p=
art_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 tes=
t regexp sleep&quot;<br>
-BR2_TARGET_GRUB2_INSTALL_TOOLS=3Dy<br>
-BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
-BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-BR2_PACKAGE_HOST_MENDER_ARTIFACT=3Dy<br>
-BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
diff --git a/package/Config.in b/package/Config.in<br>
index aa94d44eca..472e60bad0 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2849,10 +2849,6 @@ menu &quot;System tools&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libvirt/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lxc/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/makedumpfile/Config.in&quo=
t;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/mender/Config.in&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/mender-connect/Config.in&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/mender-grubenv/Config.in&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/mender-update-modules/Conf=
ig.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mfoc/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/moby-buildkit/Config.in&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mokutil/Config.in&quot;<br=
>
diff --git a/package/Config.in.host b/package/Config.in.host<br>
index 595caf9e7f..dfd9317e8a 100644<br>
--- a/package/Config.in.host<br>
+++ b/package/Config.in.host<br>
@@ -66,7 +66,6 @@ menu &quot;Host utilities&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lpc3250loader/Config.in.ho=
st&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lttng-babeltrace/Config.in=
.host&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lzma-alone/Config.in.host&=
quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/mender-artifact/Config.in.=
host&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/meson-tools/Config.in.host=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mfgtools/Config.in.host&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/microchip-hss-payload-gene=
rator/Config.in.host&quot;<br>
diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifa=
ct/Config.in.host<br>
deleted file mode 100644<br>
index 39353b23e7..0000000000<br>
--- a/package/mender-artifact/Config.in.host<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-config BR2_PACKAGE_HOST_MENDER_ARTIFACT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;host mender-artifact&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPOR=
TS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_GO<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender-artifact tool is a CLI implem=
entation of the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mender artifacts library.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A Mender artifact can be recognized by i=
ts .mender suffix.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mender artifacts can contain binaries, m=
etadata, checksums,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signatures and scripts that are used dur=
ing a deployment.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The artifact format acts as a wrapper, a=
nd uses the tar<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format to bundle several files into one.=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In its simplest form, an artifact contai=
ns just a rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image, along with its checksum, id and d=
evice type<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatibility.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-artifact" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/mendersoftware/mender-artifact</a><br>
diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-=
artifact/mender-artifact.hash<br>
deleted file mode 100644<br>
index 5dffdbb7df..0000000000<br>
--- a/package/mender-artifact/mender-artifact.hash<br>
+++ /dev/null<br>
@@ -1,106 +0,0 @@<br>
-# Locally computed:<br>
-sha256=C2=A0 c7002052028496f230c34ef6f0488bf5e8ca32b075b7a96555532fe928aed=
984=C2=A0 mender-artifact-4.4.1-go2.tar.gz<br>
-sha256=C2=A0 0e7c48f6471ca81a2fce9e3f605dffeb0385afd4dc3b5eb7f4e86ece4aa9b=
068=C2=A0 LIC_FILES_CHKSUM.sha256<br>
-<br>
-# License hash extracted from LIC_FILES_CHKSUM.sha256 using the<br>
-# following command:<br>
-#<br>
-#=C2=A0 =C2=A0 =C2=A0sed &#39;/^[A-Za-z0-9_]/s/^/sha256=C2=A0 /&#39; LIC_F=
ILES_CHKSUM.sha256<br>
-<br>
-# Apache 2.0 licenses.<br>
-sha256=C2=A0 d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9e=
b47=C2=A0 LICENSE<br>
-sha256=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523=
d30=C2=A0 vendor/<a href=3D"http://github.com/minio/sha256-simd/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/minio/sha256-simd/LICE=
NSE<br>
-sha256</a>=C2=A0 132fb47b89947cd5f98e380186bc412af5561c70669d37d3a83b36f03=
a0ddae5=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/progressba=
r/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersof=
tware/progressbar/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://google.golang.org/genproto/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto/LICE=
NSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://google.golang.org/genproto/googleapi=
s/api/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">google.golang.or=
g/genproto/googleapis/api/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://google.golang.org/genproto/googleapi=
s/rpc/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">google.golang.or=
g/genproto/googleapis/rpc/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://google.golang.org/grpc/LICENSE-sha25=
6" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://cloud.google.com/go/kms/LICENSE-sha2=
56" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/kms/LICENSE<br=
>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://cloud.google.com/go/iam/LICENSE-sha2=
56" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/iam/LICENSE<br=
>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://cloud.google.com/go/compute/metadata=
/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/c=
ompute/metadata/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://cloud.google.com/go/auth/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/auth/LICENSE<=
br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://cloud.google.com/go/auth/oauth2adapt=
/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/a=
uth/oauth2adapt/LICENSE<br>
-sha256</a>=C2=A0 73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85=
130bf68=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/openssl/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwar=
e/openssl/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://github.com/googleapis/enterprise-cer=
tificate-proxy/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.=
com/googleapis/enterprise-certificate-proxy/LICENSE<br>
-sha256</a>=C2=A0 dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab=
78b324d=C2=A0 vendor/<a href=3D"http://github.com/go-jose/go-jose/v3/json/L=
ICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/go-jose/go-j=
ose/v3/json/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://github.com/go-jose/go-jose/v3/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/go-jose/go-jose/v=
3/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://github.com/google/s2a-go/LICENSE.md-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/google/s2a-go/LICEN=
SE.md<br>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://github.com/Keyfactor/signserver-go-c=
lient-sdk/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/K=
eyfactor/signserver-go-client-sdk/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://github.com/kylelemons/godebug/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/kylelemons/godebu=
g/LICENSE<br>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://go.opentelemetry.io/otel/trace/LICEN=
SE-sha256" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/tr=
ace/LICENSE<br>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://go.opentelemetry.io/otel/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/LICENSE<=
br>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://go.opentelemetry.io/otel/metric/LICE=
NSE-sha256" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/m=
etric/LICENSE<br>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://go.opentelemetry.io/contrib/instrume=
ntation/net/http/otelhttp/LICENSE-sha256" rel=3D"noreferrer" target=3D"_bla=
nk">go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/LICENSE<b=
r>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://go.opentelemetry.io/contrib/instrume=
ntation/google.golang.org/grpc/otelgrpc/LICENSE-sha256" rel=3D"noreferrer" =
target=3D"_blank">go.opentelemetry.io/contrib/instrumentation/google.golang=
.org/grpc/otelgrpc/LICENSE<br>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://go.opentelemetry.io/auto/sdk/LICENSE=
-sha256" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/auto/sdk/=
LICENSE<br>
-sha256</a>=C2=A0 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555=
ef833e1=C2=A0 vendor/<a href=3D"http://github.com/go-logr/logr/LICENSE-sha2=
56" rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/logr/LICENSE<br=
>
-sha256</a>=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf=
35d0ab4=C2=A0 vendor/<a href=3D"http://github.com/go-logr/stdr/LICENSE" rel=
=3D"noreferrer" target=3D"_blank">github.com/go-logr/stdr/LICENSE</a><br>
-#<br>
-# BSD 2 Clause licenses.<br>
-sha256=C2=A0 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7de=
e86=C2=A0 vendor/<a href=3D"http://github.com/pkg/errors/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE<br>
-sha256</a>=C2=A0 4801bb0c5d70b980b3e1f63d1d2df8d84fec22548e3d73f03a68df1fb=
808791f=C2=A0 vendor/<a href=3D"http://github.com/pkg/browser/LICENSE" rel=
=3D"noreferrer" target=3D"_blank">github.com/pkg/browser/LICENSE</a><br>
-#<br>
-# BSD 3 Clause licenses.<br>
-sha256=C2=A0 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56=
477=C2=A0 vendor/<a href=3D"http://github.com/pmezard/go-difflib/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go-difflib/LI=
CENSE<br>
-sha256</a>=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d559146=
7db9dad=C2=A0 vendor/<a href=3D"http://golang.org/x/sys/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE<br>
-sha256</a>=C2=A0 0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39=
a6d87cf=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compres=
s/LICENSE<br>
-sha256</a>=C2=A0 75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d5=
7274735=C2=A0 vendor/<a href=3D"http://github.com/russross/blackfriday/v2/L=
ICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com/russross/blackf=
riday/v2/LICENSE.txt</a><br>
-sha256=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9=
dad=C2=A0 vendor/<a href=3D"http://golang.org/x/net/LICENSE-sha256" rel=3D"=
noreferrer" target=3D"_blank">golang.org/x/net/LICENSE<br>
-sha256</a>=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d559146=
7db9dad=C2=A0 vendor/<a href=3D"http://golang.org/x/oauth2/LICENSE-sha256" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2/LICENSE<br>
-sha256</a>=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d559146=
7db9dad=C2=A0 vendor/<a href=3D"http://golang.org/x/text/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/text/LICENSE<br>
-sha256</a>=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d559146=
7db9dad=C2=A0 vendor/<a href=3D"http://golang.org/x/crypto/LICENSE-sha256" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto/LICENSE<br>
-sha256</a>=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d559146=
7db9dad=C2=A0 vendor/<a href=3D"http://golang.org/x/time/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/time/LICENSE<br>
-sha256</a>=C2=A0 911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d559146=
7db9dad=C2=A0 vendor/<a href=3D"http://golang.org/x/sync/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/sync/LICENSE<br>
-sha256</a>=C2=A0 110244b02140866ee37d17fa7449436a377ec3b85a481fbb208f4c879=
64382de=C2=A0 vendor/<a href=3D"http://google.golang.org/api/LICENSE-sha256=
" rel=3D"noreferrer" target=3D"_blank">google.golang.org/api/LICENSE<br>
-sha256</a>=C2=A0 fc0a2f71df4e8f047902da53d1f85301be43e0f360fc167057a2d0465=
8ed2ba9=C2=A0 vendor/<a href=3D"http://google.golang.org/api/internal/third=
_party/uritemplates/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">go=
ogle.golang.org/api/internal/third_party/uritemplates/LICENSE<br>
-sha256</a>=C2=A0 4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f=
725eb20=C2=A0 vendor/<a href=3D"http://google.golang.org/protobuf/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf/LICE=
NSE<br>
-sha256</a>=C2=A0 b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3=
bac4722=C2=A0 vendor/<a href=3D"http://github.com/googleapis/gax-go/v2/LICE=
NSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/gax-=
go/v2/LICENSE<br>
-sha256</a>=C2=A0 f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf35133=
5bf98cf=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/intern=
al/snapref/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/=
klauspost/compress/internal/snapref/LICENSE<br>
-sha256</a>=C2=A0 701cbcc144a7c865b072f27547e66ddbf17ac44a3bd21f71149ace025=
18f107c=C2=A0 vendor/<a href=3D"http://github.com/ulikunitz/xz/LICENSE-sha2=
56" rel=3D"noreferrer" target=3D"_blank">github.com/ulikunitz/xz/LICENSE<br=
>
-sha256</a>=C2=A0 0a8d61ed3cbfd5312326e8126c31ce9c627a283adc99131b56896d29a=
da04b2d=C2=A0 vendor/<a href=3D"http://github.com/google/uuid/LICENSE" rel=
=3D"noreferrer" target=3D"_blank">github.com/google/uuid/LICENSE</a><br>
-#<br>
-# ISC licenses.<br>
-sha256=C2=A0 1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470=
251=C2=A0 vendor/<a href=3D"http://github.com/davecgh/go-spew/LICENSE-sha25=
6" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew/LICENSE<=
br>
-sha256</a>=C2=A0 480be5fb1be03ff19fd71d863f453f16262e98d4e568f5bccfcb7aa3c=
cf8cf0d=C2=A0 vendor/<a href=3D"http://github.com/decred/dcrd/dcrec/secp256=
k1/v4/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/decred/dcrd/=
dcrec/secp256k1/v4/LICENSE</a><br>
-#<br>
-# MIT licenses.<br>
-sha256=C2=A0 f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599=
189=C2=A0 vendor/<a href=3D"http://github.com/stretchr/testify/LICENSE-sha2=
56" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/testify/LICENS=
E<br>
-sha256</a>=C2=A0 2be6c75f36f3022ea015fea7b1b7135ce67d477ee721d0fc6c98678ba=
db13b8b=C2=A0 vendor/<a href=3D"http://github.com/urfave/cli/LICENSE-sha256=
" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/LICENSE<br>
-sha256</a>=C2=A0 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c3139734246=
64b2e6b=C2=A0 vendor/<a href=3D"http://github.com/sirupsen/logrus/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logrus/LICE=
NSE<br>
-sha256</a>=C2=A0 7709cc030f078b17809884f92f33a2016944e1180312dc3f1371b0231=
3d313ed=C2=A0 vendor/<a href=3D"http://github.com/klauspost/pgzip/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/pgzip/LICE=
NSE<br>
-sha256</a>=C2=A0 a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079=
fb18470=C2=A0 vendor/<a href=3D"http://github.com/cpuguy83/go-md2man/v2/LIC=
ENSE.md-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/cpuguy83/go=
-md2man/v2/LICENSE.md<br>
-sha256</a>=C2=A0 d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e=
4e6aa0b=C2=A0 vendor/<a href=3D"http://gopkg.in/yaml.v3/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE<br>
-sha256</a>=C2=A0 08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c=
76e6fa1=C2=A0 vendor/<a href=3D"http://github.com/mattn/go-isatty/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isatty/LICE=
NSE<br>
-sha256</a>=C2=A0 5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e=
1f40212=C2=A0 vendor/<a href=3D"http://github.com/klauspost/cpuid/v2/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/cpuid/v=
2/LICENSE<br>
-sha256</a>=C2=A0 22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff435=
4a07f26=C2=A0 vendor/<a href=3D"http://github.com/mitchellh/go-homedir/LICE=
NSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mitchellh/go-ho=
medir/LICENSE<br>
-sha256</a>=C2=A0 22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff435=
4a07f26=C2=A0 vendor/<a href=3D"http://github.com/mitchellh/mapstructure/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mitchellh/map=
structure/LICENSE<br>
-sha256</a>=C2=A0 38049e50b486f5394e40b786388f4a006401996e46c7c1cd18925afe7=
c3b4e34=C2=A0 vendor/<a href=3D"http://github.com/ryanuber/go-glob/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/ryanuber/go-glob/LI=
CENSE<br>
-sha256</a>=C2=A0 5c0476add4c38b55d0ed5ac11b85e00c38f26e1caee20dfe3ab581901=
03d1fbc=C2=A0 vendor/<a href=3D"http://github.com/cenkalti/backoff/v3/LICEN=
SE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/cenkalti/backoff=
/v3/LICENSE<br>
-sha256</a>=C2=A0 f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a=
1c9a79c=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/zstd/i=
nternal/xxhash/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com=
/klauspost/compress/zstd/internal/xxhash/LICENSE.txt</a><br>
-sha256=C2=A0 646f8936b8ddcd14e13e578ff6857e368780b0d1a4f6066bee89211923a37=
3e2=C2=A0 vendor/<a href=3D"http://github.com/Azure/azure-sdk-for-go/sdk/in=
ternal/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com/Azure/a=
zure-sdk-for-go/sdk/internal/LICENSE.txt</a><br>
-sha256=C2=A0 646f8936b8ddcd14e13e578ff6857e368780b0d1a4f6066bee89211923a37=
3e2=C2=A0 vendor/<a href=3D"http://github.com/Azure/azure-sdk-for-go/sdk/az=
identity/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com/Azure=
/azure-sdk-for-go/sdk/azidentity/LICENSE.txt</a><br>
-sha256=C2=A0 a096a435e19bb6b631da46992c011a39be563e97ce7366879ad516c772904=
632=C2=A0 vendor/<a href=3D"http://github.com/Azure/azure-sdk-for-go/sdk/se=
curity/keyvault/internal/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">=
github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal/LICENSE.tx=
t</a><br>
-sha256=C2=A0 a096a435e19bb6b631da46992c011a39be563e97ce7366879ad516c772904=
632=C2=A0 vendor/<a href=3D"http://github.com/Azure/azure-sdk-for-go/sdk/se=
curity/keyvault/azkeys/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys/LICENSE.txt</a=
><br>
-sha256=C2=A0 646f8936b8ddcd14e13e578ff6857e368780b0d1a4f6066bee89211923a37=
3e2=C2=A0 vendor/<a href=3D"http://github.com/Azure/azure-sdk-for-go/sdk/az=
core/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com/Azure/azu=
re-sdk-for-go/sdk/azcore/LICENSE.txt</a><br>
-sha256=C2=A0 9906940f61b1f0b533fa7d99baf55178b2808fbe113ea51dfbfad8572ccd5=
f2b=C2=A0 vendor/<a href=3D"http://github.com/AzureAD/microsoft-authenticat=
ion-library-for-go/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/AzureAD/microsoft-authentication-library-for-go/LICENSE<br>
-sha256</a>=C2=A0 a707cd425201945d57500566c47c74dc9fb8cd02ef91b9a761abddeb2=
401e6a7=C2=A0 vendor/<a href=3D"http://github.com/goccy/go-json/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/goccy/go-json/LICENSE<=
br>
-sha256</a>=C2=A0 fe26ca41577b9b2b4448050a24b25e5753af66b5d5945d5d36094e779=
0bfcb2f=C2=A0 vendor/<a href=3D"http://github.com/golang-jwt/jwt/v5/LICENSE=
-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/golang-jwt/jwt/v5/=
LICENSE<br>
-sha256</a>=C2=A0 d5c8d4935994cfcfbc53d12fe756b28316858736d6e0a61acaff5fe4a=
84fca12=C2=A0 vendor/<a href=3D"http://github.com/lestrrat-go/iter/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/iter/LI=
CENSE<br>
-sha256</a>=C2=A0 b9b5b03485eb7446da7ecad22178664a53c7fcecceb74d69f905819a8=
07d710e=C2=A0 vendor/<a href=3D"http://github.com/lestrrat-go/blackmagic/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/b=
lackmagic/LICENSE<br>
-sha256</a>=C2=A0 e148deed982672627e875fe0cb03b9aa0d3e315e0f59992973c3c34db=
cf5f322=C2=A0 vendor/<a href=3D"http://github.com/lestrrat-go/backoff/v2/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/b=
ackoff/v2/LICENSE<br>
-sha256</a>=C2=A0 d5c8d4935994cfcfbc53d12fe756b28316858736d6e0a61acaff5fe4a=
84fca12=C2=A0 vendor/<a href=3D"http://github.com/lestrrat-go/httpcc/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/httpc=
c/LICENSE<br>
-sha256</a>=C2=A0 b9b5b03485eb7446da7ecad22178664a53c7fcecceb74d69f905819a8=
07d710e=C2=A0 vendor/<a href=3D"http://github.com/lestrrat-go/option/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/optio=
n/LICENSE<br>
-sha256</a>=C2=A0 0c4868a07b1c2dbb67c75767b4f1b2936c392d02ca2c7ee9827cac1a9=
d60ab1d=C2=A0 vendor/<a href=3D"http://github.com/lestrrat-go/jwx/LICENSE" =
rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/jwx/LICENSE</a>=
<br>
-#<br>
-# MPL-2.0 licenses.<br>
-sha256=C2=A0 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab33=
43d=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-secure-stdlib/st=
rutil/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashi=
corp/go-secure-stdlib/strutil/LICENSE<br>
-sha256</a>=C2=A0 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6=
ab3343d=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-secure-stdli=
b/parseutil/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com=
/hashicorp/go-secure-stdlib/parseutil/LICENSE<br>
-sha256</a>=C2=A0 bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881=
901dadd=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/errwrap/LICENSE=
-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/errwrap/=
LICENSE<br>
-sha256</a>=C2=A0 bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881=
901dadd=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/hcl/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/hcl/LICENSE<=
br>
-sha256</a>=C2=A0 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6=
ab3343d=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-cleanhttp/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-=
cleanhttp/LICENSE<br>
-sha256</a>=C2=A0 60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6=
ab3343d=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-rootcerts/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-=
rootcerts/LICENSE<br>
-sha256</a>=C2=A0 d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e864=
4af77d3=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-retryablehtt=
p/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp=
/go-retryablehttp/LICENSE<br>
-sha256</a>=C2=A0 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2=
b91f1d5=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-sockaddr/LIC=
ENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-s=
ockaddr/LICENSE<br>
-sha256</a>=C2=A0 d6b1a865f1c8c697d343bd4e0ce61025f91898486a1f00d727f32e864=
4af77d3=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/vault/api/LICEN=
SE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/vault/=
api/LICENSE<br>
-sha256</a>=C2=A0 a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38=
a03f5ff=C2=A0 vendor/<a href=3D"http://github.com/hashicorp/go-multierror/L=
ICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go=
-multierror/LICENSE<br>
-sha256</a>=C2=A0 8108e14b5cb2b6bcd51583d3849ef0c2b5c4de61758256c20308bc70d=
1775dbb=C2=A0 vendor/<a href=3D"http://github.com/felixge/httpsnoop/LICENSE=
.txt" rel=3D"noreferrer" target=3D"_blank">github.com/felixge/httpsnoop/LIC=
ENSE.txt</a><br>
diff --git a/package/mender-artifact/<a href=3D"http://mender-artifact.mk" =
rel=3D"noreferrer" target=3D"_blank">mender-artifact.mk</a> b/package/mende=
r-artifact/<a href=3D"http://mender-artifact.mk" rel=3D"noreferrer" target=
=3D"_blank">mender-artifact.mk</a><br>
deleted file mode 100644<br>
index 9f235b55bd..0000000000<br>
--- a/package/mender-artifact/<a href=3D"http://mender-artifact.mk" rel=3D"=
noreferrer" target=3D"_blank">mender-artifact.mk</a><br>
+++ /dev/null<br>
@@ -1,118 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# host-mender-artifact<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-HOST_MENDER_ARTIFACT_VERSION =3D 4.4.1<br>
-HOST_MENDER_ARTIFACT_SITE =3D $(call github,mendersoftware,mender-artifact=
,$(HOST_MENDER_ARTIFACT_VERSION))<br>
-HOST_MENDER_ARTIFACT_LICENSE =3D Apache2.0, BSD-2-Clause, BSD-3-Clause, IS=
C, MIT, MPL-2.0<br>
-# Vendor license paths generated with:<br>
-#=C2=A0 =C2=A0 awk &#39;{print $2}&#39; LIC_FILES_CHKSUM.sha256 | grep ven=
dor<br>
-HOST_MENDER_ARTIFACT_LICENSE_FILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LIC_FILES_CHKSUM.sha256 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/minio/sha25=
6-simd/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/minio/sha25=
6-simd/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/progressbar/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/me=
ndersoftware/progressbar/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/genp=
roto/LICENSE" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genpro=
to/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/genp=
roto/googleapis/api/LICENSE" rel=3D"noreferrer" target=3D"_blank">google.go=
lang.org/genproto/googleapis/api/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/genp=
roto/googleapis/rpc/LICENSE" rel=3D"noreferrer" target=3D"_blank">google.go=
lang.org/genproto/googleapis/rpc/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/grpc=
/LICENSE" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc/LICEN=
SE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://cloud.google.com/go/km=
s/LICENSE" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/kms/LIC=
ENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://cloud.google.com/go/ia=
m/LICENSE" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/iam/LIC=
ENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://cloud.google.com/go/co=
mpute/metadata/LICENSE" rel=3D"noreferrer" target=3D"_blank">cloud.google.c=
om/go/compute/metadata/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://cloud.google.com/go/au=
th/LICENSE" rel=3D"noreferrer" target=3D"_blank">cloud.google.com/go/auth/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://cloud.google.com/go/au=
th/oauth2adapt/LICENSE" rel=3D"noreferrer" target=3D"_blank">cloud.google.c=
om/go/auth/oauth2adapt/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/openssl/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mender=
software/openssl/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/googleapis/=
enterprise-certificate-proxy/LICENSE" rel=3D"noreferrer" target=3D"_blank">=
github.com/googleapis/enterprise-certificate-proxy/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/go-jose/go-=
jose/v3/json/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/go-jo=
se/go-jose/v3/json/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/go-jose/go-=
jose/v3/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/go-jose/go=
-jose/v3/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/google/s2a-=
go/LICENSE.md" rel=3D"noreferrer" target=3D"_blank">github.com/google/s2a-g=
o/LICENSE.md</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/Keyfactor/s=
ignserver-go-client-sdk/LICENSE" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/Keyfactor/signserver-go-client-sdk/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/kylelemons/=
godebug/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/kylelemons=
/godebug/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://go.opentelemetry.io/ot=
el/trace/LICENSE" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/=
otel/trace/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://go.opentelemetry.io/ot=
el/LICENSE" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://go.opentelemetry.io/ot=
el/metric/LICENSE" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io=
/otel/metric/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://go.opentelemetry.io/co=
ntrib/instrumentation/net/http/otelhttp/LICENSE" rel=3D"noreferrer" target=
=3D"_blank">go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://go.opentelemetry.io/co=
ntrib/instrumentation/google.golang.org/grpc/otelgrpc/LICENSE" rel=3D"noref=
errer" target=3D"_blank">go.opentelemetry.io/contrib/instrumentation/google=
.golang.org/grpc/otelgrpc/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://go.opentelemetry.io/au=
to/sdk/LICENSE" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/au=
to/sdk/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/go-logr/log=
r/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/logr/LIC=
ENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/go-logr/std=
r/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/stdr/LIC=
ENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pkg/errors/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pkg/browser=
/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/browser/LICEN=
SE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pmezard/go-=
difflib/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go=
-difflib/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/sys/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
compress/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/russross/bl=
ackfriday/v2/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com/r=
ussross/blackfriday/v2/LICENSE.txt</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/net/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/oauth2/LI=
CENSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2/LICENSE</a>=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/text/LICE=
NSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/text/LICENSE</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/crypto/LI=
CENSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto/LICENSE</a>=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/time/LICE=
NSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/time/LICENSE</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/sync/LICE=
NSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sync/LICENSE</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/api/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">google.golang.org/api/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/api/=
internal/third_party/uritemplates/LICENSE" rel=3D"noreferrer" target=3D"_bl=
ank">google.golang.org/api/internal/third_party/uritemplates/LICENSE</a> \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://google.golang.org/prot=
obuf/LICENSE" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protob=
uf/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/googleapis/=
gax-go/v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/googleap=
is/gax-go/v2/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/internal/snapref/LICENSE" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/klauspost/compress/internal/snapref/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/ulikunitz/x=
z/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/ulikunitz/xz/LIC=
ENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/google/uuid=
/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/google/uuid/LICEN=
SE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/davecgh/go-=
spew/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-sp=
ew/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/decred/dcrd=
/dcrec/secp256k1/v4/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.co=
m/decred/dcrd/dcrec/secp256k1/v4/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/te=
stify/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/tes=
tify/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/urfave/cli/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/sirupsen/lo=
grus/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logr=
us/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/p=
gzip/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/pgz=
ip/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/cpuguy83/go=
-md2man/v2/LICENSE.md" rel=3D"noreferrer" target=3D"_blank">github.com/cpug=
uy83/go-md2man/v2/LICENSE.md</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://gopkg.in/yaml.v3/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mattn/go-is=
atty/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isat=
ty/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
puid/v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
cpuid/v2/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mitchellh/g=
o-homedir/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mitchell=
h/go-homedir/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mitchellh/m=
apstructure/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mitche=
llh/mapstructure/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/ryanuber/go=
-glob/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/ryanuber/go-=
glob/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/cenkalti/ba=
ckoff/v3/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/cenkalti/=
backoff/v3/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/zstd/internal/xxhash/LICENSE.txt" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt</a> \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/Azure/azure=
-sdk-for-go/sdk/internal/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">=
github.com/Azure/azure-sdk-for-go/sdk/internal/LICENSE.txt</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/Azure/azure=
-sdk-for-go/sdk/azidentity/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank=
">github.com/Azure/azure-sdk-for-go/sdk/azidentity/LICENSE.txt</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/Azure/azure=
-sdk-for-go/sdk/security/keyvault/internal/LICENSE.txt" rel=3D"noreferrer" =
target=3D"_blank">github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/i=
nternal/LICENSE.txt</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/Azure/azure=
-sdk-for-go/sdk/security/keyvault/azkeys/LICENSE.txt" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azk=
eys/LICENSE.txt</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/Azure/azure=
-sdk-for-go/sdk/azcore/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/Azure/azure-sdk-for-go/sdk/azcore/LICENSE.txt</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/AzureAD/mic=
rosoft-authentication-library-for-go/LICENSE" rel=3D"noreferrer" target=3D"=
_blank">github.com/AzureAD/microsoft-authentication-library-for-go/LICENSE<=
/a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/goccy/go-js=
on/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/goccy/go-json/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/golang-jwt/=
jwt/v5/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/golang-jwt/=
jwt/v5/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/lestrrat-go=
/iter/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/=
iter/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/lestrrat-go=
/blackmagic/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/lestrr=
at-go/blackmagic/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/lestrrat-go=
/backoff/v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/lestrr=
at-go/backoff/v2/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/lestrrat-go=
/httpcc/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-g=
o/httpcc/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/lestrrat-go=
/option/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-g=
o/option/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/lestrrat-go=
/jwx/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/j=
wx/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-secure-stdlib/strutil/LICENSE" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/hashicorp/go-secure-stdlib/strutil/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-secure-stdlib/parseutil/LICENSE" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/hashicorp/go-secure-stdlib/parseutil/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/e=
rrwrap/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/e=
rrwrap/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/h=
cl/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/hcl/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-cleanhttp/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashic=
orp/go-cleanhttp/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-rootcerts/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashic=
orp/go-rootcerts/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-retryablehttp/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/ha=
shicorp/go-retryablehttp/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-sockaddr/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashico=
rp/go-sockaddr/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/v=
ault/api/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp=
/vault/api/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/hashicorp/g=
o-multierror/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/hashi=
corp/go-multierror/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/felixge/htt=
psnoop/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com/felixge=
/httpsnoop/LICENSE.txt</a><br>
-<br>
-HOST_MENDER_ARTIFACT_DEPENDENCIES =3D host-pkgconf host-openssl host-xz<br=
>
-<br>
-ifeq ($(BR2_PACKAGE_HOST_ZSTD),y)<br>
-HOST_MENDER_ARTIFACT_DEPENDENCIES +=3D host-zstd<br>
-endif<br>
-<br>
-HOST_MENDER_ARTIFACT_GO_ENV +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PATH=3D$(BR_PATH) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG=3D&quot;$(PKG_CONFIG_HOST_BINARY)&qu=
ot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_LIBDIR=3D&quot;$(HOST_DIR)/lib/pkgco=
nfig:$(HOST_DIR)/share/pkgconfig&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_PATH=3D&quot;$(HOST_DIR)/lib/pkgconf=
ig&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot;<br>
-<br>
-HOST_MENDER_ARTIFACT_LDFLAGS =3D -X <a href=3D"http://github.com/mendersof=
tware/mender-artifact/cli.Version=3D$(HOST_MENDER_ARTIFACT_VERSION)" rel=3D=
"noreferrer" target=3D"_blank">github.com/mendersoftware/mender-artifact/cl=
i.Version=3D$(HOST_MENDER_ARTIFACT_VERSION)</a><br>
-<br>
-$(eval $(host-golang-package))<br>
diff --git a/package/mender-connect/Config.in b/package/mender-connect/Conf=
ig.in<br>
deleted file mode 100644<br>
index d478e468c2..0000000000<br>
--- a/package/mender-connect/Config.in<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-config BR2_PACKAGE_MENDER_CONNECT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender-connect&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2=
, mender<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # libglib2 -&gt; gette=
xt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # dbus -&gt; fork()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DBUS # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_GO<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_MENDER # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mender-connect is a daemon responsible f=
or handling<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bidirectional (websocket) communication =
with the Mender<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server. The daemon is responsible for im=
plementing a range of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0troubleshooting features to the device a=
s well as several<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enhancement to the mender-client.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mender Connect is loosely coupled with t=
he Mender Client. The<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0main information passed between mender-c=
lient and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mender-connect is the device authorizati=
on status. Since only<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0accepted devices can interact with the M=
ender Server, the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mender Client passes over DBus the autho=
rization token which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mender Connect uses to establish a Webso=
cket connection to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-connect" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/mendersoftware/mender-connect</a><br>
-<br>
-comment &quot;mender-connect needs a toolchain w/ threads, wchar&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_U=
SE_WCHAR<br>
diff --git a/package/mender-connect/S43mender-connect b/package/mender-conn=
ect/S43mender-connect<br>
deleted file mode 100644<br>
index 4cc21510c4..0000000000<br>
--- a/package/mender-connect/S43mender-connect<br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
-#!/bin/sh<br>
-DAEMON=3D&quot;mender-connect&quot;<br>
-DAEMON_PATH=3D&quot;/usr/bin/mender-connect&quot;<br>
-PIDFILE=3D&quot;/var/run/${DAEMON}.pid&quot;<br>
-<br>
-MENDER_CONNECT_ARGS=3D&quot;&quot;<br>
-<br>
-# shellcheck source=3D/dev/null<br>
-[ -r &quot;/etc/default/$DAEMON&quot; ] &amp;&amp; . &quot;/etc/default/$D=
AEMON&quot;<br>
-<br>
-start() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s: &#39; &quot;${DAEMON}&=
quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0umask 077<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# shellcheck disable=3DSC2086 # we need the wor=
d splitting<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -bmSqp &quot;$PIDFILE&quot; -=
x ${DAEMON_PATH} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- -daemon ${DAEMON=
_ARGS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quo=
t;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
-}<br>
-<br>
-stop() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &quot;${DAEMON}&=
quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -K -q -p &quot;$PIDFILE&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quo=
t;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
-}<br>
-<br>
-restart() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
-}<br>
-<br>
-case &quot;$1&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&quot;;;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0reload)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, since th=
ere is no true &quot;reload&quot; feature.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $=
0 {start|stop|restart|reload}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
-esac<br>
diff --git a/package/mender-connect/mender-connect.hash b/package/mender-co=
nnect/mender-connect.hash<br>
deleted file mode 100644<br>
index 2872bb467c..0000000000<br>
--- a/package/mender-connect/mender-connect.hash<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-# Locally computed:<br>
-sha256=C2=A0 b04331f447b9d21c5962d5aef2670f1de861e3065522a1b298af0904a8ee6=
400=C2=A0 mender-connect-3.0.0-go2.tar.gz<br>
-sha256=C2=A0 420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4=
ef6=C2=A0 LIC_FILES_CHKSUM.sha256<br>
-<br>
-# Vendor licenses<br>
-# Generated with sed &#39;/^[A-Za-z0-9_]/s/^/sha256=C2=A0 /&#39; LIC_FILES=
_CHKSUM.sha256<br>
-<br>
-#<br>
-# Apache-2.0<br>
-sha256=C2=A0 d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9e=
b47=C2=A0 LICENSE<br>
-sha256=C2=A0 a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152=
944=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/go-lib-micro/L=
ICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftware/go-l=
ib-micro/LICENSE</a><br>
-#<br>
-# BSD-2-Clause<br>
-sha256=C2=A0 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7de=
e86=C2=A0 vendor/<a href=3D"http://github.com/pkg/errors/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE<br>
-sha256</a>=C2=A0 1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88f=
d80b9a2=C2=A0 vendor/<a href=3D"http://github.com/vmihailenco/msgpack/v5/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/vmihailenco/m=
sgpack/v5/LICENSE<br>
-sha256</a>=C2=A0 0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb07=
9da5b5d=C2=A0 vendor/<a href=3D"http://github.com/vmihailenco/tagparser/v2/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/vmihailenco/tagpar=
ser/v2/LICENSE</a><br>
-#<br>
-# BSD-3-Clause<br>
-sha256=C2=A0 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56=
477=C2=A0 vendor/<a href=3D"http://github.com/pmezard/go-difflib/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go-difflib/LI=
CENSE<br>
-sha256</a>=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b203=
0cbc067=C2=A0 vendor/<a href=3D"http://golang.org/x/sys/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE<br>
-sha256</a>=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b203=
0cbc067=C2=A0 vendor/<a href=3D"http://golang.org/x/net/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net/LICENSE<br>
-sha256</a>=C2=A0 0b77fdea862f869ef4f201ac5649bdbd38ccb055c7f6454dffae9e2ad=
b4941c1=C2=A0 vendor/<a href=3D"http://github.com/gorilla/websocket/LICENSE=
" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/websocket/LICENSE=
</a><br>
-#<br>
-# ISC<br>
-sha256=C2=A0 1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470=
251=C2=A0 vendor/<a href=3D"http://github.com/davecgh/go-spew/LICENSE" rel=
=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew/LICENSE</a><br=
>
-#<br>
-# MIT<br>
-sha256=C2=A0 a2a1cea59d9c2d71908082f516f86bb560abf857646ecf69d70c121ead14a=
ef4=C2=A0 vendor/<a href=3D"http://github.com/creack/pty/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">github.com/creack/pty/LICENSE<br>
-sha256</a>=C2=A0 caa932df46551b53643952fe03b351d55db97be73b5393b986dcf6b05=
d3c416a=C2=A0 vendor/<a href=3D"http://github.com/go-ozzo/ozzo-validation/v=
4/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/go-ozzo/o=
zzo-validation/v4/LICENSE<br>
-sha256</a>=C2=A0 92a328e1d5f3269b42e2ce32b4494eafdb3132f204a911c5c95cf3d84=
65490e4=C2=A0 vendor/<a href=3D"http://github.com/satori/go.uuid/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/satori/go.uuid/LICENS=
E<br>
-sha256</a>=C2=A0 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c3139734246=
64b2e6b=C2=A0 vendor/<a href=3D"http://github.com/sirupsen/logrus/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logrus/LICE=
NSE<br>
-sha256</a>=C2=A0 b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23=
b6b61b0=C2=A0 vendor/<a href=3D"http://github.com/stretchr/objx/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/objx/LICENSE<=
br>
-sha256</a>=C2=A0 f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e=
2599189=C2=A0 vendor/<a href=3D"http://github.com/stretchr/testify/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/testify/LI=
CENSE<br>
-sha256</a>=C2=A0 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de5=
5345fd7=C2=A0 vendor/<a href=3D"http://github.com/urfave/cli/v2/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/v2/LICENSE<=
br>
-sha256</a>=C2=A0 d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e=
4e6aa0b=C2=A0 vendor/<a href=3D"http://gopkg.in/yaml.v3/LICENSE" rel=3D"nor=
eferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE</a><br>
diff --git a/package/mender-connect/<a href=3D"http://mender-connect.mk" re=
l=3D"noreferrer" target=3D"_blank">mender-connect.mk</a> b/package/mender-c=
onnect/<a href=3D"http://mender-connect.mk" rel=3D"noreferrer" target=3D"_b=
lank">mender-connect.mk</a><br>
deleted file mode 100644<br>
index 98fdfe16df..0000000000<br>
--- a/package/mender-connect/<a href=3D"http://mender-connect.mk" rel=3D"no=
referrer" target=3D"_blank">mender-connect.mk</a><br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# mender-connect<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-MENDER_CONNECT_VERSION =3D 3.0.0<br>
-MENDER_CONNECT_SITE =3D $(call github,mendersoftware,mender-connect,$(MEND=
ER_CONNECT_VERSION))<br>
-MENDER_CONNECT_LICENSE =3D Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MI=
T<br>
-<br>
-# Vendor license paths generated with:<br>
-#=C2=A0 =C2=A0 awk &#39;{print $2}&#39; LIC_FILES_CHKSUM.sha256 | grep ven=
dor<br>
-MENDER_CONNECT_LICENSE_FILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LIC_FILES_CHKSUM.sha256 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/go-lib-micro/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/m=
endersoftware/go-lib-micro/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pkg/errors/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/vmihailenco=
/msgpack/v5/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/vmihai=
lenco/msgpack/v5/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/vmihailenco=
/tagparser/v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/vmih=
ailenco/tagparser/v2/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pmezard/go-=
difflib/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go=
-difflib/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/sys/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/net/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/gorilla/web=
socket/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/web=
socket/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/davecgh/go-=
spew/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-sp=
ew/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/creack/pty/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/creack/pty/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/go-ozzo/ozz=
o-validation/v4/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/go=
-ozzo/ozzo-validation/v4/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/satori/go.u=
uid/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/satori/go.uuid=
/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/sirupsen/lo=
grus/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logr=
us/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/ob=
jx/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/objx/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/te=
stify/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/tes=
tify/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/urfave/cli/=
v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/v2/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://gopkg.in/yaml.v3/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE</a><br>
-<br>
-MENDER_CONNECT_DEPENDENCIES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dbus \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libglib2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mender \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0openssl<br>
-<br>
-MENDER_CONNECT_LDFLAGS =3D -X <a href=3D"http://github.com/mendersoftware/=
mender-connect/config.Version=3D$(MENDER_CONNECT_VERSION)" rel=3D"noreferre=
r" target=3D"_blank">github.com/mendersoftware/mender-connect/config.Versio=
n=3D$(MENDER_CONNECT_VERSION)</a><br>
-<br>
-define MENDER_CONNECT_INSTALL_CONFIG_FILES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(@D)/examples/mender-con=
nect.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/m=
ender/mender-connect.conf<br>
-endef<br>
-MENDER_CONNECT_POST_INSTALL_TARGET_HOOKS +=3D MENDER_CONNECT_INSTALL_CONFI=
G_FILES<br>
-<br>
-define MENDER_CONNECT_INSTALL_INIT_SYSTEMD<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(@D)/support/mender-conn=
ect.service \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/l=
ib/systemd/system/mender-connect.service<br>
-endef<br>
-<br>
-define MENDER_CONNECT_INSTALL_INIT_SYSV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(MENDER_CONNECT_PKGDIR)/=
S43mender-connect \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/i=
nit.d/S43mender-connect<br>
-endef<br>
-<br>
-$(eval $(golang-package))<br>
diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Conf=
ig.in<br>
deleted file mode 100644<br>
index <a href=3D"tel:(850)%20545-8793" value=3D"+18505458793" target=3D"_bl=
ank">8505458793</a>..0000000000<br>
--- a/package/mender-grubenv/Config.in<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-config BR2_PACKAGE_MENDER_GRUBENV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender-grubenv&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MENDER # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TARGET_GRUB2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT &=
amp;&amp; BR2_TARGET_GRUB2_HAS_EFI_BOOT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_UTIL_LINUX<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_UTIL_LINUX_BINARIES # flock =
-w<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Contains the boot scripts and tools used=
 by Mender to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0integrate with the GRUB bootloader.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The following Grub modules must be selec=
ted for this package:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loadenv hashsum echo halt gcry_sha256 te=
st regexp<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/grub-mender-grubenv" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/mendersoftware/grub-mender-grubenv</a><br>
-<br>
-if BR2_PACKAGE_MENDER_GRUBENV<br>
-<br>
-config BR2_PACKAGE_MENDER_GRUBENV_DEFINES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;path to grubenv defines&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Specify a path to the mender grubenv def=
ines file.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If no path is specified, the example fil=
e in the source<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0directory will be used.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The example file in the source directory=
 sets the following:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mender_rootfsa_part=3D2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mender_rootfsb_part=3D3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mender_kernel_root_base=3D/dev/mmcblk0p<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mender_grub_storage_device=3Dhd0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_imagetype=3DbzImage<br>
-<br>
-endif<br>
-<br>
-comment &quot;mender-grubenv needs a grub2 bootloader&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MENDER<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TARGET_GRUB2<br>
-<br>
-comment &quot;mender-grubenv does not support both legacy and EFI grub2 bo=
otloaders at the same time&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MENDER<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TARGET_GRUB2_HAS_LEGACY_BOOT &am=
p;&amp; BR2_TARGET_GRUB2_HAS_EFI_BOOT<br>
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-gr=
ubenv/mender-grubenv.hash<br>
deleted file mode 100644<br>
index 06456f6818..0000000000<br>
--- a/package/mender-grubenv/mender-grubenv.hash<br>
+++ /dev/null<br>
@@ -1,3 +0,0 @@<br>
-# Locally computed<br>
-sha256=C2=A0 9200dfc8ce8d9e5fae13947857fec44961df87c5bee92f90e37049279a94f=
b6f=C2=A0 mender-grubenv-ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4.tar.gz<br=
>
-sha256=C2=A0 d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9e=
b47=C2=A0 LICENSE<br>
diff --git a/package/mender-grubenv/<a href=3D"http://mender-grubenv.mk" re=
l=3D"noreferrer" target=3D"_blank">mender-grubenv.mk</a> b/package/mender-g=
rubenv/<a href=3D"http://mender-grubenv.mk" rel=3D"noreferrer" target=3D"_b=
lank">mender-grubenv.mk</a><br>
deleted file mode 100644<br>
index d93159802d..0000000000<br>
--- a/package/mender-grubenv/<a href=3D"http://mender-grubenv.mk" rel=3D"no=
referrer" target=3D"_blank">mender-grubenv.mk</a><br>
+++ /dev/null<br>
@@ -1,90 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# mender-grubenv<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-MENDER_GRUBENV_VERSION =3D ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4<br>
-MENDER_GRUBENV_SITE =3D $(call github,mendersoftware,grub-mender-grubenv,$=
(MENDER_GRUBENV_VERSION))<br>
-MENDER_GRUBENV_LICENSE =3D Apache-2.0<br>
-MENDER_GRUBENV_LICENSE_FILES =3D LICENSE<br>
-# Grub2 must be built first so this package can overwrite the config files=
<br>
-# provided by grub.<br>
-MENDER_GRUBENV_DEPENDENCIES =3D grub2 util-linux<br>
-<br>
-MENDER_GRUBENV_MAKE_ENV =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_CONFIGURE_OPTS) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV)<br>
-<br>
-MENDER_GRUBENV_DEFINES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(or $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV=
_DEFINES)),\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/mender_gruben=
v_defines.example)<br>
-<br>
-# These grub modules must be built in for the grub scripts to work properl=
y.<br>
-# Without them, the system will not boot.<br>
-MENDER_GRUBENV_MANDATORY_MODULES =3D loadenv hashsum echo halt gcry_sha256=
 test regexp<br>
-<br>
-ifeq ($(BR2_TARGET_GRUB2_HAS_LEGACY_BOOT),y)<br>
-MENDER_GRUBENV_MODULES_MISSING_PC =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_B=
UILTIN_MODULES_PC)),\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MENDER_GRUBENV_MA=
NDATORY_MODULES))<br>
-<br>
-MENDER_GRUBENV_MAKE_ENV +=3D BOOT_DIR=3D/boot<br>
-<br>
-define MENDER_GRUBENV_INSTALL_I386_CFG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(BINARIES_DIR)/boot-part/grub<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub=
.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/boot/=
grub/grub.cfg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/boot/=
grub-mender-grubenv \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(BINARIES_DIR)/boo=
t-part/<br>
-endef<br>
-MENDER_GRUBENV_TARGET_FINALIZE_HOOKS +=3D MENDER_GRUBENV_INSTALL_I386_CFG<=
br>
-endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT<br>
-<br>
-ifeq ($(BR2_TARGET_GRUB2_HAS_EFI_BOOT),y)<br>
-MENDER_GRUBENV_MODULES_MISSING_EFI =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_B=
UILTIN_MODULES_EFI)),\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(MENDER_GRUBENV_MA=
NDATORY_MODULES))<br>
-<br>
-MENDER_GRUBENV_MAKE_ENV +=3D BOOT_DIR=3D/boot/EFI/BOOT<br>
-<br>
-define MENDER_GRUBENV_INSTALL_EFI_CFG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub=
.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/boot/=
EFI/BOOT/grub.cfg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(BINARIES_DIR)/efi=
-part/EFI/BOOT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub-mende=
r-grubenv \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(BINARIES_DIR)/efi=
-part/<br>
-endef<br>
-MENDER_GRUBENV_TARGET_FINALIZE_HOOKS +=3D MENDER_GRUBENV_INSTALL_EFI_CFG<b=
r>
-endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)<br>
-ifneq ($(MENDER_GRUBENV_MODULES_MISSING_EFI),)<br>
-$(error The following missing grub2 efi modules must be enabled for mender=
-grubenv \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0to work: $(MENDER_GRUBENV_MODULES_MISSING_EFI))=
<br>
-endif<br>
-ifneq ($(MENDER_GRUBENV_MODULES_MISSING_PC),)<br>
-$(error The following missing grub2 pc modules must be enabled for mender-=
grubenv \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0to work: $(MENDER_GRUBENV_MODULES_MISSING_PC))<=
br>
-endif<br>
-endif<br>
-<br>
-define MENDER_GRUBENV_CONFIGURE_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0644 $(MENDER_GRUBENV_DEFINES) $(=
@D)/mender_grubenv_defines<br>
-endef<br>
-<br>
-define MENDER_GRUBENV_BUILD_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) -C $(@D)<br>
-endef<br>
-<br>
-define MENDER_GRUBENV_INSTALL_TARGET_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=3D$(=
TARGET_DIR) -C $(@D) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install install-boo=
t-env<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# The grub-mender-grubenv-* utilities use this =
file to function.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;ENV_DIR=3D/boot/grub-mender-grubenv&#=
39; &gt; $(TARGET_DIR)/etc/mender_grubenv.config<br>
-endef<br>
-<br>
-$(eval $(generic-package))<br>
diff --git a/package/mender-update-modules/Config.in b/package/mender-updat=
e-modules/Config.in<br>
deleted file mode 100644<br>
index 88e0805976..0000000000<br>
--- a/package/mender-update-modules/Config.in<br>
+++ /dev/null<br>
@@ -1,250 +0,0 @@<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender-update-modules&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPOR=
TS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MENDER<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_MENDER_ARTIFACT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0community supported Update Modules. An U=
pdate Module is an<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extension to the Mender client for suppo=
rting a new type of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0software update, such as a package manag=
er, container,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootloader or even updates of nearby mic=
rocontrollers.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0An Update Module can be tailored to a sp=
ecific device or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0environment (e.g. update a proprietary b=
ootloader), or be<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0more general-purpose (e.g. install a set=
 of .deb packages.).<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/mendersoftware/mender-update-modules</a><br>
-<br>
-if BR2_PACKAGE_MENDER_UPDATE_MODULES<br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;DFU&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # lib=
usb<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DFU_UTIL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The DFU Update Module is able to update =
peripheral devices<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connected to the device running Mender.<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Deploy firmware updates to peri=
pheral devices using the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0USB Device Firmware Update=
 (DFU) protocol<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/dfu" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/mendersoftware/mender-update-modules/tree/master/d=
fu</a><br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;dir-overlay&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The Directory Overlay Update Module inst=
alls a user defined<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file tree structure into a given destina=
tion directory in the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Before the deploy into the destination f=
older on the device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the Update Module will take a backup cop=
y of the current<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contents, allowing restore of it using t=
he rollback mechanism<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of the Mender client if something goes w=
rong. The Update<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Module will also delete the current inst=
alled content that was<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0previously installed using the same modu=
le, this means that<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0each deployment is self contained and th=
ere is no residues<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0left on the system from the previous dep=
loyment.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Deploy root filesystem overlays=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/dir-overlay" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/mendersoftware/mender-update-modules/tree/=
master/dir-overlay</a><br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;dirty&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The dirty Update Module: modify your dev=
ice state without<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0installing an artifact<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- You have a specific action on t=
he device that you want to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run multiple times<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- You want to avoid re-creating a=
rtifacts just for the sake<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of a new version/name<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- You don&#39;t want the artifact=
 the show up in the list of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0installed artifacts<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- The module will always fail the=
 update process, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0means it can never be mark=
ed as installed. So it can be<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attempted any number of ti=
mes without having to recreate<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newly versioned artifacts.=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/dirty" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/mendersoftware/mender-update-modules/tree/master=
/dirty</a><br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;docker&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS # docker-engine, docker-cli<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS # docker-engine, docker-cli<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # docker-e=
ngine, docker-cli<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_USES_UCLIBC # contain=
erd -&gt; runc<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # containerd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker=
-engine<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS=
 # libseccomp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2 #=
 docker-engine<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DOCKER_ENGINE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_DOCKER_CLI<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_JQ # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The Docker Update Module handles the Doc=
ker images that shall<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be running in the device. A deployment w=
ith this module will<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stop all currently running Docker contai=
ners in the device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and start new containers with the provid=
ed list of Docker<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0images in the Mender Artifact.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In case of an unforeseen error during th=
e process, the module<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will use the rollback mechanism of the M=
ender client to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restore the previously running Docker co=
ntainers.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/docker" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/mendersoftware/mender-update-modules/tree/maste=
r/docker</a><br>
-<br>
-comment &quot;docker support needs a glibc or musl toolchain w/ threads, h=
eaders &gt;=3D 5.2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS || \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_TOOLCHAIN_USES_=
UCLIBC || \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_HEAD=
ERS_AT_LEAST_5_2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ipk&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # opkg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # opkg -&gt; libarchiv=
e<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPKG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The IPK Update Module allows opkg-based =
packages to be<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0installed on a device<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Deploy any ipk package<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/ipk" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/mendersoftware/mender-update-modules/tree/master/i=
pk</a><br>
-<br>
-comment &quot;ipk support needs a toolchain w/ wchar&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_USE_WCHAR<br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;podman&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_S=
UPPORTS=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPOR=
TS=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS=
=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=
=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS=C2=A0 # po=
dman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR=C2=A0 # podman<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_JQ # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PODMAN<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The Podman Update Module handles the Pod=
man container images<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that shall be running on the target devi=
ce. A deployment with<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this module will stop all currently runn=
ing Podman containers<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the device and start new containers b=
ased on the list of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Podman images provided in the Mender Art=
ifact.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In case of any unforeseen error during t=
he process, the module<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will trigger the rollback mechanism of t=
he Mender client to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restore the previously running Podman co=
ntainers.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/podman" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/mendersoftware/mender-update-modules/tree/maste=
r/podman</a><br>
-<br>
-comment &quot;podman support needs a toolchain w/ headers &gt;=3D 4.14, th=
reads, wchar&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_S=
UPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPOR=
TS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !BR2_TOOLCHAIN_H=
AS_THREADS \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !BR2_USE_WCHAR<b=
r>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;reboot&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The reboot Update Module: reboot your de=
vice remotely.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Something went wrong and you ha=
ve to reboot your device<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remotely, and all access t=
o the device you have is Mender.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/reboot" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/mendersoftware/mender-update-modules/tree/maste=
r/reboot</a><br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;rootfs version check&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # python3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # python3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # python3<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # python3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON3 # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The rootfs-version-check Update Module i=
mplements a full image<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update with additional checks to protect=
 against replay<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attacks.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is functionally equivalent to the b=
uilt-in full image<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update with an extra check to ensure the=
 artifact name<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0follows a specific format and that insta=
lling &quot;older&quot; images<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is rejected. For this reference implemen=
taton, we simply use<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a numeric identifier and ensure that it =
is larger than the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version installed. For actual device fle=
et use, you may need<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to customize this based on your artifact=
 naming scheme.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Deploy root filesystem updates =
and ensure only newer<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts are installed<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/rootfs-version-check" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/mendersoftware/mender-update-modu=
les/tree/master/rootfs-version-check</a><br>
-<br>
-comment &quot;rootfs version check needs a toolchain w/ threads, dynamic l=
ibrary, wchar&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_ST=
ATIC_LIBS || \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_USE_WCHAR<br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;rpm&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # dlfcn.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LUA &amp;&amp; !BR2_PACK=
AGE_LUA_5_1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_RPM<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The Rpm Update Module updates software o=
n the device using<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the native local package manager.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A Mender Artifact containing one or more=
 software packages<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is sent to the device, where the Update =
Module will call<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the package manager to install them in a=
lphabetical order.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/rpm" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/mendersoftware/mender-update-modules/tree/master/r=
pm</a><br>
-<br>
-comment &quot;rpm needs a toolchain w/ dynamic library, threads and lua &g=
t;=3D 5.3&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_ST=
ATIC_LIBS \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !BR2_PACKAGE_LUA=
 || BR2_PACKAGE_LUA_5_1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS<br>
-<br>
-config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;swupdate&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_JQ # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SWUPDATE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The SWU Update Module allows deploying a=
n SWUpdate-based<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0artifact to the device.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Example use-cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Extend an existing platform usi=
ng SWUpdate with OTA.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender-update-modules/tree/master/swu" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/mendersoftware/mender-update-modules/tree/master/s=
wu</a><br>
-<br>
-comment &quot;swupdate support needs a toolchain w/ dynamic library&quot;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_SYNC_4<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_STATIC_LIBS<br>
-<br>
-endif<br>
-<br>
-comment &quot;mender-update-modules needs mender&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPOR=
TS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_MENDER<br>
diff --git a/package/mender-update-modules/mender-update-modules.hash b/pac=
kage/mender-update-modules/mender-update-modules.hash<br>
deleted file mode 100644<br>
index ec879f46a1..0000000000<br>
--- a/package/mender-update-modules/mender-update-modules.hash<br>
+++ /dev/null<br>
@@ -1,3 +0,0 @@<br>
-# Locally calculated<br>
-sha256=C2=A0 4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4=
541=C2=A0 mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.ta=
r.gz<br>
-sha256=C2=A0 d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295=
688=C2=A0 LICENSE<br>
diff --git a/package/mender-update-modules/<a href=3D"http://mender-update-=
modules.mk" rel=3D"noreferrer" target=3D"_blank">mender-update-modules.mk</=
a> b/package/mender-update-modules/<a href=3D"http://mender-update-modules.=
mk" rel=3D"noreferrer" target=3D"_blank">mender-update-modules.mk</a><br>
deleted file mode 100644<br>
index 0024acc189..0000000000<br>
--- a/package/mender-update-modules/<a href=3D"http://mender-update-modules=
.mk" rel=3D"noreferrer" target=3D"_blank">mender-update-modules.mk</a><br>
+++ /dev/null<br>
@@ -1,77 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# mender-update-modules<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-MENDER_UPDATE_MODULES_VERSION =3D d8c4683e6660af6c65069e10ee4b8ee50ec1af46=
<br>
-MENDER_UPDATE_MODULES_SITE =3D $(call github,mendersoftware,mender-update-=
modules,$(MENDER_UPDATE_MODULES_VERSION))<br>
-MENDER_UPDATE_MODULES_LICENSE =3D Apache-2.0<br>
-MENDER_UPDATE_MODULES_LICENSE_FILES =3D LICENSE<br>
-MENDER_UPDATE_MODULES_DEPENDENCIES =3D host-mender-artifact mender<br>
-<br>
-MENDER_UPDATE_MODULES_MODULES =3D script<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D dfu<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D dir-overlay<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D dirty<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D docker<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D ipk<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D podman<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D reboot<br>
-define MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/reboot/reboot-gen \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_DIR)/bin/reb=
oot-artifact-gen<br>
-endef<br>
-MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS +=3D MENDER_UPDATE_MODULES=
_INSTALL_MENDER_REBOOT_GEN<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK),y)<br>
-MENDER_UPDATE_MODULES_DEPENDENCIES +=3D python3<br>
-MENDER_UPDATE_MODULES_MODULES +=3D rootfs-version-check<br>
-define MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/rootfs-version-chec=
k/mender-compare-versions \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/b=
in/mender-compare-versions<br>
-endef<br>
-MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS +=3D MENDER_UPDATE_MODULES=
_INSTALL_MENDER_COMPARE_VERSIONS<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D rpm<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU),y)<br>
-MENDER_UPDATE_MODULES_MODULES +=3D swu<br>
-endif<br>
-<br>
-define MENDER_UPDATE_MODULES_INSTALL_TARGET_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach f,$(MENDER_UPDATE_MODULES_MODULES), \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 07=
75 $(@D)/$(f)/module/$(f) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(TARGET_DIR)/usr/share/mender/modules/v3/$(f); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d $(@D)/$(f)/=
module-artifact-gen ]; then \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(INSTALL) -D -m 0775 $(@D)/$(f)/module-artifact-gen/$(f)-artifac=
t-gen \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_DIR)/bin/$(f)-artifact-gen; \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-endef<br>
-<br>
-$(eval $(generic-package))<br>
diff --git a/package/mender/Config.in b/package/mender/Config.in<br>
deleted file mode 100644<br>
index c9b9d0b757..0000000000<br>
--- a/package/mender/Config.in<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-config BR2_PACKAGE_MENDER<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mender&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_GO<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBOPENSSL_ENGINES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mender is an open source over-the-air (O=
TA) software updater<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for embedded Linux devices. Mender compr=
ises a client<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0running at the embedded device, as well =
as a server that<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manages deployments across many devices.=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Notes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For systems using uboot as the bootloade=
r:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- uboot must have the mender uboo=
t patches applied.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- uboot-tools must be selected.<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- fw_printenv must be functional =
on the device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The Mender Uboot patches are at:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/meta-mender/" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
mendersoftware/meta-mender/</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For more information on Manual U-Boot in=
tegration, see:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.mender.io/2.6/sy=
stem-updates-yocto-project/board-integration/bootloader-support/u-boot/manu=
al-u-boot-integration" rel=3D"noreferrer" target=3D"_blank">https://docs.me=
nder.io/2.6/system-updates-yocto-project/board-integration/bootloader-suppo=
rt/u-boot/manual-u-boot-integration</a><br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For systems using Grub2 as the bootloade=
r:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Mender depends on the mender-gr=
ubenv package.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- The mender-grubenv package prov=
ides a fw_printenv script,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which is not compatible wi=
th the uboot-tools fw_printenv<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The mender project recommends using uboo=
t to load Grub2 as a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0secondary bootloader whenever possible. =
Using Grub2 as a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0secondary bootloader prevents users from=
 porting the patches<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for uboot to each new device.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/mendersoft=
ware/mender" rel=3D"noreferrer" target=3D"_blank">https://github.com/mender=
software/mender</a><br>
-<br>
-comment &quot;mender needs a toolchain w/ threads&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKI=
NG_SUPPORTS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS<br>
diff --git a/package/mender/S42mender b/package/mender/S42mender<br>
deleted file mode 100644<br>
index 70116ed4eb..0000000000<br>
--- a/package/mender/S42mender<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-#!/bin/sh<br>
-#<br>
-# Starts mender service.<br>
-#<br>
-DAEMON=3D&quot;mender&quot;<br>
-DAEMON_PATH=3D&quot;/usr/bin/mender&quot;<br>
-PIDFILE=3D&quot;/var/run/${DAEMON}.pid&quot;<br>
-DAEMON_ARGS=3D&quot;daemon&quot;<br>
-<br>
-start() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;Starting mender service: &quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0umask 077<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -bmSqp &quot;$PIDFILE&quot; -=
x ${DAEMON_PATH} -- ${DAEMON_ARGS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${status}&quot; =3D 0 ] &amp;&amp; echo=
 &quot;OK&quot; || echo &quot;FAIL&quot;<br>
-}<br>
-<br>
-stop() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;Stopping mender service: &quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon -Kqp &quot;$PIDFILE&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;${status}&quot; =3D 0 ] &amp;&amp; echo=
 &quot;OK&quot; || echo &quot;FAIL&quot;<br>
-}<br>
-restart() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
-}<br>
-<br>
-case &quot;$1&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stop)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0restart|reload)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $=
0 {start|stop|reload|restart}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
-esac<br>
-<br>
-exit $?<br>
diff --git a/package/mender/device_type b/package/mender/device_type<br>
deleted file mode 100644<br>
index a097ef2b3a..0000000000<br>
--- a/package/mender/device_type<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-device_type=3DBUILDROOT_DEVICE<br>
diff --git a/package/mender/mender-client.service b/package/mender/mender-c=
lient.service<br>
deleted file mode 100644<br>
index 47e439993c..0000000000<br>
--- a/package/mender/mender-client.service<br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-[Unit]<br>
-Description=3DMender OTA update service<br>
-After=3Dsystemd-resolved.service<br>
-<br>
-[Service]<br>
-Type=3Didle<br>
-User=3Droot<br>
-Group=3Droot<br>
-ExecStart=3D/usr/bin/mender daemon<br>
-Restart=3Don-abort<br>
-<br>
-[Install]<br>
-WantedBy=3Dmulti-user.target<br>
diff --git a/package/mender/mender.conf b/package/mender/mender.conf<br>
deleted file mode 100644<br>
index 2393948f8e..0000000000<br>
--- a/package/mender/mender.conf<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-{<br>
-=C2=A0 &quot;InventoryPollIntervalSeconds&quot;: 1800,<br>
-=C2=A0 &quot;UpdatePollIntervalSeconds&quot;: 1800,<br>
-=C2=A0 &quot;RetryPollIntervalSeconds&quot;: 300,<br>
-=C2=A0 &quot;RootfsPartA&quot;: &quot;/dev/mmcblk0p2&quot;,<br>
-=C2=A0 &quot;RootfsPartB&quot;: &quot;/dev/mmcblk0p3&quot;,<br>
-=C2=A0 &quot;DeviceTypeFile&quot;: &quot;/var/lib/mender/device_type&quot;=
,<br>
-=C2=A0 &quot;ServerCertificate&quot;: &quot;/etc/mender/server.crt&quot;,<=
br>
-=C2=A0 &quot;ServerURL&quot;: &quot;<a href=3D"https://docker.mender.io" r=
el=3D"noreferrer" target=3D"_blank">https://docker.mender.io</a>&quot;,<br>
-=C2=A0 &quot;TenantToken&quot;: &quot;dummy&quot;<br>
-}<br>
diff --git a/package/mender/mender.hash b/package/mender/mender.hash<br>
deleted file mode 100644<br>
index 17fe08c827..0000000000<br>
--- a/package/mender/mender.hash<br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-# Locally computed:<br>
-sha256=C2=A0 35e369759b8d4f012153e538b5daf1e0cebe842205811e708332c5a092270=
ac5=C2=A0 mender-3.5.3-go2.tar.gz<br>
-<br>
-# Vendor licenses<br>
-# Generated with sed &#39;/^[A-Za-z0-9_]/s/^/sha256=C2=A0 /&#39; LIC_FILES=
_CHKSUM.sha256<br>
-<br>
-# Apache-2.0 license.<br>
-sha256=C2=A0 d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295=
688=C2=A0 LICENSE<br>
-sha256=C2=A0 52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca=
23a=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/mender-artifac=
t/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersof=
tware/mender-artifact/LICENSE<br>
-sha256</a>=C2=A0 73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85=
130bf68=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/openssl/LI=
CENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftwar=
e/openssl/LICENSE<br>
-sha256</a>=C2=A0 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417b=
c523d30=C2=A0 vendor/<a href=3D"http://github.com/minio/sha256-simd/LICENSE=
-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/minio/sha256-simd/=
LICENSE<br>
-sha256</a>=C2=A0 8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c0=
71564c7=C2=A0 vendor/<a href=3D"http://github.com/mendersoftware/progressba=
r/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mendersoftware/p=
rogressbar/LICENSE</a><br>
-#<br>
-# BSD 2 Clause license.<br>
-sha256=C2=A0 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7de=
e86=C2=A0 vendor/<a href=3D"http://github.com/pkg/errors/LICENSE-sha256" re=
l=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE<br>
-sha256</a>=C2=A0 e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad=
8b95128=C2=A0 vendor/<a href=3D"http://github.com/godbus/dbus/LICENSE-sha25=
6" rel=3D"noreferrer" target=3D"_blank">github.com/godbus/dbus/LICENSE<br>
-sha256</a>=C2=A0 2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186=
e4d122d=C2=A0 vendor/<a href=3D"http://github.com/gorilla/websocket/LICENSE=
" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/websocket/LICENSE=
</a><br>
-#<br>
-# BSD 3 Clause license.<br>
-sha256=C2=A0 0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d8=
7cf=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress/LI=
CENSE<br>
-sha256</a>=C2=A0 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf8=
8b56477=C2=A0 vendor/<a href=3D"http://github.com/pmezard/go-difflib/LICENS=
E-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go-diffli=
b/LICENSE<br>
-sha256</a>=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b203=
0cbc067=C2=A0 vendor/<a href=3D"http://golang.org/x/sys/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE<br>
-sha256</a>=C2=A0 0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d=
0c2a03e=C2=A0 vendor/<a href=3D"http://github.com/bmatsuo/lmdb-go/LICENSE.m=
d-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsuo/lmdb-go/L=
ICENSE.md<br>
-sha256</a>=C2=A0 87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680=
a3d918b=C2=A0 vendor/<a href=3D"http://github.com/remyoudompheng/go-liblzma=
/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/remyoudomp=
heng/go-liblzma/LICENSE<br>
-sha256</a>=C2=A0 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b203=
0cbc067=C2=A0 vendor/<a href=3D"http://golang.org/x/term/LICENSE" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/term/LICENSE</a><br>
-#<br>
-# ISC license.<br>
-sha256=C2=A0 1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470=
251=C2=A0 vendor/<a href=3D"http://github.com/davecgh/go-spew/LICENSE" rel=
=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew/LICENSE</a><br=
>
-#<br>
-# MIT license.<br>
-sha256=C2=A0 6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687=
685=C2=A0 vendor/<a href=3D"http://github.com/klauspost/pgzip/LICENSE-sha25=
6" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/pgzip/LICENSE<=
br>
-sha256</a>=C2=A0 f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf35133=
5bf98cf=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/intern=
al/snapref/LICENSE-sha256" rel=3D"noreferrer" target=3D"_blank">github.com/=
klauspost/compress/internal/snapref/LICENSE<br>
-sha256</a>=C2=A0 f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a=
1c9a79c=C2=A0 vendor/<a href=3D"http://github.com/klauspost/compress/zstd/i=
nternal/xxhash/LICENSE.txt" rel=3D"noreferrer" target=3D"_blank">github.com=
/klauspost/compress/zstd/internal/xxhash/LICENSE.txt</a><br>
-sha256=C2=A0 5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40=
212=C2=A0 vendor/<a href=3D"http://github.com/klauspost/cpuid/v2/LICENSE-sh=
a256" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/cpuid/v2/LI=
CENSE<br>
-sha256</a>=C2=A0 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c3139734246=
64b2e6b=C2=A0 vendor/<a href=3D"http://github.com/sirupsen/logrus/LICENSE-s=
ha256" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logrus/LICE=
NSE<br>
-sha256</a>=C2=A0 f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e=
2599189=C2=A0 vendor/<a href=3D"http://github.com/stretchr/testify/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/testify/LI=
CENSE<br>
-sha256</a>=C2=A0 ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b=
327183e=C2=A0 vendor/<a href=3D"http://github.com/ungerik/go-sysfs/LICENSE-=
sha256" rel=3D"noreferrer" target=3D"_blank">github.com/ungerik/go-sysfs/LI=
CENSE<br>
-sha256</a>=C2=A0 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de5=
5345fd7=C2=A0 vendor/<a href=3D"http://github.com/urfave/cli/v2/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/v2/LICENSE<=
br>
-sha256</a>=C2=A0 b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23=
b6b61b0=C2=A0 vendor/<a href=3D"http://github.com/stretchr/objx/LICENSE-sha=
256" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/objx/LICENSE<=
br>
-sha256</a>=C2=A0 d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e=
4e6aa0b=C2=A0 vendor/<a href=3D"http://gopkg.in/yaml.v3/LICENSE-sha256" rel=
=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE<br>
-sha256</a>=C2=A0 08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c=
76e6fa1=C2=A0 vendor/<a href=3D"http://github.com/mattn/go-isatty/LICENSE" =
rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isatty/LICENSE</a>=
<br>
-#<br>
-# OpenLDAP Public License<br>
-sha256=C2=A0 310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e=
569=C2=A0 vendor/<a href=3D"http://github.com/bmatsuo/lmdb-go/LICENSE.mdb.m=
d" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsuo/lmdb-go/LICENSE.=
mdb.md</a><br>
-<br>
-# sha256 of all the vendor licenses combined<br>
-sha256=C2=A0 86407bd98d5ea7fb0f09ab771c3333e975d06565b809a2dd95f864dc1e3a0=
9b3=C2=A0 LIC_FILES_CHKSUM.sha256<br>
diff --git a/package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer"=
 target=3D"_blank">mender.mk</a> b/package/mender/<a href=3D"http://mender.=
mk" rel=3D"noreferrer" target=3D"_blank">mender.mk</a><br>
deleted file mode 100644<br>
index 76dc28d547..0000000000<br>
--- a/package/mender/<a href=3D"http://mender.mk" rel=3D"noreferrer" target=
=3D"_blank">mender.mk</a><br>
+++ /dev/null<br>
@@ -1,110 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# mender<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-MENDER_VERSION =3D 3.5.3<br>
-MENDER_SITE =3D $(call github,mendersoftware,mender,$(MENDER_VERSION))<br>
-MENDER_LICENSE =3D Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP=
-2.8<br>
-MENDER_CPE_ID_VENDOR =3D northern.tech<br>
-# CVE-2024-46948 only affects mender-server<br>
-MENDER_IGNORE_CVES =3D CVE-2024-46948<br>
-<br>
-# Vendor license paths generated with:<br>
-#=C2=A0 =C2=A0 awk &#39;{print $2}&#39; LIC_FILES_CHKSUM.sha256 | grep ven=
dor<br>
-MENDER_LICENSE_FILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LIC_FILES_CHKSUM.sha256 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/mender-artifact/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.co=
m/mendersoftware/mender-artifact/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/openssl/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mender=
software/openssl/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/minio/sha25=
6-simd/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/minio/sha25=
6-simd/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mendersoftw=
are/progressbar/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/me=
ndersoftware/progressbar/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pkg/errors/=
LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors/LICENSE=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/godbus/dbus=
/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/godbus/dbus/LICEN=
SE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/gorilla/web=
socket/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/web=
socket/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
compress/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/pmezard/go-=
difflib/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/pmezard/go=
-difflib/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/sys/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/bmatsuo/lmd=
b-go/LICENSE.md" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsuo/lm=
db-go/LICENSE.md</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/remyoudomph=
eng/go-liblzma/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/rem=
youdompheng/go-liblzma/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://golang.org/x/term/LICE=
NSE" rel=3D"noreferrer" target=3D"_blank">golang.org/x/term/LICENSE</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/davecgh/go-=
spew/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-sp=
ew/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/p=
gzip/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/pgz=
ip/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/internal/snapref/LICENSE" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/klauspost/compress/internal/snapref/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
ompress/zstd/internal/xxhash/LICENSE.txt" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt</a> \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/klauspost/c=
puid/v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
cpuid/v2/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/sirupsen/lo=
grus/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logr=
us/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/te=
stify/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/tes=
tify/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/ungerik/go-=
sysfs/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/ungerik/go-s=
ysfs/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/urfave/cli/=
v2/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/urfave/cli/v2/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/stretchr/ob=
jx/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/objx/L=
ICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://gopkg.in/yaml.v3/LICEN=
SE" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/mattn/go-is=
atty/LICENSE" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isat=
ty/LICENSE</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor/<a href=3D"http://github.com/bmatsuo/lmd=
b-go/LICENSE.mdb.md" rel=3D"noreferrer" target=3D"_blank">github.com/bmatsu=
o/lmdb-go/LICENSE.mdb.md</a><br>
-<br>
-MENDER_DEPENDENCIES =3D host-pkgconf openssl<br>
-<br>
-MENDER_LDFLAGS =3D -X <a href=3D"http://github.com/mendersoftware/mender/c=
onf.Version=3D$(MENDER_VERSION)" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/mendersoftware/mender/conf.Version=3D$(MENDER_VERSION)</a><br>
-<br>
-MENDER_UPDATE_MODULES_FILES =3D directory single-file<br>
-<br>
-define MENDER_INSTALL_CONFIG_FILES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/s=
cripts<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;3&quot; &gt; $(TARGET_DIR)/etc/me=
nder/scripts/version<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.c=
onf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/m=
ender/mender.conf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.c=
rt \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/m=
ender/server.crt<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/support/mender-devi=
ce-identity \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/s=
hare/mender/identity/mender-device-identity<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach f,bootloader-integration hostinfo net=
work os rootfs-type, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 07=
55 $(@D)/support/mender-inventory-$(f) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_t=
ype \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(TARGET_DIR)/etc/mender/device_type<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/var/lib/mender<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 07=
55 $(@D)/support/modules/$(notdir $(f)) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-endef<br>
-<br>
-MENDER_POST_INSTALL_TARGET_HOOKS +=3D MENDER_INSTALL_CONFIG_FILES<br>
-<br>
-ifeq ($(BR2_PACKAGE_XZ),y)<br>
-MENDER_DEPENDENCIES +=3D xz<br>
-else<br>
-MENDER_TAGS +=3D nolzma<br>
-endif<br>
-<br>
-ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)<br>
-MENDER_DEPENDENCIES +=3D libglib2<br>
-define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.men=
der.AuthenticationManager.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/d=
bus-1/system.d/io.mender.AuthenticationManager.conf<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.men=
der.UpdateManager.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/d=
bus-1/system.d/io.mender.UpdateManager.conf<br>
-endef<br>
-MENDER_POST_INSTALL_TARGET_HOOKS +=3D MENDER_INSTALL_DBUS_AUTHENTICATION_M=
ANAGER_CONF<br>
-else<br>
-MENDER_TAGS +=3D nodbus<br>
-endif<br>
-<br>
-define MENDER_INSTALL_INIT_SYSTEMD<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-c=
lient.service \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/l=
ib/systemd/system/mender-client.service<br>
-endef<br>
-<br>
-define MENDER_INSTALL_INIT_SYSV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/i=
nit.d/S42mender<br>
-endef<br>
-<br>
-$(eval $(golang-package))<br>
diff --git a/package/mender/readme.txt b/package/mender/readme.txt<br>
deleted file mode 100644<br>
index 56d6204583..0000000000<br>
--- a/package/mender/readme.txt<br>
+++ /dev/null<br>
@@ -1,132 +0,0 @@<br>
-=3D=3D=3D Notes on using Mender on Buildroot<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-Mender is an open source over-the-air (OTA) software updater for<br>
-embedded Linux devices. Mender comprises a client running at the<br>
-embedded device, as well as a server that manages deployments across<br>
-many devices. There is also various tooling around the Mender project,<br>
-such as &#39;mender-artifact&#39; which is used to create Mender Artifacts=
<br>
-that are compatible with the Mender client and server.<br>
-<br>
-Mender aims to address this challenge with a robust and easy to use<br>
-updater for embedded Linux devices, which is open source and available<br>
-to anyone.<br>
-<br>
-Robustness is ensured with atomic image-based deployments using a dual<br>
-A/B rootfs partition layout. This makes it always possible to roll<br>
-back to a working state, even when losing power at any time during the<br>
-update process.<br>
-<br>
-The official documentation is a good resource to get an in depth<br>
-understanding of how Mender works:<br>
-<br>
-=C2=A0 =C2=A0 <a href=3D"https://docs.mender.io" rel=3D"noreferrer" target=
=3D"_blank">https://docs.mender.io</a><br>
-<br>
-In Buildroot the following packages are provided:<br>
-<br>
-- BR2_PACKAGE_MENDER<br>
-=C2=A0 =C2=A0 - This will install the client on target rootfs<br>
-- BR2_PACKAGE_HOST_MENDER_ARTIFACT<br>
-=C2=A0 =C2=A0 - This will install the &#39;mender-artifact&#39; tool in ho=
st rootfs.<br>
-- BR2_PACKAGE_MENDER_CONNECT<br>
-=C2=A0 =C2=A0 - This installs a client that allows for remote terminal acc=
ess<br>
-=C2=A0 =C2=A0 =C2=A0 to mender clients registered on a mender server.<br>
-- BR2_PACKAGE_MENDER_GRUBENV<br>
-=C2=A0 =C2=A0 - This package provides boot scripts to integrate mender int=
o grub.<br>
-=C2=A0 =C2=A0 =C2=A0 Mender recommends every client to use this package, i=
ncluding boards<br>
-=C2=A0 =C2=A0 =C2=A0 using uboot as the primary bootloader.<br>
-<br>
-To fully utilize atomic image-based deployments using the A/B update<br>
-strategy, additional integration is required in the bootloader. This<br>
-integration is board specific.<br>
-<br>
-Currently supported bootloaders are GRUB and U-boot. Buildroot provides<br=
>
-a reference integration at board/mender/x86_64/ using the<br>
-mender_x86_64_efi_defconfig file.<br>
-<br>
-Additional support and integrations are found at:<br>
-<br>
-=C2=A0 =C2=A0 <a href=3D"https://github.com/mendersoftware/buildroot-mende=
r" rel=3D"noreferrer" target=3D"_blank">https://github.com/mendersoftware/b=
uildroot-mender</a><br>
-<br>
-Default configurations files<br>
-----------------------------<br>
-<br>
-Buildroot comes with a default configuration and there a couple of<br>
-files that need your attention:<br>
-<br>
-- /etc/mender/mender.conf<br>
-=C2=A0 =C2=A0 - main configuration file for the Mender client<br>
-=C2=A0 =C2=A0 - <a href=3D"https://docs.mender.io/client-installation/conf=
iguration/configuration-options" rel=3D"noreferrer" target=3D"_blank">https=
://docs.mender.io/client-installation/configuration/configuration-options</=
a><br>
-<br>
-- /var/lib/mender/device_type<br>
-=C2=A0 =C2=A0 - A string that defines the type of device<br>
-<br>
-Mender server configuration<br>
----------------------------<br>
-<br>
-The Mender server can be setup in different ways, and how you<br>
-configure the Mender client differs slightly depending on which server<br>
-environment is used.<br>
-<br>
-- Mender demo environment<br>
-<br>
-This is if you have followed the Getting started documentation where<br>
-you launch a Mender server locally and to configure your environment<br>
-to connect to this local server you need to provide the IP address of<br>
-the server on the local network.<br>
-<br>
-By default the demo environment will connect to &#39;<a href=3D"http://doc=
ker.mender.io" rel=3D"noreferrer" target=3D"_blank">docker.mender.io</a>&#3=
9; and<br>
-&#39;<a href=3D"http://s3.docker.mender.io" rel=3D"noreferrer" target=3D"_=
blank">s3.docker.mender.io</a>&#39; and we need to make sure that these are=
 resolved<br>
-to the local IP address of the running server by adding the following<br>
-entry to &#39;/etc/hosts&#39;<br>
-<br>
-=C2=A0 =C2=A0 &lt;ip address of demo environment&gt; <a href=3D"http://doc=
ker.mender.io" rel=3D"noreferrer" target=3D"_blank">docker.mender.io</a> <a=
 href=3D"http://s3.docker.mender.io" rel=3D"noreferrer" target=3D"_blank">s=
3.docker.mender.io</a><br>
-<br>
-This is required because the communication between client and server<br>
-is utilizing TLS and the provided demo server certificate (server.crt)<br>
-is only valid for &#39;<a href=3D"http://docker.mender.io" rel=3D"noreferr=
er" target=3D"_blank">docker.mender.io</a>&#39; and &#39;<a href=3D"http://=
s3.docker.mender.io" rel=3D"noreferrer" target=3D"_blank">s3.docker.mender.=
io</a>&#39;<br>
-domains.<br>
-<br>
-- Hosted Mender<br>
-<br>
-To authenticate the Mender client with the Hosted Mender server you<br>
-need a tenant token.<br>
-<br>
-To get your tenant token:<br>
-<br>
-- log in to <a href=3D"https://hosted.mender.io" rel=3D"noreferrer" target=
=3D"_blank">https://hosted.mender.io</a><br>
-- click your email at the top right and then =E2=80=9CMy organization=E2=
=80=9D<br>
-- press the =E2=80=9CCOPY TO CLIPBOARD=E2=80=9D<br>
-- assign content of clipboard to TenantToken<br>
-<br>
-Example mender.conf options for Hosted Mender:<br>
-<br>
-=C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 ...<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;ServerURL&quot;: &quot;<a href=3D"https://hoste=
d.mender.io" rel=3D"noreferrer" target=3D"_blank">https://hosted.mender.io<=
/a>&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;TenantToken&quot;: &quot;&lt;paste tenant token=
 here&gt;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 ...<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-<br>
-Creating Mender Artifacts<br>
--------------------------<br>
-<br>
-To create Mender Artifacts based on Buildroot build output you must<br>
-include BR2_PACKAGE_HOST_MENDER_ARTIFACT in your configuration, and<br>
-then you would typically create the Mender Artifact in a post image<br>
-script (BR2_ROOTFS_POST_IMAGE_SCRIPT). See the generate_mender_image<br>
-method in board/mender/x86_64/post-image-efi.sh for a working example.<br>
-<br>
-Additionally, mender requires a bootstrap.mender file which is also<br>
-generated using the host-mender-artifact package. See the<br>
-generate_mender_bootstrap_artifact method in<br>
-board/mender/x86_64/post-image-efi.sh for an example<br>
-<br>
-Configuring Mender with certificates<br>
-------------------------------------<br>
-<br>
-Mender uses TLS to communicate with the management server, and if you<br>
-use a CA-signed certificate on the server, you must include<br>
-BR2_PACKAGE_CA_CERTIFICATES in your configuration to authenticate TLS<br>
-connections.<br>
diff --git a/package/mender/server.crt b/package/mender/server.crt<br>
deleted file mode 100644<br>
index 79a57e15e7..0000000000<br>
--- a/package/mender/server.crt<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
------BEGIN CERTIFICATE-----<br>
-MIIBfTCCASOgAwIBAgIJAJOS76a0qWuZMAoGCCqGSM49BAMCMBsxGTAXBgNVBAMM<br>
-EGRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1MjQ2<br>
-WjAbMRkwFwYDVQQDDBBkb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0CAQYIKoZI<br>
-zj0DAQcDQgAE7AVYis6MWGPGQYU1/tlLEnskRifDIhvkRb8Y4nQPekRkLkiBYYT3<br>
-iJ46wHrnejbHaLstU9GRdKWOmOuU6HGdO6NQME4wHQYDVR0OBBYEFGOIU4q++Vz8<br>
-9HuT1jg9V+wFeJcyMB8GA1UdIwQYMBaAFGOIU4q++Vz89HuT1jg9V+wFeJcyMAwG<br>
-A1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIhAPLnEeWPNeN7eDCEYRitBfyO<br>
-X1yf2kzOm4ohBE5GY9gzAiBCq7HOSkzQDkelmQCCCpGXf/UwYNgQJjSoeGfk0j1a<br>
-TQ=3D=3D<br>
------END CERTIFICATE-----<br>
------BEGIN CERTIFICATE-----<br>
-MIIBhDCCASmgAwIBAgIJALQrf4QDot4IMAoGCCqGSM49BAMCMB4xHDAaBgNVBAMM<br>
-E3MzLmRvY2tlci5tZW5kZXIuaW8wHhcNMTYxMjE0MTk1MjQ2WhcNMjYxMjEyMTk1<br>
-MjQ2WjAeMRwwGgYDVQQDDBNzMy5kb2NrZXIubWVuZGVyLmlvMFkwEwYHKoZIzj0C<br>
-AQYIKoZIzj0DAQcDQgAEEc/Y3T+l3DvINePkpvVZORMIdHVs29jgsl48ia7z/NRX<br>
-HlKtKxVGJyFN5Y7sBZeLgBYH3F4Bo3KfmxI7ad0tI6NQME4wHQYDVR0OBBYEFIUm<br>
-cip00QZYpe4ULflbGNJan+Y9MB8GA1UdIwQYMBaAFIUmcip00QZYpe4ULflbGNJa<br>
-n+Y9MAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhANHij9VZBDHOUPaC<br>
-pFiagnWnYL2HBR72W1xTKQbrLLTXAiEAvpwA4HzSnGmLd3010+jqQuMRHArN5WaX<br>
-h0fy7niBbIQ=3D<br>
------END CERTIFICATE-----<br>
diff --git a/support/testing/tests/package/test_mender.py b/support/testing=
/tests/package/test_mender.py<br>
deleted file mode 100644<br>
index 14440c9527..0000000000<br>
--- a/support/testing/tests/package/test_mender.py<br>
+++ /dev/null<br>
@@ -1,72 +0,0 @@<br>
-import os<br>
-<br>
-import infra.basetest<br>
-<br>
-<br>
-class TestMenderInfra(infra.basetest.BRTest):<br>
-=C2=A0 =C2=A0 config =3D infra.basetest.BASIC_TOOLCHAIN_CONFIG + \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MENDER=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_HOST_MENDER_AR=
TIFACT=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_CPIO=3Dy=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_ROOTFS_POST_BUILD_SCRI=
PT=3D&quot;{}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_ROOTFS_OVERLAY=3D&quot=
;{}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;.format(=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.filepa=
th(&quot;tests/package/test_mender/post-build.sh&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# overlay to=
 add a fake &#39;fw_printenv&#39;, used by Mender<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infra.filepa=
th(&quot;tests/package/test_mender/rootfs-overlay&quot;))<br>
-<br>
-=C2=A0 =C2=A0 def base_test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpio_file =3D os.path.join(self.builddir, &quo=
t;images&quot;, &quot;rootfs.cpio&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.emulator.boot(arch=3D&quot;armv5&quot;, k=
ernel=3D&quot;builtin&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0options=3D[&quot;-initrd&quot;, cpio_file])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.emulator.login()<br>
-<br>
-=C2=A0 =C2=A0 def run_mender_test(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;ps aux | egrep [m]ender=
&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if a simple Mender command is correctl=
y executed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;mender -log-level debug=
 show-artifact&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;mender -log-level debug=
 show-artifact | grep &#39;RUNTIME_TEST_ARTIFACT_NAME&#39;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mender show-artifact 2&gt;&amp;1=
 | grep -i &#39;err&#39;&quot;=C2=A0 # Check if no &#39;error&#39; among th=
e traces<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _, exit_code =3D self.emulator.run(cmd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(exit_code, 1)<br>
-<br>
-<br>
-class TestMenderRW(TestMenderInfra):<br>
-=C2=A0 =C2=A0 def test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestMenderInfra.base_test_run(self)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if the Daemon is running<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;ls /var/run/mender.pid&=
quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_mender_test()<br>
-<br>
-<br>
-class TestMenderRO(TestMenderInfra):<br>
-=C2=A0 =C2=A0 config =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not =
set<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;.format(TestMenderInfra.conf=
ig)<br>
-<br>
-=C2=A0 =C2=A0 def test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestMenderInfra.base_test_run(self)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if the Daemon is running<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;ls /var/run/mender.pid&=
quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_mender_test()<br>
-<br>
-<br>
-# gitlab-runner: large<br>
-class TestMenderSystemd(TestMenderInfra):<br>
-=C2=A0 =C2=A0 config =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_INIT_SYSTEMD=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;.format(TestMenderInfra.conf=
ig)<br>
-<br>
-=C2=A0 =C2=A0 def test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestMenderInfra.base_test_run(self)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output, _ =3D self.emulator.run(&quot;systemct=
l is-active mender-client&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output[0], &quot;active&quot;=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_mender_test()<br>
diff --git a/support/testing/tests/package/test_mender/post-build.sh b/supp=
ort/testing/tests/package/test_mender/post-build.sh<br>
deleted file mode 100755<br>
index 1afa231082..0000000000<br>
--- a/support/testing/tests/package/test_mender/post-build.sh<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-#!/usr/bin/env bash<br>
-set -e<br>
-DEVICE_TYPE=3D&quot;buildroot-arm&quot;<br>
-ARTIFACT_NAME=3D&quot;RUNTIME_TEST_ARTIFACT_NAME&quot;<br>
-<br>
-generate_mender_bootstrap_artifact() {<br>
-=C2=A0 &quot;${HOST_DIR}&quot;/bin/mender-artifact \<br>
-=C2=A0 =C2=A0 write bootstrap-artifact \<br>
-=C2=A0 =C2=A0 --artifact-name &quot;${ARTIFACT_NAME}&quot; \<br>
-=C2=A0 =C2=A0 --device-type &quot;${DEVICE_TYPE}&quot; \<br>
-=C2=A0 =C2=A0 --provides &quot;rootfs-image.version:${ARTIFACT_NAME}&quot;=
 \<br>
-=C2=A0 =C2=A0 --clears-provides &quot;rootfs-image.*&quot; \<br>
-=C2=A0 =C2=A0 --output-path &quot;${TARGET_DIR}&quot;/var/lib/mender/boots=
trap.mender \<br>
-=C2=A0 =C2=A0 --version 3<br>
-}<br>
-<br>
-function mender_fixup() {<br>
-=C2=A0 rm -rf &quot;${TARGET_DIR}&quot;/var/lib/mender<br>
-=C2=A0 mkdir -p &quot;${TARGET_DIR}&quot;/var/lib/mender<br>
-=C2=A0 echo &quot;device_type=3D${DEVICE_TYPE}&quot; &gt; &quot;${TARGET_D=
IR}&quot;/var/lib/mender/device_type<br>
-<br>
-}<br>
-<br>
-mender_fixup<br>
-generate_mender_bootstrap_artifact<br>
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/m=
ender/artifact_info b/support/testing/tests/package/test_mender/rootfs-over=
lay/etc/mender/artifact_info<br>
deleted file mode 100644<br>
index 4d54b8f89c..0000000000<br>
--- a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/a=
rtifact_info<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-artifact_name=3DRUNTIME_TEST_ARTIFACT_NAME<br>
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/usr/b=
in/fw_printenv b/support/testing/tests/package/test_mender/rootfs-overlay/u=
sr/bin/fw_printenv<br>
deleted file mode 100755<br>
index c002a0f2b8..0000000000<br>
--- a/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_p=
rintenv<br>
+++ /dev/null<br>
@@ -1,6 +0,0 @@<br>
-#!/bin/sh<br>
-<br>
-# Fake &#39;fw_printenv&#39; because UBoot is not installed: print some pl=
ausible &#39;key-value&#39;<br>
-echo &quot;bootcount=3D0&quot;<br>
-echo &quot;mender_boot_part=3Drootfs&quot;<br>
-echo &quot;upgrade_available=3D0&quot;<br>
-- <br>
2.47.3<br>
<br>
</blockquote></div>

--000000000000627d9b065b82e8ad--

--===============3427709601527839876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3427709601527839876==--
