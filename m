Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E5EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 18:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ADAB60BE8;
	Wed, 30 Mar 2022 18:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Z9P09aDZcwV; Wed, 30 Mar 2022 18:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C9E60AC9;
	Wed, 30 Mar 2022 18:51:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B625C1BF45A
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A397F40327
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1aEE73g_OMs for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 18:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31645400D9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 18:51:57 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e5827a76f4so229467297b3.6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RcvzedBcau/CYr7qH2DAeLkRVo4wnPnF8npb7elt8uM=;
 b=lmicWah5qScFczLu05ECvxLXF3isPs+hLdjnAma3G39QnmEETootn4ceHqXjF8U5dj
 DJ5VsSjuIFOf+as96rcPX6Q7yCDCBA28p6YRBrIC6MNV9hgme4v9nn/Eu+y01WJZvvuN
 V8XOWVAHe5Jfi5uZ3lR011GtGEndy1RtOOX2aMhIb11gFvbYWxjfb5SOTNZ5DPAyhyO9
 FTt/qNgR9kTPoyWEf6lcUwRxRzzRH4VYF7W6Oo7WKA1cuIXBZC6fsKMkEKcJ7b1IQc9h
 HR3S9hqCHeAuyNDlaVq7L7JfZjK/YtWzcxhzkpBjp4/hyZZpyVFpY1ctuhMt+SIOQE26
 vC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RcvzedBcau/CYr7qH2DAeLkRVo4wnPnF8npb7elt8uM=;
 b=aBejn+taJ4e+kSeKMdrWTf5JLIIc3zXcWEQ6M8O5poAPRVXvqI73r48ntn52HHYb9B
 7/YOuippp8fdssMYEjNqy0pkrVsbrzRcu5sbu+qLv5MRuBibGp/a8/6d+kzrklLiJIWT
 A0sgvWRpxD4SkF0PP5mMon4HQnL/7Em+GPboDOhHHdUb+1mpJPOaR5++3lVBe6yRuuCu
 6LzlrqSih0VqDA300XWLNYQJ1eqUbl44t4xEwXuJJAAgndJjNqRQb3HZ0DgL9GfDVk+r
 DfU6sfjYRVhB/sTTIZfI+tR/Gs/i0lcyszvo3GQV+kzKdyEH/0qSMuzuC9J9JuJVAuW+
 gvBg==
X-Gm-Message-State: AOAM53394zBSYOrx9G5FinoZsSj/CCdrA+GHBxZDBXQCtSfQPa1UhEXi
 rRwZPBFqEIHUy7lL6BEEDe8QEyAl37LTw/erT/qpOyZP
X-Google-Smtp-Source: ABdhPJxJuygco8qur1IFh6Otnojkzms5zzrlvBBdS73Ex5r/pVV5D3s+AppVcEFBFMLZLLsJ2f5YZLz/BoPNwFbTKpI=
X-Received: by 2002:a81:3dcd:0:b0:2ea:949b:a5d9 with SMTP id
 k196-20020a813dcd000000b002ea949ba5d9mr1175965ywa.465.1648666316185; Wed, 30
 Mar 2022 11:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
 <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
 <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
In-Reply-To: <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 15:51:45 -0300
Message-ID: <CAM70yxB61g2r5+aHZYPbit+3TjaWG4khnb71vHC-2pfF+WoyfQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4096665309209649956=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4096665309209649956==
Content-Type: multipart/alternative; boundary="0000000000002127d505db740a10"

--0000000000002127d505db740a10
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 3:01 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> I think keep /usr for STAGING/TARGET OPTS but remove for HOST OPTS.
>

Alright, I've changed it as you suggested and it still works for me. I'll
post an updated patch.

--0000000000002127d505db740a10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Mar 30, 2022 at 3:01 PM James Hilliard &lt;<a href=3D"mailto=
:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">I think keep /usr for =
STAGING/TARGET OPTS but remove for HOST OPTS.<br></blockquote><div><br></di=
v><div>Alright, I&#39;ve changed it as you suggested and it still works for=
 me. I&#39;ll post an updated patch.<br></div></div></div>

--0000000000002127d505db740a10--

--===============4096665309209649956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4096665309209649956==--
