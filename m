Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88396C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 05:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BE260783;
	Tue, 20 May 2025 05:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d56UB95JiSgz; Tue, 20 May 2025 05:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A3360A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A3360A7B;
	Tue, 20 May 2025 05:14:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2885E193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E42F8146D
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtN4NjKarmjT for <buildroot@buildroot.org>;
 Tue, 20 May 2025 05:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 163D88146A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 163D88146A
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 163D88146A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 05:13:56 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-70ddcdba474so8822637b3.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 22:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747718036; x=1748322836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+sQIMwpcHqcqIVnM8aQ5qcmAEAR0ZPEs4E6Fd2sib0=;
 b=uC18LZ5jt7zORQG/V45kieRKJDPmhld/ltX72a5tQNEkDC7CsJVYouDdUhCbz9tyoy
 qKhsXZfxEJqgCovTLprkmSjZz4pTuwUdZLJBFWoV7W4VHaVUzqWXZ0BYu5qizLAgMwAw
 nfbiUaET51JchQOynWffjBnYqCTMvU5uNrlb+1iMTjLM6duo5xzuJfyz32JiHVBzmBEj
 SQiiCC+EMPfR9SXjph1Hi93yzKilzisEpQwC/Ys63aOzTqeucioYUmFf1qkBf8ipLxDp
 vdNJ2YN1rMRFcw5VS6ltp3Qz+BPq1mDXQPf9atjcRVqwCh2+TDiNmcnkvQhlg8aWDJDN
 UaAw==
X-Gm-Message-State: AOJu0YyOYMSYxV6hD7XBse/gGjdpJefjyhe7RJSPztH891qcLDCSEXXb
 Gn/HdbGVguwLa1+eY5ENh5jfCnmQYZx0E2FSVe8xybxhX2Vn2J7AoRfa6z29pu4ReEy1yLAMooe
 UuNPVikosh7Cf5W+A4ChRjnpfyTqL6IS0MA==
X-Gm-Gg: ASbGnctUJSfiz1Ajc8QBgJuYcPjZj56+ZIVjWj1aXPxQWOwuuWkUadsby6yKVcBfb0s
 fXNSCNwJ+EY3mHtIBG8EGbWOI+2aFTxIH5yNQHvS3+jqYHj/NXf+y2FQktiPverqWhylDjnJTbw
 DjL12kuIvpXJoabhJ9E3dXpi4bMTsnnJvVe/My+mgwUgV3
X-Google-Smtp-Source: AGHT+IGsx1HTf+3bpeiC/GDniEWr3O1218qN+HHHLFqcif/xh6LY0Con56iwpx5dVCayUf4xTkoBelk+JQklxqxopZQ=
X-Received: by 2002:a05:690c:368c:b0:70c:8da5:6622 with SMTP id
 00721157ae682-70ca79f429fmr212933627b3.18.1747718035741; Mon, 19 May 2025
 22:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
 <20250516225158.706cccf5@windsurf>
 <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
 <20250517084222.7b3a32f3@windsurf>
 <CA+R_deoV8hZZG_bSjD8oYRRR7HyDXaWsa5iWf17LRUkYA3jkAA@mail.gmail.com>
In-Reply-To: <CA+R_deoV8hZZG_bSjD8oYRRR7HyDXaWsa5iWf17LRUkYA3jkAA@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 20 May 2025 07:13:40 +0200
X-Gm-Features: AX0GCFt1S_PcAyE17JVWPH7IbVqfuIKqqwwkMV4vE8dvaY6dip1c_yPmshZzEis
Message-ID: <CA+R_deojQnhwWqnRRkCLzne_n88rVgPcVXcKvoaJDs=4+50ggw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, 
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747718036; x=1748322836; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2+sQIMwpcHqcqIVnM8aQ5qcmAEAR0ZPEs4E6Fd2sib0=;
 b=TBHP7O7kb6jheX+yx33GKukb7h4xWSTIxJhesZJTTVC9/7qYjXlP1WuoNktp5Mz+Ta
 dRhn1REg0QdIYYIlaxreNZ8X1UX2CMAprmRAZ+asT38/0755LM4mvRi8vFvCc1E6SSCe
 PfPS6PSFU6Bk7f9eLfTLDPP7+SmJn0cRpwjNHStwMsgcgtYAc0kTZPfB7TjZ4NzJtnrj
 cT+D19Octl598xKoAMWWSwAgfbvIOApjdt1UthKl8NYJphud+jXZKgEEBwwtmkZN/JtG
 bc858A/98uZmdSwRK0OXjBtLX5pPD4dIWlGPftfyMLUydOq7uib4GgLb2gKfgeZSQOU3
 RLNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TBHP7O7k
