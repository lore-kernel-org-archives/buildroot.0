Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF67CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9BA84FD6;
	Sat, 30 May 2026 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoA0HRtITNYo; Sat, 30 May 2026 21:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B34F884FCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780177545;
	bh=ddjKYBHRIxkET5PpWe0MU1NMyrY7NXkNa77CzXgTExw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IiA0IWrGmDeYJZ2UiKGH6JbsKl2GTQdySz0Aw5kDrKPVN6RBai6sUGhq12/CKvyg+
	 FkDi71AXU6oFML4e7mWn3Qg0zFiqE3x5yZjunGaH3veRCUuHqe7cT1oK8wZL3gstAx
	 iOwXoVybGM2rodXdaO+/9OVRYXqNLBT89Lbr1be3tSA809OSBjsIV6G22Cqu6gyopW
	 8yhoxixwAPyR0fauSFEsO2Q4bZ1LkAoWqNAotTZDOfStC7zQih2ckBjf6vco3Ffsbg
	 eGzKYeJ24dkqtABLJnxZWCZhdPQNYfZaZcihXeRKQU2G2YsWsRp+LUXLE08OnQtj9c
	 9dxp3ue7NBlxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B34F884FCB;
	Sat, 30 May 2026 21:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7979D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D86D6F5F3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeoJZj5gjv3T for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:45:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2F606086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2F606086F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2F606086F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:45:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 82C211A3755
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:45:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50BEE6073B;
 Sat, 30 May 2026 21:45:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D21B10888CC7; 
 Sat, 30 May 2026 23:45:40 +0200 (CEST)
Date: Sat, 30 May 2026 23:45:39 +0200
To: Jon Henrik =?utf-8?Q?Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: buildroot@buildroot.org
Message-ID: <ahtZ_LsN2SQaRPwx@windsurf>
References: <20260520115237.1843693-1-jonhenrik@qbee.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520115237.1843693-1-jonhenrik@qbee.io>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780177540; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4s/7xwn1r1diXlmQzoZafnaH/2vluULZhVGPox87+Vw=;
 b=sr0jn1xcs51KYNjy7CO+B4F1xdJ/+gNMLdW1AJHvC9XJjLem56dLdY7RQVJEtJAqr3axG6
 lU0nnDd5vxBU/bejLDIvmYtGzq/WkWKB5RbAnDkTDuF/mbXWpFzD6YSRSToA/9O0O7jGxA
 Y+ChsvG8o3yFSIoZCEuQTA9wdVrWn+U0s5ZI6XQSpKbz4LHAlf4UGVdG8S+uuRiFQ+0wXd
 S3G4PhhSAENk5IeLoxWrcLJT3Ev25pGHFCy2/WWwg4x0bV0wr03s6zOx5c5CjGRHiGdrVY
 iK4tDrtNNJTHVUJDFxb6ZrooRTXz2McSh7zHCdlDnGBhNIGsRG4wLI5ATPnzPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=sr0jn1xc
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2026.19
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 20, 2026 at 01:52:37PM +0200, Jon Henrik Bj=F8rnstad via buildr=
oot wrote:
> Signed-off-by: Jon Henrik Bj=F8rnstad <jonhenrik@qbee.io>
> ---
>  package/qbee-agent/qbee-agent.hash | 2 +-
>  package/qbee-agent/qbee-agent.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
