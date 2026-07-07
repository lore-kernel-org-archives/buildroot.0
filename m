Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D36CC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 00:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE37780F24;
	Tue,  7 Jul 2026 00:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qp4PojKF6w-l; Tue,  7 Jul 2026 00:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785BB80DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783382948;
	bh=DdG5zSO5GCDPMHqX0aIa+4JaDR+TGI+tDw95ZAmPcmY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1ngG2DC/3boiyWWtjqDXnpk+gHkskXEPnhWeaKOIWFJDD4wm5SGPER0xGvGCpI5y
	 YL3Babk3UhtAs3cwjgXkzeh10LAg9LjywMyLCl+z7qQ/ifFi6wGE7R41dj6i7TxKua
	 OyDHlhA6xQszm2L1ALpE7PzcGNIOzEktftBPD2e5MIL02NjxjC93t59Y3anmih0Lcb
	 g5lHS2KX903OgdlvTst71Kq5n2K/ZrPAbW/FOW+d56xU0FOHMYzkOM/D8+FZq0zEb4
	 frqvhd7juUqujsDShvmG9GXIqbW7hqhcHEZLksdFRFxakitLE3GQv2cbdMOTNN0PUx
	 PcXcJGqKVSNqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785BB80DFB;
	Tue,  7 Jul 2026 00:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0C9315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 00:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CEC280DFB
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 00:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCupsr9_ZoU4 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 00:09:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 257D380DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 257D380DE1
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 257D380DE1
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 00:09:05 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-736eea06c3eso1067116137.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 17:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783382944; cv=none;
 d=google.com; s=arc-20260327;
 b=GKuxHfM8ZNlCWq/+ieGrSUZl5PSgUbkQZkckDxE3XZ7YO4mrEDMK40bNzjnWIUy5Je
 +C+WXvlgm9NTvcZC5ORtoD8ElXFmFTTqIg21rIrN+1XJwSLXBT/0PWR5UCB19y/WNspb
 g2hnkfx1HryngJqxY7KxO+SnfGnyDcPGwuvpYEjDfirb5YSbxThdElUxUcxALTsTWp5J
 /mMYAsH2KvC/vvHnaMrMsUmJ+49u55BhaewzPLPF2FDc2Hj1O9l5sH2GEPxW/ocDVolg
 Ewd940okw2ICnNMHFMd6fwhxXdwnoGbOS2XTXEAz8eedglB4WHa1DuFN/MuV9e/+Kyja
 lj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8f0veEMXwRddIiYyjmF/Y1oIx1Znyj2zjT4uGvMZmz0=;
 fh=5mv7vsAz+tscq2odEw6LjWBQPMUvcJpKuWf8cx8Pjn0=;
 b=iMdqWyY8/0cZQeIR0ZcJg+j3UjC3E2jVFmmi/X00AWtor9O7fHSQoJxBm3vvjxOCWd
 967W1W1tjOa89thdMQ9XMkpfVQTRsypSvcLPdiBfBFboNZhPgr1hW0LtTIxcfHA+wolX
 mhIrI5moqrjCu1SDndrlwi9b/KBcVU5O36Z146nCLaP4LxP0ZJYtPCRe8q4Uq1ryka5o
 Wm5wI96D8USucKKeWc9dZJCBenMItzW3+N0jQIJ84Npl1AgAR+fXaBicQ+0aDdgqtzeH
 dxvCd9PvQUqZArmiw0ZTEf9hs02qkrIfTatcP3GEe8A241PUsBxZwIcdj7Csi/MgpmrE
 m7RA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783382944; x=1783987744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8f0veEMXwRddIiYyjmF/Y1oIx1Znyj2zjT4uGvMZmz0=;
 b=GLV1MpJi3OjnNwGHL4I/SCBCy0Q5LSlvYPD3DxjjWYKKq0tII+ZKLUj3kh8I1YIscw
 VCYYrXwbHfoUiXLEJAldtQZnQSYqJm3Isua1xzE8GdJF8yRnEqmWzS7Xl8F22JsecTib
 L+ul8U9LfdWsEkuG6UyMEdRYqIZcnBd9jHVZpqlkPSsYXpugjeZDNswkSbwDuWkL/9Tl
 8+97kZh8us5EMw21nbNMTvixdHZhZm32Rrdfp+X2qWcwmuSd4cph8yC6kdBe/DsnB6ow
 BK72pqLuwziQj/VjXya6mGJ7CD/+MzPqxNcuwNmwqWTf+NXQUMHtEOc/Dvh0ou9JpzKU
 ykzA==
