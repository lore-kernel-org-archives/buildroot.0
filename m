Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B042CE8356
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 14:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1660B606BE;
	Mon, 30 Sep 2024 14:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w31oc6xY3eg8; Mon, 30 Sep 2024 14:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB1E3606D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB1E3606D5;
	Mon, 30 Sep 2024 14:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B12AA1BF335
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 14:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FE1E40118
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 14:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYXjQqFpJdxu for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 14:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=andrew.2.622266@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CB01400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB01400BF
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CB01400BF
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 14:55:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso682335466b.0
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 07:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727708114; x=1728312914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7CwIHc5GgN4+3+MeP28+tO0eyj7FQ+Zf/z2jqv1/rI=;
 b=lNkOf2Zg3PSb1U3p9ccTBKcimCjby40Syg2e87P6q1/B6QccH70pkQ2o1QiR/ACPio
 E1tvaE54PMFmMJHFHiSChSXHgRtk/kFFQZoQ6VlcnZ0jf4k2e2fvoYG75Iu/VOQukx26
 vd/CHnPIgoucsutAT2nBzdMFOm05asiLBT2UaLN9RJkP0RmBaxqQ0MJc694jIB8g40y/
 eWZdL+nvlgNVpPr/9Anjubt/5EAK1HkONz6Et1jqExXM7ivv3gun4ge6VcxmZV4yaeX1
 5WTarsnW7/k2OVzNCbgEU8W3Rd/NGRc6ktvf66h5IZmPexfmm3Wc9aQd1h6I4KKIPngL
 JyeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMXhGvF3WvwrwxXGorM+axKOhjltKvABNvNQ3nVQ7+YsorFTMrxOSAHWoqPIw49JqoRF3dg6ZGaOo=@buildroot.org
X-Gm-Message-State: AOJu0YyyTMDANopJnz4ZfXYhDRDlhwuvPDqWT2ubemRgk7fsrxT5Qkvj
 99Wq6GJ1Rx+6fIP9iVdABLBdDKoNwOR3SENj5NHKFkF9NEIFKQewHp+rbNHNrbOMTJXtkYY/cMF
 jT5JOX0MO0vpR1MhFvgf3b4yJIuM=
X-Google-Smtp-Source: AGHT+IGDaaxcOPSUosPF2CsSDqaayHznBnjvMXi5TJHHpUJ8nQaB9uHC02muwHuamxr2V2AESoD2srF+mrXPUQoU580=
X-Received: by 2002:a17:907:2d0a:b0:a8a:43bd:a9e8 with SMTP id
 a640c23a62f3a-a93c4a9d65dmr1412308466b.65.1727708113790; Mon, 30 Sep 2024
 07:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
 <763b02bb-2b74-4afc-b670-d41183bef12c@grenoble.cnrs.fr>
 <CAPKzRz83KTOgnyyBBuZjzV7uSti+G05KaUnM4=mFV8U2GhcKCw@mail.gmail.com>
 <97e1c0a9-9ebc-4b45-b231-75ac947a7ead@mail.de>
In-Reply-To: <97e1c0a9-9ebc-4b45-b231-75ac947a7ead@mail.de>
From: Andrew McCann <andrew.2.622266@gmail.com>
Date: Mon, 30 Sep 2024 10:55:02 -0400
Message-ID: <CAPKzRz87tMVoYkmSMrCfVB8xw-6CQq45MfVz0jK_yTExgR-yaw@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727708114; x=1728312914; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L7CwIHc5GgN4+3+MeP28+tO0eyj7FQ+Zf/z2jqv1/rI=;
 b=XchT+lSpSl4r8yyuCspUKb6h2KF6yNRTRGtR2aNx76QZNIPqLb+8YMoTTRuvo2UYcL
 3N9V3h/vJYijJYqNHx6FOeRez5LhyDqtSxv7stn7NDKbqFfyrbX588GWbwY+hNQwrJuv
 1BGwMC53SMbsKNMCTHhcJ/Z6v44B+kxoRWRHMR8iwDErkzeGj9kkGHtdiPMWrvUTPTQY
 9bDChrluuRNjC2WmliIYzC9OP+SguHQN5N6MsJCnVjQ71qK6XHIKpjuzfs0RTwDxY0b2
 84w2J5FV0X1Izcn4BgumMn3DVSiEnpMmefLnAVq87AiT+i6q+BufXfXrhlHG11wmSS5z
 +T4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XchT+lSp
