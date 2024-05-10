Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B229BC25B5F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82AF642A8E;
	Fri, 10 May 2024 12:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2l25WL5NFZf; Fri, 10 May 2024 12:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 792F642A94
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 792F642A94;
	Fri, 10 May 2024 12:01:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB89F1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9751142462
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5V8Qwuafm1N for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 110F442459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110F442459
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 110F442459
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:01:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F44724000B;
 Fri, 10 May 2024 12:01:32 +0000 (UTC)
Date: Fri, 10 May 2024 14:01:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510140131.2f7e8431@windsurf>
In-Reply-To: <20240324173519.61770-1-fontaine.fabrice@gmail.com>
References: <20240324173519.61770-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715342492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJ8JztP1Q66MwVOl0ASrOEau1NvHrNUqYYSWmaq4hrI=;
 b=M99K9cQNcQIEne9qdUA//xldhM7S3V7MDvA/eADjqYxAzbKfg0hQBMLwQKMEsDna9icg1O
 5lcb2bw+FaKFPL65Vn61ZyqqnpTEQpiJVNYgP+Yqc7O+waNhzI3Wz+7ER0ntm4yFIhXMUi
 2JWP07/VqKdod/gn9Pdf+Qi7weqNhuQbVNXjUnMl+dDQwZQEwR0xvfhsUNFtGECMr3tQQg
 8tIxeM7UwBb015meUu3a5ytV3Ia/2K2+6c6p//YKLGhNv+qLY1AdqiZ2hUXoFp1fUahnGn
 0r1IWuwLsQWPGjyB2fxjWONF88d1k2EJ+gKzLknfePG3kNd1SxNZjFcbTYuj5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M99K9cQN
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: bump to version
 1.3.2
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Mar 2024 18:35:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> License updated to EPL-2.0 with
> https://github.com/eclipse/paho.mqtt.cpp/commit/a7e9b1204296b16ddf2b5dbe23bc150cb1a04d5e
> 
> https://github.com/eclipse/paho.mqtt.cpp/blob/v1.3.2/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 4 ++--
>  package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
