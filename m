Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61730CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39DD66152A;
	Fri, 15 May 2026 09:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuNrSgjQoDjV; Fri, 15 May 2026 09:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB88361503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839029;
	bh=xeXwDIAezEXIdre5tG7iResvJkfb3zomrT/ZlfmgtJk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N4MXKa8vqlhXJt01L1BdxNPNKSKnlzxg6K38AX2YRq0puw6Tb74HHI7sohi1aOjoP
	 OVKFwLeknKP882snu9EtQgXfGLofODR6D/2C0LgrxGc4ypICgkEm09XDAOMjejXcqa
	 w5JrlNhQvN8TVZzjATQA6A5qQYOK46Zm5UGk38OBFSTiC+8LMLggwy/mrBk0F6fCpO
	 cVE/DW0Qnk1mi8wtAOcVQ48RdFnpjYekwZaSc4+TjOPpauPk5AVFGnUnO1j9pYFDew
	 RZ3XoXpsAXSk+FD/nZg76XYEoM2JgvfRoadIBfgX0Qr32a9FxUDzAe5c7BBm5tcLZj
	 DEjsyhPcwvP9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB88361503;
	Fri, 15 May 2026 09:57:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3190DE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 217FA83FF7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbyeH4jAe_t7 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C489983E8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C489983E8F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C489983E8F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:57:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AEB2213F8C6;
 Fri, 15 May 2026 11:57:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:57:02 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:57:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511160113.1225755-1-bernd@kuhls.net>
References: <20260511160113.1225755-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b5a3b2a3a58801eb4c47bf786ebe7726@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839023;
 bh=UVDO2Mqy7d0vNw16lVEo3bqRteZ4UMaKX81k5E78onw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tP+FvmxTlKDIN18eamI6hhPk69BUPV3Zp3U13t5mvsq4pE5m5y5OIf9U9f9u3Pljk
 LktaA0TyfJ8EFJtYxlQk1fpp7PLMQPkULXC8V6ALw6oO2wFI80dfMj8mVk3zXndrk7
 fkJenOYpf53VHQ1MfS5NGOrkbYeuW2gpA3q2JAqollwh8ooTXKzc2gDOYmL/CiWgoF
 Fz7DjbwyDCuGARQBppzkBioUHURX06eZUTtyZmxDH3zsv+ppLwPF8yj993i0W0rZ6g
 fP5q1GG/R9+EIwzka7QKlrMH6+wovAmhHje9BQJAHJaQwzN3Gs+fCNA6JRPglx51YI
 xeDX4RqqykyUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tP+FvmxT
Subject: Re: [Buildroot] [PATCH 1/1] package/lm-sensors: bump version to
 3.6.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/05/2026 18:01, Bernd Kuhls wrote:
> https://github.com/lm-sensors/lm-sensors/blob/V3-6-2/CHANGES
> 
> Removed patch 0002 which is included in this release:
> https://github.com/lm-sensors/lm-sensors/commit/e31cb3b2f8fa5f0a7a61b9bca919bb54e7c89eea
> 
> Rebased and renumbered remaining patch.
> 
> Updated license hash due to upstream commit
> https://github.com/lm-sensors/lm-sensors/commit/6128b9e8eb58d6a12d4c8a8d6a635a3f066a0127
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
