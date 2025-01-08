Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C37E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8442580D9D;
	Wed,  8 Jan 2025 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y5tuvBHCUWf; Wed,  8 Jan 2025 20:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC3E80D8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC3E80D8C;
	Wed,  8 Jan 2025 20:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C34521EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A30394012B
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nAJ2NmxW7yV for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEB6540260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB6540260
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEB6540260
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:34:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1949596588; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:34:19 +0000 (UTC)
Message-ID: <c76a0012-75ee-478a-a520-dd34ced80f2d@korsgaard.com>
Date: Wed, 8 Jan 2025 21:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
 <20241229123751.639378-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229123751.639378-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P1FcksO5dqdixGUrM0Uksp6Y5KckeBVOxs+N3s8zAeqiXdz/QuWLj3PpHzbbRtiBqkanW0//PhROr93n2bkWh9O8qKM/q9JZLo2XIneeXICjp3yIkGZviuSuJLEu0s9bpfp39dvLUj/mhpmpaxi6aGr4x4TSaIhxIDoDp8Mp+4DSkORvNOtSFxIFgt6w4hU+vAFPpD0Du+tO4aekCk+4DcqCV5Ucbbmz4aPUL2QfA8nnP5oLAqvEsJPb3dxUkcWudAB0soWc6rGeTcPleoLDYDt1geRA0tMWgYLjKBcUVaMYwPBimM1MLjykkWx4Quz9fQ8lXoPlpST1DJ75zJ3CdQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=SkpCDUtG9eK/EDW8pd3zq7UpPl440r0ChoVbGKwdUzA=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=P1FcksO5
Subject: Re: [Buildroot] [PATCH 1/4] linux: select host-uboot-tools with FIT
 on mips
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/29/24 13:37, Thomas Petazzoni wrote:
> In the latest kernel, FIT images are always generated when building a
> kernel for MIPS. Note that we build the kernel with:
> 
>    make all
>    make <selected-image>
> 
> so the selected image through Buildroot options doesn't matter: a FIT
> image is always generated.
> 
> Therefore, in order to fix autobuilder issues, make sure
> host-uboot-tools with FIT image are always selected when building the
> latest kernel version. We do not select it in general as custom
> versions may be different.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/24bd5ae44f4097c374fe43b263254a985e2989d2 (mips)
>    http://autobuild.buildroot.net/results/d18b458a600f1f4bd7008d13ad2a56cb22ce8a73 (mips64el)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Looks to also happen with 6.11.x, so committed to 2024.11.x - thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
