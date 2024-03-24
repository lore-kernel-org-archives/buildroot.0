Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BFBC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D0D640004;
	Sun, 24 Mar 2024 15:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzkVcmNHo3R3; Sun, 24 Mar 2024 15:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4184023B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C4184023B;
	Sun, 24 Mar 2024 15:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 852031BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71ABD60725
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8h1pDZV_ioVl for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 538E4606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 538E4606D4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 538E4606D4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:50:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso26338835e9.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711295418; x=1711900218;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k/VcDQHZQlcQ33hKtpIn6KR4Ll/QOn8MtAefC7h6GUo=;
 b=ITK/Pz1U7l0LdlQp8xoKmihjM6USB8iyty0zqPXj6KhymcfJLZY63hq/Er/3iw9vYk
 pzMyysvUIyUG1uNNAXqbs2+sOJBe604IKPyXZQmL3aJdPgWvCOFCOm6KWvJVxphGZVjx
 vvFZQI/m4btrc6QwGHLXlVut7wPlea5jdg1TmNryY0j7Fjd4vl9QuO81LXQL8qMoviTU
 9Cw1cUTD3hqsPoqQwtS0PbBfvWB6jQIrI4KDShlkfbiugqfBPWJ7h7ezylbgW5tPP+CJ
 1Z5U6OtYdThPzQ6Io37egbhHg4b9mfMpFR05q2F0o1ht6qcprq4JojbAGA5KVLCVxF2W
 X8bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxaKSDtu3BaqYY3rcWolUCzps8DYVq6XBwU1lZjxYCkzhYFjaqrqtc29asfibmF91prajY91WvVo6Fp1vk6zFguS/Igz8RMQ==
X-Gm-Message-State: AOJu0YxCEMgOxdmOJVNGY9bxKgefAZSlwIjLBYissvd9jsNI9YyQDojG
 cgFiLzc6md1Iq1LqF9xXbiA6JelW9x6n1OgcMXo+3YG3b5vErLJf9smmhBD0AxA=
X-Google-Smtp-Source: AGHT+IExnFvnplo87KwU1c8aXSWb/3RhCxCASKP6vKGJQEiyPZ/CD/A3k6KW1mjpSV3Nqd/BJ+NW3A==
X-Received: by 2002:adf:fb4a:0:b0:33e:6760:5298 with SMTP id
 c10-20020adffb4a000000b0033e67605298mr3652080wrs.29.1711295418225; 
 Sun, 24 Mar 2024 08:50:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b00341c162a6d4sm3966357wrt.107.2024.03.24.08.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:50:17 -0700 (PDT)
Message-ID: <757b85e4-3f1c-47c2-9149-0e64c83e0f3d@mind.be>
Date: Sun, 24 Mar 2024 16:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240315221029.88170-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240315221029.88170-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711295418; x=1711900218; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k/VcDQHZQlcQ33hKtpIn6KR4Ll/QOn8MtAefC7h6GUo=;
 b=hgfKmb/Jc4x68DWoBk5t/52jduI7eMzcWDytI1QYfsh0f117P0zo4Ufu4vJw/FUHuX
 HDaSHppFksMtqPda1sML+bFLwJaFjdY7JmoGg1Jpt1G6Z8kUUTN6DvuluWWXoAMDzCu7
 URF9fTkMG+z43MW5tDjU76aDPKq+As7A2rAsrFhiSo9act7pH9W5iDqW9Clh2vHIMf82
 cAN5dY9Jw4FN3HU3xGnES4cCIbtGDQRPWrMpWPEmACMIUtpTRQPywemFsxzx+foTgje4
 zm7774kfzPVvV3Aw592z7pOB8CEdN2h9kGTZmTMWsdHm9/vfKlUoprmJSScG2ke4ZSPS
 RSWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hgfKmb/J
Subject: Re: [Buildroot] [PATCH 1/1] package/cvs: fix build without editor
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2024 23:10, Fabrice Fontaine wrote:
> Set default editor to /bin/vi to fix the following build failure when no
> editor is found on host:
> 
> configure:40833: checking for vim
> configure:40862: result: no
> configure:40833: checking for vi
> configure:40862: result: no
> configure:40833: checking for emacs
> configure:40862: result: no
> configure:40833: checking for nano
> configure:40862: result: no
> configure:40833: checking for pico
> configure:40862: result: no
> configure:40833: checking for edit
> configure:40862: result: no
> configure:40874: error:
>      Failed to find a text file editor.  CVS cannot be compiled
>      without a default log message editor.  Searched for
>      `vim vi emacs nano pico edit'.  Try `configure --with-editor'.
> 
> While at it, drop CVS_CONFIGURE_ARGS variable for simplicity

  Nice!

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5b8a747698bc2e64eb1f001e87577e86e4cb8d14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/cvs/cvs.mk | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
> index bd1e04eee0..64c15f16fe 100644
> --- a/package/cvs/cvs.mk
> +++ b/package/cvs/cvs.mk
> @@ -18,18 +18,18 @@ CVS_CONF_ENV = \
>   	ac_cv_func_working_mktime=yes \
>   	cvs_cv_func_printf_ptr=yes
>   
> -CVS_CONFIGURE_ARGS = --disable-old-info-format-support
> +CVS_CONF_OPTS = \
> +	--disable-old-info-format-support \
> +	--with-editor=/bin/vi
>   ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
> -CVS_CONFIGURE_ARGS += --enable-server
> +CVS_CONF_OPTS += --enable-server
>   else
> -CVS_CONFIGURE_ARGS += --disable-server
> +CVS_CONF_OPTS += --disable-server
>   endif
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
> -CVS_CONFIGURE_ARGS += --with-external-zlib
> +CVS_CONF_OPTS += --with-external-zlib
>   endif
>   
> -CVS_CONF_OPTS = $(CVS_CONFIGURE_ARGS)
> -
>   define CVS_BZIP_UNPACK
>   	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>   	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
