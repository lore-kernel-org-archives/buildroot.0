Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEDCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:29:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BFC60F58
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2BFC60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E119400FC;
	Sat, 11 Sep 2021 16:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHoN5RKvnreQ; Sat, 11 Sep 2021 16:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D09E40489;
	Sat, 11 Sep 2021 16:29:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FFE31BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C264415BD
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wn2aIBQ6E18A for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:29:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1749F415BC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:29:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g21so7257889edw.4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PnfXfNsFGCIHppOXuM+LYxOS5uwlXeBBlOzfMOhnPzc=;
 b=SdaVxUIvOJ+uvJbUz7+cOXEiHvkYu/Y+kmDhpwASz+HvybVUwc2dN14UPCcFpeAyDd
 HvjKXSf5ypN2niJlxPwhr4cOEiRojw960RyjKwGhP3EigjmarQRhZ9blPtRhUNqCTeaJ
 xEkSXx18n/jzDupcwEeWCw3Ft7Ga5q1rH3PstNLgHxtHfocNqqoVeYT5jcJKxaz/y205
 GnJLhFLusUo2mHSUjNNztc3czymcgAp7LYxHFqYi51LSw7arrupo5T9z/lq6vF7pzpM/
 2tVJCA1nH9t4V9UqoBSiyf0WbZQVzGe85gVDVGhy82MKcPJE/4ghWr1nUiHDAUElZxTY
 MuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PnfXfNsFGCIHppOXuM+LYxOS5uwlXeBBlOzfMOhnPzc=;
 b=ILXfY0OAy1QwoLX4w9ZIrwaEa2OdsB3/6SaPBmbGT314QLKbut2pgPUR5MgUGbVSDR
 5o7necP+hFH9lV1LtopiezQWYbiAPldqOM3+InM/Ngfj5e40PV3pY6pqonZxsahbxPkL
 c7ptX47lcOiGqRx/64tUBk8XrnKezoMoqeuS9SkvSkV6FAsAYRzifABkWWtjbfZe77SW
 9OVbcgAA724IT5kWKx3iLmHXBTrxh3h00FfkdX9x8aTpN5iTJ3f9GyF0B+ulfHq+Gfbd
 pHR/yUBck+NkCkYOeQK7fYP7Z/SHHtvRZwXDSrcYKB4zGTpSIbKyGgAD81pVb++OhAKC
 F3pg==
X-Gm-Message-State: AOAM5334SQTvebs2dXU6moUtxiszM4/gw/j6EvT/u0KwsMZ5VyvNeaxi
 WaJNxP+m4yr+0j5ayHjLAvAeYu9LthQ=
X-Google-Smtp-Source: ABdhPJwdftImCbZAIWAkBgLXKYtstTOF9RHBO/sE4UveEzPKTZJ0WyTPbAF8YFziWbqd7AWx7w7z8g==
X-Received: by 2002:a05:6402:5163:: with SMTP id
 d3mr4061544ede.220.1631377789343; 
 Sat, 11 Sep 2021 09:29:49 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z18sm325925edq.29.2021.09.11.09.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 09:29:48 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210831195812.1095065-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8f2f0ec2-9907-3c14-85dc-5888542efcdc@mind.be>
Date: Sat, 11 Sep 2021 18:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831195812.1095065-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/zip: fix musl static build
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
Cc: Jan Pedersen <jp@jp-embedded.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 31/08/2021 21:58, Fabrice Fontaine wrote:
> Fix the following static build failure on musl which is raised because
> the "Check for directory libraries" in configure wrongly adds -DNO_DIR
> when no directory library is needed:
> 
> /tmp/instance-0/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -c -D_FILE_OFFSET_BITS=64 -O2 -g0 -static -I. -DUNIX -DUIDGID_NOT_16BIT -DBZIP2_SUPPORT -DLARGE_FILE_SUPPORT -DUNICODE_SUPPORT -DNO_MKTIME -DNO_DIR -DHAVE_DIRENT_H -DHAVE_TERMIOS_H unix/unix.c
> unix/unix.c:70:14: error: conflicting types for 'DIR'
>    70 | typedef FILE DIR;
>       |              ^~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/83a6e0c8c4ad026cb0261246e3b1a80d754454bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks. I added a comment that upstream is dead.

 Regards,
 Arnout

> ---
>  package/zip/0008-fix-musl-static-build.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/zip/0008-fix-musl-static-build.patch
> 
> diff --git a/package/zip/0008-fix-musl-static-build.patch b/package/zip/0008-fix-musl-static-build.patch
> new file mode 100644
> index 0000000000..a7a31eba9e
> --- /dev/null
> +++ b/package/zip/0008-fix-musl-static-build.patch
> @@ -0,0 +1,20 @@
> +fix musl static build
> +
> +Don't define NO_DIR if no directory library is needed
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +diff -Nura zip30.orig/unix/configure zip30/unix/configure
> +--- zip30.orig/unix/configure	2021-08-31 21:29:55.219967136 +0200
> ++++ zip30/unix/configure	2021-08-31 21:50:48.239280513 +0200
> +@@ -569,8 +569,8 @@
> +   done
> +   if [ ${OPT} ]; then
> +     LFLAGS2="${LFLAGS2} ${OPT}"
> +-  else
> +-    CFLAGS="${CFLAGS} -DNO_DIR"
> ++  #else
> ++  #  CFLAGS="${CFLAGS} -DNO_DIR"
> +   fi
> + fi
> + 
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
