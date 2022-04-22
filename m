Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F18C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2608E40B03;
	Fri, 22 Apr 2022 22:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCQAQsu_wnuk; Fri, 22 Apr 2022 22:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3108A40AFC;
	Fri, 22 Apr 2022 22:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC6361BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ACFD60A79
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTpaiqzLZ3Uf for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:10:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0376606A9
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:10:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bv19so18863728ejb.6
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Md4j/3Tsf+CvzykllNkVOcSXmITuVhDg17xU1EflQKE=;
 b=jbmK9tC1DaTiK2foA8UqflGzx/z/qTd0pZTDXZ4nI+04ip0Nxt/aIcXudjYY3+4UiW
 /6kvgbD54xV0sUyd2TsqNvLOLL3uy4GC+sswsuvKTF8rXeHWd2sseRQmiIvTwUNp10Ub
 AC77tx9O1ia3gMt2umpz8tkr512fUXuUf3POVsOsp5v0jvU8Q8d6hAQM3+wOSelv2Akr
 WJ+Oxtx9pXXLMaXBhKreJy+ly6FXu7VajAkynB2yTrBzxtWw5dDztnGL//HFcwcNO/XP
 iZ2OJQ8/dbPH3ZgApsviG4soYAYUpSbqyiujOclrlPwSfIn9nFcQLUmSlDtxJE0KmJkv
 LosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Md4j/3Tsf+CvzykllNkVOcSXmITuVhDg17xU1EflQKE=;
 b=dZkqtV2H0g142qNRHgRSfr4MttjIa0zcuS5yWZmcQEgalDQfJrnWsURhau1HlyEBjd
 CgBwskhYOCJ+h9znFJz4l2yaETUaeqXnrleCWjbiNOZpdwOtuIpZE1UvJwDxrQxrYmSM
 3/i8p43mqB4ilcPBGIgy9j2gG0PMqvwbfEHOFeUowEm4o0Dbx/cEjfizatbpjZpzqTf9
 nq5SMzgHR1jTBxs6DlPQos69YXHwTc789uN8hXkBg444vnAWb/MEZwsj6D2CdStKK+Ae
 /uR7yyL9pwnPqvd+nH4vXSfoTMBV2LnWrT7VcJZcKKZLN+nfXdBIYI1BwzE/OBfR/73w
 nChg==
X-Gm-Message-State: AOAM5321+aHQiatqpPm4XM1yZaE2a3RsGB/PCsnTnPV6T4vjP3Q4b0oH
 GwAVzB0KZMgz/K7Gr9PaBkUDs1m6qY+R5KZPlmQ05yOR
X-Google-Smtp-Source: ABdhPJyevAikNCoPtwHeOFUgEHwspbWmpsypfOiXyfSkezw5v3In0PYnHXiCwM2xl96iHEVgfnqAMIihCoaFbTcHhhA=
X-Received: by 2002:a17:906:f20a:b0:6ef:b9a3:3ca9 with SMTP id
 gt10-20020a170906f20a00b006efb9a33ca9mr5860995ejb.693.1650665412952; Fri, 22
 Apr 2022 15:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220422181418.2411463-1-joseph.kogut@gmail.com>
 <20220422181418.2411463-2-joseph.kogut@gmail.com>
 <5eced090-c6ac-21fb-3206-f3c0ff0f2e74@mind.be>
In-Reply-To: <5eced090-c6ac-21fb-3206-f3c0ff0f2e74@mind.be>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 22 Apr 2022 15:09:34 -0700
Message-ID: <CAMWSM7hkKNzn4SysPsa-9R51GZq-T67HAAh0fkBEY1zGRZt5yA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/libcurl: add host-nghttp2 to
 host deps
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
Cc: Matt Weber <matthew.weber@collins.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Apr 22, 2022 at 2:56 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/04/2022 20:14, Joseph Kogut wrote:
> > This fixes building host-libcurl, which otherwise would fail with
> > undefined references to nghttp2 symbols.
> >
> > /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_pack_settings_payload'
> > /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_http2_strerror'
> > /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_request'
> > /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_rst_stream'
>
>   I guess this happens because it somehow finds libnghttp2 installed on the host
> but then fails to link with it? In any case, we don't actually need host-libcurl
> to be built with nghttp2 I think. So just pass --without-nghttp2.
>

It seems so. I think either providing the library or disabling it will
work fine, I just didn't want to assume what other users need here.
I'll respin with that config, thanks for the review.

>
>   Regards,
>   Arnout
>
> > <snip>
> > collect2: error: ld returned 1 exit status
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >   package/libcurl/libcurl.mk | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> > index 97857954db..d5805a1d32 100644
> > --- a/package/libcurl/libcurl.mk
> > +++ b/package/libcurl/libcurl.mk
> > @@ -173,7 +173,7 @@ endef
> >   LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
> >   endif
> >
> > -HOST_LIBCURL_DEPENDENCIES = host-openssl
> > +HOST_LIBCURL_DEPENDENCIES = host-openssl host-nghttp2
> >   HOST_LIBCURL_CONF_OPTS = \
> >       --disable-manual \
> >       --disable-ntlm-wb \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
