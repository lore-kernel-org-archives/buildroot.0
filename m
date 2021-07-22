Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120B3C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:52:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBAA160E8F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBAA160E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64125405D4;
	Thu, 22 Jul 2021 21:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Euy_dwZGtQwk; Thu, 22 Jul 2021 21:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11993405EB;
	Thu, 22 Jul 2021 21:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB2B1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9921A835A6
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1OEGb8pCFnd for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:52:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CD128356C
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 21:52:17 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id t2so8591440edd.13
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 14:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EaQEIijK5IZFH5X/kKLv+XJuIYaVZqelY1qfE/5VYsA=;
 b=nrcdU6n7yxk/wNnfdMNvPKmZ+hDWlnR9KxGZNVYhNH6nFbjs4fJB4aeOCuajCxj1xo
 Vob+CQU2X+i8m/aMNGCLDMxiF108vlhHLuB8osmfju/5TCokmRLqkM2zZOQH8XlHjw4Q
 5qV5ZVuQZQBOONhDiUxHIMl6ZFk8d4dXlEEVuVxMFtmKMs7l+BUtfgm9xN8JV1sg7jcj
 rWa3uay/tAhxLtVwtXh2Tv5+cK23p/tpS4ZZCzcHEnqnv4AQPM8NUoeImt63drcMtWUW
 XcwI3MTx9WAyeuNkVdRBi8WMXiUJR1LjC8nuwPt/ChFxKWdPmjPsYH5oBA+CqiJlxd+Z
 5RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EaQEIijK5IZFH5X/kKLv+XJuIYaVZqelY1qfE/5VYsA=;
 b=WbrQ9frpRetWQN+KWk6RoA2Bp2VppOM12LpDKnfHLMJ9XH+MIOGRozFZ8KcUEFfgWY
 maMejAVv2ALOKjb3Qb5Kbhs3uNUB4CtWCD2Nxh+/FtRkeNHr7AW78aeDofka9PaePVNs
 8uyJgjOGCIYyQ5/fkhUMqoDcVZXT4TuJPoogkPtn4m2S6Gp/qnaeXY+rX6IdIfHcQSen
 LPZI1poW4fm7NE0/S2O1fjRABEZ788IvR47gCOEaePMde3D1dhXSZmKM6HiK890ORuiT
 /agp0rQUEygl2M1lHXPUa8ZHzVC7rP/r7KyIUVEz/j05I1ESUVGM0soIob5hOMUmF//5
 RGPw==
X-Gm-Message-State: AOAM530aXGG2R8n6IAar0uDTItiQ8Dh0ZF5lLEcSp2JLN/lWEQiuzbvI
 I7HVBWfFHV+2Ix+99IRdzmpipY3wRFYKJMUmlw0=
X-Google-Smtp-Source: ABdhPJzzqkibGASl2i/AZpqcjGz5nOzqxVFdK0Tc/2pC3DMHkq2lCuWX904kZyTRXeaL4CTt2gkUYt9GjWCtug8Zqnk=
X-Received: by 2002:a05:6402:1d01:: with SMTP id
 dg1mr1922822edb.29.1626990735251; 
 Thu, 22 Jul 2021 14:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210608202434.10092-1-edmundo.ferreira@esa.int>
 <20210722230738.57510350@windsurf>
In-Reply-To: <20210722230738.57510350@windsurf>
From: Edmundo Ferreira <fc.edmundo@gmail.com>
Date: Thu, 22 Jul 2021 23:52:05 +0200
Message-ID: <CAFv936FFHCcDM3LWC=A+Dd8pv4LSEbJuEHiDLZ2R9NVwf4xOJQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 31/35] package/x265: fixes SITE since
 upstream repo was moved
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thijs Vermeir <thijsvermeir@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6051722524808206986=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6051722524808206986==
Content-Type: multipart/alternative; boundary="000000000000d3de2705c7bd4cf4"

--000000000000d3de2705c7bd4cf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure I'll check for a version bump on the new URL.

Sorry for that. I didn't take into consideration the caching of the
packages in sources.buildroot.com.

As for the hash being wrong that is strange since I have that patch and our
gitlab pipelines are fine. Maybe I'm being victim of our own package cache.

I'll investigate and let you know ASAP.

Best regards
Ed

