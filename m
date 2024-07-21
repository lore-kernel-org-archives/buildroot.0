Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D82C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 741B66068A;
	Sun, 21 Jul 2024 16:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOeZZHY8azRB; Sun, 21 Jul 2024 16:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 745596068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745596068B;
	Sun, 21 Jul 2024 16:32:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0B71BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B53540308
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei0Hhh5UNhFY for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E718240301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E718240301
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E718240301
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:32:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB8C820002;
 Sun, 21 Jul 2024 16:32:06 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:32:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721183206.33f2bed7@windsurf>
In-Reply-To: <20240721090617.375263-1-fontaine.fabrice@gmail.com>
References: <20240721090617.375263-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TV1kzQjXlFfwWCcw0jtPKp1+dUkNJ4e1pJCAi2qw3o=;
 b=EWfk7gLl/BQGzTNaBBnzYDqy2VLmspWV4Vzje5XVbEv7AwD0BFkr8YiLxBv4sauY8Htk7o
 vms3ty6qc66ldLNCR0lvV9fAK7CxRKDHmFcNdkTNG15iXiR+vJewXAc9qt6d+lrrqwrO56
 1FgpulVoVX7PQYv1EADjvzifHwmIgalqOewWrPVgV+TNehVOahgnUYH1ficj4dhtUuA9MF
 q3mtBTq0jc4zc0fo7sUqvYXcutycMluf+xAi/9uj+nSU3I1vbwE0j1Vm0rSLGgJeCIBWX4
 sjNJm5/FAdVQF9o4730p8WYBvNmm438av5rRTf57dp7eiSqL/mEEhveU+2ncAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EWfk7gLl
Subject: Re: [Buildroot] [PATCH 1/1] package/rtmpdump: bump to latest git
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 11:06:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (not needed since
> https://git.ffmpeg.org/gitweb/rtmpdump.git/commit/06142d3ef4754c9ebd6c4c5f52c858aa63811161)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                          |  1 -
>  package/rtmpdump/0001-include-limits.h.patch | 39 --------------------
>  package/rtmpdump/rtmpdump.hash               |  2 +-
>  package/rtmpdump/rtmpdump.mk                 |  2 +-
>  4 files changed, 2 insertions(+), 42 deletions(-)
>  delete mode 100644 package/rtmpdump/0001-include-limits.h.patch

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
