Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9DEC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A708F403D4;
	Sat, 20 Jul 2024 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7soMKhYAgyh; Sat, 20 Jul 2024 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31438403DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31438403DF;
	Sat, 20 Jul 2024 21:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0F91BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291B440151
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7XCqVsHi_4f for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B666B400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B666B400D8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B666B400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:00:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AEC51BF205;
 Sat, 20 Jul 2024 21:00:20 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:00:19 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230019.72b43f74@windsurf>
In-Reply-To: <20240720142629.747083-1-fontaine.fabrice@gmail.com>
References: <20240720142629.747083-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ifcpt3bvygBWNnWkeEhUHaZpcVfOFIae1GD1iEUPAe8=;
 b=QcbfreDva07hWQsyXgdanKqx44n1XLUuuEg1qHJdbSoZxCJmUt256DJrSV5PTPb9TFp+rg
 bVXtPFF1WplT8AUbiUQiGdoYO6ccqZhnG3vMj1RK/4TPQ0TDN0NCeZU5N+dM6kT63hDaba
 ysO6w53N1apI7wyAF+bfFlFUkciVTZ9Lmsq+/r/yTMO7KJXv4X6Nxn4YDDM2k18FeyOmQ1
 9Zf5AGjy6Kp+ITwwHSWG6RfSWVusN+zubK8p9+OpBtNsiwy2C5xOZ81OP1aTmAOnCpmvuW
 Bt3+AT+gL8WDvrw+t+Sh4Id3OKKwAX+2OEhPxL78CRjZbwYfY6Y4bPKYwrixWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QcbfreDv
Subject: Re: [Buildroot] [PATCH 1/1] package/autossh: fix build with gcc >=
 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 16:26:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Include stdio.h to avoid that __progname check wrongly returned that
> the function is unavailable with gcc >= 14 which enables
> -Werror=implicit-function-declaration
> (https://gcc.gnu.org/gcc-14/porting_to.html):
> 
> configure:5231: checking if libc defines __progname
> configure:5249: /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
> conftest.c: In function 'main':
> conftest.c:73:27: error: implicit declaration of function 'printf' [-Wimplicit-function-declaration]
>    73 |  extern char *__progname; printf("%s", __progname);
>       |                           ^~~~~~
> conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 'printf'
>     1 | /* confdefs.h */
> conftest.c:73:27: warning: incompatible implicit declaration of built-in function 'printf' [-Wbuiltin-declaration-mismatch]
>    73 |  extern char *__progname; printf("%s", __progname);
>       |                           ^~~~~~
> conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 'printf'
> 
> resulting in the following static build failure:
> 
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): multiple definition of `__progname'; autossh.o:(.bss+0x120): first defined here
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....ac-fix-__progname-check-with-gcc-14.patch | 52 +++++++++++++++++++
>  package/autossh/autossh.mk                    |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
