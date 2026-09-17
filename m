Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95747C982D6
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 14:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA97404EE;
	Thu, 17 Sep 2026 14:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UZdbfTycadr; Thu, 17 Sep 2026 14:12:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 375C1403CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789654356;
	b=aD6ipxrcZR7EJen/0RjHVhFFnbJBgKr2tYpA6RdFoMmEmHeoFWWCV23ztu3oSaPBG12V
	 3I00nqr7fhXSLB3oiNv0SP2Tz8KfePt9AxoodLrmtdsxP0W9UtW8BUxJXUqtdZcAGV76A
	 IAVLYRCbihiKD5dPGK8M3Tf00ieSoOkhF79S4wnPn1MC/R92RjL/76wa+dyKMC7T5xzOz
	 Wd76+6okqgS+4bSoEELMhAIF0EGMnWJLqLG3ywxSBgOpo9ElgXxSMiU4YbdNLxG6BRrq9
	 lE5QjMYzcpP19iIbZAe+PFnw8NjZETV4i9kHvZTtRON38XCHXCJwzJT6uQ6sQgqeP1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789654356;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:In-Reply-To:References:
	 Organization:Date:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=xwYHYuefwZuM1/izbDUrEAo0+ClHiMSovfxWDq68JGs=;
	b=TmXnj0FA7sHESn/sHLvrDb3WCaxi3tGtAU3w8aK/S6cnvM50pS2fHZw74cJRepMQ+UL1
	 6s2CAx9vuS81A9DiYZUiw7FGh135vY18wvSqYNLQBqrtLEUKw99RBMBc8PMMe4t/R//yD
	 ONOBFFej5rRERw1UCG8GQWJIHPjPm9W6tkl47Zh8C3D+57ts5yaWOTAhC4EVdPdTgmnoQ
	 0LQ10aofIZRjzSGYDvQp2RO9838TXjye0nKXS9z26pP2HoUaHrq2sLcqVz5rrS2bDmiof
	 aLYuCQwr41tFuyQVmmnswwTk3sb5Rjfs8DtWOxTw45/QqWLEKbQC5l/1a0FI0HS8fNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789654356;
	bh=xwYHYuefwZuM1/izbDUrEAo0+ClHiMSovfxWDq68JGs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUuv1sY+3vikRWYfBg/VVVCav3ZVR+wBGk6ygqTObYEHnuIqoVctaLOG68hMxVauY
	 j1BXML0dcskkl/u9yzmELkRuxSw6NbPa2RSnDJI18CuF+utbESs8NYZaZUYd59AW9/
	 7NCBur58BTggzX1ITToX3mbhAQFEcTF8V5hny+dKlSeLcspPDN+0TDfCHYutdc0U6o
	 DYWUEfxKMgyX4CeumhmRdSKBVvBN42IeFCHhUHpupoK68H2JDjy7KfvOjoRrLnJz4I
	 +HL8iFdfUxDvTv+eynEu8WombcpObnTtkMMQlRB9PyMKkZRZOY9ajcxinb/XPHS3KB
	 0y8RC98jOQVdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 375C1403CE;
	Thu, 17 Sep 2026 14:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14FC113D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 14:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF61A4011F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 14:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vdKOBnkALuO for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 14:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 060224007D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:38::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789654354;
 b=MaDLREV0BKNIj1P+MPInxBOln5zJ/NGG1l0heHsqE0/EXJ1vDVrNeRaz7BDqfdPHXn2A
 ufw+GO0atARYZ+CnvZ361BnoRWN+h1ikjg97+M49rroFi+Gujmdht8s085mLh4z0QK5YI
 KMLcZUfq8BSO1pgph81hRGgcJ8vLbcmW9nI3XyTnrgrnj7I0B3xp4GTzV1BqzoFDhL4sq
 Pj2oH0BKa4hN8twEX7rA2n2Pquuyn0LQvPM+Kk+82+ZWBELN/l0R8Iwd3OWCblVkF3Z91
 7wOyZqfNijTrS11wcwUFeqcL+Iqj9Ic/t6eZqr9LnWNB047i4s0RgTmU/fBsCmdPMaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789654354;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:In-Reply-To:References:Organization:Content-Type:Date:
 MIME-Version:User-Agent;
 bh=u6yNnvYt/zK4oZ/4w00MGKmifF0udf5c68h4bwBDRlI=;
 b=D4qY/ecs7ql4XARBdl+Dfx1CrdoParTxG3Ph9IyEI0aTtLs1LlbBGthPeOS1c6oPQs6j
 KpZb9zOMXY8s7cUUQxl6/AlpmUscR7ZTv422cX30MR7w2KmHpPlW9FXpvnrmxrSd8ySEB
 Ck4lvAaMZfxtTHDY+ScQKJen0YYlU/WF+yIaBgRiXWb2uaPVp+1naxtkkOZ4jTA8OhOHt
 iBzS2ysMDWg2uo3GwjqqWlnq9VIgPrS5N+WQ4srpS0q8dhWx4qmiBPBnum+P4891fRdlW
 vhr/w+Q+2HycGXcRcFwLw9XViyPjTHM2BcvbwQaJ+AtUNCfXQzHRotxUIv6UGZ0XQhw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eDVOX554; 
 arc=none smtp.remote-ip="2a00:1450:4864:38::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:38::2a; helo=mail-lr2-x2a.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eDVOX554
