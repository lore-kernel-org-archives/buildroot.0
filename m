Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DA4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 13:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA1E427F6;
	Sun, 12 Dec 2021 13:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqLBNjEUpPU4; Sun, 12 Dec 2021 13:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D6E427F4;
	Sun, 12 Dec 2021 13:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D24921BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1A9A84EBD
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TG5f12SlVeCd for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 13:45:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 869D984EBC
 for <buildroot@busybox.net>; Sun, 12 Dec 2021 13:45:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w1so43946264edc.6
 for <buildroot@busybox.net>; Sun, 12 Dec 2021 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yZTDldjzoxFhZitK2yxXU/YQ4nO0Vzq9MdznL+hd9Kc=;
 b=fMygMRRpxK1ptbnCQjGvZsWnJkKDJ8LBzVCfeA00Uf+xFpn9wVuzrZoSVGuXAt1qVZ
 NGKafu3kcS6amm/YCrEYW4d4QkRScqdfqWZ90iVseTRGPsiRSljDAM8JUN9VqoTgFKCs
 AInPbUuqVv1QkHU/k+Dv5MtYamMrDloUdBA+0YUqDOPopIJhNDx6lTCfOwoM+7yW50Pt
 6S0tgTmHcMF7ug2FAQUletLVxcVolVyrbcpSkTeF/eGKHxZ679G8kqq2r29OmSZ0ZKZP
 aEk5+n3ho0qg3QGTAH7zxDrikeXxp1ekuc2TezUBLzFIgenJ6QzGL6JzJ7gKTFb//dJ1
 Ho1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yZTDldjzoxFhZitK2yxXU/YQ4nO0Vzq9MdznL+hd9Kc=;
 b=Crb9d3dIDpVmhidx8LWCidcV1VydUJQef54/Ax08GwNRgdhzPxjNXL7W6hRYFX/A/V
 ZHZmpLGvb1tqtX0mjLzd+iEybd2s6TBag9oQ11jVS6x0n8jROhbXy7LWvw+9hAiyndor
 FRHnJ/RAABemsqWk4mSlc2aAOBKx4rQ4qC7uw4t8TRYmtwuc1RdEpRrwlLZ/2+u6CbkQ
 9A2+JA06lQklq5Vw5rZd6F3qA3R6jDFtb1OQfUxiMNf9zuri7qeWG7nxi2Xd0LXoj9gZ
 JFuwFGdAObRy8qypwxhydeQlsC8LdeelJOTee8KCeDaNMiHvM0ueVPSvUaaec7PHcrkL
 D8jw==
X-Gm-Message-State: AOAM530iaROYVJM42PkGV2rNugHPEmj3/rGd2g8xEY7a9UACgUgkKnC1
 MrhBicoyWyjSvsuVbhD62HU4i6XRwE6XmQ==
X-Google-Smtp-Source: ABdhPJxz9BYm7gidGZScDpY5Eb39N4a1LEOwUFbnQ1lIjMMLUOYabN6bb81Sbigy2d4mXLYZZ8Z9ZA==
X-Received: by 2002:a17:906:8145:: with SMTP id
 z5mr37285908ejw.519.1639316746623; 
 Sun, 12 Dec 2021 05:45:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g9sm4822167edb.52.2021.12.12.05.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 05:45:46 -0800 (PST)
Message-ID: <a011fa5e-85d8-7668-b9f6-f9b51bdf07ee@mind.be>
Date: Sun, 12 Dec 2021 14:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <87bfa0d89421fbc984426606c6736fae94bcfbb8.1638989317.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87bfa0d89421fbc984426606c6736fae94bcfbb8.1638989317.git.baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH] package/strace: bump to version 5.15
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



