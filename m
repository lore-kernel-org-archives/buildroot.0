Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F0D20681
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C0D4067B;
	Tue, 15 Oct 2024 22:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcAs6-V_9nRm; Tue, 15 Oct 2024 22:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E334E40676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E334E40676;
	Tue, 15 Oct 2024 22:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58BA21BF2FC
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 22:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5297C4028E
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 22:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5E7SRLeH5jf6 for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 22:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C325740144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C325740144
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C325740144
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 22:19:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d55f0cf85so2898251f8f.3
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 15:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729030788; x=1729635588;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6auvUqr5NTsCKBpNoRUGvfdOKpezTALjv3vI1Qcc6po=;
 b=QG3l4uAP7TSMB+XsBOD9r3avMyyCbj6y6OKIWVfxs6JmUGVONyD6mrZD62K8JiTZyN
 kq1A6ESLFn6qItz5BZ1IBEw+w7p6LZSX4vg98IiYMA0iCoq7F/Yjs6MWbaZ2zDaXgUvk
 R67+xZoQFKWrFvwRqcUvPD+y2MQjqaf0tlKWIC5IHXyQFusayawnbxXlmAIbcB2Z7cQw
 DlZmex1dxXQF+uIyPD3NrymAomzhKFwL2znMZLB2zbKjuQBUF0YFcTrFYPc56VuMQnty
 9oVItex1LHfc0PlQyL2PTDz0DOZWTZJFU1DavvlpynQ9tEj+q0+y+HLRZQGYNyG1IWL5
 XuTQ==
X-Gm-Message-State: AOJu0Yybaz56OL6Qk3sUT1QaYj7Jy4RJqy/XdMnuUlzwmw0qQpSMg14k
 s1EQkz0STwI3wX2XpLw2R49P1hDvLc0MXx+Df53AXPfgPvPY5T81
X-Google-Smtp-Source: AGHT+IHbur9e1UTxUMBfD38blGRa8kArWbrwydQslc/On4GiJY7Eppju6CUqS+o3tfA2n3wibyaZ7w==
X-Received: by 2002:a5d:6687:0:b0:374:b3a3:3f83 with SMTP id
 ffacd0b85a97d-37d552cb66cmr13653267f8f.53.1729030788005; 
 Tue, 15 Oct 2024 15:19:48 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f56eabdsm30416515e9.27.2024.10.15.15.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 15:19:47 -0700 (PDT)
Date: Wed, 16 Oct 2024 00:19:45 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241015221945.GB67018@pevik>
References: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
 <20240923054626.2911036-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240923054626.2911036-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729030788; x=1729635588; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6auvUqr5NTsCKBpNoRUGvfdOKpezTALjv3vI1Qcc6po=;
 b=ViMKc9qenP7FimozNR48DA4ax7PJhMGv2ybCrEbQNUwgMOP//8PlEoxKFQlUu6d7dk
 ZV/ujfDTln7TgMMzbfeoUbor7jWLpXiXGzgiVrotK46biwwHloyO85OqyAWEUovCU8uC
 zRfujbK3uRw9GqbN0de2x8jojnRQmV5gsIfDJ3+oqJgsZ3A5FnKp4uOkpkVajMwHCIke
 d8KEnC/fdp92MCLBJ/+AbvOmTjW76kDcg95MLUsU45xVyMw38yfu9dsR+xEFbKSUqSEB
 kHFCX8OegItAIpp+oKv9DQZWg+GIfvWfOOhXuB5MxZktzpOAINtmkrc30u1/g6jhsSup
 /O7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ViMKc9qe
Subject: Re: [Buildroot] [PATCH v3 2/2] package/iproute2: bump to version
 6.11.0
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Thank you!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

...
> diff --git a/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch

> new file mode 100644
> index 000000000000..9dddfb6e7f26
> --- /dev/null
> +++ b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
> @@ -0,0 +1,73 @@
> +From 0359ee6dc57ee8aa21a3f0f7404422c0f9372d3a Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Sun, 22 Sep 2024 14:00:42 +0200
> +Subject: [PATCH] bridge: mst: fix a musl build issue
> +
> +This patch fixes a compilation error raised by the bump to version 6.11.0
> +in Buildroot using musl as the C library for the cross-compilation
> +toolchain.
> +
> +After setting the CFLGAS
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
> +			-D__UAPI_DEF_IPV6_MREQ=0
> +endif
> +
> +to fix the following errors:
Baruch suggested to drop this part now, but it's a part of upstream patch now.

https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=6a77abab92516e65f07f8657fc4e384c4541ce0e
> +
> +In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
> +                 from ../include/libnetlink.h:14,
> +                 from mst.c:10:
> +../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
> +   23 | struct in6_addr {
> +      |        ^~~~~~~~
> +In file included from ../include/uapi/linux/if_bridge.h:19,
> +                 from mst.c:7:
> +../include/uapi/linux/in6.h:33:8: note: originally defined here
> +   33 | struct in6_addr {
> +      |        ^~~~~~~~
> +../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
> +   34 | struct sockaddr_in6 {
> +      |        ^~~~~~~~~~~~
> +../include/uapi/linux/in6.h:50:8: note: originally defined here
> +   50 | struct sockaddr_in6 {
> +      |        ^~~~~~~~~~~~
> +../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
> +   42 | struct ipv6_mreq {
> +      |        ^~~~~~~~~
> +../include/uapi/linux/in6.h:60:8: note: originally defined here
> +   60 | struct ipv6_mreq {
> +
> +I got this further errors
> +
> +../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
> +   72 |         struct in6_addr flr_dst;
> +      |                         ^~~~~~~
> +../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
> +  711 |                         struct in6_addr ip6;
> +      |                                         ^~~
> +
> +fixed by including the netinet/in.h header.
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20240922145011.2104040-1-dario.binacchi@amarulasolutions.com/

Maybe to use here upstream commit as a reference:
https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=6a77abab92516e65f07f8657fc4e384c4541ce0e
> +---
> + bridge/mst.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bridge/mst.c b/bridge/mst.c
> +index 873ca5369fd6..c8f7e6606c3c 100644
> +--- a/bridge/mst.c
> ++++ b/bridge/mst.c
> +@@ -4,6 +4,7 @@
> +  */
> + 
> + #include <stdio.h>
> ++#include <netinet/in.h>
> + #include <linux/if_bridge.h>
> + #include <net/if.h>
> + 
> +-- 
> +2.43.0
> +
> diff --git a/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
> new file mode 100644
> index 000000000000..f4e7c317bf9c
> --- /dev/null
> +++ b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
> @@ -0,0 +1,56 @@
> +From 62c4dfff5ff596984ece7960fba49b05d69f37a7 Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Sun, 22 Sep 2024 14:11:18 +0200
> +Subject: [PATCH] bridge: mst: fix a further musl build issue
> +
> +This patch fixes the following build errors:
> +
> +In file included from mst.c:11:
> +../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +      |                              ^~~~~~~
> +../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
> +   50 |                                     type value);                        \
> +      |                                     ^~~~
> +../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +      |                              ^~~~~~~
> +../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
> +   55 |                                             type value)                 \
> +      |                                             ^~~~
> +../include/json_print.h: In function 'print_tv':
> +../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
> +   58 |                                                value);                  \
> +      |                                                ^~~~~
> +      |                                                |
> +      |                                                const struct timeval *
> +../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +      | ^~~~~~~~~~~
> +../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
> +   50 |                                     type value);                        \
> +      |                                          ^
> +../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
> +   80 | _PRINT_FUNC(tv, const struct timeval *)
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://patchwork.kernel.org/project/netdevbpf/patch/20240922145011.2104040-2-dario.binacchi@amarulasolutions.com/

And here: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=043ef90e2fa94397eb5c85330889ca4146a6d58a

...

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