Subject: Re: [Buildroot] Change config.txt Not Working
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6271713780654225258=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6271713780654225258==
Content-Type: multipart/alternative; boundary="00000000000065ed670623576459"

--00000000000065ed670623576459
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kilian
Thanks very much for your response.  I was successful updating the
config.txt using your series of commands.  So I suppose I didn't have some
proper cleanup.  I did not know about these commands, and I don't believe
they are referenced in the buildroot documentation.  Is there a place to
read about them?

Regards
Andy

On Sun, Sep 29, 2024 at 3:29=E2=80=AFPM Kilian Zinnecker <kilian.zinnecker@=
mail.de>
wrote:

> Hi Andrew,
>
>  > I appreciate your effort.  I am surprised we don't see the same thing.
>  > I installed a new instance of buildroot.  Below are my settings of
>  > PACKAGE_RPI_FIRMWARE configs.  I run make, but the contents of board/
>  > andrew/rpi/config_3_64bit.txt do not end up in output/images/rpi-
>  > firmware/config.txt.   I have't changed any other buildroot settings
>  > in menuconfig to try to narrow down the issue.  Any other
> suggestions?  > I'm guessing I'm making some small mistake, but I just
> don't see it..
>
> I didn't try your or Edgar's steps myself. So just a suggestion, judging
> from the outside, what might be the problem, without actually knowing:
> Maybe you are missing some cleanup and rebuild step after changing your
> ".config". Maybe try something like:
>
> $ make rpi-firmware-dirclean
> $ make rpi-firmware-rebuild
> $ make
>
> Ensure, that you have your modified BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
> parameter inside your ".config" when doing these commands.
>
> Maybe also have look at the section "Understanding how to rebuild
> packages" of:
>
> https://bootlin.com/~thomas/site/buildroot/common-usage.html
>
> Hope this helps and best regards,
> Kilian
>

--00000000000065ed670623576459
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Kilian</div><div>Thanks very much for your respons=
e.=C2=A0 I was successful updating the config.txt using your series of comm=
ands.=C2=A0 So I suppose I didn&#39;t have some proper cleanup.=C2=A0 I did=
 not know about these commands, and I don&#39;t believe they are referenced=
 in the buildroot documentation.=C2=A0 Is there a place to read about them?=
</div><div><br></div><div>Regards</div><div>Andy<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 29, 2=
024 at 3:29=E2=80=AFPM Kilian Zinnecker &lt;<a href=3D"mailto:kilian.zinnec=
ker@mail.de">kilian.zinnecker@mail.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Andrew,<br>
<br>
=C2=A0&gt; I appreciate your effort.=C2=A0 I am surprised we don&#39;t see =
the same thing.<br>
=C2=A0&gt; I installed a new instance of buildroot.=C2=A0 Below are my sett=
ings of<br>
=C2=A0&gt; PACKAGE_RPI_FIRMWARE configs.=C2=A0 I run make, but the contents=
 of board/<br>
=C2=A0&gt; andrew/rpi/config_3_64bit.txt do not end up in output/images/rpi=
-<br>
=C2=A0&gt; firmware/config.txt.=C2=A0 =C2=A0I have&#39;t changed any other =
buildroot settings<br>
=C2=A0&gt; in menuconfig to try to narrow down the issue.=C2=A0 Any other <=
br>
suggestions?=C2=A0 &gt; I&#39;m guessing I&#39;m making some small mistake,=
 but I just <br>
don&#39;t see it..<br>
<br>
I didn&#39;t try your or Edgar&#39;s steps myself. So just a suggestion, ju=
dging <br>
from the outside, what might be the problem, without actually knowing: <br>
Maybe you are missing some cleanup and rebuild step after changing your <br=
>
&quot;.config&quot;. Maybe try something like:<br>
<br>
$ make rpi-firmware-dirclean<br>
$ make rpi-firmware-rebuild<br>
$ make<br>
<br>
Ensure, that you have your modified BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE <b=
r>
parameter inside your &quot;.config&quot; when doing these commands.<br>
<br>
Maybe also have look at the section &quot;Understanding how to rebuild <br>
packages&quot; of:<br>
<br>
<a href=3D"https://bootlin.com/~thomas/site/buildroot/common-usage.html" re=
l=3D"noreferrer" target=3D"_blank">https://bootlin.com/~thomas/site/buildro=
ot/common-usage.html</a><br>
<br>
Hope this helps and best regards,<br>
Kilian<br>
</blockquote></div>

--00000000000065ed670623576459--

--===============6271713780654225258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6271713780654225258==--
