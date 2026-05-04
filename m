Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD49CD3426
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 09:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7024084491;
	Mon,  4 May 2026 09:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSCUmbFLJvOQ; Mon,  4 May 2026 09:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E138446E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777887822;
	bh=xXLtF2JzHG1cZQVftE2l50dRoPRez+DPTeCMpZMNenU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faYfYdZ2uT4q57MOLFAV4kOdtET6or4Ga0T/6z9bqD45X2naemQvtgjaHxg+s7TjR
	 Vl01XEgbamkGdOfyiTkLnZFmnvQy4Vm4vDHfdW8sAbKyWHYc6/cvkaHl+4PWlUe56D
	 fWYDwdzWgPu0DI2hnjkVOhSwT+SGO1rKj3Lt3k0hO2DZEC9QREC+iciSsmAYzLIYb8
	 M6Lqz5+Igvm5MiCfGo7IPNaWY4DQIV/MJqQoO5QYgMNFgjLql9XUbW6FX3daSYMdCi
	 JipiQqvMAgv9Q6JDgmdjkUalUMnC2QdCWmGcKoSctysG76YlJ9rNlCcz+o24U1hXZL
	 fz3WQu+HZpCoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E138446E;
	Mon,  4 May 2026 09:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDB825D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2028446E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 09:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8qynmIckCOi for <buildroot@buildroot.org>;
 Mon,  4 May 2026 09:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4F218446D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F218446D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4F218446D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 09:43:38 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-bc2301be8ecso118444166b.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 02:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777887816; cv=none;
 d=google.com; s=arc-20240605;
 b=ltRsqA5rjMjSMeUh7FEh6AqbCKtldUAHRBe1wGQbk1TZd8EbcidPz8SFbdaQcxK1MH
 iAbGqDLBrkJJ3kBJH9Vev6ZcQJCevkIACMTS8byB3rEfvu/ZGocY1PLSVOETR3RIWcB0
 Pf9INwmUFV5CCMC745GMxGMwt/H+tfGjMJihwJp8cBA6M5h6G4YJ1KOlz4SQQ93EnFee
 OrEXzau8EyNdPcBSOuqxJQZQJNaxq77MG/SB8f6yAFtnBrKk305mF7BuJLwwXmLG7TpI
 4ZjbFg0SqFE04LG/mv97g++t3jXeJx4397AEgNa0PlL6cdzsRFaEmSNCAW3ebKOfwZUW
 TJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nUmg4tIxC7iEgCyKBvbpdIjrxd6gTdg5d7x5GJ1tIOo=;
 fh=MxYKY3/PK0hPFBKBQ41TkJmgH3foJW/bclTr9JgX30I=;
 b=QNCGqrDBcT0gNDepd2RhcepaoSwnflIow8IRcXMa9KiH4XokD+ckVlDwtMbxTeZXyY
 6essodTSbF0V1oq3S8PbZStwY0VHIna2ot6Q8T6GH2s4V8fPANgASsL4wU5wSCo9p6YJ
 yBZQT+FzNJqlKlKdpVPCAf/oDPJ0ZN0bBbm5YXe7YNg6UWg39N7GuNuU5bf9flPxhpzD
 WDftEfozPyqIR4WvI1soFQ70sGKYMIbV3yVTwi8flcJpG2VwiD6PW58HcrqZHtvwJ8qu
 9r+JF5WT794p/ojTYEartC+rmV+j2l7fRFzLjlzVLqjt0BBzeogBzt/LLHhizW4b+yOI
 5/7A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777887816; x=1778492616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUmg4tIxC7iEgCyKBvbpdIjrxd6gTdg5d7x5GJ1tIOo=;
 b=KUAoq+FTcpgLJstNuaACir022ROB+RzCxET6a3lyY6VxwbF1UHffpIMrNlqoyBueNm
 PCR/5GsAqSxfvN3jx5YtEx5ncICjDWJlvp1FEzB7wqsekDtkN2/MNiScOSnCmnTSHoE1
 +vJIsanD9NlYfhjgC4cAo3RETgl5F8LLk2jC6+nyA3YvfAGlOmkoCsRqOLg+JVC4OHVV
 HvO9N3wi4pVr7ctu4JFAyL0+rC0aMjfa2iB9MCNYhJ54O0K8n3jF7etPHNxkLV7GjkKx
 54QLouYV59uAn1a+uyoqDpMeq+MXQpJBLHvafZRiW9QJJwQKlkHlkBL0mPQfz7hyBwCs
 woSg==
