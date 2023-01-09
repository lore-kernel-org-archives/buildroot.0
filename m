Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC73DC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD5281E50;
	Mon,  9 Jan 2023 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD5281E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qYaHYndmup0; Mon,  9 Jan 2023 17:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AAB81E58;
	Mon,  9 Jan 2023 17:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AAB81E58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21E3A1BF2F8
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 17:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09226408F8
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 17:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09226408F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wC8AynmMQPbc for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 17:42:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A8040236
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89A8040236
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 17:42:05 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gh17so22071343ejb.6
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 09:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQWPPHdth3XMZrOHwDsbY0lA7xthEgJxUv9sXJVwNc4=;
 b=wYDdUagPs4jfzRwFLmX80UzLwzEgYMAP0AyKCBtlXFz1D7Vro9UDZmisjYRZ+5dMVN
 WgQMH78HhovgcdYJ9/Tx6NwRfUH5Kyl+AYd+qXbSF3Vj/abZZPvWLGMcCPWruhtO4Bsi
 R2b+iYjpHHABkYTMOrTKonjkugPkKBkeGG2RPNUbcMvOGTVZB/52JjePXJF7xa4kqP6V
 KocL+VfmLYFAmp5RiznyWDEMBUSy0PJqHPzVRhYAtaAUOnSu+eh2CUH+Cl1Aoa5yz1IL
 HYZeoUcckFad0wvASFuESoK3FmnyeFfbJIcOYBkKK4nuHs5Lh4rha/4a14J7hDGTWbA9
 hzEQ==
X-Gm-Message-State: AFqh2kqyU73p+JRR45MusDPXbC4+X0TZ76rDg5laOLrLJC/Ch3ooV1w3
 5IybsTELMQxVhiWHmVO6sF/ANWyGTdm7gbfnv9Y=
X-Google-Smtp-Source: AMrXdXtlUirDoEaUNpS/gEZioriYoG+M3dq8iDEinO5B32Ws64p4zizO3Hv6Re9G5BqVMz7+/MfB6PIv08sAjYn3/NM=
X-Received: by 2002:a17:906:28d5:b0:844:44e0:1c4e with SMTP id
 p21-20020a17090628d500b0084444e01c4emr4844580ejd.291.1673286123626; Mon, 09
 Jan 2023 09:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20230109004748.1372-1-ckhardin@gmail.com>
 <CADvTj4rTjzyLAYRe0dO+=9=ZmX1odPjDFjs6mN_fwd62Z8ac8w@mail.gmail.com>
 <CAN=fXj0kB6ys61DqspLtG6_ipD-CVYigxDwaseofsvOUwWZTrA@mail.gmail.com>
In-Reply-To: <CAN=fXj0kB6ys61DqspLtG6_ipD-CVYigxDwaseofsvOUwWZTrA@mail.gmail.com>
From: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 9 Jan 2023 09:41:52 -0800
Message-ID: <CAN=fXj140d4Rdh2ybw=wP-evB34PTTqz6qNpue=4JPrahu8dOQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fQWPPHdth3XMZrOHwDsbY0lA7xthEgJxUv9sXJVwNc4=;
 b=RL8e3FlJQTFiEvNcT/eutnXWN6vZvcoUJARzoy7O/XI/xPgdTPrFcd2vd/kn2/1TNp
 vGxMcDhqnY1aYs7DKqogGZ1qp4Cwb3hh8/GI3DeFNNEVz6n1zZxNNj3vUCf1jPEIa5aQ
 C/sWLxgcUrrVj+xyU8dozY1ShTgvDrxFckb75ol07H9GDmGhUa7bkwNUfmQxT7BAm6qI
 loc1pcytQ7WNv+7r/KAIcs9gh9DbxMkQTA71VelvU/fjpInEyzMJ7L1sB+QgqldAFz35
 HkakjOC32L8a8pY3M5XBtjeRMNYfBv9ImLKyGwcqKKRxLYRTOqpAYnqAQbetYPhZ89LL
 +0bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RL8e3FlJ
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: additional
 dependencies for rebuild/reconfigure
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8583443359678337106=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8583443359678337106==
Content-Type: multipart/alternative; boundary="00000000000001a4b805f1d84981"

--00000000000001a4b805f1d84981
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 8, 2023 at 6:21 PM Charles Hardin <ckhardin@gmail.com> wrote:

> inline
>
> On Sun, Jan 8, 2023 at 5:58 PM James Hilliard <james.hilliard1@gmail.com>
> wrote:
>
>> On Sun, Jan 8, 2023 at 5:48 PM Charles Hardin <ckhardin@gmail.com> wrote:
>> >
>> > While testing incremental changes for a kernel build using the
>> > LINUX_OVERRIDE_SRCDIR, the following behavior was observed.
>> >
>> > - edit a file in the kernel tree and save
>> > - make linux-rebuild for buildroot to pickup the changes
>> > - rsync occurrs and then the install target is run (no build)
>> > - run make linux-rebuild a second time and the build is compiled and run
>> >
>> > To get the changes in on the first invocation of the rebuild requires
>> > a dependency on the build target to re-evaluate the stamp dependencies
>> > after the remove. This is a function of make dependency order evaluation
>> > so that the install steps will see the missing the install stamp but
>> > that evaluation doesn't require the rebuild because of the file being
>> > removed internally on the evaluation.
>> >
>> > Explicit $(1)-build and $(1)-configure deps are added that will evaluate
>> > after the cleans remove the stamps and cause them to be re-invoked.
>>
>> This isn't correct from my understanding as you aren't actually specifying
>> the above described execution order.
>>
>> I think this should more correctly fix the issue:
>>
>> https://patchwork.ozlabs.org/project/buildroot/patch/20221018034605.800593-1-james.hilliard1@gmail.com/
>>
>>
> Yup, the evaluation is dependent on the make behavior in the parallel
> prereq - tried the double colon rules and those work as expected - the
> rebuild will trigger the build and install and the reconfigure will do the
> configure, build, install steps.
>
>

Oh - I thought that double colon patch was already merged into mainline. It
is pretty useful to be able to use rebuild and reconfigure on systems for a
bit quicker turnaround.

The testing we use is pretty simple.

touch arm64/kernel/setup.c in the local linux directory
make linux-rebuild

Will see the "Building" notification with that patch - without it will just
rsync and then "Installing"
Watch the CC arm64/kernel/setup in the build

The rest proceeds as expected with Installing - etc.