X-Gm-Message-State: AOJu0Yyai9qoP2ovDU9U1eZBRDbBKp83b3UUTccaMDlo+Xksr5qETNj4
 yiS3eTMUZMmTyhwoa3ll20UX4MOQ/kxEyKwJCC4AXi+4rppubtorXl1gnVFRIdgnQfRg69Hf9X/
 u7DodePB9BOIdKqCD+TZ5y61eLhYVGVM=
X-Gm-Gg: AfdE7cnrmTL+otHBGEWDplXexSTbMrtbghDmgbA9iFIW6Ty8GFLxizsZrA8mC6aA/sg
 FwahWW/P3zqCweaslxMbtXizBcQItTJJH4Mt2gJOQ+wx7Lk/Ob+EnF3IQBFKMNbbZj6Aq1Ac+F6
 97+Zr3YNxWPAi/ArA2wJ7uQEOVKs3Z4cmtNvEkDZyCMb/ZEGDDRyDPsWuy1SZIVWG7Jh7C/fk2C
 8W/Q+RR4XzgyBjwBpJ21IiZKOILGKFFfJ52L3H5efvy6VQSR0g81bGJxSPfsziHfAhw4jZcxXTC
 ieVUG8o=
X-Received: by 2002:a05:6102:15a6:b0:737:1d2c:f31b with SMTP id
 ada2fe7eead31-744b7ea2635mr1660191137.25.1783382943494; Mon, 06 Jul 2026
 17:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <81101c7c33d.089a792a7c6c.8637372150373603044@ctx-coder.com>
In-Reply-To: <81101c7c33d.089a792a7c6c.8637372150373603044@ctx-coder.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 7 Jul 2026 02:08:51 +0200
X-Gm-Features: AVVi8CesltJedEzxusOV-MOITgve6uZO72Cblq9R1UUT6OWFQjg-YsJAzMlgxkA
Message-ID: <CAH+XeQZxiMEEk9y1U4G84V6LCXqE0yviF5zUQnkw7+O8jw2vKg@mail.gmail.com>
To: Luca King <luca@ctx-coder.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783382944; x=1783987744; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8f0veEMXwRddIiYyjmF/Y1oIx1Znyj2zjT4uGvMZmz0=;
 b=MIJtlh+orhcp8tWcjD/3GBXcIJVFIK1tAsMY+wu4bBOjeJJnzrrCPwCqmKGW82DN/B
 WuGbttYTxnlVHFwxMqHv2LkJ7szoEvULAvTGHua2P4BZwsrVVPfmcgtdGONYU+ktxMee
 HZHYCcArnF3N+jHvu91q1lDr5e7fZE/Sv3YjeXLRs5nmV9HeKa9B2uhADtBUfMbmY0lg
 IuO3oSGIWGskxvcJbsYkwprFEDNLx1zigBtj0M4Sei1NTlWYIMgFMM9cpbI3yKKvaSB6
 suRRK6NQdqRX49ly8PA7mhJgBZsiSu1r7HIKf7q4W+6TQMH+z0va6WKsnNt+6LQI0xSw
 5KJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MIJtlh+o
Subject: Re: [Buildroot] Buildroot ZFS update
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
Content-Type: multipart/mixed; boundary="===============6683478125364840176=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6683478125364840176==
Content-Type: multipart/alternative; boundary="000000000000d877410655fa3260"

