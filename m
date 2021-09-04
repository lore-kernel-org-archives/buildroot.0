Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B1CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:42:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D156054F
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38D156054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF36400D9;
	Sat,  4 Sep 2021 09:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2Uu7nhRUmlG; Sat,  4 Sep 2021 09:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5669400BF;
	Sat,  4 Sep 2021 09:42:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C20DB1BF836
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADF6B83F0C
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_oWSk5QxVYe for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 09:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C24DD83E4A
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 09:42:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id x11so3068766ejv.0
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NLeFWKZMKEibbI57qVc5WyQeCYPW7Xi/G/spesVrmqo=;
 b=mALfZYWuZzklORol7SpDG9Xp5YKTwxvY9KH1pokuEW6ZQBtkRnE9pOLkzmxXFaQwam
 wHJt1uVvCG5I/9MC/momGLa+nLP4gUgSrkE/rNGLIstHqgQI4roDmZieS9RG/TPyU+TQ
 q/FRy6Kz4P6zav/4f9f2jWVUzDaqkQhbAun4ZY/sXo1sZXLkbjN4qFc9V8BCeZV1p7+F
 zYFF08VMSMH2BgGyt5hQfN9HZWWJ9qHPeQl3DNt1zHPbXc+OOhtAKJY/vvv5dYMuY8Rk
 Nsbd2F6NyQu42BChjPNkWCUHkh+GrkRQa7gn2ohH3j+E79cODsfrChr1no9VfVTHubBx
 ZIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NLeFWKZMKEibbI57qVc5WyQeCYPW7Xi/G/spesVrmqo=;
 b=M6ec+m/vdCuw9MwDTiTld6Du8ZREeTAz2BLSuLBEq4xiQFW2MD2HL/+eSHPUIm/JVl
 RnUsScmRcZoe2joMkB2HhtlmAszB8mzi4rsU9Zio2jSJgDGXeL99s23dp8YtgKNJ+vhh
 ts/bKIwl0kuzW8aDF5p8lyyYv1WT1DAt7Hj0fYbauc8A1qZDjOdnuKGsomcEthuJPG74
 ZHtbPEDEnjVBY+yoXvLlFl5dSt24/UHgBAKt31wv2E+8FWSEFMNfaH9xM7ukOxubVDgf
 UHf7Oz2iiWu9dOaFfaIEnhLnjz8fPhSGBGLJUXiYuTF4gJxNXFcJFmLMTtrKaW2ftgwz
 qPpg==
X-Gm-Message-State: AOAM532Qz5SyjTCK/YAGQfae9/lWGx4YXs4lGbpcc82SLnfB5qZUX9YO
 pdgPMp3N4ODznNkOSNQlG88=
X-Google-Smtp-Source: ABdhPJwHwgObZkuyPzz5nHA0aTjp8LA/icWT2Bak9ChBF4WhX4pKo8K+jsK1UGe8R7qVfWH+8z8+tw==
X-Received: by 2002:a17:906:e1a:: with SMTP id
 l26mr3430091eji.45.1630748555072; 
 Sat, 04 Sep 2021 02:42:35 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n10sm818909ejk.86.2021.09.04.02.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 02:42:34 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMSC1-00056o-Rj; Sat, 04 Sep 2021 11:42:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210903222017.1040418-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 11:42:33 +0200
In-Reply-To: <20210903222017.1040418-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 4 Sep 2021 00:20:17 +0200")
Message-ID: <874kb0r81i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/xvisor: fix build with gcc 11
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failures with gcc 11:
 > /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/build/drivers/drivers.o:
 > in function `psmouse_extensions':
 > /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783:
 > undefined reference to `lifebook_detect'
 > /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783:
 > undefined reference to `alps_detect'
 > /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783:
 > undefined reference to `ps2pp_init'
 > /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783:
 > undefined reference to `trackpoint_detect'
 > /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
 > /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783:
 > undefined reference to `fsp_detect'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Update patch to use static inline

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
