Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53F0C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FCA26063F;
	Sun, 20 Sep 2026 14:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31AjqhMVaXIe; Sun, 20 Sep 2026 14:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7C70560621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913339;
	b=eVoYUiMj3oYw57WAwngm1suux23M2ImUiwdkRP0GWRpopOIBNCuUvTct0M5Ov7O6czJ6
	 iHMYoZHyBX9mS6oCdRnESBcSE4Df6qiXYTvTSwNC6b6GhK4nA7KbxZc2TNsAOmKH16+jJ
	 mZ5hmk7lAaVAypqn1uO2lgNk92UYtByu/eHQo3G4GrAHut/ptm9RA6tbnmQMiqRF6gI7A
	 UX6J7e69448tDGOz2aTd8w89jjup1aziRjHhlvLj9fGz1SkyaPlLUYKJUyMWsfvCAA4dc
	 IsIcHqrjley0S1OHOG7yZ1KJt0j+gSyid6JiYUsw8PtzWl39xbqp9jakj7S6ffUCOoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	b=A+02hD7Jl33WuM62LsEgBixVJjk1ufdBvjFpNgIA2xF/7nGeL4KbTDuqwQwF9xbFnLGh
	 8eQmSA18d0jBdRur5l7nauhhPJvnQvbJCbbQWtrtRSSsj5n0NvkMOSM4NScDqXRe/e0Uk
	 O+XGC9WtOY5aRXRlibDXjtW8L5n+BVM6wKfs2gQ+YprJ9S67vHdCF+CojHjr8oiuOM1kz
	 F/aCJGOyUZD4zAuzEj9AIAdbGBljDnd7+6GyybtA1Uy/YzObNYEcEeo8+wFMmV8ZPy9p/
	 SWzvSMhu2JM/iMElCaWVm1Bblcue5FLAlSgMKunaVE9i7AYB4MHFmsQMHgkmOrT8psg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913339;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kgQfRjfijuMYhQ4Dbr1lAqkHS419ufGdGTmIZY5RsQzPmBeJmDlxBfsHT0Fjxwdhv
	 3OQR7nwTT5pQqDJR2EtYm3qJo0Z/LBPChPBR3WehifhJkF+mV5vDjOszFxnLfUvgzV
	 Yx6oPUAtCL3rbTwfajakq62FYb1SIGroGAf1wXPCfZmQ9fpkftAXmzjImQY556nIkC
	 fBmoGbpkAuxp3DkX7LRoV4kBp6IC2d8EjiCEoIkIvc2O39/uKEpdu/eC46tUZHlPqe
	 G3p/AQebLoVS/NToJFyCbmGCHZvfbDeQBF1e6jTDzP+9L1DoenK07L5vqlbBmHJJJJ
	 7fNwuFxPW6Y/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C70560621;
	Sun, 20 Sep 2026 14:08:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED8CB3AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E01D340576
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-3-VnUQuhkx for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0BB2940B2C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913337;
 b=USCAWsbL2tKTTCQBgxep6ddUZsiouRZu6uPX56f+wkPc+s7/+Zriap2fBVpOnDb4mOQo
 U9AE6IYwndJfQrA7CQ0mj9sqkyR130Yq5VM8eNAvv4PacSgL25Nnclj7n+/v271za3Oja
 k8EA9kzY1AlB4S2xr1fQW3jnD7FiMarrhr+rpAStxWZbn36bNpIjR7Wcn+Bh7HN5FPkd9
 QXPGxjs6h0SbV+JOvy6drDwjlYJ3sozfwOy+jX1xIcua6HWrY+29YnbewZqQOrGQ2q2qu
 KVK9tHF978uVV8IzKiY+KJhVPQmEhq7xqAYXHA3YgYwpWffmlb5wvqoh4Pdl1la2NnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913337;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 b=ImG5N0ok2KHpmWrUnDh/leTetWwfck+jqpIKp2lpue0+fgpebpnvqlgbncx2v8srydMF
 YcSHyAyFx4KGL77bC8JxJ7LGIBwa6uEqjuZF6Im4CpwzYiDczmvrjl1lpNU408o2OJcN3
 J/T7/+fXq/iV8Cy0s53prhQruAtm/PW8pKg6ao7bB+6DeRvDJi/39OmN6/VzorCf6BcDz
 jwBGPyY5Cv70a82Lm5/hs5UkyBZ+nxvBPnQ/j5FsOfPcz8A3u6BohrlohZej/c6E4wPYE
 0zy78jJJKh2U8pKBJakSX/6YtJjibmn7sEyi8dWBEQ/3dwSvl3ruJJUGD1aPcoqSfsA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mjdzxu9j; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mjdzxu9j
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BB2940B2C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913224;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mjdzxu9jJuZzbA4KDrUZz2/XKFPc4zrFFwylz6q4brzZfuodSxz0TmGkeUHMPenna
 /7zIwoT2BFUXMbo8NOUtT/CRxGD/WhfUjaKAgxC/nB91hBdFY0dqMkEFz1Z+PRf55p
 IsM8CnYB/9tsOcuDSAw7eg4K6CEBEgP7pSLSQuG/S4ZKb8MPoTMulkx4/V8a/N3leb
 0U57Re0GsdFT8Q9bDJE9iI4o4Ae1Ze81L4ePmO9+XADjIFI6BlRGhML9kfX334cQdU
 794FzGXDXOfN7yzYFeHTE1naO77ZbEyBGPkDBrZ/E3TuZGrf0i9SBiOXAjERcABr9j
 yVgr1QbNld4bQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:dhTgFK4+s/MsdqNLMg++2ZIRpoqf9oOFFk6xPF9B+TALk/7gigsRq3OPJ3FviGnvFrb3fSJm20YFoiwDby4u/NiixLpmBrZ+VcOC9ipHG06ptM9cSL05Dn3yc0zWTPyWTAe3iT+K/gdgxDx8MRmRRwi4Z708SOjxn8x45zyP15iqtYKyfXyslKB6fVmsCrIfmJvcwM1m7BPyO1lVUZRXyDEDkxwnWLaWqr44t8HRnPRVveVspPD7JLVu4uBjSG4OH5PrFJHnOO4W+fM8ydqhW30UgH5UnoMfiTD7uLY8/bKzTNM+Dhi91ZaiMhodZ/ZcflBMoQdPzens/2mcpqwj5vH0CHc18O8NmlluUNLG0tXyPlyIg7Z16AN9IhDmIKXApZfo+x73j0gxc32u+mhfGAN81Gpu5e1vnoj1Pn+Jj8nyBRBfHJPslqgPYr3arLUKlv2SlVTefwNv7ovKrslcszfIzdaq1SwbX9BBNH9itSmI1OS45lsQQdB4iksRon0nyvTdc3HQtSbme9E6CrHAa9F0SYWBYLCfA3rVtplOnzhKYOBCcz8UploPZWryBF0WXelAxdnhphIRBwk2Gkl6kvP+xPRxO188LFdst6QSdbZLbX
 dkuPx1MC9Y8NzXyfuUwm36rucGzASEOnovj08060C7GT65pRjzqAIhEu8Ad614ACbSMly0FQAYE45n0jmRNMLr4AI24s0Fo0xyvHd0q5md4ogH3eQM
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D530A4C4858;
 Sun, 20 Sep 2026 16:07:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBP-000000002J9-05Bg;
 Sun, 20 Sep 2026 14:06:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:06:00 +0200
