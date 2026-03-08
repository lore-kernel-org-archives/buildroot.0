Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40990F5513F
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 11:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB03A41970;
	Sun,  8 Mar 2026 11:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJGCgqRPe4Zd; Sun,  8 Mar 2026 11:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACA54193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772970271;
	bh=50+cnMZQ5eO7M0UOXIxkLFmwuYQDQFqfRKP7R2vCT9s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iFZNoQHYtXRRC0D+rectTdUx1wNA4PZOW3d2vKYq5BZMxeKKh6rvP2O4nLpX8goBv
	 8XHV601zeJjYtMvQm6mam2itf+woeWpYmTXHPltFa/gPgxREk4bc8b3/OR+C7Y50mE
	 T4GmicX051PcHWvrM/NSIRIaN/1jJDjl5dsyG7xjkOqUT+87auikPtZUsZu0+ixMYw
	 QC2mJhKjyCQdJ4trc+T5QKJ27wW4RTzj7sYiwpbavb85Gc7NbisP5E53wyLwL+gDjX
	 mszWgapO++ygf3yNo3EL2hs78nZAqrfyC5iClTsrQEWAi2gtqN2YfrVaOvYDTUwnIz
	 nI9xrqwxpfaTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACA54193D;
	Sun,  8 Mar 2026 11:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF75119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012F461046
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-CcOlQurVQJ for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 11:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01D216102F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D216102F
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01D216102F
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:44:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b96e1ae843dso68685166b.2
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 04:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772970266; cv=none;
 d=google.com; s=arc-20240605;
 b=CCav7lK16mvHPj4EUOUQeQsAzf7byNfirpLpWCv1th5+llGGCTkW5I9gfhkws7tHbu
 82tBwGXjyMUeTPC5NfhIC1YqKaryiuL7Di3dPNMwO3dljDy7xEy1Rl2mqCETfY96kEGQ
 dpsBuO3YtsAbtkcf7oZIFsdMLv8P52VDC7SecFGeHU9teKLUbF0uDFalvX9Z94Mrsa7H
 0nnUu/3M1PcGxg8gNVZHARZRvt4Qbkd3AQaEN4b595AsD3Ckc3lQzFXymKugvGTOl+KJ
 4tcooSKSx2BQLPXmmkR39rnnQ07U+YzbpC7zstXqJOqLHkCjXJVbzt35JSMxbyo0qMTl
 wJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=G5AUoZoWxkf2o5WW1tOclhtC5xKT1vXCmkYt4fJ5wqY=;
 fh=FFcEOvEXv41PO7kcmVght3qCfzjhkXg6DJmLx9c0Iy4=;
 b=Yw1AS1C/+F5s8ctrZRZuf4HyDi1KUWWKrkXn8pwsAjXEM0dBUGFpX7MyybUfmRZ2qV
 knOUth/I6OJY+LvOc+EzGQ7qwRh8hQTq1SUydP7HGzG2iHKA8F/njmiPBpYVGqpPACoF
 Q/KyYIAJOxLF24imRAU5GU61j1T7vjcWNM5C/IFNWDNbR+xEZvQYH/hUnW0jahz3P5d0
 1L/c1bIO9CHFM2Uoil4nL7A0/ZHZOQqPryEvzHzNXymgI/YDxCn5REEVi/fN0V7izP3A
 aT1qpPd4tqOfQOXqiQoA5dXCXxEHOqAiCYaPY2p2DzyIwoZPHulGtFIJACwW1UiXgv7E
 J57A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772970266; x=1773575066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5AUoZoWxkf2o5WW1tOclhtC5xKT1vXCmkYt4fJ5wqY=;
 b=sGf3mUlh3bHqaDTJtqFIXnTkwVJbL2tQ47BmC5yR0vBp/7qIpFSfTTp+nAdnUKCeUS
 awW3Y2Oi8Pu5bqfvG6OA+oDSxIRzuAVwVvVAUrWgAjveOxmygnHx3HAmhaeVhXaGJRD9
 1cUCUaJGYJV2hz927q/iyWE7iSRm1Cdxpzd08n86AxQDvsI6ejmC77E4YRCDgvhScnc0
 okaI+LOp0setQUc6/jn+ISbdW8I/TZqz6wEYsRWnzOCREEpgke1jfNsMU2BJD9fwcary
 jPDP0W3zOZNiM55RS7jI/7e3XnoH6oPnVJ6M8RBnq+eaqXRpXJeQVtnxTVER91W8uQeq
 jJBQ==
X-Gm-Message-State: AOJu0YxV4gYHJA8rBgq5JahZxgUBT136SD+AdLAO+7WAN7UoWrvxNqhF
 qlQ965dSdphn/eFBGPkkQN22+JhKVGyJGBQoslRgd/GFxJ4Qm1FBA+FhuTvOXAaAsXznYdaWR1s
 Hk854C/TrcrFhW4fzeZc47VtwZwCXDI8=
