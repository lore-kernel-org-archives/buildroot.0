Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AAD109E556
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 07:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7E3606D7;
	Thu, 26 Mar 2026 07:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9_rGiSKcz1V; Thu, 26 Mar 2026 07:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D48F60797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774508514;
	bh=rKW/1znfVKUkbcSzMhQRtjlkfCcjXIGYUIj3ipG8etk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVMoPIISliIwFb53AHjbKi1gJQ0p+dVmS3Uu7euqSR3lmqwHG8pLEw93CjGZ09ydG
	 hu45kpVpyrjLWNs2GHuT+fGlGUfH89HjMyOLRn2JzrVAb9xdNGU8LjjAtGwzl17HL2
	 KAhB53yMT7/1zRDxWu/BeFu504qgrJk5jHhfKoSGPHO3hLd7kb0XeeShb2HJ2bihcx
	 7kAApVmvkRADWIqFoYxLPeDOoLXeDKrEpseU26urK52q6kWS0TjlfMUyWAtGpFHamh
	 5Wc+vs2Yb6+AG3dp2rZ2ivFgm1aAv/+8KkO9RWQF5v1x9wJqv+9ySw+8TbyJJ04O+H
	 TXUoLP5rI9r8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D48F60797;
	Thu, 26 Mar 2026 07:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D28353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 07:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3766B40066
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 07:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbRhH3ItXUyH for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 07:01:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14950405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14950405D8
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14950405D8
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 07:01:47 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6686697f578so1004119a12.0
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 00:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774508506; cv=none;
 d=google.com; s=arc-20240605;
 b=HGyj0geSMoYSMiK2bbR0MxrK/hEDX3XvQ+NbmTfV+0cOWkD0ZHB3+Rg+VrZJ0YPz2c
 xSA08pRMgMp83S9vT26SC8vkoQ4hr9dO7c/yvxacSRTmMcg+TjMFXc/7QrC6a/S+ybE7
 HkSd8lWWyKLARecbIyP7S4ikz044A30E0tIJgEVDiWJDL0E9m66Q4hrEsqhkvxcwxRUA
 NL8pgoGhz3wLrF9s31CGpQMV7fz3Jh5Oq2rsUnf0D0+WXP6k6fKdER15M9TnYbzHB79L
 3KNClbXGPJUf/5FbVyGjnLPmHa1AO4fhA1NjWCSmwjmQ0+4WPvOZKm98dWI5bZPvt52k
 qszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=61p3ihTe52sCiss0NDyNFKIuH/S5/QMzinXkz6g1l0Q=;
 fh=FFcEOvEXv41PO7kcmVght3qCfzjhkXg6DJmLx9c0Iy4=;
 b=ECEf3JjlloJBvcXBf2jmt1Z6FAxcJjPJdUpabwepmyWwPRDyrMlIeA8NOVkBKFW+Ir
 r3hwLtlSmlmAbSUVWvSAqownC9965yLzH6lfIHXwz0M/MWJIeMXeUY6IWGfuHqwtWZra
 kD0c2Rme9xzAr7DtCAwg0hKur1Vf9zsLlHUBSV2wYCLQg0U9qNAA+jC7/BxXOwtA85nI
 FsboReSu5Yd3KH14uJM6uViBylpxAWQ3AFLc5okZb7Vck96fjHrvMJQUvQQefXulwpiz
 c/krUH4aD3VY5qJ/E1yF8eIh5GzTRu05Pw4NOY7bhROzoCy4Lp7ddEDgC0AJ5MQAxIVg
 MSsA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774508506; x=1775113306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61p3ihTe52sCiss0NDyNFKIuH/S5/QMzinXkz6g1l0Q=;
 b=McS899xpSoMkiSx2Yz5angZfDzx/3ojyrn8mfkGNlG3OuK5sW87sRh4iF04IRSbZLu
 RveJ/Lec5wxOChWBZmmk1ud26wMV8LuZMVucJNm3TcrUawgkckMgKpWHtsK+s3GwQCJW
 98q6hh0dp1ICtgGYq8qJcfgg14wDUHbZLj9mLe//c+fmgZeG1LADf8MyQmq3ukwSSbie
 A/JJZ7pOW/Grp9MwWf4gdVTfiaUXzY2u+bVtwN57PCADDPV1R7xe+0gl370PiGDe75IA
 6CPdUzCC19tyD0ZXg1HDufstC9KS8/dtN/cQmaEQCBLrRit3Zh7GRVLKhdNkSkWEjP66
 N8Ww==
X-Gm-Message-State: AOJu0YxGR2ih7Em6tRvapxISwa3fptpeYx6KdK1S5Mg9O2QeISZtDqcM
 XViRQv0NpCScjQBdSQrta4MEYn7tekMJa8r1hsKGJT4wwAV6vFO7Kss8P/Mt9gP6Q7ffP5rmVjP
 hbzXI8TDlvlas/l0UnDJYc4p4oqoRAFI=
X-Gm-Gg: ATEYQzwG1fn+Lz9enY3VP0cbxp1B9gvrhl2/+M7zfk8g6CIznXJsB13w5abgf8ymZFD
 hAu2vyvSn/tf34HbJ2cwv27OyDoiC5cOkzLreBhFnkvRypFlE75gxv4jKTz8l4hisxxPMgPjCjH
 mlqhwpKbdm5ulp50l/A5VkjOcostu/OrRr+0Qt/RCnCm60tTHUbvE5PMRNhhK8O0fv/3SZEmMR4
 tHeYtkO3PWvytcdFsPz0VKOFh6qSDJGth4E0ux2mb65+Z6DxtInSoyQwZJdjdnHOlqh+8BnJaMl
 xEgv
