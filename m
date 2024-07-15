Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C308C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6714051E;
	Mon, 15 Jul 2024 10:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmKcMqa6rmTY; Mon, 15 Jul 2024 10:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E904052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E904052D;
	Mon, 15 Jul 2024 10:20:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 784721BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72EC56076D
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qm7AA5MoqK_a for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 553C46070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553C46070D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 553C46070D
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:20:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40BFF1BF208;
 Mon, 15 Jul 2024 10:20:46 +0000 (UTC)
Date: Mon, 15 Jul 2024 12:20:43 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20240715122043.0493514f@windsurf>
In-Reply-To: <20231123104124.28369-1-nicolas.cavallari@green-communications.fr>
References: <20231123104124.28369-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721038846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4B9HiuQBvI6/8vnKRBRbT0L9rn8bMxvQkAg4m0zfNw=;
 b=gnLmBY9fQDhDBNZl9aCfHrEBSM+Mh5t54NCJhVmoVtqWmSe/ZRfTCGwQW8f0hMQCjWa/QP
 6jT+Gwq0bSiBZ7REy6eWlRxU+9C9V/zzFMK8nVuFd9uRKlRqv0I+yhBpPeZIlDxEvXu40p
 Lqfan7yU2AUwSn5NcCQQkslY+5V6IqxpKWCmScEh2Bxg5VLdpvAzdtXL4n9CflR2TT8dan
 tCnB+JxY49YRGlFFD/idlfcN8Xq1YW2mLtxr4ND4ZZo6w9LI9uOdaTEL7QL11S1PpHOBs/
 UHB1d+dq+aIes57OqJ6+pFWJVeWK6DLIZM7vokouPzAuA5eEAfvW8523RGyoMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gnLmBY9f
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: refactor S50sshd
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

Hello Nicolas,

On Thu, 23 Nov 2023 11:39:52 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Make it look more like the example S01syslogd shell script in
> docs/manual/adding-packages-directory.txt.
> 
> Functionnally, it changes the following:
> - Options can be defined in /etc/default/sshd
> - "S50sshd stop" will no longer kill active SSH sessions or sshd daemons
>   that run inside a container or chroot.  It is now safe to stop or
>   restart openssh inside an SSH session.
> - "S50sshd restart" now sleeps between stop and start, reducing the
>   probability of failures caused by sshd taking too much time to stop.
> - "S50sshd reload" will send a SIGHUP instead of restarting sshd.
> - /var/lock/sshd is no longer created.  The daemon does not use it.
>   The only reference to /var/lock is in contrib/redhat/sshd.init, which
>   uses it as a way to test if sshd is (supposed to be) running.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/openssh/S50sshd | 75 +++++++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 26 deletions(-)

Sorry for the slow feedback. There's been more recent discussion
related to init scripts, and these lead to changes in S01syslogd, and a
following improvement of S50sshd to align it with the changes in
S01syslogd. Therefore your patch is in fact no longer needed I believe,
but don't hesitate to check if S50sshd is OK.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
