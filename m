Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8251AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC01D60F41
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC01D60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429FC83B26;
	Fri, 15 Oct 2021 05:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoi_kezb7sXT; Fri, 15 Oct 2021 05:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E64883B22;
	Fri, 15 Oct 2021 05:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5991BF2FB
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBCB283B21
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mlHtJwZwzMD for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 05:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBACC83B22
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 05:48:12 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z69so3339407iof.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tCCOQkpWKMAuI2EgBcRozZRJC9PXSZtPSLht0VHgY4=;
 b=etM5ONjysBKkKBhOogT5kCLqmgUpeqUmmheQdWQTatWmU+zYpX7g/1Q81RBoQa1ayo
 OL2m8JiufyaujUnZih15jcXXXzm56TLA7lelVD96mUTojjdZpilal84M+fRLZmX/eC5Y
 KcsAMufmyTmVJHkE39fd4BElyavwjRmiBmA/SZRzx2LezhXyC1IMBO2MBaDyE5d/lt/s
 WX07ISvspwPCBjLIL47nd3qyizcz8fEYytqj61gZ5fyirPptViuYKA+yPM8HqFJagZdy
 oTZI5bbtLEsrkgYgSpsm1/BORRSXdnj/PESePFXPALYFBKExqCHzQ64ptsyLWbc/BiCX
 7ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tCCOQkpWKMAuI2EgBcRozZRJC9PXSZtPSLht0VHgY4=;
 b=35v77U+dvSHdzehILbMuDREzZKoKC0pjTqeYDhuolKBDYdNS481Jp7rdwdP7Fl4j7D
 y+D8vaVldIdH6vHgca4n9Y2+RfjEKxbxPsIocZXf9Eyd+CEvWwU7lHcCuPNu8jFtyAYK
 Wz47ShX6ua8nqNHqzq3vfakKscla89PyUGEcjV7Yiwk17Zd1bkEdgJtzUfmEQhkLKSyV
 ftRdoBcI9FAK2MaWBMS13uXDx3U0FWl9EnPgZfJD6dj/KnW2oRZmQx+EYsUajbFrflqS
 DzT8qA6ytEWBRkeHN4oSSRiyy7MgK1vNfHsA6mmzkhyzmD/wvrbPVskm+uVUm6HAkPpS
 Rvng==
X-Gm-Message-State: AOAM531IyjgKHyk2AW3PwZV+Hz+9SfIdLF4NxeOlL1NaJLQhy3Q7x5uk
 iPnTcI6HkZEl2JxlrjfAVltixWdMot8in2F5aA==
X-Google-Smtp-Source: ABdhPJwPLFUMzNnZCARyWibUZf3K/LVu+ztVgVLmAPEfKIAuLWofy6VhEELgQwty4agSCxfrz2b043u0qK9hhTCAqtU=
X-Received: by 2002:a6b:ee0d:: with SMTP id i13mr2425219ioh.166.1634276891663; 
 Thu, 14 Oct 2021 22:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
 <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
 <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
 <CA+eej5Niy_Qkag54jkV39WgcCLy2t11=S-gY+UndMtjOMqNWpQ@mail.gmail.com>
 <CA+eej5NNTNONO_GX1T=DhRyvbQJzxNhJMrRi-T4Ue-bexYRR3w@mail.gmail.com>
 <CA+eej5NKcWV6n_sM19Px+NP4EoqSDmUqw2W3DdTDGGKQRSqZ5Q@mail.gmail.com>
 <20211012225224.23525d4f@gmx.net>
 <b1aa1e5e-18b1-11b6-0f8d-14982d25ad3b@mind.be>
 <CA+eej5OCBy1brQFnRMQjMqu8DrPtrTgVPRpTT8hKxXTwz5uvNQ@mail.gmail.com>
 <CA+eej5Py5=BfZzMuZS8ARZ5K24xBjGTrpu0iANh7hX9AjK6NQA@mail.gmail.com>
 <20211013182644.6b10f575@gmx.net>
 <CA+eej5M-9OVMikj2YFdL7bDUWKRztiqJZqxk0UzEkYXvHaxh3Q@mail.gmail.com>
 <CA+eej5MVoG1uFTxNyCnSXjdhBQj5enHSxTz_GfFnMioFWihogQ@mail.gmail.com>
 <9af643e3-0047-5fb4-1c17-ed08bc4bf2fd@mind.be>
 <20211014214809.5996d78d@gmx.net>
