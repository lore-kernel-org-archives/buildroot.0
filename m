Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C91C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE9A611C0
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFE9A611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30AC8605C2;
	Wed,  6 Oct 2021 06:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA6CKd4HQpnf; Wed,  6 Oct 2021 06:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D19E60E61;
	Wed,  6 Oct 2021 06:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA891BF25F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 094CE60E61
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fsh_DmTzLsKb for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E635960E5F
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:23:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r18so5484348edv.12
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jyFYxcpH6orpFd7wnu2rM4Wfe5EF396DMUWdGUJs7CM=;
 b=eqn6QcE5N/Bg/m4oyY4SGHVY2AZI9FgwXRSUk+2SV2ASTBTEsVtmApMi5Ra7eYLUrq
 p80rXaapRX9clKqX8Yc8RdDpqqDIq4IKhQCVjUek0cQamz53mmEStR4oCUH3f7jf9How
 fwdw6GebmMtjVogFmJXovCh1J9dvPlkBVNF36SRYidhj8d5M+E74GunZ8N0Gw5dnJSxV
 /zSrMe3E7VGM3YLhSN0xDzxnsY/2UXmro1v46CwRzwgs1Vs+5NnaBdcgnjKigjePIXqm
 g71GdKgczIdZSelBPWwR1StcAS2HCyieeWai+wSPq0MyUqvZYS3/uUkCkQTdynncue2Q
 50RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jyFYxcpH6orpFd7wnu2rM4Wfe5EF396DMUWdGUJs7CM=;
 b=2QDR/FpFI1MXFiS6FnP/5ScXp7ZlcqN0y6hh7KyinE5cJyCiSHxm9qQpgyn0uy8p73
 TDfFWEptf26NVLnsOCjPfo3tg5Nl93BvnXngAYWCrhsM1nc0l1ywod5aMdAnCVNKXB9k
 ZKAU85EBtV/GFq29ZuKrmdUKsSvkh6ZTwG3PKKuQG9S8caQFSzSgu4x2u+ivmeOvv/oQ
 LUIwDd7++YFLernzJfZqbpff5GP/N51aDedCeQcFfs3Wt0TrKl4P4zYa0npaUPz4Hvvn
 aWlODQGCxtvrvsdaptBQzj3kjL8VF6RmW9/wNOMsCJEu7WBHU/mSyTSIAgoQ31vRH7wU
 9xOQ==
X-Gm-Message-State: AOAM533zVpHPCFSu6qJ4M1pYMtvIhHm5zo2d2iciD6pTf9tQC0X3SvCI
 9PCACMjP1h2p8SS6oHcPyJelBhYLjiGYjSmPR4s2Wg==
X-Google-Smtp-Source: ABdhPJwMp2KzZyOYQ002qtgPPTuTz8c9W2yr+zHEnRb0JcXpqsTirbYesDQwxdh8dEw56GXcpdP/WT9qLE+Ta4VJXiM=
X-Received: by 2002:a50:da0a:: with SMTP id z10mr31354026edj.298.1633501422139; 
 Tue, 05 Oct 2021 23:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
 <87zgrnd1xu.fsf@dell.be.48ers.dk>
 <CAJPV9MqO8ZLq9TUH7Oj_-JrxZpXjQeDZ3a+-sNg-nXFNbwwV7A@mail.gmail.com>
 <87o883beeg.fsf@dell.be.48ers.dk>
In-Reply-To: <87o883beeg.fsf@dell.be.48ers.dk>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 6 Oct 2021 09:23:31 +0300
Message-ID: <CAJPV9MoR2R-5wPShChCECaCfJSLRjc6Magobz7BNRMQ7sNtHwA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v3] package/iptables: add init script
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
Content-Type: multipart/mixed; boundary="===============1909646256153284692=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1909646256153284692==
Content-Type: multipart/alternative; boundary="00000000000001d33505cda9308c"

--00000000000001d33505cda9308c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 7:54 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Jos=C3=A9" =3D=3D Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com=
> writes:
>
> Hi,
>
>  >> Any special reason for the redirect? iptables-save / restor accepts a
>  >> filename argument.
>  >>
>
>  > Not from my side, I just didn't notice. I can
>
>  > change it for you if you want.
>
> Yes, please.
>
>
>  >> > +            echo "Usage: $0 {start|stop|restart|reload}"
>  >>
>  >> NIT: This doesn't document the save argument.
>  >>
>
>  > Very true, please let me know and I'm happy to send a v3
>
>  > tomorrow with those stuff.
>
> Ehh, this was already v3 and it was applied, so you will need to send a
> followup patch changing the script instead.
>

Just sent, thanks!


Jos=C3=A9.

--00000000000001d33505cda9308c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 7:54 PM Peter =
Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
;&gt;&gt;&gt;&gt; &quot;Jos=C3=A9&quot; =3D=3D Jos=C3=A9 Pekkarinen &lt;<a =
href=3D"mailto:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarine=
n@unikie.com</a>&gt; writes:<br>
<br>
Hi,<br>
<br>
=C2=A0&gt;&gt; Any special reason for the redirect? iptables-save / restor =
accepts a<br>
=C2=A0&gt;&gt; filename argument.<br>
=C2=A0&gt;&gt; <br>
<br>
=C2=A0&gt; Not from my side, I just didn&#39;t notice. I can<br>
<br>
=C2=A0&gt; change it for you if you want.<br>
<br>
Yes, please.<br>
<br>
<br>
=C2=A0&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;U=
sage: $0 {start|stop|restart|reload}&quot;<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; NIT: This doesn&#39;t document the save argument.<br>
=C2=A0&gt;&gt; <br>
<br>
=C2=A0&gt; Very true, please let me know and I&#39;m happy to send a v3<br>
<br>
=C2=A0&gt; tomorrow with those stuff.<br>
<br>
Ehh, this was already v3 and it was applied, so you will need to send a<br>
followup patch changing the script instead.<br></blockquote><div><br></div>=
</div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div =
class=3D"gmail_quote"><div>Just sent, thanks!=C2=A0</div></div></blockquote=
><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquot=
e style=3D"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blo=
ckquote></div></div></div>

--00000000000001d33505cda9308c--

--===============1909646256153284692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1909646256153284692==--
