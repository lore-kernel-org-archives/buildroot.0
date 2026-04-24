Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34482FED3C3
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F08D584AAB;
	Fri, 24 Apr 2026 13:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7smDh0UW0rAX; Fri, 24 Apr 2026 13:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58DC384A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777036678;
	bh=QujW9aCP4KE3j6da3vlYWMkz6XNOrdLyzWIOgWYUn6I=;
	h=In-Reply-To:References:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsIaDs3mXL0gTvLZ8hmdNcJ7zjci9uaH9giBxuJttbePKxGEJXa4WQsO1t3BF0+pX
	 9Wrk7Sgc/Np6HopFJbBjFi8sy9imsVx0blwPtgIk+rN7dyZ1DuojLagV1aPQ5zlxrf
	 ViX6f2UWeNruY19bP91uEgofJ40VC20MkbOfk9qzp+lK+pqaFER5JViPS5+QZMoqiE
	 sSI4p1ajmFUQCbjhKLyqXAngbn8mOZx/ladom+SGmsV4FureAq700bJOtKuUIjdtE1
	 RaS3IKzCJChR6y7RAd4mv8PdI4CPLXfDr7GUacBfbTC+YckQVvwRIbksOigSy1LMqH
	 4UZpBAFHUOCjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DC384A9D;
	Fri, 24 Apr 2026 13:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AE1524D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8A661AE0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlH2UunDwnau for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:17:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8619C61ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8619C61ADF
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8619C61ADF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:17:56 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-95673f7b5baso1929281241.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 06:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777036675; cv=none;
 d=google.com; s=arc-20240605;
 b=G8yE1Y3kbU+DJbFsGdssMkNsIB9mt8fgO39TNgjpjivvXdIrJr1eQ4Q0ON9MpGzaDH
 OYTbHa43/oNrCumLZz6ebxCynq3SVs6cr1lqg+YqiwTFJh5smZWFn2X0s1uKOzPBuCsN
 si3BOIJZHOj1JhReS9Fr/RSJ3Cyu3f1DoBRl1hVNEKpZK0Fnmp4rpl26TA0SZdTVqEPZ
 HwFTOAztG/9rHFSlu1Uls3BH63LN7eFjaXSv3ZC8EbotSVDAfsZmqoTeHomRwwDacClK
 YEyiRd//nfmntxV3ttA9QramoxAUHvH30UPu2qMs52907R9eGUFEO6BgPHplt+r+qPZx
 Qn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=jWtd1kxE66TxdPkyOmVRoi5ii843BGvJWcr4ls1dzZQ=;
 fh=BFeTSV1N2FCAhNQ7FyBnyiS4KMraWGdyyVxwP7SQJUQ=;
 b=j6R9z7G3Kp5roqBeVVinXkdA4y6gpn3L6Eow/yPJ0QNCB87aq6LTfwR/v9SzK1GAA5
 jq5Rm+IEJGoDI72Ue7+F7rRq/AE+0ym2krSwmA8vU1xnYJu7OzVPcjFTRZ8W2Uy0IgoA
 Qt3AGS1QRAuJVTC9OENF1OwlsGhwhT9mLFhzUH8xe67GRAnU0WKVvB1gk8HSlVKE4uQd
 YCk5EY1F+P4qtBAE24kPVKizQxD5yqwct0MsjeIejmzZEScNGTRuE4LggOJfqYYkUWcq
 ebdfAXpG4cT47k+sCNvppxNT+izSniNLlKFcxz8oBHbNiITed9BYUYvSwz5L04s/qhTh
 ieng==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777036675; x=1777641475;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWtd1kxE66TxdPkyOmVRoi5ii843BGvJWcr4ls1dzZQ=;
 b=QXHZ3zquX3iiT7DWMSlD0olRx74ANXPvplaJdg+baITvfsOSS829xi5yu4FAT5NvfW
 QGupQb9jaTvzxvUP9cKcnZtZXxWqfUc0mnSQijJNYA4c3lS4RQCzEav2IYrkjFequwbT
 +hPd3dG2ODm6ci1UE9sCUETizCPsmu/vjRe/4VnMLEdFdJnsH2Rarel7LvSdXv/TQ8Mk
 7LRL+YlvE/mlEz36V4KWFKbPgfo7y2pUo7v9QuiUUf0SKiQQno8HN/GDwME21jDGzpk9
 WGUvQckAWPxEbuBDqN8o+WrK93azp6lbG5cmuJsvS/TNV4x4eAjrh8QUiJSjgvmWVD31
 PSeA==
