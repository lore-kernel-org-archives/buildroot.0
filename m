Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B3ACD4F26
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 08:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF748137A;
	Tue, 12 May 2026 08:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROb9cVuLQNKu; Tue, 12 May 2026 08:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE368137E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778572991;
	bh=WZsHP10ZlKgHmOj7D7gIChBCFRauOOCaCQyd1Ad/XDk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlLmp3qZ6QfewA+2j0InvN1tj7W7HT8z3E4L5U67thyN5KbOUG2fk77YW7cA/tDRl
	 w/7HBZL8npPiOe2Hq0XLd9S90y15PS53JyUUSz9r+tdCUIniG1qd7Di4EdQueUk29+
	 Ly/yFhZd3S1aOt/nTvzxWjXMfwnbJR+akCWbYsufUeBtIw3+mI4inMjfEBVsu0fhpG
	 2+olpjAvQWdZrZt8ck2VeJEaJpUlcUu0wEhZtK3BRdlBGHNaIrrRzDjzWltbIb3jiQ
	 tvxharfpmhBU88zRq8pPZSCYJiGWAB6YCucvAHGDBQmoI4XOMnxKXT0IJN42hCQ+pF
	 OZr5lWxBPf+mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE368137E;
	Tue, 12 May 2026 08:03:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 783AA15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A0981379
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHUfMqAsbjRa for <buildroot@buildroot.org>;
 Tue, 12 May 2026 08:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2DF481378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DF481378
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2DF481378
 for <buildroot@busybox.net>; Tue, 12 May 2026 08:03:08 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-6314cc192a4so1042788137.0
 for <buildroot@busybox.net>; Tue, 12 May 2026 01:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778572987; cv=none;
 d=google.com; s=arc-20240605;
 b=kIHYvi9giDSxgn18f6WW6yp6L99gnBZVCvIctNNUNzGmZn6iKaW/TbiFEJW5hLZVLZ
 QqyTz+jHm2WS+tN4A7dVTO3t0Q8sXHI/G7nkWU+UBn7BE1l9mnXhcDiigWvB7EeaOGI4
 sbmtgQxJmBhTx/swOrwh38X7/wd9Wx/7n3wwATJhXjQm3kbQ1VT5mDNbsFkGHtAASx/8
 ZowoDI11g1Ndk4XLWMv4h1YHP8s+HebksGJ4XZUVJlEmEfAovPTnCKVsZrlIzmYUyOmi
 AGuhK50TWGXZ8RRDjn8mymOoNapL1gx4gWbng/Jg6ln5kWRm3RkbalSR2IPjgKysGQHl
 51TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eNVP5qAw1EtYKQi1iBxrHTILcJR9S/KdOMYVpL5zvjc=;
 fh=3Vz9HUHqYU6dt31GTCNQAK6dFXa10/Scwtl9wOn2l4s=;
 b=g7xXO0ijCmPYegCV4WbZpjTPBI5lqq0PdGMtbnzSn2nTGgU9vzaBbXQpFk/zmSXoCo
 dTmSyovMd4xiNIe6em3TgP0n+W8+OLDLnLNld1KqvsPZwo3A9e5vRwTtXoZhSFQO4iwY
 eOlvyiVT3fbquI6Pk5/K58K1Tc2/NbIlh51jH963GfEmM6fDKAvuyGTyOLKhOUisPyiu
 KtV2oPNHnVidwfQQmXwDnaw4VwJZbVQFn/YB+mgpT8uYX5XZwprp5HdE9s33j+7J0cOM
 X+bEWV17+c0aFndxnSs5CBrpNDfsP10dGhtaQXRGBHCCoruwsAMcsC2JhG5s+DzLRRkC
 yJmg==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778572987; x=1779177787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNVP5qAw1EtYKQi1iBxrHTILcJR9S/KdOMYVpL5zvjc=;
 b=puUWaINGQo0Z3YcDIAqN0KgOOpe+b1kQsHnUTtiAZVzqyDSgWpaFaWpNd2Eggo+yWa
 8015Wns7Oc56v7SmNxNm1nFzQOn/J3bZm6mYd1zwNpmzsgO++/rzd48qxbcqcl08hAR6
 9gTy7CcRlk644hxodeOt7cEJt30wV+dBaSCeKLeL2XnEsLVMSQOy2u7wYMFUD7kW+j3I
 AD5pX9NE7bEr5e3X840ccbxPg3K8zOmSXKxwTR5L9X282ZTdI8HTh5eAe/wjDBzG838O
 571vcwn+010xrDQ8Fe4BkeuIjwsxNoH458BEkkOwql/ALRDrHoAFFnunEZsJHr4mx3fz
 fZGg==
X-Gm-Message-State: AOJu0Yy8KQch9KRahZwVZaG784pJR2qIeBOJ3f7ChQl7TJPwS1yu0YvT
 LLCmprxc/sNJVHZK7uQtVnOeA2NAQ9idIBFMlJ4wqZbWjgRcAZ7TO0xZr1VcCt4Gyx0J1CkbZhn
 aaSDQBZOgM4xGQk+oT2PIiCbgvlxH3khjqw==
