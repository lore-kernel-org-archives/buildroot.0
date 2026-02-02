Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD0DE7316D
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0884E4082F;
	Mon,  2 Feb 2026 13:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akuXF5851dEs; Mon,  2 Feb 2026 13:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A55FA40817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770038872;
	bh=xNMVeziw++lSflbfMUzszN4lDde2ozD9ovGxeAkY3PE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j26QoptcE1jqpT41Ge7eoHRWTraxy8vfLPIVOpwlvx8jNWzDtsam8pCTHXUbwBQpk
	 YwC3c+Z0GRWDHdjC00YckpYlNW+lNNoM4IBJtZyo+1N4nTRcTu4ecm0EJJ63NvaeGe
	 TZml+DuLsUpnp7/QI5JBQthtsdEwkmy/h21nMhPzKSz3SpjhhgKwKcgmWqJFl8wEsS
	 ZJWV18RAow47qEbfZhXnNJn24mh8pasm/DisdptPVedFzUqTXzgxmBZg8XVL+EgeHQ
	 JiKns+q1hwXhCSdrP4jD49P6dJw+qkMAKNSI1QYc5rk9v/RO3PIianUmf0n7XvlScF
	 k4O93tr3Wi+1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A55FA40817;
	Mon,  2 Feb 2026 13:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 638EF149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C62608C7
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dek6EFlqnams for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:27:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F88A607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F88A607F3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F88A607F3
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:27:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1367770933; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 13:27:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmtxx-000000065cL-2MGR;
 Mon, 02 Feb 2026 14:27:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org,  Marcus Hoffmann <bubu@bubu1.eu>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260112221927.3745398-2-Mr.Bossman075@gmail.com> (Jesse Taube's
 message of "Mon, 12 Jan 2026 17:19:27 -0500")
References: <20260112221927.3745398-1-Mr.Bossman075@gmail.com>
 <20260112221927.3745398-2-Mr.Bossman075@gmail.com>
Date: Mon, 02 Feb 2026 14:27:45 +0100
Message-ID: <87qzr32s32.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZX++p5/OPVcftsfK0nARP6hm0G8BtlXcZ1fbifxWYf51REh2Ok//ft5RnxDLctSLPmwVyj+vwnfy2lRkkECdb1FvGtWwfegJsaEEbnXIAgMkOvTuq0TKYra7KnANYfcuTb4G78oU9HdUPUUME7rYm4RDAzIGP7S6JN8OKEmT/a5C6Hf6NyP9jsl45++55WNHjTMfdCVOKwd3hPcqr5sqbRfMbj07AAlZLI4rKkaP78UDxdagRnAh6WawikvuWhE1gSedyRwUQF1/Jnw8K8njmMnQmmhS75QBIpKUeNe99YCetkFDrb3ArUJ14uGxBURvs3glHO/B75kcvaS9ZefBXQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=lcv0MEDoGazeHFCUKbTkdQ2JJDISWrOKe5yHSKAaDWQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ZX++p5/O
Subject: Re: [Buildroot] [PATCH v2 2/2] package/picotool: Add host-picotool
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

>>>>> "Jesse" == Jesse Taube <mr.bossman075@gmail.com> writes:

 > Add a host-picotool package to picotool.
 > This will allow users to build rpi pico applications on the host system.

 > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
