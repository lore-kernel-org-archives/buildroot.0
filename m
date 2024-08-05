Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B7AC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 17:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848346065D;
	Mon,  5 Aug 2024 17:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yB4bd2O_Ffv1; Mon,  5 Aug 2024 17:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84605606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84605606EB;
	Mon,  5 Aug 2024 17:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF181BF31C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BEBD405A5
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 17:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8JFczruAsix for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 17:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DCD040231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DCD040231
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DCD040231
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 17:35:01 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so12709470a12.1
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 10:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722879299; x=1723484099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvxJhjGFFLZosjfxy5AyDT6rlOctTiRiWsqXeOUKafs=;
 b=v9G68s/o649FWj7uxh1LEW7QxUzTM0CIXXsclfjJMOVoZGl2I+DeNYJg8wiLJfK7vW
 TztYuuGLpshETXqoi5qlMR0/5KHy40geBrmA/dpYUMvuqR/5Co+I2tuqWfW9myDxvd8n
 2eiTWOeU6uDkKIuoewPQkNxz6UQVtNe5kVwE5C7f9djA2cwRFyfl6yFOHNXz+E+qewWB
 q2wCOrod7RYvPLp/WlkwtHaIX9HhBZ3A54wSOT6mWfOuvdIkr5p6oSib6b1viQwEY2GP
 IpjS+/C7uT/GnRRFOulv+S+vg1MfjeSE+oNKQZl3Zkt9X2sssYGWaxO63wzdL9nNboGg
 tA2g==
X-Gm-Message-State: AOJu0Yz06d57oNp5X22xIL37TR7GGuF5wxXLVCRV/k7b+ISzHa8tDR8p
 kJ60aJdmhYmt3T9tD7b9uF1GHf8oCQB+VbCh0xe3xM3YAHX3pnlk2sWe9lhiM0aOf6tsZvux6Cd
 i/toSNQ==
X-Google-Smtp-Source: AGHT+IHhQfBqHdno+CSRO4aqHm0SefSY0qGnq5mxKnqYcIxhBc/pYhHUbeeeIz1bnIZwldloYahCxA==
X-Received: by 2002:aa7:c3cc:0:b0:5a1:8984:977e with SMTP id
 4fb4d7f45d1cf-5b7f340d60cmr7661817a12.8.1722879298688; 
 Mon, 05 Aug 2024 10:34:58 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839716a97sm5112838a12.16.2024.08.05.10.34.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 10:34:56 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5ba482282d3so2796601a12.2
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 10:34:56 -0700 (PDT)
X-Received: by 2002:a17:907:6e86:b0:a72:8d2f:859c with SMTP id
 a640c23a62f3a-a7dc4fd88fbmr867569466b.33.1722879295804; Mon, 05 Aug 2024
 10:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
In-Reply-To: <20240805163133.4126564-1-james.hilliard1@gmail.com>
Date: Mon, 5 Aug 2024 10:34:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
Message-ID: <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722879299; x=1723484099; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UvxJhjGFFLZosjfxy5AyDT6rlOctTiRiWsqXeOUKafs=;
 b=FkhdXJGOGm0/k763mbQZWVfwk2Fg3l1S4XnfHBfgq2ALaNvHtvJ8ciLLoqvWY50dZQ
 zI5ZltQZnxXurB4ZlNKTVFJ09C8V+n+8l1JlBVG5HY57CWuFmuciu71eejaVpn8CBNVJ
 1KnxYdEsx8M/L6Aa+pn7HysIP1T9LqLjvXRVlJfWqwBoVdCFhBRBBkvbOjTGgmdIzRaO
 YWvvIwUF2a0DsNMQkZ2HOf70wZ/iPVlRL6Sn4hW1/xIvt81Is6DHevAJqNtvA57YGxDu
 8ENOSsFhN/NUDo2U7tNPL+9Y97XZ98uRsjlgaWnK50T7wBnRSJWNGhPcPyTOFl5kxcUq
 iIMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=FkhdXJGO
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8976235425349399492=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8976235425349399492==
Content-Type: multipart/alternative; boundary="0000000000006ae322061ef31843"

--0000000000006ae322061ef31843
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

James,

On Mon, Aug 5, 2024, 9:31=E2=80=AFAM James Hilliard <james.hilliard1@gmail.=
com>
wrote:

> Some packages like the upcoming tailscale package need to set GOPROXY
> to get the correct dependencies..
>

I still highly disagree with setting GOPROXY per package.

I have been working with the tailscale devs to fix the dependency issues.
We fixed most of it.

Additionally I'm waiting for the anchore/quill developers to get back to me
about removing some Git LFS files from their module that also break GOPROXY=
.

The decision to use the proxy or not (run by Google) should be up to the
user. If I want to download everything from Git, that should be fully
possible. (And usually is with GOPROXY direct)

I'll follow up with those GitHub issues today and see if I can get the ball
rolling on another tailscale release with fixed dependencies.

Thanks,
Christian Stewart

--0000000000006ae322061ef31843
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>James,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2024, 9:31=E2=80=AFAM James Hilli=
ard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Some packages li=
ke the upcoming tailscale package need to set GOPROXY<br>
to get the correct dependencies..<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I still highly disagree with setting GOPRO=
XY per package.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
have been working with the tailscale devs to fix the dependency issues. We =
fixed most of it.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Additionally I&#39;m waiting for the anchore/quill developers to get back t=
o me about removing some Git LFS files from their module that also break GO=
PROXY.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The decision to u=
se the proxy or not (run by Google) should be up to the user. If I want to =
download everything from Git, that should be fully possible. (And usually i=
s with GOPROXY direct)</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
&#39;ll follow up with those GitHub issues today and see if I can get the b=
all rolling on another tailscale release with fixed dependencies.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Ch=
ristian Stewart</div></div>

--0000000000006ae322061ef31843--

--===============8976235425349399492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8976235425349399492==--
