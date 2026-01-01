Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16740EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E270181B72;
	Thu,  1 Jan 2026 09:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HZR847ML9BY; Thu,  1 Jan 2026 09:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E79381DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260873;
	bh=jZGlNiDRmwTbSOTgDjRXDSujSJP50zRHp2X2Q0eveDI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DFCFpC0KOETaiTqPXZ2wRSPYL5KkWbVLEZemoPD7bigyyY548+3dc3n3JCdGrl9MD
	 q6w+lrodHCBGz8oUhdFMYMmQXHbluusJn6tfOPv+XSsqyDWEQa3yufQjTwBazgkexj
	 bpzFe+8EycYG5LNID4vdsXF1U8nNnrcuhF99x3EnpMFII1qbypuVzRllikJMEaVqtb
	 Reudjrkvq01AhixV1lp5PMP45z2YCS13tSLpATAHemgzJqi6vuUu88YIZuer3MRMTV
	 9waM2eSWWS+5SX0daHeko1NMM9sdqFpIn46frh0eVjpjJdZ5pm9ODkF25/k69CmaYI
	 45Y/53SJnHX6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E79381DE2;
	Thu,  1 Jan 2026 09:47:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C48206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59B234080E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FiDj3nOkvVK for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 583FF407F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583FF407F6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 583FF407F6
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B8E1E1A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8EFD3606B6;
 Thu,  1 Jan 2026 09:47:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C592113B072B; Thu,  1 Jan 2026 10:47:48 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <20260101104629.0af6560a@windsurf>
In-Reply-To: <20251231203248.4109970-1-james.hilliard1@gmail.com>
References: <20251231203248.4109970-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lL7hyrYklEch50xfKEke13WgB5XgDtG9RUuh13A4FqU=;
 b=mgMR/K7j6AlYIbiUWij+JINkmSdjnUN32mACCJHVW9FYp6XRPo7yTWW7Jq2VjGJpE8mkt+
 BYMohxx2HP+Ev818ctVW+OYXMbUghgA654VRo3JRP23X1z98ZPBzfif19nbc3A+W/Lbb+T
 iXBD2O5+sxNtS6VWBNi4MjNrFPz1qf7kP/aa6jxhe8vnPGZvUD19qw9giaramhrU0IL/k8
 vIIQ7IU50A8Zqp8kL/EEqzfsJ2eFV8+JFGuGjZp1yRvQwjoSiPcsTeTUkXZIx8VZHxD/6P
 4qtGTSG9R7ILAjPEg58uhbrIBG5wb0Dxo4RFBhJ961bIpdXucCpjxyOV21M3PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mgMR/K7j
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml-clib: bump
 to version 0.2.15
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

On Wed, 31 Dec 2025 13:32:48 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash    | 4 ++--
>  package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk  | 6 +++---
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
