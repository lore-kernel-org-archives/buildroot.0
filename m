Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E138FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBB660EC0
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DBB660EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F90818A2;
	Fri,  3 Sep 2021 18:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUh5hyB-aoiy; Fri,  3 Sep 2021 18:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 328DF80F7F;
	Fri,  3 Sep 2021 18:59:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 829E81BF2BB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CA8940813
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFJO-GT5-fje for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 18:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2D964070E
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 18:59:05 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i21so54817ejd.2
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNEjP1WsD8QooJ8ygYk8cWFcTUXzfIhKgQw/Ftf/Fo0=;
 b=X0vN3uuKueybaABKtkwKKVpYONHFC1ZtWasrCEIEEEkMrsx2gvvMYraXQ+h2mVElie
 o0I3YFj04U38yimOYcafl1jw8wjOlpXIbrNik9OqEwrm9Zj0cnhAs/g10c1YVXkU5eMV
 jghhfXJkQ3ovphQVnIXf5gF3NBrK/nhCRBX+Lgsiji8pcHWUT4pERfNyCjEcyqEJdT8Q
 5mK1bMg4+6OWCw4BeYmdtzaLgMFoal2fDSfcImExuKuQSYy5+iXnhvFh9j795USEKJv0
 1/DQFl/oVEKww+XZYCkBDw10UgGcYIcwZ9z4XEbKZzrM75fTOQ1KaivdJDpYmGVxd4+j
 8v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dNEjP1WsD8QooJ8ygYk8cWFcTUXzfIhKgQw/Ftf/Fo0=;
 b=IrZIugQdbOZ/4M0jkSrDYiQf08iDWata7z41AdKREWZRuu7huJTGZWmmHVHqr5HbN8
 QKuz1Yr6hSVj4OxuoepAhfjnuQEPvhiEHrhFiN+Pc7CBgHcpUlM1nOpUsA+NlINxMn57
 NaUhFVSDaTQpeF7a8H/RQmnbPpJ3tkio+aUtmErnwFJD6WLnTldIkLprusyiGp5yAsWj
 nGYa1pyw5TXgPYCQb12k7Ak16bDy9MelVwTKrR6COaqf/Vv3cGBRC8daLzQCKq7R/hbb
 aKiMeX29JFSwTDWUcKerVjK+4WZCHAKjOVhcwS3yIRfSzHEjc/6THT/3dgktAkRNJhkJ
 Dw/Q==
X-Gm-Message-State: AOAM5315ii+nd5muO2IAZNIeE7v3ayxDaBVvC/sctOQO4OEgnpvu8W4R
 HvzMpnngRapRegQ1wYLCe/YOTg==
X-Google-Smtp-Source: ABdhPJwf3PmrcHdPQsEdkjqLFvO6tAWX+UoFrAGXEtuwjSyLEwm56tYYXH4o18GnfrIpGLwz8Gqd8g==
X-Received: by 2002:a17:906:d8ce:: with SMTP id
 re14mr349531ejb.364.1630695544096; 
 Fri, 03 Sep 2021 11:59:04 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r22sm9545ejj.91.2021.09.03.11.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:59:03 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210901202912.193241-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <7c89f7b9-f0c5-8a3d-a445-f8d1461fd162@mind.be>
