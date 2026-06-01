Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BFCCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 15:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D911D84185;
	Mon,  1 Jun 2026 15:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWfliBD0HyYI; Mon,  1 Jun 2026 15:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A4684746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780328516;
	bh=xHK+2NMBZCBavdI3iwUW7E4G2AzmIaoItZbw1y2h1EQ=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A0T3P/wt4Im3tbBSNlzIl1Sh5ScLjO6jngcDNKfq96QouEpcqRQr5INFelxu75wDg
	 ufRCCjVgTvlcnKxcu9tzOgKKntPUosOy+UgZsvZQhuciUnwBqqyEcOOHslBi4XrClh
	 Pv34m3oRXIOAFiXLmSfqMdrtPbXlad1fwjFxhSct9kRpcPtC+HAD6/G3K1blyn+y5K
	 lNzsMZVeWjR/0wR4euWSeHggv9w3eTYFAp0OUU+fw6Zz1gvJ/TLw37AKA0svRbVYo/
	 YtGbpKe2AJaaZzn9nXNDyOH4Jvop4lvGFK+SJ8QUH6eeIyWQcpna2gkSsIGDQPVyjW
	 jCGgN2qbm1DQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A4684746;
	Mon,  1 Jun 2026 15:41:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B0B8294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 15:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1002484746
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 15:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 469rfkT7MYGP for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 15:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12C6984185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C6984185
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12C6984185
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 15:41:53 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-68ca6f01079so2381879a12.0
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 08:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780328512; cv=none;
 d=google.com; s=arc-20240605;
 b=UI1467NveqWnzKVMS6Osv5fLv9trJuL4pqbftnGo25Nidwa790gTX7Fo6ld4ICwpjK
 kkMpbukmlRpxCbYA5qhYjj7HqhJ9pZy3qQmqeqF6Eju9BWYQiNG5n7m9aovYaX2HAfMR
 v7K8xeTCWn3aKlc+/p/xH17eF+J+9q4wVQDlyXOo8jGWBFkIqcswHJRmBEL+ZdeeSeI2
 1/EHb5SpR4b5w3hR0/wTwOINrSSMTc3gScIx9njU3BGPk3k+ye739hBv0ZgduOimZHUB
 Q6DvHXUUV21z6Ju5cMyyR4nAVc6u1q8TMpmV/A/f6mdw2nLnq4oK/zPZUJ9qlQ5XIyA4
 6plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=rF0f8Zg34x2ZAH4M1Y5Zi4pMfTkhmAZzlaim2N+AVPE=;
 fh=6fgkHrNdJSOQsJPtGLPwnv6V5xq5cGsb4wO9kqOVz8k=;
 b=JrjJxdEnjgHNshcX3LiDWizf+j26rapc1EKCZ0EnMycYB6T6Jp6qVD7cTON2zBNxgv
 pyjJyMHQC4MEjIRR5mn40sqrpuUrbTh+eglpl7l5Mogrenr8wKPyT6WICryAYkGRSu/6
 ZtWKfgD57FPrKzkFcMa1RcnwUDEalzWPHGCGkYfPzcEPsbLUU2jsDmuFxV7y6vS8a9IK
 AZHymhxwqMAQLzXMvdcZMK/Xw+gGAnIXKcg+LhXFMBC5GliGbMQgQTZ3cvKFgU/Kk+Wg
 iL/+iT06CTA1HtG0ANDKPEcpd81ePWvXYjkjFuqAbeJk8CmNAEi96IcdFNbFNSWCNjOn
 tQMw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780328512; x=1780933312;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rF0f8Zg34x2ZAH4M1Y5Zi4pMfTkhmAZzlaim2N+AVPE=;
 b=WXlspFicM7xb6gF5IBlRaMuKR3+FDZJHNzd2peW6x11nCiShvXb1eezuuVPEE4wJz+
 FllzcEnpeDsdaSI8wMD+66H9RDQIAxAuzUe6ZGFRIRhHj6l0VP7AbKSuND1j4+0SIsqR
 k/x/fT0xo9q0ZloPJt84YaOl7/AUY16EWgNnHThuRMe5ZVmIBngVhXZIFfTZOaG+PfxJ
 pfljIAMlMhSoJ2AwT7vcZcyz+m8NKmScC3PFvAslSvQ86EZlwAIay0jiAAzOnvmP3QM4
 0O7eRTXFJrVhXSo2WsIOrWt7aIAXRfi0O0rzxouKI4YJjdmiW+8HpXq1WaBTHuTABzUB
 1R4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9iHxLUGFmtlTq4Cp3ubS1Z548A1DjrHtDrcu/UrLtJM6g8/d91prb3sGtcvUC6OYB8+l93/mOKc90=@buildroot.org