X-Gm-Message-State: AOJu0YxhIJ5vLa1rGHZ1fhIHxrjO6X1MUR2zUtXfOYw5IFm6p+1gFmSA
 /vZEK1wpWY9CjU+kL8Bios5LPtqHUIUfA4ap58PNhlUwGsMFKTXxT/9YeOdJZlqHynaqlZdVmy7
 cmq/EE/Lo16ZxzsM4SRovlWzG2QdEaQoAqw==
X-Gm-Gg: AeBDievG5weq6tEwCXTQVw8u9OiwaYA/H23xdDnhAv6bgfLRz5VvtLo1dgGxW6FstDz
 4feZHeYwDH7ZH5GNPxRuojb9J1lFNylaZxW/PNHYU76BhIEARQ2SbOV0pNArwv1MhDCdGn4sx+V
 Jzm6y2v/+mW2asB4JRsST/74wzzyFtDzfWZ+Z7IabfI5193IdrCNthgwwVveqmRCIebAU4uztoD
 Krj62xBOYl92G9Uy7zlgX5QVamq+dNS6fECrU3aRXD4xxat+UiuhPBPzMjIQb7nVynPDClrbqkm
 tC3XUeJo9unkFSCj8UA5YFRP3dJjy7L33k6Knnq/etXSveaVNw==
X-Received: by 2002:a17:907:98a:b0:bae:d7ef:de56 with SMTP id
 a640c23a62f3a-bbffcc74bddmr425202566b.44.1777887816120; Mon, 04 May 2026
 02:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
 <20260430054033.8599-1-chakrabortyshubham66@gmail.com>
 <9906c459-eb22-47f9-a690-6c0ab4b32b24@bubu1.eu>
In-Reply-To: <9906c459-eb22-47f9-a690-6c0ab4b32b24@bubu1.eu>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 4 May 2026 15:13:25 +0530
X-Gm-Features: AVHnY4Isf59BOgrGc-NEF8vPi4nIufdktne0EdzHbb90DAu-8ne33Lq2b1zpDHY
Message-ID: <CABvxksxcp5wv-cFHY3cgRXKG_8sfV7x9PYVAjdCaz6fUoDEVXw@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Buildroot List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777887816; x=1778492616; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nUmg4tIxC7iEgCyKBvbpdIjrxd6gTdg5d7x5GJ1tIOo=;
 b=GkmW6mDNJPogczHiw0h5Vt1e/4u+4Lyhx1/GuvQX6OqK53Mri21MMclo33+Tf9Sq0g
 qEt9Zu/97zRg8KB6UYgbN2wmUYyzFoi7/+sXryd7I5kHgtoBlrG/p7iVnTWjPh4Rb2In
 tGsyK1YjXmHr2dpKitzPZEx6Ue03kTYNtOXKlrPh6oSo+PncD2dP2Zexd+E+EGNkKAeI
 3/O5uqeR7Pm2DkWReWq6dGEx1qrimqGp4tNc2H6xpTlUs6tynjlXR/Gp1I4ar3wMpfhW
 XTuUElQnOnA6nbe/JckGh7cTbqN9FNjvTW40uQnWLKeLo+0+EIm6DQJuoo8PlzcwLupU
 Va3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GkmW6mDN
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security bump to version
 1.28.3
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
Content-Type: multipart/mixed; boundary="===============3488011178937080706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3488011178937080706==
Content-Type: multipart/alternative; boundary="000000000000bb00ed0650fac38b"

