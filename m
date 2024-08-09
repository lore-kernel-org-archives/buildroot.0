Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5BBC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0930780DEB;
	Fri,  9 Aug 2024 22:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qaRjywIGg6n; Fri,  9 Aug 2024 22:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A49380D23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A49380D23;
	Fri,  9 Aug 2024 22:09:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C92E1BF865
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B4D941489
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s13JdFnbu48P for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFFC841488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFC841488
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFFC841488
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:09:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17195240002;
 Fri,  9 Aug 2024 22:09:45 +0000 (UTC)
Date: Sat, 10 Aug 2024 00:09:45 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240810000945.25a1e049@windsurf>
In-Reply-To: <ZrWionLijDXHPUjW@waldemar-brodkorb.de>
References: <ZrWionLijDXHPUjW@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723241386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5e4ayBngnemd6Bmru4g/lWp7Lw01adNG7h//iuEKR3w=;
 b=mhBpAXCgsFbLtTx8sYrdfBheOXZ/XCHE5L5p6FSIdmewpIC7YkSvgizAcuEndM3hYUPqKw
 Sw+KKirHvScTg/bVwqquQpqi99NVgmdbwi5p6zdQ//wi2Ji+WzboLA1n6grvIbrjyqKwJT
 Kk7mAe7+b4YAep6WcY37RuQJTfowE98G9/6DTMJl2GKT97MDuLNxn1EQgAsMNuJoyyzOhY
 en748PIHchCV8ZRagWUwzGxve4v2lLGSS5r9BdBbWPjsdc2fcZIJLSS6VAE3dLf7EeQYY5
 DXt80W5k8n58MvvmJ/8Y0B8uHe7fHW8A5jkhESofnTPjvpTHWk+EkOdeJxaAgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mhBpAXCg
Subject: Re: [Buildroot] [PATCH] package/screen: fix compile issue
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

Hello Waldemar,

On Fri, 9 Aug 2024 07:01:22 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add a patch to include pty.h. Similar change is already in Upstream
> git repository.

Could you please backport the real upstream commit, as-is, and refer to
the upstream commit?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
