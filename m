Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF35C61CE2
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0978380D3F;
	Mon, 24 Aug 2026 11:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlhbmRoKcnBY; Mon, 24 Aug 2026 11:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787570437;
	bh=BzLMu++osuUFvxK51+qxqcIy/hLoqMoA1aS2EoLVdWc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfLv9IfEc3WG+rne4ubd2UvC/rSmC/bsjK9GSiXlEwCuQwTfkpWqEAzlHItYgWFSv
	 y/StUxoTSkGb/UdxFZpdcoXM9GO6i48Va3CxhARZP79F+N+6rsPsxJxSGDb0LXkrIX
	 wEw4XaBFiORqZ7tQsEgmyLOSJwroW04HsFeYH+cYh2OZzziO+hBqZffnrPxrxWzf0h
	 QeHh2mIwZHj42qLpyl/z6+OZo+wGJ/i7BmcBLspum7i3EAK2vhJukPtGixlgT5BL/+
	 h2clyuuyGyLTnMQHRIiHjs8PF7vbCJCPWn2xGp/zDLwaz8WkjvOE0yRMTKHQXQyedm
	 hK6jNM8bJ8VVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 172CA80CDF;
	Mon, 24 Aug 2026 11:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6721E29B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5975580CDF
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu6NKbHaG2zJ for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 11:20:34 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=jPXnY/y+
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79B0E80BCD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:20:32 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-4583b1703d3so1751385fac.3
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 04:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787570431; cv=none;
 d=google.com; s=arc-20260327;
 b=kxceJZ6XzXxDZQqymB2Jd5Hbem3bwQL+BZu+4s3xnISjFClf8qsqC+LIUahFNxMvK1
 KQc64KowAm0g7jSIzmZVpMet9PSgNUhWapOBNO2J0aVAETiHrc0f/z82wXXgHn5+8W+A
 XFSMtHGJrko637LAVG+fO+pp6MRveKX7Io/0V181yj/0AsQx1GB/017hkGIbejxAwyN8
 IMglB1zdZzIHfH1kkbJEwUwVALHz+9hlQRP4ea+RPYZXU+9UHYlB1pcnl1AFlcTi/M1G
 V7DbvNE6CE9qT6Rz5Rp/5I2TTWeCZ21wTHTGNmMoBpFWT6HbxYBv13cunaK2dw87Xe2C
 lc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rX4IOkDZwzq5uuX8a6g6dB2FsBHc1RK1Z2fZcRz5iWA=;
 fh=WMMirCp0IvTESJms/QIymyUekEPCI12ylFwTpt51H/Y=;
 b=tBfsIDv9XpGHYxMNhGdTq9Fj1W+ytSihdmV+gcBXMj1ZP+PcPr51XxUrcmEe+o+xUx
 ssWi9V/EporLO24ToB309WnBpR71YikZZYyx2MHUpaHyueCfAkjll2Dku4Gj7gQcK6eQ
 uQK6NEPQz7jNxRXxw/P5RDgsptIH7tQKNsFdeQeWhtFAV+0YlbTjkyqMEGZNSBirMrLX
 4xxqhV4rbREY2r+D8wEZsqP9i1Z3TRb8I+w/Rfr1utt7DeXb6Amf8ySHZYCWgSRWM0SA
 DmId11wuIwn0Q6oD8NN/+PiIY0TMtDACWYgV3ZM7ys3KS7jS+lrXUted9CVQJukhewiW
 ys+A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1787570431; x=1788175231;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rX4IOkDZwzq5uuX8a6g6dB2FsBHc1RK1Z2fZcRz5iWA=;
 b=jPXnY/y+/eOLrJW+MFm1/25xhA3EW8mzdA13qL4icdmiFgX0l67zYhXYzH4SY2De+9
 vc/OWaJoJ6JLXVd68IIIUj9YmtrkhKa5UFv9zDX0fvKGLzxTSfDgYxly6gOd4vg39zg3
 1c6ZUkmpQKNiYMByis5mOcAvdiZ7g50IufuC5N44bHjNY6Rq6BTxOEhNWROmdWE5V5+i
 ZeYOQBk32jvteIaCb3gYl+DJdd2OlJ9n93aaCa082A5cVfZoJ20vMuZj2Jz+59DnDznp
 CH9zgUFLwTJhZBz5mzqu/blHyhlMCNb4SvUwErkmoaUWCWYXGcF3PjsNSr5af2Xs/AJW
 L6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570431; x=1788175231;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rX4IOkDZwzq5uuX8a6g6dB2FsBHc1RK1Z2fZcRz5iWA=;
 b=ga2ifiaA/mfMXX4eC25FqirdjCDRVgw+Rzu6a9NT5F19A/imUQqXjb3uzUdakd6nqg
 p/SAI546unAI0XLcOkqmEog3+h9gkJKQVDFVq1gL98zj8Vmh8e9mojao7WUy3XagZFq7
 OV5hIF1EhTraESNxB8smvJX5Gd3VnpecRfT5//PatBzfRidG/QQ4UpdlxnRY4QcJbA+M
 yyLo1LfK3L3UlypNfjQxfl/0D5FvtVvEl5nZbweJ52SbpMMoOYYpl3gwZeStOkIbvs+5
 kaeGHlg0u0U7tjzd0djDldk2B88GwXUswOBC6KHzJsmRLUX2nVQZvgW7ojNFEuBb+DzU
 wppA==
