Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D6BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 12:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2816E6F66A;
	Fri,  1 Apr 2022 12:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdtfscIRWeLu; Fri,  1 Apr 2022 12:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D36360EC1;
	Fri,  1 Apr 2022 12:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEDE41BF308
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 12:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE05184313
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 12:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEPjn7aHPlr2 for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 12:29:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A44CE842F9
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 12:29:40 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id z6so3038584iot.0
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YsY4ScFmr9pGeNdwWvqcQ/ZAiyeBiFn7LhI/yT5EHc=;
 b=FMqtuTSHohMXYvSgsHAEkgmbtpPpWQ5w7KzfC9gAhx7THldd0eIcKmKg2IGGwTrQQh
 xzxpOqrLaTxA+2XcXl6tOS2vjLHCcLgYsucZAPq696Nvi4WFiKAwdHJNmo9NbKwfuAAA
 Cu3af1d+1q92+q3UnoF91bpgrxWarEU1HqKW046/Q1iswk6AUCaE09dB2Thb59YdJ5XE
 E/NUZwaVe/zJx8/+hToxgZmvb08A4ZLeAxTjCvpsJETEGsLr1Y9m0lNxuHzgdGgFzxr4
 mRjpACPBwlpsba4IJd0VjoZzACIe9tdQsubIV6bx5gtt8dmGFTxps70FpNA9E71idHuN
 WHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YsY4ScFmr9pGeNdwWvqcQ/ZAiyeBiFn7LhI/yT5EHc=;
 b=j08FuLLplJe8Fo2rWgvckiCmgzwflDAN19LkWjByeazT+ia8oA4p24HnuDA+LdP96T
 sh+tdNZUND6zm2IGPjXCh/ly3Zeg8tSoTSCSZxZwJlmcp6MKi2SHih8k86ZwTpNJZ4Ub
 NOYk+kUg2jnjiEDf29g6Au0mh7XguwFDLGAsuprpYYPrFa2K+/iTiBzmndYaWcPSf0Xr
 icIDUG4ddSEdUeZGlVmck3xT1JH6SUpuroXVt9ZxYk6CO/DYXakfyr6eUjRyHVdAVEFH
 lBp+cQVUa9FTTPEbdN7lY1dMDdgtV0i/QI/RZAioZ090dwmQA/0ZZRxmu9khr6lUqD3s
 QxnA==
X-Gm-Message-State: AOAM5310jjLOEqecaPCo2RIjGaiA8B3AdQhp/WD9nCznOuuJ4LZTpiJ2
 HUs4cEqjcAg5yaArVugtCUGDlQLA/sn6NUkBlhDZ8oi4tJw=
X-Google-Smtp-Source: ABdhPJx1zQRAhvBIcjqSxlHkA5QMgtwH84Iv7KV0JyLvfe/WuOJt0Rj0vIMdL4mV+sy2Z5nKGMxKZW8ZSZd68HP3zbQ=
X-Received: by 2002:a6b:6d0d:0:b0:64c:7a7d:558d with SMTP id
 a13-20020a6b6d0d000000b0064c7a7d558dmr11944575iod.42.1648816179725; Fri, 01
 Apr 2022 05:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
 <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
 <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
 <9271680c-ab96-f8c0-ff76-fea5e8e5d2ba@theobroma-systems.com>
In-Reply-To: <9271680c-ab96-f8c0-ff76-fea5e8e5d2ba@theobroma-systems.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 1 Apr 2022 14:29:28 +0200
Message-ID: <CADYjeSuEG=Qh3-=tQDUi9R_n5D8J1hV0PZGDQg7NvbCbEjy4gQ@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Content-Type: multipart/mixed; boundary="===============0459384005583404316=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0459384005583404316==
Content-Type: multipart/alternative; boundary="000000000000b14a4205db96ee50"

--000000000000b14a4205db96ee50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

I assume you need this at build time then since you are talking about
> binary for the host system. In that case, you need to add host-casync to
> your config.
>
> However, casync is currently a target-only package.
>

If I understand correctly, then as of now Buildroot can't be used to create
casync host package.

$(eval $(host-meson-package))
>
> at the end of the package/casync/casync.mk file.
>

I will try this solution.

But what could be the other alternative to work with casync?

Thanks in advance

