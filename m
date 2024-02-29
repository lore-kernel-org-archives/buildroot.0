Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F247FC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 17:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE4B822AA;
	Thu, 29 Feb 2024 17:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQqbptOnBJjf; Thu, 29 Feb 2024 17:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85BD822C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85BD822C0;
	Thu, 29 Feb 2024 17:48:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACDA1BF2B0
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 17:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8803841B72
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 17:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqmiCyi0xJSn for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 17:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 476CD41B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 476CD41B71
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 476CD41B71
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 17:48:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 737D2240002;
 Thu, 29 Feb 2024 17:48:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfkWE-004unz-2N;
 Thu, 29 Feb 2024 18:48:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240229171302.2565579-1-yann.morin.1998@free.fr>
Date: Thu, 29 Feb 2024 18:48:30 +0100
In-Reply-To: <20240229171302.2565579-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 29 Feb 2024 18:12:57 +0100")
Message-ID: <874jdrduvl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCHv2] support/scripts/cve: fix running on older
 ijson versions
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 22b69455526f (support/scripts/cve.py: switch from NVD to FKIE for
 > the JSON files) had to change the decompressor from gz to xz, as the new
 > location is using xz compression.

 > That commit mentioned that it was spawning an external xz process to do
 > the decompression, on the pretence that "there is no xz decompressor in
 > Python stdlib."

 > Before version 3.1, ijson.items() only accepted a file-like object as
 > input (that file-like object could yield bytes() or str(), both were
 > supported). Starting with version 3.1, ijson.items() also accepts that
 > it be directly passed bytesd() or str() directly. subprocess.check_output()

s/bytesd/bytes/.

Committed with that fixed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
