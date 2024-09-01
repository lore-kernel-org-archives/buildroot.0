Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606A3C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 08:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F131A6066C;
	Sun,  1 Sep 2024 08:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wH8KZf9xa8od; Sun,  1 Sep 2024 08:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B196068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B196068B;
	Sun,  1 Sep 2024 08:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58701BF3AA
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 08:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 925E040176
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 08:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxYmXeshkPSb for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 08:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 693A740021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 693A740021
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 693A740021
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 08:49:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E24EBE0002;
 Sun,  1 Sep 2024 08:49:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skgHM-000jcl-0D;
 Sun, 01 Sep 2024 10:49:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Danomi Manchego <danomimanchego123@gmail.com>
References: <20240726094603.10333-1-danomimanchego123@gmail.com>
Date: Sun, 01 Sep 2024 10:49:47 +0200
In-Reply-To: <20240726094603.10333-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Fri, 26 Jul 2024 05:46:03 -0400")
Message-ID: <875xrfvjv8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] libpwquality: fix PAM module path
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
Cc: Stefan =?utf-8?Q?S=C3=B8rensen?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > The libpwquality package provides the pam_pwquality PAM module - the
 > replacement for pam_cracklib that was dropped from linux-pam back in
 > version 1.5.0.  However, it currently installs it to the wrong place,
 > so passwd and friends fail to find it.  This commit sets the security
 > directory path to /lib/security to match the corresponding setting in
 > linux-pam.mk.

 > Note that libpwquality has *always* installed pam_pwquality in the wrong
 > place, since version 1.3.0 was added to buildroot in 2017 in commit
 > 462040443ca943694fc59ec8380c82f8bf9aaddc.  However, back then, linux-pam
 > version 1.3.0 still provided pam_cracklib for advanced password checking.
 > Linux-pam deprecated pam_cracklib in 1.4.0 but still built it for us when
 > linux-pam.mk set --enable-cracklib.  Linux-PAM deleted pam_cracklib
 > altogether in 1.5.0, so it was not until our update to linux-pam-1.5.1
 > in commit 276f1e0a896698abec85500a86686bf72c79eb91 that pam_cracklib
 > became unavailable.  After that point, pam_pwquality was the only
 > alternative for PAM-based password checking.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

 > ---

 > Changes v1 -> v2:
 >     - Add more context to when advanced password checking broke
 >       as suggested by Thomas Petazzoni.

Great commit message, thanks!

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
