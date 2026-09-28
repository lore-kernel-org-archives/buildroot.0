Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A43CA5FA6
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9D740576;
	Mon, 28 Sep 2026 18:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SE73Qnx89n30; Mon, 28 Sep 2026 18:25:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 09DFD40569
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790619943;
	b=ACXV1BL2vKgOPbVhRKVYn4mp9jCOjIOmbaVd8NmUK269HwY89TgIpSM68EbD1HABaYf0
	 UIKb7m76btotqpXK/RxvZgYHCd/cIRQqQMjB8mqKhjtSJTWwBcRn95fd/fpirRvCwhBtw
	 WrC9fBtrPf75G/2TVcx+JpmC5PjBVzZO2bmG0pDNoEQ85z2oGfZbcuW14yLyCFR4N2JF/
	 m3E0SlgvnOIrTuk7c0WFogYP7cM8EzRQNW+7AL5OMlM1Q97sGck+6GaYADqBUngsY0eu0
	 dyp1sYg68KuF9DPjRBNFTt018CHwA9Jd+0j5PnCgrGYPQXlewgQCRn+xdgvU2cObtZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790619943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0TXpNNzJfc3DIuHoGGrilxUac6TDK+YgMx5A14pOzcE=;
	b=FdmvKcYF3ywhlIh4y1MxNoeRx3RtCYwnhl4G/b0zK91g3c4wPwDh9f1hOSg+C5CtNnRL
	 CniBiTV4r2H6fi+Bq0/g7yw0I4h8Mnn0te+LNR9UOyOJLZSxJ2RLrF1iT336BdWDFIduN
	 7l2+QJ8o2kYDxcMT5yMYP1m+/xN7C6iqWntD9b3cTNpFVffwPVKecIASdwKfCMDLES8wa
	 Bi/E4Hjqkf1t/plxH7WGQHEj+aLPOCb79BiohmN0ONtVag8hIW89FwwXg56AtTyAJXohM
	 OXvzA2X6PwsB4xuw+LQuW5pQQwFcf5gX+tpIp5ReUlaPdVZBKulYLQRM0XVYog8r8Fg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790619943;
	bh=0TXpNNzJfc3DIuHoGGrilxUac6TDK+YgMx5A14pOzcE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jjLRLnIzBnLkDMgpLEzk19unsk5UUMFK6zf5+jaN2iAhNHfARrIYTb2OZHq8OLzib
	 YL2xwa+CvaOuVlPUDFHJInCj98/LfvaTwvoAJa4S30JyZCq1xAPiMTn1xZaBDq43uM
	 4yH0m/zXOsRPrxoYxF+Fk2oYniqbxKY//wrnKPmBEOY1tAFmn90iW4/oeLpQUZvVJx
	 mAzbk77st2LGPjIzk3GAkuH0HYSSfQn4Ry+YzvFMMDuDN/1wqtMkCt4HfGICxG5VUY
	 I0/ObA3GElnmmtu61LQCvfVJoneXUV1di3JATVa1VJ/e8tDClxKuVjzswpiNMZoUop
	 CzlhJcZBEDjGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09DFD40569;
	Mon, 28 Sep 2026 18:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B86D1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8A9C401E1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Op9CzPV26q4d for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 18:25:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1C3E3400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790619940;
 b=fxfJz9nt2JjJPUmOJtrZejrKJXjCKhjbCsQfP8ihi5D5ZJEfBcEKb83MV8oXJrwPRe5U
 lI4QRKpDfPlWO0ZV3/2wi6NReeJXVp6Ne51cqL64WDOKFsx4qqDuv7aMT3rxVImeWH8MS
 cS1tIYHqIvcGi5dJadfOuQobOXuF/kB3VZkj1ME/HLkjZzPu9yG/LIrlu/KJY5Q9aOWnp
 ViZU5p5ODzhXabWjH6LkuoS6qBiRR1t7mZ4PNnazoGQWzYvZXC5NafS5OWERX1n1oZHNR
 tG716M2VAmUI01e2U7mlAMYLEFUr6LHLyLgwR8HFQGA17C9aY14znaTeuFg8rtW+K3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790619940;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=kAAQ5wXSSLOwlkv6uASognBXRwsUzfbVeM04BkVz2Q0=;
 b=qoA9lbXIOFpIU/VcMIf+OndEAV9axKYu4YbIzMvgWD13oiqv4U7nl2uefBXx7NhRnlzL
 3CPRmrpSJ3x3A/WfDcEq2f1UXxh5/Q2ZRhf2ZyyPsSoasVfI3JGw+yeWw4Jt9Bk8O7oXA
 X3c248I7dN6LVJxvEaJ0Yy8Iu7UUBAJt/QHPDHu5a6zsTHJH9mAEdTHuR1GMIi/YpmzRq
 VUc86ImHwVo5sR9wjFQ51BYhPj5EYL81LJSmmYjnvtuWpkSCyx3liudrWBcAeKAGvhCk3
 DbkfWX1BWYtDG/7I32mVTi+ZTX6QVWHCItlQmyYMZpSBDBDSwAkFz8gh1/gYATANTxA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ky4IXYig; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C3E3400B4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:25:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V4J-1wjOcZ0Dyp-0145lF; Mon, 28
 Sep 2026 20:25:36 +0200
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 28 Sep 2026 20:24:54 +0200
Message-ID: <20260928182454.2165278-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3CDD1HyXPa6OrW/fXyZfyrWKm03GrxgR7eAlyDqP3udliTL7elV
 VYXdSKqLP4q5oz2IQUUzl9p/HeqUrD4PnfH122Oj8g0Bmfh7HbLsVfre5E2fuah/sxxwKNG
 uNC0fT3tqTdp2vTBQbWuFhMZ9PsVvo+DX0REalr38AiwvIAdxI5zgAL7PAe3MZ942W/hCod
 dhX5CWMyPUHZ12cSNLQ8A==
UI-OutboundReport: notjunk:1;M01:P0:kk94jLFhAQY=;2FVkpgPcoaJyizJuS54K5YtIUYv
 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
 Y88v1KpjntYVLkUCQ==
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: fix build failure if
 kernel uses localversion
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bubblewrap expects the value of the assume_kernel option, if set, to
be exactly three numbers separated by dots, nothing else [1]. If that
requirement is not met configuring the build fails.

Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
version bump to 0.12.0). However, the expansion of
LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
CONFIG_LOCALVERSION is set, or localversion* files are present (like
in CIP kernels). So filter the version string to ignore any suffixes.

[1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104

Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8
Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/bubblewrap/bubblewrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index dcc3c23d7c..a58d7fd143 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -18,7 +18,7 @@ define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
 endef
 
 BUBBLEWRAP_CONF_OPTS = \
-	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
+	-Dassume_kernel=$(shell echo $(LINUX_VERSION_PROBED) | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+') \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
