Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12C3C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636A440656;
	Sat,  8 Jun 2024 18:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh6wE5W5sE8F; Sat,  8 Jun 2024 18:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F8D40607
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F8D40607;
	Sat,  8 Jun 2024 18:18:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FBA21BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B961405EF
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03Gs1TtR-53j for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E61CD404CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E61CD404CC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E61CD404CC
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:18:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD815E0004;
 Sat,  8 Jun 2024 18:18:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0eD-002Hd3-13;
 Sat, 08 Jun 2024 20:18:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240601223120.2123976-1-romain.naour@smile.fr>
 <87frtujpf3.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 20:18:37 +0200
In-Reply-To: <87frtujpf3.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 03 Jun 2024 12:23:12 +0200")
Message-ID: <87cyorwb5u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/tpm2-tss: create tss user and
 group for tpm /dev nodes
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
 >> When systemd and tpm2-tss with fapi support are enabled, the fakeroot
 >> script fail with:

 >> <stdin>:35: Failed to resolve user 'tss': No such process.

 >> When fapi support is enabled, tpm2-tss package install additionnal
 >> configuration files that are expecting tss user and group exist [1].

 >> /etc/sysusers.d/tpm2-tss.conf
 >> /etc/tmpfiles.d/tpm2-tss-fapi.conf

 >> The build fail in the fakeroot environment while handling tmpfiles
 >> installed by tpm2-tss with fapi by host-systemd.

 >> tss user and group is currently created by the tpm2-abrmd package but
 >> tpm2-tss package also provide a udev rule file tpm-udev.rules [2] that
 >> set the ownership of dev nodes /dev/tpmX and /dev/tpmrmX to tss
 >> user/group. So tpm2-tss package must define TPM2_TSS_USERS to create
 >> tss user and group, not tpm2-abrmd package.

 >> So, move TPM2_ABRMD_USERS to TPM2_TSS_USERS.

 >> Note: tpm2-abrmd is nowadays deprecated since the in-kernel Ressource
 >> Manager (available since kernel 4.12) is prefered [3].

 >> [1] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/INSTALL.md?plain=1#L184
 >> [2] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/dist/tpm-udev.rules
 >> [3] https://github.com/tpm2-software/tpm2-abrmd/blob/3.0.0/README.md?plain=1#L39

 >> Signed-off-by: Romain Naour <romain.naour@smile.fr>

 > Committed, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