X-Gm-Gg: Acq92OGtdCWUGML4VVoOsMZPiFxkeUbdAQP7kTJwCL4Nn1/Ge4D0iu37UtjaS6iXJCB
 V0LV4yDAwLjagxeIoCJHSfXOOhXwuP9CNSnY1moxRDu9C1bSGLyliA+Qn9UtNRBJi4llQQQPV/j
 kEXxMrlc2oDg8+Q6oDsKQ/L7ROeJ7cH1/AILvnPcHy+inHfBr8RZUemmkgtePPvw3jn7eYNQlzj
 Bw8Qsh/timhWh/SK4zla0LLcMkL9PWVQ15HexbTdIJY2vitRaX5BxKN4lVYD3wehQNHgmrYMzIM
 yXyNAcgK+YFxdcppM4JhbFNW/nnqVwwe4lzOXn8iNA==
X-Received: by 2002:a05:6102:3582:b0:632:4af0:4133 with SMTP id
 ada2fe7eead31-636172ea2abmr653761137.18.1778572987184; Tue, 12 May 2026
 01:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260411080616.670069-1-francois.perrad@gadz.org>
 <87wlxadlw1.fsf@dell.be.48ers.dk>
In-Reply-To: <87wlxadlw1.fsf@dell.be.48ers.dk>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Tue, 12 May 2026 10:02:55 +0200
X-Gm-Features: AVHnY4J2_8mPvEArHpcbuZ11Y8kNwsKCBL6zZwckeUaa4L4izYVtOfaaAke85Yc
Message-ID: <CAMTop88G9F0DGMgQkOQs8X_aVWAaQwneH37BCbS8mp1tR3ZdNQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778572987; x=1779177787; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eNVP5qAw1EtYKQi1iBxrHTILcJR9S/KdOMYVpL5zvjc=;
 b=o28Fi7Yp2quIwyT/SnRQUZqS5ZlZh4b7VMMcO9rJ2aJOT2wHtoEwUQ/PLmw0+4sMHM
 a5sMoANLCY5kTvUguvxfAKPDSTG+ev/LlEUY1Lwqvsa7QIcSozp+bp/SD8LHJPOkteYA
 C/z6IprfNnTED4zUlXW6vzBgBMBGAPFeao2fxq1RSKVPNutw3YHQGldto7LhwYMq2BgV
 fEf5bkE6qdgSAcbce2/oLRARk4+Mjjg5PtXc3LGI4mxQcE9ErzZtt0RXYI/IO7ogaZHD
 jPyltZJid78iJt/s0lQB1HeeqPTzeh045djVC324QwQZMXM35MEiOw4J80r3nfBevbG5
 aHBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=o28Fi7Yp
Subject: Re: [Buildroot] [PATCH] package/opendoas: new package
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
Content-Type: multipart/mixed; boundary="===============8990269976939914467=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8990269976939914467==
Content-Type: multipart/alternative; boundary="0000000000001bbbea06519a4b0c"

--0000000000001bbbea06519a4b0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 11 mai 2026 =C3=A0 17:08, Peter Korsgaard <peter@korsgaard.com> a =
=C3=A9crit :

> >>>>> "Francois" =3D=3D Francois Perrad via buildroot <buildroot@buildroo=
t.org>
> writes:
>
>  > +define OPENDOAS_INSTALL_TARGET_CMDS
>  > +    $(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
>  > +    $(OPENDOAS_INSTALL_PAM_CONF)
>  > +endef
>
> Hmm, how does this work? Does it not need to be installed suid root like
> sudo?
>
>
You are right.
The mode must be  04755.

Regards.

Fran=C3=A7ois


> --
> Bye, Peter Korsgaard
>

--0000000000001bbbea06519a4b0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 11=
 mai 2026 =C3=A0=C2=A017:08, Peter Korsgaard &lt;<a href=3D"mailto:peter@ko=
rsgaard.com">peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Fra=
ncois&quot; =3D=3D Francois Perrad via buildroot &lt;<a href=3D"mailto:buil=
droot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt; writ=
es:<br>
<br>
=C2=A0&gt; +define OPENDOAS_INSTALL_TARGET_CMDS<br>
=C2=A0&gt; +=C2=A0 =C2=A0 $(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/us=
r/bin/doas<br>
=C2=A0&gt; +=C2=A0 =C2=A0 $(OPENDOAS_INSTALL_PAM_CONF)<br>
=C2=A0&gt; +endef<br>
<br>
Hmm, how does this work? Does it not need to be installed suid root like<br=
>
sudo?<br>
<br></blockquote><div><br></div><div>You are right.</div><div>The mode must=
 be=C2=A0 04755.</div><div><br></div><div>Regards.</div><div><br></div><div=
>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--0000000000001bbbea06519a4b0c--

--===============8990269976939914467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8990269976939914467==--
