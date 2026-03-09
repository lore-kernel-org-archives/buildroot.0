Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FEEF4180E
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D46B40CB8;
	Mon,  9 Mar 2026 16:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kAbIJ_N7dwo; Mon,  9 Mar 2026 16:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A2204079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773074609;
	bh=JjHuxhUZMy3PJIGwydtTszsTbOp034nMPy+SZI8ekaA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHNIJ7XVcXhdaRl6Xgciob/m+nnKZDCmf00OwAzuuBsFl7n1GiNFiVwujRrrjQoOZ
	 8oteLENTmuq5zwUjKmCfTpZaDqNuCxa+HzsDIEsS15h3rOyPqP0weNJ8SSmk9Nv//g
	 2Aq+pyzgXatHoyUm1Ovkw2JwstiAouG7IQQAnBxUPlNiNk2t+CA9l6mgqUxUw/ju9E
	 pc6p8xeadF6fXwFDgEPvVjzw7v/dtHPB67p9/hk+belVmdE0CDJg8oZuCtrG5tpLbc
	 XGX7O3tm7o8r9iAXkzdFn7k/7uMfbgXrJdeOrR9p3V5odk9qS7GJx8ga6rinHG8D4W
	 FJB+9QOLJalFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2204079A;
	Mon,  9 Mar 2026 16:43:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82100158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD5F60842
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 16:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh9Gvl2ZHoNz for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 16:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BC1760783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC1760783
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BC1760783
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 16:43:27 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so1967379866b.0
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 09:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074605; cv=none;
 d=google.com; s=arc-20240605;
 b=FHAXW6YlmWXA8oxLOnUGELWm1JlTSbBwNmmogi6/16/cJRkEHAc1hNg8YdfM6Zli/W
 XqB3U9vycZJvMmoQ3i+4Xh+9igfO23L62Rb2Zw2CLA9JwySaExG9TF5xgPhyNEK2QL8O
 m+U4cos1pMf2ZlkLj8fUhbkAac7U94o0zIp7wAuHrFpsXJiEaaU/R6wZ3W9J9Q2woudv
 lfHNCQ/bD5fOo/vHIYs0X2Sg960OLPJAjxbxVC8mqO5NRcDBkIj3mYL1Q/Ezi6xgS7+o
 GZEHqou8HdLBvtKphX71ywdWMI3zIsY8v7vfdX7CN1yXpt+jDYxgkqUSaPCUGzk+R8Ds
 hGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZFiAvoZdO4qrpIiiMHUXaHVgNn1O4DvF9pDLAWie1V4=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=JKGtqiy/sFvAui0HPz5SKOEMRnNZhditRqeK7WbLC05Rp8wPp3zaAO/fdNGMOpa3jI
 hRZZVmFZ7OvbjD/JdE+mFj4zuVPlymdk0sj4cfbAXepwXMun2r9c6dnqHAyK9SmFAKFc
 PlzVwo7LiaAJHgM69UOFKIATaAxDZYJnkFDCA/3kaVr1b6ZtQMrtDuiq/09b/0eKKvTy
 VN8Yuy/WmhbFR785GAWcxwqYfS2t+fcivoDaR+elnMOYD6kBED4UNigwmnmGj3TTAHaB
 rWFdjZxtJeze0HPVTPhkKsGDexHQeCjuzlUEAzlRtS9bTfCn0uehzs1DCguUR+7yU7V/
 Khpw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773074605; x=1773679405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZFiAvoZdO4qrpIiiMHUXaHVgNn1O4DvF9pDLAWie1V4=;
 b=Dfj4Br0KK0+sz73BuI4eeniUc5bgB8hpJXNoSj36+BwAT9CXiL3GUasBdyAYnMiTdP
 RJCfCaBmJ4lDaj+3EpSSzIQKnSI04mIOXDsorTJNdo+dk709MHQUL3r/aFNXIoDeqCMh
 CpMlx3RzSMJaqVtM2uIVMySN4JruhQmxNq9Oy55DgPNiIFAiPDmjW9GW0l1cirFeYVZ3
 llawz48jQ8KfdByqk1WUN7ymvFrYbVgaJGeObQCYlFKF3XLexN+ADj7sadb2zrul0ymn
 0Ham2bCq/wzhf11Syu5GY9O5DVyNHN6F5YR6wznI7htHR9+tMk5VGpCeULTy9C3sOzpg
 6FQg==
X-Gm-Message-State: AOJu0YxrUvca5mvEQX4N9FM4fmHg1A9c+odufB4oEOk9aS7eXd15altQ
 sInFD4azUpwwRXlytQ6TO1Oj0q6Nu0+4DLyALRyYSvkdlHULg0TX0aiNisg5VeT6VNormHe5TQq
 kerY5d3yNCWexTYXCcIpN/c8B3jib62w=
