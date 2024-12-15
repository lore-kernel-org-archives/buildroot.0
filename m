Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28712E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 12:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D9F4033D;
	Sun, 15 Dec 2024 12:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzbbrVtMSEzQ; Sun, 15 Dec 2024 12:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562534055D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562534055D;
	Sun, 15 Dec 2024 12:37:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25E6ECE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06F1881119
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4soUhm4Biq6 for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 12:37:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:1c1c:816::1;
 helo=server1.martb.eu; envelope-from=contact@martb.dev; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD0308110A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD0308110A
Received: from server1.martb.eu (server1.martb.eu [IPv6:2a01:4f8:1c1c:816::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD0308110A
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:37:46 +0000 (UTC)
Date: Sun, 15 Dec 2024 13:37:44 +0100
To: buildroot@buildroot.org
Message-ID: <6D5E6E40-0231-44F4-A526-51FC10FAFE58@martb.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=martb.dev; s=mail; t=1734266264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v2lrStw1cAapp0Zi8MhocSKKft5A4Jsr8hz9zeIdgtw=;
 b=ZcCe1Gnuu6eexfxgN3qXIPVOaSSAvIX6/B19tVg4XD626Z8zYi5vDSEKhdoht/4s+z/saX
 NQsPP5AKkZTUWz2BlF9LbD0q9qXm7ccIOC+VMaH5x49Uo/etTXiQNuezPonQqMSTnmCom0
 DCfeEQV/Kk/qFdbCloYMPaK1vZEgcmM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=martb.dev
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=martb.dev header.i=@martb.dev header.a=rsa-sha256
 header.s=mail header.b=ZcCe1Gnu
X-Mailman-Original-Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=martin@familie-boeh.de smtp.mailfrom=contact@martb.dev
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: fix permissions after
 version bump to 125
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
From: =?utf-8?q?Martin_B=C3=B6h_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?ISO-8859-1?Q?Martin_B=F6h?= <contact@martb.dev>
Content-Type: multipart/mixed; boundary="===============5835408043510798569=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5835408043510798569==
Content-Type: multipart/alternative;
 boundary=----D4WCIGUUU15LTPDPQ9P2NHOMCV2DZY
Content-Transfer-Encoding: 7bit

------D4WCIGUUU15LTPDPQ9P2NHOMCV2DZY
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Julien!

I modified it to 0xxx because of the post build step message found here:

https://github=2Ecom/polkit-org/polkit/blob/c1369cd4ffb975e177035392837ff9=
1373774407/meson_post_install=2Epy#L62

Kind regards
Martin


On 14 Dec 2024 23:08, Julien Olivain <ju=2Eo@free=2Efr> wrote:
>
> Hi Martin,=20
>
> On 13/12/2024 06:39, Martin B=C3=B6h via buildroot wrote:=20
> > From: Martin B=C3=B6h <contact@martb=2Edev>=20
> >=20
> > The service failed to start correctly if any custom rules were=20
> > installed=2E=20
> > This commit aligns the permissions with the upstream meson build step=
=2E=20
> >=20
> > Signed-off-by: Martin B=C3=B6h <contact@martb=2Edev>=20
> > -------------------------=20
> >=C2=A0 package/polkit/polkit=2Emk | 8 ++++----=20
> > 1 file changed, 4 insertions(+), 4 deletions(-)=20
> >=20
> > diff --git a/package/polkit/polkit=2Emk b/package/polkit/polkit=2Emk=
=20
> > index fb49f6ce2a=2E=2E6cd2aa6042 100644=20
> > --- a/package/polkit/polkit=2Emk=20
> > +++ b/package/polkit/polkit=2Emk=20
> > @@ -56,10 +56,10 @@ define POLKIT_USERS=20
> > endef=20
> >=20
> > define POLKIT_PERMISSIONS=20
> > - /etc/polkit-1/rules=2Ed d 700 polkitd root - - - - -=20
> > - /usr/share/polkit-1/rules=2Ed d 700 polkitd root - - - - -=20
> > - /usr/bin/pkexec f 4755 root root - - - - -=20
> > - /usr/lib/polkit-1/polkit-agent-helper-1 f 4755 root root - - - - -=
=20
> > + /etc/polkit-1/rules=2Ed d 750 root polkitd - - - - -=20
> > + /usr/share/polkit-1/rules=2Ed d 750 root polkitd - - - - -=20
>
> I understand those two directories needs those updates, due to upstream=
=20
> changes such as:=20
> https://github=2Ecom/polkit-org/polkit/commit/b6169f3113b3ce5ed822e66adc=
c962850c24660a=20
>
> > + /usr/bin/pkexec f 04755 root root - - - - -=20
> > + /usr/lib/polkit-1/polkit-agent-helper-1 f 04755 root root - - - - -=
=20
>
> Why did you updated /usr/bin/pkexec and=20
> /usr/lib/polkit-1/polkit-agent-helper-1=20
> to replace 4755 by 04755? (there is no justification in the commit log)=
=2E=20
>
> > endef=20
> >=20
> > define POLKIT_INSTALL_INIT_SYSTEMD=20
> > --=20
> > 2=2E47=2E1=20
> > _______________________________________________=20
> > buildroot mailing list=20
> > buildroot@buildroot=2Eorg=20
> > https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot=20
>
> Best regards,=20
>
> Julien=2E=20



------D4WCIGUUU15LTPDPQ9P2NHOMCV2DZY
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><body><div dir=3D"auto">Hey Julien!<br><br>I modified =
it to 0xxx because of the post build step message found here:<br><br><a hre=
f=3D"https://github=2Ecom/polkit-org/polkit/blob/c1369cd4ffb975e17703539283=
7ff91373774407/meson_post_install=2Epy#L62">https://github=2Ecom/polkit-org=
/polkit/blob/c1369cd4ffb975e177035392837ff91373774407/meson_post_install=2E=
py#L62</a><br><br>Kind regards<br>Martin<br><br><br>On 14 Dec 2024 23:08, J=
ulien Olivain &lt;ju=2Eo@free=2Efr&gt; wrote:<br>&gt;<br>&gt; Hi Martin, <b=
r>&gt;<br>&gt; On 13/12/2024 06:39, Martin B=C3=B6h via buildroot wrote: <b=
r>&gt; &gt; From: Martin B=C3=B6h &lt;contact@martb=2Edev&gt; <br>&gt; &gt;=
 <br>&gt; &gt; The service failed to start correctly if any custom rules we=
re <br>&gt; &gt; installed=2E <br>&gt; &gt; This commit aligns the permissi=
ons with the upstream meson build step=2E <br>&gt; &gt; <br>&gt; &gt; Signe=
d-off-by: Martin B=C3=B6h &lt;contact@martb=2Edev&gt; <br>&gt; &gt; -------=
------------------ <br>&gt; &gt;=C2=A0 package/polkit/polkit=2Emk | 8 ++++-=
--- <br>&gt; &gt; 1 file changed, 4 insertions(+), 4 deletions(-) <br>&gt; =
&gt; <br>&gt; &gt; diff --git a/package/polkit/polkit=2Emk b/package/polkit=
/polkit=2Emk <br>&gt; &gt; index fb49f6ce2a=2E=2E6cd2aa6042 100644 <br>&gt;=
 &gt; --- a/package/polkit/polkit=2Emk <br>&gt; &gt; +++ b/package/polkit/p=
olkit=2Emk <br>&gt; &gt; @@ -56,10 +56,10 @@ define POLKIT_USERS <br>&gt; &=
gt; endef <br>&gt; &gt; <br>&gt; &gt; define POLKIT_PERMISSIONS <br>&gt; &g=
t; - /etc/polkit-1/rules=2Ed d 700 polkitd root - - - - - <br>&gt; &gt; - /=
usr/share/polkit-1/rules=2Ed d 700 polkitd root - - - - - <br>&gt; &gt; - /=
usr/bin/pkexec f 4755 root root - - - - - <br>&gt; &gt; - /usr/lib/polkit-1=
/polkit-agent-helper-1 f 4755 root root - - - - - <br>&gt; &gt; + /etc/polk=
it-1/rules=2Ed d 750 root polkitd - - - - - <br>&gt; &gt; + /usr/share/polk=
it-1/rules=2Ed d 750 root polkitd - - - - - <br>&gt;<br>&gt; I understand t=
hose two directories needs those updates, due to upstream <br>&gt; changes =
such as: <br>&gt; <a href=3D"https://github=2Ecom/polkit-org/polkit/commit/=
b6169f3113b3ce5ed822e66adcc962850c24660a">https://github=2Ecom/polkit-org/p=
olkit/commit/b6169f3113b3ce5ed822e66adcc962850c24660a</a>=C2=A0<br>&gt;<br>=
&gt; &gt; + /usr/bin/pkexec f 04755 root root - - - - - <br>&gt; &gt; + /us=
r/lib/polkit-1/polkit-agent-helper-1 f 04755 root root - - - - - <br>&gt;<b=
r>&gt; Why did you updated /usr/bin/pkexec and <br>&gt; /usr/lib/polkit-1/p=
olkit-agent-helper-1 <br>&gt; to replace 4755 by 04755? (there is no justif=
ication in the commit log)=2E <br>&gt;<br>&gt; &gt; endef <br>&gt; &gt; <br=
>&gt; &gt; define POLKIT_INSTALL_INIT_SYSTEMD <br>&gt; &gt; -- <br>&gt; &gt=
; 2=2E47=2E1 <br>&gt; &gt; _______________________________________________ =
<br>&gt; &gt; buildroot mailing list <br>&gt; &gt; buildroot@buildroot=2Eor=
g <br>&gt; &gt; <a href=3D"https://lists=2Ebuildroot=2Eorg/mailman/listinfo=
/buildroot">https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot</a>=
=C2=A0<br>&gt;<br>&gt; Best regards, <br>&gt;<br>&gt; Julien=2E <br><br><br=
></div></body></html>
------D4WCIGUUU15LTPDPQ9P2NHOMCV2DZY--

--===============5835408043510798569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5835408043510798569==--
