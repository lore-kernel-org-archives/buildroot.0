Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC8C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A6A940948;
	Sun, 19 Jun 2022 15:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6A940948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oABRTFDF7d0; Sun, 19 Jun 2022 15:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C8704092E;
	Sun, 19 Jun 2022 15:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C8704092E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B984B1BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9331C60758
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9331C60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Hi_KovQ2KAY for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:55:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F97F60A98
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F97F60A98
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:55:49 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z7so11980056edm.13
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fi1Hf/cqWhimx82RR4rMIiBvVnTY9/sb496D7vxKWEE=;
 b=KIj7ZO/l9UnJSnE6GiSqhPt8caLuiX29yumP+o79ra9V349wwURfyzk/bEFVsV+mrj
 cp0TQym3bNBR/CNnY62+RWMqqnKxT6xPv6y/EIbezCj32CbebU+IpsEKNIJ4JQ5OzBqx
 yZAgQLYN4C37v346/xUMmAzk2tV2CjocC5Eqm55ECDHBdTFUWfFLy9dznd6jAPyYjMUA
 wn8FemfpsSeowHhrWrEeyG52jGC4Cf31pEZ59zGZPwrkaFJSey/iQDVKE/iRGOwTQ//h
 xVs569I3m7KKmOdRmpjPtWXERwFEYaOXlj6zt+UkJNTAJ9zC8aQR1b8E2wCN36cZ/Mw5
 kROA==
X-Gm-Message-State: AJIora9kYH0Yvi94EiwFlLYGWks3hE58se27DzGc6kaUsBNJmWOU9akY
 PWBxYJKmMM0lmdcBqKBS/Wfn2Dsn2wNECQ==
X-Google-Smtp-Source: AGRyM1sQRnk9EIy+pn9FBikKn2BDtf3YIPicDFwD1yQsgso5g1fCOaIzgdqXDnqa+lVukz2rMiArgA==
X-Received: by 2002:a05:6402:2051:b0:435:71b5:b627 with SMTP id
 bc17-20020a056402205100b0043571b5b627mr8329803edb.267.1655654147624; 
 Sun, 19 Jun 2022 08:55:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 kw25-20020a170907771900b007044ae2538esm4675699ejc.33.2022.06.19.08.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:55:47 -0700 (PDT)
Message-ID: <3330fcee-9e10-ee5e-181a-65b577f15e3e@mind.be>
Date: Sun, 19 Jun 2022 17:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613202855.293980-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613202855.293980-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fi1Hf/cqWhimx82RR4rMIiBvVnTY9/sb496D7vxKWEE=;
 b=VJ0BMy3qaTu7yE8ru33GbI0Yi+L0gGcR+hNF0yLGcUp+JN+IH+fuItSAhwzaBvCxuB
 s3F4iFWiLq/kJzefL9bD7+uFvF0GfS++gEIAKJZ/FQRCq4Jsy01BbG7QYgknSQMC/IpG
 zjUDC2MUzSI6ZE412jbd9UZ3x6WgXRT4np1aaxEDgon8R6Oa/3Mn8B3y9GsgWoI62oRs
 08zxWsMaZsfAdE7iFGbI0fakDZMsbk917p8GjjA/7C2czAK5PqUexLk94VZV4GZhuaNn
 DUF2Mhrfq2HeCluW7hO4IzQLWPe6WEqyqoN5kzEtOTK4yWWQ/2YW+nB8XGYbnNrvocI0
 XWKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VJ0BMy3q
Subject: Re: [Buildroot] [PATCH 1/1] package/fxload: fix static build
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
Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2022 22:28, Fabrice Fontaine wrote:
> Fix the following static build failure:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o fxload ezusb.o main.o
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
> /home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fxload/0001-fix-static-build.patch | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 package/fxload/0001-fix-static-build.patch
> 
> diff --git a/package/fxload/0001-fix-static-build.patch b/package/fxload/0001-fix-static-build.patch
> new file mode 100644
> index 0000000000..9ce49baa6e
> --- /dev/null
> +++ b/package/fxload/0001-fix-static-build.patch
> @@ -0,0 +1,25 @@
> +fix static build
> +
> +Fix the following static build failure:
> +
> +/home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o fxload ezusb.o main.o
> +/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
> +/home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +diff -Naur fxload-2008_10_13.orig/Makefile fxload-2008_10_13/Makefile
> +--- fxload-2008_10_13.orig/Makefile	2022-06-11 22:11:02.845916977 +0200
> ++++ fxload-2008_10_13/Makefile	2022-06-11 22:12:25.118006070 +0200
> +@@ -39,7 +39,7 @@
> +
> + # object files
> + $(PROG): $(FILES_OBJ)
> +-	$(CC) -o $(PROG) $(FILES_OBJ)
> ++	$(CC) $(LDFLAGS) -o $(PROG) $(FILES_OBJ)
> +
> + %.o: %.c
> + 	$(CC) -c $(CFLAGS)  $< -o $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
