Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30833C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFABC847E0;
	Sat,  1 Jun 2024 21:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sX4Jg9aIpRzX; Sat,  1 Jun 2024 21:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7A2847B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7A2847B1;
	Sat,  1 Jun 2024 21:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4011BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A34F847C6
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_-QojaCRmRo for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 21:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0E0B847B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E0B847B4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0E0B847B4
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 21:01:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09636240004;
 Sat,  1 Jun 2024 21:01:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sDVqn-00HCBK-1J;
 Sat, 01 Jun 2024 23:01:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastien Laveze <slaveze@smartandconnective.com>
References: <20240529072911.288748-1-slaveze@smartandconnective.com>
Date: Sat, 01 Jun 2024 23:01:17 +0200
In-Reply-To: <20240529072911.288748-1-slaveze@smartandconnective.com>
 (Sebastien Laveze's message of "Wed, 29 May 2024 09:29:10 +0200")
Message-ID: <87ed9gl6n6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mosquitto: add target
 mosquitto_passwd
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sebastien" == Sebastien Laveze <slaveze@smartandconnective.com> writes:

 > The mosquitto_passwd utility is useful on target if user accounts need
 > to be created runtime.

 > Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>

Looking at the build logic for mosquitto_passwd (and mosquitto_ctrl) I
see they need openssl (and cjson for mosquitto_ctrl). They don't make a
lot of sense without the broker and they are really tiny compared to the
libraries and the broker, so I have changed the patch to automatically
build them if the broker is enabled and the needed libraries.

ls -lahS target/usr/sbin/mosquitto target/usr/bin/mosquitto_* target/usr/lib/libssl.so.3 target/usr/lib/libcrypto.so.3 target/usr/lib/libcjson.so.1.7.18
-rwxr-xr-x 1 peko peko 4.8M Jun  1 00:42 target/usr/lib/libcrypto.so.3
-rwxr-xr-x 1 peko peko 968K Jun  1 00:42 target/usr/lib/libssl.so.3
-rwxr-xr-x 1 peko peko 266K Jun  1 00:42 target/usr/sbin/mosquitto
-rwxr-xr-x 1 peko peko  58K Jun  1 00:42 target/usr/bin/mosquitto_rr
-rwxr-xr-x 1 peko peko  58K Jun  1 00:42 target/usr/bin/mosquitto_sub
-rwxr-xr-x 1 peko peko  54K Jun  1 00:42 target/usr/bin/mosquitto_ctrl
-rwxr-xr-x 1 peko peko  50K Jun  1 00:42 target/usr/bin/mosquitto_pub
-rwxr-xr-x 1 peko peko  34K Jun  1 00:42 target/usr/lib/libcjson.so.1.7.18
-rwxr-xr-x 1 peko peko  26K Jun  1 00:42 target/usr/bin/mosquitto_passwd

And committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
