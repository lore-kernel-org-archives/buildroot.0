Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA80C61CE7
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 17:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8681406AC;
	Fri,  6 Jun 2025 17:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d3EfEKq_GFc; Fri,  6 Jun 2025 17:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19824406AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19824406AE;
	Fri,  6 Jun 2025 17:21:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 880881F2
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796C48501D
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hb3i5bsn2Q4 for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 17:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81EEA85001
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81EEA85001
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81EEA85001
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:21:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C9E942003DE;
 Fri,  6 Jun 2025 19:21:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Jun 2025 19:21:28 +0200
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 19:21:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAGkXw1WRrcVzq2WE+WgdCaktu__M5tMxdrvX2-+oaSPezKD8RA@mail.gmail.com>
References: <CAGkXw1WRrcVzq2WE+WgdCaktu__M5tMxdrvX2-+oaSPezKD8RA@mail.gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d19c7cc639cff2204ead4e7965702570@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749230491;
 bh=3YnY9NQLVHI7cPyhaJ340zUBAPtLnRw0qmh+NUBaJ/Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C6Nwy/q6Ovjkjot6DU9vuYj0ia8TJV8XV4+dxIlUJVbqCMy25CA7UfJq5vBJpRJhO
 F2OVUZu+3gzD9fx1Ks3n/cdxgac+5jz0en/teZsjsJ+YMmNB+AgrGpsoBWxTuBM9/U
 RwVW92cyyYc/QW9yrb/SWWD2LDee5YiMTvJCvpYfjABdSwd6J4NPzWX96PuEDxkprf
 iNrLKRBt7vx6l76EMP1DJGl9kRIdS1RuneQpAVhKeTOTuf7UzB8G4VvrS/As9b7252
 L5DPrto+A6eoFpitR77BnQQIeaIqssftN5PISU91Tmm3dcGqrdXXPv8F8PIjzHyL7c
 PSS18vJfJl3Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C6Nwy/q6
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 2.6.22
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/06/2025 15:47, Fred Lefranc wrote:
> Changelog: http://www.haproxy.org/download/2.6/src/CHANGELOG
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
