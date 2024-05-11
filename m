Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A48C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 14:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1066066C;
	Sat, 11 May 2024 14:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9D3EPq-6R5dm; Sat, 11 May 2024 14:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC6F6075B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC6F6075B;
	Sat, 11 May 2024 14:33:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 665451BF47D
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 14:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA8D780A8C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 14:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIuIie1XhPpJ for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 14:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=rosver001@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D80B484355
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80B484355
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D80B484355
 for <buildroot@buildroot.org>; Sat, 11 May 2024 14:33:42 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-de60a51fe21so2985272276.0
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715438021; x=1716042821;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPg1GNtea+640PtlePvoiY3UgUZIdfkcQY1JWN5E5Ek=;
 b=YUah9S4PtXvF+COvwKXcMTAM17wGDyZq7i2i8HfXYENuuHcQP2KDe05GdvEuCZIRr+
 aAtn3IzMEfRaXLiLI+ME4+Pxw4kRxxD/hW4L/3Z5gi80S54UU8tMNNX3u6PIe8EYEj6E
 mHWLBzQlKfRuiv9HidsuqEMYOPdK/xhxaof5qtM+DjLXhNlbhXDByWZ77wg5KMM/1xKK
 tUlS+bFHoaVAbqCrx0DVVPybfAipitgf93mI9IZ+mNMmW2U2aUveYAQSomFxgmeJ4/wA
 VtS84yWjJlYjY4D50WHUiYiqQOP2i64+HBZHXFOe/ssYDJ7wF8hAI3t2Ip/R5siAep69
 gb7A==
X-Gm-Message-State: AOJu0YzXzZO7iG0bKvSvBgheb21h0v3rAuCtUvJkJZmDPylsvwcVbahP
 AJmxuVT9dzNbixyzcH0BCJXHxDCtX2Vth1Cr+iW4mR+0AQ4umdWEYvX8AMcmbEtEsnvvluLXSxY
 Du1KLtsgrjloKvvNGkDIrPjVY0EWcO/iq
X-Google-Smtp-Source: AGHT+IGEywzlAvcBqESRYHdr9F6Yi+l/vj8ITKypYUNIFKaCPeUeyIHc0hSuczuoyOABahwqztMmlDMYwIr7Q9XSXTo=
X-Received: by 2002:a25:ce8e:0:b0:de4:8061:48c5 with SMTP id
 3f1490d57ef6-dee4f336c01mr5893018276.15.1715438021477; Sat, 11 May 2024
 07:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <CACmv0XkyapDVbVCBmJXDpFVn1EwcQHRxVPbvJ-aL4P1iV-5D0A@mail.gmail.com>
In-Reply-To: <CACmv0XkyapDVbVCBmJXDpFVn1EwcQHRxVPbvJ-aL4P1iV-5D0A@mail.gmail.com>
From: "rosver001@gmail.com" <rosver001@gmail.com>
Date: Sat, 11 May 2024 17:33:30 +0300
Message-ID: <CACmv0XnmX1qfmENT7FkoxG9BfO3=RvnQJ2bDUp1WGBALpxUqCQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715438021; x=1716042821; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VPg1GNtea+640PtlePvoiY3UgUZIdfkcQY1JWN5E5Ek=;
 b=bGw/Km2h+3kr0PISYG2DYhO1zANr617t6tGrHVNpr3tyKeZ7hOERmVhLtI1uTUdUMp
 ix6fAEzSd/M933V9qY8nfmYSwZXECHUxFK3Hn7ep1cMO0cuV9ODwSMySQf2KFU5U7KcO
 Xty0yYiw8nJxL8PmwQyzc8p/FNW0ocL3VVxV1Ibc1yjxYtGmoBgnh8u4mLWEWnOOy4JK
 BVyB7LVmls6a/fz+oWqm6rbzBRT4cwFk8FESHaySQd/Nj/we2X7t0QxlDu74crzN7X4d
 1gfVD70T/f/AjCDnhYNJrRSPRmwi/OZiUsxlUGP3VNpjzu1kkEt79z2AwcLEDEiJS5Oq
 usIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bGw/Km2h
Subject: [Buildroot] Fwd: WiringPi is alive again
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
Content-Type: multipart/mixed; boundary="===============2670708891788185783=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2670708891788185783==
Content-Type: multipart/alternative; boundary="000000000000e7969a06182e89cf"

--000000000000e7969a06182e89cf
Content-Type: text/plain; charset="UTF-8"

Dear developers,

WiringPi was deprecated some time ago.
https://web.archive.org/web/20220405225008/http://wiringpi.com/wiringpi-deprecated/
It was removed from Buildroot.
https://github.com/buildroot/buildroot/blob/7763ba7007172ceb5e928ae5902735d727aaa90d/Config.in.legacy

But currently, WiringPi is alive again,
https://github.com/WiringPi/WiringPi

Could you, please, write, if it is planned to add WiringPi back in
Buildroot?

Best Regards,
Sverdlov Roman

--000000000000e7969a06182e89cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div><span sty=
le=3D"color:rgb(32,33,36);font-family:&quot;Google Sans&quot;,arial,sans-se=
rif;font-size:16px">Dear developers,</span></div><div><br></div><div>Wiring=
Pi was deprecated some time ago.<br><a href=3D"https://web.archive.org/web/=
20220405225008/http://wiringpi.com/wiringpi-deprecated/" target=3D"_blank">=
https://web.archive.org/web/20220405225008/http://wiringpi.com/wiringpi-dep=
recated/</a></div><div>It was removed from Buildroot.</div><div><a href=3D"=
https://github.com/buildroot/buildroot/blob/7763ba7007172ceb5e928ae5902735d=
727aaa90d/Config.in.legacy" target=3D"_blank">https://github.com/buildroot/=
buildroot/blob/7763ba7007172ceb5e928ae5902735d727aaa90d/Config.in.legacy</a=
><br></div><div><br></div><div>But currently, WiringPi is alive again,</div=
><a href=3D"https://github.com/WiringPi/WiringPi" target=3D"_blank">https:/=
/github.com/WiringPi/WiringPi</a><br><div><br></div><div>Could you, please,=
 write, if it is planned to add WiringPi back in Buildroot?</div><div><br><=
/div><div>Best Regards,=C2=A0</div><div>Sverdlov Roman</div></div>
</div></div>

--000000000000e7969a06182e89cf--

--===============2670708891788185783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2670708891788185783==--