Message-ID: <20260920140605.3005461-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 62/66] package/trousers: Fix build with
 OpenSSL 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/trousers/0004-openssl4.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/trousers/0004-openssl4.patch

diff --git a/package/trousers/0004-openssl4.patch b/package/trousers/0004-openssl4.patch
new file mode 100644
index 0000000000..5ef6cb19b0
--- /dev/null
+++ b/package/trousers/0004-openssl4.patch
@@ -0,0 +1,26 @@
+Description: Fix for OpenSSL4 compatibility
+ Replace direct access to opaque ASN1_OCTET_STRING->data field with
+ ASN1_STRING_get0_data() accessor. ASN1_STRING is fully opaque in OpenSSL 4.0.
+Author: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/2155003
+Bug-Debian: https://bugs.debian.org/1138451
+Forwarded: no
+
+Patch downloaded from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138451#12
+
+Upstream: https://sourceforge.net/p/trousers/bugs/240/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/tspi/tspi_asn1.c
++++ b/src/tspi/tspi_asn1.c
+@@ -237,7 +237,7 @@
+ 
+ 	if (*rawBlobSize != 0) {
+ 		if (decBlobSize <= *rawBlobSize) {
+-			memcpy(rawBlob, tssBlob->blob->data, decBlobSize);
++			memcpy(rawBlob, ASN1_STRING_get0_data(tssBlob->blob), decBlobSize);
+ 		}
+ 		else {
+ 			TSS_BLOB_free(tssBlob);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
