Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821BDFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A38C811C0;
	Fri,  2 Jan 2026 22:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ak5onJ-aUQ8a; Fri,  2 Jan 2026 22:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5885181191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391544;
	bh=50Jf55EYH7eFvb1zU93W+FyMEvAkir2lHYca38gTLz8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nN1hXL2LtKAyhyhVhUZ1iYsicHxNQCbtSw4tXqsuoMSHh1v0fwJ5Tni4XjW0wAp40
	 EDLKszGJhXKR3eQVI6z7bEiq8PTjxcoECZx0rWtdolDcSfgaC3dU7Fqry7p2BMR/0c
	 Kchl3Iv7E7L9e4kDQthG1BWAH575wsVu3N0nt2seJEZbVET1Cept8wxCM2dxkWQE84
	 VPeFdzIQtm+n+yilAiyfrHLAAfzk14HYY6kclx0mXEgtmCVLdlGUIBAOO8z2+hPUVP
	 8KS3oRuP0B3O+hoNG/Uik0+ncIvsqd3avQdUbIq7W+RjwRLld35DziRBkuq71YmDGZ
	 9YCnDNRSnr3mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5885181191;
	Fri,  2 Jan 2026 22:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E6819D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F6F60725
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQzh2DKs-E6o for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:05:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5EFF60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5EFF60639
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5EFF60639
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 67A29C1C3BC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2CFA4606C7;
 Fri,  2 Jan 2026 22:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A833F113B023E; Fri,  2 Jan 2026 23:05:36 +0100 (CET)
Date: Fri, 2 Jan 2026 23:05:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
Message-ID: <20260102230535.37a94d77@windsurf>
In-Reply-To: <20260102210644.50758-1-james.hilliard1@gmail.com>
References: <20260102210644.50758-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PILIShKp2plmu/d+nQ0+ZY6XRBHPA+1FIGyVPj6q5FU=;
 b=oDDO07vuLiZW0FbqE7GYvngz4yNsQGd+23IlHYUYGCUfsMtdKH8lHmzbDAVB3ojcvZ6TwO
 RATLCCd81n+NIKVfqcLCSxlQ6DBlvPklfr54MjKgYOAfMj/Idn4bcPsyPib+iIHDXGqaM5
 KivcQEQPHN5HlBQR725/ycd2HsJ4P5zJOKdbI7HP1UDHzdF5I+kzuW/5hXq+QgZn3KzFra
 XdwttL9LbgEftfWszRVjaHZP24fwykn0qv1r+jOSoEhTyNdivyo8WK+pQ0W0DvVEQ77se3
 bDW8K9M2gOC/BkG9wsdHTIjfyuBIVDHY2NXtnzIthnlwW799DP3MP5hzZw8DEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=oDDO07vu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mistune: bump to version
 3.2.0
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

On Fri,  2 Jan 2026 14:06:44 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-mistune/python-mistune.hash | 4 ++--
>  package/python-mistune/python-mistune.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
