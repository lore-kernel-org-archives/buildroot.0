Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491AFED3C3
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09D7484A99;
	Fri, 24 Apr 2026 13:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDqG8XeAWy8w; Fri, 24 Apr 2026 13:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F19484A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777036612;
	bh=B+/jP8AKJxiZr5kZWUtu3eMkWhfr5ereMxoWrCprkHk=;
	h=In-Reply-To:References:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=US63XcpPcLXZ9ddYSQUlZJV/rqL+MJ+UNDTKO3tXulxDsiychETozkSkFwcUvfPDS
	 3TXRIz6IRzjocMxCKuYB4U4RoRJIQgpdBb30VVgQcOasrCaO1csPa3FSwZgQZ3itqN
	 OZPfOse24pPAthldRNx67x/A0OAO/7bdoE8MQbvkkdI3+/Qu2dzQM9gLSmhWxoH3kB
	 fuOFwj5oL2cUDdSFllLtjAQEz9CUZ1oCAJ2c/bORU8QLjEEsqZdzDkg3GVPMOdBAnD
	 939cXqKdNbqflhZTnIor7XDx4puW9uBDvcmT56q8uVlUqi6Wo9YC6mWZw1//IsbY1C
	 coCzpGVOHCXeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F19484A9B;
	Fri, 24 Apr 2026 13:16:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BCE24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF33422D4
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymtOShmT_dwt for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDB33400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDB33400BA
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDB33400BA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:16:50 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-6221c72515fso769218137.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 06:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777036609; cv=none;
 d=google.com; s=arc-20240605;
 b=eAhDu8AoYSIj5NfnZrANeZZRvgTqFOJVzed6HEPUoY1gfdzA2ncqZ1Xbi7CzZhb+g8
 is8zXdRi3eZ16jdrNkv9BREcEtxrJmQCoT1SG/s+SrKfapwoyiMdh8UZrWjNzgUXyA3Y
 TArWmeXroQCHVhWThFW0MqeKsAAgC2auxolkssvXHlRXB2FF+pynv1q6WBmdnZAYpsn7
 wVRC7rkm16DRlxVAnLjZakIXLLAS+TZw/kqYZwR8J/82LnMrrIO+Pdrcaw2j3a1yhnIj
 sUavPjosYaXlN8XC5LjF/mSFUIGWqWGF/mhJN8e+jVfuWyeEO346fXB3G0mJxGPqKQm+
 RxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=cj07Mqz/oXQV2wwoWeqmfRPr6AAN/9/6ep+u8gVugZc=;
 fh=BFeTSV1N2FCAhNQ7FyBnyiS4KMraWGdyyVxwP7SQJUQ=;
 b=Nz9i7aQzz1AQdYe1yr7PgOy0ehtEJJ4XeXp47GxUHisrULttcqq8WcLet7EvLK7wwD
 fR0MdIR6Ds/CVV4x8kUwl1/DOwfdF96TVCwIoRLb5UgPKLdLLXDNL/wQHnFwSWTPFBiQ
 YnnFpL92eJ/tukrF28xbB4MwUHfPEhE0+chNgvvfbraDnaWoqMljupcsJAyrwMxyu/Gj
 D6gNTxSnZ5In2WW+jEOVH9qLQTtaVH6WlcFjBWw+gUfXOp/mkrNsrrVtgidj4aVr7nnn
 cWcKTc7SpipYHhE+2afMS0BDWcceEmutmd7vEngdF/IZGPwILAJpq6HYt9oOplai3T8t
 cs4g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777036609; x=1777641409;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cj07Mqz/oXQV2wwoWeqmfRPr6AAN/9/6ep+u8gVugZc=;
 b=b2LL2ZmT3fp6LjW2QPu4Rp7T7ZZl6aZcHIyMk8le54v8fy4qV2nTKj7iw4GfApeOPq
 dPbk7jO92q+NMlfSolNO83+kWXmGarhwV4Em6GCp/jM3ZiRmvTRGYul8zoy85cgIUan0
 +NgyO2QR4d0s9mowJ050rzfJfJ4n97ILB0Ydm1yseAmpOxy2ZZPRhZ6Xg6cssx0aV4Ph
 /TDkUd8IJnPUIQB8eXODgUB1ZcF+P+WrLZIpNtzanKTWkkecR8gba8dLgt8k0sjuLhka
 MhbBmyllauXVPWadWFmjiHA8p5VimMS4LTAj2zO1pY39tcmu4COfS8QdRLCPuNJqP2Gv
 tmRw==
