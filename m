Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49F7C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B83E406FC;
	Thu, 17 Sep 2026 09:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1O2tvGxW-Jn; Thu, 17 Sep 2026 09:39:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8A60740746
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789637941;
	b=H88vhA2gMV28AQ9P5uvDPnWgdRn7CEnXPW44ZMAVKq8KcZhL82j1WiyVo5dijlmZJMab
	 KPvn9llEpbN4RHzaOsc+Y4Ib4zH6FL0bRThQ9cT5GlaGURiL5armnw7WcXZJ60cQgWTxe
	 jAhf/OIKF4DnkJ9l0eEiApXcY7XYrELKwMR5DxTyOiBACp6tBNohAf7aKeLZyYxTL5A9Y
	 XA0xSMJE3phl0uki76+W7Xnx0gcME7uO2OYOYq7aiGm2wVPpNhrGZUmPinlAcbYP86ypk
	 K2Z9LhOkJuPFlajs1A58gkfIkBW9OTGXD3gPW+Z9t6dsozr+5do6q/iDmk3tZ+wsDVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789637941;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:
	 X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bbJpTSgXai+UWKmTUHdq255NBT59sTkfqI0CgMK+0+U=;
	b=gY7c1dm7rEK0QB0RsjNhpltucOWbUlnrY2YjSF1PI3xtrUJVSmpHSWi42ESIdWPiYuFj
	 oVve34xoocVyurhZaztTF+G0KaGuqG5GuRuqWVO1iu3qN8o1ghJO//MPO1Gh54tPy/KKU
	 MmUM0m8TMciFGjuxeXvVkDBhNpfHc5x55cl0Br2GS1okWwUwCUhql8opWtJYf5D34Fzte
	 6dofkWx1VDm8r+ZaFmCvHnz+BmsdyWhjaaKPbE+RfnnAcM8A/7J+3+mlAfj9KRCWIDp/l
	 W+sstzSqgPIZLQC6aeLaUpZMK1JJlVSa160JOIIB+KPfMonk1Rw/KFamv3dxQ6beZbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=quimesis.be;
	dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256 header.s=ovhmo1685834-selector1 header.b=txEFzvRE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789637941;
	bh=bbJpTSgXai+UWKmTUHdq255NBT59sTkfqI0CgMK+0+U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F/shvKhGN/sSK/VnRatqoMcqnn2ZRAM3JTfKliPvw/hSpn0jSkYQk2quUgkp0bCID
	 oJVaObsR4HluuSKWyZSkjYA0ItdQITK5qum5E/ySNKr4dSzoWBiZ94o6zIuhBiY3wd
	 ukyAqEO26+QJtsz+daS73vOqhD8k4iojIi8zjiVeMstTK4fM9u0ODSLNZFHxlDNNMO
	 pSoNFmocdsQgi1wR+XCAhSfWolnavmjgXbNvUkEwTzerpQxarVEcZl6m8Z0049hVtT
	 ASD93r8H4EHLIogTCHA3RPpqr+W7lxNradPKbab79o6SriHuoD2cMDPatsY2coDGya
	 KXx9cjKkJL2pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A60740746;
	Thu, 17 Sep 2026 09:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F0E92EB
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5433940746
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCQphxXPRj71 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:38:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E7956406FC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=46.105.58.60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789637939;
 b=fSML1fxojUA6VfMgZnniDHQlguXGre8PjgVPp7xfGm3wnMcb0EhodNWNpPzN/oE1qa3A
 0CHxXBvSHfSEm/d1VKlqcVTk3y30ZukiDLigB15vrll5ZGuTjRMR1ZyZ9yAq/gzgbRW4F
 rA4NzH3SXIIVQeAhWIvUhIL8TnvDCixK609YiZb2Y0FeyQUgBaxQM9IaRP6aKbdNPTiep
 LUkgUTWqJe4X93YIALzrWZH42BrEhXrKDRvxbcyGa4SrCYdrAV+L1TOflaW9YWueGVh+y
 bjUriB+iW7lGLkwORLI7EgfAqRCw4WwzSPJTuIcUqKE39UbY0EIEWxIiNcjksDsZt8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789637939;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=0AetHxZLAiMgOJjFB2Ti1ooGYHEF6+9PQIDOofr7+tg=;
 b=Q6olv1Xl/o8ojcLvhkMqhFT+QefRK+eeN+AVKFEnKlc3rNHIJTlEl/oP+CIvIdBKZZ2W
 nkCCqeu7pOMsOuc9ub4jqIQyZmxryuOvJm317d+NnA07UgKE/lKv6B2Ulr9A1InFtX6lU
 vX9P17k+uxB4oyRh0B7IFrFFOA4LGnkHiNuJXNSPBIF8j7uRYdKrJOdjc75q+slhSkc3G
 jDQgXgAZ+t/MnrFtF7hF2rFpG5CdMc2Go1sUw2J49mGvKrOnD3ZT7U/zWVPGJvtBHQXHu
 70Td/+FVPgD92cXZbqPmrOG7mVdTO44h6xc8WE9UcdL4C7KosRdl5WBLVEUThFci9kg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=txEFzvRE; 
 arc=none smtp.remote-ip=46.105.58.60
X-Greylist: delayed 81725 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Sep 2026 09:38:56 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=txEFzvRE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.58.60;
 helo=3.mo575.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7956406FC
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:38:56 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.21])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hlrL55FjWz5x55
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:38:53 +0000 (UTC)
Received: from ghost-submission-c7b579475-z2xfn (unknown [10.111.182.237])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5EABAC0081;
 Thu, 17 Sep 2026 09:38:53 +0000 (UTC)
