Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8045FC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 484D3415A1;
	Tue,  7 May 2024 07:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvIVZPM9J_G3; Tue,  7 May 2024 07:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB0A415B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EB0A415B7;
	Tue,  7 May 2024 07:12:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D26161BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B1340507
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azMmj5dV6dgE for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEC734050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC734050D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEC734050D
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:12:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAFDC40007;
 Tue,  7 May 2024 07:12:40 +0000 (UTC)
Date: Tue, 7 May 2024 09:12:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240507091240.39efce59@windsurf>
In-Reply-To: <20240506210348.1285002-1-fontaine.fabrice@gmail.com>
References: <20240506210348.1285002-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715065961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1jKsvCIqvyWiyH+OkhmnUchpHf/K0mH0dF0O3b4+Fg=;
 b=NHypuYtsbqQTQKeiNIRDHw9BipKgPbqQFpCBEvuDRJeQbWio0Wl7BuziYrkqXKK4jx7u7p
 7FeQky40KYSEH3XXeTRxMO36I9nDcY6vtWqtOSFnMY/V95UyE9kAqQXYShhySjB7MPlAB5
 z3iCK+hSJFkhxb0njc44Zw7yInWWuxA7zH8QKjjJ9fh6N9QEocY5PBi8ADI0MwUOMi6FsO
 36QbZDbSBKpwlOZn6UVadq9yjszHLR3WpDtVgWk//1lecNFuv5B6Oy30lYODwkIv9o6XNs
 xVM8+nlEYh5hW1Y/llkQONgcyPPCj/iTnNrxO6qeiws7hEoeTZKkcloFCyyrNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NHypuYts
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: fix uclibc and musl build
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

On Mon,  6 May 2024 23:03:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix following uclibc build failure raised since bump to version 4.3 in
> commit 99e9ff08d0705279532ca0cf3de22ea54660cbdc and
> https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=577fd10486d8d1472a6b559066f344ac30a3a391:
> 
> Create.c: In function 'write_zeroes_fork':
> Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
>       |                                   ^~~~~~~~~~~~~~~~~~~~
> 
> as well as the following musl build failure:
> 
> util.c: In function 'get_md_name':
> util.c:1031:29: error: 'NAME_MAX' undeclared (first use in this function); did you mean 'MD_NAME_MAX'?
>  1031 |         static char devname[NAME_MAX];
>       |                             ^~~~~~~~
>       |                             MD_NAME_MAX
> util.c:1031:29: note: each undeclared identifier is reported only once for each function it appears in
> /home/buildroot/instance-0/output-1/host/bin/x86_64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -DNO_LIBUDEV -DSendmail=\""/usr/sbin/sendmail -t"\" -DCONFFILE=\"/etc/mdadm.conf\" -DCONFFILE2=\"/etc/mdadm/mdadm.conf\" -DMAP_DIR=\"/run/mdadm\" -DMAP_FILE=\"map\" -DMDMON_DIR=\"/run/mdadm\" -DFAILED_SLOTS_DIR=\"/run/mdadm/failed-slots\" -DNO_COROSYNC -DNO_DLM    -DUSE_PTHREADS -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBINDIR=\"/sbin\"  -o Monitor.o -c Monitor.c
> /home/buildroot/instance-0/output-1/host/bin/x86_64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -DNO_LIBUDEV -DSendmail=\""/usr/sbin/sendmail -t"\" -DCONFFILE=\"/etc/mdadm.conf\" -DCONFFILE2=\"/etc/mdadm/mdadm.conf\" -DMAP_DIR=\"/run/mdadm\" -DMAP_FILE=\"map\" -DMDMON_DIR=\"/run/mdadm\" -DFAILED_SLOTS_DIR=\"/run/mdadm/failed-slots\" -DNO_COROSYNC -DNO_DLM    -DUSE_PTHREADS -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBINDIR=\"/sbin\"  -o dlink.o -c dlink.c
> Create.c: In function 'write_zeroes_fork':
> Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
>       |                                   ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
>  - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
>  - http://autobuild.buildroot.org/results/c77ee2615e9d473e93d95c778648c7e897b7f234
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ts-h-include-for-NAME_MAX-definition.patch | 32 ++++++++++++++
>  .../0003-Create.c-fix-uclibc-build.patch      | 42 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
>  create mode 100644 package/mdadm/0003-Create.c-fix-uclibc-build.patch

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