Subject: Re: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5842823791588722488=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5842823791588722488==
Content-Type: multipart/alternative; boundary="000000000000b026bc06358a5021"

--000000000000b026bc06358a5021
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I encountered another build failure, so making a v3.

man. 19. mai 2025 kl. 23:13 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Hi,
>
> In this v2 I think I have fixed the most glaring problems with qt6tools:
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D457528
>
> Regards,
> Roy
>
> l=C3=B8r. 17. mai 2025 kl. 08:42 skrev Thomas Petazzoni <
> thomas.petazzoni@bootlin.com>:
>
>> Hello Roy,
>>
>> On Sat, 17 May 2025 07:18:19 +0200
>> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>>
>> > fre. 16.
>> > > What does this mean?
>> > >
>> > The last sentence ended up there unintentionally during a rebase.
>>
>> OK, that's what I thought :-)
>>
>> > I think it is best to drop patch 10/10 for now. I can reintroduce that
>> > change when I need it.
>> >
>> > By the way, is 9/10 too large? Should we split the commit? Maybe it is
>> > better to gradually fix the concrete build failures than "starting
>> > from scratch?"
>>
>> What are the concrete build failures being fixed? What are the
>> "on-going" issues that you are referring to. Keep in mind that we are
>> maintaining a LTS branch, to which we backport fixes so we really want
>> to understand when things broke, and therefore whether the fixes should
>> be backported.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>

--000000000000b026bc06358a5021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I encountered another build failure, so making a v3.</div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">man. 19. mai 2025 kl. 23:13 skrev Roy Kollen Svendsen &lt;<=
a href=3D"mailto:roykollensvendsen@gmail.com">roykollensvendsen@gmail.com</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi,</div><div><br></div><div>In this v2 I think I have fixed =
the most glaring problems with qt6tools:</div><div><br></div><div><a href=
=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D457528" t=
arget=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/list/?serie=
s=3D457528</a></div><div><br></div><div>Regards,</div><div>Roy</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">l=C3=B8=
r. 17. mai 2025 kl. 08:42 skrev Thomas Petazzoni &lt;<a href=3D"mailto:thom=
as.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Roy=
,<br>
<br>
On Sat, 17 May 2025 07:18:19 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; fre. 16.<br>
&gt; &gt; What does this mean?<br>
&gt; &gt;=C2=A0 <br>
&gt; The last sentence ended up there unintentionally during a rebase.<br>
<br>
OK, that&#39;s what I thought :-)<br>
<br>
&gt; I think it is best to drop patch 10/10 for now. I can reintroduce that=
<br>
&gt; change when I need it.<br>
&gt; <br>
&gt; By the way, is 9/10 too large? Should we split the commit? Maybe it is=
<br>
&gt; better to gradually fix the concrete build failures than &quot;startin=
g<br>
&gt; from scratch?&quot;<br>
<br>
What are the concrete build failures being fixed? What are the<br>
&quot;on-going&quot; issues that you are referring to. Keep in mind that we=
 are<br>
maintaining a LTS branch, to which we backport fixes so we really want<br>
to understand when things broke, and therefore whether the fixes should<br>
be backported.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>
</blockquote></div>

--000000000000b026bc06358a5021--

--===============5842823791588722488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5842823791588722488==--
