Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8EBC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 10:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02BBD407DF;
	Sun, 16 Feb 2025 10:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9ot67pcOekT; Sun, 16 Feb 2025 10:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024824124E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024824124E;
	Sun, 16 Feb 2025 10:37:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C389DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C06083F5E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klZ3txNeOWAr for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 10:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E1ED821EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1ED821EE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E1ED821EE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:37:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 45A1978035E;
 Sun, 16 Feb 2025 11:37:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 11:37:45 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 11:37:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250215062504.329826-1-fido_max@inbox.ru>
References: <20250215062504.329826-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.9
Message-ID: <8a2278a70defc7e74777957a971d7b3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739702266;
 bh=EjsmGnQEMyn9IuOGjj23NCZ9gyQVB/Bu9eMpKuKqgC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p0d4H8q+9ukDbCECCQPHAYPLZUjGIThN/bsZ4ShPPFVf48Du3rInPyAyfp4ms2nxs
 EgdHSMHJqDvChhxPNeFV3Mcd00eEca6/584hKw96pb9a37LCYI4mAHC1WlAjuJ0WLB
 4YyxJzamK6A2BypX4hc3PrfGI/xWoat4h4TRZ/29HJ5Rp21xgaG+hdQtiNe7wqrz34
 UpafU4jQcPWL1IYhmNa1f1aShtlzTQSY4WZLbdNms267mKaNzh0sPUUWSVrxkGsJZM
 /HCRuKUsw8umZVrGtjIISp36shusEctXRWAEz4dC4LFLN+4ussbV9lFwFE+JbJnE5w
 5sNim/RCbVAPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=p0d4H8q+
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.8.0
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

On 15/02/2025 07:25, Maxim Kochetkov via buildroot wrote:
> Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.0
> Drop upstream patch.
> Updated license hash due to copyright year bump:
> https://github.com/mapbox/protozero/commit/e91587f4bb1a0c443c663f4d1fcfd1ace674616f
> 
> Bump minimal GCC version to 5. (Switched to C++14 as minimum 
> requirement)
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
I also removed the patch entry in .checkpackageignore which was 
generating
a "make check-package" error.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
