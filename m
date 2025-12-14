Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC869D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 16:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4F060B39;
	Sun, 14 Dec 2025 16:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q_BGl4xd7Nm; Sun, 14 Dec 2025 16:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5403E60D7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765730994;
	bh=LjIwe4dSVDQWegINWApzz5ypo925B5XlZhocAlQueak=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yo5H7fPgos7Sf0fIS3E+yb9lbKMmtvjV1SuFv4pAr3G3dDoHBUcbxS1HiH1gknevs
	 um85kK6iYpI47ynareC0bzY3wronoYCkwuDyBXTUpc9ngwNLlAqic5L0SsWfCnW2s6
	 6xZax2T/fEIuGgDlLkQUfazzorvQwPbt9laxpH994fBwYNMUcP4bPh3kPeSty921OU
	 xIG+XGMNXIPbtchRMBzq0XvcAov9hCNIgQ1HrmP6dRsxvP7x3Fr2YMWM5v4KetYGbF
	 WTrCEA7wH2LzpaWeGEYj27UCXy5LTPeU2EiPXSwFrnxw2kWnE19X4I/GnooYiYxeNc
	 4Whlgwezgs87g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5403E60D7F;
	Sun, 14 Dec 2025 16:49:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D00362D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C14F7400D1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wB1Ja1vm2zIp for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 16:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D24084005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D24084005F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D24084005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:49:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2B1A7C1018A
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:49:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68A1B60713;
 Sun, 14 Dec 2025 16:49:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70D7B11940D6F; Sun, 14 Dec 2025 17:49:45 +0100 (CET)
Date: Sun, 14 Dec 2025 17:49:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Laurent Charpentier <laurent_pubs@yahoo.com>
Message-ID: <20251214174944.760b2bc0@windsurf>
In-Reply-To: <20251208183241.2523817-1-bernd@kuhls.net>
References: <20251208183241.2523817-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765730986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L/MagkBTElIozpk0CZ4Y1NkBvnjGG6vuy8/sj1XXAPY=;
 b=1QXtoFCcHy5BLSm9QMAKulUI9GOP5Hs6IwQqdm6FNLotjxii6BCJ3awL3vO3X+gBibZnyO
 9AZRmeHxM69uaJsg/fCU1kzq861/0BNWB3e8tyfnnPnNK4nLASX3SNjXE655eWCm33keZW
 SlZPgX3cAPI+eKXe7g/VYGVVnrgB24YCU+l2dE9lKSknCmlpe/TPS5iunrKfR3+qIpj7AI
 mf6ecrpIqEh/mhajDGQQqXzjeEXlVxUk/HF14amE7nkPt7WK/NmRf/7jagfVvp8KBXW+2n
 wFSA2K3hwR9tNZ8cn+vUscvVCuOhW8Dvqx4pZMY4C64Kk1AIURJ+tr13ShEx/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1QXtoFCc
Subject: Re: [Buildroot] [PATCH 1/1] package/open-lldp: bump version to 1.1.1
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

Hello Bernd,

On Mon,  8 Dec 2025 19:32:41 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added upstream patch to fix build with gcc 14.x.
> 
> Fixes:
> https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/

From my testing open-lldp builds just fine with gcc 14.x, and the
problem seems to be specific to building with musl (perhaps since gcc
14.x).

Also, your commit should split the fix (backporting the patch) from the
version bump, since they are independent.

This way, we can backport the fix to LTS, and take the bump only in
master.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
