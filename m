Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE544C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A627610E5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A627610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE9F4402AB;
	Wed, 13 Oct 2021 18:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id An_a9GI3XETO; Wed, 13 Oct 2021 18:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA11D4052B;
	Wed, 13 Oct 2021 18:56:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 401E41BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CE8660C33
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7ss192rOV_T for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B13160AF9
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:56:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p13so14581631edw.0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tpMlulAFze7jSnV/HgqTATP1zIexNsgq9NjKyyYYp0Q=;
 b=FXIE6xLK7xfTWw9KhU2wEohXdeufoSD67x7mpEIB1bVccVptNvktRCaYZ2U0KpqHf8
 x80sr7L0B8nTk38YRW6ZpS5JVAC4XlkumjEZ7QkYHzV7DP2v4PgzV5/paxwkHGI4FqeK
 PXpp7FTSMSXyYFBScffKahbeRWdB4fC+oO2A0FUuAIa6NMmZdZgov0opw6+3ZpSFhlEf
 L5UZgD4e+3enHvMAfPQcPA+7Z7ejivAgaN9ymSsl8omvlZzHIVuFuCCBeI2R+DMNtrTj
 czdYlKVv3HsYwuDEbKomQsmTOOok8IWZH/KhfQfi8LLcPuZkl2GVYw1W+1Q/3Bx70Y5+
 vKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tpMlulAFze7jSnV/HgqTATP1zIexNsgq9NjKyyYYp0Q=;
 b=kHfK0cm8HgDBrJTS14hihAus9HBnqmnxdW9EATtJu2F0JSsTTRsVA+s/A+3uo4o4bt
 1OQSw/cly+7x9nnJriwutPG2oh8Z28RVOv1oMgjsvKMPUr7vTIvuW2QTZsadm6l6p3Yt
 qQxIYO7EZzi1AD4wHUjMw+pUb6tdgcTA7klLDJgt9OE9o3RcnbROr4yTF/xy3uBaymhK
 03H5xrB6qVel5RWY0sTwjSH9tAXinmirAigaenh+G4JLD08dcGiuyVW3k69jw/OuTfQv
 S8oCTY8DNUL2YhO0S8dZhpSNQEOAABWimdYr6qbCQ4kK++YkkM2OKFP7CcpxHmnXL4WA
 iN1g==
X-Gm-Message-State: AOAM533okprhypKUuHLy6xb0sAh668lhlbHiunmAPz0+MbAQ3kwNGKaP
 Qv1oOFaQqq926dkFuTRJWsI922s3eri0F6Lc
X-Google-Smtp-Source: ABdhPJzbwlcEwknPi41bITE3n0E8G11UPULktkWlgT5A1y6W2DbH/75gVGzFs0FmuxFui8u+POoByQ==
X-Received: by 2002:a17:906:838c:: with SMTP id
 p12mr1083277ejx.181.1634151368485; 
 Wed, 13 Oct 2021 11:56:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f9sm346719edy.9.2021.10.13.11.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:56:08 -0700 (PDT)
