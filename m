Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409CEC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 06:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFA860F4B
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 06:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAFA860F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A9E2400BB;
	Sun,  8 Aug 2021 06:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zo_u-iaF_PvR; Sun,  8 Aug 2021 06:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AA764012E;
	Sun,  8 Aug 2021 06:53:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4CE1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 06:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B444012E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 06:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQm-tDYHuB51 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 06:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B660F400BB
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 06:53:17 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id em4so7421450qvb.0
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AsUwx24tffRXfiuoWnsg8uHSC15TghKzk2qLxuuuNg8=;
 b=L74B2n2SqBw2UUMZ4IPimV9SWMKRhBmlTHidXwcu466yQhTHgEZKsiyWXdrWVavzXS
 TDughCJw9WbZzKr7BIPyUNldj8sPqfN7F3uVwWbsr8/8hR1+Jo6LATAQ6iBP9lhm1Elg
 5XF9gSpPF3TJ2mKSgxrJJ6FX/WdXW3jHIKm9hp7AVSWdt/aMcIQVU8iAtcFVsegeHzqy
 jgZ1BS9b7i1eLmqccwvw+lialVjsFzW28hLK0qoDNr4XOk5sJuGb0WqnJMvDleKlTOm2
 II4kakl24Wcyu1l9kvMCnyS4Rb4CYHLoKOtOPpD7TR4ec8R5sQcPCcJiFpcX268moPw/
 0VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AsUwx24tffRXfiuoWnsg8uHSC15TghKzk2qLxuuuNg8=;
 b=ntrdwGLe+QhZigOBv30v1e336ycyOnZydRcQWkal/FglBeWotYHQMIuelRQEMQZEO8
 CPyp2dnpyXhxokN5s3FYyyAAmZHdkD50vNMsgji8FVic6OBiix7V6T3UTXWRsEeZDO87
 olwZ4Gxa8UhWPZZix6OjCBGDilSClQi7kNMN749I4BRgT29vADJr3EKIO/8oQHqjMmjX
 Ee2C7b9GO4G/tOEGVg/XHrrrHthW2bZnIL7Qf5j0jSvQCHNeQnG6l4ID0d2mTnJ6ET29
 po/1meb5BxwQuhAfllg5RfgeJzluKpqtB7mBioiIzm0gbJbxHGA1o4Y+nk1G8KToLLqN
 XO4A==
X-Gm-Message-State: AOAM530f7QVtRH7mfBg33ajmTFO/hEi2MhKPwQWy6t0vzc64DJ6aE9H/
 DN6Dlvn5bdyAx7Xd0mdycEz9d05bAP29E7IppBJneIUSfEg=
X-Google-Smtp-Source: ABdhPJym3dQvWbIo4Ogusv/zNhJLMTn07v4gfYN4HvI5BKWujOFL2bX9uRF7khEw6SnCUQzBIYzYl98o7bCzhU4Jdms=
X-Received: by 2002:a05:6214:2a45:: with SMTP id
 jf5mr18682418qvb.25.1628405596365; 
 Sat, 07 Aug 2021 23:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACaKL1xhm-6xZFX3Qk27pbZbKiJJ6cN8TMgvhXJnEny5EVri_A@mail.gmail.com>
 <e59ce01b-a6cc-3904-98bd-70418088591d@mind.be>
 <CACaKL1wAxCZptaDqUxWdpx4VZTDisRRsOOvDC76HACjwg44kmA@mail.gmail.com>
 <5e535c6f-c555-6e3f-fcd9-21d0aa7e4021@mind.be>
In-Reply-To: <5e535c6f-c555-6e3f-fcd9-21d0aa7e4021@mind.be>
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Sun, 8 Aug 2021 09:53:05 +0300
Message-ID: <CACaKL1wXDQptFnQULDJKqEJgd4HuzQTO_hp7BDye=CO2uwOd_A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] Common header files / code between packages
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5911654577098202352=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5911654577098202352==
Content-Type: multipart/alternative; boundary="0000000000001f297f05c906b917"

--0000000000001f297f05c906b917
Content-Type: text/plain; charset="UTF-8"

