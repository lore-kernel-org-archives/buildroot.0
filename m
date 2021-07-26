Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09975C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FB460BBB
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89FB460BBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 506F983438;
	Mon, 26 Jul 2021 05:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7_O_JDSYY9l; Mon, 26 Jul 2021 05:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A3183410;
	Mon, 26 Jul 2021 05:29:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 045421BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE89183410
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_rPh-I-efPJ for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 05:29:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7DF7830FB
 for <buildroot@busybox.net>; Mon, 26 Jul 2021 05:29:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id go31so850685ejc.6
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V48FHg3Dsu3hHO5XWzdlEr8VwSX4ArNIh3kD4VIzqxk=;
 b=g+hNixfC8PmM59C/goITOrkyRva2AJ2WxdlZzvPCy0KXEAAhnOk0P2M9UclSdgckER
 hdDYFsTO5idd97922+V2PMwZMR5RcWN7rGabpoKeN8cOQfZc9P4Tc48ogzcz4uLiDqgO
 RF8Q/s2Y9sKRLj/smg/PuNOWDbtt3RwKa2h4W+ugI8Vfb1A18/OTMB3ibgmPAIEoVTrT
 CkPflLuSh7vpYBMLbOD+cPcrtwpoFOc94d7Hsg4vtL5Eyf7mjQ8tBkjzx7UTK2EWPLVh
 a+T30ZJjNblpF1Qu62RwzFs0S7S2JzLzzt0RXNHyZqms7Aee5bvhGAfJc/UoNOstnAfF
 Lozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V48FHg3Dsu3hHO5XWzdlEr8VwSX4ArNIh3kD4VIzqxk=;
 b=O3bhuMu5Jx/LNa4NZeX5I3AUw4ioDtZkfkzhlURv93eD8IeH9pnA6gcosiTEMmYJHd
 XPTZH/k6isoyMYqfE8kzVCxwNZKx90YET/oFjyABHz97euukL3VMwmLgX60E6uy1M77X
 cIPgSf9QFectaaRPv8en7ZbeotWmebtaCjWblR9okn2lHwhmGlJwHMZS1nXlkuQxo4hy
 tL7U9l3K4Jf3s6v3o/Pw1zPPpP/+cuC61PCCr6Bm/bDJiQ5g+1Ymcv7WH77Q2QE7Y69i
 XjDfdVnIVAP3OuBjma0EPbbPvzIQ/uk/V73ccvJIyOv8m6cXFOlB7MZzB73rW12iU8md
 MgGw==
X-Gm-Message-State: AOAM531yZhCfV9vAM4x3ymozmwFOAt0RAJAe6jo1ISRvzCdQPTnNpPF+
 Z52gv8oTxb6Zafqx/G7oyUMhSj+5hcezFOt7XQJ7cQ==
X-Google-Smtp-Source: ABdhPJz+Gv9sTcbXPwVwYgEFrlcAXplPskMe9PdGPYChp+WflPcX46NIaLxYF2x41Bd4zk5V28fDY3pCGR1WmHRF8TU=
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr1668099ejr.131.1627277386818; 
 Sun, 25 Jul 2021 22:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
 <20210724233627.25e8ab13@windsurf>
In-Reply-To: <20210724233627.25e8ab13@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 26 Jul 2021 08:29:36 +0300
Message-ID: <CAJPV9MpuyS6oeM_quw=E16ergH52ZXV=XWFSiyGJ4DpS4pSxnQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] Fix restorecond startup for sysvinit builds
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============5064431438749815327=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5064431438749815327==
Content-Type: multipart/alternative; boundary="00000000000097c1b805c8000a45"

--00000000000097c1b805c8000a45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 25, 2021 at 12:36 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Fri, 23 Jul 2021 15:47:54 +0300
> Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > Currently restorecond init script sources the
> > file /etc/rc.d/init.d/functions, that in some
> > init systems, like sysvinit, may not be available,
> > however, it doesn't actually uses any function
> > from it.
> >
> > Also, the init script uses daemon, that is not
> > marked as a dependency. So this patches adds its
> > dependency to guarantee it's present in the build.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>
> Thanks for this patch. However, if we are going to use our own init
> script for restorecond, it should follow our "model" for init scripts,
> package/busybox/S01syslogd. This means it should use start-stop-daemon,
> instead of daemon, if possible.
>

Thanks for the comment, this is the minor effort approach to

make the upstream init script work, rewriting in with start-stop-daemon
is certainly something possible, I'll see what I can do in that direction.

Best regards.


Jos=C3=A9.

--00000000000097c1b805c8000a45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 25, 2021 at 12:36 AM Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Fri, 23 Jul 2021 15:47:54 +0300<br>
Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" targ=
et=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
<br>
&gt; Currently restorecond init script sources the<br>
&gt; file /etc/rc.d/init.d/functions, that in some<br>
&gt; init systems, like sysvinit, may not be available,<br>
&gt; however, it doesn&#39;t actually uses any function<br>
&gt; from it.<br>
&gt; <br>
&gt; Also, the init script uses daemon, that is not<br>
&gt; marked as a dependency. So this patches adds its<br>
&gt; dependency to guarantee it&#39;s present in the build.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
<br>
Thanks for this patch. However, if we are going to use our own init<br>
script for restorecond, it should follow our &quot;model&quot; for init scr=
ipts,<br>
package/busybox/S01syslogd. This means it should use start-stop-daemon,<br>
instead of daemon, if possible.<br></blockquote><div><br></div></div><block=
quote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gma=
il_quote"><div>Thanks for the comment, this is the minor effort approach to=
</div></div></blockquote>make the upstream init script work, rewriting in w=
ith start-stop-daemon<div>is certainly something possible, I&#39;ll see wha=
t I can do in that direction.</div><div><br></div><div><blockquote style=3D=
"margin:0 0 0 40px;border:none;padding:0px"><div>Best regards.</div></block=
quote></div><div><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"=
>Jos=C3=A9.</blockquote></div></div></div></div>

--00000000000097c1b805c8000a45--

--===============5064431438749815327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5064431438749815327==--
