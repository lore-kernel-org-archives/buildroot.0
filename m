Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75097D743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D936059F;
	Wed, 20 Nov 2024 20:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OMglea68zFO; Wed, 20 Nov 2024 20:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55EA660662
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EA660662;
	Wed, 20 Nov 2024 20:54:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E95AE27D6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6CDA413C6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQkNPJ4oJUBU for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 20:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3D0340AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D0340AEF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3D0340AEF
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:54:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0252FF803;
 Wed, 20 Nov 2024 20:54:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDriM-001ENX-1H;
 Wed, 20 Nov 2024 21:54:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20241029231936.3712769-1-olteanv@gmail.com>
Date: Wed, 20 Nov 2024 21:54:18 +0100
In-Reply-To: <20241029231936.3712769-1-olteanv@gmail.com> (Vladimir Oltean's
 message of "Wed, 30 Oct 2024 01:19:36 +0200")
Message-ID: <87plmptymd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sshguard: patch
 /usr/local/sbin/sshguard path in systemd service
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Vladimir" == Vladimir Oltean <olteanv@gmail.com> writes:

 > The systemd service deployed to the target is derived from an example
 > hardcoded for the /usr/local/sbin/ path, but we install sshguard at
 > /usr/sbin/. Thus, by default we get this error message:

 > $ journalctl -b -u sshguard.service -f
 > systemd[1]: Started SSHGuard - blocks brute-force login attempts.
 > (sshguard)[612]: sshguard.service: Unable to locate executable '/usr/local/sbin/sshguard': No such file or directory
 > (sshguard)[612]: sshguard.service: Failed at step EXEC spawning /usr/local/sbin/sshguard: No such file or directory
 > systemd[1]: sshguard.service: Main process exited, code=exited, status=203/EXEC
 > systemd[1]: sshguard.service: Failed with result 'exit-code'.
 > systemd[1]: sshguard.service: Scheduled restart job, restart counter is at 5.
 > systemd[1]: sshguard.service: Start request repeated too quickly.
 > systemd[1]: sshguard.service: Failed with result 'exit-code'.
 > systemd[1]: Failed to start SSHGuard - blocks brute-force login attempts.

 > Fix up the path in the service after the $(INSTALL) command has run.

 > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
