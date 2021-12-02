Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F0C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 10:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B82A83E07;
	Thu,  2 Dec 2021 10:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsUmYbgn6Jy5; Thu,  2 Dec 2021 10:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 167A383E36;
	Thu,  2 Dec 2021 10:41:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF471BF3E0
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 10:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 041E941D64
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 10:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xi_VyoBaPLiy for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 10:41:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C1C9409BD
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 10:41:43 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x6so113776099edr.5
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=TISMUCDPbGqCrDm1ndPWl4oqDiNwuXRs3iY/DVg9F5o=;
 b=yx8XCq9wqeJE5Gi//WLbeGcPekY0tloGRlGRHS7xdPzX7Q3FCCqggvqNdtX5Gj4aJn
 KSXXUcy2YAaWxl3WsHNrqXEhUOgLP9B5mxo4dMHCZ4ADheLc16VOOU9hsVVE8DWFKNJ5
 nzqdT+lf5Kt6maJN9brC1UJktsBClLjT2vj7t4VWRy6yUZoaCC3Poji3QdUoirB/1olT
 PBdVZr4z3cDLtGD82SlE4PosFFO3uJBEupKf3VZ5JcS8O5gG+ySPQ4ng4R7x10/yKjuz
 +SKxGAH9CuS9jQb5mjixjkwoF322ZWVVBu61J4PH7qAXTF4hL2XlFmLOEarOPWWpDEcO
 /Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TISMUCDPbGqCrDm1ndPWl4oqDiNwuXRs3iY/DVg9F5o=;
 b=Adpy5jnPMHxitRY6f8Yzuz65kJiRkXJPTb36TCLktnaZ2dC1z12ytvQjaoHmBKAlZm
 GkU24ZlGbagAFNYnKhNBVg7AYveC1Bp5yK2QgwNgZbN8QLRVpEtmPwXxNXoLHztKSEbz
 4WCvymF/5ebIJN3iSW3GGM9/R9+ShCWAdW/Q50Pz9UxblkTaAPUl7iSN8VO9XmM9DHIJ
 X51Q14IRjAikLSuXSAqoFDWfVOZnjxs4m6PsbisSUcPY5SiVAUszpCi3LYwefmM+9hHu
 /iYlfUYXDK2TclYM8Nq+uUH8uhJnOecRWstFo8yQN050raqnE7YpzUK6SbbEkOegM7qd
 uBsQ==
X-Gm-Message-State: AOAM531/zZIgYwWCYcbj3U0Br6FyzHBGOztYUl9enn+VAaYyF34lRcHT
 BzEDZKfYk3TUroCCSKkv4JP2QflDcxX4lzBZ3t4RgeZq9z42Lw0hZiA=
X-Google-Smtp-Source: ABdhPJxF3Dl2Sv+a0p2AXqUC/fEyRO50tVrLOSThrrqKv0rmlqLx/NgPz9LNrasLOyw+4SZetn87Sj0nPBA7pmBtRCc=
X-Received: by 2002:a17:906:309b:: with SMTP id
 27mr14081207ejv.129.1638441701621; 
 Thu, 02 Dec 2021 02:41:41 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Thu, 2 Dec 2021 12:41:30 +0200
Message-ID: <CAJPV9MrzFk0obQYSyFKeF-PgQfnOi6GKow3tSPomtLcmdor3Yw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] New packages question
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
Content-Type: multipart/mixed; boundary="===============4478607639298162213=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4478607639298162213==
Content-Type: multipart/alternative; boundary="0000000000009c599b05d2276f8b"

--0000000000009c599b05d2276f8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm reading a package for bmx7 to be upstreamed.

I found the following error in one of the toolchains
(bootlin-x86-64-musl), and I wonder whether it is an issue
in the toolchain, and if it can be a blocker for the package to
be merged:

In file included from
/home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-mu=
sl/sysroot/usr/include/net/ethernet.h:10,
                from
/home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-mu=
sl/sysroot/usr/include/iwlib.h:29,
                from ip.c:51:
/home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-mu=
sl/sysroot/usr/include/netinet/if_ether.h:116:8:
error: redefinition of =E2=80=98struct ethhdr=E2=80=99
 116 | struct ethhdr {
     |        ^~~~~~

Best regards.


Jos=C3=A9 Pekkarinen.

--0000000000009c599b05d2276f8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px">Hi,<br><br>I&#39;m reading a package for bmx7 to be up=
streamed.<br></blockquote>I found the following error in one of the toolcha=
ins<div>(bootlin-x86-64-musl), and I wonder whether it is an issue</div><di=
v>in the toolchain, and if it can be a blocker for the package to</div><div=
>be merged:</div><div><br></div><div>In file included from /home/debian/br-=
test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr/i=
nclude/net/ethernet.h:10,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 from /home/debian/br-test-pkg/bootlin-x86-64-musl/host/x86_64-bu=
ildroot-linux-musl/sysroot/usr/include/iwlib.h:29,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ip.c:51:<br>/home/debian/br-test-pk=
g/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr/include/=
netinet/if_ether.h:116:8: error: redefinition of =E2=80=98struct ethhdr=E2=
=80=99<br>=C2=A0116 | struct ethhdr {<br>=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~</div><div><br></div><div><blockquote style=3D"margi=
n:0 0 0 40px;border:none;padding:0px"><div>Best regards.</div></blockquote>=
</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0=
 0 0 40px;border:none;padding:0px">Jos=C3=A9 Pekkarinen.</blockquote></div>=
</div></div></div>

--0000000000009c599b05d2276f8b--

--===============4478607639298162213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4478607639298162213==--
