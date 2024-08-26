Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C41DC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 09:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B30D40249;
	Mon, 26 Aug 2024 09:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-NUYJf4ae3H; Mon, 26 Aug 2024 09:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9C0E40111
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9C0E40111;
	Mon, 26 Aug 2024 09:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8EF1BF2BE
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 09:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 069AA80F1A
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 09:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ08yUYxrzku for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 09:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 578C980F0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 578C980F0B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 578C980F0B
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 09:32:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DCFBFF802;
 Mon, 26 Aug 2024 09:31:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1siW4q-00G2UQ-2a;
 Mon, 26 Aug 2024 11:31:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240825084221.2438493-1-thomas.petazzoni@bootlin.com>
Date: Mon, 26 Aug 2024 11:31:56 +0200
In-Reply-To: <20240825084221.2438493-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 25 Aug 2024 10:42:20
 +0200")
Message-ID: <8734mrbpf7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/norm: fix build issue with waf >=
 2.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > To fix build issues with modern Python versions, commit
 > 8012a86f5cf751f9c4d5d4a63f6502a6ac60d13a ("package/norm: use external
 > waf") switched the norm package from using its internal waf copy to
 > using our external waf package.

 > Then, in fd5623150dcc23441c4f0bd586378daeb91d66ea ("package/waf: bump
 > to v2.1.1"), we updated out external waf to a newer version, which
 > breaks the API around ArgParse, see upstream commit:

 >   https://gitlab.com/ita1024/waf/-/commit/bd5c22d484734f7c1b77e16c91a10c7a44fa6c8a:

 > This causes breakage when building the norm package. Fabrice had
 > already submitted patches upstream, to both the "protolib"
 > project (which is used as a submodule in norm) and to the "norm"
 > project. These pull requests are still pending, but let's backport the
 > patches that seem reasonable and that fix the build issue.

 > Fixes:

 >   http://autobuild.buildroot.net/results/f005d513434d42d26e601096b94b4070586118b2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