On Thu, Jul 22, 2021, 23:07 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Edmundo,
>
> On Tue,  8 Jun 2021 22:24:34 +0200
> Edmundo Ferreira <fc.edmundo@gmail.com> wrote:
>
> > From: Edmundo Ferreira <fc.edmundo@gmail.com>
> >
> > Signed-off-by: Edmundo Ferreira <fc.edmundo@gmail.com>
>
> Thanks a lot for your patch. There is indeed an issue as the current
> URL gives a 404. However, your patch doesn't fix it really: the hash of
> the tarball downloaded from this new URL is different, and so it gets
> rejected, and we fallback to sources.buildroot.net. See:
>
> >>> x265 3.3 Downloading
> wget --passive-ftp -nd -t 3 -O
> '/home/thomas/projets/buildroot/output/build/.x265_3.3.tar.gz.YfSH95/outp=
ut'
> 'https://bitbucket.org/multicoreware/x265_git/downloads/x265_3.3.tar.gz'
> --2021-07-22 23:02:55--
> https://bitbucket.org/multicoreware/x265_git/downloads/x265_3.3.tar.gz
> Resolving bitbucket.org (bitbucket.org)... 2406:da00:ff00::34cc:ea4a,
> 2406:da00:ff00::22c3:9b0a, 2406:da00:ff00::22c2:513, ...
> Connecting to bitbucket.org (bitbucket.org)|2406:da00:ff00::34cc:ea4a|:44=
3...
> connected.
> HTTP request sent, awaiting response... 302 Found
> Location:
> https://bbuseruploads.s3.amazonaws.com/c105f477-2003-4e12-80e5-06858cf7e4=
0b/downloads/4247de9f-1484-4e31-b9b8-f69a505230de/x265_3.3.tar.gz?Signature=
=3DGAYCnXeWIBn3w2FX%2FLeQnQ%2Bi2c8%3D&Expires=3D1626989576&AWSAccessKeyId=
=3DAKIA6KOSE3BNJRRFUUX6&versionId=3Ds9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&respon=
se-content-disposition=3Dattachment%3B%20filename%3D%22x265_3.3.tar.gz%22&r=
esponse-content-encoding=3DNone
> [following]
> --2021-07-22 23:02:56--
> https://bbuseruploads.s3.amazonaws.com/c105f477-2003-4e12-80e5-06858cf7e4=
0b/downloads/4247de9f-1484-4e31-b9b8-f69a505230de/x265_3.3.tar.gz?Signature=
=3DGAYCnXeWIBn3w2FX%2FLeQnQ%2Bi2c8%3D&Expires=3D1626989576&AWSAccessKeyId=
=3DAKIA6KOSE3BNJRRFUUX6&versionId=3Ds9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&respon=
se-content-disposition=3Dattachment%3B%20filename%3D%22x265_3.3.tar.gz%22&r=
esponse-content-encoding=3DNone
> Resolving bbuseruploads.s3.amazonaws.com (bbuseruploads.s3.amazonaws.com)=
...
> 52.216.98.243
> Connecting to bbuseruploads.s3.amazonaws.com (
> bbuseruploads.s3.amazonaws.com)|52.216.98.243|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1508513 (1,4M) [application/x-gzip]
> Saving to:
> =E2=80=98/home/thomas/projets/buildroot/output/build/.x265_3.3.tar.gz.YfS=
H95/output=E2=80=99
>
> /home/thomas/projets/buildroo
> 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
>]   1,44M   930KB/s
> in 1,6s
>
> 2021-07-22 23:02:59 (930 KB/s) -
> =E2=80=98/home/thomas/projets/buildroot/output/build/.x265_3.3.tar.gz.YfS=
H95/output=E2=80=99
> saved [1508513/1508513]
>
> ERROR: x265_3.3.tar.gz has wrong md5 hash:
> ERROR: expected: 0c8c747b59b5411dea8cf557554636c1
> ERROR: got     : be6ea7a139b01fa6f2614d5c1197492d
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> wget --passive-ftp -nd -t 3 -O
> '/home/thomas/projets/buildroot/output/build/.x265_3.3.tar.gz.N9OBTM/outp=
ut'
> 'http://sources.buildroot.net/x265/x265_3.3.tar.gz'
> --2021-07-22 23:02:59--  http://sources.buildroot.net/x265/x265_3.3.tar.g=
z
> Resolving sources.buildroot.net (sources.buildroot.net)...
> 2606:4700:20::681a:125, 2606:4700:20::681a:25, 2606:4700:20::ac43:4838, .=
..
> Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20:=
:681a:125|:80...
> connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1438685 (1,4M) [application/x-gtar-compressed]
> Saving to:
> =E2=80=98/home/thomas/projets/buildroot/output/build/.x265_3.3.tar.gz.N9O=
BTM/output=E2=80=99
>
> /home/thomas/projets/buildroo
> 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
>]   1,37M  1,12MB/s
> in 1,2s
>
> 2021-07-22 23:03:00 (1,12 MB/s) -
> =E2=80=98/home/thomas/projets/buildroot/output/build/.x265_3.3.tar.gz.N9O=
BTM/output=E2=80=99
> saved [1438685/1438685]
>
> x265_3.3.tar.gz: OK (md5: 0c8c747b59b5411dea8cf557554636c1)
> x265_3.3.tar.gz: OK (sha256:
> f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88bcbb045b3fb58300b9c)
>
> Could you have a look? We can't simply change the hash, because that
> would mean the tarball cached on sources.buildroot.net is no longer
> valid. And we cannot delete it, as it would break older Buildroot
> releases, which use the current hash for the x265 tarball.
>
> Usually, the easiest path is to update the URL *and* do a version bump
> at the same time.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000d3de2705c7bd4cf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:sans-serif">Sure I&#39;ll che<=
/span><span style=3D"font-family:sans-serif">ck for a version bump on the n=
ew URL.</span><div dir=3D"auto" style=3D"font-family:sans-serif"><br></div>=
<div dir=3D"auto" style=3D"font-family:sans-serif">Sorry for that. I didn&#=
39;t take into consideration the caching of the packages in <a href=3D"http=
://sources.buildroot.com">sources.buildroot.com</a>.</div><div dir=3D"auto"=
 style=3D"font-family:sans-serif"><br></div><div dir=3D"auto" style=3D"font=
