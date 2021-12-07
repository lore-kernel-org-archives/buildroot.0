Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0C9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 14:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35BD240131;
	Tue,  7 Dec 2021 14:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WIGTfLdJLGP; Tue,  7 Dec 2021 14:07:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87D0D4019D;
	Tue,  7 Dec 2021 14:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AFBE1BF304
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 14:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4755B80BC2
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 14:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiRaWRjp4Wkf for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 14:07:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9871080BBD
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 14:07:30 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id 7so27857463oip.12
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZkDevLH4N2WrAF8k1fbilLD+aVBOQUgUU/ricLYB1nU=;
 b=GgTyR2kQXHUuDS4nkzoqSidPbagI/t+5oVTwvF1hS4FLCfq4VK3terHyD77Cnli4Kp
 I5cu4XZIrBlZHzkadT1yOMlHr6faUDBE+8rhnBWkRDCZU+cZutv0xijxNIgxGA65coo4
 PlJb9IaPaeoJdACxz8aRJyl9ISdoJhFSB0+PERD025WBy5EO6SPL+OMOicTYIZLlsHw6
 pTlr/ViKJZ9VuiSyQA/8j+7OX8SsNtzGnwsma+3vOGA4Z1a9MR3rJzBwZDJZqBYYEfYy
 RHGGWAwhzLR3UgbNH3F8WirNZRs1hgyzfAHnxTIfMvTMFMuXTYFAJwsOUfkTVB9o7Wf+
 dKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZkDevLH4N2WrAF8k1fbilLD+aVBOQUgUU/ricLYB1nU=;
 b=t6WVFh67GBUn0nNE8GT9a6sywiN+dYYs0MpmrELqsXFTGKStSxDW+DGGjhr4g+XtQk
 aoVIj4LymdVeaqtfvsRNs+ivVXL0a1NKFKyN3iAib9UiA+LHCw+uibX+CaBrVNheESEq
 keawSEtpZB7koQqoh26Hu1TKFDBT/67yGZ6y7JW91T4zYnCtYG4M4XiQr/neA0dLmbLW
 D/lvYRnCnKHXj4XNG/zScd3Ex5iwJyBpwBAFS30ZByPRSRFQ1ruATg/oXT117TFQ3nLy
 6HZbuRIg6RRHeC0ruY8a6+ITT8TMzKaW6BGlMPSY95F86faepTLxLoWaxhs+AE9yXEZT
 FGIg==
X-Gm-Message-State: AOAM532Po8XefLo9oYZGrsrjC/CxmntQWYQQYJSnywLxLli1e4JDWEwb
 nyA9GUqLaKqAKKNPIC6Aoe8zrYZzqD+PopAZGAE=
X-Google-Smtp-Source: ABdhPJy9AyZyZ0uuQTVYn7F7jZN6Pev/3ceg37zsqI8EejyUPga6YcYV9A+aNdVrqoZ4eBYxzpHEocQ5Pva36i2Urf0=
X-Received: by 2002:a54:4614:: with SMTP id p20mr5475398oip.39.1638886048863; 
 Tue, 07 Dec 2021 06:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20211025224403.979315-1-aperez@igalia.com>
 <20211025224403.979315-4-aperez@igalia.com>
 <CADvTj4rO_diqAvL-1S2tKERCxmCT+45iFYWpD=1-x+iCx2H4Jw@mail.gmail.com>
In-Reply-To: <CADvTj4rO_diqAvL-1S2tKERCxmCT+45iFYWpD=1-x+iCx2H4Jw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 7 Dec 2021 07:07:17 -0700
Message-ID: <CADvTj4oi1FsEwsWZm2fOyT4kcXeaFk_J69o6BtR4zt=FqoFv3Q@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 3/4] package/wpewebkit: bump to version
 2.34.1
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Selecting BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE appears to
fix this crash.

