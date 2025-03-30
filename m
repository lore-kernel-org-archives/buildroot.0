Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018EBC28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 20:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE306078E;
	Sun, 30 Mar 2025 20:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvQlFLyfBUxI; Sun, 30 Mar 2025 20:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8AB9607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AB9607AD;
	Sun, 30 Mar 2025 20:31:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E90ED0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E646281E38
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMUQoOn-nfCA for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 20:31:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C607681E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C607681E59
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C607681E59
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 20:31:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5A7432003B4;
 Sun, 30 Mar 2025 22:31:06 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59250])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Mar 2025 22:31:06 +0200
MIME-Version: 1.0
Date: Sun, 30 Mar 2025 22:31:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250330142842.2909327-1-thomas@devoogdt.com>
References: <20250330142842.2909327-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c074d09e97be22e69f131bcb7b297807@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743366667;
 bh=hupr2hBPZYZydyCgNbANFZe7DfXw5f1x5tI/xMsLaGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BYbi87LyzLLU8b+9XgLOvIjvMykZtY8qx8uhUfmI+ZlTtbzZVzHjEvoaTW3x1GwFW
 BDecrpU53gpXYSibpSjLrr4GttHqsDGG35LyWSX+ftCihaLCmqEsp/wdTeNnlAAaJz
 HZKa7arPxU0rDrpn51a3s8mTnGRWLmUUTsBtmz6j0oWFw7nwHTb4757kGSwGOuCrFZ
 iolXXEfgOhBW6jPspRCTWb2s6Aso8SvQIsohpM64ShakparjqsykJ5LTmNSRRM4EC9
 zwTJXLbRybhbML4MwFjeADGiIGCzg2cqfD2emCUb1LQ496MSz4txyGfhfQIZJAtjWU
 C7tFPoqXfMLZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BYbi87Ly
Subject: Re: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.6.5
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

On 30/03/2025 16:28, Thomas Devoogdt wrote:
> News:
> - https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.3.news
> - https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.4.news
> - https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.5.news
> 
> Also drop the krb5_config, which was dropped in commit
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/123eb029bf3fa08f3c45678c0a43ae4b930e6631.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