-family:sans-serif">As for the hash being wrong that is strange since I hav=
e that patch and our gitlab pipelines are fine. Maybe I&#39;m being victim =
of our own package cache.</div><div dir=3D"auto" style=3D"font-family:sans-=
serif"><br></div><div dir=3D"auto" style=3D"font-family:sans-serif">I&#39;l=
l investigate and let=C2=A0you know ASAP.</div><div dir=3D"auto" style=3D"f=
ont-family:sans-serif"><br></div><div dir=3D"auto" style=3D"font-family:san=
s-serif">Best regards</div><div dir=3D"auto" style=3D"font-family:sans-seri=
f">Ed</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jul 22, 2021, 23:07 Thomas Petazzoni &lt;<a href=3D"mail=
to:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hello Edmundo,<br>
<br>
On Tue,=C2=A0 8 Jun 2021 22:24:34 +0200<br>
Edmundo Ferreira &lt;<a href=3D"mailto:fc.edmundo@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">fc.edmundo@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: Edmundo Ferreira &lt;<a href=3D"mailto:fc.edmundo@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">fc.edmundo@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Edmundo Ferreira &lt;<a href=3D"mailto:fc.edmundo@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">fc.edmundo@gmail.com</a>&gt;<br>
<br>
Thanks a lot for your patch. There is indeed an issue as the current<br>
URL gives a 404. However, your patch doesn&#39;t fix it really: the hash of=
<br>
the tarball downloaded from this new URL is different, and so it gets<br>
rejected, and we fallback to <a href=3D"http://sources.buildroot.net" rel=
=3D"noreferrer noreferrer" target=3D"_blank">sources.buildroot.net</a>. See=
:<br>
<br>
&gt;&gt;&gt; x265 3.3 Downloading<br>
wget --passive-ftp -nd -t 3 -O &#39;/home/thomas/projets/buildroot/output/b=
uild/.x265_3.3.tar.gz.YfSH95/output&#39; &#39;<a href=3D"https://bitbucket.=
org/multicoreware/x265_git/downloads/x265_3.3.tar.gz" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://bitbucket.org/multicoreware/x265_git/dow=
nloads/x265_3.3.tar.gz</a>&#39; <br>
--2021-07-22 23:02:55--=C2=A0 <a href=3D"https://bitbucket.org/multicorewar=
e/x265_git/downloads/x265_3.3.tar.gz" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://bitbucket.org/multicoreware/x265_git/downloads/x265_3.3=
.tar.gz</a><br>
Resolving <a href=3D"http://bitbucket.org" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">bitbucket.org</a> (<a href=3D"http://bitbucket.org" rel=3D"=
noreferrer noreferrer" target=3D"_blank">bitbucket.org</a>)... 2406:da00:ff=
00::34cc:ea4a, 2406:da00:ff00::22c3:9b0a, 2406:da00:ff00::22c2:513, ...<br>
Connecting to <a href=3D"http://bitbucket.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">bitbucket.org</a> (<a href=3D"http://bitbucket.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">bitbucket.org</a>)|2406:da00:f=
f00::34cc:ea4a|:443... connected.<br>
HTTP request sent, awaiting response... 302 Found<br>
Location: <a href=3D"https://bbuseruploads.s3.amazonaws.com/c105f477-2003-4=
e12-80e5-06858cf7e40b/downloads/4247de9f-1484-4e31-b9b8-f69a505230de/x265_3=
.3.tar.gz?Signature=3DGAYCnXeWIBn3w2FX%2FLeQnQ%2Bi2c8%3D&amp;Expires=3D1626=
989576&amp;AWSAccessKeyId=3DAKIA6KOSE3BNJRRFUUX6&amp;versionId=3Ds9fflFgseT=
2OEPm_eT1G33eu3G8q_RJ5&amp;response-content-disposition=3Dattachment%3B%20f=
ilename%3D%22x265_3.3.tar.gz%22&amp;response-content-encoding=3DNone" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://bbuseruploads.s3.amazo=
naws.com/c105f477-2003-4e12-80e5-06858cf7e40b/downloads/4247de9f-1484-4e31-=
b9b8-f69a505230de/x265_3.3.tar.gz?Signature=3DGAYCnXeWIBn3w2FX%2FLeQnQ%2Bi2=
c8%3D&amp;Expires=3D1626989576&amp;AWSAccessKeyId=3DAKIA6KOSE3BNJRRFUUX6&am=
p;versionId=3Ds9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&amp;response-content-disposi=
tion=3Dattachment%3B%20filename%3D%22x265_3.3.tar.gz%22&amp;response-conten=
t-encoding=3DNone</a> [following]<br>
--2021-07-22 23:02:56--=C2=A0 <a href=3D"https://bbuseruploads.s3.amazonaws=
.com/c105f477-2003-4e12-80e5-06858cf7e40b/downloads/4247de9f-1484-4e31-b9b8=
-f69a505230de/x265_3.3.tar.gz?Signature=3DGAYCnXeWIBn3w2FX%2FLeQnQ%2Bi2c8%3=
D&amp;Expires=3D1626989576&amp;AWSAccessKeyId=3DAKIA6KOSE3BNJRRFUUX6&amp;ve=
rsionId=3Ds9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&amp;response-content-disposition=
=3Dattachment%3B%20filename%3D%22x265_3.3.tar.gz%22&amp;response-content-en=
coding=3DNone" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bbus=
eruploads.s3.amazonaws.com/c105f477-2003-4e12-80e5-06858cf7e40b/downloads/4=
247de9f-1484-4e31-b9b8-f69a505230de/x265_3.3.tar.gz?Signature=3DGAYCnXeWIBn=
3w2FX%2FLeQnQ%2Bi2c8%3D&amp;Expires=3D1626989576&amp;AWSAccessKeyId=3DAKIA6=
KOSE3BNJRRFUUX6&amp;versionId=3Ds9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&amp;respon=
se-content-disposition=3Dattachment%3B%20filename%3D%22x265_3.3.tar.gz%22&a=
mp;response-content-encoding=3DNone</a><br>
Resolving <a href=3D"http://bbuseruploads.s3.amazonaws.com" rel=3D"noreferr=
er noreferrer" target=3D"_blank">bbuseruploads.s3.amazonaws.com</a> (<a hre=
f=3D"http://bbuseruploads.s3.amazonaws.com" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">bbuseruploads.s3.amazonaws.com</a>)... 52.216.98.243<br>
Connecting to <a href=3D"http://bbuseruploads.s3.amazonaws.com" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">bbuseruploads.s3.amazonaws.com</a> (<a=
 href=3D"http://bbuseruploads.s3.amazonaws.com" rel=3D"noreferrer noreferre=
