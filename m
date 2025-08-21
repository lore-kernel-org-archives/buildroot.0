Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93105CA0FE2
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D88661C5E;
	Thu, 21 Aug 2025 19:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdKX_h23FQIx; Thu, 21 Aug 2025 19:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC4961C55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC4961C55;
	Thu, 21 Aug 2025 19:21:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9484A1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91E4561B5B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pn4YJurRA5h3 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F9DA61B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F9DA61B65
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F9DA61B65
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1b0c82eeso10707305e9.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804054; x=1756408854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egTQb+cA84c1MG9xc0pXX6muV4Uy5qhvJqx0EFXpSkE=;
 b=AuAfUTVTZaZfz1XLk60HsA4ZP7Y9pvxmhWVIOTb26CUe1p1flDr7F3fLkDqB+QtFlr
 lMtnUQoDblYVu9fgWryD8NawI3ijUtkOxIOPYq5rRBWvAJXXynhHo9cpDQOpLEzrphYn
 EUhCmresRFtpx6xCcnxrb3rf0SkAipLtzLedlmCR1QMT6PyNytB5D/RAyYrPPulbyMRs
 EsUo4PjOaQvfkkq80o+V4IVd4bohySZUXkJqRd01ZvxQFXOa+hawP8fmEXQaMEHmfcyp
 BxlE4/ECqvBb1dj+Toz5JRAEdxbkLD8Yo+qFJ3MSwBrXCaFAIVHMATSUtkRGxR69o10l
 IoHA==
X-Gm-Message-State: AOJu0YwDtC2NSMiYV+RpaGbvL9062aay/lcgvr+8+j8bi+ic866pHKFD
 oU7xKZIDlPxfR63ISibPQjfeltrzIHKxUNQQ8nnjKfTDrMQX36mO+EzMgJQt+ap0OoM=
X-Gm-Gg: ASbGnctRztK5glA7bI5KPbu2q4PHIr5Wf2Vry9CjEMBQ3pbuqWF24W0CKlFJa4tSfkZ
 Mm7fFJIGqaXGOaxm9Iec+V+mO9T6qQCPY1jEWkYZisKltmbUrZy8rgTclQBS5ERGmcBrs7ih15t
 TJz73VDk4X9e45sPwS9ItySPJX9wboaEZmTzHpmewnUTFxsPvefuMerDQ7TYFvSCmJytZPsfEFQ
 UpSvATs6Kg7uAMIPJYTx+bWh6LbKqZJabLE8hcvOjDW3C26vE2NVqFKaMZwX8pBVZ/vDvgIXN6k
 L0TTTLemTMeC8D/vI363NX+2kU206GbQfX2xF2o3YQWzps9bBushNmNMlCDKTUwXLjO4tPEvgnJ
 KZDd83mpI8iTEZw==
X-Google-Smtp-Source: AGHT+IHhVlk767tek0+4Q+okrCy+WEGvvBec+fqQ3H/vf5/CM3MX6O3x319OV4Mg38S68D35HYG26A==
X-Received: by 2002:a05:600c:1c16:b0:456:214f:f78d with SMTP id
 5b1f17b1804b1-45b517c5501mr1692345e9.22.1755804053556; 
 Thu, 21 Aug 2025 12:20:53 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e2fa9csm8465405e9.16.2025.08.21.12.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:53 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:52 +0200
Message-ID: <20250821192052.23881-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812173616.1977078-1-thomas.perale@mind.be>
References: <20250812173616.1977078-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804054; x=1756408854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egTQb+cA84c1MG9xc0pXX6muV4Uy5qhvJqx0EFXpSkE=;
 b=GVwIOj29LZ0RA69ha/At6UZ1PLTbS+GyFgSb3/s9LJULY3SWPij8B7CcCVNWoUQ0JB
 yKvsJCDWNwqQVn1vKKI3Uiz2UTE3QLOb2jNbGUoT0oa+hOK5JDfIW5OoQu3KNtcjJPD0
 fN8BpHKqLrdssnS+ofW9DU1D1u00gWCvrDvDQQioghBKBBBs7fGKGdkDlWQ6BrwL4pTM
 oeo6GZFr0ki53MGCdw/fVhc8T7G/t87ZB2VAyWrAz4X/TNufeSFnU8471dzSXoRd0D8L
 GX8RfaCHf1qBTiz2CClr/kaS+dNqKo0oAFANzs7ydywtC8fhtp06zahhFoJaOPEQdcRc
 Xccw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GVwIOj29