In-Reply-To: <20211014214809.5996d78d@gmx.net>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Fri, 15 Oct 2021 06:47:58 +0100
Message-ID: <CA+eej5M6nDVoHb9XWTKa+=pOz7SmR4GLHO5Bhm28fWnCkaVsQg@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3209941307184964104=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3209941307184964104==
Content-Type: multipart/alternative; boundary="000000000000979fe905ce5dbdfb"

--000000000000979fe905ce5dbdfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done.

Le jeu. 14 oct. 2021 =C3=A0 20:48, Peter Seiderer <ps.report@gmx.net> a =C3=
=A9crit :

> On Thu, 14 Oct 2021 21:30:40 +0200, Arnout Vandecappelle <arnout@mind.be>
> wrote:
>
> > On 14/10/2021 17:24, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > > That's the output in my terminal ...
> > > Can i hope that everything is okay!??
> > >
> > > Le jeu. 14 oct. 2021 =C3=A0 12:35, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
> kouamdoux@gmail.com
> > > <mailto:kouamdoux@gmail.com>> a =C3=A9crit :
> > >
> > >     is it finish ??
> > >
> > >     Creating filesystem with 61440 1k blocks and 15360 inodes
> > >     Filesystem UUID: 721b9a0d-d383-4b06-9469-77944cffb7c6
> > >     Superblock backups stored on blocks:
> > >     8193, 24577, 40961, 57345
> > >
> > >     Allocating group tables: done
> > >     Writing inode tables: done
> > >     Copying files into the device: done
> > >     Writing superblocks and filesystem accounting information: done
> > >
> > >     ln -snf
> > >
>  /home/ledoux/Documents/buildroot/output/host/x86_64-buildroot-linux-ucli=
bc/sysroot
> > >     /home/ledoux/Documents/buildroot/output/staging
> > >      >>>   Executing post-image script board/qemu/post-image.sh
> >
> >   Yes that looks OK.
> >
> >   Regards,
> >   Arnout
>
> And take a look at board/qemu/x86_64/readme.txt on hints how
> to run the result in qemu...
>
> Regards,
> Peter
>
> >
> > [snip]
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000979fe905ce5dbdfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Done.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le jeu. 14 oct. 2021 =C3=A0 20:48, Peter Seid=
erer &lt;<a href=3D"mailto:ps.report@gmx.net">ps.report@gmx.net</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 14 Oct 20=
21 21:30:40 +0200, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.b=
e" target=3D"_blank" rel=3D"noreferrer">arnout@mind.be</a>&gt; wrote:<br>
<br>
&gt; On 14/10/2021 17:24, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt; &gt; That&#39;s the output in my terminal ...<br>
&gt; &gt; Can i hope that everything is okay!??<br>
&gt; &gt; <br>
&gt; &gt; Le jeu. 14 oct. 2021 =C3=A0 12:35, Esa=C3=AFe Ledoux NJONGSSI KOU=
AM &lt;<a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blank" rel=3D"nore=
ferrer">kouamdoux@gmail.com</a> <br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:kouamdoux@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">kouamdoux@gmail.com</a>&gt;&gt; a =C3=A9crit=C2=A0:<b=
r>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0is it finish ??<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Creating filesystem with 61440 1k blocks and 1=
5360 inodes<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Filesystem UUID: 721b9a0d-d383-4b06-9469-77944=
cffb7c6<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Superblock backups stored on blocks:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A08193, 24577, 40961, 57345<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Allocating group tables: done<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Writing inode tables: done<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Copying files into the device: done<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Writing superblocks and filesystem accounting =
information: done<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ln -snf<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/home/ledoux/Documents/buildroot/output/host/x=
86_64-buildroot-linux-uclibc/sysroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/home/ledoux/Documents/buildroot/output/stagin=
g=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; =C2=A0 Executing post-image scri=
pt board/qemu/post-image.sh=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0Yes that looks OK.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Arnout<br>
<br>
And take a look at board/qemu/x86_64/readme.txt on hints how<br>
to run the result in qemu...<br>
<br>
Regards,<br>
Peter<br>
<br>
&gt; <br>
&gt; [snip]<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
<br>
</blockquote></div>

--000000000000979fe905ce5dbdfb--

--===============3209941307184964104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3209941307184964104==--
