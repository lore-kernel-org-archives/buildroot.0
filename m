Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EDFC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 10:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C286813DC;
	Mon, 20 Feb 2023 10:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C286813DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRXD5pX_nNTx; Mon, 20 Feb 2023 10:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5496813DF;
	Mon, 20 Feb 2023 10:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5496813DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCC901BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B269840168
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B269840168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWQI0PxGgRgw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 10:03:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F0FD400F6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F0FD400F6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 10:03:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j2so322115wrh.9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 02:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YVIeDM9gJFJfgxSnytBNPDCZ/idC3rtnncoamUqqDdw=;
 b=iGNwndIkezHPgYLI1gCq+9D2FqQZT+sjLTouHrTWGJd3loZ9btEvmlsKuwxqnJg2bO
 V/NkoDewG03miZWUrV3lzFntoWYn8pIP8nFLjoQBBgmSBTrG77TJCO0beN5qWza9L/4N
 yMBnF97rqm/BJgqFnP1oxM7BIgvTMxoTtpUD1HzBqcp6RntJ1YuujhzgGKCh+eQWqDvj
 /opeOnq/5DkzMnhjvVK4FUSMdjq7RiTDjRzIJGpvhKQspRLvnPsj7rP6Zas0J+UGPKz5
 2l5Ci4Ikob0lOpvOzaFYtLYHdnn/AsaUBv5KJTM4y9M5oLuq5sKBEpkKclfdhmTWs3a4
 /p0A==
X-Gm-Message-State: AO0yUKWfkT+6MLlKJY/rY0Vw7qcztzI1p1nxlwVEKyM7CODs2j3DmzN2
 odbGbf8e1mqFnNmHXZkVxwSDYeXX8UI=
X-Google-Smtp-Source: AK7set9oCSxKd6Dt79GibzgjKokxhMIfQcTRanB6xyOzsONKTFuhfKwNhCUn5j4N2+vkx7ILxPxB7A==
X-Received: by 2002:a5d:6a10:0:b0:2bf:b661:87d9 with SMTP id
 m16-20020a5d6a10000000b002bfb66187d9mr1096799wru.50.1676887396610; 
 Mon, 20 Feb 2023 02:03:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003dc0cb5e3f1sm12946769wmq.46.2023.02.20.02.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 02:03:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 11:03:09 +0100
Message-Id: <20230220100309.116832-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YVIeDM9gJFJfgxSnytBNPDCZ/idC3rtnncoamUqqDdw=;
 b=h1XgebEKqEIVBhI8mFhWb4HQSErDAybu8v/7r3wds6vvQNh/ndWq/eCVgVKc1GkZ5B
 SBnWdmKG5bYc6esh5tSV93KfiWFjq2VK43AK/Ae4+LLXxg3RIZxDM9lem/D36RwcEUgN
 IAC4qr6z6enbjJLmRQii3k/IoVITfeA2SqagHTnRPYU+esHyl1Ar093s6i5XzKIwc3p/
 1ykGc0rcPPX3bg9OU8ranY7fFwdzMUk6ZnNsPonQwIZw8TFdUSEE6GDe52PG30XWWLco
 /0BqSNIVS4FaDIQz9ga9xwJpkPaSt5sVxNC8t+jT+7h5DwnekSjE3c4W5r53UX46OmOD
 cjMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h1XgebEK
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require FileHandle perl package for syslinux
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

syslinux needs FileHandle module:

Can't locate FileHandle.pm in @INC (you may need to install the FileHandle module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl line 8.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl line 8.
/home/buildroot/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-gnu-gcc -Wp,-MT,errlist.o,-MD,./.errlist.o.d -Os -march=i386 -falign-functions=0 -falign-jumps=0 -falign-labels=0 -ffast-math -fomit-frame-pointer -std=gnu99 -m32 -mpreferred-stack-boundary=2 -fno-stack-protector -fwrapv -freg-struct-return -fPIC -fno-exceptions -fno-asynchronous-unwind-tables -fno-strict-aliasing -falign-functions=0 -falign-jumps=0 -falign-labels=0 -falign-loops=0 -g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include -I. -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/sys -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/../include -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/include/sys -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/core/include -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/ -I/home/buildroot/autobuild/instance-0/output-1/bu
 ild/syslinux-6.03/com32/lib/sys/module -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/bios/com32/lib//../.. -W -Wall -Wstrict-prototypes  -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO -DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME -DPNG_NO_WRITE_tIME -mregparm=3 -DREGPARM=3 -c -o errlist.o errlist.c
cc1: fatal error: errlist.c: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/de88089888b2ca354b28af3550abf846560da7d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 4353e9585e..a692856d31 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -298,6 +298,10 @@ if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
     required_perl_modules="${required_perl_modules} JSON::PP"
 fi
 
+if grep -q ^BR2_TARGET_SYSLINUX=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules FileHandle"
+fi
+
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
