Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C71D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293338390F;
	Wed,  7 Jan 2026 18:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EP6jmIqP86n6; Wed,  7 Jan 2026 18:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D65E82ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809090;
	bh=0Mm9vSaRcguttdTY9WyBsALJCTbpdVdD7Bb9ort2Jyo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CCBa04D9RY6hBNwX5I+nBaTwjWUw4CsEyyA4fJExUXAFPdsCVwb1GdltvvR3vziHo
	 eD1msdH6VjBXHAtsokDLcJ9oHr4JiYkENn0b4LvMJgz8IoLRaPo0AxpdwZuEpsGCmD
	 v3nM0jx9S92VjM/tzRHEAZCW/qWgy/v2nrcTgn3H1yywFhqe6Ue6fZe3sCYy7NDT+R
	 r+ThuYc2ynLbNuQNQw3FGlQxiagHt7w7+dIjU2hC1y4SrMpAlsj1PU4K5kV/450JQp
	 S4H3SxjF01X23QoHjpKerpk0fAOIjGBNWBbyINxtZunLP+4ccWFiYzT78o4XaHgTfA
	 8ZqiLQIXh/5/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D65E82ECF;
	Wed,  7 Jan 2026 18:04:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86A1D25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D46540263
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxY2nAO2tS5n for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:04:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25A4640160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A4640160
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25A4640160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:04:46 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6627A13F86E;
 Wed,  7 Jan 2026 19:04:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:04:40 +0100
Message-ID: <20260107180441.2470944-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767809084;
 bh=pBJp5ZFRguYRh4QswAy+7iOpX05Gn7ytF+esFm2pn8U=;
 h=From:To:Cc:Subject:Date:From;
 b=qwRPosx5urSA+QvALL0OgYJyTa6gK0HJeFAscs2Gzr2oabiZda73HgC23wkT1ssWy
 vcIiKBj0eH+pUasobloF0kz6fbiy3OcO92ykaZsF5fclfFxeVUXH5AYP9h9TNhy6hy
 NnKnDY+C51fghvw1nDqLP+P9pw+APnMA0tDtGAgeHS1ONdiGig5oaYVw/D/kSJFBhv
 /H3e8c/1VSsFI1mJhGEhf8BDpwFtNgdH2nDitfhU4hejfaAdE8meT5kiKAeFN0a6p7
 Gd8UgXGqBT/4KZtYVsOVq/+Z08NyhtNbQdUTlLcrsudOhH7EO0kXcKlSEULHDBVsfc
 YG8uZVpO0tXKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qwRPosx5
Subject: [Buildroot] [PATCH v1 0/1] package/rpmsg-utils: new package
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

This patch adds rpmsg-utils, Linux userspace RPMsg utilities from
the OpenAMP system reference examples.

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2248955836

Vincent Jardin (1):
  package/rpmsg-utils: new package

 DEVELOPERS                          |  1 +
 package/Config.in                   |  1 +
 package/rpmsg-utils/Config.in       | 12 ++++++++++++
 package/rpmsg-utils/rpmsg-utils.hash |  3 +++
 package/rpmsg-utils/rpmsg-utils.mk   | 18 ++++++++++++++++++
 5 files changed, 35 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
