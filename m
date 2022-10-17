Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C909DC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 14:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2095441744;
	Mon, 17 Oct 2022 14:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2095441744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lS2VoEM39y8R; Mon, 17 Oct 2022 14:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D66EE41727;
	Mon, 17 Oct 2022 14:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66EE41727
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4631BF2F2
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 566B5829EE
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566B5829EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70TON4iYvhd4 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 14:41:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E057382778
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E057382778
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 14:40:59 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id s17so5545869qkj.12
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fD6HnQHbEMZmbCTun7+Ula+DGKTf2fDTyjgnpEkzJF8=;
 b=OQLnMEuLlRkw1u17c3BwalV5JKX3xVyzi5VrV7CmCmJV/HwWZfjIz77Kshlah9amdY
 WdNXFYh5XqZT1okWEmaS5pzNUp0XatFKHGTPjTF34KMPAPwGzKHZI6NA6USn5RrNktti
 Hv5r+K8WT0bw7frqPwNnNFq8X9na8HNL+rrqka6oxXeRBCb6BOqZNRqTg+U8BhIX38dt
 kAoTle9uK3p9S2hM5Dk6RKNEScTz5ers5tWOUjjS1Jzfq7iFRHnRGAnk4vJh/6ROVMXl
 ct8WjYhQDZ07LlEHwU6H8+lIpW9zoN4tbwLITTfoHbKas4v2sGDW3SlV+KH731R9tSli
 dPCw==
X-Gm-Message-State: ACrzQf2AdskVMjkfKnwoE9vJs+fYwFLMxSyYhA6ZvqhtDpMw2XuRDIMo
 pqr3ct3Gc/vz/nJdEu4GUJgsLn4kv9C9x0eM2V83Ub2K88I=
X-Google-Smtp-Source: AMsMyM5xKX0anXfTWNAvTZu7GrgRgcZ8cQjwPbRMTCuFzQV6To+90NX3D+yAzngXVqetqxXUvWHL69TFEypUkaHxf2M=
X-Received: by 2002:a05:620a:a9c:b0:6ec:f03:9e5b with SMTP id
 v28-20020a05620a0a9c00b006ec0f039e5bmr7717711qkg.628.1666017658607; Mon, 17
 Oct 2022 07:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <CACw=RXKvmdHDVc5bk1qZ6-d6ebbeJqEWGaNk9pOdn1YoYoVX6w@mail.gmail.com>
 <CACw=RX+iZgqvPaU+C1i7BE331VRs9qwdUOD8smUc2uYgAwtvVg@mail.gmail.com>
In-Reply-To: <CACw=RX+iZgqvPaU+C1i7BE331VRs9qwdUOD8smUc2uYgAwtvVg@mail.gmail.com>
From: Cem Sezer <cps@microplex.com>
Date: Mon, 17 Oct 2022 07:40:53 -0700
Message-ID: <CACw=RXL94Gm6UPcPiUJk=TdMDjSta3k6RL5Pj0d0DcyerJRY-g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microplex.com; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fD6HnQHbEMZmbCTun7+Ula+DGKTf2fDTyjgnpEkzJF8=;
 b=AcL06N9zSclNtNdtjiYF4Xe5BXuwQFkvBwAMwQO++09mmzGxS/iNwoTITOCHmyKWsM
 rkQ5UlODBeaRAv8e2FK+HtbWsHs0Op3JnO8Z2pBcPqJzgZRGk2fXotllreO2imyhyT1P
 gz+TPx5iUIhCX7uE/jvGTBwu+euBcGAbp191VOTpmRilDboxETn2GaTnyClsHVu+Tt9H
 eNYK05D25IUaI3ZvvQ5jqMynX0eOwsKfkD/xFk+Y9C2ncew+SgzhXZnm7+UW+iK2gNUj
 bYd/8jf3EodFNHMrK7j8JL/4TD4ed710bdRk5ZzaYLwHnZ8KqQ6yOlvjfTj5ftWH81oy
 hpKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microplex.com header.i=@microplex.com
 header.a=rsa-sha256 header.s=google header.b=AcL06N9z
