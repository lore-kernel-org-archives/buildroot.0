Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7637CC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9976C812B7;
	Sun, 30 Jun 2024 14:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1sB8CtCiou5; Sun, 30 Jun 2024 14:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC673810B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC673810B0;
	Sun, 30 Jun 2024 14:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 067C31BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 003D540639
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PepLfMNjVFFQ for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13B424062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B424062F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13B424062F
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:45:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-363bd55bcc2so1166154f8f.2
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758703; x=1720363503;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFXeP0vthQDaR8ZdmYB02pihwii8k1kA/r6PK5lHELU=;
 b=YVxwJJvKjlNJZGQAv91q6jVo+BvnWMd6HU+z2+pg8kN331zwbkq4dRegmvvEFAf+GA
 GhY2JYWFOu07nUst3v7vO1nGHPcM0svwgi4lg+XxHmO9j0aRyQ0tybZP9qOmnKNuMUY1
 r01OVZ9YtaoiK1kiH5ra5UFSdHjTJKjk8vhH8Ci7bdVn9AqwH7qjSTr674CkOFhnPKE+
 u2PKW4X0Cgs39nCDARJnFWnL0vsj/gOP+GPEscGm2CVFvtE8hp9E0tR75k+tUm59r6tf
 A/MexvKPpWVSIxIVRfdjCMNmQfjI2++GPpqv0XECkJYbFpH/p4mWBS/3elt1QcTRmqM1
 N9pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0hhRJK3fstgZ6NvzIu5xmh85ABg3fvIuqU3ThwmBFHYj4cfgWeRYaERwuMdOSrTGsICRyu9H/ud9BC7/YXcxvdmQebvaO1w==
X-Gm-Message-State: AOJu0Ywc7I/++WPejvochAt5h+C0jOJrHrPjN3uBYKd83FlW97RqG44G
 s3q1W1hRMBqgA4eHYe8EKKV1yPuzzLsUm2DfCbafhxLbnkRvRISJQOr0z2IPcc3vQSfKRaETmjv
 z
X-Google-Smtp-Source: AGHT+IGgZHn2iYK7fHpBc9YDN/4nzfYpZ7miNzePoJm4StkAzUo88gBa7VCG+5+OiyJBFfKbsH3Edw==
X-Received: by 2002:a5d:45ca:0:b0:35f:ed0:9582 with SMTP id
 ffacd0b85a97d-367756a9285mr2057115f8f.16.1719758701858; 
 Sun, 30 Jun 2024 07:45:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb97esm7622759f8f.89.2024.06.30.07.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:45:01 -0700 (PDT)
Message-ID: <a1f6b7b5-d5b9-4d7c-9145-a812f21accc4@mind.be>
Date: Sun, 30 Jun 2024 16:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240628204617.37898-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20240628204617.37898-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758703; x=1720363503; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cFXeP0vthQDaR8ZdmYB02pihwii8k1kA/r6PK5lHELU=;
 b=P76PIYZwRhPkBNXcn60W8QclFm/X6eIPzeeoG7Xex8Fb8oP69ZQUmkn+25XB6+pjJj
 8EEremjoygJmeFUGT349GLMfiH3/vvwBGmt2/KcRBJKjfUtz1hXdadC7Ex1dlNOc6qN2
 Lc7f8g9wdJ5uWpM8vGr3Sdxvjf5NX3w7H5QtmPJRauB7sB8odgF4PW8/xW4XUP/R78gD
 VO/p+BLqlC5QT6wQbv9CwR5JxGXSVfHtq9y+vmV4sLEQADFL3h+GLisyMou3WJrtoA85
 pky4wmqX8PKVVRxEtnQI4GgAYp8mvNIxJVULLlui0XgeoAYS53Q473vL+V6+6ST/CeiX
 JrRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P76PIYZw
