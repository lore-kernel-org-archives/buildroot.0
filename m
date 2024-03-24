Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227F5C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5F5D4026A;
	Sun, 24 Mar 2024 16:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6zzNeb2Txus; Sun, 24 Mar 2024 16:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA14403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA14403A2;
	Sun, 24 Mar 2024 16:54:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77BD31BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71FCD606EA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZkI66jidkeC for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F4E4606B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F4E4606B0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F4E4606B0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:54:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3416a975840so2764084f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299257; x=1711904057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SUcMSj/pyuGIveXG9wRhWC+T/Vq5NN2AvOWda6QbMKU=;
 b=QGq/ZG2CJSUry9ymKHkByR8l7I8hyuLxTB7N4tN6RHtvVEj8cF46Q1LZDzrxqcLpMX
 7yeCtLKMMTVsu7pf+RRhj7xVYfbzmaSVXKh7fikO7rYAt0ISnDAw+v0FpeaC0Hmn1nfw
 eu3PsjYe/Gq83mYVdYmn2m0rhhTOvvJITeum7IzwcqaQzdZylnaKtB1EI2OQ+Gqs9xH/
 W3bZJNFQ6Y7gCi73jU1IlNp8PrBPkuXS6XUSb+OgeTAZccHn0GJifIejDwehEviS+OYE
 554Q6QEvZ1AZa0QYfZaaonbjURYVUNWF11qzVQbzbJYPjsdYS3OpXSMlBA54dX0+cswt
 m4fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc3p0NI5S4L8UwDads7E/SE9JxuaCCdhULENarYVcfW2fqzTurxKuwwlei2SCD5ahSCgZVlXvkOkSigQ8zY+I5B7LDm4ZrLw==
X-Gm-Message-State: AOJu0YzRNdfnujFbxVd4O2rV05nvvawlXNFdb5xLQ/gQrVW70Yl1sY3Z
 VX6H8RhZHCKOrV2yxXB1jFtTJXeYSO8VdbneXc0ji9g0DeJOBePjQifjBA8UfKk=
X-Google-Smtp-Source: AGHT+IGmmwDn+0svEOkXM9LAONJ+AIIc7YHBy5sBJTcOYMyC+9FLyylYmIqBhc1PggKS3fh5rpbYRA==
X-Received: by 2002:a05:6000:1c9:b0:33e:a1ec:bb69 with SMTP id
 t9-20020a05600001c900b0033ea1ecbb69mr3775051wrx.40.1711299257328; 
 Sun, 24 Mar 2024 09:54:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 df4-20020a5d5b84000000b0033e7b433498sm7192618wrb.111.2024.03.24.09.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:54:17 -0700 (PDT)
Message-ID: <c86ff629-4118-43ed-aedd-306f08d87f58@mind.be>
Date: Sun, 24 Mar 2024 17:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317141438.809626-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317141438.809626-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299257; x=1711904057; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SUcMSj/pyuGIveXG9wRhWC+T/Vq5NN2AvOWda6QbMKU=;
 b=IEOSsvePCXdsR87KBqDVI01bZs+RAeGiVevoeN2EoVkRNzk6Z1+yICW88LB9+H1wyE
 Cf71p+PAc+iCYhgsg+dyexDsBhmPssv6aeZS6LGmPZwIXIsZMasrxKcVAXgwS+ecM+Aw
 b5MJUmvCqGsKCR0HW8xQciue1p52KHfJZv7L6OAw6PI94L2lBKul8W20fklSQWaQafId
 JrOFlm4J2fD5vl2yiyTbUEiyAlGRcSkATtdh970D4ynM55NCW9ow9SDkv9RzFAxM3Xfs
 w7V5QJBbW0a5ClB56232FNSBKIMubq5aYFsaZftvZ8wAUar4ZQLDMAIwRYOOfZktj2tI
 8txA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IEOSsveP
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 15:14, Fabrice Fontaine wrote:
> Fix the following build failure when the configuration files are
> installed as root:
> 
> id: 'privoxy': no such user
> ******************************************************************
>   WARNING! WARNING! installing config files as root!
>   It is strongly recommended to run privoxy as a non-root user,
>   and to install the config files as that user and/or group!
>   Please read INSTALL, and create a privoxy user and group!
> *******************************************************************
> make[1]: *** [GNUmakefile:861: install] Error 1
> 
> This failure is probably raised since the addition of the package in
> commit f8a263fe361ab37ec6765b9ff6478c3b15e3d139 and
> https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=26baf6bcc0b5db47b8cf5c55eece0614712b5180
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/28d8ca6f0e2d81d62196a0958c9274ad2c8c9871
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...on-t-exit-if-configuration-files-are.patch | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
> 
> diff --git a/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
> new file mode 100644
> index 0000000000..e04d191ce0
> --- /dev/null
> +++ b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
> @@ -0,0 +1,30 @@
> +From 4b3b267db159dc23314de3062859481b7c397e32 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 17 Mar 2024 12:36:31 +0100
> +Subject: [PATCH] GNUmakefile.in: Don't exit if configuration files are
> + installed as root
> +
> +... as this can be considered acceptable when cross-compiling
> +Privoxy inside an autobuilder with only a root user.
> +
> +Upstream: https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=4b3b267db159dc23314de3062859481b7c397e32
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + GNUmakefile.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/GNUmakefile.in b/GNUmakefile.in
> +index 04cceb15..cf79aae1 100644
> +--- a/GNUmakefile.in
> ++++ b/GNUmakefile.in
> +@@ -927,7 +927,6 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
> + 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
> + 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
> + 					$(ECHO)  "*******************************************************************" ;\
> +-					exit 1 ;\
> + 				fi ;\
> + 			else \
> + 				GROUP_T=$(GROUP) ;\
> +--
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
