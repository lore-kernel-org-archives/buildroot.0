Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78984C636D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 08:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DAF41A55;
	Thu,  2 Feb 2023 08:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DAF41A55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fv0EuTMjTzYV; Thu,  2 Feb 2023 08:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E080941B2C;
	Thu,  2 Feb 2023 08:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E080941B2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B55E1BF386
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 08:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF6481E85
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 08:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF6481E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtbV_bAuzxkY for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 08:50:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA12A81DFB
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA12A81DFB
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 08:50:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bk15so3866102ejb.9
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 00:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZuDjW8faFlkfANYdJ6Z6zjcdZPPtnTFYwYVEjLms3no=;
 b=nb2NhqS9smCydGHRqeiqdJrsSV4Uicjb127YoSHe0KaF/qtXnmu5BWVX1FsxxjZmBG
 X0jl0Kl/IhfSRGhCtRrEU+lxQVb0RvJOMHqmBbY2RcW+pX/gcce0mOb5746Nj4IJOofk
 FJmY330ntg5XJsEH7rngYRj/MdJSrcFr6HaUBNndMgGbVrUiW2R5/TB6fmNEde5PqewG
 ear7eeTjrNxFjlw0Bp5WLPPB7o/ZqaCYz+Q3B6+IaUXLRf4q/2cF9gpeFc3IMCGG/Avr
 PpVGmWpP78vt+FnCPE3SOSUdX3fnlgAzX2moTG1kDZoSMAE5Sn9UYt3CZsOAMU2Hm1Kv
 zj2w==
X-Gm-Message-State: AO0yUKUXDK+HiQSe3DLyw+uRuPf20JzuQvuoplJA98ctxw2yqOj/Eg1O
 lXicXSVrR5Y8tBNhfbxKCAzg/HJBSYl3BKkr6FU=
X-Google-Smtp-Source: AK7set8bMPcrwXhRnvw3jyWS1NLotiO2eiofOqpmZD5+GddsSpkaKBmnfJlUB9vtn2qeo5vdQpxq6A==
X-Received: by 2002:a17:906:178f:b0:88f:87f0:c919 with SMTP id
 t15-20020a170906178f00b0088f87f0c919mr534211eje.64.1675327802547; 
 Thu, 02 Feb 2023 00:50:02 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 my31-20020a1709065a5f00b0088cf92eb0e1sm3191094ejc.150.2023.02.02.00.50.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 00:50:02 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id qw12so3967614ejc.2
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 00:50:01 -0800 (PST)
X-Received: by 2002:a17:906:88a:b0:87b:d3b3:94f0 with SMTP id
 n10-20020a170906088a00b0087bd3b394f0mr1645302eje.61.1675327801558; Thu, 02
 Feb 2023 00:50:01 -0800 (PST)
MIME-Version: 1.0
References: <CAFza+u8Ez40pCa05x=gUoB8bG=vL1mxspnMs2DyMBnLgp+80VA@mail.gmail.com>
In-Reply-To: <CAFza+u8Ez40pCa05x=gUoB8bG=vL1mxspnMs2DyMBnLgp+80VA@mail.gmail.com>
Date: Thu, 2 Feb 2023 00:49:50 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rtcynkCBsz=_9yANOEguyPCOcQDj8_ns+cv8RS8+8t9A@mail.gmail.com>
Message-ID: <CA+h8R2rtcynkCBsz=_9yANOEguyPCOcQDj8_ns+cv8RS8+8t9A@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuDjW8faFlkfANYdJ6Z6zjcdZPPtnTFYwYVEjLms3no=;
 b=Qx+Z6taWS6OdX2tZ3uF2YYAIB6iUL4rXABdqpbR9zfTphX5y3qOQnhRisKdS1DlUkn
 hg4ALBuQY7OjxQTImbM4r0Kq1GDKbgf1A80BrfWI/PF5CUUNhcGFGEwcBNbwUjFD2Snb
 tNrK0XH351vIw+JnS6kd+dccF4cDXQa7uP9nDgkMKl8RVozxpBzkoyeflrSE7pLtJYml
 lQmuJTCBHJC6qzNUQksLhG3I/1lmPN+2ba9CxyfvHl/axlqd6UpeLWPN9jQj9yIVeSUw
 WPM3QuA4zLnJF7u3D5mOEnOksAFNp2dcbAoIJZFgLtyusuVSLR5QWIfKRoGtqolCJ5hc
 eoWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Qx+Z6taW
Subject: [Buildroot] Go 1.20 changes required in Buildroot
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Go 1.20 includes a change which breaks our build infra for go in Buildroot:

https://go.dev/doc/go1.20#bootstrap

The minimum required version of go-bootstrap is now go 1.17.13 or later.

Otherwise the build fails with this error:

building_Go_requires_Go_1_17_13_or_later

As Go 1.4 was the previous version that could be compiled with C,
there is now no way to bootstrap go with a C compiler.

... unless a process like this is used:

 - build host-go-bootstrap-1.4-20170531
 - build host-go-bootstrap-1.19.5 with go1.4-bootstrap
 - build host-go-1.20 with host-go-bootstrap-1.19.5

... which could be viable for Buildroot, at least for now.

Previous discussion on this:

https://lore.kernel.org/all/20220525234312.643dfc03@windsurf/T/

An existing patch is still Pending Review which fixes a separate but
related issue: we cannot build go-bootstrap-1.4 on arm64. The proposed
fix above would still not work correctly on arm64. That patch linked
above fixes this issue by using a Go compiler installed on the host
machine (/usr/bin/go) to bootstrap host-go in that case.

I'll send a patch soon which upgrades to go1.20 using the above
3-stage bootstrap process. It's not pretty, but it will work for now.

A potentially cleaner solution would be to bootstrap with gccgo, or
depend on the host Go binaries to bootstrap (as linked above), or to
download pre-compiled binaries to bootstrap.

Best regards,
Christian Stewart

---------- Forwarded message ---------
From: 'Michael Knyszek' via golang-nuts <golang-nuts@googlegroups.com>
Date: Wed, Feb 1, 2023 at 11:36 AM
Subject: [go-nuts] Go 1.20 is released
To: <golang-announce@googlegroups.com>
Cc: golang-dev <golang-dev@googlegroups.com>, golang-nuts
<golang-nuts@googlegroups.com>


Hello gophers,

We have just released Go 1.20.

To find out what has changed in Go 1.20, read the release notes:
https://go.dev/doc/go1.20

You can download binary and source distributions from our download page:
https://go.dev/dl/#go1.20

If you have Go installed already, an easy way to try go1.20
is by using the go command:
$ go install golang.org/dl/go1.20@latest
$ go1.20 download

To compile from source using a Git clone, update to the release with
git checkout go1.20 and build as usual.

Thanks to everyone who contributed to the release!

Cheers,
Michael, Matthew, and Dmitri for the Go team
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
