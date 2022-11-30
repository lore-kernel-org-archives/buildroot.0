Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09352C4167B
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 00:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 576354013C;
	Wed, 30 Nov 2022 00:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 576354013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2EhgVFJdsEa; Wed, 30 Nov 2022 00:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B36A4010D;
	Wed, 30 Nov 2022 00:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B36A4010D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 725E41BF95F
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 00:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4701A4010D
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 00:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4701A4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJlej4jfNqLY for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 00:42:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5409F400C0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5409F400C0
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 00:42:36 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so387610pjo.3
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 16:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cilK8BxYTMbNNlSBzHR9f1bAu+ieMOyfM20ZWjXoF3M=;
 b=Sl63S8PeDCk8qwu7T+j5kuYZ3bmt3glUiD8LDfRrllsvNo4Df70OiAIfswguZ4meRs
 Puz2/ecf+E+kiAjmREJp1QFEag46T9J2gU+SaCTco94WyOpn1XC0EI2PQleRK2YSQfS5
 TyfQNhrQJAvTBQ62QHHZiHuhUQF856J3IucwJJ9QVuBN4JS76NBjfQWspt4ofprNNJC7
 CggbaDKmq0KQeCcs9vAuQVpQ/c7cUm/OfZfF1B2HmJUn1pXBnQPGUQySX3ormiQzOSRN
 YFPmdQ8/PvPEfAW3fUX+uPV5gB30usOjroNbsBBG6TZMu8WzVhxZwixLrop5q2fXmOG7
 2nxg==
X-Gm-Message-State: ANoB5pmPcU8Y/6U1Hh7ebmYKGNMTM+9649LirngRoq0hRu3z7K2Z8NLw
 QSWgxSbszXJN/cMj/kA+WFbaIemAtzii0RGrWpKsS8rK3Yz+KA==
X-Google-Smtp-Source: AA0mqf7liwucxl+jZu1MeBsnRo/XqzCN/amrTPxwPRo3fzEOjC/FI7SwDpXrSGzdeDdFa0BWXWS5jp9oA0lbJfFD21Q=
X-Received: by 2002:a17:902:ec01:b0:186:878e:3b0d with SMTP id
 l1-20020a170902ec0100b00186878e3b0dmr39297833pld.149.1669768955603; Tue, 29
 Nov 2022 16:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <c29e48e0-d7e7-3f61-082a-b7b3fba976f4@mind.be>
In-Reply-To: <c29e48e0-d7e7-3f61-082a-b7b3fba976f4@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 29 Nov 2022 20:42:23 -0400
Message-ID: <CADvTj4pwrZziwevuFmhGwMoxjV4JV_T3Rw=2+eHtDJo1erFcOg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cilK8BxYTMbNNlSBzHR9f1bAu+ieMOyfM20ZWjXoF3M=;
 b=CIqNHaRp4/XFy3u2plmN4AaksRq427y3okwHzjj9A/nlpe8JkGuuSyzjFBgNS2jbJj
 JA5E3qEFOSBWd7WKbAbvEX9+/WDlawe6agfy2l3PGUq4BDap9so0/u+VditAlfH4R5+E
 1RT6NOdPyLt1o+Ehz3+Ro2zoQICLTF7rBZ5WCQH6ah8s7Zc7XnPvVeE0AXRAn78CHL9b
 oLPgCeI8TzDKATuGjQlRGXHufy7Z+4v320+ZJmp7oX4gZRL+oyUSTTGGfVRZF1N1YEpj
 WxbfYfn4MHH/24SQ2/kWsKEtffbmq4fEbeiP1d6bIDlX+4v4J42oZD8wLFPyPZlpWvby
 +RjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CIqNHaRp
Subject: Re: [Buildroot] [PATCH v2 1/8] package/flatbuffers: build position
 independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Nov 29, 2022 at 5:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 28/11/2022 18:58, James Hilliard wrote:
> > The upcoming tensorflow-lite package requires flatbuffers to be
> > built with position independent code.
> >
> > Fixes:
> > /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC
>
>   This looks like something that would happen any time you try to link
> flatbuffers - so it should happen for kodi as well. In that case, the patch
> should be applied to master. Can you check if this is the case? You
> unfortunately can't rely on autobuilders, kodi has so many dependencies that it
> (almost?) never gets built. There were 91 configurations in 2022 that included
> kodi [1]; all of them failed, and I think all of them failed before reaching kodi...

I tried building kodi manually and ran into build issues as well, so unclear if
this is needed for kodi, but I think it's probably safe to apply to master.

By the way I think all those autobuilder configs were generated by tweaking
kconfig probability with this patch using a local override:
https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/

I think that plus shuffle mode might allow for coverage of packages with more
dependencies, some fixes related to shuffle mode:
https://patchwork.ozlabs.org/project/buildroot/patch/20221016193014.3384022-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20221019234655.1097686-1-james.hilliard1@gmail.com/

>
>   Regards,
>   Arnout
>
> [1]
> http://autobuild.buildroot.net/index.php?date%5Bfrom%5D=2022-01-01&symbols%5BBR2_PACKAGE_KODI%5D=y
>
>
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/flatbuffers/flatbuffers.mk | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> > index 9d286bf9e1..487d85ee1f 100644
> > --- a/package/flatbuffers/flatbuffers.mk
> > +++ b/package/flatbuffers/flatbuffers.mk
> > @@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
> >
> >   FLATBUFFERS_CONF_OPTS += \
> >       -DCMAKE_CXX_FLAGS="-std=c++11" \
> > +     -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
> >       -DFLATBUFFERS_BUILD_TESTS=OFF \
> >       -DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