X-Gm-Gg: ATEYQzyrQT12FhQefc0EYGjRloLS0RrczRzAl2+u32lp/L5MzNlcit8rKj0IEsDNISs
 VnTWxwg2HT1Ls3wUty0IuqATBP76X7DsTwH//lyhQVrKPxT1RA+Xlsl6VFZTIb4LclNiIImsY6z
 cViQwyYbr0QkcbbwrLnQ/0kUZsIF+K2nfu1QTEO6KgYaqg/IrkkljeAwdPkHYUIuB+IBmEsjwRJ
 IDNx+obFISXXJMhkYihF+wVeVuDCK89mXKUZospCPAfHVJ/9wqFHhEFcbcCoqzpG6P/exgVZpyN
 OGg9bDkhybjxekGXArsF+IZTtvHCTOox9nj3L3LwWA==
X-Received: by 2002:a17:907:3da7:b0:b90:e20b:acb9 with SMTP id
 a640c23a62f3a-b942d583b05mr419559266b.0.1772970265454; Sun, 08 Mar 2026
 04:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <dbd49ae98de7302e5a0cf5394e8c9b05@umbiko.net>
 <20260304065424.10023-1-chakrabortyshubham66@gmail.com>
In-Reply-To: <20260304065424.10023-1-chakrabortyshubham66@gmail.com>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 8 Mar 2026 17:14:14 +0530
X-Gm-Features: AaiRm50oG1PC2Jr5PirEt2TSDbUtSKFZ2VslKOmpMYAtGb6w1Hoe7509wmClx8Y
Message-ID: <CABvxkswzcvL4HRpjQzy9nHO8_TJBzSfO2L-hwqrRadMSfSmwiQ@mail.gmail.com>
To: br025@umbiko.net
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, 
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772970266; x=1773575066; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G5AUoZoWxkf2o5WW1tOclhtC5xKT1vXCmkYt4fJ5wqY=;
 b=IQQ2oqanQX1fnnItmzDVbqb1Gk3YLMd3qNCcGwzhAd+hcrUfjFeWDiiKezza+556w+
 IUUb+V/WL5Mk6vjQQpzDzV8x7XeFffaedm3KA4XAAABkHvYYs5dGIfpEk8uMKuvQyCRI
 bmIABPdfOuUP9fyKnY+iccKdIeK/J2r7ILSQJyp8yEqT2mfkky8upkYUN7HlbUyDN4Ue
 46P+Qt5AKECdEaV0vUI9mobuFSh6UTWVmK2+B2JnyXQVWfVZurisGjjje94izRtYtHkz
 0hHt6E8/ptNq3Lrr79Dl4EKF5CcD9fHXk2zOPh9D8b26h17b84enacGb73MtWNXBd45F
 tlFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IQQ2oqan
Subject: Re: [Buildroot] [PATCH v2] package/icu: fix static linking with
 icu-uc for musl static toolchains
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
Content-Type: multipart/mixed; boundary="===============7550497086864198226=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7550497086864198226==
Content-Type: multipart/alternative; boundary="000000000000deac0a064c81cea3"

--000000000000deac0a064c81cea3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending as previous email bounced from romain.naour@openwide.fr.
Using gmail address from DEVELOPERS file instead.

On Wed, Mar 4, 2026 at 12:24=E2=80=AFPM Shubham Chakraborty <
chakrabortyshubham66@gmail.com> wrote:

> Hi Andreas,
>
> Thanks for the review.
>
> I will send a v3 that replaces both 0003 and 0004 with a single
> patch adding -lstdc++ to both Libs and Libs.private, with no
> musl-specific language.
>
> Romain, would you be okay with me adding your Co-developed-by
> and Signed-off-by tags to the combined patch?
>
> Best regards,
> Shubham Chakraborty
>

--000000000000deac0a064c81cea3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Resending as previous email bounced from <a href=3D"mailto=
:romain.naour@openwide.fr">romain.naour@openwide.fr</a>.<br>Using gmail add=
ress from DEVELOPERS file instead.</div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 4, 2026=
 at 12:24=E2=80=AFPM Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortys=
hubham66@gmail.com">chakrabortyshubham66@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Andreas,<br>
<br>
Thanks for the review.<br>
<br>
I will send a v3 that replaces both 0003 and 0004 with a single<br>
patch adding -lstdc++ to both Libs and Libs.private, with no<br>
musl-specific language.<br>
<br>
Romain, would you be okay with me adding your Co-developed-by<br>
and Signed-off-by tags to the combined patch?<br>
<br>
Best regards,<br>
Shubham Chakraborty<br>
</blockquote></div>

--000000000000deac0a064c81cea3--

--===============7550497086864198226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7550497086864198226==--
