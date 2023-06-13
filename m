Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CFEB64D8
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE948230B;
	Tue, 13 Jun 2023 21:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBE948230B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5jo_ODv300V2; Tue, 13 Jun 2023 21:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EC782327;
	Tue, 13 Jun 2023 21:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83EC782327
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD73B1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93C2E4056C
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C2E4056C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZERxrrUYq4jG for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:21:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04AEC400FD
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04AEC400FD
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:21:23 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-55a35e2a430so37032eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 14:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691283; x=1689283283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHgQCK0Td6JDt0SxD8c+DgnX8pK+TLIZ0toxfieYuyg=;
 b=ZCztJ/q45wH0llNkZ09/a9ZRy3HOu3UWPBz23A+dbftucHD5/ukZPKuYF5hy88QEZY
 OHwAJL0IfdsVbiB9hzB5EtZ28qFrGa52vMGHtq72UNyoFJ1R6gO0PzeNDr2+karWyHE1
 +/Z8zL5qSMIRHliralk8tbUdpBel5P9Qkqjcz9BM3hVNNnj1ogTHSqH5bKzZkbjvxvk4
 bh7m+KI+jeL9CeGrmWE41Yo6ED+4EkV0CjM+6UctrAD1RNf/ZveypDEWkzOQBbx7LDBY
 JSEpjtjwms6rcEYv6zvcwZgDn3OCvk9MOjGHe5UKatgddQ8+iI2Qa53Vt2KVYFl3a6eT
 CxMw==
X-Gm-Message-State: AC+VfDzEY/zCMAvDW0MN+dKe+BY5LbGIAtOjkhQuYAsYUnUi9fESNzc+
 cHERH+l9EriQxYu35PpFsv/u+C814MfrW2JxOqo=
X-Google-Smtp-Source: ACHHUZ5Tpx/AY2WntZoEMoWRKebAugrFBlFGk1MFoHjopfevxEarcZl/1RjH7y/OSwtPcd/Y7VWPOQblSTZKNpVHDE0=
X-Received: by 2002:a05:6820:13c:b0:558:b550:e81 with SMTP id
 i28-20020a056820013c00b00558b5500e81mr8227114ood.2.1686691282811; Tue, 13 Jun
 2023 14:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSuBBWWpoD3HKWQ6H0RV_EL4WAsBHxvHGTiV3P_-JrLy3g@mail.gmail.com>
 <20230520212437.2125e68b@windsurf>
 <CADYjeSs9N0nKpwFYp9YioQfBUGnbRim5PQNVqSZLFjnXZPMDLQ@mail.gmail.com>
 <20230522161642.510747dc@windsurf>
In-Reply-To: <20230522161642.510747dc@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 13 Jun 2023 23:21:10 +0200
Message-ID: <CADYjeSu-w5p_aTK=YX-ByN+Dm-WDC2Zykt78F=rwPWtsF7m_-w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686691283; x=1689283283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RHgQCK0Td6JDt0SxD8c+DgnX8pK+TLIZ0toxfieYuyg=;
 b=FiI0mgF27oqf9/2zoLdiTPp+QrZQqEOaFfVTP5M+xnsptHtlxD1a5pgQRZhJI+0ZoW
 QjjgdyP8eA3y266BcetIBklgsZ3FILQF04JOR3v/m5MA9sjyX1q+hXis/waZUCCh18iX
 g0ccKkYhcttQ2TN02cTSKoHkW7JiYHR9chxEwkqUpWmlgGupUcm0bsKxF9Qf6kV82P3J
 uWEvj7WhEwg6++IBUpp8BMAQfWC4bg7OFJ3oETUUyfqX3yd3A5Fv+bP0q1MS89FeimV+
 r/ExumpS/dx5CRcev6EYfqOiRlS9e1pCZXA0FmRk3DNGYA31OnqDRUSgl/zjA/5pevPu
 FDQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FiI0mgF2
Subject: Re: [Buildroot] Error while building tpm2-tools package with fapi
 support
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
Content-Type: multipart/mixed; boundary="===============5018589577702829706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5018589577702829706==
Content-Type: multipart/alternative; boundary="000000000000c2012005fe096a75"

--000000000000c2012005fe096a75
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

Thanks for the info, it worked

Regards,
Sourabh


On Mon, May 22, 2023, 16:16 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Sat, 20 May 2023 23:34:48 +0200
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > Yes, you are right.
> > But, I did make "tpm2-tools-dirclean && make tpm2-tools-rebuild" and this
> > didn't help.
> > Also, I tried "make tpm2-tools-dirclean all" and "make
> tpm2-tools-dircclean
> > && make tpm2-tools-reconfigure". This also resulted in the same error.
>
> It's tpm2-tss that you need to rebuild. When you enable
> BR2_PACKAGE_TPM2_TOOLS_FAPI, it selects BR2_PACKAGE_TPM2_TSS_FAPI. But
> the thing is that tpm2-tss has already been built with
> BR2_PACKAGE_TPM2_TSS_FAPI disabled. Buildroot does not have the logic
> to automatically realize this. So either you do a full rebuild ("make
> clean all"), or you understand that you have to explicitly tell
> Buildroot that tpm2-tss needs to be rebuilt.
>
> So, essentially here:
>
> $ make tpm2-tss-dirclean tpm2-tools-dirclean
> $ make
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000c2012005fe096a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Thomas,<div dir=3D"auto"><br></div><div dir=3D"auto=
">Thanks for the info, it worked</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Regards,</div><div dir=3D"auto">Sourabh</div><div dir=3D"auto"><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, May 22, 2023, 16:16 Thomas Petazzoni &lt;<a href=3D"mailto:=
thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
On Sat, 20 May 2023 23:34:48 +0200<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Yes, you are right.<br>
&gt; But, I did make &quot;tpm2-tools-dirclean &amp;&amp; make tpm2-tools-r=
ebuild&quot; and this<br>
&gt; didn&#39;t help.<br>
&gt; Also, I tried &quot;make tpm2-tools-dirclean all&quot; and &quot;make =
tpm2-tools-dircclean<br>
&gt; &amp;&amp; make tpm2-tools-reconfigure&quot;. This also resulted in th=
e same error.<br>
<br>
It&#39;s tpm2-tss that you need to rebuild. When you enable<br>
BR2_PACKAGE_TPM2_TOOLS_FAPI, it selects BR2_PACKAGE_TPM2_TSS_FAPI. But<br>
the thing is that tpm2-tss has already been built with<br>
BR2_PACKAGE_TPM2_TSS_FAPI disabled. Buildroot does not have the logic<br>
to automatically realize this. So either you do a full rebuild (&quot;make<=
br>
clean all&quot;), or you understand that you have to explicitly tell<br>
Buildroot that tpm2-tss needs to be rebuilt.<br>
<br>
So, essentially here:<br>
<br>
$ make tpm2-tss-dirclean tpm2-tools-dirclean<br>
$ make<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000c2012005fe096a75--

--===============5018589577702829706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5018589577702829706==--
