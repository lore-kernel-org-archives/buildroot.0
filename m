Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E428BC7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 14:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA7A402FD;
	Thu, 19 Jun 2025 14:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaPYUngJZabL; Thu, 19 Jun 2025 14:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C02B1402D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C02B1402D9;
	Thu, 19 Jun 2025 14:35:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48DE1E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F85640054
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZuIssDVJFxK for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 14:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=johanderycke@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 560F140385
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 560F140385
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 560F140385
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:35:09 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4e9a7bfb3c8so638925137.1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750343708; x=1750948508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dkn6YXP3NB0GCpMx6YJQyUtPlLnemNUQD5PBsb+713U=;
 b=cn99mgIVUYNyrN8NB0ZHiliDXyaNT51m4uQFTn+MrQNxH+3Wh7QuUtoxm1VxXDUrYU
 NUpKtCI8HeiIl/BG7RVsHFkG99vSQ8507hvcsn/s9q3G/EVsBZk+wjQHJ7y5McXU66kG
 ruXtaoLRHBxEwtbxzWXf78CkoKHlCzUZ85FJUqI5Ixj/I3tdZM0Uy9WKJPmSHnFPDqTD
 NsvNu9PrAzPTdTlsbkaJvI7jRdn49Y129+ESCyPYC6cYRSKR5ywpoU1gpkafLOU93y/l
 qq2Fwk1W13U8A8MDmFnlZL4LZ1UoRLEQNlfsE9IyAuvlP8pBD5O06swtI2C/QfSwovv7
 WvRg==
X-Gm-Message-State: AOJu0YyuPR+n/iPNj0xrgNTVo7+aPJbE9aUbypcNwl5n0BPSmXobR14d
 O2E2XdGoGbaQxzcpY6KHpO+wVx2AKVT/4K2dzOm8oZcu2RXAedpAd7ksIzw4LJDjDRXT8xum0BY
 Ho5tl9x8voqt2HLrJPm4dVa2Vhb3dxrFP0/Ar
X-Gm-Gg: ASbGnctj24kq14Y7uth/NLSNSVbtygfbfDMNl0UPWpSY4dlOTOXBo0QsQSzsBnGinT0
 0I8napUon2onYpRfLdrdQNpUgYabMdTyjCCmpCgZXmUm0aGVSJ6E59un6e6XnGEwtIwkwVKOIpq
 DwBOjw2BcVvm65rXq+6kMuf3Gb5GmwKWzCSG+0QpkWEZo=
X-Google-Smtp-Source: AGHT+IHbHiEOfxpRHvKT0e96hGg6X/0Qt0k9nbdPXMUpLFOMt5fAdVLxEblMYAUR16L32A2evUCttMR9pmeiH/2DmgA=
X-Received: by 2002:a05:6102:4194:b0:4df:4a04:8d5e with SMTP id
 ada2fe7eead31-4e7f6118578mr16441285137.8.1750343707740; Thu, 19 Jun 2025
 07:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
From: Johan Derycke <johanderycke@gmail.com>
Date: Thu, 19 Jun 2025 16:34:56 +0200
X-Gm-Features: Ac12FXxOYPhj64S2Qa_RF0WrL7E3p_6TGnVzJ9ZEQxdocKkwuoeqmIsntJzHw1E
Message-ID: <CAKHhJn1m5fZnPYki3jR0ZWa-2aB3291n3dyLUoQViBM_X5Zc2g@mail.gmail.com>
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750343708; x=1750948508; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dkn6YXP3NB0GCpMx6YJQyUtPlLnemNUQD5PBsb+713U=;
 b=E7BnT/ql7la4rJ51Uo05Vc6sJpdFzLoFdOe2MTKrpolda22YIWVzw+DcqDg8DysyDo
 hsh95bOQo6F8ZMruYs+pE2ZluHJxv3MUpVyGKpWOOjdMN5zPHDpuWXlXBpbA6dYMcrgJ
 lDJp92Z+MfvzZloM24rX1LBiTQS+v4fMX+gcqbvhOBEWjXVzTUMvQ9YXPf3DQTJ8zWlA
 qxGNc+OGJOIXrfzIkKCuc2NdaZn0nngmmdFdTYrtzOUxYKcQqNCNhc3YDVh+u3+vVb1e
 PHSXqP4DXo5BppGbDpcHU/v1HyIn6P2b0D+Bhs0pvU0H10IApeF3wkq7KkHswK8PxjHS
 WRLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E7BnT/ql
Subject: Re: [Buildroot] [PATCH 1/7] utils/generate-cyclonedx: add option to
 filter host packages
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
Content-Type: multipart/mixed; boundary="===============3424672548480510805=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3424672548480510805==
Content-Type: multipart/alternative; boundary="000000000000ef50e40637eda685"

--000000000000ef50e40637eda685
Content-Type: text/plain; charset="UTF-8"

Hi,

Op vr 13 jun 2025 om 13:06 schreef Fabien Lehoussel via buildroot <
buildroot@buildroot.org>:

> Adds a new command-line option '--no-host-packages' that allows users
> to exclude host packages from the generated SBOM. This is useful when
> focusing on target packages only, resulting in a more concise and
> relevant software bill of materials.
>
>
Host packages still show up in dependencies.
"br2_parse_deps_recursively" will need some extra filtering I guess.

Best regards,
Johan

--000000000000ef50e40637eda685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Op vr 13 jun 2025 om 13:06 s=
chreef Fabien Lehoussel via buildroot &lt;<a href=3D"mailto:buildroot@build=
root.org">buildroot@buildroot.org</a>&gt;:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Adds a new command-line option &#39;--no-host-pa=
ckages&#39; that allows users<br>
to exclude host packages from the generated SBOM. This is useful when<br>
focusing on target packages only, resulting in a more concise and<br>
relevant software bill of materials.<br><br></blockquote><div><br>Host pack=
ages still show up in dependencies.<br>&quot;br2_parse_deps_recursively&quo=
t; will need some extra filtering I guess.<br><br>Best regards,</div><div>J=
ohan</div></div></div>

--000000000000ef50e40637eda685--

--===============3424672548480510805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3424672548480510805==--