> >
>> > Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>> > ---
>> >  package/pkg-generic.mk | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> > index f2bea01d7d..da99d9622a 100644
>> > --- a/package/pkg-generic.mk
>> > +++ b/package/pkg-generic.mk
>> > @@ -1062,12 +1062,12 @@ $(1)-reinstall:
>>  $(1)-clean-for-reinstall $(1)
>> >  $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>> >                         rm -f $$($(2)_TARGET_BUILD)
>> >
>> > -$(1)-rebuild:          $(1)-clean-for-rebuild $(1)
>> > +$(1)-rebuild:          $(1)-clean-for-rebuild $(1)-build $(1)
>>
>> You aren't actually specifying that $(1)-clean-for-rebuild runs before
>> $(1)-build but rather are specifying that the $(1)-build target can be
>> executed in parallel to the $(1)-clean-for-rebuild and $(1) targets.
>>
>> Parallel targets can effectively be executed in any arbitrary order and/or
>> at the same time.
>>
> >
>> >  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>> >                         rm -f $$($(2)_TARGET_CONFIGURE)
>> >
>> > -$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)
>> > +$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)-configure
>> $(1)-build $(1)
>> >
>> >  # define the PKG variable for all targets, containing the
>> >  # uppercase package variable prefix
>> > --
>> > 2.24.3 (Apple Git-128)
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--00000000000001a4b805f1d84981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Jan 8, 2023 at 6:21 PM Charles Hardin &lt=
;<a href=3D"mailto:ckhardin@gmail.com">ckhardin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr">inline</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sun, Jan 8, 2023 at 5:58 PM James Hilliard &lt;<a =
href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">james.hilliard1=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, Jan 8, 2023 at 5:48 PM Charles Hardin &lt;<a href=3D"mai=
lto:ckhardin@gmail.com" target=3D"_blank">ckhardin@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; While testing incremental changes for a kernel build using the<br>
&gt; LINUX_OVERRIDE_SRCDIR, the following behavior was observed.<br>
&gt;<br>
&gt; - edit a file in the kernel tree and save<br>
&gt; - make linux-rebuild for buildroot to pickup the changes<br>
&gt; - rsync occurrs and then the install target is run (no build)<br>
&gt; - run make linux-rebuild a second time and the build is compiled and r=
un<br>
&gt;<br>
&gt; To get the changes in on the first invocation of the rebuild requires<=
br>
&gt; a dependency on the build target to re-evaluate the stamp dependencies=
<br>
&gt; after the remove. This is a function of make dependency order evaluati=
on<br>
&gt; so that the install steps will see the missing the install stamp but<b=
r>
&gt; that evaluation doesn&#39;t require the rebuild because of the file be=
ing<br>
&gt; removed internally on the evaluation.<br>
&gt;<br>
&gt; Explicit $(1)-build and $(1)-configure deps are added that will evalua=
te<br>
&gt; after the cleans remove the stamps and cause them to be re-invoked.<br=
>
<br>
This isn&#39;t correct from my understanding as you aren&#39;t actually spe=
cifying<br>
the above described execution order.<br>
<br>
I think this should more correctly fix the issue:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20221018034=
605.800593-1-james.hilliard1@gmail.com/" rel=3D"noreferrer" target=3D"_blan=
k">https://patchwork.ozlabs.org/project/buildroot/patch/20221018034605.8005=
93-1-james.hilliard1@gmail.com/</a><br>
<br></blockquote><div><br></div><div>Yup, the evaluation is dependent on th=
e make behavior in the parallel prereq - tried the double colon rules and t=
hose work as expected - the rebuild will trigger the build and install and =
the reconfigure will do the configure, build, install steps.</div><div>=C2=
=A0</div></div></div></blockquote><div><br></div><div>Oh - I thought that d=
ouble colon patch was already merged into mainline. It is pretty useful to =
be able to use rebuild and reconfigure on systems for a bit quicker turnaro=
und.</div><div><br></div><div>The testing we use is pretty simple.</div><di=
v><br></div><div>touch arm64/kernel/setup.c in the local linux directory</d=
iv><div>make linux-rebuild</div><div><br></div><div>Will see the &quot;Buil=
ding&quot; notification with that patch - without it will just rsync and th=
en &quot;Installing&quot;</div><div>Watch the CC arm64/kernel/setup in the =
build</div><div><br></div><div>The rest proceeds as expected with Installin=
g - etc.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: Charles Hardin &lt;<a href=3D"mailto:ckhardin@gmail.com=
" target=3D"_blank">ckhardin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" tar=
get=3D"_blank">pkg-generic.mk</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferr=
er" target=3D"_blank">pkg-generic.mk</a> b/package/<a href=3D"http://pkg-ge=
neric.mk" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk</a><br>
&gt; index f2bea01d7d..da99d9622a 100644<br>
&gt; --- a/package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" tar=
get=3D"_blank">pkg-generic.mk</a><br>
&gt; +++ b/package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" tar=
get=3D"_blank">pkg-generic.mk</a><br>
&gt; @@ -1062,12 +1062,12 @@ $(1)-reinstall:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$(1)-clean-for-reinstall $(1)<br>
&gt;=C2=A0 $(1)-clean-for-rebuild: $(1)-clean-for-reinstall<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0rm -f $$($(2)_TARGET_BUILD)<br>
&gt;<br>
&gt; -$(1)-rebuild:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-clean-for-rebuil=
d $(1)<br>
&gt; +$(1)-rebuild:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-clean-for-rebuil=
d $(1)-build $(1)<br>
<br>
You aren&#39;t actually specifying that $(1)-clean-for-rebuild runs before<=
br>
$(1)-build but rather are specifying that the $(1)-build target can be<br>
executed in parallel to the $(1)-clean-for-rebuild and $(1) targets.<br>
<br>
Parallel targets can effectively be executed in any arbitrary order and/or<=
br>
at the same time.<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;<br>
&gt;=C2=A0 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0rm -f $$($(2)_TARGET_CONFIGURE)<br>
&gt;<br>
&gt; -$(1)-reconfigure:=C2=A0 =C2=A0 =C2=A0 $(1)-clean-for-reconfigure $(1)=
<br>
&gt; +$(1)-reconfigure:=C2=A0 =C2=A0 =C2=A0 $(1)-clean-for-reconfigure $(1)=
-configure $(1)-build $(1)<br>
&gt;<br>
&gt;=C2=A0 # define the PKG variable for all targets, containing the<br>
&gt;=C2=A0 # uppercase package variable prefix<br>
&gt; --<br>
&gt; 2.24.3 (Apple Git-128)<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000001a4b805f1d84981--

--===============8583443359678337106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8583443359678337106==--
