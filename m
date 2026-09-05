Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DA2C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A3E40A66;
	Sat,  5 Sep 2026 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWbv5-ePaw0k; Sat,  5 Sep 2026 17:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9513A40B12
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628043;
	b=DqTId41jDfuogdJI2HicqusErRLYxsS+9hNQaUGcICN9tFh3oQpcPdb/5inD/JP4g3bD
	 BCJoL8tQTPq/JVosNTrPOfdgMMZWH/KD6EG6iVCcqsTGtBUFHixIMqw0VpPQfFUB6gVow
	 LkyB4zRBRhQqfGD9+XTpHKPaG398dxNM7DxxBOjwS6fzthm7XJ7eNgfugp31RgIHaFBx0
	 TIWor2bK63xkVcctS3HWNppfRCGdV5WGtB/R7bJBMOmPb0EgN+sxj7Tw+YoLsfRzbIizj
	 F+lMI+4NuQPkRtVWPkkd2y8WEPy6zjeIjBg/amcx8XC36nQwTZq3oDS0dFcDkJPDc9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=haLR1PtKQWGkRXVaVJPc8GLsf9IRdiBcVxqk8gGXhtg=;
	b=jLps1fEWWA8QMk/zNW66PFurrJO1zosVi5hX/9/kqXzjgxF31ENncoGPkyztCDRyNIdn
	 SygDYSJJh0yPpAsCgwcX7yFKg/qycP4WvbzZHIVl6g8byR6nFAeHpc/MfOkJ8/ZLuLpGd
	 SoZC2Fvv7D7T4OcmKQx0Q0FoR+0ucgLyc2x0dBtxQjwMufNv194Mbb1Zx4yNZPqlk2sA5
	 jqGYkemfS92T1Zclxws/ScPV76LHBQM2GsvjMwSo2SJJaN+BoW/33wdq9lN3Zux200TBy
	 ZMUFIQxFG5POnaGfFLsCOpeP3IbUFNVAq+HWVKE3uYPq8PfkxpHFVV77Z55JzL+X7Sg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628043;
	bh=haLR1PtKQWGkRXVaVJPc8GLsf9IRdiBcVxqk8gGXhtg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gVteH/AzQ+nHOm01JSz+HHzgbjsFzxv8Ax8izf4b4EhLlAnQZr5pSr8nFn4/l6bG/
	 7jURH7jPl/wC106VhZT1kMZOkUGBHb35yPmnSnNoVXFtmQumb6F2eY1q/KI0BsGD9w
	 9AhdLx1UENPfpZWP03aJ8h9eZQcOvPKqlYShP53GvbXfonZ1Fm5TmG9iTCzkF1qslW
	 OsfU0W/DPfG1YlKXS3dLJ1jK9Po0cTtOfpKLMxJfHshGE2I0jsUhyJCF+XQr6fu0zJ
	 NcwX9JRZev9NM40F8CdJGaCnoNicTdYDngb92UemWB5e+EdbxpsNmf9Exeis9jK3my
	 TH6FwGZJI3KzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9513A40B12;
	Sat,  5 Sep 2026 17:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A56EC105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 966ED80FFD
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCLsu1Rwm9wW for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 34C89810A5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=h8XUzgPGJCfgKTfxo6clHcCd0V9MeDOmUbkKWz2pdlVxxhTsF63S1Z5vvqbQu9hVwLXV
 p/o2N75ICk3t9WIZNN21beiVorS08T13mkKdaMBo3j8XnS632X0taNw0PVzBQCgPHXSUQ
 gEE26/vpfaq4TffAEJM4u4M1PGTPdA/Sh/08O7f8n+Vh8hYgj6a62qiox6Ywb7G19Oc2t
 5FjZafPpmsatKpZBelRIj98lopH1i+f5uIuiMkDHuzJDS5iguaIpnPLj5KmJZla6zgu3V
 dLPxy2Ct0P0KdgR4M6b1XDJw5OUSpsvg37mLPdsYycoxMK0GkKPazBDPC411/8scBpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1Y0zivYiwNdhRDkxuJ5JL3oBIJm0Ktz+/Cj2h//zN0c=;
 b=Vx5meQteEle5HE246nxotDiI3GP+34D1bTe0mbze7date4MynuepFmv/FGkiLYq8Ibou
 LzJboSIypg0r4BKMHEtGMlyis75JDaeTohODKRcm5VNNoRX2IfSUHAkOHEKRfvtPUb0ce
 mD56Cjztw7m4/4jFvWo5ycjpyoGE2VwE/60IdJl4Takt0QRogIRzdIrc2nt/+8ELg2kaG
 tcBwyH958+GQcSw6gkwZpz6rWJX2FQ8L+PVKju+KRp7nkqTsJUpQ/h2Pr43ODuhP8wS7A
 uzJthqn0qV8fXcE7BIBog4rx7D4AqHqkacA2sKxjaGhjnbjn75lsErST6JSPYUb/Tbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C89810A5
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B2C395263; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed4b68385d22b569779beedbfeb95288d09282eb
X-Git-Newrev: 064e09e028cad8db09ffbca72d37b4dc7709205e
X-Patchwork-Hint: ignore
Message-Id: <20260905170604.2B2C395263@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajson: bump to version 1.3.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/064e09e028cad8db09ffbca72d37b4dc7709205e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luajson/luajson.hash | 2 +-
 package/luajson/luajson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index ea779994d3..0bb2d80dc8 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
+sha256  b5a14159119748a0170a1286710eabbf4580c3a86544849e7ce8139a68fd7cb4  luajson-1.3.5-1.src.rock
 sha256  87565fca189b70f2e119b2a99e5e92a7aaab9f2eb05228b56b88e6c2e2f98bcd  luajson/LICENSE
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 81a9f8113b..3fe346c45a 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJSON_VERSION = 1.3.4-1
+LUAJSON_VERSION = 1.3.5-1
 LUAJSON_SUBDIR = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