X-Gm-Message-State: AFuF++mzVvWfN7xdaQpzVQ5vGycn2GsK6gMoyqzGCXLXbfu2ZI3Bb7p/
 OCWduJ1TZ0xyzCiXVNSoT3rH/M6jQINYS1ruFytNGn/n/gzOEegLbsc0Ynj2z8zbqbJujhrMhG6
 B4CmIjRZ3ylUqckmUZbC1oh3XORwR6kxEknGtSzOY+qUs20r+tlGu
X-Gm-Gg: AR+sD12OnHAuxn7PC5EBdFDQ3lLFd5oDNFE/UoCyf/9sGI3AjPp4hCtK96m+2XN3Zln
 q8a9a323gTIAyAnZBBR2YvLkXjthPuiAKe01WaQfqIG3rs19A1Ldp2BrW/Ixwk9WcIg411eA5em
 L31lDMVTaDtIXnN3vhpLHGyjQi+QKCglkJTkg/DAyTgEyay73Nzr4mPwtUl5Y2o9IU7EE1SMV6N
 AH6+DB/+5q7kBPX7qQVmrAFd4TQi9hKXHpQgAtKJ9B4Y18+eVxn1wLJZeso6tzcss8E4ZAt7d4P
 PbxHZTR8ERHdxxBe2Mx2Esx8WOSYWp1HSXaMHINSg8KDCQ==
X-Received: by 2002:a05:6820:28c9:b0:6b1:31f:b0b0 with SMTP id
 006d021491bc7-6b16b1fa76bmr11853434eaf.6.1787570430898; Mon, 24 Aug 2026
 04:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
 <20260824093528.3357438-2-rhidian.dewit@openpixelsystems.org>
 <46ea2d74-b802-42a3-9fa2-56c1f2b76286@gmx.de>
In-Reply-To: <46ea2d74-b802-42a3-9fa2-56c1f2b76286@gmx.de>
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Mon, 24 Aug 2026 13:20:19 +0200
X-Gm-Features: AcwNN1WFwtQFgA1SbbiaLMkywBCBag-22IEBY_IpvxFRrlpgczviRltvbQPuPks
Message-ID: <CAKWiKxEjHakTb6C8C9GpOq9DSxB5JwmP8fRwgkgbZXNm1gvfoA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/2] Check if bootcurrent is valid before
 using it
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
Content-Type: multipart/mixed; boundary="===============4322263840446008242=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4322263840446008242==
Content-Type: multipart/alternative; boundary="0000000000008b931b0659c92c7e"

--0000000000008b931b0659c92c7e
Content-Type: text/plain; charset="UTF-8"

Hi Fiona,

I am actually trying to commit add these patches to buildroot, but I wasn't
fully sure how to approach this. Looking at the zip package for example, it
also has patches for files in the zip project that aren't in the buildroot
repository itself.
I assumed this was fine to do, but I probably messed a step up, how would I
go about adding patches for RAUC in buildroot?
I've already submitted PRs for the bugfixes in the RAUC project itself, but
I assume that won't be in for a while, as the last RAUC release is from 5
months ago.

The second one seems to have some indentation issues.


In what way? I'm quite new to the entire git send-email process, so sorry
for any confusion.

Thanks for your time and effort,

Best,

Rhidian

--0000000000008b931b0659c92c7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Fiona,</div><div><br></div><div>I am actually tryi=
ng to commit add these patches to buildroot, but I wasn&#39;t fully sure ho=
w to approach this. Looking at the <span style=3D"font-family:monospace">zi=
p</span> package for example, it also has patches for files in the zip proj=
ect that aren&#39;t in the buildroot repository itself.=C2=A0</div><div>I a=
ssumed this was fine to do, but I probably messed a step up, how would I go=
 about adding patches for RAUC in buildroot?<br>I&#39;ve already submitted =
PRs for the bugfixes in the RAUC project itself, but I assume that won&#39;=
t be in for a while, as the last RAUC release is from 5 months ago.</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The second o=
ne seems to have some indentation issues.</blockquote><div><br></div><div>I=
n what way? I&#39;m quite new to the entire <span style=3D"font-family:mono=
space">git send-email</span> process, so sorry for any confusion.</div><div=
><br></div><div>Thanks for your time and effort,</div><div><br></div><div>B=
est,</div><div><br></div><div>Rhidian</div></div>

--0000000000008b931b0659c92c7e--

--===============4322263840446008242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4322263840446008242==--
