Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ADFD45F1
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E613F61723;
	Wed, 25 Feb 2026 20:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BHD7mZD-H_T; Wed, 25 Feb 2026 20:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DC0E61725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772052946;
	bh=rUc04F6pt+ALkDh0umx3PdBMI8WVvl2YXhS1+uReMU4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WGbYQDI6cTaxcAqbOR31Ypar1K3pJDuF+Dx6m4hT1h3jPVT+iKp4ZUHRLbRAzMyRz
	 R9ld0zSGwV0ZsOOqAz0GlIF4pipwelNSjZb6nmq+1yFCL1/eZtXMBebsYC3ZnKdZsN
	 +oIfG3ZBv6wrNEIVxz+K4EvxUD95Qrqo/UcJafCHVd/bz/fxMKlN8k8pNj+hk4xTsM
	 /E8RK+c++CbLz41g6NE2kqnuntSPixRL2qjn6kjhOxmKvYUBqRSrLxHWJ3g7WiOXqQ
	 fA2nqyxXcBog83yjmO77JfbR4NPqO4e9bA9Yxe7w0MA9j1xZSHgVZzEgo4aAqVJZQA
	 FjjgUn3Xj6DGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DC0E61725;
	Wed, 25 Feb 2026 20:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8E323D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C452740D1E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58qKi5X8C0rL for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2F4941473
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F4941473
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2F4941473
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:55:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 039F613F8A9;
 Wed, 25 Feb 2026 21:55:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Feb 2026 21:55:39 +0100
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 21:55:39 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260225081001.37745-1-thomas.perale@mind.be>
References: <20260225081001.37745-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <3fd8f20ef4506deb110a410c00d378a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772052941;
 bh=zWMpe+ewrL5mGS48et5ZWZmVkDowMRtAc8UeZ1rE1IU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HyqsIc607Te058Ey0ne4CNhBJKQc6eY0Y0vBAGsB6SHOxXNNcZSi+A1ObakDOTGIw
 +2cGnuJrGb5X8N8XMM7umUss07MJGnuIKfXmfH2NS3/DqJSD6kdjL5lzWtl4U6bjow
 yOYn+FhFfpGLkadcoftdf2WVNL8TvpJ0x7nKFk6yNxI9dvBoa2aeMWAq2FgiQJxM3i
 viOVBUfO6qf+9w6ZHc6GMBE5kGvV7zWNNZumeSkK8vUyVl3MqyIzKuK7MhmemB3HE9
 F4ROoK8hGDDYmdknjDtutauQsHE9ApD0e9ma7Y7YWM9uNiP9hlqBnJ//ZwUgX5kKm/
 YSOLyOrRRKAbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HyqsIc60
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-15
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

On 25/02/2026 09:10, Thomas Perale via buildroot wrote:
> For more information on the version bump, see:
>   - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
>   - 
> https://github.com/ImageMagick/ImageMagick/compare/7.1.2-12...7.1.2-15
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