r" target=3D"_blank">bbuseruploads.s3.amazonaws.com</a>)|52.216.98.243|:443=
... connected.<br>
HTTP request sent, awaiting response... 200 OK<br>
Length: 1508513 (1,4M) [application/x-gzip]<br>
Saving to: =E2=80=98/home/thomas/projets/buildroot/output/build/.x265_3.3.t=
ar.gz.YfSH95/output=E2=80=99<br>
<br>
/home/thomas/projets/buildroo 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;]=C2=A0 =C2=A01,44M=C2=A0 =C2=A0930KB/s=C2=
=A0 =C2=A0 in 1,6s=C2=A0 =C2=A0 <br>
<br>
2021-07-22 23:02:59 (930 KB/s) - =E2=80=98/home/thomas/projets/buildroot/ou=
tput/build/.x265_3.3.tar.gz.YfSH95/output=E2=80=99 saved [1508513/1508513]<=
br>
<br>
ERROR: x265_3.3.tar.gz has wrong md5 hash:<br>
ERROR: expected: 0c8c747b59b5411dea8cf557554636c1<br>
ERROR: got=C2=A0 =C2=A0 =C2=A0: be6ea7a139b01fa6f2614d5c1197492d<br>
ERROR: Incomplete download, or man-in-the-middle (MITM) attack<br>
wget --passive-ftp -nd -t 3 -O &#39;/home/thomas/projets/buildroot/output/b=
uild/.x265_3.3.tar.gz.N9OBTM/output&#39; &#39;<a href=3D"http://sources.bui=
ldroot.net/x265/x265_3.3.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://sources.buildroot.net/x265/x265_3.3.tar.gz</a>&#39; <br>
--2021-07-22 23:02:59--=C2=A0 <a href=3D"http://sources.buildroot.net/x265/=
x265_3.3.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_blank">http://sou=
rces.buildroot.net/x265/x265_3.3.tar.gz</a><br>
Resolving <a href=3D"http://sources.buildroot.net" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">sources.buildroot.net</a> (<a href=3D"http://source=
s.buildroot.net" rel=3D"noreferrer noreferrer" target=3D"_blank">sources.bu=
ildroot.net</a>)... 2606:4700:20::681a:125, 2606:4700:20::681a:25, 2606:470=
0:20::ac43:4838, ...<br>
Connecting to <a href=3D"http://sources.buildroot.net" rel=3D"noreferrer no=
referrer" target=3D"_blank">sources.buildroot.net</a> (<a href=3D"http://so=
urces.buildroot.net" rel=3D"noreferrer noreferrer" target=3D"_blank">source=
s.buildroot.net</a>)|2606:4700:20::681a:125|:80... connected.<br>
HTTP request sent, awaiting response... 200 OK<br>
Length: 1438685 (1,4M) [application/x-gtar-compressed]<br>
Saving to: =E2=80=98/home/thomas/projets/buildroot/output/build/.x265_3.3.t=
ar.gz.N9OBTM/output=E2=80=99<br>
<br>
/home/thomas/projets/buildroo 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt;]=C2=A0 =C2=A01,37M=C2=A0 1,12MB/s=C2=A0 =C2=
=A0 in 1,2s=C2=A0 =C2=A0 <br>
<br>
2021-07-22 23:03:00 (1,12 MB/s) - =E2=80=98/home/thomas/projets/buildroot/o=
utput/build/.x265_3.3.tar.gz.N9OBTM/output=E2=80=99 saved [1438685/1438685]=
<br>
<br>
x265_3.3.tar.gz: OK (md5: 0c8c747b59b5411dea8cf557554636c1)<br>
x265_3.3.tar.gz: OK (sha256: f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88b=
cbb045b3fb58300b9c)<br>
<br>
Could you have a look? We can&#39;t simply change the hash, because that<br=
>
would mean the tarball cached on <a href=3D"http://sources.buildroot.net" r=
el=3D"noreferrer noreferrer" target=3D"_blank">sources.buildroot.net</a> is=
 no longer<br>
valid. And we cannot delete it, as it would break older Buildroot<br>
releases, which use the current hash for the x265 tarball.<br>
<br>
Usually, the easiest path is to update the URL *and* do a version bump<br>
at the same time.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000d3de2705c7bd4cf4--

--===============6051722524808206986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6051722524808206986==--