X-Gm-Message-State: AOJu0YwAORn2futXhj4v78DCiA2YF0JoexNLcJ+BoSd5f5OvOAGau02I
 Rm4FbT/3bj7nakcOUpyHUdcqqO/pLpBY8YOvfufK3eZJ6nC+LdwvyafM5qtl2uq8od5rVNCQXSK
 5JxxyRqtdji+K5AqXFbxJwexFAwAQ/C9d/A==
X-Gm-Gg: AeBDieth/plwDtxlUoQjxRKSveM6Dy343IudKwi/vFi+iahNY1dibNQ28g5FA1JiiUq
 ClrEclZMb63N5lWovd0gngV02Yt+W89QQMaWJrfKXbCphToJSP6Kb9nODjneXrCN+FAYM8m0kQ0
 hoqzHomN35U1RPOWcYuj9sZ9hA9WOsABXQ2Hn7B42DBDe1g737X2NshwXIRe6YVPdOTXHLYMkiN
 3Rjqa2EtENLLMGkKpZaQbZRWvxRlRoVIqAsFPrQiMpoO87qWBF/nUiE4LK0Z9B7w5ZKr4fZrPDv
 lv4Q1TlPzsxh5914zf7MNS/K/tK4ryxu4uUCB7lM4a1dZyDBQj4=
X-Received: by 2002:a05:6102:4415:b0:605:5e1b:1d2a with SMTP id
 ada2fe7eead31-616f68d398cmr14673032137.18.1777036674830; Fri, 24 Apr 2026
 06:17:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:4f11:b0:58a:15f0:95b3 with HTTP; Fri, 24 Apr 2026
 06:17:53 -0700 (PDT)
In-Reply-To: <20260424122917.3911794-2-kanak.shilledar@axis.com>
References: <20260424122917.3911794-1-kanak.shilledar@axis.com>
 <20260424122917.3911794-2-kanak.shilledar@axis.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 24 Apr 2026 15:17:53 +0200
X-Gm-Features: AQROBzBTCLWeG3p8tPz3C9EgRkt1fpyRFWjmvHQlOymEupFDNrPO9HRyrl4cqXM
Message-ID: <CAB1t1CxgW85LXeqhQD6ZVqB32stq0uXfc_84k4ESf82nzrHdTQ@mail.gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777036675; x=1777641475; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jWtd1kxE66TxdPkyOmVRoi5ii843BGvJWcr4ls1dzZQ=;
 b=H8+K8h6fjTa/RNA2v87ydP6ywJv0jzrxxChf18K0wbUTxeRcroF6I+O8A5VilBN5sZ
 HGOCKhiOzbb6J4D2QHVhXdqR9fiCJlQ2qL2ZTujrrulN3zCrpI07kPVhvkyFGmkIN7n7
 82c7rVifXAXL34iVEd1Fp9tZ+9tQiMd/Rv7Mr21Ft0LjQEI3TDTgmMdL4lxj3JxYUzEJ
 VDR/ESAj0hSzSbr3mrFvqH/+F8VJ2uqA3uwV3IRCD/tG7MrFPFOPu8Ne0kyXuKt8ey8Z
 SUAScvaTk7MUHP4RwuVm45vwVgAN2sMxm7sKMzos+YN/xpxMdedCQskWRtXIzN85B54e
 wIMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H8+K8h6f
Subject: Re: [Buildroot] [PATCH 0/1] support: kconfig: Fix compiler warnings
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
Content-Type: multipart/mixed; boundary="===============0939015528373639980=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0939015528373639980==
Content-Type: multipart/alternative; boundary="000000000000c196440650349730"

--000000000000c196440650349730
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

+1 (+ creating a patch).
Petr

>
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  support/kconfig/util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

--000000000000c196440650349730
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
headroom for the filename suffix.<br></blockquote><div><br></div><div>+1 (+=
 creating a patch).</div><div>Petr=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>Signed-off-by: Kanak Shilledar &lt;<a href=3D"mailto:kanak.shilledar@=
axis.com">kanak.shilledar@axis.com</a>&gt;<br>
---<br>
=C2=A0support/kconfig/util.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
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

--000000000000c196440650349730--

--===============0939015528373639980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0939015528373639980==--
