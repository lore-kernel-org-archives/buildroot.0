Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C863C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0970403AC;
	Mon, 17 Oct 2022 18:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0970403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZRPB_7YUotS; Mon, 17 Oct 2022 18:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF14840155;
	Mon, 17 Oct 2022 18:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF14840155
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE901BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBE9460A6C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBE9460A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsDxKndzIFFZ for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:52:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E096058D
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07E096058D
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:52:57 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a67so17323952edf.12
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6f+SXYw1VcvLcosqKYOXo9UjQOaQlx0tw4MB/ORMrBI=;
 b=lGqeLMVxuHnZDNPMb3JIuVgLNeoN+W+4m+LVejR7frDN+KO+FfZSJao7dP2FC49oTD
 uK9uSIOmhcpLCXAXlNwUZeCPchwuXgwLAUWPiXBmI1HKNJCjBb+KbQtIgFFAUTnVrBh6
 qECNiaS9CWFCTq626GQMio6FK8WFp3oZi+5EQHZ3AX6h2z7usgXNhwPTHWa5XAGGuLGp
 8HpykraU7mg3bVna7SHiB2y7dt0GMwNVOG1tmmm0Qve6L7TzwxeLZmom8aGddifjYKMK
 hKYUzb2+/urvDnPwMRNy/KaGNQOhu4VlL8sU5OZKNpQyHBRVX0jeJF3+3bx+90pUDh89
 FcHg==
X-Gm-Message-State: ACrzQf0FILFLcvfNvph/OebkuE/kyybZJxSGtlpfn3W/COe0Sw3HXapU
 OBb4YW8mHHoM05F7rc72hEUqyvDJnGhMO2ZI3lg=
X-Google-Smtp-Source: AMsMyM4wXdQufIuA5PWdj1Rylwwn28Ek2dKh6+lUS8aA5C1MeLy3DnbUoFgyeXmthf8Yb7Ul7L/7dA==
X-Received: by 2002:a05:6402:3887:b0:458:289e:c9cc with SMTP id
 fd7-20020a056402388700b00458289ec9ccmr11615497edb.101.1666032775933; 
 Mon, 17 Oct 2022 11:52:55 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 m3-20020a170906160300b0078194737761sm6413176ejd.124.2022.10.17.11.52.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 11:52:55 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id r17so27000190eja.7
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 11:52:54 -0700 (PDT)
X-Received: by 2002:a17:906:db0d:b0:77b:a7cd:8396 with SMTP id
 xj13-20020a170906db0d00b0077ba7cd8396mr10188120ejb.264.1666032774468; Mon, 17
 Oct 2022 11:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-4-thomas.perale@mind.be>
 <CA+h8R2pNRrBsChKS3PHQtT0_rsVF3Wi3LwMTD9jKFoKf1ot2-A@mail.gmail.com>
 <20221017180350.GC3666@scaer> <20221017204232.652f8e89@windsurf>
In-Reply-To: <20221017204232.652f8e89@windsurf>
Date: Mon, 17 Oct 2022 11:52:43 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q=huYvggEYwrHsyz+cD3o_L6jXMYAx=+vmw0YfhWxq+g@mail.gmail.com>
Message-ID: <CA+h8R2q=huYvggEYwrHsyz+cD3o_L6jXMYAx=+vmw0YfhWxq+g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6f+SXYw1VcvLcosqKYOXo9UjQOaQlx0tw4MB/ORMrBI=;
 b=kBOEBOKxVBy92irZKfU1YaRnulUj4zvyQ8t0ccM9wW9SkcHfuDsORzesZA1F911H29
 Ukc+9FFwuCemzJajnyOIyJk61GjSsR2CdE3EXnn5K8RzPzj8nb1tfEWsWfjbHvfmHpcr
 v4NNACMOPYJ5HG6H0+VTCX+TvmN+Pdk3CI0D7V6lcfNTnsiyCo3Wo1nLRyyZWRBs6CK3
 kOwX7bbKSx/N+xQy/xLqGwXQpEoJuFHqFpKQDFrUyBa/AdArVm2sKSjiYSvjjf6jBXrH
 wyBzWukk/MD79dZ4T1/q6fnsJ+otsFaXpDylc6B6NTVXZmgVsS8Twpvhk3wIdfmtK+NB
 rumg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=kBOEBOKx
Subject: Re: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

On Mon, Oct 17, 2022 at 11:42 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 17 Oct 2022 20:03:50 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > Agreed. The default should be to build everything from source when
> > sources are available. The pre-built packages are only a fallback as
> > a convenience for those that are too much in a hurry.
>
> Except we do exactly the opposite for Rust, and I'm not sure for the
> host compiler of those languages it is a good idea to cause such a
> major impact on the default build time faced by our users. I clearly
> understand the need to be able from source and appreciate how important
> it is, but I'm not so sure the default should be to build all those
> compilers from source.

As you mentioned in a reply on the other email thread-

The main thing that takes time with host-go from source is building
the C toolchain.

Provided that the C toolchain is pre-compiled, building host-go
doesn't take long (~1-2 mins).

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