On 08/12/2021 19:48, Baruch Siach via buildroot wrote:
> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...1-Avoid-relying-on-presence-of-ipx-h.patch | 149 ------------------
>   package/strace/strace.hash                    |   4 +-
>   package/strace/strace.mk                      |   4 +-
>   3 files changed, 3 insertions(+), 154 deletions(-)
>   delete mode 100644 package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
> 
> diff --git a/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch b/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
> deleted file mode 100644
> index 2e9fa24ed50f..000000000000
> --- a/package/strace/0001-Avoid-relying-on-presence-of-ipx-h.patch
> +++ /dev/null
> @@ -1,149 +0,0 @@
> -From 568ee52f885c463e7a283240f5ef6bbf9351bdb3 Mon Sep 17 00:00:00 2001
> -From: Eugene Syromyatnikov <evgsyr@gmail.com>
> -Date: Wed, 3 Nov 2021 00:48:59 +0100
> -Subject: [PATCH] Avoid relying on presence of ipx.h
> -
> -After Linux has broken UAPI in commit v5.15-rc1~157^2~207, it is well
> -possible that neither kernel nor libc (such as musl, for example)
> -provides an IPX-related header.  Avoid relying on its presence
> -in the strace's code and conditionalise the relevant checks in the tests.
> -
> -* configure.ac (AC_CHECK_HEADERS): Add linux/ipx.h.
> -* src/net.c: Remove <netipx/ipx.h>/<linux/ipx.h> includes.
> -* src/sockaddr.c: Likewise.
> -(IPX_NODE_LEN): New macro constant.
> -(struct sockaddr_ipx): New type definition.
> -* src/xlat/sock_ipx_options.in (IPX_TYPE): Provide a fallback value.
> -* tests/net-sockaddr.c [!HAVE_LINUX_IPX_H]: Do not include
> -<linux/ipx.h>.
> -[!HAVE_LINUX_IPX_H && HAVE_NETIPX_IPX_H]: Include <netipx/ipx.h>.
> -[!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)] (check_ipx): Do not
> -define.
> -(main) [!(HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H)]: Do not call
> -check_ipx.
> -
> -Closes: https://github.com/strace/strace/issues/201
> -
> -[Retrieved (and backported) from:
> -https://github.com/strace/strace/commit/568ee52f885c463e7a283240f5ef6bbf9351bdb3]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - configure.ac                 |  1 +
> - src/net.c                    |  5 -----
> - src/sockaddr.c               | 16 ++++++++++------
> - src/xlat/sock_ipx_options.in |  2 +-
> - tests/net-sockaddr.c         | 10 +++++++++-
> - 5 files changed, 21 insertions(+), 13 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b5053b7aff..c074a70c01 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -424,6 +424,7 @@ AC_CHECK_HEADERS(m4_normalize([
> - 	elf.h
> - 	gcov.h
> - 	iconv.h
> -+	linux/ipx.h
> - 	mqueue.h
> - 	netinet/sctp.h
> - 	netipx/ipx.h
> -diff --git a/src/net.c b/src/net.c
> -index bc2b1ad048..42696bfe89 100644
> ---- a/src/net.c
> -+++ b/src/net.c
> -@@ -28,11 +28,6 @@
> - #include <arpa/inet.h>
> - #include <net/if.h>
> - #include <asm/types.h>
> --#ifdef HAVE_NETIPX_IPX_H
> --# include <netipx/ipx.h>
> --#else
> --# include <linux/ipx.h>
> --#endif
> -
> - #include <linux/ip_vs.h>
> - #include "netlink.h"
> -diff --git a/src/sockaddr.c b/src/sockaddr.c
> -index bdd5a5bb7a..27fda59f26 100644
> ---- a/src/sockaddr.c
> -+++ b/src/sockaddr.c
> -@@ -24,12 +24,6 @@
> - #include <linux/if_ether.h>
> - #include <linux/x25.h>
> -
> --#ifdef HAVE_NETIPX_IPX_H
> --# include <netipx/ipx.h>
> --#else
> --# include <linux/ipx.h>
> --#endif
> --
> - #include "xlat/addrfams.h"
> - #include "xlat/arp_hardware_types.h"
> - #include "xlat/ethernet_protocols.h"
> -@@ -42,6 +36,16 @@
> -
> - #define SIZEOF_SA_FAMILY sizeof_field(struct sockaddr, sa_family)
> -
> -+#define IPX_NODE_LEN	6
> -+struct sockaddr_ipx {
> -+	uint16_t sipx_family;
> -+	uint16_t sipx_port;
> -+	uint32_t sipx_network;
> -+	unsigned char sipx_node[IPX_NODE_LEN];
> -+	uint8_t sipx_type;
> -+	unsigned char sipx_zero;
> -+};
> -+
> - static void
> - print_sockaddr_data_un(struct tcb *tcp, const void *const buf, const int addrlen)
> - {
> -diff --git a/src/xlat/sock_ipx_options.in b/src/xlat/sock_ipx_options.in
> -index eba97fd719..b09be117e4 100644
> ---- a/src/xlat/sock_ipx_options.in
> -+++ b/src/xlat/sock_ipx_options.in
> -@@ -1 +1 @@
> --IPX_TYPE
> -+IPX_TYPE	1
> -diff --git a/tests/net-sockaddr.c b/tests/net-sockaddr.c
> -index f1f9b01cdd..c8049fd68b 100644
> ---- a/tests/net-sockaddr.c
> -+++ b/tests/net-sockaddr.c
> -@@ -24,7 +24,11 @@
> - #include <linux/if_ether.h>
> - #include <linux/if_packet.h>
> - #include <linux/x25.h>
> --#include <linux/ipx.h>
> -+#if defined HAVE_LINUX_IPX_H
> -+# include <linux/ipx.h>
> -+#elif defined HAVE_NETIPX_IPX_H
> -+# include <netipx/ipx.h>
> -+#endif
> - #ifdef HAVE_BLUETOOTH_BLUETOOTH_H
> - # include <bluetooth/bluetooth.h>
> - # include <bluetooth/hci.h>
> -@@ -269,6 +273,7 @@ check_in6(void)
> - 	printf("connect(-1, %p, %u) = %d EBADF (%m)\n", in6, len, ret);
> - }
> -
> -+#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
> - static void
> - check_ipx(void)
> - {
> -@@ -295,6 +300,7 @@ check_ipx(void)
> - 	       c_ipx.sipx_node[4], c_ipx.sipx_node[5],
> - 	       c_ipx.sipx_type, len, ret);
> - }
> -+#endif /* HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H */
> -
> - /* for a bit more compact AX.25 address definitions */
> - #define AX25_ADDR(c_, s_) \
> -@@ -773,7 +779,9 @@ main(void)
> - 	check_un();
> - 	check_in();
> - 	check_in6();
> -+#if defined HAVE_LINUX_IPX_H || defined HAVE_NETIPX_IPX_H
> - 	check_ipx();
> -+#endif
> - 	check_ax25();
> - 	check_x25();
> - 	check_nl();
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index eb3e97424f5a..ff89447bfd5a 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
> -# https://strace.io/files/5.14/strace-5.14.tar.xz.asc
> -sha256  901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73  strace-5.14.tar.xz
> +# https://strace.io/files/5.15/strace-5.15.tar.xz.asc
> +sha256  ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc  strace-5.15.tar.xz
>   sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
>   sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 78d08404f9cc..4b70531aa708 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,14 +4,12 @@
>   #
>   ################################################################################
>   
> -STRACE_VERSION = 5.14
> +STRACE_VERSION = 5.15
>   STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>   STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
>   STRACE_LICENSE = LGPL-2.1+
>   STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
>   STRACE_CPE_ID_VENDOR = strace_project
> -# We're patching configure.ac
> -STRACE_AUTORECONF = YES
>   STRACE_CONF_OPTS = --enable-mpers=no
>   
>   ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
