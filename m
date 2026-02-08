Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA7EF06E2
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 12:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C778640647;
	Sun,  8 Feb 2026 12:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S8-L1aRGSH1; Sun,  8 Feb 2026 12:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F204940561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770552991;
	bh=TsOwkvYY5+s4qH6BEZI6EQ+EhNBOb6PmY0Va4aPreQw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gnw76vlSqGeBHAwckNlHvzCObdNH+ra/hoLxzEGPOIljVHV4dQqt7eK+QxYUU2nUA
	 VUZ600efLxixw7HbHt+xnvhbKwRzmjB4iPKgqzr2quJLJO7xtSMlp1aYAwT3j/EJMX
	 ksTTT4CipQmd2SE/qxW9mBn5QGNnwQHwgxMcZ9yev5Dv7ZW5xw5vCwB8wT+PZjF4S4
	 YNYAAoKZW5kLMMPIK7Ic+i/JhSE/iH7QmG5d5+HN5ZCTBB63uOy1mWngcLW3ZmZMZl
	 me+dueCWnEPUhQMaGUQotflf4IO05WS8d+jBtuYaVjwgsOfNHn8rMC2rf8AMz8Z82K
	 M5uxmMcOB2AnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F204940561;
	Sun,  8 Feb 2026 12:16:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5162A2
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 12:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 005DB6073E
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 12:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-g4n8bzbrPc for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 12:16:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F76660735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F76660735
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F76660735
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 12:16:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DB9A460137;
 Sun,  8 Feb 2026 13:16:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Feb 2026 13:16:22 +0100
MIME-Version: 1.0
Date: Sun, 08 Feb 2026 13:16:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260204185901.1073376-1-bernd@kuhls.net>
References: <20260204185901.1073376-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c98071aa3ea587286fb7b9d8e06a3dd0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770552985;
 bh=t9kRkCS+mboZU0zqrdEmsBHgblefv8tdy2LghH43xuQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e8nC24H/0pKJgS1bzVAbFI7NEcU2a5fET4DQWGRs8mAAGJLtJ5Ekg7a+52CiYGI+h
 9qWEc/fBPFa6n9GU8+0Cxn0/NgIPcX1P5KXhWiQBNdF28JDL6NCdywV0CyUPPLEv5n
 TpOWIG7ibbM+Xk8oD+NITGVJh239RAPJW3H3A5aZCyz42ZV/IiR991gCSvirl3yBKO
 CXxJmhv8gASmcv3iQXJpRNL53GJm4js1sLMvgKvWpQnOG6HrO3Sj27l5bZKrBsg0E3
 J0A2RaQ10LcPW6hUzoPjRUnb8/B7KYJLY22jyOD2Hf6GA5Ate3lgK3e/A89H2chDvR
 2zcuWMRabEhxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e8nC24H/
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: fix build error
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

On 04/02/2026 19:59, Bernd Kuhls wrote:
> Buildroot commit eb1f160b7a08537fdfeb0800b9240a497f4237ac bumped meson
> to 1.10.0, this release includes upstream commit
> https://github.com/mesonbuild/meson/commit/35193dd8e4f2a24ae689eeb8d01a2c3bcca11025
> 
> This commit caused build errors
> https://github.com/mesonbuild/meson/issues/15497#issuecomment-3812709660
> which were fixed by an upstream commit to the master branch:
> https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e
> 
> This patch adds to upstream fix to buildroot.
> 
> Fixes:
> https://autobuild.buildroot.net/results/aab/aaba3d6a9d55c3e8030d3e3487bf93074a4deac1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