X-Gm-Message-State: AOJu0YyYQpE3takmdH53aVQdWmxNzS8TR4Q8efPCeVF2GTlzqzAYnWTC
 VY6m+OEjkZ05VfF0wv6+PE8cg2PQ8/v4quuug4JMq+TqW2uADVXEOOt+fphWJYaZOrcywtsilYB
 rAECs+RII8p7Dn936bfRqFJPUaaEQzl0=
X-Gm-Gg: AeBDieu8VDDXIWd4QFRtYC/DNN2U+wjuLDlqJMUZlsIfQlesOiXb3hd0e2w4lo5BUM0
 SwiKL2pIj26qr5WleDSdZCheL3tC6eCL+4o1fwqpoE7YpavHOMJR5d7G9MKubMEf+mYDPEbOm5W
 d+88kVbUfL92SI3PnKAG3mQGgPJz87B+YLqzL/H3z1j7BrGzMjJYZ4qdXLsiiJkmMR6eQvDHVrv
 pzgWFnxbyYLeopJut4wd/r+6UpZEiNLiQhU0rhpv9vdn+ksJjntKbyzXFg0Psc0vw6StfW9hS7m
 +6yFkAd9WXDIE75SixSPRBKZ3FLsoJz4DLT7npu1uHWAd4vIWu8=
X-Received: by 2002:a05:6102:ccc:b0:613:6b44:3fad with SMTP id
 ada2fe7eead31-616f783ddf9mr16527613137.25.1777036609333; Fri, 24 Apr 2026
 06:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:c04:b0:583:13b4:e6e0 with HTTP; Fri, 24 Apr 2026
 06:16:47 -0700 (PDT)
In-Reply-To: <20260424122518.3908953-2-kanak.shilledar@axis.com>
References: <20260424122518.3908953-1-kanak.shilledar@axis.com>
 <20260424122518.3908953-2-kanak.shilledar@axis.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 24 Apr 2026 15:16:47 +0200
X-Gm-Features: AQROBzAUPLYbxOP-l88hjM9Tcl4OfR98IbNi32Ys459yF3TBgWpl_NAaXL0Tn2E
Message-ID: <CAB1t1CwB29mtEm9xOcej+Ky93jJDZhTfXVtv=DeCYrr5xZTB+w@mail.gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777036609; x=1777641409; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cj07Mqz/oXQV2wwoWeqmfRPr6AAN/9/6ep+u8gVugZc=;
 b=ktzzgZtX/JrFacIillPK5rUWLszgDmFBm60r5jGQ9q7DWcSLIhT8wBLA7Sf20/5lqo
 XX81+eCKdXywwYhKL4Z6xDyxTHBdKOJF2cj1GGKGFOsmyIDn+CqcZYKGFv1o0oRf+d7/
 NXzvUlpmAF2M+Z144K7ZVAFf5e1vmeDwmnMEUxv4EgHN73KoRlNMOnOwHiQXSdeZGhKN
 Y0f2zKAxqCkWp580kqtDox6ezmO/D3YLulH2k9jWRx59pVQtA5wOvR/a4hpJmNo45OtJ
 oOuQGN+NBdiTccXji85tYSnby0fW6h+3rsRvKFRla6HI/mNEdwCfILiz4SNfiwqi3IwO
 bd7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ktzzgZtX
Subject: Re: [Buildroot] [PATCH 1/1] support: kconfig: Fix compiler warnings
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
Content-Type: multipart/mixed; boundary="===============8896841554143275136=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8896841554143275136==
Content-Type: multipart/alternative; boundary="000000000000da2c1b06503493f5"

--000000000000da2c1b06503493f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, 24 April 2026, Kanak Shilledar <kanak.shilledar@axis.com> wrote:

> On Ubuntu 24.04.4, the compiler gives the warning of
> `-Wformat-overflow=3D`.
>
> ```
> ./util.c: In function =E2=80=98file_write_dep=E2=80=99:
> ./util.c:86:26: warning: =E2=80=98%s=E2=80=99 directive writing 10 or mor=
e bytes into a
> region of size between 1 and 4097 [-Wformat-overflow=3D]
>    86 |         sprintf(buf2, "%s%s", dir, name);
>       |                          ^~
> ./util.c:86:9: note: =E2=80=98sprintf=E2=80=99 output 11 or more bytes (a=
ssuming 4107)
> into a destination of size 4097
>    86 |         sprintf(buf2, "%s%s", dir, name);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ```
>
> Update `buf2` to `PATH_MAX+20` similar to `buf`, thus giving enough
> headroom for the filename suffix.
>
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  support/kconfig/util.c | 2 +-
>

LGTM, but coild you please create a patch in support/kconfig/patches/
instead of direct file modification?

Petr


 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/kconfig/util.c b/support/kconfig/util.c
> index 8665f5bb89..c2e7979ac1 100644
> --- a/support/kconfig/util.c
> +++ b/support/kconfig/util.c
> @@ -35,7 +35,7 @@ struct file *file_lookup(const char *name)
>  int file_write_dep(const char *name)
>  {
>         char *str;
> -       char buf[PATH_MAX+20], buf2[PATH_MAX+1], dir[PATH_MAX+1];
> +       char buf[PATH_MAX+20], buf2[PATH_MAX+20], dir[PATH_MAX+1];
>         struct symbol *sym, *env_sym;
>         struct expr *e;
>         struct file *file;
> --
> 2.43.0
>
>

--000000000000da2c1b06503493f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, 24 April 2026, Kanak Shilledar &lt;<a href=3D"mailto:kan=
ak.shilledar@axis.com">kanak.shilledar@axis.com</a>&gt; wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Ubuntu 24.04.4, the compiler gives the warning of<=
br>
`-Wformat-overflow=3D`.<br>
<br>
```<br>
./util.c: In function =E2=80=98file_write_dep=E2=80=99:<br>
./util.c:86:26: warning: =E2=80=98%s=E2=80=99 directive writing 10 or more =
bytes into a region of size between 1 and 4097 [-Wformat-overflow=3D]<br>
=C2=A0 =C2=A086 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(buf2, &quot;%s%s=
&quot;, dir, name);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>
./util.c:86:9: note: =E2=80=98sprintf=E2=80=99 output 11 or more bytes (ass=
uming 4107) into a destination of size 4097<br>
=C2=A0 =C2=A086 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(buf2, &quot;%s%s=
&quot;, dir, name);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~<wbr>~~<br>
```<br>
<br>
Update `buf2` to `PATH_MAX+20` similar to `buf`, thus giving enough<br>
headroom for the filename suffix.<br>
<br>
Signed-off-by: Kanak Shilledar &lt;<a href=3D"mailto:kanak.shilledar@axis.c=
om">kanak.shilledar@axis.com</a>&gt;<br>
---<br>
=C2=A0support/kconfig/util.c | 2 +-<br></blockquote><div><br></div><div>LGT=
M, but coild you please create a patch in support/kconfig/patches/ instead =
of direct file modification?</div><div><br></div><div>Petr</div><div><br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A01 file changed, 1 i=
nsertion(+), 1 deletion(-)<br>
<br>
diff --git a/support/kconfig/util.c b/support/kconfig/util.c<br>
index 8665f5bb89..c2e7979ac1 100644<br>
--- a/support/kconfig/util.c<br>
+++ b/support/kconfig/util.c<br>
@@ -35,7 +35,7 @@ struct file *file_lookup(const char *name)<br>
=C2=A0int file_write_dep(const char *name)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *str;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[PATH_MAX+20], buf2[PATH_MAX+1], dir[PA=
TH_MAX+1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[PATH_MAX+20], buf2[PATH_MAX+20], dir[P=
ATH_MAX+1];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct symbol *sym, *env_sym;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct expr *e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct file *file;<br>
-- <br>
2.43.0<br>
<br>
</blockquote>

--000000000000da2c1b06503493f5--

--===============8896841554143275136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8896841554143275136==--
