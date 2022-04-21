Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAE2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE356FE26;
	Thu, 21 Apr 2022 19:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cC3MqtDlUQRm; Thu, 21 Apr 2022 19:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3686FE22;
	Thu, 21 Apr 2022 19:32:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9891BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BE3F40C4F
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iftVTYARkvpU for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:32:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36208403C4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:32:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q7so419168wrm.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cYd9XAYhMIA1nYRoZCVwyCuc4qYERCM9loXz7MSAgA8=;
 b=ZKFqvDK6lkypjL+XRk06oqypAkhmyytphMIDx40vE6+HxOvnDIkhS2FA89jphppY44
 FnXp1KsjdOg2YCjaOawUG+lRYcxMWnLhH7ZqxDgzGVVuiKsuFshyv3H+bfUOJQTPIeag
 H9zmohgBPuyc4zEU6M3wDD9yHfQnQ2V3BdFSg7OB16ktqoMsfwGn4qNChCTvCwusLj44
 Fgp432ln/TyPO/bwfWC7lLMxu4WwipiQFtV9BCww3YY4tUPWpkaue9XBA1ilSTHTc9He
 5kK83+wmOovw/c0axz14Sr5qGDisSEEiSja38SYzFozCCNoRzmNNfkXM55ieubfQkGu4
 MeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cYd9XAYhMIA1nYRoZCVwyCuc4qYERCM9loXz7MSAgA8=;
 b=bdKG2FwQV7dT29q4nuwezlgiGmrOZim6krYEuGO29OrlaCW15Jy2fPZF+8FUEeSoCS
 3o95pzQdxRiSUj1X3EQpDNgc22+ojstudlBES34l6IFfi9FnFwg/+zHFd7v4FM7k3Ory
 +VI5cTP7n7MXWgbySgWQlGBxnViDu5LXeJuoxak+GpPn8x0itUflWj45BcPkEuDIlVZZ
 tLoo7ikNViDGZd9/DdY0mzblCX7cExRWHsvQCcICmhZZCCqoWHp4sHbxRUgvnI+z8nH0
 jECyS1RHeTKrJ4PbgfpZtEgc4oQGc5Rt0S9wVETmyH6Xzn0jNOJcScSLGnjEk9tDICOS
 Sd3w==
X-Gm-Message-State: AOAM532WpzueFIfsNJhbQdukFLMPk5O2PiBHhtsu2SVW1Bx4d0DDsE2w
 /H4nKRCZqpG6fzf4PE8yz67Rkg==
X-Google-Smtp-Source: ABdhPJzkJpoFBZc9+ZhpIFELDCOcTEj/C+Zz7DUJYI64BhVlkksxaD6YnO/+9eckvqmOtFszgXlbHQ==
X-Received: by 2002:a05:6000:1c8:b0:207:af9e:a4ec with SMTP id
 t8-20020a05600001c800b00207af9ea4ecmr901871wrx.9.1650569553174; 
 Thu, 21 Apr 2022 12:32:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w9-20020adf8bc9000000b0020ac0a63b3esm1833578wra.51.2022.04.21.12.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:32:32 -0700 (PDT)
