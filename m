Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065A0D6E2A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 09:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A25A360689;
	Thu, 21 Nov 2024 09:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kx6XphdlFzxn; Thu, 21 Nov 2024 09:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70F6606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70F6606A7;
	Thu, 21 Nov 2024 09:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2321B8E
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 09:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A16DC6067E
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 09:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKObeTdSOSVN for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 09:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 028A560689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 028A560689
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 028A560689
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 09:45:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67F5D1C000B;
 Thu, 21 Nov 2024 09:45:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tE3kC-004d87-2m;
 Thu, 21 Nov 2024 10:45:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20241103143751.756123-1-romain.naour@smile.fr>
Date: Thu, 21 Nov 2024 10:45:00 +0100
In-Reply-To: <20241103143751.756123-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sun, 3 Nov 2024 15:37:51 +0100")
Message-ID: <87ed34syxv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/mender/x86_64/post-image-efi.sh: use
 bash for genimage.sh
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > mender_x86_64_efi_defconfig started failing to build since 2024.08 in
 > our Gitlab-ci since the board/mender/x86_64/post-image-efi.sh is
 > calling support/scripts/genimage.sh with the host default shell.

 > There is no problem if the default shell is bash but our docker
 > image uses dash as default shell. Since support/scripts/genimage.sh
 > is actually a bash script it's not going to work if bashisms are used:

 >   support/scripts/genimage.sh: 57: Syntax error: redirection unexpected

 > Indeed bashisms have been added recently in
 > support/scripts/genimage.sh by the commit introducing bmap image
 > support [1].

 > Remove "sh" before support/scripts/genimage.sh and rely on
 > "/usr/bin/env bash" to find the bash interpreter.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226891

 > [1] 6889056f1eb4293de67c28b1ff6ee34be05d2ee4

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > I checked if "sh support/scripts/genimage.sh" is used somewhere else.

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
