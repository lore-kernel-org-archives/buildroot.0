Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CD9C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B094140505;
	Sun, 13 Sep 2026 09:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwVB3rIENmIJ; Sun, 13 Sep 2026 09:05:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AF96540593
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789290314;
	b=saoWarXapYWDJ3vSSO/6Fny9ODEXxGoKClhL0l1SBufdxEOLI1+WVN3XGWGHhxSDoNXp
	 hkvveBrB3xIWTMkh87d7GRkgFu4XAKpWIo1Cx16mznQP98hLAHTR4hw6UEo74e8AqAd3+
	 JMI62+mWDxoddG6uYNeT4671TiydFIyWtxHBjnD1xGTHnuaCyu11xvN2SAD7n5bs0n1mk
	 2gz9TVdqUMmj9E/Y/KuePlDsSz8kM928mC3XN/aL2O+TquvAntagcWu3BltcmmlZpJzuc
	 tpOz0bOn29T6qZ2MpJJhbBEEVuVS9adFPRgbeN13b8fb3gBWnQOxP1ljnNf5JVteiWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789290314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mISmp6jDM18ATDPjREtKYnIQYueKkHdo9SVwgz0Rj3Q=;
	b=YCXikw1xZgKHmZ4hsdEcMggCNhBAoShGrNcCuPhNi4gaNJiI0InKv1vzPkLnql3FfPDm
	 UUTLj11abg4Zwin5dARQjzK6eYQWeET3NWJTibForqxaTUhDDlX6aHVJxXCvToLf3MZMB
	 3ooZ+hLS9C5R0Ovo9BhEPK74ClIOvBQoyeLcDZqNPiZc5PSKlEb4uwxlR9XUQAUxSZ9WU
	 9s+KfVUFT/CA1PXcFHGZIBKuK8ZzgkZKQYrZwumseaDQ/iRGh+3cMu61Pz4Ko4/YfIfSt
	 jxkRl2anC+t57l1gE/Nq4uZ6yqcn/TowZEpoThQFDXuhXaNl3a/iSlwfQP12G+w6lqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fBsndBQB;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789290314;
	bh=mISmp6jDM18ATDPjREtKYnIQYueKkHdo9SVwgz0Rj3Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phgIg8nVyfadJIfMuQ1t2VdXWEpA7yRrWuBFbdyolRR6mDY+Jhm64NpgxfMAACtQV
	 aiYWG5EhHbpKRTsMrJWlqnTtHfgvHlbo507TBVLv5oAuM2nQCHqaynXZtUR891gJue
	 5WJzLXx38Mu9Gka2M4RcW/tHSD55asLaWdMPRINIA0iLXvisUVG2xaaudnTR305PkQ
	 82Dyoedq4UmFNlztMa4l6ITAvIA7f8Zod+hd6lW+KR/bI0FCZp3Se+7uM9lQ7mTVb4
	 SXmcuXtnwwLNV2qu4eSmgoHHd3d4EFToLZYR7cMJ6eH/wVbXMQxbrTg7BluC1OZwuc
	 PziWdbocQiYJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF96540593;
	Sun, 13 Sep 2026 09:05:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D992B23F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAC5F40593
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkUEnUPe6oR5 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:05:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 79EE940505
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789290311;
 b=Bhew6QGNhODoUHd+myNFkqUGXfRs97Y8ST6U4jpOZdJYvAkKNs+fI62Cf3LidIhrJPJ+
 KlD4l1kYFtKaWMjgYApEL3Hwy1EsxbIdX+/ix57ehuT4yfTT5bGYnZY+4wM6J1fmy8vLu
 auvhP/7lWWHDERmqKgnFoKcM9W1g5qL+66kHqoKyeIPgeSB0idCI1wETNROGDpknZZN9e
 tdEd9pXg/B6Z6P0GzsKueQa+v4KyKmLV22ZOuRdIqH713AvZPR/1QY6+fkOs7Cvdckevf
 drtBc9sqCCAfoXH2SAEg9OTZUp4OvtGdIUqtcVjmwiO/FocaNsmir7xSPXz4XvL5uFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789290311;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=q3/q6UlVl/qKjsX68ILmz+/Msovb/vwI97UWsm1pIqI=;
 b=ZhDX2FpzF/6J1F5wFBM56CNO9mgeTKLHG6UCH2w0T3frC2rniDPqtB2HsbBVldt7iJrn
 zY47/G/izuR47F7ygRQOWa1M26YDdyvCUARDnDjWADP3GhGDImfZdE1zFXEkbgYSO0//w
 3O2A6/rGUKoeOnxpKGC92M7BilvNsQori7dJt8KUznpIXcQkTQIB0I7a6F0nhHi3wTFAJ
 hzvnfP5a9KtmBlWN13gYK+I13qU0vpHgvPp+A9uS2GQMEU+Rom29PszZFsYmubHNgIfMw
 vv4OLS98qi30gCjDXAbe21/9wnpERpNE6NkVe9PwjXVy8pfsMrI6XRULNtnjKD58Pkg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fBsndBQB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fBsndBQB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79EE940505
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789290293;
 bh=q3/q6UlVl/qKjsX68ILmz+/Msovb/vwI97UWsm1pIqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fBsndBQBCdopnSXtc9mJIoUaNORaXlTgVOwnm70gi+iiIJhbW6vookvZrXl3NKl1M
 MtdDDVArOtU5n8C4RxEC6gAY7mRwwAW40lpWzse4IPfFzvc6bjAqOVcgic3LAqfUhN
 1tggB3deZ1hXGugGUqZ1jlhrpCRstKUfrQpV8sxF0lu9PerG0lWyFuEd9Fd2Uhg+Wc
 3kdJ+RQONUhzALFptuG3YVjeJpuTWKJu6wv3PokaAbgVqxJkaMYTv+ZEP7obr2/3NG
 iTigSji8OJQqm48+r4XANNKY91L1A4FhvFDtKKIz3JhJvtrqhpVBqhxF3HZgtkN4E/
 tT/DYz8QZGEMg==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68928A4C3E8F;
 Sun, 13 Sep 2026 11:04:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51702)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5g8l-000000001FQ-46gI;
 Sun, 13 Sep 2026 09:04:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:04:44 +0200
Message-ID: <20260913090444.5862-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913090444.5862-1-bernd@kuhls.net>
References: <20260913090444.5862-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/poco: bump version to 1.15.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://patchwork.buildroot.org/project/buildroot/patch/20260911103653.431685-1-yegorslists@gmail.com/

with the exception of an unrelated build error:
bootlin-m68k-68040-uclibc/build/fmt-12.2.0/.stamp_built
https://gitlab.com/bkuhls/buildroot/-/jobs/16465887138

 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
