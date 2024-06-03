Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD89C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 10:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A70605E4;
	Mon,  3 Jun 2024 10:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RElsOwCOSZJP; Mon,  3 Jun 2024 10:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D755F60741
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D755F60741;
	Mon,  3 Jun 2024 10:23:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56B871BF31A
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D3B7401AE
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4XG31B-dC18 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 10:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1027140109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1027140109
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1027140109
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 10:23:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EA732000C;
 Mon,  3 Jun 2024 10:23:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sE4qO-002Y4S-2k;
 Mon, 03 Jun 2024 12:23:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240601223120.2123976-1-romain.naour@smile.fr>
Date: Mon, 03 Jun 2024 12:23:12 +0200
In-Reply-To: <20240601223120.2123976-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 2 Jun 2024 00:31:19 +0200")
Message-ID: <87frtujpf3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > When systemd and tpm2-tss with fapi support are enabled, the fakeroot
 > script fail with:

 >     <stdin>:35: Failed to resolve user 'tss': No such process.

 > When fapi support is enabled, tpm2-tss package install additionnal
 > configuration files that are expecting tss user and group exist [1].

 >   /etc/sysusers.d/tpm2-tss.conf
 >   /etc/tmpfiles.d/tpm2-tss-fapi.conf

 > The build fail in the fakeroot environment while handling tmpfiles
 > installed by tpm2-tss with fapi by host-systemd.

 > tss user and group is currently created by the tpm2-abrmd package but
 > tpm2-tss package also provide a udev rule file tpm-udev.rules [2] that
 > set the ownership of dev nodes /dev/tpmX and /dev/tpmrmX to tss
 > user/group. So tpm2-tss package must define TPM2_TSS_USERS to create
 > tss user and group, not tpm2-abrmd package.

 > So, move TPM2_ABRMD_USERS to TPM2_TSS_USERS.

 > Note: tpm2-abrmd is nowadays deprecated since the in-kernel Ressource
 >       Manager (available since kernel 4.12) is prefered [3].

 > [1] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/INSTALL.md?plain=1#L184
 > [2] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/dist/tpm-udev.rules
 > [3] https://github.com/tpm2-software/tpm2-abrmd/blob/3.0.0/README.md?plain=1#L39

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
