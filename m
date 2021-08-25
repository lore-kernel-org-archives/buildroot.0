Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158FCC4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 15:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2A8610FC
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 15:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE2A8610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81368613B8;
	Wed, 25 Aug 2021 15:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLSAfrma5JQL; Wed, 25 Aug 2021 15:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E2F613BF;
	Wed, 25 Aug 2021 15:18:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7581A1BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 15:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A634074D
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 15:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8Oa5C83B0MV for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 15:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8029842500
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 15:18:07 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l18so36713852lji.12
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXSAfTdc3fZg14NyePXFfWHDBa9/4dOL3Jatjmejd6w=;
 b=EpUHgzYnDUUTDLza/kSwCGtLe2lS9LPI5fJELyM14F1l4zaT/GiyQS+sopw/chMS6I
 Y2HU4Ugqx5Q+5Zt0Qud3VYuxn6N8ApwXlypE1cSX0vERiB2caby60XRAfpVeXlQdgKeW
 MBeCyR/HXAtm933jfuiRjHN4iVBIuJ6qoC4IZIoESswhzAeAzQZZ7q/4fYm/hdEVBeeo
 Saz8QA9YN7gx1EIPKFyVnHGTGxaVwxVvcwAJewsUSZDRuE27nAnIyit6gOBQaljI9Yc7
 pvtPhhWIb+CbKLm8vS5HqZQvRCXbUNrqmtuzGVI+obvaYWNfJeXfnSyT9SjGTW682Lvm
 eOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXSAfTdc3fZg14NyePXFfWHDBa9/4dOL3Jatjmejd6w=;
 b=lSRFuxgxH/ojQq2iLBM3sbf3Ej/dVuHrgwr+7vLRCXRqZ5eXZJ5ZMuibAcwC9MQqjz
 iAJH7/qyH49gRBhF5owD2DsS/1pN+f6cegi+/0bY8DhocCB0KWgWBC0SjUuYXxx2bniz
 vV6+6uTq7ldUTOYZEsRW9D35HW+uYTZvqAMHLdY9XlBbMlaQ51qSxPO7awk9qs9IY9Ux
 gQBiPIZsmCaE85G1twjYWNbJLGz8KEmQ1cI2QEXXCU9X3hwTLss+J8a44iixFSWMjgFT
 RImRZ/qWdOHTM5AX/BRN1zcPDF+NH28Y53GO0wJz49XIU4ggz6LHJpjiYuXvEQ8UqKW0
 GfAw==
X-Gm-Message-State: AOAM531i2uYIVcxwTba9zcl8bGsC8N/uvR/cXbzVey+6phtBDJ51//Y6
 TFvZ6AEeeOp/OqgeiUhwSKDYcY+MYiqPQbqRYiI=
X-Google-Smtp-Source: ABdhPJxfA0qxfvnMDtr3ZJRjdk3y5sUZag8a/gA9ViVIxw2cY7nYDRT8y1cMAfx5yaoxasEbNjBXB41KA3va59u+3uM=
X-Received: by 2002:a2e:98d0:: with SMTP id s16mr36524078ljj.115.1629904685442; 
 Wed, 25 Aug 2021 08:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADjhFRAiQKescNLz8wbeQx=+WfAA19hcLt=dbvm2XoYq6HnFMg@mail.gmail.com>
 <063f8d9b-4124-6f76-1208-0300b63df38b@mind.be>
 <874kc5oztk.fsf@dell.be.48ers.dk>
In-Reply-To: <874kc5oztk.fsf@dell.be.48ers.dk>
From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Wed, 25 Aug 2021 16:17:54 +0100
Message-ID: <CADjhFRAcnrgO+tO5J4jPDY6q3VFefWh-GppO9SgUOsHuZjj6WQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] An issue with alsa-plugins + alsa-utils
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
Cc: romain.tisserand@gmail.com, buildroot@buildroot.org,
 cedric.chepied@gmail.com
