Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21989C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35F5608D9;
	Mon,  6 May 2024 20:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9aP1BHTjjmx; Mon,  6 May 2024 20:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D99608F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D99608F9;
	Mon,  6 May 2024 20:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5379B1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ADA481FCE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u78zYHh9JvPU for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBF3081FCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF3081FCA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBF3081FCA
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E71FC240006;
 Mon,  6 May 2024 20:30:26 +0000 (UTC)
Date: Mon, 6 May 2024 22:30:26 +0200
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20240506223026.683c8af7@windsurf>
In-Reply-To: <20240429170441.996821-1-bobrofon@gmail.com>
References: <20240429170441.996821-1-bobrofon@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715027427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jbZYV7tJyI8z6+H/bNz+Eew3psUIeB1vCjRI0mGB80k=;
 b=LHPdaq5W2foJIPyitHyaH6NfRf18V3HelHMB8F9Q7n80pDfSDyiiob0H05V5sQDYw0/IxN
 gsCCaMVOQEL25pYxGQvhJQhZ7x10HDBdkjM80YvcaAgAQX+q6CXnnuXSwCvRaCwCjr4Q66
 V5eIHV7ugSN9kemMLn5Y+rvymWxMMN8vJLoSuFZORNnjc4DpiZXki0Gt64JDNzROjg80d2
 CxCYq5e3bI9g5VnLiRJF0NtAmUVWYfbsuLJ68gY8IgkPtKCSN1OZ3qaVOSfvkibXM9FeNC
 evh6ETNM0d2IqMgY81fSb07W/Msh5T+CligmC7VsA+VWlOfzOfXMp9zgHVdDlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LHPdaq5W
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 2.0.0
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

On Mon, 29 Apr 2024 20:04:41 +0300
Sergey Bobrenok <bobrofon@gmail.com> wrote:

> Changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.0.0
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
>  package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
