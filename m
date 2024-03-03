Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D98BC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAFCE4079A;
	Sun,  3 Mar 2024 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNNZwlELZtca; Sun,  3 Mar 2024 20:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0A60407A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A60407A8;
	Sun,  3 Mar 2024 20:14:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD611BF340
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98AF481F5E
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnhP1kenlUAB for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:13:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E65E81F5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E65E81F5A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E65E81F5A
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:13:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412e2dfa58eso1639645e9.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 12:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709496836; x=1710101636;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LdTLz8gpuTMO1zNF7nduUpbzOp1vvPV/Ij2gQHo+KVc=;
 b=jOPnnoJd3WzD+7Ai7C9WzlywGw8Bnj3xQ5GD1qY+O7Eavs0F0kRBnkMHQiOqp6O8t+
 KJur9H+x/SUI2GUhn5TjU1S382krUAdq6FcL4lL61hr/BO/sIG/TzIAon5M53kw7e5+s
 7VzZmhpp87xsFxDk1NML7TiJDc0SPxkmyiI7PxR0i2yE8JveqDTS+7ZU/mv/f342QJN4
 kbASKx6fkwlRXhqK3GEtGnEtvef6X77Htbi7HqA3Cttzw0gSbuw+tlH6kZ4LlYiZCqO+
 n52WV6cdfVk1SJ4h7JbluUQt1Lu569vzjCU79zEQ+Jp213tsyMh9H2K3XI0P9Wd1qlgI
 8cfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6ZKXMogzbAieaHJ+JJjAAWMELjPh3apTzZC1X82RuNwoG1udZSlR6JCFnbbONagZYpsrK32O5/pp90BqoNjoc73f8ylibIg==
X-Gm-Message-State: AOJu0Ywbk2zcAv3/092j3uLgSgMU3pryQNLbGgy9wuymbwYodR1sSHxW
 HNlBLvNnKilD3rVnt8IkQmQYHuY4w7WFM/Y80K4QfVC0QBqzPXcPLjzml6IptXI=
X-Google-Smtp-Source: AGHT+IFDfdZNPQ9Ro6EMOeo6uBLfD3dkIk8CRss6G75GuoR1GWeciBa9CspmoCQH+IELh6Q8Rn+JfA==
X-Received: by 2002:a05:600c:3b94:b0:412:d1ee:dfa2 with SMTP id
 n20-20020a05600c3b9400b00412d1eedfa2mr3946973wms.0.1709496836219; 
 Sun, 03 Mar 2024 12:13:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adffe07000000b0033e34c53354sm2228761wrr.56.2024.03.03.12.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 12:13:55 -0800 (PST)
Message-ID: <7e7f9f26-dc05-4fab-9b86-ff70a43d0f0b@mind.be>
Date: Sun, 3 Mar 2024 21:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709496836; x=1710101636; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LdTLz8gpuTMO1zNF7nduUpbzOp1vvPV/Ij2gQHo+KVc=;
 b=Jj3u2N4Ldo6JfBfHD+D1mj0moL441kvn1WPtoPkXL2Hlc+ptYK8gS5lIUytHuAxRFX
 gt8Go0d6EyRjK+qgeN/ME0en9Mm305qg4Iw+wsWR5S0HGp2xlTzYxg/MxK9bFBu9NZUF
 DyRbOEf4z+5JuYECGdnwp/yD8ZJB5TX81jrDd6S6rA/hgGsvGtbPVib47T73KlJsl+TE
 uALP6wQ2HOWQEi89KvMg3oDDqNbFMVxqjZqVgHwYUY2Gu4Gpp+hJFDn6kwLC+hGGEmaw
 IBzQbNCaeA2A/a5aN1IbdFFgoBd3DMCp/7pgDMo3B9FZgMsTwiJUgpwkNCxZGEJIvXV1
 2UoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jj3u2N4L
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/11/2023 20:13, Fabrice Fontaine wrote:
> Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
> following build failure with BR2_TIME_BITS_64 raised since commit
> 3c427c64726560ea1743282a3fdb78f5b28692eb:
> 
> In file included from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
>                   from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
>                   from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/stdint.h:26,
>                   from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/include/stdint.h:9,
>                   from ../include/selinux/avc.h:9,
>                   from avc.c:10:
> /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>     26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>        |     ^~~~~
> 
> This LFS workaround for glibc < 2.23 was added in 2016 by commit
> ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
> anymore as glibc 2.23 was released in February 2016:
> https://sourceware.org/glibc/wiki/Release/2.23
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d85c81f87adf3a5945fa369bcec233e6def2ed12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  As pointed out by Thomas, this will (probably) break the build with the 
codesourcery-arm toolchain, so that toolchain should be removed as well...

  Regards,
  Arnout

> ---
>   package/libselinux/libselinux.mk | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index b8de21edaa..529745f82e 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -52,14 +52,6 @@ define LIBSELINUX_BUILD_PYTHON_BINDINGS
>   endef
>   endif # python3
>   
> -# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22. We
> -# set CFLAGS, CPPFLAGS and LDFLAGS here because we want to win over the
> -# CFLAGS/CPPFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_DISTUTILS_ENV)
> -# when the python binding is enabled.
> -LIBSELINUX_MAKE_OPTS += \
> -	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
> -	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
> -
>   define LIBSELINUX_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>   		$(LIBSELINUX_MAKE_OPTS) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
