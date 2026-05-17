Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420FCD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 20:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 196AF6F80A;
	Sun, 17 May 2026 20:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8bUJPpEVfTE; Sun, 17 May 2026 20:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666B46F801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779049336;
	bh=Du1uhK0ZHl1vTQkRwxVJ2p4fsmRCn5HorpooAxwQaNA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lklIT8iBEacnSuPu+KpZ8MY3O20QnsVwytgKOnttkwWeHwl/q/czN990irGek0Beh
	 BuIMG0pLjPv+UJHCdGhwqRFSY3Kzx6L3O0RtuhYmm6ZAwhXM0fuNNP95i6LTuP4h6X
	 2sdBUBzVJCMjr/u1JLEnIoIfhjPqUvXC9styzVcuhYzhMnd3bX9GOVHIg1OYSZ/S2q
	 F9buzYv2w/20Hl73QZ+W5Eihm1vK6MEDDZXB8dA2ilu8ucSX2QyuUSLXFu2iFtc4mZ
	 DIZTnS+h8hkF1nNOMUf7yJFMl+V1O+cUKfr4FCnkRN6LfQV5oVJG/DKuIsZhkL8nh1
	 Cm8R+JrCCfZqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 666B46F801;
	Sun, 17 May 2026 20:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC50C265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADD7440683
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9A3Tbm3CanwR for <buildroot@buildroot.org>;
 Sun, 17 May 2026 20:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A093740095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A093740095
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A093740095
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:22:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BE20A780371;
 Sun, 17 May 2026 22:22:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 17 May 2026 22:22:09 +0200
MIME-Version: 1.0
Date: Sun, 17 May 2026 22:22:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260517164102.3570510-1-bernd@kuhls.net>
References: <20260517164102.3570510-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0348eab47b135103bcfd9f2bd370a09b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779049332;
 bh=R5yfsxMm9Ru+V2LPd3GIZrFTMTtT2bQA1T/pjqu4Lck=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rOzZHaBiMslBH8SVIdxZIMhwkQ+4026fmHjIXrd5MBLQ0jNIrKE5cti3mPb3dFRpm
 wF4Ms3p6COP//fV1UoQcZJ1QpI4ZoJBsCVie6gp9pbw8IAdnJxOvild+N7Dxu9T63T
 0ZJgvpDmge/OC40r92yFZ79ndngyLP/55zoYSt9iCeaANl7EZplDkTbCCnZM/qqMQM
 lcys42yBF9O+6piiq2oMkNQHML6UH3VQZpnYABgdy3vsYe83vZhZUegaBUkYZ2hR8P
 BpOcdHVikFrH6tkzl3KQJMz3MnYRoPGblyixRhawPLQxF1ncOuc5VT5L4EpX85W0sb
 qJVqhMjIlt9FA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rOzZHaBi
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.4
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

On 17/05/2026 18:41, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-184-1710-1614-1518-and-1423-released-3297/
> 
> Fixes CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
> CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
> CVE-2026-6575, CVE-2026-6637, CVE-2026-6638.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
