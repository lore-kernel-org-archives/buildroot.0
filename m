Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1C3C7114C
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 22:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27B7813A2;
	Wed, 28 Aug 2024 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntw4qbicethN; Wed, 28 Aug 2024 22:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E8C8145B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E8C8145B;
	Wed, 28 Aug 2024 22:02:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 780BF1BF28F
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 22:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725A1400C7
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 22:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FQMI6-8i-5y for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 22:02:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=daryl.spitzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E3A640025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E3A640025
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E3A640025
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 22:02:34 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2d3d7a1e45fso5193289a91.3
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 15:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724882553; x=1725487353;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJvLQVUDY4rdt0VM9D33kLUnjLZBLN/FQZigOsmKGPY=;
 b=aTXbQYj0LUcjgZ2OgFtY+2b8tqB7RXNYHtSmjYSsy3oILi3xuQGg3jFnXNOQrRyzpm
 gYlEOCfQ/BmCzg/x7b0Bo8s4XE6+Un/3JDUiRGrgs+H8mabFEPtvEHUzCU8rPToavNLc
 ZBiiUKgJM6SLURMT0OjLsqUS8i93Qrhc3Wg0ifG4TjbV0RLhFWtvXNwXFBQkal8Bk9tg
 FOFZKO50xaBnVgdEwou5HE+G9WBhEEs120OUaNeMf3RGqWzQErhhwBgDzJMOAwggM0di
 LpF4GMJPSVYGcRmk/b4VBZvKYEtpLzASf+4XNf62SrtnAKMJm8GZqKiZvbkdUpoGpSi5
 wH0A==
X-Gm-Message-State: AOJu0YyU8U5JIW+FEdJrR2i1yeXD+FFJ4xKiJ9Xzogc7W82mDPDM3iZ7
 7Bwgjqw9mrCZu54sVPQCDhg1CaaoIhNt44reI5u8XgaGdOuwYRvxkUIhnS5K9nPU3RZ4AnxyXrq
 CoeCZyV1KB43JkAQIWTfUii+GFF8=
X-Google-Smtp-Source: AGHT+IGTE+edV1WMHZWD10RDbeJyXeQ5tZWICJb7iitq2602Mm2qU4m7Y6rebrzq+sai7gljp3hl8tunx3yGl5ZeNQk=
X-Received: by 2002:a17:90a:ea91:b0:2c9:cf1d:1bcc with SMTP id
 98e67ed59e1d1-2d8564ba86dmr670758a91.36.1724882553038; Wed, 28 Aug 2024
 15:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAG94F8pYTZTid25CSrTR4mSo_WtAE8qOecLATN82AnNW_jcqQA@mail.gmail.com>
 <20240828174131.7a9f4721@windsurf>
In-Reply-To: <20240828174131.7a9f4721@windsurf>
From: Daryl Spitzer <daryl.spitzer@gmail.com>
Date: Wed, 28 Aug 2024 15:01:56 -0700
Message-ID: <CAG94F8pk4sJPg8cN95tZGGB8=pSmnckYaj+1VFhRmH9O68eR7Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724882553; x=1725487353; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dJvLQVUDY4rdt0VM9D33kLUnjLZBLN/FQZigOsmKGPY=;
 b=Qknm+XqeNaAHUJN7BdOaLZOrp4Y5bzr/aYETzeUngXa9rza4B9u7GrnORoDMBaK+Vs
 hUEVTw7aaMZuk1mkXYdOjyhUSsl4+ZZrw+/NvL9CaCqgP1wjYBODXhf0RlyzaiFsPYsB
 USSywIbL+XIYZ0uWJqbt2dYH2/uwD1DqgIpwQJuekNC0LYSvGTwMBEspVV1n36YQjqrt
 pYHvJBv6YjkYTMPqg/AbOOom8XPkKQ27ZLSi2Am7EF4qye8l8Z49CO6vi1hmnN6D2h7F
 yYLkiakq8OwDKsfCGDq2eGkqVTijSIZqwRe+sRgHh+75KFBOJEmsRr54DRTiNVaABNxG
 b59A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qknm+Xqe
Subject: Re: [Buildroot] How do I include glibc versions needed by node in
 my buildroot config?
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0873804983081625785=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0873804983081625785==
Content-Type: multipart/alternative; boundary="000000000000da72700620c583c0"

--000000000000da72700620c583c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for responding here and on StackOverflow Thomas.

A commenter on my StackOverflow question guessed that I did a build without
nodejs, then changed the toolchain options (to be able to enable nodejs),
and didn't do a make clean. After a make clean I was able to successfully
run node --version on the target.

Sorry to waste your time.

--
Daryl



On Wed, Aug 28, 2024 at 8:41=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Daryl,
>
> On Tue, 27 Aug 2024 16:31:03 -0700
> Daryl Spitzer <daryl.spitzer@gmail.com> wrote:
>
> > I'm building a root filesystem using buildroot (running on Ubuntu 22.04=
.4
> > LTS) for an ARM Cortex-A7 target. I'm including Node.js by selecting "[=
*]
> > nodejs" in Target packages ---> Interpreter languages and scripting ---=
>.
>
> Could you please specify which Buildroot version you are using, and
> provide a Buildroot .config file that exhibits the issue?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000da72700620c583c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for responding here and on=C2=A0StackOverflow Th=
omas.<div><br></div><div>A commenter on my=C2=A0StackOverflow question gues=
sed=C2=A0that I did a build without nodejs, then changed the toolchain opti=
ons (to be able to enable nodejs), and didn&#39;t do a make clean. After a =
make clean I was able to=C2=A0successfully run node --version on the target=
.</div><div><br></div><div>Sorry to waste your time.</div><div><br></div><d=
iv>--<br>Daryl<br></div><div><br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 28, 2024=
 at 8:41=E2=80=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni=
@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hello Daryl,<br>
<br>
On Tue, 27 Aug 2024 16:31:03 -0700<br>
Daryl Spitzer &lt;<a href=3D"mailto:daryl.spitzer@gmail.com" target=3D"_bla=
nk">daryl.spitzer@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I&#39;m building a root filesystem using buildroot (running on Ubuntu =
22.04.4<br>
&gt; LTS) for an ARM Cortex-A7 target. I&#39;m including Node.js by selecti=
ng &quot;[*]<br>
&gt; nodejs&quot; in Target packages ---&gt; Interpreter languages and scri=
pting ---&gt;.<br>
<br>
Could you please specify which Buildroot version you are using, and<br>
provide a Buildroot .config file that exhibits the issue?<br>
<br>
Thanks,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000da72700620c583c0--

--===============0873804983081625785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0873804983081625785==--
