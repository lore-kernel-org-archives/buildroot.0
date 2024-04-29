Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B580C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 23:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B763480D3D;
	Mon, 29 Apr 2024 23:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx7f9V05d0qM; Mon, 29 Apr 2024 23:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B16E480D80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B16E480D80;
	Mon, 29 Apr 2024 23:28:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76F381BF383
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 23:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64419605A2
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 23:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czTjhpBYblaj for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 23:28:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=huntchr@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFAA160595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAA160595
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFAA160595
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 23:28:49 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ad8919ba0cso4512817a91.0
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 16:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714433329; x=1715038129;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=arsQAOOkjryEr4O0mqIZtdTonX7kVyow2EokJ5MBzVs=;
 b=lztceK5HJjSNRD0g5XvAk1n4gWyDLOEi1mZD+4Zp+GJFnw6Ag3jvTnKx8VE77U7OFS
 L/rKWvAjdCHp56g5S6ALWWwRRW/L1CNbW28Exq5R+RpXmXzQg+DvIGCU9x2UwrWeI4cD
 pvkeI4wobLNqxVSqenu1n+uJnVox2BaX82NuX9faztMkyUO0NK8lm3LQocPg60NcUTnR
 TYcIkkGd820SoD+jWN4LLnOX5oM99gvDnMuTt0DQTnIYARhwLdMEoeKlH3+AhDtx51ZU
 yCkg3PBB6c/B2miKvfmV7HZH/9FV8WNTs2klV+xT5n5Zx0O/Pyom1tvO1ZJkF7+MG/Zg
 bQhQ==
X-Gm-Message-State: AOJu0YyI+o7LxIK3af/cRLy223QL4ET1fBoojxCbCvbKKrIy6YrVauaw
 wDuMHuh1q3xdDuYgcI8opocEM+UKB5JpgGDh3Q+SZwESiq9bThbT
X-Google-Smtp-Source: AGHT+IEltlxTRE1Bf4YsEjbUUeJOcWELVPCWed5/D/ZKpMjO/hwL7sTM9QY2dNvQPWp+Ni+TZ8IPRw==
X-Received: by 2002:a17:90b:4ac6:b0:2ad:5b69:3ba4 with SMTP id
 mh6-20020a17090b4ac600b002ad5b693ba4mr1024419pjb.22.1714433328645; 
 Mon, 29 Apr 2024 16:28:48 -0700 (PDT)
Received: from smtpclient.apple (203-219-238-86.tpgi.com.au. [203.219.238.86])
 by smtp.gmail.com with ESMTPSA id
 gf13-20020a17090ac7cd00b0029fbfb620cdsm19861301pjb.28.2024.04.29.16.28.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2024 16:28:48 -0700 (PDT)
From: Christopher Hunt <huntchr@gmail.com>
Message-Id: <1275017D-8E12-4512-A420-7EEB9254B9EC@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Date: Tue, 30 Apr 2024 09:28:34 +1000
In-Reply-To: <f49f7c39-60b7-45d1-8f61-999147cd75a1@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
References: <8A84B636-FF5F-4B7A-8771-D4D299F8784F@gmail.com>
 <f49f7c39-60b7-45d1-8f61-999147cd75a1@mind.be>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714433329; x=1715038129; darn=buildroot.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=arsQAOOkjryEr4O0mqIZtdTonX7kVyow2EokJ5MBzVs=;
 b=nOIKt0h0zR1TUufuimyNe/IYF9cNqjR6fQgUZs7YGnwI27lrpO0/NoJ/ld5S9IY2gM
 ea5ZBsT0IsV0SEy0TjcS4zXeZlIlmza2IXQozs7w7BYon3sSEr3PDh1TvAuaH43dZTVO
 lRMnvLY3Y1cJyE80sIWE4It67SqRAYynWuwMQXSHnhBhsldRPuRnrRGfS3CeSCsXKoZw
 kM3PhU9NC4m0ZTA0EFYXdSlLwxDjkD1WubkVe16IdL+CeLY1HFsNi6TMVxZfwf1s0b1c
 WoVjxeJbVNB6rILe0OisBU2ewqDOTZ5Aj6F6DDLvl8o4oICZ3AWs76JC44S3NId5yfGZ
 f2fQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nOIKt0h0
Subject: Re: [Buildroot] Custom DTS declaration
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5565741600795993634=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5565741600795993634==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F1C772D4-224D-4910-9048-084A1D783089"


--Apple-Mail=_F1C772D4-224D-4910-9048-084A1D783089
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 29 Apr 2024, at 3:23=E2=80=AFAM, Arnout Vandecappelle =
<arnout@mind.be> wrote:
>=20
> They don't have the same basename, so you'll get two DTBs in =
output/images. My guess is that you booted with =
sama5d27_wlsom1_cuprous_gw..dtb rather than
> at91-sama5d27_wlsom1_cuprous_gw.dtb


Thanks for the reply.

Shouldn=E2=80=99t U-Boot have its own DTS, and the kernel another? That =
was my expectation, although I am confused about the relationship of DTS =
files between U-Boot and the kernel.

Cheers,
-C=

--Apple-Mail=_F1C772D4-224D-4910-9048-084A1D783089
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><blockquote type=3D"cite"><div>On 29 Apr =
2024, at 3:23=E2=80=AFAM, Arnout Vandecappelle &lt;arnout@mind.be&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">They don't have the same basename, so =
you'll get two DTBs in output/images. My guess is that you booted with =
sama5d27_wlsom1_cuprous_gw..dtb rather than</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline =
!important;">at91-sama5d27_wlsom1_cuprous_gw.dtb</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote></div><div><br></div>Thanks for the =
reply.<div><br></div><div>Shouldn=E2=80=99t U-Boot have its own DTS, and =
the kernel another? That was my expectation, although I am confused =
about the relationship of DTS files between U-Boot and the =
kernel.</div><div><br></div><div>Cheers,</div><div>-C</div></body></html>=

--Apple-Mail=_F1C772D4-224D-4910-9048-084A1D783089--

--===============5565741600795993634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5565741600795993634==--