Date: Fri, 3 Sep 2021 20:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901202912.193241-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/wlroots: fix uclibc build
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 01/09/2021 22:29, Fabrice Fontaine wrote:
> Fix the following uclibc build failure raised since at least bump to
> version 0.11.0 in commit 0bc9c89612cc1f41f9a64f6e889f8bcd8a871e30:
> 
> In file included from ../include/wlr/types/wlr_data_device.h:13,
>                  from ../types/data_device/wlr_drag.c:7:
> ../include/wlr/types/wlr_seat.h:221:18: error: field 'last_event' has incomplete type
>   221 |  struct timespec last_event;
>       |                  ^~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3501ceb4290638b2f6d70aaa4d8ce74feec3a525
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...-Add-feature-macros-to-more-C-files-.patch | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
> 
> diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
> new file mode 100644
> index 0000000000..0ba078708a
> --- /dev/null
> +++ b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
> @@ -0,0 +1,174 @@
> +From cf37ba4c0bf31316b698ba23015f91903766871d Mon Sep 17 00:00:00 2001
> +From: Paul Cercueil <paul@crapouillou.net>
> +Date: Thu, 18 Feb 2021 22:31:39 +0000
> +Subject: [PATCH] Add feature macros to more C files
> +
> +These source files use "struct timespec", which is POSIX 1993.09.
> +
> +Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> +
> +[Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + backend/wayland/output.c                  | 1 +
> + types/data_device/wlr_data_device.c       | 1 +
> + types/data_device/wlr_drag.c              | 1 +
> + types/wlr_export_dmabuf_v1.c              | 1 +
> + types/wlr_idle.c                          | 1 +
> + types/wlr_keyboard_shortcuts_inhibit_v1.c | 1 +
> + types/wlr_pointer_constraints_v1.c        | 1 +
> + types/wlr_primary_selection.c             | 1 +
> + types/wlr_relative_pointer_v1.c           | 1 +
> + types/wlr_screencopy_v1.c                 | 1 +
> + types/wlr_virtual_pointer_v1.c            | 1 +
> + types/wlr_xdg_decoration_v1.c             | 1 +
> + types/xdg_shell/wlr_xdg_popup.c           | 1 +
> + types/xdg_shell/wlr_xdg_positioner.c      | 1 +
> + types/xdg_shell/wlr_xdg_shell.c           | 1 +
> + types/xdg_shell/wlr_xdg_surface.c         | 1 +
> + 16 files changed, 16 insertions(+)
> +
> +diff --git a/backend/wayland/output.c b/backend/wayland/output.c
> +index d5410e0d32..8ff8fa2a00 100644
> +--- a/backend/wayland/output.c
> ++++ b/backend/wayland/output.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdint.h>
> + #include <stdio.h>
> +diff --git a/types/data_device/wlr_data_device.c b/types/data_device/wlr_data_device.c
> +index 6cd84ec0ab..beac496124 100644
> +--- a/types/data_device/wlr_data_device.c
> ++++ b/types/data_device/wlr_data_device.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <string.h>
> +diff --git a/types/data_device/wlr_drag.c b/types/data_device/wlr_drag.c
> +index 53bf4066a1..e3c1e249b4 100644
> +--- a/types/data_device/wlr_drag.c
> ++++ b/types/data_device/wlr_drag.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <string.h>
> +diff --git a/types/wlr_export_dmabuf_v1.c b/types/wlr_export_dmabuf_v1.c
> +index a8e2a4bde3..98ceae68f1 100644
> +--- a/types/wlr_export_dmabuf_v1.c
> ++++ b/types/wlr_export_dmabuf_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <unistd.h>
> +diff --git a/types/wlr_idle.c b/types/wlr_idle.c
> +index 4c338931cc..80fd871fab 100644
> +--- a/types/wlr_idle.c
> ++++ b/types/wlr_idle.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <string.h>
> +diff --git a/types/wlr_keyboard_shortcuts_inhibit_v1.c b/types/wlr_keyboard_shortcuts_inhibit_v1.c
> +index fe4e64b04e..8360a9c21c 100644
> +--- a/types/wlr_keyboard_shortcuts_inhibit_v1.c
> ++++ b/types/wlr_keyboard_shortcuts_inhibit_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <util/signal.h>
> +diff --git a/types/wlr_pointer_constraints_v1.c b/types/wlr_pointer_constraints_v1.c
> +index eca45984c4..f1db8e3415 100644
> +--- a/types/wlr_pointer_constraints_v1.c
> ++++ b/types/wlr_pointer_constraints_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <limits.h>
> + #include <pixman.h>
> +diff --git a/types/wlr_primary_selection.c b/types/wlr_primary_selection.c
> +index 0875462c8c..7e0e11ddaa 100644
> +--- a/types/wlr_primary_selection.c
> ++++ b/types/wlr_primary_selection.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <wlr/types/wlr_primary_selection.h>
> +diff --git a/types/wlr_relative_pointer_v1.c b/types/wlr_relative_pointer_v1.c
> +index 8613f2b91c..3f8dd8b72a 100644
> +--- a/types/wlr_relative_pointer_v1.c
> ++++ b/types/wlr_relative_pointer_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <inttypes.h>
> + #include <stdlib.h>
> +diff --git a/types/wlr_screencopy_v1.c b/types/wlr_screencopy_v1.c
> +index 6feb074274..29864c2364 100644
> +--- a/types/wlr_screencopy_v1.c
> ++++ b/types/wlr_screencopy_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <drm_fourcc.h>
> +diff --git a/types/wlr_virtual_pointer_v1.c b/types/wlr_virtual_pointer_v1.c
> +index a9d1fd7bc4..5566e9e013 100644
> +--- a/types/wlr_virtual_pointer_v1.c
> ++++ b/types/wlr_virtual_pointer_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <wlr/types/wlr_seat.h>
> +diff --git a/types/wlr_xdg_decoration_v1.c b/types/wlr_xdg_decoration_v1.c
> +index 544035b7b8..904474c088 100644
> +--- a/types/wlr_xdg_decoration_v1.c
> ++++ b/types/wlr_xdg_decoration_v1.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdbool.h>
> + #include <stdlib.h>
> +diff --git a/types/xdg_shell/wlr_xdg_popup.c b/types/xdg_shell/wlr_xdg_popup.c
> +index 69b4cfe19f..05d6551fc8 100644
> +--- a/types/xdg_shell/wlr_xdg_popup.c
> ++++ b/types/xdg_shell/wlr_xdg_popup.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <string.h>
> +diff --git a/types/xdg_shell/wlr_xdg_positioner.c b/types/xdg_shell/wlr_xdg_positioner.c
> +index f88bf323b8..8881c49916 100644
> +--- a/types/xdg_shell/wlr_xdg_positioner.c
> ++++ b/types/xdg_shell/wlr_xdg_positioner.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include "types/wlr_xdg_shell.h"
> +diff --git a/types/xdg_shell/wlr_xdg_shell.c b/types/xdg_shell/wlr_xdg_shell.c
> +index 0480d5f354..c93fe7c3fb 100644
> +--- a/types/xdg_shell/wlr_xdg_shell.c
> ++++ b/types/xdg_shell/wlr_xdg_shell.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include "types/wlr_xdg_shell.h"
> +diff --git a/types/xdg_shell/wlr_xdg_surface.c b/types/xdg_shell/wlr_xdg_surface.c
> +index edf562abcd..c1dfbfba7e 100644
> +--- a/types/xdg_shell/wlr_xdg_surface.c
> ++++ b/types/xdg_shell/wlr_xdg_surface.c
> +@@ -1,3 +1,4 @@
> ++#define _POSIX_C_SOURCE 199309L
> + #include <assert.h>
> + #include <stdlib.h>
> + #include <string.h>
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