X-Gm-Gg: ATEYQzzS87EwhrY1hNOopFTcVifZtOFqO3Tpjf/A10Nd/kDZCB13/loZtWoJygb1TL8
 cLK6yUjCiJ9T13Komr/q77GFgM2ZviwpYgcgLGOhtR7cmT0XmYOA2wrAjQbt7WzG7wr8RtX8yS7
 W/S+yNRGwkHo5ZyGk/djqpAqp+Ho2Gqy3Tc+EXiSMhkO4VHsotlARi+4dZXDUbBCLn57cR1Mlut
 lmqqhK7jOua8JT2pDhNIBcqFn0nr+RhOHyTtnWYQ7M5tO9HyZEoZH/1dgK1GRmIJ0MkQVDosIXi
 xhkkAdP051PioqR8Euev8wd9RjSBpbR0ZCnugCqMfg==
X-Received: by 2002:a17:907:3d11:b0:b88:6e10:62c8 with SMTP id
 a640c23a62f3a-b942da78e04mr600272266b.2.1773074604906; Mon, 09 Mar 2026
 09:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260309070741.34152-1-chakrabortyshubham66@gmail.com>
 <aa6POBcIqxvNmWDw@windsurf>
In-Reply-To: <aa6POBcIqxvNmWDw@windsurf>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 9 Mar 2026 22:13:11 +0530
X-Gm-Features: AaiRm53K0hryUP3fRZfkHSYX9ovtntDNKwSnlLNNzZSijBQkahQa7SAdGNjhb_4
Message-ID: <CABvxksz9piUt9u4LAjWvbfXrKgcRjpCo-+j_m9pZZAt0SefAdw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773074605; x=1773679405; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFiAvoZdO4qrpIiiMHUXaHVgNn1O4DvF9pDLAWie1V4=;
 b=OlGCFQyN6K4uvRyJGJC2cz5PzFvXamXNeaYWaw3jcz9U69WFNgPCVpvxLn23l+l9DV
 fFXWQ3S6dYtR5VFCTLOIfZsZyWPKmZ51l7NTX43aUMyvctnyPpUkB1OUDRnZVypL/KJx
 xszm9P30nCrujKiQMZrzAgxX0dndAKGRSKBMm5aCvKWWrz1aknlcbz7oxwLB59P07JW2
 5NP4l4FZG4BzxhL+YsepZK1bX1E8G8izxQHktg/0Ohq2S0To1jx9Bw/pVadwSlWZn+Li
 jKBowq1B1eehQ/AFtpAlJMuXABDrnoeriUcK043CtxF7Kq3oxHQyH+DJoAoSpUrmxfl7
 2qJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OlGCFQyN
Subject: Re: [Buildroot] [PATCH v2 1/2] package/which: fix getopt implicit
 prototype conflicting with system headers
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
Content-Type: multipart/mixed; boundary="===============5996176821501201817=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5996176821501201817==
Content-Type: multipart/alternative; boundary="000000000000fc5c5b064c9a197e"

--000000000000fc5c5b064c9a197e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for the feedback. I have sent v3 of the patch, which addresses
both issues:

- Identified GCC 15 as the version that introduced this issue.
- Fixed the patch file format to include a proper description and
Signed-off-by line.

Best regards,

Shubham

On Mon, Mar 9, 2026 at 2:53=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, Mar 09, 2026 at 12:37:40PM +0530, Shubham Chakraborty wrote:
> > Older C standards allowed empty parentheses in function declarations,
> > but modern C (C23) treats extern int getopt() as equivalent to
> > extern int getopt(void), which conflicts with the typed prototype
> > provided by system headers (e.g. musl's unistd.h).
> >
> > Fix by providing the full prototype in the non-GNU fallback branch,
> > matching the standard getopt() signature.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>
> Which gcc version broke this?
>
> > diff --git a/package/which/0001-fix-getopt-prototype.patch
> b/package/which/0001-fix-getopt-prototype.patch
> > new file mode 100644
> > index 0000000000..af9597242f
> > --- /dev/null
> > +++ b/package/which/0001-fix-getopt-prototype.patch
>
> You didn't take into account my comments on the patch formatting.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000fc5c5b064c9a197e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>Thank you for the=
 feedback. I have sent v3 of the patch, which addresses both issues:</div><=
div><br></div><div>  - Identified GCC 15 as the version that introduced thi=
s issue.</div><div>  - Fixed the patch file format to include a proper desc=
ription and Signed-off-by line.</div><div><br></div><div>Best regards,</div=
><div><br></div><div>Shubham</div></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2026=
 at 2:53=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni=
@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Mon, Mar 09, 2026 at 12:37:40PM +0530, Shubham Chakraborty wrote:<br>
&gt; Older C standards allowed empty parentheses in function declarations,<=
br>
&gt; but modern C (C23) treats extern int getopt() as equivalent to<br>
&gt; extern int getopt(void), which conflicts with the typed prototype<br>
&gt; provided by system headers (e.g. musl&#39;s unistd.h).<br>
&gt; <br>
&gt; Fix by providing the full prototype in the non-GNU fallback branch,<br=
>
&gt; matching the standard getopt() signature.<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank">chakrabortyshubham66@gmail.com</a>&gt;=
<br>
<br>
Which gcc version broke this?<br>
<br>
&gt; diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/w=
hich/0001-fix-getopt-prototype.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..af9597242f<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/which/0001-fix-getopt-prototype.patch<br>
<br>
You didn&#39;t take into account my comments on the patch formatting.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000fc5c5b064c9a197e--

--===============5996176821501201817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5996176821501201817==--