Hi,
Thanks for the suggestion. I was also thinking to a library, as i didn't
like the "ugliness" of my first thought :(
Will go for that and populate the staging dir.

Thanks,
Jacques

On Thu, Aug 5, 2021 at 6:55 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Jacques,
>
>  Please reply with the list in Cc. The feedback may be useful for others
> as well.
>
>
> On 05/08/2021 14:46, Jacques Samoun wrote:
> > Thanks Arnout,
> >
> > this seems definitely a better way.
> >
> > Can i ask a subsidiary one: what if you want to share some code package.
> > For example, i crafted a specialized buffers package (1 C file + 1
> header file).
> >
> > Both the user space part and the  driver use this same code (as they
> share
> > buffers and handle them in a consumer/producer mode).
> > My current approach is just that each package gets a copy of this code,
> then it
> > is built.
> > Do you feel this is the right approach ?
>
>  Sharing code between packages is normally done by making it a library and
> installing it to STAGING_DIR. However, this is not possible for sharing
> code
> between the kernel (module) and userspace, because the compiler options for
> building it for the kernel are different from the ones used for userspace.
>
>  However, you could compile it twice as part of the kernel module build:
> once as
> part of the kernel module, and once more (probably in a different
> Makefile) to
> create the library. Then you install that library and it can be used by the
> userspace package.
>
>  It's not exactly trivial to do this (not really difficult either though).
> So if
> this is a private package, you may be better off just copying it, or
> sharing it
> through e.g. a git submodule. Or even just using it from the other's build
> directory, like you suggested before. Ugly but it works :-)
>
>  Regards,
>  Arnout
>
>
> >
> > Jacques
> >
> >
> > On Thu, Aug 5, 2021 at 1:15 PM Arnout Vandecappelle <arnout@mind.be
> > <mailto:arnout@mind.be>> wrote:
> >
> >
> >
> >     On 05/08/2021 09:15, Jacques Samoun wrote:
> >     > Hello,
> >     >
> >     > my development consists of a kernel driver and an companion user
> space layer.
> >     > They are build each in 2 separate packages. Using external tree
> build.
> >     >
> >     > The problem is, i would like to share some include files between
> both
> >     > package (kernel driver and user space layer).
> >     > So far, i solved that by adding a common folder containing the
> include files,
> >     > and making it part of each package, so it builds OK.
> >
> >      I think a more common way is for the kernel module package to also
> install the
> >     shared include files (to $(STAGING_DIR)/usr/include/linux).
> cryptodev-linux is
> >     an example of that.
> >
> >      It's even possible to make the kernel module package build the
> kernel module
> >     only if a kernel is built, and make it to install the headers
> regardless of
> >     whether a kernel is built. That way, you can have a buildroot
> configuration that
> >     only builds the userspace without kernel. fwts is an example of that
> (it doesn't
> >     install headers though).
> >
> >
> >
> >     >
> >     > Now, a third package, whose code is completely outside the first 2
> is willing
> >     > also to use this include file. The only way i found so far, is to
> put explicit
> >     > relative path referring from one package to the one other, but
> this is ugly.
> >     > Moreover, the path depends on the version of the packages, so can
> break
> >     easily.
> >     > There must be a better way (STAGING DIR ?)  but i couldn't find.
> >
> >      Install the headers to $(STAGING_DIR)/usr/include/linux (or
> /usr/include if
> >     that is more appropriate).
> >
> >
> >      Regards,
> >      Arnout
> >
> >     >
> >     > Can anybody give me an hint ?
> >     > Thanks,
> >     > Jacques
> >     >
> >     >
> >     >
> >     >
> >     >
> >     > _______________________________________________
> >     > buildroot mailing list
> >     > buildroot@busybox.net <mailto:buildroot@busybox.net>
> >     > http://lists.busybox.net/mailman/listinfo/buildroot
> >     <http://lists.busybox.net/mailman/listinfo/buildroot>
> >     >
> >
>