--000000000000d877410655fa3260
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello @Luca King <luca@ctx-coder.com>

Let me add the Buildroot mailing list to the CC.

I don't use LLMs or agents for my git patches; the code I submit to
Buildroot or OpenZFS is entirely my own. This is not an opinion on whether
one should use LLMs, it is simply my personal workflow for Buildroot.

Each time OpenZFS releases a new RC or version, I go through this checklist=
:

- [ ] Check if the external patches are included in the release; if so,
delete them.
- [ ] `./support/testing/run-tests -d $(pwd)/dl -o $(mktemp -d) -s
tests.package.test_zfs.TestZfsGlibc.test_run`
- [ ] `./support/testing/run-tests -d $(pwd)/dl -o $(mktemp -d) -s
tests.package.test_zfs.TestZfsMusl.test_run`
- [ ] `./support/testing/run-tests -d $(pwd)/dl -o $(mktemp -d) -s
tests.package.test_zfs.TestZfsUclibc.test_run`

Normally, these tests pass without issues. When something fails to compile,
I open an issue in OpenZFS, followed by a tentative patch to resolve it. A
few times there is a problem with a WIP buildroot commit, that's requires a
typical git bisect.

Do you see anything here that I should be worried about, or that seems
wrong?

Greetings.

El mar, 7 jul 2026, 1:45, Luca King <luca@ctx-coder.com> escribi=C3=B3:

> Hi Jos=C3=A9,
>
> I was looking at the Buildroot ZFS update around the 2.4.2 bump.
>
> I'm curious are you giving each agent its own worktree every time?
>
> Luca
>
>

--000000000000d877410655fa3260
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><span>Hello @Luca King &lt;<a href=3D"mailto:luca@ct=
x-coder.com">luca@ctx-coder.com</a>&gt;=C2=A0</span></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Let me add the Buildroot mailing list to the C=
C.<br><br>I don&#39;t use LLMs or agents for my git patches; the code I sub=
mit to Buildroot or OpenZFS is entirely my own. This is not an opinion on w=
hether one should use LLMs, it is simply my personal workflow for Buildroot=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Each time OpenZFS rele=
ases a new RC or version, I go through this checklist:</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">- [ ] Check if the external patches are incl=
uded in the release; if so, delete them.</div><div dir=3D"auto">- [ ] `./su=
pport/testing/run-tests -d $(pwd)/dl -o $(mktemp -d) -s tests.package.test_=
zfs.TestZfsGlibc.test_run`</div><div dir=3D"auto">- [ ] `./support/testing/=
run-tests -d $(pwd)/dl -o $(mktemp -d) -s tests.package.test_zfs.TestZfsMus=
l.test_run`</div><div dir=3D"auto">- [ ] `./support/testing/run-tests -d $(=
pwd)/dl -o $(mktemp -d) -s tests.package.test_zfs.TestZfsUclibc.test_run`</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Normally, these tests pas=
s without issues. When something fails to compile, I open an issue in OpenZ=
FS, followed by a tentative patch to resolve it. A few times there is a pro=
blem with a WIP buildroot commit, that&#39;s requires a typical git bisect.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Do you see anything her=
e that I should be worried about, or that seems wrong?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Greetings.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container" dir=3D"a=
uto"><div dir=3D"ltr" class=3D"gmail_attr">El mar, 7 jul 2026, 1:45, Luca K=
ing &lt;<a href=3D"mailto:luca@ctx-coder.com">luca@ctx-coder.com</a>&gt; es=
cribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u>=
</u><div><div style=3D"font-family:Verdana,Arial,Helvetica,sans-serif;font-=
size:10pt"><p>Hi Jos=C3=A9,</p>
<p>I was looking at the Buildroot ZFS update around the 2.4.2 bump.</p>
<p>I&#39;m curious are you giving each agent its own worktree every time?</=
p>
<p>Luca</p>
</div><br></div>
</blockquote></div></div></div>

--000000000000d877410655fa3260--

--===============6683478125364840176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6683478125364840176==--
