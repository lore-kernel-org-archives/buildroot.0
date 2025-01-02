Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DA7E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 11:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D1F403BD;
	Thu,  2 Jan 2025 11:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ100_G4lX8M; Thu,  2 Jan 2025 11:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F7CD403B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F7CD403B8;
	Thu,  2 Jan 2025 11:09:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA33F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DFC160769
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlKxNvx7VcvG for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 11:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 788C260674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 788C260674
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 788C260674
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:09:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D53040009;
 Thu,  2 Jan 2025 11:09:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tTJ50-002qZC-24;
 Thu, 02 Jan 2025 12:09:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@bootlin.com>
References: <20241216-fix_gcc14_libsha1-v3-1-0a2bb34bb5a2@bootlin.com>
Date: Thu, 02 Jan 2025 12:09:30 +0100
In-Reply-To: <20241216-fix_gcc14_libsha1-v3-1-0a2bb34bb5a2@bootlin.com>
 (Thomas Bonnefille via buildroot's message of "Mon, 16 Dec 2024
 23:36:00 +0100")
Message-ID: <87zfk9h3px.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3] package/libsha1: Fix gcc14 compilation
 in libsha1
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

>>>>> "Thomas" == Thomas Bonnefille via buildroot <buildroot@buildroot.org> writes:

 > GCC14 removed the implicit int support.
 > This commit adds a patch to libsha1 to fix an implicit int declaration
 > as recommended.

 > Link: https://gcc.gnu.org/gcc-14/porting_to.html

 > Fixes:
 >     http://autobuild.buildroot.net/results/87dc9ba9690cbb6a82875734ce9cb8dbaf878e46/

 > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 > ---
 > Changes in v3:
 > - Reformat patch file
 > - Link to v2: https://lore.kernel.org/r/20241216-fix_gcc14_libsha1-v2-1-ceb3588e6866@bootlin.com

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