--0000000000001f297f05c906b917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>Thanks for the suggestion. I was also thinking to =
a library, as i didn&#39;t like the &quot;ugliness&quot; of my first though=
t=C2=A0:(</div><div>Will go for that and populate the staging dir.</div><di=
v><br></div><div>Thanks,</div><div>Jacques</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 6:55=
 PM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.=
be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">=C2=A0Hi Jacques,<br>
<br>
=C2=A0Please reply with the list in Cc. The feedback may be useful for othe=
rs as well.<br>
<br>
<br>
On 05/08/2021 14:46, Jacques Samoun wrote:<br>
&gt; Thanks Arnout,<br>
&gt; <br>
&gt; this seems definitely a better way.=C2=A0<br>
&gt; <br>
&gt; Can i ask a subsidiary=C2=A0one: what if you want to share some code p=
ackage.<br>
&gt; For example, i crafted a specialized buffers package (1 C file=C2=A0+ =
1 header file).<br>
&gt; <br>
&gt; Both the user space part and the=C2=A0 driver use this same code (as t=
hey share<br>
&gt; buffers and handle them in a consumer/producer mode).<br>
&gt; My current approach is just that each package gets a copy of this code=
, then it<br>
&gt; is built.<br>
&gt; Do you feel this is the right approach ?<br>
<br>
=C2=A0Sharing code between packages is normally done by making it a library=
 and<br>
installing it to STAGING_DIR. However, this is not possible for sharing cod=
e<br>
between the kernel (module) and userspace, because the compiler options for=
<br>
building it for the kernel are different from the ones used for userspace.<=
br>
<br>
=C2=A0However, you could compile it twice as part of the kernel module buil=
d: once as<br>
part of the kernel module, and once more (probably in a different Makefile)=
 to<br>
create the library. Then you install that library and it can be used by the=
<br>
userspace package.<br>
<br>
=C2=A0It&#39;s not exactly trivial to do this (not really difficult either =
though). So if<br>
this is a private package, you may be better off just copying it, or sharin=
g it<br>
through e.g. a git submodule. Or even just using it from the other&#39;s bu=
ild<br>
directory, like you suggested before. Ugly but it works :-)<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
<br>
&gt; <br>
&gt; Jacques<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Aug 5, 2021 at 1:15 PM Arnout Vandecappelle &lt;<a href=3D"mai=
lto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a><br>
&gt; &lt;mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@=
mind.be</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05/08/2021 09:15, Jacques Samoun wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; my development consists of a kernel driver and=
 an companion user space layer.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; They are build each in 2 separate packages. Us=
ing external=C2=A0tree build.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The problem is, i would like to share some inc=
lude files between both<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; package=C2=A0(kernel driver and user space lay=
er).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; So far, i solved that by adding a common folde=
r containing the include files,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and making it part of each package, so it buil=
ds OK.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0I think a more common way is for the kernel m=
odule package to also install the<br>
&gt;=C2=A0 =C2=A0 =C2=A0shared include files (to $(STAGING_DIR)/usr/include=
/linux). cryptodev-linux is<br>
&gt;=C2=A0 =C2=A0 =C2=A0an example of that.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0It&#39;s even possible to make the kernel mod=
ule package build the kernel module<br>
&gt;=C2=A0 =C2=A0 =C2=A0only if a kernel is built, and make it to install t=
he headers regardless of<br>
&gt;=C2=A0 =C2=A0 =C2=A0whether a kernel is built. That way, you can have a=
 buildroot configuration that<br>
&gt;=C2=A0 =C2=A0 =C2=A0only builds the userspace without kernel. fwts is a=
n example of that (it doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0install headers though).<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Now, a third package, whose code is completely=
 outside the first 2 is willing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; also to use this include file. The only way i =
found so far, is to put explicit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; relative path referring from one package to th=
e one other, but this is ugly.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Moreover, the path depends on the version of t=
he packages, so can break<br>
&gt;=C2=A0 =C2=A0 =C2=A0easily.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; There must be a better way (STAGING=C2=A0DIR ?=
)=C2=A0 but i couldn&#39;t find.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Install the headers to $(STAGING_DIR)/usr/inc=
lude/linux (or /usr/include if<br>
&gt;=C2=A0 =C2=A0 =C2=A0that is more appropriate).<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Arnout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can anybody give me an hint ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Jacques<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ______________________________________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"mailto:buildroot@busybox.net" targe=
t=3D"_blank">buildroot@busybox.net</a> &lt;mailto:<a href=3D"mailto:buildro=
ot@busybox.net" target=3D"_blank">buildroot@busybox.net</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"http://lists.busybox.net/mailman/li=
stinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox=
.net/mailman/listinfo/buildroot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.busybox.net/mailman/lis=
tinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.=
net/mailman/listinfo/buildroot</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
</blockquote></div>

--0000000000001f297f05c906b917--

--===============5911654577098202352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5911654577098202352==--
