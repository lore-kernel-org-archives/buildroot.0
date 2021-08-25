Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36965C4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 11:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A906113C
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 11:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9A906113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8717C613AD;
	Wed, 25 Aug 2021 11:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uU1LBPZHH5T; Wed, 25 Aug 2021 11:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287A1613B9;
	Wed, 25 Aug 2021 11:33:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8020E1BF873
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 11:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75E2D81BC6
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 11:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCzs-VRX31KB for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 11:33:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5308882479
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 11:33:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id n27so18891416eja.5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 04:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7zb/DtmWZ/l39tMg3i9Vq1oddaIQvHDVYl7SJ3FX8c=;
 b=Mt8l0UNys6J/k/w9Hd0rDBvwLhX0nCiR1hj5ur3ffkuJEvp5qg2EKODcTsJs2DD+n0
 cRrr5lXCFRY5zo7S8syljas7088/jsVaJdPh3bO5Z0abneSD9jwN/4pIY+9fcnaH5nwg
 u8yAswUKui4joRsOe6KufqnFPjHecY7mpUjF76V4hP65gXyMHA4AEHUrlXTUgN03vH10
 g0F7VGTwF/ncaFooMPrZyN0uCYJOSY2v13CKOqf21SKth6ZmxOqKfMUP+k0QSgRQrODj
 9gX/yNdDxAOotOVe2t7KB3JzeCExZ5yKlkJjLzT8R4orVgvSLaNKt+mAZn0N9eVdWGYu
 FKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7zb/DtmWZ/l39tMg3i9Vq1oddaIQvHDVYl7SJ3FX8c=;
 b=oe5od2F2cgvToXpyNBwdmKL86SiUAfXmZkpf4mctjogqEHN/WA9UxejOAJUL2ZjYZm
 aVKeCMiY4IiPTKnezFJ5dltD+Umke1cBfgyeN/qGe5E7yRGFiXhKwIrFNwMpW204JQMJ
 tMDlpI11iHPV1FwWXLIm1Vk2DjGMhGKdQO2+ANTUHHWEF/JzsreH68tDQSSBPnU2TQET
 +CFGFZPSaJOAyD3KzLWZtugZUyE7utyrkzUXg8PbY/I1xSJHT/x1o2cAG+vWYsHLR5PE
 E1DjqewoJslD6aDWSFZX8CJqh7A/Ap75FXlCLLQSCIEn03O8eO+8zY7FWvx0Tr0F2bff
 fbzw==
X-Gm-Message-State: AOAM533cfYgyXJA1283dUFcCRVoGgjvXjoeH0UBAkgadozi/taH2BZL4
 Lt5SpSWe0kVTmuPgbE2S5Zwt85ObocLRi0lAy/SgOg==
X-Google-Smtp-Source: ABdhPJw2Ist0bO/s+4dgxRTZGTqRsQEgACRMHnqHd753mBp/m1wJPHOnibnewLsGO4yJbKVbt0sLS8yns4274QT3FkI=
X-Received: by 2002:a17:907:92c:: with SMTP id
 au12mr10780664ejc.523.1629891221596; 
 Wed, 25 Aug 2021 04:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
 <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
 <20210820191656.GS27036@scaer>
 <DM2P110MB0105551AC77B57173ACEAAC0F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <DM2P110MB0105551AC77B57173ACEAAC0F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 25 Aug 2021 14:33:31 +0300
Message-ID: <CAJPV9MqR1ERA5dLyj6uKDHQ5GXGG5BH7bN6g98-eFXq+mK-5qw@mail.gmail.com>
To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Subject: Re: [Buildroot] [External] Re: [PATCH v2] package/libselinux: Add
 autorelabel for first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7019154219816633100=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7019154219816633100==
Content-Type: multipart/alternative; boundary="000000000000493fb505ca609f1a"

--000000000000493fb505ca609f1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 5:19 PM Weber, Matthew L Collins <
Matthew.Weber@collins.com> wrote:

> All,
>
> > From: Yann E. MORIN <yann.morin.1998@free.fr>
> > Sent: Friday, August 20, 2021 2:16 PM
> > To: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Adam Duskett <
> aduskett@gmail.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>
> > Subject: [External] Re: [Buildroot] [PATCH v2] package/libselinux: Add
> autorelabel for first boot
> >
> > Jos=C3=A9, All,
> >
> > +Matthew +Adam, our resident SELinux experts: questions for you toward
> > the end...
> >
> > (resend as I acutally forgot to add them)
> >
> > On 2021-08-20 15:19 +0300, Jos=C3=A9 Pekkarinen spake thusly:
> > > On Fri, Aug 20, 2021 at 12:05 AM Yann E. MORIN < [1]
> yann.morin.1998@free.fr> wrote:
> > > > On 2021-08-19 12:29 +0300, Jos=C3=A9 Pekkarinen spake thusly:
> > > > > Currently buildroot ship libselinux without triggering
> > > > > this option, which often shows inconsistencies between
> > > > > what the refpolicy defines as a label for a file and
> > > > > what the actual file has. Triggering an initial relabel
> > > > > would help activating enforcing state right away without
> > > > > requiring to enter it once in permissive and tweak the
> > > > > labels.
> > [--SNIP--]
> > > > Isn't this going to fail on read-only filesystems? Relabelling
> suposedly
> > > > requires that extended attributes be added/updated/removed, and tha=
t
> > > > requires a read-write filesystem...
> > > > Can't we do the re-labelling at the time we create the filesystem,
> i.e.
> > > > in fs/common.mk?
> > > > And it seems we already have that:
> > [--SNIP--]
> > > > So why is the labelling wrong? Can't we fix it right there rather
> than
> > > > at runtime?
> > > It's is not wrong, it was just unnoticed by my eyeballs,
> >
> > :-)
> >
> > > however, there is a case this is not covering properly and preventing
> > > the userspace to run right away in enforcing mode, because at
> > > this time not all files in /dev are populated, and running it in
> > > permissive mode multiple complains from selinux to the serial
> > > devices turn up. If you have some suggestions how we can
> > > improve this case, I'm happy to bring more changes.
> >
> > What I understand from your explanations, above, is that we have to hav=
e
> > some labels (i.e. extended attributes) set on files in /dev, or the
> > policy may reference objects that are not properly labeled.
>
> I've included a few background references on file context (Yann your
> assumptions on IRC were correct) [2] [3].
>
> What you guys have described is a feature missing in the current Buildroo=
t
> SELinux support.  A user would need to add their own script or call
> restorecon manually.  As a side note, the runtime tests only cover a
> permissive test case, so it would miss (PASS) that every boot "/dev" and
> other dynamic fs will need to be labeled.  Starting in Linux 5.13, there =
is
> a feature called "genfscon" (thank you Android) which can handle this via
> refpolicy filtering out
> (proc/debugfs/tracefs/binder/bpf/pstroe/sysfs/cgroup/cgroup) mounts and
> doing the labeling dynamically without a restorecon being commanded from
> userspace.  However, you can see that "/dev" isn't on that list, so we ne=
ed
> an init script.
>
> I think the fix is this proposed .autorelabel menu option.  Plus, we need
> to include an old script [1] I had submitted which has been tailored for
> Buildroot and handles memory filesystems, initial SELinux setup, and
> .autorelabel.  Sorry, it is in the middle of a whole lot of other patchin=
g
> noise, search for "b/package/refpolicy/S00selinux".
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/1458128701-14841-1-g=
it-send-email-niranjan.reddy@rockwellcollins.com/
> [2]
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/=
html/security-enhanced_linux/chap-security-enhanced_linux-selinux_contexts#=
:~:text=3DProcesses%20and%20files%20are%20labeled,to%20make%20access%20cont=
rol%20decisions
> .
> [3] https://flylib.com/books/en/2.803.1.75/1/
>
> Best Regards,
> Matt Weber


Hi,

I'm afraid the init script may not work since it

