Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A89D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C56F40FD0;
	Wed,  7 Jan 2026 18:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-DtQ89fVVNr; Wed,  7 Jan 2026 18:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB6B40FE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809197;
	bh=payKCNUhiDKNMiXkxc0Uv9lvfzM0VXfngBFqvY2rk6o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cLmoTEnwBQTtrQCAFYspoRe4BgtTF0N5X6XfAQA+8nurawgx8xO81HXGnnIyFWMfl
	 cdSgQcFqnnBVo36S52rL7XZJ+zRe7qBhtVcqauoZdpcBigtXmx+e+AJPhYxHVoe/hd
	 DsxIjSWzeKaJY6iEcOPBzg75yp8A9dXi0DVTzfzVzpMlWPSNEXV76gMDqdCw5sh+FQ
	 I8WV+upESI2/tnb1ssVEsV7RIujNTbv6P/akSeKTi9lsyoCLizS6zG6j9q7VCKoE0N
	 oxjkbxmQo1dCRmPDNPuECNVF+azMso3W02ttnBWbUVNE7t/IgInQbuz3s+HIrQVLQY
	 bG3uZENSxYPpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB6B40FE5;
	Wed,  7 Jan 2026 18:06:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83A309ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62C9D8249B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6WeSbnErpbQ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66AFC8238C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66AFC8238C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66AFC8238C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:06:35 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 54F0013F8A7;
 Wed,  7 Jan 2026 19:06:32 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:06:29 +0100
Message-ID: <20260107180630.2471280-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767809193;
 bh=NAmZfWIiVOmfiLydtIF1WWMRa4X8/dTC50B+02dskNg=;
 h=From:To:Cc:Subject:Date:From;
 b=G5QigyeCySs2SpIjFacA0eT5CDw8gPh5gvi3P3vKTAGAqNuiAPD3oaYdrmOvsnkLy
 jQmvLafb7XXDYDd+XDxQaYklsgxSS0yze3QbDFBqB9/SbgYSa/7kAj3hSsbw/tslj8
 lGCd3s+iEnHpabICRXk/CwlNZQ4EV5TnC64qGzF1evpvje/QGfP8iT/8w5QYtt3/U7
 ET0k//XX3z5fzZ//Y+/HdcMfoLB/JtMDgZAbypUeaERyDHZZOh+18OR8Nc1eJ9xb92
 UjuX6XbbU3JP1J3L+Jfo5HZm2P8VoWg9MhRbGgi+/GZj+5xCvjWZEa4gkJbjH6C0x0
 9IWt8ZoVCTsNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G5QigyeC
Subject: [Buildroot] [PATCH v1 0/1] package/rpmsg-echo-test: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds rpmsg-echo-test, a Linux userspace RPMsg echo_test
demo from the OpenAMP system reference examples.

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2249123130

Vincent Jardin (1):
  package/rpmsg-echo-test: new package

 DEVELOPERS                              |  1 +
 package/Config.in                       |  1 +
 package/rpmsg-echo-test/Config.in       | 17 +++++++++++++++++
 package/rpmsg-echo-test/rpmsg-echo-test.hash |  3 +++
 package/rpmsg-echo-test/rpmsg-echo-test.mk   | 18 ++++++++++++++++++
 5 files changed, 40 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
