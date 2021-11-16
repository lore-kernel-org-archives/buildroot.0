Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB03C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142EB61BAA
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 142EB61BAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A9F40454;
	Tue, 16 Nov 2021 20:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQHFxOkZPBad; Tue, 16 Nov 2021 20:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2781F40425;
	Tue, 16 Nov 2021 20:05:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14ADD1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 031E740425
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6lrL_EhTlqT for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D9B64041C
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:05:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g14so230846edz.2
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PyPrdeiLLqIhyFoj2qGcjCs/oKBYpFKQPuV/Q4w6pqE=;
 b=Uz5lDscs4JOGYnohTpJ1BrLJXOU+r4XmWxsrFgs3OxkZubytXjpwUAuobXIo44Xi2T
 MqxXEMU8Oa0iB69vHHOiLKHoFckJCVxStHGVqMsmajcw4QVUiB1PIviGl8mJyVNABlGd
 aXhXlCiEMFyX6/GHx54dcwNOky/uvbA5HLZCte5OKIzYcztYzVAcjhNTeHK3kkdDlD+a
 LErp2h36EAL+VIIKPbGRNSswUlhpf7ITQwtVmhwTWPMdI3I79bC1OTfyVq9edm1794oC
 tT+6NbQvG01DyBiUATrN8IEx9rahBZ0r+Jp3nY1VZ+UNPV8vxMpCfPwtew/DF8DRtTtg
 itcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PyPrdeiLLqIhyFoj2qGcjCs/oKBYpFKQPuV/Q4w6pqE=;
 b=Z5wuxDbq8Ald9m72kxdB+CYTxE/EqIvpEordc0RJmj5HObMpN744LqgKjR+pvxzmqc
 Ps7CRRZTAbdBEHshBCZjOOwM5Km8QJZ9sWJUZhw458E+Vg6RmlVdIwff6XwfSOtTv4nb
 nFgNI7rGnKjY9CYPnlw/dsGUu1URvM0LHGfnsr05pVmXaVkhS/WPOV4DmODAV8lI0TIN
 e9kUl8K8bsRUL12ueoyk+BQIx/49laHrU4aQAkZW2sVX1JqHHHKp0nyDBUslBBVF8uNF
 XJS/43qrkUuX+QUd6SRrZRi2iNbBSvrYS2zLJWIOaTN7oQuX74uaL00FjDjcfFVdj5Fr
 Sw8w==
X-Gm-Message-State: AOAM531FNGn9TpQrB/08zh3XtwfFaRAARhuWsP2D9layWYdUbiYGtI2V
 O+6YUVS4Ejj8JYUkL+TMaDqNfQ==
X-Google-Smtp-Source: ABdhPJxjChjCLhxapokZ7/pz/fbHE76oJknO+PA4BF8vKvc7mQ4BVqqsudVZVvRJFzmxjLBSuKbRGw==
X-Received: by 2002:a17:906:7310:: with SMTP id
 di16mr13129477ejc.92.1637093140639; 
 Tue, 16 Nov 2021 12:05:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id yd13sm3104108ejb.39.2021.11.16.12.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:05:40 -0800 (PST)
Message-ID: <8f829c54-7149-967a-01f3-39f07607bcea@mind.be>
Date: Tue, 16 Nov 2021 21:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: add girdir to
 glib-2.0.pc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2021 19:08, Fabrice Fontaine wrote:
> Add girdir to glib-2.0.pc to fix the following build failure with atk,
> gcr or harfbuzz:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> 
> This build failure could also be fixed by removing our update of girdir
> in gobject-introspection.mk but this will have side effects as gir files
> won't be installed in the correct directory. So patch glib-2.0.pc
> instead.
> 
> Note: autotools-based packages have already been fixed by
> https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
>   - http://autobuild.buildroot.org/results/67a47386019c2a700df348ad6846064e0950e87b
>   - http://autobuild.buildroot.org/results/2c6a4470542af574f9407fa5867f0408ec2b4880
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...eson.build-add-girdir-to-glib.2.0.pc.patch | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> 
> diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> new file mode 100644
> index 0000000000..7eeecbe336
> --- /dev/null
> +++ b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
> @@ -0,0 +1,33 @@
> +From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 12 Nov 2021 18:01:05 +0100
> +Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
> +
> +Add girdir to glib-2.0.pc to fix the following build failure with atk:
> +
> +/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
> +Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + glib/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/glib/meson.build b/glib/meson.build
> +index f78f32969..6c5486699 100644
> +--- a/glib/meson.build
> ++++ b/glib/meson.build
> +@@ -377,6 +377,7 @@ pkg.generate(libglib,
> +   subdirs : ['glib-2.0'],
> +   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
> +   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
> ++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
> +                'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
> +                'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
> +                'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
