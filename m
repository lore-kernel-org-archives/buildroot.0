Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C95C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC1983F3C;
	Wed,  2 Apr 2025 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2KNTjRN4pi3; Wed,  2 Apr 2025 17:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE63A82BC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE63A82BC4;
	Wed,  2 Apr 2025 17:09:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CCCB117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE9141C7F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5r5XZb6QBOv for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 17:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.52;
 helo=mail-lf1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1963D419E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1963D419E5
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1963D419E5
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:09:05 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54963160818so50030e87.2
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 10:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743613743; x=1744218543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGd7qI0wXT5/BIrr79maVwBtV/V6ezn+7qwy9vYLtC8=;
 b=rWfQGy5uTdu7epBc4h2q8e2GhJEtqsb8lxyM2wr3KaFKxwirLW7JWAZM6HPpnL11SZ
 uKp3NYKThYE88cJ1Z/hFrqKPw6B0waQLB6IrUJ4KKyXf3IReOM/078GC0VjIBHAByKq6
 6UaS5SasG5rpY6H8sh+VG4lHBs1mXdAW9iSXbD6QgvmbUVEplnwU8ki7SkwTqvDXk6rb
 lw7tjuAsBUUpy/bcutFF5CcSRwKq6garfZnTA3kt5qlczqLVv36KFeuGwMtMl5rN0Sk8
 jWuEo1HqFTcc+jm80zW1hx5FQmV5PocR4DbuiIVEH1D7d8a8t4IZNLNvvNilvrvKCvnK
 MobQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsee/D9BvnsWNURb/xN/Chu90+ba1FPol4t2XNzu4GsNGiXXihC47fm27BkCsWHM8T9VrkXiPNqqQ=@buildroot.org
X-Gm-Message-State: AOJu0YzeB58r0LUwo2EAWcka3aC4pDMxcHkVL4MOPXNhl4RLGs9E0OHx
 zNyi59+XHLvVMKOkOWg5gT/JyjEFysvfFr55HWlqfRb/WjaYPfgceWNdujYR
X-Gm-Gg: ASbGnctiCt1B7W9h19N18x8pY9EwI57vrKZGfo9lrHSYmFgcDsd/jUZAYYlu3N6iOL+
 eJfJ1zcnm/cVcqhvvHK01P2eQJ8Q5Jh3XcpNN7mp5OZ4lUIV5PBbbPf5FS84dtcjkxLPEofsDF+
 ctmxI8b0IjReT4sJL5azlo+3pi+GnvOcPcHjMqM5QSNwvkeLfwJzROyqbtTbBRQ/2ZbFqWcdhRU
 kO3qmPnZ+rpXGSEETgf8dH7a3HCFf2YWKwXL16LVAgj0WoTe6gXUKd2rsDDigJTDU63NEPxPFCY
 DqTwZiQonsYGpcwSi+1Z1VrIDqKCWV34lm2IFO7HqVeAm0IBdrftyGSkZUabmYZUWSdnRV+7Qid
 Gt/dzzzFhig==
X-Google-Smtp-Source: AGHT+IHsTLNNOAAK8761h0qi7g8craJsBCn+/hCQNdHn6xj0brUvRS+/4tWWjW9EAe93znixWNq2Uw==
X-Received: by 2002:a05:6512:15a9:b0:549:5a9c:93a9 with SMTP id
 2adb3069b0e04-54b1115ff9bmr5753515e87.51.1743613742506; 
 Wed, 02 Apr 2025 10:09:02 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a17a0sm1675926e87.238.2025.04.02.10.09.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 10:09:02 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30ddad694c1so49671181fa.2
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 10:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrTqI0wxGWo7fEMEZVz/npkiMsnQwmJMoeISZCvoK4qmoePLCp/n98CfIXXczW4lQeshwaxEmzhS8=@buildroot.org
X-Received: by 2002:a05:651c:1581:b0:30d:b328:8394 with SMTP id
 38308e7fff4ca-30de024b76dmr57626861fa.13.1743613741791; Wed, 02 Apr 2025
 10:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <Z-QAExADR8rp0Afq@waldemar-brodkorb.de>
 <20250402082625.599501-1-thomas@devoogdt.com>
 <Z-0auN0f7ln-1IJH@waldemar-brodkorb.de>
In-Reply-To: <Z-0auN0f7ln-1IJH@waldemar-brodkorb.de>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 2 Apr 2025 19:08:49 +0200
X-Gmail-Original-Message-ID: <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
X-Gm-Features: ATxdqUHDctOGjtn3NY7A0h80JiPOHNtNHQ-AlwavWxqJgY8ZVZWR7MdZH3xjmZ4
Message-ID: <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, 
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump to 2.41
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
Content-Type: multipart/mixed; boundary="===============8344015719655935460=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8344015719655935460==
Content-Type: multipart/alternative; boundary="000000000000b48a0b0631ceb5f2"

--000000000000b48a0b0631ceb5f2
Content-Type: text/plain; charset="UTF-8"

Hi Waldemar,


What exact defconfig are you using?

I just ran this:
$ cat util-linux.config
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=y
BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT=y
$ ./utils/test-pkg -p util-linux -c util-linux.config -a

No failing test, and multiple uclibc toolchains were tested alongside.


Kr,

Thomas Devoogdt


Op wo 2 apr 2025 om 13:08 schreef Waldemar Brodkorb <wbx@openadk.org>:

