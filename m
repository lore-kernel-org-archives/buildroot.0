Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4175AC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E4D24159B;
	Tue,  7 May 2024 07:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0JiAk5Y8XLC; Tue,  7 May 2024 07:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC0041572
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BC0041572;
	Tue,  7 May 2024 07:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02D001BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3CC241585
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeDfYiEsuAXQ for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE5BF41572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5BF41572
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE5BF41572
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:12:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1580020002;
 Tue,  7 May 2024 07:12:29 +0000 (UTC)
Date: Tue, 7 May 2024 09:12:29 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240507091229.11ebe7d4@windsurf>
In-Reply-To: <20240506202304.509499-1-fontaine.fabrice@gmail.com>
References: <20240506202304.509499-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715065950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mslsgBWihdvft2hI0Ew2Zj8Wm3mZP4LlV/oFm8+8zf4=;
 b=PPT5dP/drMZ554v8mIO3sJ0WQ/a6PovGBjoc57uFfK5wldEdJAJiVlVFL5y4WTKuUXI3C0
 V7jeNG3Y3S9d3gcb77W98+PPesweoztPgvMLvSd6+BDoz7Uy8S2ZSLD+ki7maPjeCLNeet
 UFr3243EpZs/q+QmP0f0PNBZpPFT1FwcnAxwkwUTMDheeb0Kgh6uMnDD5n2V40sC3i2sGD
 ch4VV6whoKstjXaf8I0vKdwQPFHLEZsOnsJO3Pq+nbdjRPutYkY6A9+jqaObLtdfSSIOKh
 2mhYBXEWW+qso+ZSwTXhL60W4lizHXGj0visIuE+4ilEiQgQIGsemArAp/Wr+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PPT5dP/d
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: fix static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 May 2024 22:23:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since bump to version
> version 6.0.14 in commit ce17f93e828a07292e03653be04a49480250f23f and
> https://github.com/OISF/suricata/commit/31ba4fd1522dd0d7f933767b9205c67a4e726fe5:
> 
> configure:22378: checking for pcap_open_dead in -lpcap
> configure:22407: /home/buildroot/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -std=c11 -march=native -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -rdynamic conftest.c -lpcap  -ljansson -lpthread -lyaml -lpcre -latomic -lz >&5
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libpcap.a(pcap-linux.o): in function `nl80211_init':
> pcap-linux.c:(.text+0xc34): undefined reference to `nl_socket_alloc'
> 
> [...]
> 
> checking for pcap_open_dead in -lpcap... no
> 
> Fixes: ce17f93e828a07292e03653be04a49480250f23f
>  - http://autobuild.buildroot.org/results/9e25c2508bd4100d2d1d3180e79060d762361213
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-configure.ac-fix-static-build.patch  | 52 +++++++++++++++++++
>  package/suricata/suricata.mk                  |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 package/suricata/0002-configure.ac-fix-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
