Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E92E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A510180512;
	Sat, 11 Jan 2025 17:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhYrPFQ9H6rb; Sat, 11 Jan 2025 17:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D014B80A4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D014B80A4B;
	Sat, 11 Jan 2025 17:58:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CCC9942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B419607DA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVKXh_aqjbOQ for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6DA260756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6DA260756
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6DA260756
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:58:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8837E60137;
 Sat, 11 Jan 2025 18:58:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:58:05 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:58:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20250111154901.2857863-1-james.hilliard1@gmail.com>
References: <20250111154901.2857863-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <252832ec177b410ba563f6b6ef030114@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618287;
 bh=4y6sK1YwaX2Jmlxr0LfpbOEG4IA+7uZpt0OwMJDFKSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P6QX1VxTPaLgcXMaLPMz8eWxGnY57TUs+xG/59aMLTrdjV2kFd/sD2eT+u7i0cU8Z
 Q1lsOryKsdCjRBDoGUe3hVeDcF6Ih1QFX+wHrhaca5dAXzobOhYhNOfB6u8POb9fq4
 Gm/cyPzivaYenCsDDH+2KNwbjDvqGyYnlGWYB49r7B45bwSisQ5zW2IBxEA6MTMaxy
 398E1j4CfFLwaoNzH0z3VL3LhO0WSenlx4DqiVLO1sdcwvpEUyFzkEC9E5jxQ5zGtE
 xDLEbx9PCATlX8xnwZiUK8y1jO81u1rOrD942/JI+czRliwsUUguQM+ZuMtwN31plU
 ddC//C92mfO2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P6QX1VxT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version
 2.10.1
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

On 11/01/2025 16:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
