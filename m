Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DD7C4725D
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 01:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A1E42C47;
	Sat, 20 Jan 2024 01:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A1E42C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SE7jd_490AFq; Sat, 20 Jan 2024 01:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2893942E70;
	Sat, 20 Jan 2024 01:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2893942E70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC5731BF298
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 01:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 955538467B
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 01:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 955538467B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id godCr0cG3bPl for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 01:18:15 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 917CB8467A
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 01:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917CB8467A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 029B1CE27CF;
 Sat, 20 Jan 2024 01:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9C0C433F1;
 Sat, 20 Jan 2024 01:18:11 +0000 (UTC)
From: Mat Martineau <martineau@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 17:17:57 -0800
Message-ID: <20240120011759.2454452-1-martineau@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1705713492;
 bh=9sU0Q5I63JJqFUJVyc7ooov1d+b2VGBGoVg+jqQ0cu8=;
 h=From:To:Cc:Subject:Date:From;
 b=m3otIc/qbX50AYTCdS8QDIfLaBChH7qvn2TXz+Oj6gospt50HgTO64aAIdQ3YwV7e
 rSH0VIuYw6NpRAIix+XnyCrjOEMs+vecowYKnFclLwabkLgUIbi3FsaFpR4IoLHWM0
 2+m9ZxGHPAj3mOEoy0ILhzIblLJjkRx+NkpOOm4wNcZtwWRsASdIOxJfSlS9o3qDxE
 J7b7Tw72kR/yvbbbd2qF3lJu9nlYZRGIVP/i38O7AAqSqG6s2MoSQeU6zyzpfuHXmv
 ChyAIdzc6T37R5t0iGM7FAE18tA1niK2YrsKpbqUQG3dcU+krawxunWQ8t/zF3fWyL
 D5ROGrn5tb27A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=m3otIc/q
Subject: [Buildroot] [PATCH v7 0/2] bcc and bpftrace
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: jugurtha.belkalem@smile.fr, romain.naour@smile.fr,
 naveen.mamindlapalli@gmail.com, qyousef@layalina.io,
 Mat Martineau <martineau@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello -

I found the unmerged patches from late 2020 that add the bcc and
bpftrace packages in patchwork:

https://patchwork.ozlabs.org/project/buildroot/patch/20201220151203.2206747-2-romain.naour@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20201220151203.2206747-4-romain.naour@gmail.com/

There were 5 patches in v6 of this series. Two were applied (LLVM BPF
backend and libbpf), and I'm not sure the luajit-related changes are
needed - please correct me if I'm mistaken here!

I've ported the commits adding the bcc and bpftrace packages to the
latest buildroot tree, and addressed some of the review comments in
v6. It looks like some of the original contributor's contact information
has changed so please let me know if any of the tags in the commit
messages need to be updated.

Jugurtha BELKALEM (1):
  package/bcc: new package

Qais Yousef (1):
  package/bpftrace: new package

 DEVELOPERS                     |  6 ++++
 package/Config.in              |  2 ++
 package/bcc/Config.in          | 44 +++++++++++++++++++++++++++
 package/bcc/bcc.hash           |  3 ++
 package/bcc/bcc.mk             | 43 +++++++++++++++++++++++++++
 package/bpftrace/Config.in     | 54 ++++++++++++++++++++++++++++++++++
 package/bpftrace/bpftrace.hash |  3 ++
 package/bpftrace/bpftrace.mk   | 24 +++++++++++++++
 8 files changed, 179 insertions(+)
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.hash
 create mode 100644 package/bcc/bcc.mk
 create mode 100644 package/bpftrace/Config.in
 create mode 100644 package/bpftrace/bpftrace.hash
 create mode 100644 package/bpftrace/bpftrace.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