Message-ID: <e1d362c8-d746-5cdf-8192-efd776ddc8dc@mind.be>
Date: Thu, 21 Apr 2022 21:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220410210700.1175518-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220410210700.1175518-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: fix openssl build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2022 23:07, Fabrice Fontaine wrote:
> Fix the following openssl build failure raised since bump to version
> 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/bin/arc-buildroot-linux-gnu-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -I/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include -I/usr/kerberos/include  -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib -o fetchmail socket.o getpass.o fetchmail.o env.o idle.o options.o daemon.o driver.o transact.o sink.o smtp.o idlist.o uid.o mxget.o md5ify.o cram.o gssapi.o opie.o interface.o netrc.o unmime.o conf.o checkalias.o uid_db.o lock.o rcfile_l.o rcfile_y.o ucs/norm_charmap.o fm_realpath.o  pop3.o imap.o etrn.o odmr.o     libfm.a  strlcpy.o strlcat.o  /usr/lib/libssl.so /usr/lib/libcrypto.so
> /usr/lib/libssl.so: file not recognized: file format not recognized
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/815f18f25017be178d478458c48712d9a8570d5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...c-fix-cross-compilation-with-openssl.patch | 56 +++++++++++++++++++
>   package/fetchmail/fetchmail.mk                |  2 +
>   2 files changed, 58 insertions(+)
>   create mode 100644 package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
> 
> diff --git a/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch b/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
> new file mode 100644
> index 0000000000..fff848196a
> --- /dev/null
> +++ b/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
> @@ -0,0 +1,56 @@
> +From 262aa59c1a7a7100e1dd4e73a6d0112d9becc701 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 1 Apr 2022 19:23:06 +0200
> +Subject: [PATCH] configure.ac: fix cross-compilation with openssl
> +
> +Don't call AC_LIB_LINKFLAGS when the libraries are retrieved through
> +pkg-config to avoid the following build failure when cross-compiling
> +raised since commit 77503f545d2806d07ab83c59ed9a96f435d281da:
> +
> +/home/autobuild/autobuild/instance-5/output-1/host/bin/arc-buildroot-linux-gnu-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -I/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include -I/usr/kerberos/include  -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib -o fetchmail socket.o getpass.o fetchmail.o env.o idle.o options.o daemon.o driver.o transact.o sink.o smtp.o idlist.o uid.o mxget.o md5ify.o cram.o gssapi.o opie.o interface.o netrc.o unmime.o conf.o checkalias.o uid_db.o lock.o rcfile_l.o rcfile_y.o ucs/norm_charmap.o fm_realpath.o  pop3.o imap.o etrn.o odmr.o     libfm.a  strlcpy.o strlcat.o  /usr/lib/libssl.so /usr/lib/libcrypto.so
> +/usr/lib/libssl.so: file not recognized: file format not recognized
> +
> +This build failure is raised because AC_LIB_LINKFLAGS will override the
> +pkg-config target libraries by the host openssl libraries:
> +
> +configure: Enabling OpenSSL support in /home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr.
> +configure: SSL-check: trying pkg-config for openssl
> +checking for SSL... yes
> +checking how to link with libssl... /usr/lib/libssl.so /usr/lib/libcrypto.so
> +configure: From pkg-config: Adding /usr/lib/libssl.so /usr/lib/libcrypto.so to LIBS. LDFLAGS= -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/815f18f25017be178d478458c48712d9a8570d5a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.com/fetchmail/fetchmail/-/merge_requests/42]
> +---
> + configure.ac | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index bd042d51..80e5bf91 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -838,15 +838,13 @@ else
> +     PKG_CHECK_MODULES([SSL],[$i],[
> + 	  set -- $SSL_LIBS
> + 	  while test $# -ge 1 ; do
> +-		  case $1 in -l*|lib*) :                     ;;
> ++		  case $1 in -l*|lib*) LIBS="$LIBS $1"       ;;
> + 				    *) LDFLAGS="$LDFLAGS $1" ;;
> + 		  esac
> + 		  shift
> + 	  done
> + 	  CPPFLAGS="$SSL_CFLAGS $CPPFLAGS"
> +-	  AC_LIB_LINKFLAGS([ssl], [crypto])
> +-	  AS_MESSAGE([From pkg-config: Adding $LIBSSL to LIBS. LDFLAGS=$LDFLAGS])
> +-	  LIBS="$LIBS $LIBSSL"
> ++	  AS_MESSAGE([From pkg-config: $SSL_LIBS])
> + 	  found=1
> + 	  break],[: ignore-error])
> +     done
> +--
> +2.35.1
> +
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> index b97f01a423..25dfcae87b 100644
> --- a/package/fetchmail/fetchmail.mk
> +++ b/package/fetchmail/fetchmail.mk
> @@ -12,6 +12,8 @@ FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
>   FETCHMAIL_LICENSE_FILES = COPYING
>   FETCHMAIL_CPE_ID_VENDOR = fetchmail
>   FETCHMAIL_SELINUX_MODULES = fetchmail mta
> +# We're patching configure.ac
> +FETCHMAIL_AUTORECONF = YES
>   
>   FETCHMAIL_CONF_OPTS = \
>   	--with-ssl=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
