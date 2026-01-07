Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1E1D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C22E4084C;
	Wed,  7 Jan 2026 17:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pe4hH1zrStKH; Wed,  7 Jan 2026 17:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36CA40839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767807921;
	bh=FmHYfuv1DwLQghEcJgULFnv2RVTZuDnEDWvzN4Mlpg8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=I5WjM9uxGKSCe4yCi3beJB51fke1UAsDYn/5j1LUXAf4WCYgpION7mdiiiZCTcpDE
	 EpTJDPRurwGoN6DqDJnDw8c3yELMRO9Mel40axW9h9iTMeX5kiR/Kd74pHS8wCMaVU
	 Bte7i/kpLlIPC7uyGHmNS6o6N8bMWotRkVTiLCzRxMBuLfIUR2A66op3Yp0lrF8Opx
	 1DGZZDKb93nyPkZMj+StaPA7rQ5i5jkrtTKKoBlQF6DWYmjFBrkRgMoYYWqwuQFy+M
	 3D0ajNfWU1dpsDzqUV6lGb/m0VfQKHTPPLmtGHuKJPHvL9JhIHRoJGsrI99SfUUDBo
	 vjEhjpBXUlAuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36CA40839;
	Wed,  7 Jan 2026 17:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5C525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4139240263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf9BlqQueTEN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A08440160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A08440160
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A08440160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:45:18 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D182613F89C;
 Wed,  7 Jan 2026 18:45:14 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:45:08 +0100
Message-ID: <20260107174509.2469650-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767807916;
 bh=rr6E1DEDGjDnf9q8Gd5tAcA7zmN52KfLc+6Iy/bWplc=;
 h=From:To:Cc:Subject:Date:From;
 b=KZR8r5dowPo2IUbxHrMVwXy03jMOuDIGLn+FmxvgPzpRiAG84XggXHEgnFut6ixv9
 vgz0a1xPDxC+bbFbBJk3aInmB+lIFImkLAGRcRg0VgxpuRiKg+eN8HqmiH6dYnbSKZ
 2Us6XwfXlftb64lfJDthX+5L8wfCCnQqGHDlUVifwa9qhhdPrWmbMd+MlUuuK9Ymfr
 1v5KcHDn2ehVKgqTZjTqMeaN4PVir/ZneCwqfXbxh4ZSKiCR1H0X8dA4U+DIPfj2dW
 xGqSONtE9CMc96nNxnR3Lw5xnnAkNtHpkeQ1veGhH9Tcf9Xi3vcMG2MxIdzdYV1zvS
 KR2m/5ZS+aWeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KZR8r5do
Subject: [Buildroot] [PATCH v1 0/1] package/daemonize: new package
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

This patch adds daemonize, a utility for running a command as a Unix
daemon. It properly detaches from the controlling terminal, sets up a
clean environment, and handles pid files.

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2249777127

Vincent Jardin (1):
  package/daemonize: new package

 DEVELOPERS                                                |  1 +
 package/Config.in                                         |  1 +
 package/daemonize/0001-getopt-fix-implicit-write-declaration.patch | 34 ++++
 package/daemonize/Config.in                               |  9 ++
 package/daemonize/daemonize.hash                          |  5 +
 package/daemonize/daemonize.mk                            | 16 ++
 6 files changed, 66 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
