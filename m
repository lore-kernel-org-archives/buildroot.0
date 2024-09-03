Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3C8CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F93B6059D;
	Tue,  3 Sep 2024 18:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuLsZ2YS8lsT; Tue,  3 Sep 2024 18:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 372B0605A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372B0605A9;
	Tue,  3 Sep 2024 18:04:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE37E1BF356
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBF52605A9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDGCQXBYdsaA for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD9836059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD9836059D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD9836059D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:04:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 689D6240005;
 Tue,  3 Sep 2024 18:04:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slXt6-004psk-2X;
 Tue, 03 Sep 2024 20:04:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240725073908.598145-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Sep 2024 20:04:20 +0200
In-Reply-To: <20240725073908.598145-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 25 Jul 2024 09:39:08 +0200")
Message-ID: <87cylkobq3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mokutil: force libopenssl
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mokutil unconditionally uses X509_get0_subject_key_id resulting in the
 > following build failure with libressl since its addition in commit
 > 2e6e121496bfcbe09c018558be13733077b6df9b:

 > /home/autobuild/autobuild/instance-18/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/13.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
 > mokutil-efi_x509.o: in function `get_cert_skid':
 > efi_x509.c:(.text+0x4e6): undefined reference to `X509_get0_subject_key_id'

 > Fixes: 2e6e121496bfcbe09c018558be13733077b6df9b
 >  - http://autobuild.buildroot.org/results/88b549734eae4b25de1b8e1c4f04bace0a7e7418
 >  - http://autobuild.buildroot.org/results/05ac319bfb2a252f3dcdc5d04761f276afb53b6f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