references paths only existing in Centos, not in buildroot
userspace(specifically, /usr/share/selinux/ and
/selinux/enforce). However, we could use it to add the
missing pieces of autorelabel for the restorecond init script
or fix it and submit it. I'm happy to go for it, I'd like to hear
what the upstream point of view is.

Thanks!


Jos=C3=A9.

--000000000000493fb505ca609f1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 23, 2021 at 5:19 PM Weber=
, Matthew L                            Collins &lt;<a href=3D"mailto:Matthe=
w.Weber@collins.com">Matthew.Weber@collins.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">All,<br>
<br>
&gt; From: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" tar=
get=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
&gt; Sent: Friday, August 20, 2021 2:16 PM<br>
&gt; To: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.=
com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a> &lt;<a href=3D"mailto:buildroot@buildroot.org" targe=
t=3D"_blank">buildroot@buildroot.org</a>&gt;; Adam Duskett &lt;<a href=3D"m=
ailto:aduskett@gmail.com" target=3D"_blank">aduskett@gmail.com</a>&gt;; Web=
er, Matthew L Collins &lt;<a href=3D"mailto:Matthew.Weber@collins.com" targ=
et=3D"_blank">Matthew.Weber@collins.com</a>&gt;<br>
&gt; Subject: [External] Re: [Buildroot] [PATCH v2] package/libselinux: Add=
 autorelabel for first boot<br>
&gt; =C2=A0<br>
&gt; Jos=C3=A9, All,<br>
&gt;<br>
&gt; +Matthew +Adam, our resident SELinux experts: questions for you toward=
<br>
&gt; the end...<br>
&gt;<br>
&gt; (resend as I acutally forgot to add them)<br>
&gt;<br>
&gt; On 2021-08-20 15:19 +0300, Jos=C3=A9 Pekkarinen spake thusly:<br>
&gt; &gt; On Fri, Aug 20, 2021 at 12:05 AM Yann E. MORIN &lt; [1]<a href=3D=
"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr<=
/a>&gt; wrote:<br>
&gt; &gt; &gt; On 2021-08-19 12:29 +0300, Jos=C3=A9 Pekkarinen spake thusly=
:<br>
&gt; &gt; &gt; &gt; Currently buildroot ship libselinux without triggering<=
br>
&gt; &gt; &gt; &gt; this option, which often shows inconsistencies between<=
br>
&gt; &gt; &gt; &gt; what the refpolicy defines as a label for a file and<br=
>
&gt; &gt; &gt; &gt; what the actual file has. Triggering an initial relabel=
<br>
&gt; &gt; &gt; &gt; would help activating enforcing state right away withou=
t<br>
&gt; &gt; &gt; &gt; requiring to enter it once in permissive and tweak the<=
br>
&gt; &gt; &gt; &gt; labels.<br>
&gt; [--SNIP--]<br>
&gt; &gt; &gt; Isn&#39;t this going to fail on read-only filesystems? Relab=
elling suposedly<br>
&gt; &gt; &gt; requires that extended attributes be added/updated/removed, =
and that<br>
&gt; &gt; &gt; requires a read-write filesystem...<br>
&gt; &gt; &gt; Can&#39;t we do the re-labelling at the time we create the f=
ilesystem, i.e.<br>
&gt; &gt; &gt; in fs/<a href=3D"http://common.mk" rel=3D"noreferrer" target=
=3D"_blank">common.mk</a>?<br>
&gt; &gt; &gt; And it seems we already have that:<br>
&gt; [--SNIP--]<br>
&gt; &gt; &gt; So why is the labelling wrong? Can&#39;t we fix it right the=
re rather than<br>
&gt; &gt; &gt; at runtime?<br>
&gt; &gt; It&#39;s is not wrong, it was just unnoticed by my eyeballs,<br>
&gt;<br>
&gt; :-)<br>
&gt;<br>
&gt; &gt; however, there is a case this is not covering properly and preven=
ting<br>
&gt; &gt; the userspace to run right away in enforcing mode, because at<br>
&gt; &gt; this time not all files in /dev are populated, and running it in<=
br>
&gt; &gt; permissive mode multiple complains from selinux to the serial<br>
&gt; &gt; devices turn up. If you have some suggestions how we can<br>
&gt; &gt; improve this case, I&#39;m happy to bring more changes.<br>
&gt;<br>
&gt; What I understand from your explanations, above, is that we have to ha=
ve<br>
&gt; some labels (i.e. extended attributes) set on files in /dev, or the<br=
>
&gt; policy may reference objects that are not properly labeled.<br>
<br>
I&#39;ve included a few background references on file context (Yann your as=
sumptions on IRC were correct) [2] [3].<br>
<br>
What you guys have described is a feature missing in the current Buildroot =
SELinux support.=C2=A0 A user would need to add their own script or call re=
storecon manually.=C2=A0 As a side note, the runtime tests only cover a per=
missive test case, so it would miss (PASS) that every boot &quot;/dev&quot;=
 and other dynamic fs will need to be labeled.=C2=A0 Starting in Linux 5.13=
