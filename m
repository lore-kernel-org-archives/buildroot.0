Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19574D3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 19:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F426065A;
	Sat, 19 Oct 2024 19:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJ6cpeD7qfM3; Sat, 19 Oct 2024 19:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBEC0606A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEC0606A5;
	Sat, 19 Oct 2024 19:55:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B0827D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2A1C4052B
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVRfJpfCFFtG for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 19:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CA42404D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA42404D2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CA42404D2
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 19:55:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1854020002;
 Sat, 19 Oct 2024 19:55:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2FXe-00BiFM-1G;
 Sat, 19 Oct 2024 21:55:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Romain Naour
 <romain.naour@gmail.com>
References: <20240922150554.1348962-1-thomas.perale@mind.be>
Date: Sat, 19 Oct 2024 21:55:14 +0200
In-Reply-To: <20240922150554.1348962-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Sun, 22 Sep 2024 17:05:54 +0200")
Message-ID: <87ttd7c1gd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/aubio: fix build on big endian
 arch
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following error happening on builds with
 > big endian architecture target and libflac enabled.

 > ```
 > [ 75/243] Linking build/tests/test-pitchshift
 > /home/autobuild/autobuild/instance-16/output-1/per-package/aubio/host/bin/../lib/gcc/mips64-buildroot-linux-gnu/13.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: src/libaubio.so: undefined reference to `SWAPS'
 > collect2: error: ld returned 1 exit status

 > Waf: Leaving directory `/home/autobuild/autobuild/instance-16/output-1/build/aubio-152d6819b360c2e7b379ee3f373d444ab3df0895/build'
 > Build failed
 > ```

 > There is a missing definition of the `SWAPS` macro in
 > `/src/io/sink_flac.c` file.
 > This patch adds an out of tree patch that copy the `SWAPS` definition from the
 > `/src/io/sink_wavwrite.c` file in `sink_flac.c` to fix this issue.

 > Fixes:
 >   - https://autobuild.buildroot.org/results/b88/b8895a81411dc7622b0aba9f2f0eaa0aef5a1a10/
 >   - https://autobuild.buildroot.org/results/bc7/bc733f5192b354cb960b6a4726efb597be4bb06c/
 >   - https://autobuild.buildroot.org/results/ea5/ea52dbcc14c2bab300277053f0b9599a8e82294a/
 >   - ...

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
