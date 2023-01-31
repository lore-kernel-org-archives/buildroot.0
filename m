Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2662DC636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 21:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B112B60C30;
	Tue, 31 Jan 2023 21:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B112B60C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CH3eYsfG317O; Tue, 31 Jan 2023 21:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0601D60B69;
	Tue, 31 Jan 2023 21:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0601D60B69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01DF41BF215
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 21:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF4704186B
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 21:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4704186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwW7d6u7IaMW for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 21:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C824186A
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04C824186A
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:59:10 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s67so11095304pgs.3
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 13:59:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZmQpqQ+3HQfftCUrooyaywR5vEN7Tuc8fK3b7NIEFuw=;
 b=45htYGmLZVjP7SWELRf6pA+oryUCFrIafJzS3CaIGNqPAp/7aHZKaOiyLthiiW4tfL
 Q0f/+XcbsBdbzXf5dZLrqurgLwQlbOmyilj/YNILw60/4JI/5yP0AHcl3M3H0yEMF66+
 kz5zNkgWgCrJ9rKb4xsJfcMCbF7SVuLBrwGeyojV+1/QSWdTUnEC063e1TYJw0fsFTj8
 UG8Qn6SArsobYqUakEEY5qEza2UzAASgtohgP3YcnQj1TK/mFsDTXNXvOWTl4AvDSYqD
 sG9Li8LXcuRDheUohseJkBo+xdVotMKuPFn9ZrAOEqrX910cbRkhYsgHnLly20zJ8G9d
 hsDA==
X-Gm-Message-State: AO0yUKWsMCTsiQ6PY1ZQN3Y7rm8i/tPaqlDvgO+hC5pVuVTuK+aNLrRW
 9hj2Ixc+e5AkNQ/vW0fapVDNQn/9BHowu0gST9J8OdeM
X-Google-Smtp-Source: AK7set+Oe+mLr8FCPkFltZ6qys1XHPiINnGRzYysRERtA09T310oJS2THHBJvJwheOE7hKG8Vhj7HaPD5EIOettutHU=
X-Received: by 2002:a05:6a00:130d:b0:58d:a84a:190b with SMTP id
 j13-20020a056a00130d00b0058da84a190bmr10145pfu.48.1675202350368; Tue, 31 Jan
 2023 13:59:10 -0800 (PST)
MIME-Version: 1.0
References: <CACHw65JEOTp4HhvXMUURSoD-ce5Topa1Z0VNvHWjw8HaBaE-aA@mail.gmail.com>
 <f9ed7f28-711a-2fd6-d04c-06d007a34fb7@grenoble.cnrs.fr>
In-Reply-To: <f9ed7f28-711a-2fd6-d04c-06d007a34fb7@grenoble.cnrs.fr>
From: Ramon Crichlow <rcrichlow9000@gmail.com>
Date: Tue, 31 Jan 2023 15:58:59 -0600
Message-ID: <CACHw65J8mudJyCexMfQiqjkysW5PqGRef0UzQUWUDKF7swrQLw@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmQpqQ+3HQfftCUrooyaywR5vEN7Tuc8fK3b7NIEFuw=;
 b=YnzRzT1pQEdvWivcdo2PbftSS85cUw+ndTg7V/6bf+fVwrSqj1L6GoAXWljcq/vHlP
 yLlr0QJD2M8NGkI6/5PHoejUKyxE5kLi3vdF0qxeAHbem8hjbWCCouvRQmUy4t4rw+AU
 qnYsc3MHmcjb0jx+3e1uDam5rP+D9opHXkLHQ8VBPIao0CzVUz7X4KpCBM3t+EaHiuHw
 r5NWE8LyWYlaf6nxmCeRKmGSHq9oGP9zzAyDD5xMATSpWsImcfLV1XndebwuXzOdNBu6
 FZLWNVarnNUT93wdfisCQAljl8rE1MPreUB06m7R+ObASfKtYMzO6olH+Od8N6UVC0J2
 gDsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YnzRzT1p
Subject: Re: [Buildroot] Development flow to track .config
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
Content-Type: multipart/mixed; boundary="===============4314249476260232439=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4314249476260232439==
Content-Type: multipart/alternative; boundary="000000000000054c1605f3967107"

--000000000000054c1605f3967107
Content-Type: text/plain; charset="UTF-8"

Didn't know about make savedefconfig - thanks!

Ramon

On Tue, Jan 31, 2023 at 3:36 PM Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Hello!
>
> Ramon Crichlow wrote:
> > Is the following flow best practice?  If not please suggest a better one.
> >
> > 1.  Make a change to .config using make menuconfig
> > 2.  Diff the change between .config and .config.old
> > 3.  Edit abc_defconfig to mirror the changes in step 2
> > 4.  Commit abc_defconfig
>
> Not sure it's the best, but here is what I do:
>
> 1. git switch -c 'my-custom-branch'
> 2. make some_board_defconfig
> 3. make nconfig # or your preferred variant of menuconfig, save and exit
> 4. make savedefconfig # this will save the relevant changes to
> some_board_defconfig
> 5. git commit -a -m 'My custom changes to some_board_defconfig'
>
> Best regards,
>
> Edgar.
>

--000000000000054c1605f3967107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Didn&#39;t know about make savedefconfig - thanks!<div><br=
></div><div>Ramon</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jan 31, 2023 at 3:36 PM Edgar Bonet &lt;<a h=
ref=3D"mailto:bonet@grenoble.cnrs.fr">bonet@grenoble.cnrs.fr</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello!<br>
<br>
Ramon Crichlow wrote:<br>
&gt; Is the following flow best practice?=C2=A0 If not please suggest a bet=
ter one.<br>
&gt;<br>
&gt; 1.=C2=A0 Make a change to .config using make menuconfig<br>
&gt; 2.=C2=A0 Diff the change between .config and .config.old<br>
&gt; 3.=C2=A0 Edit abc_defconfig to mirror the changes in step 2<br>
&gt; 4.=C2=A0 Commit abc_defconfig<br>
<br>
Not sure it&#39;s the best, but here is what I do:<br>
<br>
1. git switch -c &#39;my-custom-branch&#39;<br>
2. make some_board_defconfig<br>
3. make nconfig # or your preferred variant of menuconfig, save and exit<br=
>
4. make savedefconfig # this will save the relevant changes to some_board_d=
efconfig<br>
5. git commit -a -m &#39;My custom changes to some_board_defconfig&#39;<br>
<br>
Best regards,<br>
<br>
Edgar.<br>
</blockquote></div>

--000000000000054c1605f3967107--

--===============4314249476260232439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4314249476260232439==--
