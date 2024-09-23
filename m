Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C477CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 05:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3525C60585;
	Mon, 23 Sep 2024 05:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwTUbnhyEL6j; Mon, 23 Sep 2024 05:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D177605A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D177605A3;
	Mon, 23 Sep 2024 05:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8D11BF21A
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 05:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C1CF40282
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 05:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaoBpyNgIiL5 for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 05:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F8DA400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F8DA400F3
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F8DA400F3
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 05:59:09 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 8EDEC4408CD;
 Mon, 23 Sep 2024 08:56:39 +0300 (IDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240923054626.2911036-2-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Mon, 23 Sep 2024 07:46:26 +0200")
References: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
 <20240923054626.2911036-2-dario.binacchi@amarulasolutions.com>
Date: Mon, 23 Sep 2024 08:59:05 +0300
Message-ID: <878qviud06.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727070999;
 bh=+6oj1j4Mwo+bW+oBfGKjpzonRyMGpNXaG3tM0A9Tz/0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hhLXeT0gu2E2PflvX0GlCNJdDd1aMLcYcJ4ICFOCYbLDnoMYfbJHmIx+HoUXRhGkD
 7bGEVFWOIaBJ5cFsmUjJm2NuwXs12UNlijmfr63BkINuyVCwn7jUpMfjXKgJTTO9OL
 P+6WoDTQnsffrdWxyabAXXJ3Uj6dWWGcQ5ONCVE7uuhY2c/w0CpckQq1rRlAg29nEK
 NlOxsBQnVwZ+7w9AAP7Vya2kj98CgHaQlPh05jR3ak5qbVjpIB57MWkaUtnwcwhsID
 d5cnFOd9z1O5ZdzniY9OOAlXZN5YMTmn4z4XVPDPM+PXtwY8mSMWri2ikBRYZfZYTB
 77bZ7U06fKlqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=hhLXeT0g
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Petr Vorel <petr.vorel@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Mon, Sep 23 2024, Dario Binacchi wrote:
> The building test using musl as the C library for the cross-compilation
> toolchain raised errors that required the application of two additional
> patches.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>  - Drop changes in .mk. After applying the patches they are not required
>    anymore.
>  - Update commit message.
>
>  ...04-bridge-mst-fix-a-musl-build-issue.patch | 73 +++++++++++++++++++
>  ...e-mst-fix-a-further-musl-build-issue.patch | 56 ++++++++++++++
>  package/iproute2/iproute2.hash                |  2 +-
>  package/iproute2/iproute2.mk                  |  2 +-
>  4 files changed, 131 insertions(+), 2 deletions(-)
>  create mode 100644 package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
>  create mode 100644 package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
>
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

I guess you can drop this part now.

baruch

> +
> +to fix the following errors:
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
> +---
> + bridge/mst.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bridge/mst.c b/bridge/mst.c
> +index c8f7e6606c3c..fccb7fd68140 100644
> +--- a/bridge/mst.c
> ++++ b/bridge/mst.c
> +@@ -4,6 +4,7 @@
> +  */
> + 
> + #include <stdio.h>
> ++#include <sys/time.h>
> + #include <netinet/in.h>
> + #include <linux/if_bridge.h>
> + #include <net/if.h>
> +-- 
> +2.43.0
> +
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index 0760183b9e66..028a32439644 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  91a62f82737b44905a00fa803369c447d549e914e9a2a4018fdd75b1d54e8dce  iproute2-6.10.0.tar.xz
> +sha256  1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3  iproute2-6.11.0.tar.xz
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 08b890b33117..c452b64cdea1 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IPROUTE2_VERSION = 6.10.0
> +IPROUTE2_VERSION = 6.11.0
>  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
