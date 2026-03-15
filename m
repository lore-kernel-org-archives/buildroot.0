Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32104D58B0A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 10:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF08960F0E;
	Sun, 15 Mar 2026 10:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoK8TlUDyg4R; Sun, 15 Mar 2026 10:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8E9A60AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773569870;
	bh=d7vPBfwIWoruw/Mgq+yqlmSkDR4CkdrFaPvS+melpz8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G2re86HF5OEq3sAHY5hy0lC+Qqx8NaZnSt/7ZvOA/7vTAjYT1H013zJeHas8BXlJu
	 qP2TwMZgk6wqg/cgdM1PhmZ0AqFW6Zmvd33R2dCoJg/HnZ8CQX5jfQb92YgHNIbHnT
	 EqvsDb/TvwqYUUGKFqjkuTMj5A79Umc1xBtjahDoCpDsILWl5smmyOhPNvDWVdH1+a
	 x9yIs4tA5Fqd/XiCLXLfwrUSKJkO2NqfTI/gjBJHtf96g9v66pJYKrHrd1nB/GZR2Q
	 QpE1QeqjckXz9Awx/ti8iWTI1t5g8AIVObR+Ge0dOfBVOcOZEusAKFtJMQPEAEcsIJ
	 8TO9gMYB9Gnwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8E9A60AEF;
	Sun, 15 Mar 2026 10:17:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46DA01B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C4AC40EBC
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFkQ5bK8bZya for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 10:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A3D740EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3D740EB6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A3D740EB6
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:17:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B4C1313F880;
 Sun, 15 Mar 2026 11:17:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Mar 2026 11:17:41 +0100
MIME-Version: 1.0
Date: Sun, 15 Mar 2026 11:17:41 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
References: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <06e35fabddb8f84102a922b63710ea3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773569863;
 bh=x7RqIln3J6tmF0inHcdcdxgIwILsaO3zxYueJX9ALDE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oOGdEIEduY5WLZ/g/aus7HAY7kwHyn/PYpmgsy+dnMWQHWIj8drbrxUQdWFvgfTFe
 MzT1fVcpytSaGB6Fp/u5KhMZrfDOkWmBmpUSBlkRh4W57oJUOctzz4jCDrGz5eRA/S
 sPHNUB1sSJipJn3nzIO5i5b0XGZREdJ6sartPkSL5z1Q6I2SyilFcQavg90Xm9iQ1Q
 PJIu8XQLs9OU1odV/bwfZKSqNvXTLt6eLnv2qc4gwQHIGVFj20Dcf+VWg7zEv8NLc9
 vCOAX1E0pLGkzOaZ4ysq6KMiPlIWWp8LuvEc3IoGd3ocRg6LWQoOi+79Yf/13CBsiQ
 hAXrmj7fpvVZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oOGdEIEd
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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

Hi Giulio,

On 13/03/2026 22:10, Giulio Benetti wrote:
> Release announce:
> https://lore.kernel.org/linux-nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/

The commit title says it is a "security" bump. I can't find any 
reference to security
fixes in the release note. Could you provide details?

Or is it a copy paste error from the previous bump?
https://gitlab.com/buildroot.org/buildroot/-/commit/7dfd2feb445c2cf83a2b52057fab96e72e42a071

In the later case, no need to send a v2, I'll just remove "security" 
while applying.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