Message-ID: <ff54b704-0a09-f90d-1a94-522a5e6301d7@mind.be>
Date: Wed, 13 Oct 2021 20:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006165855.2952918-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006165855.2952918-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/asterisk: fix build with
 autoconf >= 2.70
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 18:58, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> configure: error: *** ANSI C header files not found.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e7dc47da7863a5dc492154f620c4fcebafccf6ea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...a-compile-failure-with-autoconf-2-70.patch | 171 ++++++++++++++++++
>   1 file changed, 171 insertions(+)
>   create mode 100644 package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
> 
> diff --git a/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
> new file mode 100644
> index 0000000000..cced0bbae7
> --- /dev/null
> +++ b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
> @@ -0,0 +1,171 @@
> +From 060ce10163e46a740c15036fc56214468abc710b Mon Sep 17 00:00:00 2001
> +From: Jaco Kroon <jaco@uls.co.za>
> +Date: Fri, 8 Jan 2021 18:02:47 +0200
> +Subject: [PATCH] AC_HEADER_STDC causes a compile failure with autoconf 2.70
> +
> +From https://www.mail-archive.com/bug-autoconf@gnu.org/msg04408.html
> +
> +> ... the long-obsolete AC_HEADER_STDC, previously used internally by
> +> AC_INCLUDES_DEFAULT, used AC_EGREP_HEADER.  The AC_HEADER_STDC macro
> +> is now a no-op (and is not used at all within Autoconf anymore), so
> +> that change is likely what made the first use of AC_EGREP_HEADER the
> +> one inside the if condition, causing the observed results.
> +
> +The implication is that the test does nothing anyway, and due to it
> +being a no-op from 2.70 onwards, results in the required not being set
> +to yes, resulting in ./configure to fail.
> +
> +Change-Id: Ic1ff38d87f791fbf1f2a80512f81bb7110392460
> +Signed-off-by: Jaco Kroon <jaco@uls.co.za>
> +
> +[Retrieved from:
> +https://github.com/asterisk/asterisk/commit/060ce10163e46a740c15036fc56214468abc710b]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure    | 116 ---------------------------------------------------
> + configure.ac |   5 ---
> + 2 files changed, 121 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 3594ac62f0c..735a8e98c7f 100755
> +--- a/configure
> ++++ b/configure
> +@@ -13129,122 +13129,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
> +   as_fn_error $? "*** Could not find dirent header that defines 'DIR'." "$LINENO" 5
> + fi
> +
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ANSI C header files" >&5
> +-$as_echo_n "checking for ANSI C header files... " >&6; }
> +-if ${ac_cv_header_stdc+:} false; then :
> +-  $as_echo_n "(cached) " >&6
> +-else
> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-#include <stdlib.h>
> +-#include <stdarg.h>
> +-#include <string.h>
> +-#include <float.h>
> +-
> +-int
> +-main ()
> +-{
> +-
> +-  ;
> +-  return 0;
> +-}
> +-_ACEOF
> +-if ac_fn_c_try_compile "$LINENO"; then :
> +-  ac_cv_header_stdc=yes
> +-else
> +-  ac_cv_header_stdc=no
> +-fi
> +-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> +-
> +-if test $ac_cv_header_stdc = yes; then
> +-  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-#include <string.h>
> +-
> +-_ACEOF
> +-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "memchr" >/dev/null 2>&1; then :
> +-
> +-else
> +-  ac_cv_header_stdc=no
> +-fi
> +-rm -f conftest*
> +-
> +-fi
> +-
> +-if test $ac_cv_header_stdc = yes; then
> +-  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-#include <stdlib.h>
> +-
> +-_ACEOF
> +-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +-  $EGREP "free" >/dev/null 2>&1; then :
> +-
> +-else
> +-  ac_cv_header_stdc=no
> +-fi
> +-rm -f conftest*
> +-
> +-fi
> +-
> +-if test $ac_cv_header_stdc = yes; then
> +-  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
> +-  if test "$cross_compiling" = yes; then :
> +-  :
> +-else
> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-#include <ctype.h>
> +-#include <stdlib.h>
> +-#if ((' ' & 0x0FF) == 0x020)
> +-# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
> +-# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
> +-#else
> +-# define ISLOWER(c) \
> +-		   (('a' <= (c) && (c) <= 'i') \
> +-		     || ('j' <= (c) && (c) <= 'r') \
> +-		     || ('s' <= (c) && (c) <= 'z'))
> +-# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
> +-#endif
> +-
> +-#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
> +-int
> +-main ()
> +-{
> +-  int i;
> +-  for (i = 0; i < 256; i++)
> +-    if (XOR (islower (i), ISLOWER (i))
> +-	|| toupper (i) != TOUPPER (i))
> +-      return 2;
> +-  return 0;
> +-}
> +-_ACEOF
> +-if ac_fn_c_try_run "$LINENO"; then :
> +-
> +-else
> +-  ac_cv_header_stdc=no
> +-fi
> +-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
> +-  conftest.$ac_objext conftest.beam conftest.$ac_ext
> +-fi
> +-
> +-fi
> +-fi
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_header_stdc" >&5
> +-$as_echo "$ac_cv_header_stdc" >&6; }
> +-if test $ac_cv_header_stdc = yes; then
> +-
> +-$as_echo "#define STDC_HEADERS 1" >>confdefs.h
> +-
> +-fi
> +-
> +-if test "$ac_cv_header_stdc" != "yes"; then
> +-  as_fn_error $? "*** ANSI C header files not found." "$LINENO" 5
> +-fi
> +-
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sys/wait.h that is POSIX.1 compatible" >&5
> + $as_echo_n "checking for sys/wait.h that is POSIX.1 compatible... " >&6; }
> + if ${ac_cv_header_sys_wait_h+:} false; then :
> +diff --git a/configure.ac b/configure.ac
> +index 9ae3769d02e..2260fe63268 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -616,11 +616,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
> +   AC_MSG_ERROR([*** Could not find dirent header that defines 'DIR'.])
> + fi
> +
> +-AC_HEADER_STDC
> +-if test "$ac_cv_header_stdc" != "yes"; then
> +-  AC_MSG_ERROR([*** ANSI C header files not found.])
> +-fi
> +-
> + AC_HEADER_SYS_WAIT
> + if test "$ac_cv_header_sys_wait_h" != "yes"; then
> +   AC_MSG_ERROR([*** POSIX.1 compatible sys/wait.h is required.])
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
