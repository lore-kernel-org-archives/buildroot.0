Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C4D64073
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 04:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628B36080B;
	Wed, 17 Dec 2025 04:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiNozBkVkf1w; Wed, 17 Dec 2025 04:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F95E6079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765947479;
	bh=bQiQDDNkH5f5KHYVRiZp6wsRrhJVVoVVwpv1u25OGHo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S3L7zCpF5zaUjH+VmT77WrW+cNAMHLSY2cpN84pcn0MledvBV5VEwDMAZzOUA9lZY
	 xc2DMci/iaLgWe08wp83HG3EvtF/1sS59HlSnhOzI1LNuoH68Eh3DmfzRm5tiyoo6i
	 EHQ0r+anNVXizq19EcQXpBIrdnGhXzamL2ec5KpuuRMRfmewHo5FEfrKk8NqlHw5Xj
	 BK+EUMIEU/x9qDKRd4EAJk3wWFiGUQIySjVfbjwh4FdMM77zmCP/g0saOwpSyh27G7
	 xIWsXeB4X3uDTb8eWDDK0tU9rj9EDIrgJM+47I89NVDDXppQyXnWk3PSOEoZHdLtJS
	 ywSo1OIdxA0mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F95E6079D;
	Wed, 17 Dec 2025 04:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FBAF364
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 04:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 453E040D27
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 04:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8aQpODIZk6D for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 04:57:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EFAF40D01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EFAF40D01
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EFAF40D01
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 04:57:56 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6FE17BDE0684;
 Wed, 17 Dec 2025 05:57:49 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 04:57:49 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot <buildroot@buildroot.org>
Message-ID: <ed100c99101f7bb7cd6979fe680eed91@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1765947469; bh=+G8zhbzbFviyRks0WZo2zOXFHmY3GcfQcMxI6cpcWaE=;
 h=Date:From:To:Cc:Subject;
 b=YlPb7S4/cwLnQaXmGjFzhp0+okr2daVq/5dojx6T7kaam9GO3yTK2pZ5Ih+R+AGD4
 IgmsY/nk91wd/Qe902j05OQeLgjWpbq9+rVzDUrsaiKV0AE+tTILHHPxnxi9WMIc6o
 GlBbLZfYlp+cAJvc+9J/qUmiTZmRx8Ib9EYlRpLM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=YlPb7S4/
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libid3tag: bump version to
 0.16.3
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

Hi Bernd,

[Series: 
https://patchwork.ozlabs.org/project/buildroot/list/?series=476289]
[Patch:  
https://patchwork.ozlabs.org/project/buildroot/patch/20251005080323.2103951-1-bernd@kuhls.net/]

There is a pkg-config file 'id3tag.pc' left in package/libid3tag, which 
is not used anymore. Id3tag 0.16.3. supplies this file, and it has both 
dependencies.

The file was added in commit 
https://gitlab.com/buildroot.org/buildroot/-/commit/d6b68e6b6a81985ff5bcb9836d0d02c1fbed3e47

Apart from that you can add my tags:
   Reviewed-by: Andreas Ziegler <br025@umbiko.net>
   Tested-by : Andreas Ziegler <br025@umbiko.net>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
