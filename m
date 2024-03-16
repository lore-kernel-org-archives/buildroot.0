Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6050EC54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B73160623;
	Sat, 16 Mar 2024 21:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akEHzjxBK57A; Sat, 16 Mar 2024 21:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E9F60631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E9F60631;
	Sat, 16 Mar 2024 21:07:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC7EA1BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B691A81F80
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6TKmwTy1cgH for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 21:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B744181F7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B744181F7A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B744181F7A
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 21:07:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D2611C0003;
 Sat, 16 Mar 2024 21:07:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlbFL-001VaY-2B;
 Sat, 16 Mar 2024 22:07:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240106132608.1264366-1-fontaine.fabrice@gmail.com>
 <20240212230250.47533eb3@windsurf>
Date: Sat, 16 Mar 2024 22:07:15 +0100
In-Reply-To: <20240212230250.47533eb3@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 12 Feb 2024 23:02:50 +0100")
Message-ID: <877ci1naws.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: disable neon with arm
 soft float
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat,  6 Jan 2024 14:26:08 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Disable neon with soft float to fix the following build failure raised
 >> at least since version 2.19.1:
 >> 
 >> In file included from build/include/botan/internal/simd_32.h:27,
 >> from src/lib/block/aes/aes_vperm/aes_vperm.cpp:15:
 >> /home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
 >> 31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
 >> |  ^~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/6b311e97484db2b0f8adbda140320d696713b1e0
 >> - http://autobuild.buildroot.org/results/c309940ea6db0845d8221fb51611d0254222c644
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/botan/botan.mk | 4 ++++
 >> 1 file changed, 4 insertions(+)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
