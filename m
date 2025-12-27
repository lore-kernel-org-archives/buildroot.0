Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627D1E9271A
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 18:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31801405A9;
	Sat, 27 Dec 2025 18:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUuGoc2RWCpf; Sat, 27 Dec 2025 18:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41AA5404FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766861635;
	bh=ctSPpRdj0mr6+GgMDESjI2CqoXg3ddMAYAt5C751xaE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LwuyL15RLPfhSfRQ2vZ+4tO44zrAc2ulOV53MJKI3OaR/3/y0lgQMmYvUOXp0TQpT
	 c6Z4O1dmJVgjFA3ZTQaIWU5ZjAflvZW+l57VqU+kenfeolAUtMJN5L74DcrSF6GqXZ
	 u/eAb/iGApmswQrs2jmXq0IrQNb2nLt6wdw4vY0Cf6JlLW1LvK+J+I3Ils3u1w+XOt
	 rmzbkYli774tfpxU0e/DGd3lUkaG8Pa/NwgOTWflnx8KCykvN0jieHXBAWhUmvbhAx
	 6MMI3cF7w69tv23r/yM6sJC9cuDLzpSKPbJkJZpoHCfWbJn5Au3NYd++mUMVORpwVN
	 yN/fbIFNoTBOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41AA5404FF;
	Sat, 27 Dec 2025 18:53:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 440FFB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3601240352
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRxhhubKihsi for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 18:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C3B740276
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C3B740276
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C3B740276
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:53:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3CFB519F574;
 Sat, 27 Dec 2025 19:53:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 19:53:49 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 19:53:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251220165001.128775-1-bernd@kuhls.net>
References: <20251220165001.128775-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <4952bb1f4afdf0a23f95b59f34838723@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766861630;
 bh=7Uah3AKb0XG9WqE+ciUxqCILlk0sKwaf6NHEGc5zQrc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PvTnG0fsr6TnkZihpjg+xeUD9JGTDQObVloQTuzyHUXQBfabmSuWgGcGeCHc65ckT
 lb/CvITA6tav+DkKojaW9v7rm9NF2pWB41qO3yvBJqWUfIrLc2w5aEsSfFky9WJJSZ
 3L77msiqzFcOZSmPMhsYUlKPMa6MrZWWDGgLsY/dSgODlrX08rsmve9chIyo0zJCF1
 dJyaFse/znbAUnVHzaJ1FaMjEYQ8b3idPDDiAdmm+iu+SyguCDictQU1VqPJjJgrfG
 DRABrs0WbMFlONZd2gq+/M1citFAXZ8ZE5Vm9MVgxMyPnSntdIfRCU954wgLgxBpy1
 uOo4mI6GueUSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PvTnG0fs
Subject: Re: [Buildroot] [PATCH 1/2] package/libvpl: bump version to 2.16.0
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

On 20/12/2025 17:50, Bernd Kuhls wrote:
> https://github.com/intel/libvpl/releases/tag/v2.16.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