Content-Type: multipart/mixed; boundary="===============8201434889966402488=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8201434889966402488==
Content-Type: multipart/alternative; boundary="000000000000cb2c3705ca63c14f"

--000000000000cb2c3705ca63c14f
Content-Type: text/plain; charset="UTF-8"

Thanks all, sent
https://patchwork.ozlabs.org/project/buildroot/patch/20210825151659.59671-1-glex.spb@gmail.com/

On Wed, Aug 4, 2021 at 7:00 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 04/08/2021 12:12, Gleb Mazovetskiy wrote:
>  >> Hi,
>  >>
>  >> This is an issue originally reported to me by Romain Tisserand on
> Discord:
>  >>
>  >> 1. alsa-plugins copies some files
> $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
>  >> 2. alsa-utils removes these files during installation ( |rm -rf
>  >> $(TARGET_DIR)/usr/share/alsa/;|)
>  >>
>  >> Cedric, can you please have a look?
>  >>
>  >> I think a good option may be to not remove the
> |$(TARGET_DIR)/usr/share/alsa/|
>  >> directory in alsa-utils.mk <http://alsa-utils.mk>
>
>  >  Peter did the "rm -rf" 11 years ago as part of the fix for
>  > https://bugs.buildroot.org/show_bug.cgi?id=1573
>  > but I think the intention was just to make sure that you could
> unconfigure some
>  > options, rebuild als-utils and it would leave only the configured
> utils. That's
>  > a scenario that doesn't work anyway, so it's OK to remove the rm.
>
> Yes, I agree.
>
> --
> Bye, Peter Korsgaard
>

--000000000000cb2c3705ca63c14f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks all, sent <a href=3D"https://patchwork.ozlabs.org/p=
roject/buildroot/patch/20210825151659.59671-1-glex.spb@gmail.com/">https://=
patchwork.ozlabs.org/project/buildroot/patch/20210825151659.59671-1-glex.sp=
b@gmail.com/</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 4, 2021 at 7:00 PM Peter Korsgaard &lt;<a href=
=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &qu=
ot;Arnout&quot; =3D=3D Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mi=
nd.be" target=3D"_blank">arnout@mind.be</a>&gt; writes:<br>
<br>
=C2=A0&gt; On 04/08/2021 12:12, Gleb Mazovetskiy wrote:<br>
=C2=A0&gt;&gt; Hi,<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; This is an issue originally reported to me by Romain Tissera=
nd on Discord:<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; 1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/al=
sa/alsa.conf.d<br>
=C2=A0&gt;&gt; 2. alsa-utils removes these files during installation ( |rm =
-rf<br>
=C2=A0&gt;&gt; $(TARGET_DIR)/usr/share/alsa/;|)<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; Cedric, can you please have a look?<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; I think a good option may be to not remove the |$(TARGET_DIR=
)/usr/share/alsa/|<br>
=C2=A0&gt;&gt; directory in <a href=3D"http://alsa-utils.mk" rel=3D"norefer=
rer" target=3D"_blank">alsa-utils.mk</a> &lt;<a href=3D"http://alsa-utils.m=
k" rel=3D"noreferrer" target=3D"_blank">http://alsa-utils.mk</a>&gt;<br>
<br>
=C2=A0&gt;=C2=A0 Peter did the &quot;rm -rf&quot; 11 years ago as part of t=
he fix for<br>
=C2=A0&gt; <a href=3D"https://bugs.buildroot.org/show_bug.cgi?id=3D1573" re=
l=3D"noreferrer" target=3D"_blank">https://bugs.buildroot.org/show_bug.cgi?=
id=3D1573</a><br>
=C2=A0&gt; but I think the intention was just to make sure that you could u=
nconfigure some<br>
=C2=A0&gt; options, rebuild als-utils and it would leave only the configure=
d utils. That&#39;s<br>
=C2=A0&gt; a scenario that doesn&#39;t work anyway, so it&#39;s OK to remov=
e the rm.<br>
<br>
Yes, I agree.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div>

--000000000000cb2c3705ca63c14f--

--===============8201434889966402488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8201434889966402488==--