--000000000000bb00ed0650fac38b
Content-Type: text/plain; charset="UTF-8"

Hi Marcus,

Thanks for applying the patch and for correcting the sign-off placement.
I'll make sure to follow that convention going forward.

Best regards,
Shubham

On Mon, 4 May, 2026, 2:01 pm Marcus Hoffmann, <buildroot@bubu1.eu> wrote:

> Hi Shubham,
>
> On 4/30/26 07:40, Shubham Chakraborty wrote:
> > Fixes the following security issues:
> > - CVE-2026-27654: Buffer overflow in ngx_http_dav_module when using the
> >    alias directive with WebDAV COPY or MOVE requests.
> > - CVE-2026-27784 & CVE-2026-32647: Buffer overflows in
> ngx_http_mp4_module
> >    when processing specially crafted MP4 files.
> > - CVE-2026-27651: NULL pointer dereference in the mail proxy module
> >    during CRAM-MD5 or APOP authentication retries.
> > - CVE-2026-28753: DNS PTR record manipulation in auth_http or SMTP proxy.
> > - CVE-2026-28755: OCSP certificate check bypass in the stream module.
> >
> > For a full list of changes, see:
> > https://nginx.org/en/CHANGES-1.28
> >
> > ---
> > v1 -> v2:
> >    - Bump to 1.28.3 (stable) instead of 1.29.7 (mainline) as requested
> >      by Marcus Hoffmann.
> >    - Highlight security fixes in the commit message.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> Your sign-off needs to be above the first --- line which separates the
> commit message from additional patch commentary.
>
> I moved it up while applying.
>
> Marcus
>
>

--000000000000bb00ed0650fac38b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hi Marcus,<br><br>Thanks=
 for applying the patch and for correcting the sign-off placement. I&#39;ll=
 make sure to follow that convention going forward.<br><br>Best regards,<br=
>Shubham</span></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 4 May, 2026, 2:01 pm Marcus Ho=
ffmann, &lt;<a href=3D"mailto:buildroot@bubu1.eu">buildroot@bubu1.eu</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Shubham,<br>
<br>
On 4/30/26 07:40, Shubham Chakraborty wrote:<br>
&gt; Fixes the following security issues:<br>
&gt; - CVE-2026-27654: Buffer overflow in ngx_http_dav_module when using th=
e<br>
&gt;=C2=A0 =C2=A0 alias directive with WebDAV COPY or MOVE requests.<br>
&gt; - CVE-2026-27784 &amp; CVE-2026-32647: Buffer overflows in ngx_http_mp=
4_module<br>
&gt;=C2=A0 =C2=A0 when processing specially crafted MP4 files.<br>
&gt; - CVE-2026-27651: NULL pointer dereference in the mail proxy module<br=
>
&gt;=C2=A0 =C2=A0 during CRAM-MD5 or APOP authentication retries.<br>
&gt; - CVE-2026-28753: DNS PTR record manipulation in auth_http or SMTP pro=
xy.<br>
&gt; - CVE-2026-28755: OCSP certificate check bypass in the stream module.<=
br>
&gt; <br>
&gt; For a full list of changes, see:<br>
&gt; <a href=3D"https://nginx.org/en/CHANGES-1.28" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://nginx.org/en/CHANGES-1.28</a><br>
&gt; <br>
&gt; ---<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0 - Bump to 1.28.3 (stable) instead of 1.29.7 (mainline) as=
 requested<br>
&gt;=C2=A0 =C2=A0 =C2=A0 by Marcus Hoffmann.<br>
&gt;=C2=A0 =C2=A0 - Highlight security fixes in the commit message.<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
&gt; ---<br>
Your sign-off needs to be above the first --- line which separates the <br>
commit message from additional patch commentary.<br>
<br>
I moved it up while applying.<br>
<br>
Marcus<br>
<br>
</blockquote></div>

--000000000000bb00ed0650fac38b--

--===============3488011178937080706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3488011178937080706==--
