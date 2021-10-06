Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B54BC433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:28:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0E160EC0
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB0E160EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B0283F55;
	Wed,  6 Oct 2021 06:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-wnhCZ-VeH1; Wed,  6 Oct 2021 06:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EBF583F53;
	Wed,  6 Oct 2021 06:28:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 769071BF25F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 666FE83F53
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0g9cNHLv056W for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:28:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A54183F50
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:28:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b8so5750132edk.2
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4bZUnVQSS5L8wiVc1qgOA94tjcGlRFc9WpZPI4EBwZg=;
 b=kpIQIBBm4YGPRuIaL7cuf5aQy4B0vBfyPJ0sJNlvB7mW79bQFtlmkC7iwnzpQsEWqW
 /xyeJY9FX/TIzU7YBTE+Bp11+/SGcMhCGCNvv89C0Y2Kj4HcJHtkdWc4RRWcPOFoTTUu
 1M/Pk1ap2pjaMezFzbMI7jKJH6KCII68w8UE8MsgscbTv6RImuIo9V+Q8k8tYEjx3RS2
 VKpQ5+Ds4sYet+WrbcYfRnUGKdVr58dJ5aV4yIxQc3iOqxVgEa/TGRLdyZfvz67CuLOX
 2GrAHLCHi4NyukxqN8vS43B5mZlp8eqz8UGwoO9D7LUh2OkK/ojaDB7tejfj0hwvYQ05
 mEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4bZUnVQSS5L8wiVc1qgOA94tjcGlRFc9WpZPI4EBwZg=;
 b=kMPEAgKPGjsPYZI+5+Ur8f+BY1TrCv5GkMoQVcncAluRY9zdCxfGoqB+OQheAy5+MP
 tTKbyPyYjRfwQqZ3ssiwgyB4ZXFskir8tteHhfrKwojDMh07R/JgLtrVGZTUQO/aqrf+
 5AKiH3QbiqafPA2qCQXTWSgAVp/i77e2DKvnQ7t39sylFZEMt3TYV1Gj/BvaKaNxsHA/
 ssQQOkDBTbkhszWpcrQdBMfGh4pVmf6q3f/RINYKwM8ZZCwg876tarTXdZGQwfjXRCDm
 a7WrTK+SuugakKTR33ml88MjluOlVQXyUafv4ks2iVKWc7KEDtyb/fRqJCSOMxeujjPG
 9Nlg==
X-Gm-Message-State: AOAM530w7mMiTLnxr+U/ad9S5M/izV+a59KLkLVQmgO2AtXwBpt2Bn2I
 ZWrLtj20pp3A4IMhDl6gsON2NkthphLD4jn7pmPKZg==
X-Google-Smtp-Source: ABdhPJxhHZ4K+Bk1CxfTNlm4QeOg5qgzV//xiAEsdGlMDMMm8uNX0kkuzQI9l0cGP9D2T8Pw4Bgqi6B3RjjFYFgAGXc=
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr29988276eju.254.1633501717692; 
 Tue, 05 Oct 2021 23:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
 <8ab0b36d-c9a4-1e61-96d1-f874127b3c1e@green-communications.fr>
In-Reply-To: <8ab0b36d-c9a4-1e61-96d1-f874127b3c1e@green-communications.fr>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 6 Oct 2021 09:28:27 +0300
Message-ID: <CAJPV9MrkZ5UOyXCqvh2K=zR7PQahS98GxbMyUnGKvfo9R2mvdQ@mail.gmail.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: Allow mesh
 configuration
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
Content-Type: multipart/mixed; boundary="===============8342550267542451002=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8342550267542451002==
Content-Type: multipart/alternative; boundary="0000000000009f9a0705cda94142"

--0000000000009f9a0705cda94142
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 11:37 AM Nicolas Cavallari <
nicolas.cavallari@green-communications.fr> wrote:

> On 22/09/2021 13:38, Jos=C3=A9 Pekkarinen wrote:
> > wpa_supplicant defconfig doesn't enable CONFIG_MESH
> > by default, and currently there is only a path to
> > disable it in buildroot. This patch will restore
> > the logic to enable it.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> > [ v1 -> v2 ] s/CONFIG__MESH/CONFIG_MESH/
> >
> >   package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/wpa_supplicant/wpa_supplicant.mk
> b/package/wpa_supplicant/wpa_supplicant.mk
> > index e9078b9f89..3c0b0c1dfc 100644
> > --- a/package/wpa_supplicant/wpa_supplicant.mk
> > +++ b/package/wpa_supplicant/wpa_supplicant.mk
> > @@ -104,7 +104,9 @@ else
> >   WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_WIFI_DISPLAY
> >   endif
> >
> > -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)
> > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
> > +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_MESH
> > +else
> >   WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_MESH
> >   endif
> >
> >
>
> Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> Acked-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>

Thanks Nicolas for double checking!

I haven't receive any comments nor signs

of this landing in the master, so please let me know
if you need anything to proceed with the patch.

Best regards.


Jos=C3=A9.

--0000000000009f9a0705cda94142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 29, 2021 at 11:37 AM Nico=
las Cavallari &lt;<a href=3D"mailto:nicolas.cavallari@green-communications.=
fr">nicolas.cavallari@green-communications.fr</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On 22/09/2021 13:38, Jos=C3=A9=
 Pekkarinen wrote:<br>
&gt; wpa_supplicant defconfig doesn&#39;t enable CONFIG_MESH<br>
&gt; by default, and currently there is only a path to<br>
&gt; disable it in buildroot. This patch will restore<br>
&gt; the logic to enable it.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt; [ v1 -&gt; v2 ] s/CONFIG__MESH/CONFIG_MESH/<br>
&gt; <br>
&gt;=C2=A0 =C2=A0package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.m=
k" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> b/package/wpa=
_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" target=
=3D"_blank">wpa_supplicant.mk</a><br>
&gt; index e9078b9f89..3c0b0c1dfc 100644<br>
&gt; --- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
&gt; +++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=
=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
&gt; @@ -104,7 +104,9 @@ else<br>
&gt;=C2=A0 =C2=A0WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_WIFI_DISPLAY<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)<br>
&gt; +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)<br>
&gt; +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_MESH<br>
&gt; +else<br>
&gt;=C2=A0 =C2=A0WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_MESH<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
Tested-by: Nicolas Cavallari &lt;<a href=3D"mailto:nicolas.cavallari@green-=
communications.fr" target=3D"_blank">nicolas.cavallari@green-communications=
.fr</a>&gt;<br>
Acked-by: Nicolas Cavallari &lt;<a href=3D"mailto:nicolas.cavallari@green-c=
ommunications.fr" target=3D"_blank">nicolas.cavallari@green-communications.=
fr</a>&gt;<br>
</blockquote></div><br clear=3D"all"><div><blockquote style=3D"margin:0 0 0=
 40px;border:none;padding:0px">Thanks Nicolas for double checking!<br><br>I=
 haven&#39;t receive any comments nor signs<br></blockquote>of this landing=
 in the master, so please let me know</div><div>if you need anything to pro=
ceed with the patch.</div><div><br></div><div><blockquote style=3D"margin:0=
 0 0 40px;border:none;padding:0px"><div>Best regards.</div></blockquote></d=
iv><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockqu=
ote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</b=
lockquote></div></div></div>

--0000000000009f9a0705cda94142--

--===============8342550267542451002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8342550267542451002==--