Subject: Re: [Buildroot] [PATCH] package/cgic: drop package
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
Cc: David Bender <codehero@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/06/2024 22:46, Yann E. MORIN wrote:
> The upstream site for cgic is now a parking/phishing site, so we can't
> download cgic anymore.
> 
> The last version was 2.07, released 7 years ago, and nothing uses cgic
> in Buildroot.
> 
> Drop the package.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: David Bender <codehero@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |  3 -
>   Config.in.legacy                              |  6 ++
>   DEVELOPERS                                    |  1 -
>   package/Config.in                             |  1 -
>   package/cgic/0001-prepare_makefile.patch      | 44 ---------------
>   package/cgic/0002-file_enhancements.patch     | 56 -------------------
>   ...3-restore-cgiFormFileGetTempfileName.patch | 43 --------------
>   package/cgic/Config.in                        |  6 --
>   package/cgic/cgic.hash                        |  3 -
>   package/cgic/cgic.mk                          | 25 ---------
>   10 files changed, 6 insertions(+), 182 deletions(-)
>   delete mode 100644 package/cgic/0001-prepare_makefile.patch
>   delete mode 100644 package/cgic/0002-file_enhancements.patch
>   delete mode 100644 package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
>   delete mode 100644 package/cgic/Config.in
>   delete mode 100644 package/cgic/cgic.hash
>   delete mode 100644 package/cgic/cgic.mk
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index ae3fbe8fb0..63171b0c35 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -454,9 +454,6 @@ package/cdrkit/0001-no-rcmd.patch lib_patch.Upstream
>   package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch lib_patch.Upstream
>   package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch lib_patch.Upstream
>   package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
> -package/cgic/0001-prepare_makefile.patch lib_patch.Upstream
> -package/cgic/0002-file_enhancements.patch lib_patch.Upstream
> -package/cgic/0003-restore-cgiFormFileGetTempfileName.patch lib_patch.Upstream
>   package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
>   package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 29c386bec4..9dd5bdd2eb 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>   
>   comment "Legacy options removed in 2024.08"
>   
> +config BR2_PACKAGE_CGIC
> +	bool "cgic has been removed"
> +	select BR2_LEGACY
> +	help
> +	  the cgic upstream no longer exists.
> +
>   config BR2_PACKAGE_VERSAL_FIRMWARE
>   	bool "versal-firmware has been replaced by xilinx-prebuilt"
>   	select BR2_TARGET_XILINX_PREBUILT
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8a5cceba78..6d9fcd97df 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -788,7 +788,6 @@ F:	package/libmnl/
>   
>   N:	David Bender <codehero@gmail.com>
>   F:	package/benejson/
> -F:	package/cgic/
>   F:	package/freeradius-client/
>   F:	package/openldap/
>   
> diff --git a/package/Config.in b/package/Config.in
> index 785d00dbfd..fc1650619b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1949,7 +1949,6 @@ menu "Networking"
>   	source "package/belle-sip/Config.in"
>   	source "package/bluez5_utils-headers/Config.in"
>   	source "package/c-ares/Config.in"
> -	source "package/cgic/Config.in"
>   	source "package/cni-plugins/Config.in"
>   	source "package/cppzmq/Config.in"
>   	source "package/curlpp/Config.in"
> diff --git a/package/cgic/0001-prepare_makefile.patch b/package/cgic/0001-prepare_makefile.patch
> deleted file mode 100644
> index 15adc4cda2..0000000000
> --- a/package/cgic/0001-prepare_makefile.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Makefile: fix for cross-compilation
> -
> -Probably-Signed-off-by: Dave Bender <bender@benegon.com>
> -[yann.morin.1998@free.fr: patch was made by Dave, but he
> - forgot his SoB line, so I added it]
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -diff -rupN cgic206/Makefile cgic206-br/Makefile
> ---- cgic206/Makefile	2014-03-16 18:17:11.000000000 -0400
> -+++ cgic206-br/Makefile	2015-01-16 11:18:03.714874000 -0500
> -@@ -1,15 +1,14 @@
> --CFLAGS=-g -Wall
> --CC=gcc
> --AR=ar
> --RANLIB=ranlib
> - LIBS=-L./ -lcgic
> -
> - all: libcgic.a cgictest.cgi capture
> -
> - install: libcgic.a
> --	cp libcgic.a /usr/local/lib
> --	cp cgic.h /usr/local/include
> --	@echo libcgic.a is in /usr/local/lib. cgic.h is in /usr/local/include.
> -+	cp libcgic.a $(PREFIX)/usr/lib
> -+	cp cgic.h $(PREFIX)/usr/include
> -+	@echo libcgic.a is in $(PREFIX)/usr/lib. cgic.h is in $(PREFIX)/usr/include.
> -+
> -+cgi.o: cgic.c cgic.h
> -+	$(CC) $(CFLAGS) cgic.c -o cgic.o
> -
> - libcgic.a: cgic.o cgic.h
> - 	rm -f libcgic.a
> -@@ -19,10 +18,10 @@ libcgic.a: cgic.o cgic.h
> - #mingw32 and cygwin users: replace .cgi with .exe
> -
> - cgictest.cgi: cgictest.o libcgic.a
> --	gcc cgictest.o -o cgictest.cgi ${LIBS}
> -+	$(CC) cgictest.o -o cgictest.cgi ${LIBS}
> -
> - capture: capture.o libcgic.a
> --	gcc capture.o -o capture ${LIBS}
> -+	$(CC) capture.o -o capture ${LIBS}
> -
> - clean:
> - 	rm -f *.o *.a cgictest.cgi capture
> diff --git a/package/cgic/0002-file_enhancements.patch b/package/cgic/0002-file_enhancements.patch
> deleted file mode 100644
> index a6f82fce33..0000000000
> --- a/package/cgic/0002-file_enhancements.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -Create better temporary files.
> -
> -Probably-Signed-off-by: Dave Bender <bender@benegon.com>
> -[yann.morin.1998@free.fr: patch was made by Dave, but he
> - forgot his SoB line, so I added it; split the patch in two
> -  independent fixes]
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
> ---- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
> -+++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
> -@@ -22,6 +22,8 @@
> - #define CGICDEBUGEND
> - #endif /* CGICDEBUG */
> -
> -+#define _GNU_SOURCE
> -+
> - #include <stdio.h>
> - #include <string.h>
> - #include <ctype.h>
> -@@ -34,11 +36,11 @@
> - #include <io.h>
> -
> - /* cgic 2.01 */
> --#include <fcntl.h>
> -
> - #else
> - #include <unistd.h>
> - #endif /* WIN32 */
> -+#include <fcntl.h>
> - #include "cgic.h"
> -
> - #define cgiStrEq(a, b) (!strcmp((a), (b)))
> -@@ -636,16 +638,17 @@ static cgiParseResultType getTempFileNam
> - 		window between the file's creation and the
> - 		chmod call (glibc 2.0.6 and lower might
> - 		otherwise have allowed this). */
> -+	mode_t umode;
> - 	int outfd;
> -+	umode = umask(0600);
> - 	strcpy(tfileName, cgicTempDir "/cgicXXXXXX");
> --	outfd = mkstemp(tfileName);
> -+	outfd = mkostemp(tfileName, O_CLOEXEC | O_NOATIME);
> -+	umask(umode);
> - 	if (outfd == -1) {
> - 		return cgiParseIO;
> - 	}
> --	close(outfd);
> --	/* Fix the permissions */
> --	if (chmod(tfileName, 0600) != 0) {
> --		unlink(tfileName);
> -+
> -+	if (close(outfd)) {
> - 		return cgiParseIO;
> - 	}
> - #else
> diff --git a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch b/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
> deleted file mode 100644
> index f66227b6a6..0000000000
> --- a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Restore lost functionality
> -
> -Probably-Signed-off-by: Dave Bender <bender@benegon.com>
> -[yann.morin.1998@free.fr: patch was made by Dave, but he
> - forgot his SoB line, so I added it]
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
> ---- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
> -+++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
> -@@ -1278,6 +1278,20 @@ cgiFormResultType cgiFormFileContentType
> - 	}
> - }
> -
> -+const char* cgiFormFileGetTempfileName(
> -+	char* name)
> -+{
> -+	cgiFormEntry *e;
> -+	e = cgiFormEntryFindFirst(name);
> -+	if (!e) {
> -+		return NULL;
> -+	} else if (!strlen(e->tfileName)) {
> -+		return NULL;
> -+	} else {
> -+		return e->tfileName;
> -+	}
> -+}
> -+
> - cgiFormResultType cgiFormFileSize(
> - 	char *name, int *sizeP)
> - {
> -diff -rupN cgic206/cgic.h cgic206_tempfile/cgic.h
> ---- cgic206/cgic.h	2014-03-16 18:17:11.000000000 -0400
> -+++ cgic206_tempfile/cgic.h	2015-01-21 11:53:02.915148026 -0500
> -@@ -141,6 +141,8 @@ extern cgiFormResultType cgiFormRadio(
> - 	char *name, char **valuesText, int valuesTotal,
> - 	int *result, int defaultV);	
> -
> -+extern const char* cgiFormFileGetTempfileName(char* name);
> -+
> - /* The paths returned by this function are the original names of files
> - 	as reported by the uploading web browser and shoult NOT be
> - 	blindly assumed to be "safe" names for server-side use! */
> diff --git a/package/cgic/Config.in b/package/cgic/Config.in
> deleted file mode 100644
> index 402460d039..0000000000
> --- a/package/cgic/Config.in
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_CGIC
> -	bool "cgic"
> -	help
> -	  C CGI library
> -
> -	  http://www.boutell.com/cgic/
> diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
> deleted file mode 100644
> index 2c68067128..0000000000
> --- a/package/cgic/cgic.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256  1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
> -sha256  6a7de92593d64dbf7630d8f66f97e04a899769bef1e055f2434bc06b87b9de62  license.txt
> diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
> deleted file mode 100644
> index cd0841302d..0000000000
> --- a/package/cgic/cgic.mk
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -################################################################################
> -#
> -# cgic
> -#
> -################################################################################
> -
> -CGIC_VERSION = 2.07
> -CGIC_SOURCE = cgic207.tar.gz
> -CGIC_SITE = http://boutell.com/cgic
> -CGIC_LICENSE = Custom
> -CGIC_LICENSE_FILES = license.txt
> -
> -# Installs only a static library and a header file
> -CGIC_INSTALL_STAGING = YES
> -CGIC_INSTALL_TARGET = NO
> -
> -define CGIC_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) libcgic.a
> -endef
> -
> -define CGIC_INSTALL_STAGING_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=$(STAGING_DIR) -C $(@D) install
> -endef
> -
> -$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
