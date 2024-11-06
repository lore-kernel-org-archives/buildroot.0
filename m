Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC153D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F9381011;
	Wed,  6 Nov 2024 20:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQX_PvBUX5eH; Wed,  6 Nov 2024 20:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E02080E9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E02080E9E;
	Wed,  6 Nov 2024 20:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D012F4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB29401A6
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZ8sCb7LsVFG for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E87B40226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E87B40226
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E87B40226
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:42:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E511E0003;
 Wed,  6 Nov 2024 20:42:17 +0000 (UTC)
Date: Wed, 6 Nov 2024 21:42:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <20241106214216.27a3062e@windsurf>
In-Reply-To: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
References: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730925737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+K5JQwCIVorU/PBAYrrr3sOFGrVri/xqYo7XqQl7Pf4=;
 b=MPy9cjEiCC9gM0InXtWmwRvf4nm81FqwbAoWa1pL8PatLSCPH6uKPhMMUlWKjUSWBPUm8A
 eQoisePLQ+oFz7oyn5x8JbSv3/DpL7oK/PJIC18kfTc4u+sI5VkViZfZhnYX/lAf7Bmwwb
 51hLc+KMEr9nb3Oc2xXjfYr8cxKiUeSeU7+YwTOPmQX67X6LpNpGs23Z5UnT17aqT/tbP/
 S8GOdt+C57QDlXF6iYoP2YBV1taWeEkhzNYhKity8rR1txJzUBKIto3W2aSy6aIhiG17Kp
 /TpjBfIKk+rPTNCq4OvDltbtW0+rjz6Ju9g4dxkcfCClwiSkYveGsmqOdV+uuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MPy9cjEi
Subject: Re: [Buildroot] [PATCH 0/2] Update NSPR and NSS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Nov 2024 17:03:11 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Giulio Benetti (2):
>   package/libnspr: bump to version 4.36
>   package/libnss: bump version to 3.106

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