>
> Hi Thomas,
>
> my problem with mount still exist. Could you reproduce it?
> I just use defconfig for mips64, change to uclibc-ng and
> then add util-linux mount.
>
> best regards
>  Waldemar
>
> Thomas Devoogdt wrote,
>
> > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> >
> > News:
https://lore.kernel.org/util-linux/2cifsg7vkdiivfsmmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/
> >
> > Dropped patches which are all upstream.
> > - https://github.com/util-linux/util-linux/pull/3049
> > - https://github.com/util-linux/util-linux/pull/3383
> >
> > Added some new patches. (which are also upstream)
> > - https://github.com/util-linux/util-linux/pull/3471
> > - https://github.com/util-linux/util-linux/pull/3484
> >
> > Synced all license files.
> >
> > Dropped the AUTORECONF call, since
> > 0001-libmount-ifdef-statx-call.patch is upstream.
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> > v2:
> >  - dropped AUTORECONF
> >  - added two compile patches
> > ---
> >  .../0001-misc-never-include-wchar.h.patch     | 160 ++++++++++++++++++
> >  ...ch.c-fix-build-with-uclibc-ng-1.0.39.patch |  39 -----
> >  .../0002-c.h-consolidate-THREAD_LOCAL.patch   |  65 -------
> >  ...ed-reference-to-add_namespace_for_ns.patch |  59 +++++++
> >  ...ine-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch |  47 -----
> >  .../0004-meson-add-HAVE_LIBPTHREAD.patch      |  27 ---
> >  ...non-cached-scenarios-when-lpthread-i.patch |  82 ---------
> >  package/util-linux/util-linux.hash            |  10 +-
> >  package/util-linux/util-linux.mk              |  11 +-
> >  9 files changed, 232 insertions(+), 268 deletions(-)
> >  create mode 100644
package/util-linux/0001-misc-never-include-wchar.h.patch
> >  delete mode 100644
package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
> >  delete mode 100644
package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
> >  create mode 100644
package/util-linux/0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
> >  delete mode 100644
package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
> >  delete mode 100644
package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
> >  delete mode 100644
package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
> >
> > diff --git a/package/util-linux/0001-misc-never-include-wchar.h.patch
b/package/util-linux/0001-misc-never-include-wchar.h.patch
> > new file mode 100644
> > index 0000000000..3adfaa2261
> > --- /dev/null
> > +++ b/package/util-linux/0001-misc-never-include-wchar.h.patch
> > @@ -0,0 +1,160 @@
> > +From e8205294e329f50bdf465d8cdd15653fd42ec5c0 Mon Sep 17 00:00:00 2001
> > +From: Karel Zak <kzak@redhat.com>
> > +Date: Thu, 20 Mar 2025 11:57:06 +0100
> > +Subject: [PATCH] misc: never include wchar.h
> > +
> > +We have a portable "widechar.h" that follows --disable-widechar and
> > +provides portability. It is a bug to directly include libc's wchar.h
> > +or wctype.h.
> > +
> > +Fixes: https://github.com/util-linux/util-linux/issues/3470
> > +Signed-off-by: Karel Zak <kzak@redhat.com>
> > +(cherry picked from commit 5c0888dde3cc296d06b8243dcc78248ff90526e5)
> > +Upstream: https://github.com/util-linux/util-linux/pull/3471
> > +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > +---
> > + disk-utils/cfdisk.c          | 6 +-----
> > + include/carefulputc.h        | 5 +----
> > + include/fgetwc_or_err.h      | 6 +-----
> > + lib/idcache.c                | 2 +-
> > + sys-utils/irqtop.c           | 7 ++-----
> > + sys-utils/lsns.c             | 2 +-
> > + tests/helpers/test_sysinfo.c | 2 +-
> > + 7 files changed, 8 insertions(+), 22 deletions(-)
> > +
> > +diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
> > +index 4018f4d3d..d4057eedb 100644
> > +--- a/disk-utils/cfdisk.c
> > ++++ b/disk-utils/cfdisk.c
> > +@@ -52,14 +52,10 @@
> > + # include <ncurses/ncurses.h>
> > + #endif
> > +
> > +-#ifdef HAVE_WIDECHAR
> > +-# include <wctype.h>
> > +-# include <wchar.h>
> > +-#endif
> > +-
> > + #include "c.h"
> > + #include "closestream.h"
> > + #include "nls.h"
> > ++#include "widechar.h"
> > + #include "strutils.h"
> > + #include "xalloc.h"
> > + #include "mbsalign.h"
> > +diff --git a/include/carefulputc.h b/include/carefulputc.h
> > +index 3cc6f7ff9..c6b778bba 100644
> > +--- a/include/carefulputc.h
> > ++++ b/include/carefulputc.h
> > +@@ -4,12 +4,9 @@
> > + #include <stdio.h>
> > + #include <string.h>
> > + #include <ctype.h>
> > +-#ifdef HAVE_WIDECHAR
> > +-#include <wctype.h>
> > +-#include <wchar.h>
> > +-#endif
> > + #include <stdbool.h>
> > +
> > ++#include "widechar.h"
> > + #include "cctype.h"
> > +
> > + /*
> > +diff --git a/include/fgetwc_or_err.h b/include/fgetwc_or_err.h
> > +index 3cf926283..f6ba71c6b 100644
> > +--- a/include/fgetwc_or_err.h
> > ++++ b/include/fgetwc_or_err.h
> > +@@ -1,13 +1,9 @@
> > + #ifndef UTIL_LINUX_FGETWC_OR_ERR_H
> > + #define UTIL_LINUX_FGETWC_OR_ERR_H
> > +
> > +-#include <stdio.h>
> > +-#include <wchar.h>
> > +-#include <errno.h>
> > +-
> > +-#include "widechar.h"
> > + #include "c.h"
> > + #include "nls.h"
> > ++#include "widechar.h"
> > +
> > + static inline wint_t fgetwc_or_err(FILE *stream) {
> > +     wint_t ret;
> > +diff --git a/lib/idcache.c b/lib/idcache.c
> > +index fa77e7b07..7bae76823 100644
> > +--- a/lib/idcache.c
> > ++++ b/lib/idcache.c
> > +@@ -4,12 +4,12 @@
> > +  *
> > +  * Written by Karel Zak <kzak@redhat.com>
> > +  */
> > +-#include <wchar.h>
> > + #include <pwd.h>
> > + #include <grp.h>
> > + #include <sys/types.h>
> > +
> > + #include "c.h"
> > ++#include "widechar.h"
> > + #include "idcache.h"
> > +
> > + struct identry *get_id(struct idcache *ic, unsigned long int id)
> > +diff --git a/sys-utils/irqtop.c b/sys-utils/irqtop.c
> > +index ce6a2ca5b..f05bf6bef 100644
> > +--- a/sys-utils/irqtop.c
> > ++++ b/sys-utils/irqtop.c
> > +@@ -43,13 +43,10 @@
> > + # include <ncurses/ncurses.h>
> > + #endif
> > +
> > +-#ifdef HAVE_WIDECHAR
> > +-# include <wctype.h>
> > +-# include <wchar.h>
> > +-#endif
> > +-
> > + #include <libsmartcols.h>
> > +
> > ++#include "c.h"
> > ++#include "widechar.h"
> > + #include "closestream.h"
> > + #include "cpuset.h"
> > + #include "monotonic.h"
> > +diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c
> > +index 6b2dcba96..2b613cf71 100644
> > +--- a/sys-utils/lsns.c
> > ++++ b/sys-utils/lsns.c
> > +@@ -19,7 +19,6 @@
> > + #include <unistd.h>
> > + #include <sys/stat.h>
> > + #include <sys/types.h>
> > +-#include <wchar.h>
> > + #include <libsmartcols.h>
> > + #include <libmount.h>
> > + # include <stdbool.h>
> > +@@ -43,6 +42,7 @@
> > + #include "nls.h"
> > + #include "xalloc.h"
> > + #include "c.h"
> > ++#include "widechar.h"
> > + #include "list.h"
> > + #include "closestream.h"
> > + #include "optutils.h"
> > +diff --git a/tests/helpers/test_sysinfo.c
b/tests/helpers/test_sysinfo.c
> > +index 1559d471f..95f50f3f6 100644
> > +--- a/tests/helpers/test_sysinfo.c
> > ++++ b/tests/helpers/test_sysinfo.c
> > +@@ -23,12 +23,12 @@
> > + #include <limits.h>
> > + #include <stdint.h>
> > + #include <inttypes.h>
> > +-#include <wchar.h>
> > + #include <errno.h>
> > + #include <time.h>
> > + #include <sys/ioctl.h>
> > +
> > + #include "c.h"
> > ++#include "widechar.h"
> > +
> > + #ifdef __linux__
> > + # include <sys/mount.h>
> > +--
> > +2.43.0
> > +
> > diff --git
a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
> > deleted file mode 100644
> > index 12dd119ef3..0000000000
> > ---
a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From beef18da4de87ca5aaadf2beb14187f35cc4f50f Mon Sep 17 00:00:00 2001
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Date: Wed, 15 May 2024 18:22:11 +0200
> > -Subject: [PATCH] sys-utils/setarch.c: fix build with uclibc-ng < 1.0.39
> > -
> > -Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
> > -
https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6
)
> > -raised since version 2.39 and
> > -
https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4
:
> > -
> > -sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here
(not in a function); did you mean 'PER_LINUX32'?
> > -  106 |     X(PER_LINUX32_3GB) \
> > -      |       ^~~~~~~~~~~~~~~
> > -
> > -Fixes:
> > - -
http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175
> > -
> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Upstream:
https://github.com/util-linux/util-linux/commit/4647fc6afbf7e99c49531600425df60f1243fcd2
> > ----
> > - sys-utils/setarch.c | 5 +++++
> > - 1 file changed, 5 insertions(+)
> > -
> > -diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c
> > -index 227bc6b5de..4bcb5e69e6 100644
> > ---- a/sys-utils/setarch.c
> > -+++ b/sys-utils/setarch.c
> > -@@ -89,6 +89,11 @@
> > - # define PER_LINUX_FDPIC    (PER_LINUX | FDPIC_FUNCPTRS)
> > - #endif
> > -
> > -+/* fallback for old uclibc-headers < 1.0.39 */
> > -+#ifndef PER_LINUX32_3GB
> > -+# define PER_LINUX32_3GB    (PER_LINUX32 | ADDR_LIMIT_3GB)
> > -+#endif
> > -+
> > - #define ALL_PERSONALITIES \
> > -     X(PER_LINUX) \
> > -     X(PER_LINUX_32BIT) \
> > diff --git a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
b/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
> > deleted file mode 100644
> > index bb1a63ecc2..0000000000
> > --- a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
> > +++ /dev/null
> > @@ -1,65 +0,0 @@
> > -From 7b3db914fa9073c667ea482c8b6b4e07fe6202cc Mon Sep 17 00:00:00 2001
> > -From: Karel Zak <kzak@redhat.com>
> > -Date: Mon, 27 Jan 2025 13:40:23 +0100
> > -Subject: [PATCH] c.h: consolidate THREAD_LOCAL.
> > -
> > -Let's define this macro in one place only.
> > -
> > -Upstream: https://github.com/util-linux/util-linux/pull/3383
> > -Signed-off-by: Karel Zak <kzak@redhat.com>
> > -Signed-off-by: Julien Olivain <ju.o@free.fr>
> > ----
> > - include/c.h            | 9 +++++++++
> > - lib/randutils.c        | 5 -----
> > - libuuid/src/gen_uuid.c | 1 -
> > - 3 files changed, 9 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/include/c.h b/include/c.h
> > -index 61b95ab2d..848c48536 100644
> > ---- a/include/c.h
> > -+++ b/include/c.h
> > -@@ -595,4 +595,13 @@ static inline void *reallocarray(void *ptr,
size_t nmemb, size_t size)
> > - }
> > - #endif
> > -
> > -+/*
> > -+ * thread-local storage
> > -+ */
> > -+#ifdef HAVE_TLS
> > -+# define THREAD_LOCAL static __thread
> > -+#else
> > -+# define THREAD_LOCAL static
> > -+#endif
> > -+
> > - #endif /* UTIL_LINUX_C_H */
> > -diff --git a/lib/randutils.c b/lib/randutils.c
> > -index 15c2f7834..4c806e682 100644
> > ---- a/lib/randutils.c
> > -+++ b/lib/randutils.c
> > -@@ -20,11 +20,6 @@
> > - #include "randutils.h"
> > - #include "nls.h"
> > -
> > --#ifdef HAVE_TLS
> > --#define THREAD_LOCAL static __thread
> > --#else
> > --#define THREAD_LOCAL static
> > --#endif
> > -
> > - #ifdef HAVE_GETRANDOM
> > - # include <sys/random.h>
> > -diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
> > -index 3b76ddc9a..69712267f 100644
> > ---- a/libuuid/src/gen_uuid.c
> > -+++ b/libuuid/src/gen_uuid.c
> > -@@ -92,7 +92,6 @@
> > - #include "md5.h"
> > - #include "sha1.h"
> > -
> > --#define THREAD_LOCAL static __thread
> > -
> > - #ifdef _WIN32
> > - static void gettimeofday (struct timeval *tv, void *dummy)
> > ---
> > -2.48.1
> > -
> > diff --git
a/package/util-linux/0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
b/package/util-linux/0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
> > new file mode 100644
> > index 0000000000..5a53aed8ff
> > --- /dev/null
> > +++
b/package/util-linux/0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
> > @@ -0,0 +1,59 @@
> > +From 300a66c30c3d0fb04c0f24cf23fde80e1e3bf5e4 Mon Sep 17 00:00:00 2001
> > +From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > +Date: Tue, 25 Mar 2025 11:58:18 +0100
> > +Subject: [PATCH] lsns: fix undefined reference to
add_namespace_for_nsfd #3483
> > +
> > +Fixes:
> > +
> > +sys-utils/lsns-lsns.o: In function `read_process':
> > +lsns.c:(.text+0x9e8): undefined reference to `add_namespace_for_nsfd'
> > +collect2: error: ld returned 1 exit status
> > +
> > +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > +(cherry picked from commit 2ced43400f35f7bd45b29364e04166a63a06e16a)
> > +Upstream: https://github.com/util-linux/util-linux/pull/3484
> > +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > +---
> > + sys-utils/lsns.c | 6 ++++++
> > + 1 file changed, 6 insertions(+)
> > +
> > +diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c
> > +index 2b613cf71..4c49a8b2d 100644
> > +--- a/sys-utils/lsns.c
> > ++++ b/sys-utils/lsns.c
> > +@@ -587,7 +587,10 @@ static void add_namespace_from_sock(struct lsns
*ls, pid_t pid, uint64_t fd)
> > +     if (get_namespace(ls, sb.st_ino))
> > +             goto out_nsfd;
> > +
> > ++#ifdef USE_NS_GET_API
> > +     add_namespace_for_nsfd(ls, nsfd, sb.st_ino);
> > ++#endif
> > ++
> > + out_nsfd:
> > +     close(nsfd);
> > + out_sk:
> > +@@ -608,6 +611,7 @@ static void add_namespace_from_sock(struct lsns
*ls __attribute__((__unused__)),
> > + {
> > + }
> > + #endif /* HAVE_LINUX_NET_NAMESPACE_H */
> > ++
> > + /* Read namespaces open(2)ed explicitly by the process specified by
`pc'. */
> > + static void read_opened_namespaces(struct lsns *ls, struct path_cxt
*pc, pid_t pid)
> > + {
> > +@@ -627,11 +631,13 @@ static void read_opened_namespaces(struct lsns
*ls, struct path_cxt *pc, pid_t p
> > +             if (st.st_dev == ls->nsfs_dev) {
> > +                     if (get_namespace(ls, st.st_ino))
> > +                             continue;
> > ++#ifdef USE_NS_GET_API
> > +                     int fd = ul_path_openf(pc, O_RDONLY, "fd/%ju",
(uintmax_t) num);
> > +                     if (fd >= 0) {
> > +                             add_namespace_for_nsfd(ls, fd, st.st_ino);
> > +                             close(fd);
> > +                     }
> > ++#endif
> > +             } else if ((st.st_mode & S_IFMT) == S_IFSOCK) {
> > +                     add_namespace_from_sock(ls, pid, num);
> > +             }
> > +--
> > +2.43.0
> > +
> > diff --git
a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
b/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
> > deleted file mode 100644
> > index 843253a56a..0000000000
> > ---
a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -From 0735eb8bc0ed4bc9820ea7e4e600fed246457b18 Mon Sep 17 00:00:00 2001
> > -From: Karel Zak <kzak@redhat.com>
> > -Date: Mon, 27 Jan 2025 14:01:38 +0100
> > -Subject: [PATCH] autotools: define HAVE_LIBPTHREAD and PTHREAD_LIBS
> > -
> > -Upstream: https://github.com/util-linux/util-linux/pull/3383
> > -Signed-off-by: Karel Zak <kzak@redhat.com>
> > -Signed-off-by: Julien Olivain <ju.o@free.fr>
> > ----
> > - configure.ac              | 7 +++++++
> > - libuuid/src/Makemodule.am | 2 +-
> > - 2 files changed, 8 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 82d0e4bf9..9a7f260c5 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -738,6 +738,13 @@ AS_IF([test x"$have_timer" = xno], [
> > - ])
> > -
> > -
> > -+AC_CHECK_LIB([pthread], [pthread_atfork], [
> > -+    PTHREAD_LIBS="-lpthread"
> > -+    AC_DEFINE([HAVE_LIBPTHREAD], [1], [Define if libpthred exist])
> > -+])
> > -+AC_SUBST([PTHREAD_LIBS])
> > -+
> > -+
> > - AC_CHECK_LIB([rtas], [rtas_get_sysparm], [
> > -     RTAS_LIBS="-lrtas"
> > -     AC_DEFINE([HAVE_LIBRTAS], [1], [Define if librtas exists])
> > -diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.am
> > -index 867ad7be5..58b64fe9b 100644
> > ---- a/libuuid/src/Makemodule.am
> > -+++ b/libuuid/src/Makemodule.am
> > -@@ -31,7 +31,7 @@ libuuid_la_SOURCES = \
> > - EXTRA_libuuid_la_DEPENDENCIES = \
> > -     libuuid/src/libuuid.sym
> > -
> > --libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) -lpthread
> > -+libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) $(PTHREAD_LIBS)
> > -
> > - libuuid_la_CFLAGS = \
> > -     $(AM_CFLAGS) \
> > ---
> > -2.48.1
> > -
> > diff --git a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
b/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
> > deleted file mode 100644
> > index 19e0697769..0000000000
> > --- a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -From f540cc6fed7224fb9ca162cb2f33c338260ae1d2 Mon Sep 17 00:00:00 2001
> > -From: Karel Zak <kzak@redhat.com>
> > -Date: Mon, 27 Jan 2025 14:11:35 +0100
> > -Subject: [PATCH] meson: add HAVE_LIBPTHREAD
> > -
> > -Upstream: https://github.com/util-linux/util-linux/pull/3383
> > -Signed-off-by: Karel Zak <kzak@redhat.com>
> > -Signed-off-by: Julien Olivain <ju.o@free.fr>
> > ----
> > - meson.build | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/meson.build b/meson.build
> > -index 6d1f986af..ac5fdd799 100644
> > ---- a/meson.build
> > -+++ b/meson.build
> > -@@ -748,6 +748,7 @@ endif
> > - conf.set('HAVE_CLOCK_GETTIME', have ? 1 : false)
> > -
> > - thread_libs = dependency('threads')
> > -+conf.set('HAVE_LIBPTHREAD', thread_libs.found() ? 1 : false)
> > -
> > - have = cc.has_function('timer_create')
> > - if not have
> > ---
> > -2.48.1
> > -
> > diff --git
a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
b/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
> > deleted file mode 100644
> > index 0d90f8aec9..0000000000
> > ---
a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
> > +++ /dev/null
> > @@ -1,82 +0,0 @@
> > -From eecaa2c0dda817eba2d493f6ddb42c39cf789fc2 Mon Sep 17 00:00:00 2001
> > -From: Karel Zak <kzak@redhat.com>
> > -Date: Mon, 27 Jan 2025 14:28:36 +0100
> > -Subject: [PATCH] libuuid: support non-cached scenarios (when -lpthread
is
> > - unavailable)
> > -
> > -This patch makes the dependence on pthread optional for libuuid. In
> > -certain cases, such as Buildroot Linux, uClibc-ng, and very low
> > -resource systems, libpthread may be unavailable.
> > -
> > -If libuuid is compiled without pthread, it will not use a local cache
> > -and will instead request a UUID from uuidd for each call. This may
> > -result in less efficient performance, but the UUIDs generated will
> > -still be unique and reliable.
> > -
> > -On minimalistic systems, it is highly likely that uuidd will not be
> > -installed, making this change important for portability and robust
> > -code.
> > -
> > -Upstream: https://github.com/util-linux/util-linux/pull/3383
> > -Addresses: https://github.com/util-linux/util-linux/pull/3375
> > -Signed-off-by: Karel Zak <kzak@redhat.com>
> > -Signed-off-by: Julien Olivain <ju.o@free.fr>
> > ----
> > - libuuid/src/gen_uuid.c | 18 +++++++++++++++---
> > - 1 file changed, 15 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
> > -index 69712267f..1ed82b46b 100644
> > ---- a/libuuid/src/gen_uuid.c
> > -+++ b/libuuid/src/gen_uuid.c
> > -@@ -80,7 +80,10 @@
> > - #if defined(__linux__) && defined(HAVE_SYS_SYSCALL_H)
> > - #include <sys/syscall.h>
> > - #endif
> > --#include <pthread.h>
> > -+#ifdef HAVE_LIBPTHREAD
> > -+# include <pthread.h>
> > -+#endif
> > -+
> > - #include <signal.h>
> > -
> > - #include "all-io.h"
> > -@@ -580,8 +583,7 @@ int __uuid_generate_time_cont(uuid_t out, int
*num, uint32_t cont_offset)
> > -  * If neither of these is possible (e.g. because of insufficient
permissions), it generates
> > -  * the UUID anyway, but returns -1. Otherwise, returns 0.
> > -  */
> > --
> > --/* thread local cache for uuidd based requests */
> > -+#ifdef HAVE_LIBPTHREAD
> > - THREAD_LOCAL struct {
> > -     int             num;
> > -     int             cache_size;
> > -@@ -597,8 +599,10 @@ static void reset_uuidd_cache(void)
> > -     memset(&uuidd_cache, 0, sizeof(uuidd_cache));
> > -     uuidd_cache.cache_size = CS_MIN;
> > - }
> > -+#endif /* HAVE_LIBPTHREAD */
> > -
> > - static int uuid_generate_time_generic(uuid_t out) {
> > -+#ifdef HAVE_LIBPTHREAD
> > -     static volatile sig_atomic_t atfork_registered;
> > -     time_t  now;
> > -
> > -@@ -651,6 +655,14 @@ static int uuid_generate_time_generic(uuid_t out)
{
> > -             return 0;
> > -     }
> > -
> > -+#else /* !HAVE_LIBPTHREAD */
> > -+    {
> > -+            int num = 1;
> > -+            if (get_uuid_via_daemon(UUIDD_OP_TIME_UUID, out, &num) ==
0)
> > -+                    return 0;
> > -+    }
> > -+#endif /* HAVE_LIBPTHREAD */
> > -+
> > -     return __uuid_generate_time(out, NULL);
> > - }
> > -
> > ---
> > -2.48.1
> > -
> > diff --git a/package/util-linux/util-linux.hash
b/package/util-linux/util-linux.hash
> > index 317efebcbf..e74aa17c94 100644
> > --- a/package/util-linux/util-linux.hash
> > +++ b/package/util-linux/util-linux.hash
> > @@ -1,10 +1,14 @@
> > -# From
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
> > -sha256
d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3
util-linux-2.40.2.tar.xz
> > +# From
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
> > +sha256
81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6
util-linux-2.41.tar.xz
> >  # License files, locally calculated
> > -sha256
27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7e0960d1b35164
README.licensing
> > +sha256
4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3
README.licensing
> > +sha256
527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1
Documentation/licenses/COPYING.BSD-2-Clause
> >  sha256
9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d
Documentation/licenses/COPYING.BSD-3-Clause
> >  sha256
ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8
Documentation/licenses/COPYING.BSD-4-Clause-UC
> > +sha256
6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665
Documentation/licenses/COPYING.EUPL-1.2
> > +sha256
8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
Documentation/licenses/COPYING.GPL-2.0-only
> >  sha256
8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
Documentation/licenses/COPYING.GPL-2.0-or-later
> > +sha256
3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986
Documentation/licenses/COPYING.GPL-3.0-or-later
> >  sha256
e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63
Documentation/licenses/COPYING.ISC
> >  sha256
dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
Documentation/licenses/COPYING.LGPL-2.1-or-later
> >  sha256
8555341619542abb48c102afd954e42d4478e5be16ad3d5af7b0ff71009e7348
Documentation/licenses/COPYING.MIT
> > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/
util-linux.mk
> > index ed30c0b107..71e458ccc4 100644
> > --- a/package/util-linux/util-linux.mk
> > +++ b/package/util-linux/util-linux.mk
> > @@ -7,8 +7,8 @@
> >  # When making changes to this file, please check if
> >  # util-linux-libs/util-linux-libs.mk needs to be updated accordingly
as well.
> >
> > -UTIL_LINUX_VERSION_MAJOR = 2.40
> > -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
> > +UTIL_LINUX_VERSION_MAJOR = 2.41
> > +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
> >  UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
> >  UTIL_LINUX_SITE =
$(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
> >
> > @@ -24,18 +24,19 @@ UTIL_LINUX_LICENSE = \
> >       ISC (rfkill) \
> >       MIT (hardlink, flock)
> >  UTIL_LINUX_LICENSE_FILES = README.licensing \
> > +     Documentation/licenses/COPYING.BSD-2-Clause \
> >       Documentation/licenses/COPYING.BSD-3-Clause \
> >       Documentation/licenses/COPYING.BSD-4-Clause-UC \
> > +     Documentation/licenses/COPYING.EUPL-1.2 \
> > +     Documentation/licenses/COPYING.GPL-2.0-only \
> >       Documentation/licenses/COPYING.GPL-2.0-or-later \
> > +     Documentation/licenses/COPYING.GPL-3.0-or-later \
> >       Documentation/licenses/COPYING.ISC \
> >       Documentation/licenses/COPYING.LGPL-2.1-or-later \
> >       Documentation/licenses/COPYING.MIT
> >
> >  UTIL_LINUX_CPE_ID_VENDOR = kernel
> >
> > -# 0001-libmount-ifdef-statx-call.patch
> > -UTIL_LINUX_AUTORECONF = YES
> > -
> >  UTIL_LINUX_INSTALL_STAGING = YES
> >  UTIL_LINUX_DEPENDENCIES = \
> >       host-pkgconf \
> > --
> > 2.43.0
> >
>

--000000000000b48a0b0631ceb5f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Waldemar,<br>
<br><br>
What exact defconfig are you using?<br>
<br>
I just ran this:<br>
$ cat util-linux.config<br>
BR2_PACKAGE_UTIL_LINUX=3Dy<br>
BR2_PACKAGE_UTIL_LINUX_MOUNT=3Dy<br>
BR2_PACKAGE_UTIL_LINUX_LIBMOUNT=3Dy<br>
BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT=3Dy<br>
$ ./utils/test-pkg -p util-linux -c util-linux.config -a<br>
<br>
No failing test, and multiple uclibc toolchains were tested alongside.<div =
dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thomas Devoogdt=C2=
=A0<br>
<br>
<br>
Op wo 2 apr 2025 om 13:08 schreef Waldemar Brodkorb &lt;<a href=3D"mailto:w=
bx@openadk.org" target=3D"_blank" rel=3D"noreferrer">wbx@openadk.org</a>&gt=
;:</div></div><br>
&gt;<br>
&gt; Hi Thomas,<br>
&gt;<br>
&gt; my problem with mount still exist. Could you reproduce it?<br>
&gt; I just use defconfig for mips64, change to uclibc-ng and<br>
&gt; then add util-linux mount.<br>
&gt;<br>
&gt; best regards<br>
&gt;=C2=A0 Waldemar<br>
&gt;<br>
&gt; Thomas Devoogdt wrote,<br>
&gt;<br>
&gt; &gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barco=
.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a>&gt=
;<br>
&gt; &gt;<br>
&gt; &gt; News: <a href=3D"https://lore.kernel.org/util-linux/2cifsg7vkdiiv=
fsmmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://lore.kernel.org/util-linux/2cifsg7vkdiivf=
smmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/</a><br>
&gt; &gt;<br>
&gt; &gt; Dropped patches which are all upstream.<br>
&gt; &gt; - <a href=3D"https://github.com/util-linux/util-linux/pull/3049" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/util-lin=
ux/util-linux/pull/3049</a><br>
&gt; &gt; - <a href=3D"https://github.com/util-linux/util-linux/pull/3383" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/util-lin=
ux/util-linux/pull/3383</a><br>
&gt; &gt;<br>
&gt; &gt; Added some new patches. (which are also upstream)<br>
&gt; &gt; - <a href=3D"https://github.com/util-linux/util-linux/pull/3471" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/util-lin=
ux/util-linux/pull/3471</a><br>
&gt; &gt; - <a href=3D"https://github.com/util-linux/util-linux/pull/3484" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/util-lin=
ux/util-linux/pull/3484</a><br>
&gt; &gt;<br>
&gt; &gt; Synced all license files.<br>
&gt; &gt;<br>
&gt; &gt; Dropped the AUTORECONF call, since<br>
&gt; &gt; 0001-libmount-ifdef-statx-call.patch is upstream.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoo=
gdt@barco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.c=
om</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2:<br>
&gt; &gt;=C2=A0 - dropped AUTORECONF<br>
&gt; &gt;=C2=A0 - added two compile patches<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../0001-misc-never-include-wchar.h.patch=C2=A0 =C2=A0 =C2=
=A0| 160 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 ...ch.c-fix-build-with-uclibc-ng-1.0.39.patch |=C2=A0 39 --=
---<br>
&gt; &gt;=C2=A0 .../0002-c.h-consolidate-THREAD_LOCAL.patch=C2=A0 =C2=A0|=
=C2=A0 65 -------<br>
&gt; &gt;=C2=A0 ...ed-reference-to-add_namespace_for_ns.patch |=C2=A0 59 ++=
+++++<br>
&gt; &gt;=C2=A0 ...ine-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch |=C2=A0 47 --=
---<br>
&gt; &gt;=C2=A0 .../0004-meson-add-HAVE_LIBPTHREAD.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 27 ---<br>
&gt; &gt;=C2=A0 ...non-cached-scenarios-when-lpthread-i.patch |=C2=A0 82 --=
-------<br>
&gt; &gt;=C2=A0 package/util-linux/util-linux.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
&gt; &gt;=C2=A0 package/util-linux/<a href=3D"http://util-linux.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">util-linux.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
&gt; &gt;=C2=A0 9 files changed, 232 insertions(+), 268 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 package/util-linux/0001-misc-never-inclu=
de-wchar.h.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 package/util-linux/0001-sys-utils-setarc=
h.c-fix-build-with-uclibc-ng-1.0.39.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 package/util-linux/0002-c.h-consolidate-=
THREAD_LOCAL.patch<br>
&gt; &gt;=C2=A0 create mode 100644 package/util-linux/0002-lsns-fix-undefin=
ed-reference-to-add_namespace_for_ns.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 package/util-linux/0003-autotools-define=
-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 package/util-linux/0004-meson-add-HAVE_L=
IBPTHREAD.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 package/util-linux/0005-libuuid-support-=
non-cached-scenarios-when-lpthread-i.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/util-linux/0001-misc-never-include-wchar.h.p=
atch b/package/util-linux/0001-misc-never-include-wchar.h.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..3adfaa2261<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/util-linux/0001-misc-never-include-wchar.h.patch<br=
>
&gt; &gt; @@ -0,0 +1,160 @@<br>
&gt; &gt; +From e8205294e329f50bdf465d8cdd15653fd42ec5c0 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; +Date: Thu, 20 Mar 2025 11:57:06 +0100<br>
&gt; &gt; +Subject: [PATCH] misc: never include wchar.h<br>
&gt; &gt; +<br>
&gt; &gt; +We have a portable &quot;widechar.h&quot; that follows --disable=
-widechar and<br>
&gt; &gt; +provides portability. It is a bug to directly include libc&#39;s=
 wchar.h<br>
&gt; &gt; +or wctype.h.<br>
&gt; &gt; +<br>
&gt; &gt; +Fixes: <a href=3D"https://github.com/util-linux/util-linux/issue=
s/3470" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
util-linux/util-linux/issues/3470</a><br>
&gt; &gt; +Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; +(cherry picked from commit 5c0888dde3cc296d06b8243dcc78248ff9052=
6e5)<br>
&gt; &gt; +Upstream: <a href=3D"https://github.com/util-linux/util-linux/pu=
ll/3471" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/util-linux/util-linux/pull/3471</a><br>
&gt; &gt; +Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devo=
ogdt@barco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.=
com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + disk-utils/cfdisk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +----=
-<br>
&gt; &gt; + include/carefulputc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +----<br>
&gt; &gt; + include/fgetwc_or_err.h=C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
&gt; &gt; + lib/idcache.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt; &gt; + sys-utils/irqtop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 =
++-----<br>
&gt; &gt; + sys-utils/lsns.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt; &gt; + tests/helpers/test_sysinfo.c | 2 +-<br>
&gt; &gt; + 7 files changed, 8 insertions(+), 22 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c<br>
&gt; &gt; +index 4018f4d3d..d4057eedb 100644<br>
&gt; &gt; +--- a/disk-utils/cfdisk.c<br>
&gt; &gt; ++++ b/disk-utils/cfdisk.c<br>
&gt; &gt; +@@ -52,14 +52,10 @@<br>
&gt; &gt; + # include &lt;ncurses/ncurses.h&gt;<br>
&gt; &gt; + #endif<br>
&gt; &gt; +<br>
&gt; &gt; +-#ifdef HAVE_WIDECHAR<br>
&gt; &gt; +-# include &lt;wctype.h&gt;<br>
&gt; &gt; +-# include &lt;wchar.h&gt;<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-<br>
&gt; &gt; + #include &quot;c.h&quot;<br>
&gt; &gt; + #include &quot;closestream.h&quot;<br>
&gt; &gt; + #include &quot;nls.h&quot;<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; + #include &quot;strutils.h&quot;<br>
&gt; &gt; + #include &quot;xalloc.h&quot;<br>
&gt; &gt; + #include &quot;mbsalign.h&quot;<br>
&gt; &gt; +diff --git a/include/carefulputc.h b/include/carefulputc.h<br>
&gt; &gt; +index 3cc6f7ff9..c6b778bba 100644<br>
&gt; &gt; +--- a/include/carefulputc.h<br>
&gt; &gt; ++++ b/include/carefulputc.h<br>
&gt; &gt; +@@ -4,12 +4,9 @@<br>
&gt; &gt; + #include &lt;stdio.h&gt;<br>
&gt; &gt; + #include &lt;string.h&gt;<br>
&gt; &gt; + #include &lt;ctype.h&gt;<br>
&gt; &gt; +-#ifdef HAVE_WIDECHAR<br>
&gt; &gt; +-#include &lt;wctype.h&gt;<br>
&gt; &gt; +-#include &lt;wchar.h&gt;<br>
&gt; &gt; +-#endif<br>
&gt; &gt; + #include &lt;stdbool.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; + #include &quot;cctype.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + /*<br>
&gt; &gt; +diff --git a/include/fgetwc_or_err.h b/include/fgetwc_or_err.h<b=
r>
&gt; &gt; +index 3cf926283..f6ba71c6b 100644<br>
&gt; &gt; +--- a/include/fgetwc_or_err.h<br>
&gt; &gt; ++++ b/include/fgetwc_or_err.h<br>
&gt; &gt; +@@ -1,13 +1,9 @@<br>
&gt; &gt; + #ifndef UTIL_LINUX_FGETWC_OR_ERR_H<br>
&gt; &gt; + #define UTIL_LINUX_FGETWC_OR_ERR_H<br>
&gt; &gt; +<br>
&gt; &gt; +-#include &lt;stdio.h&gt;<br>
&gt; &gt; +-#include &lt;wchar.h&gt;<br>
&gt; &gt; +-#include &lt;errno.h&gt;<br>
&gt; &gt; +-<br>
&gt; &gt; +-#include &quot;widechar.h&quot;<br>
&gt; &gt; + #include &quot;c.h&quot;<br>
&gt; &gt; + #include &quot;nls.h&quot;<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + static inline wint_t fgetwc_or_err(FILE *stream) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0wint_t ret;<br>
&gt; &gt; +diff --git a/lib/idcache.c b/lib/idcache.c<br>
&gt; &gt; +index fa77e7b07..7bae76823 100644<br>
&gt; &gt; +--- a/lib/idcache.c<br>
&gt; &gt; ++++ b/lib/idcache.c<br>
&gt; &gt; +@@ -4,12 +4,12 @@<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; +=C2=A0 * Written by Karel Zak &lt;<a href=3D"mailto:kzak@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; +-#include &lt;wchar.h&gt;<br>
&gt; &gt; + #include &lt;pwd.h&gt;<br>
&gt; &gt; + #include &lt;grp.h&gt;<br>
&gt; &gt; + #include &lt;sys/types.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; + #include &quot;c.h&quot;<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; + #include &quot;idcache.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + struct identry *get_id(struct idcache *ic, unsigned long int id=
)<br>
&gt; &gt; +diff --git a/sys-utils/irqtop.c b/sys-utils/irqtop.c<br>
&gt; &gt; +index ce6a2ca5b..f05bf6bef 100644<br>
&gt; &gt; +--- a/sys-utils/irqtop.c<br>
&gt; &gt; ++++ b/sys-utils/irqtop.c<br>
&gt; &gt; +@@ -43,13 +43,10 @@<br>
&gt; &gt; + # include &lt;ncurses/ncurses.h&gt;<br>
&gt; &gt; + #endif<br>
&gt; &gt; +<br>
&gt; &gt; +-#ifdef HAVE_WIDECHAR<br>
&gt; &gt; +-# include &lt;wctype.h&gt;<br>
&gt; &gt; +-# include &lt;wchar.h&gt;<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-<br>
&gt; &gt; + #include &lt;libsmartcols.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; ++#include &quot;c.h&quot;<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; + #include &quot;closestream.h&quot;<br>
&gt; &gt; + #include &quot;cpuset.h&quot;<br>
&gt; &gt; + #include &quot;monotonic.h&quot;<br>
&gt; &gt; +diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c<br>
&gt; &gt; +index 6b2dcba96..2b613cf71 100644<br>
&gt; &gt; +--- a/sys-utils/lsns.c<br>
&gt; &gt; ++++ b/sys-utils/lsns.c<br>
&gt; &gt; +@@ -19,7 +19,6 @@<br>
&gt; &gt; + #include &lt;unistd.h&gt;<br>
&gt; &gt; + #include &lt;sys/stat.h&gt;<br>
&gt; &gt; + #include &lt;sys/types.h&gt;<br>
&gt; &gt; +-#include &lt;wchar.h&gt;<br>
&gt; &gt; + #include &lt;libsmartcols.h&gt;<br>
&gt; &gt; + #include &lt;libmount.h&gt;<br>
&gt; &gt; + # include &lt;stdbool.h&gt;<br>
&gt; &gt; +@@ -43,6 +42,7 @@<br>
&gt; &gt; + #include &quot;nls.h&quot;<br>
&gt; &gt; + #include &quot;xalloc.h&quot;<br>
&gt; &gt; + #include &quot;c.h&quot;<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; + #include &quot;list.h&quot;<br>
&gt; &gt; + #include &quot;closestream.h&quot;<br>
&gt; &gt; + #include &quot;optutils.h&quot;<br>
&gt; &gt; +diff --git a/tests/helpers/test_sysinfo.c b/tests/helpers/test_s=
ysinfo.c<br>
&gt; &gt; +index 1559d471f..95f50f3f6 100644<br>
&gt; &gt; +--- a/tests/helpers/test_sysinfo.c<br>
&gt; &gt; ++++ b/tests/helpers/test_sysinfo.c<br>
&gt; &gt; +@@ -23,12 +23,12 @@<br>
&gt; &gt; + #include &lt;limits.h&gt;<br>
&gt; &gt; + #include &lt;stdint.h&gt;<br>
&gt; &gt; + #include &lt;inttypes.h&gt;<br>
&gt; &gt; +-#include &lt;wchar.h&gt;<br>
&gt; &gt; + #include &lt;errno.h&gt;<br>
&gt; &gt; + #include &lt;time.h&gt;<br>
&gt; &gt; + #include &lt;sys/ioctl.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; + #include &quot;c.h&quot;<br>
&gt; &gt; ++#include &quot;widechar.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + #ifdef __linux__<br>
&gt; &gt; + # include &lt;sys/mount.h&gt;<br>
&gt; &gt; +--<br>
&gt; &gt; +2.43.0<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/package/util-linux/0001-sys-utils-setarch.c-fix-buil=
d-with-uclibc-ng-1.0.39.patch b/package/util-linux/0001-sys-utils-setarch.c=
-fix-build-with-uclibc-ng-1.0.39.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 12dd119ef3..0000000000<br>
&gt; &gt; --- a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-=
uclibc-ng-1.0.39.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,39 +0,0 @@<br>
&gt; &gt; -From beef18da4de87ca5aaadf2beb14187f35cc4f50f Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">fontaine.fabrice@gmail.com</a=
>&gt;<br>
&gt; &gt; -Date: Wed, 15 May 2024 18:22:11 +0200<br>
&gt; &gt; -Subject: [PATCH] sys-utils/setarch.c: fix build with uclibc-ng &=
lt; 1.0.39<br>
&gt; &gt; -<br>
&gt; &gt; -Fix the following build failure with uclibc-ng &lt; 1.0.39 (i.e.=
, without<br>
&gt; &gt; -<a href=3D"https://github.com/wbx-github/uclibc-ng/commit/85ac4f=
04d94e98389a8315e720630d0f95bfdfd6" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8=
315e720630d0f95bfdfd6</a>)<br>
&gt; &gt; -raised since version 2.39 and<br>
&gt; &gt; -<a href=3D"https://github.com/util-linux/util-linux/commit/03a25=
4f010b08da1175f50a8ae7882e59228f1b4" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/util-linux/util-linux/commit/03a254f010b08da=
1175f50a8ae7882e59228f1b4</a>:<br>
&gt; &gt; -<br>
&gt; &gt; -sys-utils/setarch.c:106:7: error: &#39;PER_LINUX32_3GB&#39; unde=
clared here (not in a function); did you mean &#39;PER_LINUX32&#39;?<br>
&gt; &gt; -=C2=A0 106 |=C2=A0 =C2=A0 =C2=A0X(PER_LINUX32_3GB) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~=
<br>
&gt; &gt; -<br>
&gt; &gt; -Fixes:<br>
&gt; &gt; - - <a href=3D"http://autobuild.buildroot.org/results/fb1feb47f26=
60882fa53f66bacc63e191fd52175" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e19=
1fd52175</a><br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.f=
abrice@gmail.com" target=3D"_blank" rel=3D"noreferrer">fontaine.fabrice@gma=
il.com</a>&gt;<br>
&gt; &gt; -Upstream: <a href=3D"https://github.com/util-linux/util-linux/co=
mmit/4647fc6afbf7e99c49531600425df60f1243fcd2" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/util-linux/util-linux/commit/4647fc6=
afbf7e99c49531600425df60f1243fcd2</a><br>
&gt; &gt; ----<br>
&gt; &gt; - sys-utils/setarch.c | 5 +++++<br>
&gt; &gt; - 1 file changed, 5 insertions(+)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c<br>
&gt; &gt; -index 227bc6b5de..4bcb5e69e6 100644<br>
&gt; &gt; ---- a/sys-utils/setarch.c<br>
&gt; &gt; -+++ b/sys-utils/setarch.c<br>
&gt; &gt; -@@ -89,6 +89,11 @@<br>
&gt; &gt; - # define PER_LINUX_FDPIC=C2=A0 =C2=A0 (PER_LINUX | FDPIC_FUNCPT=
RS)<br>
&gt; &gt; - #endif<br>
&gt; &gt; -<br>
&gt; &gt; -+/* fallback for old uclibc-headers &lt; 1.0.39 */<br>
&gt; &gt; -+#ifndef PER_LINUX32_3GB<br>
&gt; &gt; -+# define PER_LINUX32_3GB=C2=A0 =C2=A0 (PER_LINUX32 | ADDR_LIMIT=
_3GB)<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+<br>
&gt; &gt; - #define ALL_PERSONALITIES \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0X(PER_LINUX) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0X(PER_LINUX_32BIT) \<br>
&gt; &gt; diff --git a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL=
.patch b/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index bb1a63ecc2..0000000000<br>
&gt; &gt; --- a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch<=
br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,65 +0,0 @@<br>
&gt; &gt; -From 7b3db914fa9073c667ea482c8b6b4e07fe6202cc Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 27 Jan 2025 13:40:23 +0100<br>
&gt; &gt; -Subject: [PATCH] c.h: consolidate THREAD_LOCAL.<br>
&gt; &gt; -<br>
&gt; &gt; -Let&#39;s define this macro in one place only.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream: <a href=3D"https://github.com/util-linux/util-linux/pu=
ll/3383" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/util-linux/util-linux/pull/3383</a><br>
&gt; &gt; -Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr=
" target=3D"_blank" rel=3D"noreferrer">ju.o@free.fr</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - include/c.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++++++=
+++<br>
&gt; &gt; - lib/randutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 -----<br>
&gt; &gt; - libuuid/src/gen_uuid.c | 1 -<br>
&gt; &gt; - 3 files changed, 9 insertions(+), 6 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/include/c.h b/include/c.h<br>
&gt; &gt; -index 61b95ab2d..848c48536 100644<br>
&gt; &gt; ---- a/include/c.h<br>
&gt; &gt; -+++ b/include/c.h<br>
&gt; &gt; -@@ -595,4 +595,13 @@ static inline void *reallocarray(void *ptr,=
 size_t nmemb, size_t size)<br>
&gt; &gt; - }<br>
&gt; &gt; - #endif<br>
&gt; &gt; -<br>
&gt; &gt; -+/*<br>
&gt; &gt; -+ * thread-local storage<br>
&gt; &gt; -+ */<br>
&gt; &gt; -+#ifdef HAVE_TLS<br>
&gt; &gt; -+# define THREAD_LOCAL static __thread<br>
&gt; &gt; -+#else<br>
&gt; &gt; -+# define THREAD_LOCAL static<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+<br>
&gt; &gt; - #endif /* UTIL_LINUX_C_H */<br>
&gt; &gt; -diff --git a/lib/randutils.c b/lib/randutils.c<br>
&gt; &gt; -index 15c2f7834..4c806e682 100644<br>
&gt; &gt; ---- a/lib/randutils.c<br>
&gt; &gt; -+++ b/lib/randutils.c<br>
&gt; &gt; -@@ -20,11 +20,6 @@<br>
&gt; &gt; - #include &quot;randutils.h&quot;<br>
&gt; &gt; - #include &quot;nls.h&quot;<br>
&gt; &gt; -<br>
&gt; &gt; --#ifdef HAVE_TLS<br>
&gt; &gt; --#define THREAD_LOCAL static __thread<br>
&gt; &gt; --#else<br>
&gt; &gt; --#define THREAD_LOCAL static<br>
&gt; &gt; --#endif<br>
&gt; &gt; -<br>
&gt; &gt; - #ifdef HAVE_GETRANDOM<br>
&gt; &gt; - # include &lt;sys/random.h&gt;<br>
&gt; &gt; -diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c<br>
&gt; &gt; -index 3b76ddc9a..69712267f 100644<br>
&gt; &gt; ---- a/libuuid/src/gen_uuid.c<br>
&gt; &gt; -+++ b/libuuid/src/gen_uuid.c<br>
&gt; &gt; -@@ -92,7 +92,6 @@<br>
&gt; &gt; - #include &quot;md5.h&quot;<br>
&gt; &gt; - #include &quot;sha1.h&quot;<br>
&gt; &gt; -<br>
&gt; &gt; --#define THREAD_LOCAL static __thread<br>
&gt; &gt; -<br>
&gt; &gt; - #ifdef _WIN32<br>
&gt; &gt; - static void gettimeofday (struct timeval *tv, void *dummy)<br>
&gt; &gt; ---<br>
&gt; &gt; -2.48.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/package/util-linux/0002-lsns-fix-undefined-reference=
-to-add_namespace_for_ns.patch b/package/util-linux/0002-lsns-fix-undefined=
-reference-to-add_namespace_for_ns.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..5a53aed8ff<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/util-linux/0002-lsns-fix-undefined-reference-to-add=
_namespace_for_ns.patch<br>
&gt; &gt; @@ -0,0 +1,59 @@<br>
&gt; &gt; +From 300a66c30c3d0fb04c0f24cf23fde80e1e3bf5e4 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barc=
o.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a>&g=
t;<br>
&gt; &gt; +Date: Tue, 25 Mar 2025 11:58:18 +0100<br>
&gt; &gt; +Subject: [PATCH] lsns: fix undefined reference to add_namespace_=
for_nsfd #3483<br>
&gt; &gt; +<br>
&gt; &gt; +Fixes:<br>
&gt; &gt; +<br>
&gt; &gt; +sys-utils/lsns-lsns.o: In function `read_process&#39;:<br>
&gt; &gt; +lsns.c:(.text+0x9e8): undefined reference to `add_namespace_for_=
nsfd&#39;<br>
&gt; &gt; +collect2: error: ld returned 1 exit status<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devo=
ogdt@barco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.=
com</a>&gt;<br>
&gt; &gt; +(cherry picked from commit 2ced43400f35f7bd45b29364e04166a63a06e=
16a)<br>
&gt; &gt; +Upstream: <a href=3D"https://github.com/util-linux/util-linux/pu=
ll/3484" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/util-linux/util-linux/pull/3484</a><br>
&gt; &gt; +Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devo=
ogdt@barco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.=
com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + sys-utils/lsns.c | 6 ++++++<br>
&gt; &gt; + 1 file changed, 6 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c<br>
&gt; &gt; +index 2b613cf71..4c49a8b2d 100644<br>
&gt; &gt; +--- a/sys-utils/lsns.c<br>
&gt; &gt; ++++ b/sys-utils/lsns.c<br>
&gt; &gt; +@@ -587,7 +587,10 @@ static void add_namespace_from_sock(struct =
lsns *ls, pid_t pid, uint64_t fd)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (get_namespace(ls, sb.st_ino))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_nsfd;<b=
r>
&gt; &gt; +<br>
&gt; &gt; ++#ifdef USE_NS_GET_API<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0add_namespace_for_nsfd(ls, nsfd, sb.st_ino);=
<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++<br>
&gt; &gt; + out_nsfd:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0close(nsfd);<br>
&gt; &gt; + out_sk:<br>
&gt; &gt; +@@ -608,6 +611,7 @@ static void add_namespace_from_sock(struct l=
sns *ls __attribute__((__unused__)),<br>
&gt; &gt; + {<br>
&gt; &gt; + }<br>
&gt; &gt; + #endif /* HAVE_LINUX_NET_NAMESPACE_H */<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Read namespaces open(2)ed explicitly by the process specifie=
d by `pc&#39;. */<br>
&gt; &gt; + static void read_opened_namespaces(struct lsns *ls, struct path=
_cxt *pc, pid_t pid)<br>
&gt; &gt; + {<br>
&gt; &gt; +@@ -627,11 +631,13 @@ static void read_opened_namespaces(struct =
lsns *ls, struct path_cxt *pc, pid_t p<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st.st_dev =
=3D=3D ls-&gt;nsfs_dev) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (get_namespace(ls, st.st_ino))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; ++#ifdef USE_NS_GET_API<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int fd =3D ul_path_openf(pc, O_RDONLY, &quot;fd/%ju&quot;, (ui=
ntmax_t) num);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_namespace_for_nsfd(ls, fd, st.=
st_ino);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; &gt; ++#endif<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if ((st.s=
t_mode &amp; S_IFMT) =3D=3D S_IFSOCK) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0add_namespace_from_sock(ls, pid, num);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +--<br>
&gt; &gt; +2.43.0<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/package/util-linux/0003-autotools-define-HAVE_LIBPTH=
READ-and-PTHREAD_LIBS.patch b/package/util-linux/0003-autotools-define-HAVE=
_LIBPTHREAD-and-PTHREAD_LIBS.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 843253a56a..0000000000<br>
&gt; &gt; --- a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-an=
d-PTHREAD_LIBS.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,47 +0,0 @@<br>
&gt; &gt; -From 0735eb8bc0ed4bc9820ea7e4e600fed246457b18 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 27 Jan 2025 14:01:38 +0100<br>
&gt; &gt; -Subject: [PATCH] autotools: define HAVE_LIBPTHREAD and PTHREAD_L=
IBS<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream: <a href=3D"https://github.com/util-linux/util-linux/pu=
ll/3383" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/util-linux/util-linux/pull/3383</a><br>
&gt; &gt; -Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr=
" target=3D"_blank" rel=3D"noreferrer">ju.o@free.fr</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 7 +++++++<br>
&gt; &gt; - libuuid/src/Makemodule.am | 2 +-<br>
&gt; &gt; - 2 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure=
.ac" rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; &gt; -index 82d0e4bf9..9a7f260c5 100644<br>
&gt; &gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; &gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; &gt; -@@ -738,6 +738,13 @@ AS_IF([test x&quot;$have_timer&quot; =3D xn=
o], [<br>
&gt; &gt; - ])<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; -+AC_CHECK_LIB([pthread], [pthread_atfork], [<br>
&gt; &gt; -+=C2=A0 =C2=A0 PTHREAD_LIBS=3D&quot;-lpthread&quot;<br>
&gt; &gt; -+=C2=A0 =C2=A0 AC_DEFINE([HAVE_LIBPTHREAD], [1], [Define if libp=
thred exist])<br>
&gt; &gt; -+])<br>
&gt; &gt; -+AC_SUBST([PTHREAD_LIBS])<br>
&gt; &gt; -+<br>
&gt; &gt; -+<br>
&gt; &gt; - AC_CHECK_LIB([rtas], [rtas_get_sysparm], [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0RTAS_LIBS=3D&quot;-lrtas&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_LIBRTAS], [1], [Define if li=
brtas exists])<br>
&gt; &gt; -diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.=
am<br>
&gt; &gt; -index 867ad7be5..58b64fe9b 100644<br>
&gt; &gt; ---- a/libuuid/src/Makemodule.am<br>
&gt; &gt; -+++ b/libuuid/src/Makemodule.am<br>
&gt; &gt; -@@ -31,7 +31,7 @@ libuuid_la_SOURCES =3D \<br>
&gt; &gt; - EXTRA_libuuid_la_DEPENDENCIES =3D \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0libuuid/src/libuuid.sym<br>
&gt; &gt; -<br>
&gt; &gt; --libuuid_la_LIBADD=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(SOCK=
ET_LIBS) -lpthread<br>
&gt; &gt; -+libuuid_la_LIBADD=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(LDADD) $(SOCK=
ET_LIBS) $(PTHREAD_LIBS)<br>
&gt; &gt; -<br>
&gt; &gt; - libuuid_la_CFLAGS =3D \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0$(AM_CFLAGS) \<br>
&gt; &gt; ---<br>
&gt; &gt; -2.48.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.pa=
tch b/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 19e0697769..0000000000<br>
&gt; &gt; --- a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,27 +0,0 @@<br>
&gt; &gt; -From f540cc6fed7224fb9ca162cb2f33c338260ae1d2 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 27 Jan 2025 14:11:35 +0100<br>
&gt; &gt; -Subject: [PATCH] meson: add HAVE_LIBPTHREAD<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream: <a href=3D"https://github.com/util-linux/util-linux/pu=
ll/3383" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/util-linux/util-linux/pull/3383</a><br>
&gt; &gt; -Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr=
" target=3D"_blank" rel=3D"noreferrer">ju.o@free.fr</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - meson.build | 1 +<br>
&gt; &gt; - 1 file changed, 1 insertion(+)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/meson.build b/meson.build<br>
&gt; &gt; -index 6d1f986af..ac5fdd799 100644<br>
&gt; &gt; ---- a/meson.build<br>
&gt; &gt; -+++ b/meson.build<br>
&gt; &gt; -@@ -748,6 +748,7 @@ endif<br>
&gt; &gt; - conf.set(&#39;HAVE_CLOCK_GETTIME&#39;, have ? 1 : false)<br>
&gt; &gt; -<br>
&gt; &gt; - thread_libs =3D dependency(&#39;threads&#39;)<br>
&gt; &gt; -+conf.set(&#39;HAVE_LIBPTHREAD&#39;, thread_libs.found() ? 1 : f=
alse)<br>
&gt; &gt; -<br>
&gt; &gt; - have =3D cc.has_function(&#39;timer_create&#39;)<br>
&gt; &gt; - if not have<br>
&gt; &gt; ---<br>
&gt; &gt; -2.48.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/package/util-linux/0005-libuuid-support-non-cached-s=
cenarios-when-lpthread-i.patch b/package/util-linux/0005-libuuid-support-no=
n-cached-scenarios-when-lpthread-i.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 0d90f8aec9..0000000000<br>
&gt; &gt; --- a/package/util-linux/0005-libuuid-support-non-cached-scenario=
s-when-lpthread-i.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,82 +0,0 @@<br>
&gt; &gt; -From eecaa2c0dda817eba2d493f6ddb42c39cf789fc2 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 27 Jan 2025 14:28:36 +0100<br>
&gt; &gt; -Subject: [PATCH] libuuid: support non-cached scenarios (when -lp=
thread is<br>
&gt; &gt; - unavailable)<br>
&gt; &gt; -<br>
&gt; &gt; -This patch makes the dependence on pthread optional for libuuid.=
 In<br>
&gt; &gt; -certain cases, such as Buildroot Linux, uClibc-ng, and very low<=
br>
&gt; &gt; -resource systems, libpthread may be unavailable.<br>
&gt; &gt; -<br>
&gt; &gt; -If libuuid is compiled without pthread, it will not use a local =
cache<br>
&gt; &gt; -and will instead request a UUID from uuidd for each call. This m=
ay<br>
&gt; &gt; -result in less efficient performance, but the UUIDs generated wi=
ll<br>
&gt; &gt; -still be unique and reliable.<br>
&gt; &gt; -<br>
&gt; &gt; -On minimalistic systems, it is highly likely that uuidd will not=
 be<br>
&gt; &gt; -installed, making this change important for portability and robu=
st<br>
&gt; &gt; -code.<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream: <a href=3D"https://github.com/util-linux/util-linux/pu=
ll/3383" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/util-linux/util-linux/pull/3383</a><br>
&gt; &gt; -Addresses: <a href=3D"https://github.com/util-linux/util-linux/p=
ull/3375" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/util-linux/util-linux/pull/3375</a><br>
&gt; &gt; -Signed-off-by: Karel Zak &lt;<a href=3D"mailto:kzak@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">kzak@redhat.com</a>&gt;<br>
&gt; &gt; -Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr=
" target=3D"_blank" rel=3D"noreferrer">ju.o@free.fr</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - libuuid/src/gen_uuid.c | 18 +++++++++++++++---<br>
&gt; &gt; - 1 file changed, 15 insertions(+), 3 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c<br>
&gt; &gt; -index 69712267f..1ed82b46b 100644<br>
&gt; &gt; ---- a/libuuid/src/gen_uuid.c<br>
&gt; &gt; -+++ b/libuuid/src/gen_uuid.c<br>
&gt; &gt; -@@ -80,7 +80,10 @@<br>
&gt; &gt; - #if defined(__linux__) &amp;&amp; defined(HAVE_SYS_SYSCALL_H)<b=
r>
&gt; &gt; - #include &lt;sys/syscall.h&gt;<br>
&gt; &gt; - #endif<br>
&gt; &gt; --#include &lt;pthread.h&gt;<br>
&gt; &gt; -+#ifdef HAVE_LIBPTHREAD<br>
&gt; &gt; -+# include &lt;pthread.h&gt;<br>
&gt; &gt; -+#endif<br>
&gt; &gt; -+<br>
&gt; &gt; - #include &lt;signal.h&gt;<br>
&gt; &gt; -<br>
&gt; &gt; - #include &quot;all-io.h&quot;<br>
&gt; &gt; -@@ -580,8 +583,7 @@ int __uuid_generate_time_cont(uuid_t out, in=
t *num, uint32_t cont_offset)<br>
&gt; &gt; -=C2=A0 * If neither of these is possible (e.g. because of insuff=
icient permissions), it generates<br>
&gt; &gt; -=C2=A0 * the UUID anyway, but returns -1. Otherwise, returns 0.<=
br>
&gt; &gt; -=C2=A0 */<br>
&gt; &gt; --<br>
&gt; &gt; --/* thread local cache for uuidd based requests */<br>
&gt; &gt; -+#ifdef HAVE_LIBPTHREAD<br>
&gt; &gt; - THREAD_LOCAL struct {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0num;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cache_size;<br>
&gt; &gt; -@@ -597,8 +599,10 @@ static void reset_uuidd_cache(void)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0memset(&amp;uuidd_cache, 0, sizeof(uuidd_cac=
he));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0uuidd_cache.cache_size =3D CS_MIN;<br>
&gt; &gt; - }<br>
&gt; &gt; -+#endif /* HAVE_LIBPTHREAD */<br>
&gt; &gt; -<br>
&gt; &gt; - static int uuid_generate_time_generic(uuid_t out) {<br>
&gt; &gt; -+#ifdef HAVE_LIBPTHREAD<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0static volatile sig_atomic_t atfork_register=
ed;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0time_t=C2=A0 now;<br>
&gt; &gt; -<br>
&gt; &gt; -@@ -651,6 +655,14 @@ static int uuid_generate_time_generic(uuid_=
t out) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -<br>
&gt; &gt; -+#else /* !HAVE_LIBPTHREAD */<br>
&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int num =3D 1;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_uuid_via_daem=
on(UUIDD_OP_TIME_UUID, out, &amp;num) =3D=3D 0)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;<br>
&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt; &gt; -+#endif /* HAVE_LIBPTHREAD */<br>
&gt; &gt; -+<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return __uuid_generate_time(out, NULL);<br>
&gt; &gt; - }<br>
&gt; &gt; -<br>
&gt; &gt; ---<br>
&gt; &gt; -2.48.1<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/package/util-linux/util-linux.hash b/package/util-li=
nux/util-linux.hash<br>
&gt; &gt; index 317efebcbf..e74aa17c94 100644<br>
&gt; &gt; --- a/package/util-linux/util-linux.hash<br>
&gt; &gt; +++ b/package/util-linux/util-linux.hash<br>
&gt; &gt; @@ -1,10 +1,14 @@<br>
&gt; &gt; -# From <a href=3D"https://mirrors.edge.kernel.org/pub/linux/util=
s/util-linux/v2.40/sha256sums.asc" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sh=
a256sums.asc</a><br>
&gt; &gt; -sha256=C2=A0 d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203=
b2a2b67c8e8b3=C2=A0 util-linux-2.40.2.tar.xz<br>
&gt; &gt; +# From <a href=3D"https://mirrors.edge.kernel.org/pub/linux/util=
s/util-linux/v2.41/sha256sums.asc" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sh=
a256sums.asc</a><br>
&gt; &gt; +sha256=C2=A0 81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b=
3fe475ddca4c6=C2=A0 util-linux-2.41.tar.xz<br>
&gt; &gt;=C2=A0 # License files, locally calculated<br>
&gt; &gt; -sha256=C2=A0 27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7=
e0960d1b35164=C2=A0 README.licensing<br>
&gt; &gt; +sha256=C2=A0 4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711=
b46cc13a40bb3=C2=A0 README.licensing<br>
&gt; &gt; +sha256=C2=A0 527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f75=
44a6161938ed1=C2=A0 Documentation/licenses/COPYING.BSD-2-Clause<br>
&gt; &gt;=C2=A0 sha256=C2=A0 9b718a9460fed5952466421235bc79eb49d4e9eacc920d=
7a9dd6285ab8fd6c6d=C2=A0 Documentation/licenses/COPYING.BSD-3-Clause<br>
&gt; &gt;=C2=A0 sha256=C2=A0 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4=
adcccb0018359f60f8=C2=A0 Documentation/licenses/COPYING.BSD-4-Clause-UC<br>
&gt; &gt; +sha256=C2=A0 6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f=
21a83b4d1e665=C2=A0 Documentation/licenses/COPYING.EUPL-1.2<br>
&gt; &gt; +sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 Documentation/licenses/COPYING.GPL-2.0-only<br>
&gt; &gt;=C2=A0 sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e6=
8a404010521b880643=C2=A0 Documentation/licenses/COPYING.GPL-2.0-or-later<br=
>
&gt; &gt; +sha256=C2=A0 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6a=
f86c9dfb36986=C2=A0 Documentation/licenses/COPYING.GPL-3.0-or-later<br>
&gt; &gt;=C2=A0 sha256=C2=A0 e53348ce276358e9997014071c5294b36a18c4b34f32f0=
0ee57b9acce0aafd63=C2=A0 Documentation/licenses/COPYING.ISC<br>
&gt; &gt;=C2=A0 sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb=
063799d8ab032fe551=C2=A0 Documentation/licenses/COPYING.LGPL-2.1-or-later<b=
r>
&gt; &gt;=C2=A0 sha256=C2=A0 8555341619542abb48c102afd954e42d4478e5be16ad3d=
5af7b0ff71009e7348=C2=A0 Documentation/licenses/COPYING.MIT<br>
&gt; &gt; diff --git a/package/util-linux/<a href=3D"http://util-linux.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">util-linux.mk</a> b/package=
/util-linux/<a href=3D"http://util-linux.mk" rel=3D"noreferrer noreferrer" =
target=3D"_blank">util-linux.mk</a><br>
&gt; &gt; index ed30c0b107..71e458ccc4 100644<br>
&gt; &gt; --- a/package/util-linux/<a href=3D"http://util-linux.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">util-linux.mk</a><br>
&gt; &gt; +++ b/package/util-linux/<a href=3D"http://util-linux.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">util-linux.mk</a><br>
&gt; &gt; @@ -7,8 +7,8 @@<br>
&gt; &gt;=C2=A0 # When making changes to this file, please check if<br>
&gt; &gt;=C2=A0 # util-linux-libs/<a href=3D"http://util-linux-libs.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">util-linux-libs.mk</a> needs t=
o be updated accordingly as well.<br>
&gt; &gt; <br>
&gt; &gt; -UTIL_LINUX_VERSION_MAJOR =3D 2.40<br>
&gt; &gt; -UTIL_LINUX_VERSION =3D $(UTIL_LINUX_VERSION_MAJOR).2<br>
&gt; &gt; +UTIL_LINUX_VERSION_MAJOR =3D 2.41<br>
&gt; &gt; +UTIL_LINUX_VERSION =3D $(UTIL_LINUX_VERSION_MAJOR)<br>
&gt; &gt;=C2=A0 UTIL_LINUX_SOURCE =3D util-linux-$(UTIL_LINUX_VERSION).tar.=
xz<br>
&gt; &gt;=C2=A0 UTIL_LINUX_SITE =3D $(BR2_KERNEL_MIRROR)/linux/utils/util-l=
inux/v$(UTIL_LINUX_VERSION_MAJOR)<br>
&gt; &gt; <br>
&gt; &gt; @@ -24,18 +24,19 @@ UTIL_LINUX_LICENSE =3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISC (rfkill) \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT (hardlink, flock)<br>
&gt; &gt;=C2=A0 UTIL_LINUX_LICENSE_FILES =3D README.licensing \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.BSD-2-Clause =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.BSD-3-Cl=
ause \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.BSD-4-Cl=
ause-UC \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.EUPL-1.2 \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.GPL-2.0-only =
\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.GPL-2.0-=
or-later \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.GPL-3.0-or-la=
ter \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.ISC \<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.LGPL-2.1=
-or-later \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/licenses/COPYING.MIT<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 UTIL_LINUX_CPE_ID_VENDOR =3D kernel<br>
&gt; &gt; <br>
&gt; &gt; -# 0001-libmount-ifdef-statx-call.patch<br>
&gt; &gt; -UTIL_LINUX_AUTORECONF =3D YES<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 UTIL_LINUX_INSTALL_STAGING =3D YES<br>
&gt; &gt;=C2=A0 UTIL_LINUX_DEPENDENCIES =3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt;<br>

--000000000000b48a0b0631ceb5f2--

--===============8344015719655935460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8344015719655935460==--