X-Received: by 2002:a17:906:8d89:b0:b9b:207c:f7b7 with SMTP id
 a640c23a62f3a-b9b207dbdadmr135959066b.3.1774508505374; Thu, 26 Mar 2026
 00:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <dbd49ae98de7302e5a0cf5394e8c9b05@umbiko.net>
 <20260304065424.10023-1-chakrabortyshubham66@gmail.com>
 <CABvxkswzcvL4HRpjQzy9nHO8_TJBzSfO2L-hwqrRadMSfSmwiQ@mail.gmail.com>
In-Reply-To: <CABvxkswzcvL4HRpjQzy9nHO8_TJBzSfO2L-hwqrRadMSfSmwiQ@mail.gmail.com>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Mar 2026 12:31:33 +0530
X-Gm-Features: AQROBzCg3VOabSpTz46WwOmrrFufrri48pn2H97UtDFF8mDZ25HhNkl12nTWlJc
Message-ID: <CABvxksxxG=fLhCYZBO3d0q5nuQNntY86_FPsLGpsnoguCT0-Yg@mail.gmail.com>
To: br025@umbiko.net
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, 
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774508506; x=1775113306; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=61p3ihTe52sCiss0NDyNFKIuH/S5/QMzinXkz6g1l0Q=;
 b=b+O2ibpkaARTl6XKZs6/tOeW9zFuegixl8tXzzhTIAkqeJZH4Cf9JSU/KdYxHhI8OU
 4nNMWo5i1vzHvhflsC7797MuaITFOuENr17d0H3TAsu0IsrWJ6rzJohiQdbjBhGV2p+w
 i/8+5SpgGYvrqiiSONojHc4cA1jWUKd0Np6Z57yHS5OEhUwarDMmlwiFGu9sAVgJirrW
 SY8gCh0VyqcA7YjDc+opbx+nlqLYF+ZIFCxjSNJGhEgdzKVA2cyXoaROmCfPJwtruzBZ
 rkWgY9+R5llT8CBsyo8EeQwzAOnDlYA9fU1fFz1JNylwS59JZs6axroSrMcy0Ixt/flu
 uwOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=b+O2ibpk
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
Content-Type: multipart/mixed; boundary="===============1644131844526494227=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1644131844526494227==
Content-Type: multipart/alternative; boundary="0000000000001d25da064de7f55e"

--0000000000001d25da064de7f55e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Romain doesn=E2=80=99t seem to be active, so I=E2=80=99d like your guidance=
 on how to
proceed.

For v3, would you prefer that I:

   1. regenerate a single combined patch (replacing 0003 and 0004) using
   git format-patch, or
   2. keep 0003 and update it by editing the existing patch to include my
   changes?

Also, in this case, should I keep only my Signed-off-by, or retain Romain=
=E2=80=99s
attribution in some form?

Thanks for your guidance.

Best regards,
Shubham

On Sun, Mar 8, 2026 at 5:14=E2=80=AFPM Shubham Chakraborty <
chakrabortyshubham66@gmail.com> wrote:

> Resending as previous email bounced from romain.naour@openwide.fr.
> Using gmail address from DEVELOPERS file instead.
>
> On Wed, Mar 4, 2026 at 12:24=E2=80=AFPM Shubham Chakraborty <
> chakrabortyshubham66@gmail.com> wrote:
>
>> Hi Andreas,
>>
>> Thanks for the review.
>>
>> I will send a v3 that replaces both 0003 and 0004 with a single
>> patch adding -lstdc++ to both Libs and Libs.private, with no
>> musl-specific language.
>>
>> Romain, would you be okay with me adding your Co-developed-by
>> and Signed-off-by tags to the combined patch?
>>
>> Best regards,
>> Shubham Chakraborty
>>
>

--0000000000001d25da064de7f55e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hi Andreas,</p><p class=
=3D"gmail-isSelectedEnd">Romain doesn=E2=80=99t seem to be active, so I=E2=
=80=99d like your guidance on how to proceed.</p><p class=3D"gmail-isSelect=
edEnd">For v3, would you prefer that I:</p><ol start=3D"1"><li>regenerate a=
 single combined patch (replacing 0003 and 0004) using git format-patch, or=
</li><li>keep 0003 and update it by editing the existing patch to include m=
y changes?</li></ol><p class=3D"gmail-isSelectedEnd">Also, in this case, sh=
ould I keep only my Signed-off-by, or retain Romain=E2=80=99s attribution i=
n some form?</p><p class=3D"gmail-isSelectedEnd">Thanks for your guidance.<=
/p><p>Best regards,<br>Shubham</p></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 8, 2026=
 at 5:14=E2=80=AFPM Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com">chakrabortyshubham66@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Resending=
 as previous email bounced from <a href=3D"mailto:romain.naour@openwide.fr"=
 target=3D"_blank">romain.naour@openwide.fr</a>.<br>Using gmail address fro=
m DEVELOPERS file instead.</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Mar 4, 2026 at 12:24=E2=80=AFPM Shubham C=
hakraborty &lt;<a href=3D"mailto:chakrabortyshubham66@gmail.com" target=3D"=
_blank">chakrabortyshubham66@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi Andreas,<br>
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
</blockquote></div>

--0000000000001d25da064de7f55e--

--===============1644131844526494227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1644131844526494227==--