Received: from quimesis.be ([37.59.142.110])
 by ghost-submission-c7b579475-z2xfn with ESMTPSA
 id cFDRCy21q2prYzsAFSJ44g
 (envelope-from <antoine.gennart@quimesis.be>); Thu, 17 Sep 2026 09:38:53 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00459909303-8885-4a0f-b395-cc4b4bd73a98,
 8A94A716474959CFB9616324D37364D589FF58DE)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 81.245.109.59
From: Antoine Gennart <antoine.gennart@quimesis.be>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 11:38:47 +0200
Message-ID: <20260917093849.2095768-1-antoine.gennart@quimesis.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
x-ovh-tracer-id: 13055090896117567446
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEgTgTZFLrORixX9x+crxBYK0SZecQ1A4UAHVk+T+/AlS8Rkzy3E/7QQawiyS7uqqTxu90aksBasZq8h+F0cMB0bokMdKxEjtI154YpFioWnfuEIX6zbP2XM/cR3XEjPfciuX9//RKUEYf11mn9FCicKQ2lrgO9oFGJUymhNMCVAjrk5a+RTChhN0gaHaWGJ7atRFbsjcFZokbVUYJEFQQGNS/f3JjGa3v4EJ6JT0FNlG2fzjYUnQYA23/eFijAe7Qi9QBONbP7iU0itbj2H6YyKkIrwxs5MxQxb3GJGZMt/y+TGAiUVmWUPgLcbHofgmjv6AFz1SfCHa9e737NkVTxLBcIs7GNDnSQb8Spa/mXgaqCeIXRg3llWaHY9jD78GI4a3uYOYKW+2I5GWwrt/Q4BHqIioHuQlKS6szDtlv7kKeo4JmGY0QEc3BlRmHt5ZN3w4ODziG27uoceo2YAeLG1Z3m89MTfP07XjZOHxbD8aJM2OFWsH3HfNlwaiU/3z1tsLVZHBXz2nMqy34iDoGd1Zfyw9gOJZtvDRi+ZTofrbsfzVqf6bi0vt16TY58QMW45V6fzmoC6H63nbZdNHOoSOTMnitBWiAQPUiq4/vOwDJuF9fA9R7TdbfcYGGaVIj+nmoyDWV9atWdeCSHn33xd8DOZpgUsSc8OsWU+otbcw
DKIM-Signature: a=rsa-sha256; bh=0AetHxZLAiMgOJjFB2Ti1ooGYHEF6+9PQIDOofr7+tg=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789637933; v=1;
 b=txEFzvREYVC+4z8q9uxhEz6kI4BXR+pWgQhje2Txs8VxaiOXwxP4tTKMs5MyQenct65sfsi3
 osglefN9enQuUfQ7rmY1RhlUDEBBvcEVY0ItgZBynQohFkIVYK1OmHicVxx7mqIWY0NIP/JC9tF
 8Nh1khcU4a+B9s9jvG8SzAX7cj94CD7QCwTpba+FBh2dcUKuilXL5jZdg8+9LX1vMos4dXI6r7B
 +IFcyWcuw8zTCKzscw1/Br9uq1ViDvwgGfBIudHExSz2T9Xz9aQn0VsluWLPrtbg5POL9ob9JS6
 ziw/z42op2fP3k4AfipWVSdRKfyUJct+OCk6Zecf43sdQ==
Subject: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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
Cc: agennart <antoine.gennart@quimesis.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: agennart <antoine.gennart@quimesis.be>

The previous version fails to build with Linux 6.13 and newer because
mlinux/moal_main.h includes the removed net/lib80211.h header.

The header was removed by Linux commit 02f220b52670 ("wifi:
ipw2x00/lib80211: move remaining lib80211 into libipw").

The new NXP release skips this obsolete header for kernels newer
than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
compatibility fixes.

Signed-off-by: Antoine Gennart <antoine.gennart@quimesis.be>
---
 package/nxp-mwifiex/nxp-mwifiex.hash | 2 +-
 package/nxp-mwifiex/nxp-mwifiex.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.hash b/package/nxp-mwifiex/nxp-mwifiex.hash
index 559e89cb37..662f6c27bd 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.hash
+++ b/package/nxp-mwifiex/nxp-mwifiex.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  dcffe6c48babf7db82aac4704b056cffc06a1f80008cd9c23ab0479fc890ba99  nxp-mwifiex-lf-6.6.52_2.2.0.tar.gz
+sha256  cbbfcd497e85d6da8a29d28209baa924102b31dce8a299aadbcb8f530506b2dc  nxp-mwifiex-lf-6.18.20_2.0.0.tar.gz
 sha256  67d461bc478d220fcdf99c59d8ea17fffbd1881718281aa4947eb608fcd568bb  LICENSE
diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 46678a2c91..7e29e2e5c1 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NXP_MWIFIEX_VERSION = lf-6.6.52_2.2.0
+NXP_MWIFIEX_VERSION = lf-6.18.20_2.0.0
 NXP_MWIFIEX_SITE = $(call github,nxp-imx,mwifiex,$(NXP_MWIFIEX_VERSION))
 NXP_MWIFIEX_LICENSE = GPL-2.0
 NXP_MWIFIEX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