Subject: Re: [Buildroot] wpa_supplicant: TLSv1: No TLS version allowed
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
Content-Type: multipart/mixed; boundary="===============5066162736813788194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5066162736813788194==
Content-Type: multipart/alternative; boundary="000000000000bb2e9d05eb3bf63c"

--000000000000bb2e9d05eb3bf63c
Content-Type: text/plain; charset="UTF-8"

Hello,

The issue was solved and I figured I'd reply here in case someone has this
happen to them. My bad certificate was due to my board not having a battery
to keep the clock going when it was powered off, and therefore the date was
1970. Changing the date to the current fixed this. I also added NTP from
buildroot later.

Cem

On Wed, Oct 5, 2022 at 6:11 PM Cem Sezer <cps@microplex.com> wrote:

> Hello,
>
> I updated to the newly released buildroot-2022.08.01 released a few days
> ago and it fixed the TLSv1.0 issue and it started using TLSv1.2. However,
> now I get the error "EAP-PEAP: TLS processing failed". Additionally, my
> radius server outputs "eap_peap: ERROR: TLS Alert read:fatal:bad
> certificate".Not sure how to proceed here.
>
> Thanks,
>
> Cem
>
> On Wed, Oct 5, 2022 at 4:28 PM Cem Sezer <cps@microplex.com> wrote:
>
>> Hello,
>>
>> On a new build, when I run wpa_supplicant, it seems to only allow
>> TLSv1.0. When I specify the supplicant to use a newer version of TLS in
>> wpa_supplicant.conf under phase1, it fails and the debug output says
>> "TLSv1: No TLS version allowed". Am I missing something? When I don't
>> specify, it defaults to using TLSv1.0. I included all parts of
>> wpa_supplicant, openssl, and libcurl when using menuconfig. I'm using
>> buildroot-2022.08. The version of wpa_supplicant is v2.10 and openssl
>> version 1.1.1.q
>>
>> Thanks in advance,
>>
>> Cem
>>
>

--000000000000bb2e9d05eb3bf63c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><div><br></div><div>The issue was sol=
ved and I figured I&#39;d reply here in case someone has this happen to the=
m. My bad certificate was due to my board not having a battery to keep the =
clock going when it was powered off, and therefore the date was 1970. Chang=
ing the date to the current fixed this. I also added NTP from buildroot lat=
er.=C2=A0=C2=A0</div><div><br></div><div>Cem</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 5, 2022 at 6:=
11 PM Cem Sezer &lt;<a href=3D"mailto:cps@microplex.com">cps@microplex.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Hello,<div><br></div><div>I updated to the newly released b=
uildroot-2022.08.01 released a few days ago and it fixed the TLSv1.0 issue =
and it started using TLSv1.2. However, now I get the error &quot;EAP-PEAP: =
TLS processing failed&quot;. Additionally, my radius server outputs &quot;e=
ap_peap: ERROR: TLS Alert read:fatal:bad certificate&quot;.Not sure how to =
proceed here.<br><br>Thanks,</div><div><br></div><div>Cem</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct =
5, 2022 at 4:28 PM Cem Sezer &lt;<a href=3D"mailto:cps@microplex.com" targe=
t=3D"_blank">cps@microplex.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div><br></=
div><div>On a new build, when I run wpa_supplicant, it seems to only allow =
TLSv1.0. When I specify the supplicant to use a newer version of TLS in wpa=
_supplicant.conf under phase1, it fails and the debug output says &quot;TLS=
v1: No TLS version allowed&quot;. Am I=C2=A0missing something? When I don&#=
39;t specify, it defaults to using TLSv1.0. I included all parts=C2=A0of wp=
a_supplicant, openssl, and libcurl when using menuconfig. I&#39;m using bui=
ldroot-2022.08. The version of wpa_supplicant is v2.10 and openssl version =
1.1.1.q=C2=A0<br></div><div><br></div><div>Thanks in advance,</div><div><br=
></div><div>Cem</div></div>
</blockquote></div>
</blockquote></div>

--000000000000bb2e9d05eb3bf63c--

--===============5066162736813788194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5066162736813788194==--