X-Gm-Message-State: AOJu0Yyah0iz3YNeBtNCTLwpl7fKuB/HnOl+7pb3gmwFJsIkLIfTPZt1
 92HxR6+XfP0AAHnJUQcndMLJ/MPtuoz8tocT13jlJLyiTOuISl2l9m0LDxl9GqvdcvsJWNb6wRy
 nWl4UUI4tNESqLBEBZJw5Nk0rrCh+zWLp3FAmyP4=
X-Gm-Gg: Acq92OHylCwZA5/W0lAho8txawWYzibb1Sf4f3oFewBSHDYo6tuU+rQm9di60HJQJ7S
 to1sAWrGDNetiKe9XE9tUANgGXxKYt//CbXaiDtdeKVJf2xLGSwYHI8ZXBxg2Geehgoax6YaYeY
 xq/rXAgAdytsnWd05tJexMSLfVnGZ5cE9MA6Us/pNynLE9ErgTqbjAYHc3JgXD5Qj/qiQSZHVKo
 JgMcm4lKmlfo9P9IQkxzskjT2hsDceq0iwFQO2Zq1zH3B54jA9u89AHLc7RlXz9gVCqpmzobstc
 LanQUzRaXr0+jQWT9gO8hMQZE9l1
X-Received: by 2002:a05:6402:2112:b0:68b:583:fb37 with SMTP id
 4fb4d7f45d1cf-68c8ae13bc3mr6068471a12.10.1780328511582; Mon, 01 Jun 2026
 08:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260311092713.17598-1-chakrabortyshubham66@gmail.com>
 <ahvQc8ZxTUgP4HvY@windsurf> <ahvu3dxZGAj2X-lO@fedora>
In-Reply-To: <ahvu3dxZGAj2X-lO@fedora>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 1 Jun 2026 21:11:40 +0530
X-Gm-Features: AVHnY4KYtSEkgemlNh8_xbh3rgTJ1dbnmQBg4BlX0_fUZVuS5djYYdFs_Vxd3AY
Message-ID: <CABvxksxyUPqs4oHuzePcKkF+XDzpC_WVr4ee-7u=cfarvoBfkg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780328512; x=1780933312; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rF0f8Zg34x2ZAH4M1Y5Zi4pMfTkhmAZzlaim2N+AVPE=;
 b=VSiYY4nr3jcQwLUM/klrKdUyCMjzU9L+suyT8UOoexTCwLZ5pCa4M6IyvMb55dX83f
 lHNa4AzV/5WQIczKUFdNBVnyAdK0AaEMbvpPDHsOnhmZLCC4o+AXxDJ6g0wdgMaCntS+
 7kxRpXck6aOmw6Y0vN+UmiPsE1pkvMT2VQB5YAcK64DYf8qhX7bbD9X1irjRyfF8Sbzm
 qfH3bICIQwPyOgLUZ0LTSg2JLJFOp47WQQWyfY5V+QgAT3xzEzmYrkxSSNNVagzLa/C1
 vFxH1IWODxGr2/xQg353pVzUzl4rPGOKzWYZX9BhuSTZ/zvX7JVoaFeUa5AB3GfLKURr
 lz/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VSiYY4nr
Subject: Re: [Buildroot] [PATCH v4] package/which: fix getopt prototype for
 GCC 15
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
Content-Type: multipart/mixed; boundary="===============4920427057434559056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4920427057434559056==
Content-Type: multipart/alternative; boundary="00000000000084374106533308d0"

--00000000000084374106533308d0
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Upon further investigation, I found out that patching the source c file is
not the only way to resolve this build error.

The issue can also be fixed by passing a compiler flag to set the C
standard version to gnu17:

WHICH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"

Could you please guide me on which approach would be preferred in Buildroot
context?

Should I proceed with the source code patch, or would it be better to
implement this configuration change in the .mk file instead?

Best regards,

Shubham

--00000000000084374106533308d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hi Thomas,</p><p class=3D=
"gmail-isSelectedEnd">Upon further investigation, I found out that patching=
 the source c file is not the only way to resolve this build error.</p><p c=
lass=3D"gmail-isSelectedEnd">The issue can also be fixed by passing a compi=
ler flag to set the C standard version to gnu17:</p><p class=3D"gmail-isSel=
ectedEnd">WHICH_CONF_ENV +=3D CFLAGS=3D&quot;$(TARGET_CFLAGS) -std=3Dgnu17&=
quot;</p><p class=3D"gmail-isSelectedEnd">Could you please guide me on whic=
h approach would be preferred in Buildroot context?=C2=A0</p><p class=3D"gm=
ail-isSelectedEnd">Should I proceed with the source code patch, or would it=
 be better to implement this configuration change in the .mk file instead?<=
/p><p class=3D"gmail-isSelectedEnd">Best regards,</p><p class=3D"gmail-isSe=
lectedEnd">Shubham</p><br><br></div>

--00000000000084374106533308d0--

--===============4920427057434559056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4920427057434559056==--
