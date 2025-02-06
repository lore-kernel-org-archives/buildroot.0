Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A5C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC8D80465;
	Thu,  6 Feb 2025 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylns65botBgI; Thu,  6 Feb 2025 21:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4129804ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4129804ED;
	Thu,  6 Feb 2025 21:11:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4FBC5
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29A1F40BF3
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Untbo4NnwwuM for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 21:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=dave.peckham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11AAF40B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11AAF40B9A
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11AAF40B9A
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 21:11:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3061513d353so14615461fa.2
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 13:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738876309; x=1739481109;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qCP921aq/U/1RuTq9Ms4hArPrLMakLO1z59pkNwyXDI=;
 b=kTW0TYROInzmX3E+MV0pktGHPcsShCc55Wp6cNHnDAKeGPH2Uahj24ioqNIeyOpOlh
 SbqStdJl8iq39nM75sYlcRbKYgTgcsieWmMbEoelYHc+5j/9Ch2Q9e7Dw5VQcFwqLK7f
 fNbeYut91I2dmv3scerlvdcqquCtVg/YOXeMoN9AKrtEPG9S/Dx8O0iZnXmNdNYrxUkY
 qZ6dA1gThD4H9V9FjVL2yyC77FfzCAwdC6Hs6vudEMmSdbiJ36gkigvtv7SeWyOl7Ytr
 Ncc3HqfJY6NXxpN0PilJmqw/VC45FN4Lpu5bkyqFg6HilyzpE4TkHQOr5+g4wP7uKjyn
 L0QQ==
X-Gm-Message-State: AOJu0Yyz07zSby0ZCoNWjbkkiD5hp0GuA1OOi2amCm5ILeH5v8iY8ON8
 kzCVoGbMgatRUGZ5FJ9Xy8IXyQ+2xEeAzgD5tokaNfj0Ivka/gLlYrJS+hrsVQIVSq5hBgMCPJZ
 kCKnZXv1i24y0f2S3x26PdbK57dyJll4+8Xo=
X-Gm-Gg: ASbGncuxkULPda3oXzGUUdMQ/OvF18vn1LCNO8CgZuj5zTQKnLJvjZxqVTDo4RmmP8l
 7HiqAMbYEU7nDA74zlJIGpTxTQytYelw1xkA2F3y8jDHnaz3U+rcoJfy2hvsxBTd+DF5aQCaYys
 oqfMspZconYdOVR37GIjNPGWh1OpqNKPY=
X-Google-Smtp-Source: AGHT+IE07b3sMO1mymFEQXWX0d3uJ/sbAvwH8+Dp0pDgfzvG7Vc+7GonFWFCDWjUL1vENAHiKA8vP8kF/n1PM/6hNzE=
X-Received: by 2002:a2e:be21:0:b0:304:b72f:25d1 with SMTP id
 38308e7fff4ca-307e57cdb64mr1441411fa.11.1738876309292; Thu, 06 Feb 2025
 13:11:49 -0800 (PST)
MIME-Version: 1.0
From: Dave Peckham <dave.peckham@gmail.com>
Date: Thu, 6 Feb 2025 16:11:38 -0500
X-Gm-Features: AWEUYZnNTRjItBjDCLPslXiXpDBigZO5DXPQ3te0tdXkYhL8B6qV9DIjrUb66gU
Message-ID: <CAHWkT_AaU522ir3aeOFukfjXyxeUZDNPpHUcG28yJr3PgM1GSA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738876309; x=1739481109; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qCP921aq/U/1RuTq9Ms4hArPrLMakLO1z59pkNwyXDI=;
 b=HSqkl0sFyX5oX4+iE23jq8E8fH/MRj4TV8mItyqIMub+yN9LNmS2Fl7Duqx1utPEXt
 aj7YydDOHOziH3Kw1N3kxxaddG5kAcTe3KNEjYP5sduDrozlOFutIf3I4fJoBB5gWW5v
 qmbg4UaG3/o6V+FLkdo0HpxWcXCRc7XhgzbyFI47Hn/SdBAmaUQQhJamyyF7izPT/msC
 ieRyQPIlVvvp4SK6e/kl92HRwsDm9P+gecXAMuO22vz+50E/UFqNjylu3J2tDdQ5JzTF
 eTaklrT1qJy3WwpP+2nRA4peFN8f3JyPXFgsHzjLYmNbbaz13CdkLvPA10EP9ASTE4ui
 UDWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HSqkl0sF
Subject: [Buildroot] Golang package examples? Cross-compile x86 to ARM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I'm porting my org's production yocto project to buildroot.I'm having
a tough time understanding how to build my golang package linked
against the target architecture. I have read the chapter on the
golang-package macro, but I'm new to buildroot and I still have some
unanswered questions and my build isn't working. I'm using the
raspberrypi4_64_defconfig just for testing.

My Go program links against SDL2 via the go-sdl2 package. The gist of
my problem is that it appears buildroot's golang-package macro is
using my host's "pkg-config --cflags --libs sdl2" call, which is not
correct for the target architecture (ARM): -I/usr/include/SDL2
-D_REENTRANT -lSDL2. I think it should be pointing to one of these,
which "objdump -f" indicates are not x86.

$ find output/ | grep libSDL2.so
output/target/usr/lib/libSDL2.so
output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libSDL2.so
output/build/sdl2-2.28.5/build/.libs/libSDL2.so

My .mk file runs the Go program's Makefile like this:

# sdl-test-go.mk
$(MAKE) GOOS=linux GOARCH=arm64 CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

And the Makefile is simple:
go build -o sdl-test-go sdl-test-go.go

This results in, what I can only imagine, is the buildroot
cross-compiler invocation trying to use my x64 SDL instead of
something from the "target".

Any ideas or links to some non-trivial/complete sample buildroot Go
package files?

Thanks,
Dave

*******************
$ make -d sdl-test-go-rebuild
...
go build -o sdl-test-go sdl-test-go.go
Live child 0x61216f10ab30 (build) PID 2142765
# command-line-arguments
./sdl-test-go.go:14:14: undefined: sdl.Window
./sdl-test-go.go:15:16: undefined: sdl.Renderer
./sdl-test-go.go:19:11: undefined: sdl.Init
./sdl-test-go.go:19:20: undefined: sdl.INIT_EVERYTHING
./sdl-test-go.go:23:8: undefined: sdl.Quit
./sdl-test-go.go:25:19: undefined: sdl.CreateWindow
./sdl-test-go.go:25:46: undefined: sdl.WINDOWPOS_UNDEFINED
./sdl-test-go.go:25:117: undefined: sdl.WINDOW_SHOWN
./sdl-test-go.go:31:21: undefined: sdl.CreateRenderer
./sdl-test-go.go:31:52: undefined: sdl.RENDERER_ACCELERATED
./sdl-test-go.go:31:52: too many errors
Reaping losing child 0x61216f10ab30 PID 2142765
make[2]: *** [Makefile:5: build] Error 2
Removing child 0x61216f10ab30 PID 2142765 from chain.
Reaping losing child 0x5b78e4d3d710 PID 2142748
make[1]: *** [package/pkg-generic.mk:283:
/home/dpeckham/code/buildroot-2024.02.10/output/build/sdl-test-go-1.0/.stamp_built]
Error 2
Removing child 0x5b78e4d3d710 PID 2142748 from chain.
Reaping losing child 0x582808f9d390 PID 2142250
make: *** [Makefile:82: _all] Error 2
Removing child 0x582808f9d390 PID 2142250 from chain.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
