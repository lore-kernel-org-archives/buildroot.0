Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52463C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8FFD4027F;
	Wed, 30 Mar 2022 17:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cojRXQHORY1H; Wed, 30 Mar 2022 17:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E674140168;
	Wed, 30 Mar 2022 17:37:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1DC81BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB90560A99
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQtIplB8Dvek for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:37:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11405606F2
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:37:52 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e6650cde1bso226741777b3.12
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wj45w3tWZ7e1fPo6m4YBNbf7tmWLqQnJwgZTjGc24BY=;
 b=Z/TIDINYBmZs+aEcsLY4LXjkjIHCVNjTdLilv5+KUZORZZeR9b0ibGU4xyZnHquQGy
 jrDNYT3lMlHyfA++Z0TwOQBKo7P824nbi94tPPMMKG0F4o1CuX59vHZyr4eiCEay9hnP
 fzkL9CqBSxaUOIWhmT+NNhe2pI9maQXzlF/5kOTMzNwk5hi2Ol8IEBdDxYclqdtbTjvg
 5j2sviCQvU94+18mtL39HaJs2ulC+zpxRBqPg2mh92iP/cNRRywH7cs45y5OAVKMY3XF
 RQytHl1UfIfQ7Gq+WauCqoVHxtQPH9Q/mF1Z9Nqgn2POm1YK1dUUJ2UhDUclsiBX0FaV
 0jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wj45w3tWZ7e1fPo6m4YBNbf7tmWLqQnJwgZTjGc24BY=;
 b=yuBeqmxCu8z9aaVHt0TtvWgAmnuvrbcISH0k64ZLrAGxU/X8jJb218sNQNxqAfW7x/
 /9BvwXOcHYZHLk7F9cQ4k0Ctm5e7puYlqgadibbS55Y3upebNNigTdQ+JPDtn2dlliDC
 jAGAsfiGkZy3aemi1WsIHVTlSK/P0b5Zj0RDuLLP7R0DhQovQpwHhgAzkFz6cN2Z7J4i
 GNFaw9CO4ua+zUbeIso/hv7NL51SyQ3rd4bzOXh1qAq8cCF57f2E+n1RarvJb8MBUfjS
 3X1mfsCEM5PQ7SzjmkJiFgGD9Qgclcmx+guSCJHJqg0iYX8krCCaC5Ioqe4LlsXLmvVs
 wMXw==
X-Gm-Message-State: AOAM531k/gib19gphGaJC9QrnO/rNf/y7z9nV4WEtOOAYnGm+mggNjFP
 Ry/uukB69BjS+4PbhLQpqlwySt1ZID8fH36Wctq0+XrPAgs=
X-Google-Smtp-Source: ABdhPJxb4syjhHPaL0njFf1bot9w5FBWSlWk4ovrNnsiLR0LE/WnyTh0xMQyuMLvpSgqSTCukgLhBn5KVYeBAQgWvZE=
X-Received: by 2002:a05:690c:290:b0:2ea:a92c:ab00 with SMTP id
 bf16-20020a05690c029000b002eaa92cab00mr780724ywb.115.1648661872079; Wed, 30
 Mar 2022 10:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
In-Reply-To: <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 14:37:41 -0300
Message-ID: <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2469103682319735304=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2469103682319735304==
Content-Type: multipart/alternative; boundary="0000000000003d74ae05db730100"

--0000000000003d74ae05db730100
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 4:23 AM James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Wed, Mar 30, 2022 at 1:19 AM Emile Cormier
> <emile.cormier.jr@gmail.com> wrote:
> > For me output/host/usr is a simlink to output/host:
>
> Yeah, I think it usually works but should not have /usr for consistency.
>

I tried removing 'usr/' from PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS as well
as HOST_PKG_PYTHON_PEP517_INSTALL_OPTS, and the
print(PasswordHasher().hash("foo")) test still works for me on the target
device.

Do you want me to issue another patch with the 'usr/' portion removed from
PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS as well as
HOST_PKG_PYTHON_PEP517_INSTALL_OPTS? I don't care about receiving credit
for such trivial changes. Please do whatever is most expedient to fix the
problem.

--0000000000003d74ae05db730100
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Mar 30, 2022 at 4:23 AM James Hilliard &lt;<a href=3D"mailto=
:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Mar 30, 2022 a=
t 1:19 AM Emile Cormier<br>
&lt;<a href=3D"mailto:emile.cormier.jr@gmail.com" target=3D"_blank">emile.c=
ormier.jr@gmail.com</a>&gt; wrote:<br>
&gt; For me output/host/usr is a simlink to output/host:<br>
<br>
Yeah, I think it usually works but should not have /usr for consistency.<br=
></blockquote><div><br></div><div><div>I tried removing &#39;usr/&#39; from=
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS as well as HOST_PKG_PYTHON_PEP517_I=
NSTALL_OPTS, and the print(PasswordHasher().hash(&quot;foo&quot;)) test sti=
ll works for me on the target device.</div><div><br></div><div>Do you want =
me to issue another patch with the &#39;usr/&#39; portion removed from PKG_=
PYTHON_PEP517_INSTALL_STAGING_OPTS as well as HOST_PKG_PYTHON_PEP517_INSTAL=
L_OPTS? I don&#39;t care about receiving credit for such trivial changes. P=
lease do whatever is most expedient to fix the problem.</div></div></div></=
div>

--0000000000003d74ae05db730100--

--===============2469103682319735304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2469103682319735304==--