On Fri, 1 Apr 2022 at 13:54, Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Sourabh,
>
> On 4/1/22 13:41, Sourabh Hegde wrote:
> > Hello Quentin,
> >
> > make casync
> >>
> >> if you want it in an image created by Buildroot, modify your config wi=
th
> >> make menuconfig and save your changes, then run make.
> >>
> >
> > But will this create binary for host system also? Sorry, its bit
> confusing
> > here.
> >
>
> No, host packages and target packages are compiled with a different
> keyword.
>
> make casync is for target package
> make host-casync is for host package
>
> > I need casync tool use with "rauc" as given in
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__rauc.readthedocs.i=
o_en_latest_advanced.html-23creating-2Dcasync-2Dbundles&d=3DDwIFaQ&c=3D_sEr=
5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZh=
kI_-172IIy1t&m=3DAiN2bNa5EFj79y22K554djuFBBXe_MMEIRS1-gwEsbw3ch69jBq4q9j0tm=
_wz1V8&s=3D6mSs1PkEXKk01AMnuQKyCAPV0A9euTiPrj_bP4mGHJ0&e=3D
> >
> > When I do "rauc convert --cert=3D<certfile> --key=3D<keyfile>
> > --keyring=3D<keyring> conventional-bundle.raucb casync-bundle.raucb"
> >
>
> I assume you need this at build time then since you are talking about
> binary for the host system. In that case, you need to add host-casync to
> your config.
>
> However, casync is currently a target-only package.
>
> To create a host package, you need at the very least to add:
>
> $(eval $(host-meson-package))
>
> at the end of the package/casync/casync.mk file.
>
> This might not be enough and might require some additional tweaks to the
> package makefile.
>
> Cheers,
> Quentin
>

--000000000000b14a4205db96ee50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Quentin,<div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">I assume you need this at build time then since y=
ou are talking about<br>binary for the host system. In that case, you need =
to add host-casync to<br>your config.<br><br>However, casync is currently a=
 target-only package.<br></blockquote><div><br></div><div>If I understand c=
orrectly, then as of now Buildroot can&#39;t be used to create casync host =
package.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">$(eval $(host-meson-package))<br><br>at the end of the package/c=
async/<a href=3D"http://casync.mk/" rel=3D"noreferrer" target=3D"_blank">ca=
sync.mk</a>=C2=A0file.<br></blockquote><div><br></div><div>I will try this =
solution.</div><div><br></div><div>But what could be the other=C2=A0alterna=
tive to work with casync?=C2=A0</div><div><br></div><div>Thanks in advance<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, 1 Apr 2022 at 13:54, Quentin Schulz &lt;<a href=3D"mailto:quen=
tin.schulz@theobroma-systems.com">quentin.schulz@theobroma-systems.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi So=
urabh,<br>
<br>
On 4/1/22 13:41, Sourabh Hegde wrote:<br>
&gt; Hello Quentin,<br>
&gt; <br>
&gt; make casync<br>
&gt;&gt;<br>
&gt;&gt; if you want it in an image created by Buildroot, modify your confi=
g with<br>
&gt;&gt; make menuconfig and save your changes, then run make.<br>
&gt;&gt;<br>
&gt; <br>
&gt; But will this create binary for host system also? Sorry, its bit confu=
sing<br>
&gt; here.<br>
&gt; <br>
<br>
No, host packages and target packages are compiled with a different keyword=
.<br>
<br>
make casync is for target package<br>
make host-casync is for host package<br>
<br>
&gt; I need casync tool use with &quot;rauc&quot; as given in<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__rauc=
.readthedocs.io_en_latest_advanced.html-23creating-2Dcasync-2Dbundles&amp;d=
=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1X=
TSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DAiN2bNa5EFj79y22K554djuFBBXe=
_MMEIRS1-gwEsbw3ch69jBq4q9j0tm_wz1V8&amp;s=3D6mSs1PkEXKk01AMnuQKyCAPV0A9euT=
iPrj_bP4mGHJ0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__rauc.readthedocs.io_en_latest_adva=
nced.html-23creating-2Dcasync-2Dbundles&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhu=
k4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-=
172IIy1t&amp;m=3DAiN2bNa5EFj79y22K554djuFBBXe_MMEIRS1-gwEsbw3ch69jBq4q9j0tm=
_wz1V8&amp;s=3D6mSs1PkEXKk01AMnuQKyCAPV0A9euTiPrj_bP4mGHJ0&amp;e=3D</a><br>
&gt; <br>
&gt; When I do &quot;rauc convert --cert=3D&lt;certfile&gt; --key=3D&lt;key=
file&gt;<br>
&gt; --keyring=3D&lt;keyring&gt; conventional-bundle.raucb casync-bundle.ra=
ucb&quot;<br>
&gt; <br>
<br>
I assume you need this at build time then since you are talking about <br>
binary for the host system. In that case, you need to add host-casync to <b=
r>
your config.<br>
<br>
However, casync is currently a target-only package.<br>
<br>
To create a host package, you need at the very least to add:<br>
<br>
$(eval $(host-meson-package))<br>
<br>
at the end of the package/casync/<a href=3D"http://casync.mk" rel=3D"norefe=
rrer" target=3D"_blank">casync.mk</a> file.<br>
<br>
This might not be enough and might require some additional tweaks to the <b=
r>
package makefile.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--000000000000b14a4205db96ee50--

--===============0459384005583404316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0459384005583404316==--