Received: from mail-lr2-x2a.google.com (mail-lr2-x2a.google.com
 [IPv6:2a00:1450:4864:38::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 060224007D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 14:12:33 +0000 (UTC)
Received: by mail-lr2-x2a.google.com with SMTP id
 38308e7fff4ca-3a318299b38so8527811fa.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789654351; x=1790259151; darn=buildroot.org;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u6yNnvYt/zK4oZ/4w00MGKmifF0udf5c68h4bwBDRlI=;
 b=eDVOX554qVaflGofR8VUeWNTvHuKS5n7bLxi7Njc4DtNCDN4aMjjU5TCkidsSBxEaw
 jtNusVV9Wn3JXv7+g3Q+xog5HYXj0E9exQ+SIeezGytnrtEkCN1/4Nk7kt+CY8qGKW2x
 OsubPOOtZhpfOP4l30dggCCGUnmh/MFRPK8P+eAyXQiC59VDEcCTg9og3PJDssDnKn+C
 SI/wvzq5+RNdG93s0nnYhmAY9jEyCkbAQgSDCYkVpjFjs7dmLii4KbSF80xj127Kq4Vg
 8h8ZFxgDSdL7oc6cDga64lZG1G57yx/LmfreMqs1zCO+/7B2nYCARbHSSY0uALOxxyxm
 A5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789654351; x=1790259151;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u6yNnvYt/zK4oZ/4w00MGKmifF0udf5c68h4bwBDRlI=;
 b=yXovOB1o5p4sgUsaFuEHK+V5dd5s7/xy4C7Ku8WhbGM2uzeS5o5WZ1A/46YS7y7LLy
 /7VfAQ8yiE0F140lNZ76c2+ul7nxmh/VXMRKskkOVGppZZJQ5T7tcMPVQqxCBjOdo7X6
 +WdwXJ4sAH1Oz+OQeSZ4LlpgDXGt4SyK/UA95PTT6kZ3huGFxFphC8quCxZeQFurLkd2
 eS3jAR1AI2RkoquHotVwp875AT1RPxgJDrBTzpJiY4KpCh95uX99a6smDIJenlauDSva
 F+iA7iYZOAPW4eIqEbK7u+ZxQPa97V+qXm0YEOhWEDXzd0aYKeZ2hHYfN160XkKXfgdz
 gJbQ==
X-Gm-Message-State: AFuF++nynuYgRsScn37pwc9aahG7m0Jc57GPDzzLlW5QNJJItmnIFWT+
 lI51DaLfv1GSlsPWwCz89ixi6F6jWm+6+Fvd7UPaQmrTT73Xirq6D291
X-Gm-Gg: AYBFou1bqBYmTaiHkibv8ecAxlNbZoHYMogUkqIY2M/x6tw7UGi6xwGl37zYAx2MyAb
 QrFK/1U6Al4zTmqSwdGVnQjVOGYWzT52kDHUq9gBI76n2hyCYz25cHiUlRp70aXtp6NLT9aR0sj
 25u0ppPy3vpeaypweIt5xzYnZ/OZ08RA5QLynFhSedA79NESjgwBE2TrTU4UveMLxD1gSzdAYkG
 FsA5NdtyDzyZS/Q0WdPtO0AXf4GdVEVQaMcAEsN4/weKKxp99X5OU6ncEuaX7xWnpQEZxfcWchx
 VScrQ2ol6d39Ve46QCpaCBIqSNfViZJHSua/lRn4TAw6HySRdUGiXZGs9lwKHqE9ixQ5mBYw14T
 g4+f+ZW75A3eJeFvNPSenHDDe0cdlGn3ssK2s7JzJbpja9pCZyHJN/0wD3HHL1gMs7GC/g3XT03
 SiHg9PHfE/KWWGHh0GIXnnlbSf5KIlPkeWpOJbe1cCAGEyL7MbupXcajr3Hks6neiAZ1c9MJ6mM
 KXfFfy/laC/sUg7DGh0mImGdSn7EHwfqOwYUSnArIDD1SZ+dax/t0j1YU8=
X-Received: by 2002:a05:651c:41d8:b0:3a3:7680:67f9 with SMTP id
 38308e7fff4ca-3a5dca054femr12373781fa.24.1789654350842; 
 Thu, 17 Sep 2026 07:12:30 -0700 (PDT)
Received: from [172.20.10.2] (host-95-193-178-66.mobileonline.telia.com.
 [95.193.178.66]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a5dafa9510sm13696571fa.24.2026.09.17.07.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 07:12:29 -0700 (PDT)
Message-ID: <6eb130833663f005da1547e17c30781b3b3330a4.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <aquaR_Y91tlsUAUn@windsurf>
References: <20260914103020.3485030-1-troglobit@gmail.com>
 <aquaR_Y91tlsUAUn@windsurf>
Organization: wires.se
Date: Thu, 17 Sep 2026 16:12:28 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Subject: Re: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 4.7
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
Content-Type: multipart/mixed; boundary="===============3257603004692796089=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3257603004692796089==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zKj17Nt6Z1d48dEg9UCV"


--=-zKj17Nt6Z1d48dEg9UCV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-09-17 at 09:44 +0200, Thomas Petazzoni wrote:
> On Mon, Sep 14, 2026 at 12:30:20PM +0200, Joachim Wiberg wrote:
> > - Fix invalid daemon path in S41mrouted
> Is this invalid because of the bump, or was it already wrong for
> mrouted 4.6 ?

It hard-coded /sbin/mrouted but the daemon has always installed to
/usr/sbin/mrouted, so it works with BR2_ROOTFS_MERGED_USR=3Dy but not
without.

Best regards
 /Joachim


--=-zKj17Nt6Z1d48dEg9UCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmqr9UsACgkQ7Kgmo3ts
dAlf1xAAgXzZOyXiEth8bpwxTKriC0iQ1H7bviWSoHPRCj6xmCS5jfLIt0LceCkV
z8XtMdEbbUUYMlru4/WZFvtLyrFUvQBrN6F/mpBeh4Tpx860b/W0LzGO3fpLFNqN
v1MoC24zSufgLMKyI7bXNlOGkAgU9v1uazARbbtflXMtejlCsNR0bISvtG/FUKe/
XHImt/cI2YN5FY8e4uJTSm6/WFShj1aI3EPjFXTMNk2DoCiR7GsxiXdeTjNsnaCD
4Bwbtc9f6/1tOeLQyH+t4wh4pdJe7fWvReUQ2JAv5TKrgQtCBVzVQwkdhhlUUTmZ
g8ubDw/txUwAhohg6LrJ7tXDQ9Uw77gGloBbaZt7VTrEtf03tuFg4Ub8jzz9zoW6
Fb9dH+NXtPF2aNUGEK98aNVQH3dAnvD9+NSSpXRdP/IAhxvRswkEuhnTruRX4sv3
EvxQrh4L4GuqikpSzccSej35utYW6liNDTJRk29OOBXXlbr7VKpDCkTqsqcc6FSL
WXKblOiu+aHWG21kny/6IeyzT9TAv41WwPEYA8n2LrJUa+TpEtQKc41EqXlrHEVk
n80nvYOBpiluPeDRMkrebwktAcDni+RfL33e0hmNOBObf8S9CaSay5pcyhNVR5Ep
Tpd0LQimodBj98PWTssNOkyiAvhotuQ4ISZ3YT2SPxHUFRZxqvE=
=ML0E
-----END PGP SIGNATURE-----

--=-zKj17Nt6Z1d48dEg9UCV--

--===============3257603004692796089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3257603004692796089==--