Subject: Re: [Buildroot] [PATCH] package/bcusdk: fix build w/ gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> When using gcc-14 the compilation fails with the following error
> message:
> 
> ```
> close.c: In function 'EIBClose':
> close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>    38 |   close (con->fd);
>       |   ^~~~~
>       |   pclose
> openlocal.c: In function 'EIBSocketLocal':
> openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>    57 |       close (con->fd);
>       |       ^~~~~
>       |       pclose
> make[6]: *** [Makefile:611: close.lo] Error 1
> ```
> 
> This patch include <unistd.h> to include the declaration of close.
> 
> Fixes: https://autobuild.buildroot.org/results/483/483fc4584815507c3798eb972e22e51f70f52c23/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...include-unistd-for-close-declaration.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/bcusdk/0005-include-unistd-for-close-declaration.patch
> 
> diff --git a/package/bcusdk/0005-include-unistd-for-close-declaration.patch b/package/bcusdk/0005-include-unistd-for-close-declaration.patch
> new file mode 100644
> index 0000000000..c05a68d9a3
> --- /dev/null
> +++ b/package/bcusdk/0005-include-unistd-for-close-declaration.patch
> @@ -0,0 +1,70 @@
> +From 7fe256a6e3b28e3ca5c163e38844c9e7c05099c1 Mon Sep 17 00:00:00 2001
> +From: Thomas Perale <thomas.perale@mind.be>
> +Date: Tue, 12 Aug 2025 18:43:26 +0200
> +Subject: [PATCH] include unistd for close declaration
> +
> +When using gcc-14 the compilation fails with the following error
> +message:
> +
> +```
> +close.c: In function 'EIBClose':
> +close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
> +   38 |   close (con->fd);
> +      |   ^~~~~
> +      |   pclose
> +openlocal.c: In function 'EIBSocketLocal':
> +openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
> +   57 |       close (con->fd);
> +      |       ^~~~~
> +      |       pclose
> +make[6]: *** [Makefile:611: close.lo] Error 1
> +```
> +
> +This patch include <unistd.h> to include the declaration of close.
> +
> +Upstream: https://sourceforge.net/p/bcusdk/patches/6/
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + eibd/client/c/close.c      | 1 +
> + eibd/client/c/openlocal.c  | 1 +
> + eibd/client/c/openremote.c | 1 +
> + 3 files changed, 3 insertions(+)
> +
> +diff --git a/eibd/client/c/close.c b/eibd/client/c/close.c
> +index 900fcd8..f7508bb 100644
> +--- a/eibd/client/c/close.c
> ++++ b/eibd/client/c/close.c
> +@@ -24,6 +24,7 @@
> +     along with this program; if not, write to the Free Software
> +     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> ++#include <unistd.h>
> + 
> + #include "eibclient-int.h"
> + 
> +diff --git a/eibd/client/c/openlocal.c b/eibd/client/c/openlocal.c
> +index c7fd5d7..df2e9f9 100644
> +--- a/eibd/client/c/openlocal.c
> ++++ b/eibd/client/c/openlocal.c
> +@@ -27,6 +27,7 @@
> + 
> + #include <sys/socket.h>
> + #include <sys/un.h>
> ++#include <unistd.h>
> + 
> + #include "eibclient-int.h"
> + 
> +diff --git a/eibd/client/c/openremote.c b/eibd/client/c/openremote.c
> +index 24d7ecd..9b2be39 100644
> +--- a/eibd/client/c/openremote.c
> ++++ b/eibd/client/c/openremote.c
> +@@ -30,6 +30,7 @@
> + #include <netinet/in.h>
> + #include <netinet/tcp.h>
> + #include <netdb.h>
> ++#include <unistd.h>
> + 
> + #include "eibclient-int.h"
> + 
> +-- 
> +2.50.1
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
