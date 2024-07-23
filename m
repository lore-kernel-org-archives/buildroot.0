Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B65C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6250600C7;
	Tue, 23 Jul 2024 21:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCSU_T_t0h_l; Tue, 23 Jul 2024 21:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E364A60645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E364A60645;
	Tue, 23 Jul 2024 21:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D89FF1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D295640477
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSlEhV-7ulre for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4067A40319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4067A40319
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4067A40319
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:03:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A63260007;
 Tue, 23 Jul 2024 21:03:50 +0000 (UTC)
Date: Tue, 23 Jul 2024 23:03:49 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723230349.71d7de8b@windsurf>
In-Reply-To: <20240723162533.549929-1-fontaine.fabrice@gmail.com>
References: <20240723162533.549929-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721768630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohLYAUhRXt5Uzv9o2sIfNUB/jWlLnT/4GicqwSEEBSA=;
 b=KpQNTYd9sKAYsCcP4Z4kgxfl1DoqV6wim9hru2uULIOGByvmSAQ3tKKazMNlZDTNZando9
 40yh47u/+NBRRm+fsiQY1UNN9p5i6xx9CDLe2034Z/rT6KEDrrl7oVWAc0zFHmErJkiAeu
 Q1xz9invMs6Mpi79dGtVLI+lF2/W8zwAhMyyGrcMf1U8dwXzUbee3m6yjRXmu6APfq5d0B
 uvClQ7ALBmKqYpCcrfDC7jquLs6rPfEgMyTwE8M0F6neYFPRHRrqNIbdz/PgOQFK//iyE6
 A4hlEuokVVxZ0gA2b7cd6SreRjmUAWLqhwiLbeVxQd6sYKYheB521mhR8SGDUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KpQNTYd9
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-apps: fix build with gcc >=
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 18:25:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Workaround for glibc 2.31 added by commit
> bbe170dbcf4ddb63e76299214e2c18b16e5cf016 back in 2020 is incorrect as it
> writes new_time (a pointer on time_t) into timespec.tv_sec (i.e. time_t).
> This mistake raises the following build failure with gcc >= 14:
> 
> dvbdate.c: In function 'set_time':
> dvbdate.c:313:18: error: assignment to '__time_t' {aka 'long int'} from 'time_t *' {aka 'long int *'} makes integer from pointer without a cast [-Wint-conversion]
>   313 |         s.tv_sec = new_time;
>       |                  ^
> 
> It shall be noted that gentoo also spotted this mistake:
> https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files?id=81e99f1c753d1cb564be29b22dcd8927830c4b9a
> 
> Fixes: bbe170dbcf4ddb63e76299214e2c18b16e5cf016
>  - http://autobuild.buildroot.org/results/e99b9ebf602d307fbc32f2a367e95177f53a68f9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dvb-apps/0006-fix-glibc-2.31.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks. However, I'm wondering if we shouldn't also
remove this package. It is considered legacy
by https://www.linuxtv.org/projects.php. Its repository at
https://linuxtv.org/legacy-hg/dvb-apps is broken (no CSS) and has
seen no commit since 2014. So I believe we could drop it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
