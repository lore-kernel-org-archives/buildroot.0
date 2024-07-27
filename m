Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6417EC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2888540CC3;
	Sat, 27 Jul 2024 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpdMF1Cmr2Np; Sat, 27 Jul 2024 14:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E440140CC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E440140CC7;
	Sat, 27 Jul 2024 14:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE911BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADDC40CC7
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zz1vFK3wCEE2 for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0652E40CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0652E40CC3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0652E40CC3
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:09:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09003E0002;
 Sat, 27 Jul 2024 14:09:04 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:09:03 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240727160903.67519bbf@windsurf>
In-Reply-To: <20240727084248.18600-1-fontaine.fabrice@gmail.com>
References: <20240727084248.18600-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722089345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rY+cT8E1duE/HpIp0cPLkXBDdC8mtup35MVLZb4BZhQ=;
 b=XEpgD0WwRA30gmsyyuJ1ZO2m23Cjtl/xqtfx9HshtRcos+WVsBPudyhOzp51BJu1nW2i8t
 Rn8KXDpQm+oL8fVBJgrcqYuCDmC9cTsDORTxcqbfvMBIVdDHk5CFIJMQ39ElKsGIfG/JB6
 cCft/Z5q4ojk3uZS9M0kIzu6e0KUzl7DKGJuuE9erMdYq6qV0/RIXI9/CyNHerxgRPdXe/
 dliLymLasY+RT9Jhw1sWvOIwKOdUbKlfYorcFUZUzEZ48tq0yZ2ccUU6VHYcpx9Jnfsd6q
 aFYAXfiBt6zifUb597GNKvFL7pulQpA6FYT0u9z3veM0DEAUcNUb1pETO6+CRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XEpgD0Ww
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfs: fix build with gcc >= 14
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

On Sat, 27 Jul 2024 10:42:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14 which enables
> -Werror=implicit-function-declaration
> (https://gcc.gnu.org/gcc-14/porting_to.html):
> 
> nfs-stat.c: In function 'main':
> nfs-stat.c:287:30: error: implicit declaration of function 'ctime' [-Wimplicit-function-declaration]
>   287 |         printf("Access: %s", ctime( (const time_t *) &st.nfs_atime));
>       |                              ^~~~~
> nfs-stat.c:177:1: note: 'ctime' is defined in header '<time.h>'; this is probably fixable by adding '#include <time.h>'
>   176 | #include <pwd.h>
>   +++ |+#include <time.h>
>   177 | char *uid_to_name(int uid)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/73c3828a4e5d275ca0dfdd5b314494e2b00393c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-utils-nfs-stat.c-include-time.h.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch

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
