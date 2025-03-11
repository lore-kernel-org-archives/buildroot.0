Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A7CC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 21:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5695A40C0F;
	Tue, 11 Mar 2025 21:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxPRViIpts2k; Tue, 11 Mar 2025 21:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A91240BB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A91240BB5;
	Tue, 11 Mar 2025 21:59:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E19911DB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFA4960B9F
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaaJ1qEtyF7I for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 21:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E074F60B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E074F60B7D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E074F60B7D
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:59:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 088CC13F854;
 Tue, 11 Mar 2025 22:59:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 22:59:20 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 22:59:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250311112206.2200101-1-fiona.klute@gmx.de>
References: <20250311112206.2200101-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <c9b7c19352c3db720535e191dc25936b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741730362;
 bh=EStPcMaC7TkJR4diYTEHs3wECu8nHlKmwm2SOqg/+l8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RxlOMfewCbU9nk6L0jVNd63aDT5QW/mCseb+ysddPZmVWUi5GY/26XPG8me/4jR0Z
 QMI0qq0Dz1MuW0qMDIeUO175N9IWiGe0v5XQOSi+z1vvcOy5k8NjHbJuV7peSNLVFZ
 HuyRmqOwuxE8R6g1KOs3nWxQzFdsxaXPr1t4IEINOiYtY2ZdmQtlO9hHWpftN5z2yv
 OXn0Iz77dYgSCRV327ne6l7ZOR2jfmcRrjFSQMasMwilb/1bZc0kWNWNt0wwBXZx76
 AS32Plz/DfpipByZdQE8ZLWmH31BQAa6+Ep/k8iTbESE7efrQgpZqiTq0A8xB+cJyf
 36l1J7E5LapoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RxlOMfew
Subject: Re: [Buildroot] [PATCH v2 1/1] package/network-manager: bump
 version to 1.52.0
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

Hi Fiona,

On 11/03/2025 12:22, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog with a mix of new features and bugfixes:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.0/NEWS?ref_type=tags
> 
> Support for the "dhcpcanon" DHCP client has been removed.
> 
> Systemd code imported into NetworkManager [1] now requires kernel
> headers 5.4 [2], update "depends on" accordingly.
> 
> Also update the homepage, wiki.gnome.org has been retired.
> 
> [1] 
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2115
> [2] 
> https://github.com/systemd/systemd/commit/6e14c46bac760d01868b0bf48461f6ac44c86be3
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * Depend on kernel headers >= 5.4
> * Update homepage URL
> 
> If this is applied to "next" instead of "master", the next release
> should probably get 1.50.3 instead (with a few bugfixes), see:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.3/NEWS?ref_type=tags

I applied this patch to next, thanks.

If you think the bugfixes in 1.50.3 are important to be included in the
upcoming Buildroot release, please send a patch.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