, there is a feature called &quot;genfscon&quot; (thank you Android) which =
can handle this via refpolicy filtering out=C2=A0 (proc/debugfs/tracefs/bin=
der/bpf/pstroe/sysfs/cgroup/cgroup) mounts and doing the labeling dynamical=
ly without a restorecon being commanded from userspace.=C2=A0 However, you =
can see that &quot;/dev&quot; isn&#39;t on that list, so we need an init sc=
ript.<br>
<br>
I think the fix is this proposed .autorelabel menu option.=C2=A0 Plus, we n=
eed to include an old script [1] I had submitted which has been tailored fo=
r Buildroot and handles memory filesystems, initial SELinux setup, and .aut=
orelabel.=C2=A0 Sorry, it is in the middle of a whole lot of other patching=
 noise, search for &quot;b/package/refpolicy/S00selinux&quot;.<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/1458128=
701-14841-1-git-send-email-niranjan.reddy@rockwellcollins.com/" rel=3D"nore=
ferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/pa=
tch/1458128701-14841-1-git-send-email-niranjan.reddy@rockwellcollins.com/</=
a><br>
[2] <a href=3D"https://access.redhat.com/documentation/en-us/red_hat_enterp=
rise_linux/6/html/security-enhanced_linux/chap-security-enhanced_linux-seli=
nux_contexts#:~:text=3DProcesses%20and%20files%20are%20labeled,to%20make%20=
access%20control%20decisions" rel=3D"noreferrer" target=3D"_blank">https://=
access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/secur=
ity-enhanced_linux/chap-security-enhanced_linux-selinux_contexts#:~:text=3D=
Processes%20and%20files%20are%20labeled,to%20make%20access%20control%20deci=
sions</a>.<br>
[3] <a href=3D"https://flylib.com/books/en/2.803.1.75/1/" rel=3D"noreferrer=
" target=3D"_blank">https://flylib.com/books/en/2.803.1.75/1/</a><br>
<br>
Best Regards,<br>
Matt Weber</blockquote></div><br clear=3D"all"><div><blockquote style=3D"ma=
rgin:0 0 0 40px;border:none;padding:0px"><div>Hi,</div><div><br></div></blo=
ckquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><di=
v>I&#39;m afraid the init script may not work since it</div></blockquote>re=
ferences paths only existing in Centos, not in buildroot</div><div>userspac=
e(specifically, /usr/share/selinux/ and</div><div>/selinux/enforce). Howeve=
r, we could use it to add the</div><div>missing pieces of autorelabel for t=
he restorecond init script</div><div>or fix it and submit it. I&#39;m happy=
 to go for it, I&#39;d like to hear</div><div>what the upstream point of vi=
ew is.</div><div><br></div><div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px"><div>Thanks!</div></blockquote></div><br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:=
0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></di=
v></div>

--000000000000493fb505ca609f1a--

--===============7019154219816633100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7019154219816633100==--