On Sat, Oct 30, 2021 at 12:29 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Looks like there's a crash when loading gstreamer mediastream devices
> or something:
> #0  __pthread_kill_internal (signo=6, threadid=<optimized out>) at
> pthread_kill.c:45
> #1  __GI___pthread_kill (threadid=<optimized out>,
> signo=signo@entry=6) at pthread_kill.c:62
> #2  0x00007f266d284382 in __GI_raise (sig=sig@entry=6) at
> ../sysdeps/posix/raise.c:26
> #3  0x00007f266d26f43f in __GI_abort () at abort.c:79
> #4  0x00007f266e5679e0 in CRASH_WITH_INFO(...) () at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Assertions.h:750
> #5  WebCore::makeGStreamerBin (description=<optimized out>,
> ghostUnlinkedPads=<optimized out>)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/graphics/gstreamer/GStreamerCommon.cpp:516
> #6  0x00007f266f662f35 in WebCore::GStreamerCapturer::setupPipeline
> (this=0x7f25e3ea75b0)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/gstreamer/GStreamerCapturer.cpp:151
> #7  0x00007f266f66386a in
> WebCore::GStreamerVideoCaptureSource::startProducingData
> (this=0x7f2605217a00)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/gstreamer/GStreamerVideoCaptureSource.cpp:183
> #8  0x00007f266f13de98 in WebCore::RealtimeMediaSource::start
> (this=0x7f2605217a00) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/RealtimeMediaSource.cpp:231
> #9  WebCore::RealtimeMediaSource::start (this=0x7f2605217a00) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/RealtimeMediaSource.cpp:223
> #10 0x00007f266f13df9c in WebCore::RealtimeMediaSource::setMuted
> (this=0x7f2605217a00, muted=<optimized out>)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/RealtimeMediaSource.cpp:117
> #11 0x00007f266e9e761e in WebCore::MediaStreamTrackPrivate::setMuted
> (muted=<optimized out>, this=<optimized out>)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/MediaStreamTrackPrivate.h:87
> #12 0x00007f266e9eb04d in WebCore::MediaStreamTrack::create
> (context=..., privateTrack=...) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/Modules/mediastream/MediaStreamTrack.cpp:76
> #13 0x00007f266e9ebb13 in WebCore::MediaStream::MediaStream
> (this=0x7f260571c8b0, document=..., streamPrivate=...) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/RefCounted.h:49
> #14 0x00007f266e9ebbd7 in WebCore::MediaStream::create (document=...,
> streamPrivate=...) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/Modules/mediastream/MediaStream.cpp:63
> #15 0x00007f266e9f7971 in
> operator()<std::experimental::fundamentals_v3::expected<WTF::Ref<WebCore::MediaStreamPrivate>,
> WTF::String> > (privateStreamOrError=..., __closure=0x7f25e84815d8)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/Modules/mediastream/UserMediaRequest.cpp:260
> #16 WTF::Detail::CallableWrapper<WebCore::UserMediaRequest::allow(WebCore::CaptureDevice&&,
> WebCore::CaptureDevice&&, WTF::String&&,
> WTF::CompletionHandler<void()>&&)::<lambda()>
> mutable::<lambda(auto:44)>, void,
> std::experimental::fundamentals_v3::expected<WTF::Ref<WebCore::MediaStreamPrivate,
> WTF::RawPtrTraits<WebCore::MediaStreamPrivate> >,
> WTF::String>&&>::call(std::experimental::fundamentals_v3::expected<WTF::Ref<WebCore::MediaStreamPrivate,
> WTF::RawPtrTraits<WebCore::MediaStreamPrivate> >, WTF::String> &&)
> (this=0x7f25e84815d0, in#0=...) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:53
> #17 0x00007f266f13fde1 in operator()<WTF::String> (errorMessage=...,
> this=0x7f25e3ed3968) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/RealtimeMediaSourceCenter.cpp:112
> #18 WTF::Detail::CallableWrapper<WebCore::RealtimeMediaSourceCenter::createMediaStream(WTF::Ref<const
> WTF::Logger, WTF::RawPtrTraits<const WTF::Logger> >&&,
> WebCore::RealtimeMediaSourceCenter::NewMediaStreamHandler&&,
> WTF::String&&, WebCore::CaptureDevice&&, WebCore::CaptureDevice&&,
> const WebCore::MediaStreamRequest&)::<lambda(auto:26&&)> mutable [with
> auto:26 = WTF::String]::<lambda(auto:27&&)>, void,
> WTF::String&&>::call(WTF::String &&) (
>     this=0x7f25e3ed3960, in#0=...) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:53
> #19 0x00007f266e1ed059 in WTF::Function<void
> (WTF::String&&)>::operator()(WTF::String&&) const (in#0=...,
> this=<optimized out>) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:82
> #20 WTF::CompletionHandler<void
> (WTF::String&&)>::operator()(WTF::String&&) (this=<optimized out>,
> in#0=...) at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/CompletionHandler.h:67
> #21 0x00007f266e19b436 in WTF::Function<void
> (WTF::String)>::operator()(WTF::String) const (in#0=...,
> this=<optimized out>) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:82
> #22 WTF::CompletionHandler<void
> (WTF::String)>::operator()(WTF::String)
> (this=this@entry=0x7ffd53b9eff8, in#0=...) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/CompletionHandler.h:67
> #23 0x00007f266e19b49b in
> WebCore::RealtimeMediaSource::whenReady(WTF::CompletionHandler<void
> (WTF::String)>&&) (this=this@entry=0x7f2605217a00, callback=...)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WebCore/PrivateHeaders/WebCore/RealtimeMediaSource.h:322
> #24 0x00007f266f13fca1 in operator()<WTF::String> (errorMessage=...,
> __closure=<optimized out>)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/RealtimeMediaSourceCenter.cpp:114
> #25 WTF::Detail::CallableWrapper<WebCore::RealtimeMediaSourceCenter::createMediaStream(WTF::Ref<const
> WTF::Logger, WTF::RawPtrTraits<const WTF::Logger> >&&,
> WebCore::RealtimeMediaSourceCenter::NewMediaStreamHandler&&,
> WTF::String&&, WebCore::CaptureDevice&&, WebCore::CaptureDevice&&,
> const WebCore::MediaStreamRequest&)::<lambda(auto:26&&)>, void,
> WTF::String&&>::call(WTF::String &&) (this=<optimized out>, in#0=...)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:53
> #26 0x00007f266e1ed059 in WTF::Function<void
> (WTF::String&&)>::operator()(WTF::String&&) const (in#0=...,
> this=<optimized out>) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:82
> #27 WTF::CompletionHandler<void
> (WTF::String&&)>::operator()(WTF::String&&) (this=<optimized out>,
> in#0=...) at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/CompletionHandler.h:67
> #28 0x00007f266f13f9e6 in
> WebCore::RealtimeMediaSourceCenter::createMediaStream(WTF::Ref<WTF::Logger
> const, WTF::RawPtrTraits<WTF::Logger const> >&&, WTF::Function<void
> (std::experimental::fundamentals_v3::expected<WTF::Ref<WebCore::MediaStreamPrivate,
> WTF::RawPtrTraits<WebCore::MediaStreamPrivate> >, WTF::String>&&)>&&,
> WTF::String&&, WebCore::CaptureDevice&&, WebCore::CaptureDevice&&,
> WebCore::MediaStreamRequest const&) (
>     this=this@entry=0x7f2670feae20
> <WebCore::RealtimeMediaSourceCenter::singleton()::center>, logger=...,
> completionHandler=..., hashSalt=..., audioDevice=..., videoDevice=...,
> request=...)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/mediastream/RealtimeMediaSourceCenter.cpp:117
> #29 0x00007f266e9f6dba in operator() (__closure=<optimized out>) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/Modules/mediastream/UserMediaRequest.cpp:274
> #30 WTF::Detail::CallableWrapper<WebCore::UserMediaRequest::allow(WebCore::CaptureDevice&&,
> WebCore::CaptureDevice&&, WTF::String&&,
> WTF::CompletionHandler<void()>&&)::<lambda()>, void>::call(void)
> (this=0x7f25e3e3d958)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/WTF/Headers/wtf/Function.h:53
> #31 0x00007f266ec7c7f1 in WebCore::EventLoop::run
> (this=0x7f26698bf9c0) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/dom/EventLoop.cpp:123
> #32 0x00007f266ecd12e2 in WebCore::WindowEventLoop::didReachTimeToRun
> (this=<optimized out>) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/dom/WindowEventLoop.cpp:120
> #33 0x00007f266f07cf0e in
> WebCore::ThreadTimers::sharedTimerFiredInternal (this=0x7f26698969d8)
> at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/ThreadTimers.cpp:127
> #34 WebCore::ThreadTimers::sharedTimerFiredInternal
> (this=0x7f26698969d8) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebCore/platform/ThreadTimers.cpp:99
> #35 0x00007f2670114548 in operator() (__closure=0x0,
> userData=<optimized out>, userData@entry=0x7f2670fea290
> <WebCore::MainThreadSharedTimer::singleton()::instance+16>)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WTF/wtf/glib/RunLoopGLib.cpp:177
> #36 _FUN () at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WTF/wtf/glib/RunLoopGLib.cpp:181
> #37 0x00007f2670114daf in operator() (__closure=0x0,
> userData=0x7f2670fea290
> <WebCore::MainThreadSharedTimer::singleton()::instance+16>,
> callback=0x7f2670114523 <_FUN(gpointer)>, source=0x55934de74760)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WTF/wtf/glib/RunLoopGLib.cpp:53
> #38 _FUN () at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WTF/wtf/glib/RunLoopGLib.cpp:56
> #39 0x00007f266d87b5eb in g_main_dispatch (context=0x55934dd1fc10) at
> ../glib/gmain.c:3337
> #40 g_main_context_dispatch (context=0x55934dd1fc10) at ../glib/gmain.c:4055
> #41 0x00007f266d87b852 in g_main_context_iterate
> (context=0x55934dd1fc10, block=block@entry=1,
> dispatch=dispatch@entry=1, self=<optimized out>) at
> ../glib/gmain.c:4131
> #42 0x00007f266d87bb92 in g_main_loop_run
> (loop=loop@entry=0x55934dd20dc0) at ../glib/gmain.c:4329
> #43 0x00007f2670114916 in WTF::RunLoop::run () at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WTF/wtf/glib/RunLoopGLib.cpp:108
> #44 0x00007f266e565d25 in
> WebKit::AuxiliaryProcessMainBase<WebKit::WebProcess, true>::run
> (argc=3, argv=0x7ffd53b9f618, this=0x7ffd53b9f468)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebKit/Shared/AuxiliaryProcessMain.h:70
> #45 WebKit::AuxiliaryProcessMainBase<WebKit::WebProcess, true>::run
> (argv=0x7ffd53b9f618, argc=3, this=0x7ffd53b9f468)
>     at /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebKit/Shared/AuxiliaryProcessMain.h:57
> #46 WebKit::AuxiliaryProcessMain<WebKit::WebProcessMainWPE> (argc=3,
> argv=0x7ffd53b9f618) at
> /home/buildroot/buildroot/output/build/wpewebkit-2.34.1/Source/WebKit/Shared/AuxiliaryProcessMain.h:96
> #47 0x00007f266d2701d7 in __libc_start_call_main
> (main=main@entry=0x55934d51d060 <main(int, char**)>,
> argc=argc@entry=3, argv=argv@entry=0x7ffd53b9f618) at
> ../sysdeps/nptl/libc_start_call_main.h:58
> #48 0x00007f266d270288 in __libc_start_main_impl (main=0x55934d51d060
> <main(int, char**)>, argc=3, argv=0x7ffd53b9f618, init=<optimized
> out>, fini=<optimized out>, rtld_fini=<optimized out>,
> stack_end=0x7ffd53b9f608)
>     at ../csu/libc-start.c:409
> #49 0x000055934d51d091 in _start () at ../sysdeps/x86_64/start.S:116
>
> On Mon, Oct 25, 2021 at 4:45 PM Adrian Perez de Castro
> <aperez@igalia.com> wrote:
> >
> > Update to a new major release which brings in improvements and a number
> > of new features. Release notes:
> >
> >   https://wpewebkit.org/release/wpewebkit-2.34.0.html
> >   https://wpewebkit.org/release/wpewebkit-2.34.1.html
> >
> > Some of the new features require additional dependencies: HTTP/2
> > requires libsoup3, which is not yet in packaged in Buildroot, and
> > disabled at the moment (with -DUSE_SOUP2=ON, to keep using libsoup2);
> > and the color management support needs LCMS2 (which will be enabled
> > in a follow-up patch.)
> >
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  ...e-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 +++++++++++++++++++
> >  package/wpewebkit/wpewebkit.hash              |  8 +-
> >  package/wpewebkit/wpewebkit.mk                |  4 +-
> >  3 files changed, 85 insertions(+), 5 deletions(-)
> >  create mode 100644 package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> >
> > diff --git a/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch b/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> > new file mode 100644
> > index 0000000000..51212dd82d
> > --- /dev/null
> > +++ b/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
> > @@ -0,0 +1,78 @@
> > +From afc83d41293333f694630451f865a7a257a9b917 Mon Sep 17 00:00:00 2001
> > +From: Adrian Perez de Castro <aperez@igalia.com>
> > +Date: Mon, 25 Oct 2021 23:45:15 +0300
> > +Subject: [PATCH] [WPE][GTK] Multiple build issues with ENABLE_VIDEO=OFF
> > + https://bugs.webkit.org/show_bug.cgi?id=232264
> > +
> > +.:
> > +
> > +Reviewed by NOBODY (OOPS!).
> > +
> > +* Source/cmake/WebKitFeatures.cmake: Make ENABLE_MEDIA_SESSION depend on ENABLE_VIDEO.
> > +
> > +Source/WebCore:
> > +
> > +Reviewed by NOBODY (OOPS!).
> > +
> > +No new tests needed.
> > +
> > +* accessibility/AXObjectCache.cpp:
> > +(WebCore::isSimpleImage): Guard usage of HTMLMediaElement with ENABLE(VIDEO).
> > +* page/EventHandler.cpp:
> > +(WebCore::EventHandler::textRecognitionCandidateElement const): Ditto.
> > +* platform/graphics/BifurcatedGraphicsContext.cpp: Ditto.
> > +* platform/graphics/displaylists/DisplayListRecorder.h: Guard usage of MediaPlayer with
> > +ENABLE(VIDEO).
> > +* platform/graphics/displaylists/DisplayListRecorderImpl.cpp: Ditto.
> > +* platform/graphics/displaylists/DisplayListRecorderImpl.h: Ditto.
> > +
> > +Source/WebKit:
> > +
> > +* WebProcess/WebCoreSupport/ShareableBitmapUtilities.cpp:
> > +(WebKit::createShareableBitmap): Guard usage of RenderVideo with ENABLE(VIDEO).
> > +
> > +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > +---
> > +Upstream status: https://bugs.webkit.org/show_bug.cgi?id=232264
> > +
> > + Source/WebCore/accessibility/AXObjectCache.cpp                 | 2 ++
> > + Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp | 2 ++
> > + 2 files changed, 4 insertions(+)
> > +
> > +diff --git a/Source/WebCore/accessibility/AXObjectCache.cpp b/Source/WebCore/accessibility/AXObjectCache.cpp
> > +index f2451102040..930b969dcc2 100644
> > +--- a/Source/WebCore/accessibility/AXObjectCache.cpp
> > ++++ b/Source/WebCore/accessibility/AXObjectCache.cpp
> > +@@ -528,9 +528,11 @@ static bool isSimpleImage(const RenderObject& renderer)
> > +         || (is<HTMLImageElement>(node) && downcast<HTMLImageElement>(node)->hasAttributeWithoutSynchronization(usemapAttr)))
> > +         return false;
> > +
> > ++#if ENABLE(VIDEO)
> > +     // Exclude video and audio elements.
> > +     if (is<HTMLMediaElement>(node))
> > +         return false;
> > ++#endif // ENABLE(VIDEO)
> > +
> > +     return true;
> > + }
> > +diff --git a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> > +index c0ce72c5ffc..d7ead303f3c 100644
> > +--- a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> > ++++ b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
> > +@@ -269,11 +269,13 @@ void BifurcatedGraphicsContext::drawPattern(NativeImage& nativeImage, const Floa
> > +     m_secondaryContext.drawPattern(nativeImage, imageSize, destRect, tileRect, patternTransform, phase, spacing, options);
> > + }
> > +
> > ++#if ENABLE(VIDEO)
> > + void BifurcatedGraphicsContext::paintFrameForMedia(MediaPlayer& player, const FloatRect& destination)
> > + {
> > +     m_primaryContext.paintFrameForMedia(player, destination);
> > +     m_secondaryContext.paintFrameForMedia(player, destination);
> > + }
> > ++#endif // ENABLE(VIDEO)
> > +
> > + void BifurcatedGraphicsContext::scale(const FloatSize& scale)
> > + {
> > +--
> > +2.33.1
> > +
> > diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> > index ff8bd1f30a..acb3ec4a3e 100644
> > --- a/package/wpewebkit/wpewebkit.hash
> > +++ b/package/wpewebkit/wpewebkit.hash
> > @@ -1,7 +1,7 @@
> > -# From https://wpewebkit.org/releases/wpewebkit-2.32.4.tar.xz.sums
> > -md5  94ca1cc3f7b2de8b96c59d6e59cafcd0  wpewebkit-2.32.4.tar.xz
> > -sha1  19b8ebdbfef193ca50f7625703d871db87624f86  wpewebkit-2.32.4.tar.xz
> > -sha256  381f1422cbc319db1aa42dda48de39590ed90ac3bec6b81ec83f3f2cae5c3eeb  wpewebkit-2.32.4.tar.xz
> > +# From https://wpewebkit.org/releases/wpewebkit-2.34.1.tar.xz.sums
> > +md5  915e583b0e7e82efa155cbce917d6319  wpewebkit-2.34.1.tar.xz
> > +sha1  452081b6df9d079f26d22bd0dca9e90f87943089  wpewebkit-2.34.1.tar.xz
> > +sha256  cb336986341be9c3a9b1ca2c18de0d29d90ae4e77b9967a6f6879597e7a969f7  wpewebkit-2.34.1.tar.xz
> >
> >  # Hashes for license files:
> >  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> > diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> > index 0242f7a288..606a1531c0 100644
> > --- a/package/wpewebkit/wpewebkit.mk
> > +++ b/package/wpewebkit/wpewebkit.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -WPEWEBKIT_VERSION = 2.32.4
> > +WPEWEBKIT_VERSION = 2.34.1
> >  WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
> >  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
> >  WPEWEBKIT_INSTALL_STAGING = YES
> > @@ -23,6 +23,8 @@ WPEWEBKIT_CONF_OPTS = \
> >         -DENABLE_ACCESSIBILITY=OFF \
> >         -DENABLE_API_TESTS=OFF \
> >         -DENABLE_MINIBROWSER=OFF \
> > +       -DUSE_LCMS=OFF \
> > +       -DUSE_SOUP2=ON \
> >         -DSILENCE_CROSS_COMPILATION_NOTICES=ON
> >
> >  ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
> > --
> > 2.33.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
