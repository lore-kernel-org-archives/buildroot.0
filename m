Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA20CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6CC94056B;
	Tue, 13 Oct 2026 17:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npiIJzM4t370; Tue, 13 Oct 2026 17:48:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1D64403E0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913723;
	b=NtnH68HPRisL01DKt8rGpjJRI+sJhvUgWJYO3oGMRyehU3n5a9enl2XxI1RbJTUaJqgG
	 i10lKlle5wRSd00oOvC7uHTfBOrAu1H8k6JikMmTzZUdAJSC8m0P3EgHVRlIEggazeNHo
	 hLjPcdnTF4H5F4IlpwJgKix3CsMUS2mdl/xuXXBE1MgXH7/vI5XOpDnyUzjmabedmZ2Ng
	 6vZkJHRc5EidA1y6YD0A8llb/OVofydtyHXSBy0Sx5uDAZtPfAxO3BNmiBnK9Ph21fExN
	 lFwHqPzo+xqqDDkEo0UrPMCBk/bsioXSOSCGXYBs29dANX8VlKkhZjrkWmwqBOTbnkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Delivered-To:Received:X-Original-To:Received:Date:
	 MIME-Version:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+LQ7Qgtq6Sbbd/EjrTEG4E4B5NbVRIiMaleMPmLyIE=;
	b=MA412bP4+F8UFV56wjKXTXh/D4Ry8KUbi3kaX5dr/eQ8e7PR6UqisFNSK2RKocpeek8Z
	 Mm2QzAKjpES3uIw6syAf4yz4OtMQDrZEfhKRKLQV36fAb8q6qa6Qhr52CH6OyCJT5Zi1S
	 vitN632LWAWgHmC2fEyp1Uj1m5dSQKnL+q+4LORp7inz19kg8xZWFFBambeWn5EZOmBCQ
	 KsiBOVkQmlW2ND0wbxOBa8Uz9VCeoFdVEsIVNi1KU+sw3SBiiypNPEoG04eQLZVwcqGbu
	 vEeNw8swta+E0UAMDGSYhYiUIcVtXBxTPTK0DQPJx3eM2c/sUA0SGl/WJklYp2BjKUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913723;
	bh=t+LQ7Qgtq6Sbbd/EjrTEG4E4B5NbVRIiMaleMPmLyIE=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jlRMjMLgwYs6aO7E1+1IbjUxhCf2Jr0zAQwIU+zzxRINpuGeNlUyNHl8H4KzlTcNT
	 DKVqV0LYMSXI0SFBmMsaVmHCcRMA1F94IHrm5nLHMEMh2oTD74w6D3nVInEDgAAvzA
	 et/ylvAN45jHaCDcIHS+ovnwJuM/gDpa03JDxAzU+ab01Cj0py6rUqcHjDKMQ44D61
	 M7jsyHyZYTyWw+3tj8kHGAppoEApsOb1b+3C8MxTU+hxYuMmXoyLn59RehkpW/KsTW
	 46lIx8fvxC/1o9SBLoYrFoSExpVa66kmREuDgJfXtw0Ofr6ggQSThYHZp6+3627FQx
	 7TxSrIsvBuJNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D64403E0;
	Tue, 13 Oct 2026 17:48:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B121DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F67980935
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJ8T5cIv4sZ3 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:48:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AB2680857
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913720;
 b=jzVODS4XF3Z+j8vs27dYKilciR+BJHshgwAvayLh/IiRodwzx57gYgTuFX2HflkAOAbf
 tjMpk4nPkwRJViBSODnEGJ78sXTgvGTjNEHchFqhTk29h5Yk2C9t1lZz891KVSuOZRQOT
 EP86g5pudA2sxmrd40zr5TkLU6agSRgJ7YAZihx+XypR5CPSFxtndgB0gbjhLa70aclqa
 MqH+3nacEbITLiBMeqFkTvvetKc1WXPC3/HVU3CtZJ/yODJjR7uAmNz2RQOxdAQl+w7dU
 MCwAWsp/OHKu7OAcg5aCluJXYNOHAC1qLd4qsUiMilQ0WxbSE2MX+WR3UqpwluF6fig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913720;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Delivered-To:
 Received:X-Original-To:Received:DKIM-Signature:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:
 X-Last-TLS-Session-Version:X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=S2neZJ5gqr95SbcfqaweEMCOdw/3ypsKhmc+SzcJ0pQ=;
 b=Okj7rhCPnvF7Xyu1x6M1LK9cLcAAZnNfykSeZkpDDrrNusQIsHgEueh7U2sX1MhpChMp
 R/Mo/cQg3sFERL6qL/b5/yfl1Ys6IgYwcvw+tKQ0lHi6R3jffbGPvp8aWiYP6HvdG2fHQ
 HmlyPOGYlnAkpYP+w8o6tx5n3yGx+XgwcELfJrI982DWYH6+zGGp3Fbr5VOu4S9qzSprE
 zEgkoTcL+VBu1x+UAyzhBU2fKkeTpsqPmrbcdNkyenOA0dppK4CbvBe37My9oRkh4zykH
 a9sDMgjfIIU3Q8qle1rI0GH2d6zv9efxbfhJSfg6ZsI8xFnOqdfBHuf2bNW8fmaYVGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g0kZcDyB; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=o2WMEOfJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB2680857
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3DEFC1A1217
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1412960362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:38 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 8E53811D7188E; Tue, 13 Oct 2026 19:48:13 +0200 (CEST)
Received: from mail.galae.net ([172.22.1.253]) by 9e7fea892943 with LMTP
 id FwdtGdrxzGrlQxEAtaWaaQ
 (envelope-from <bastien.curutchet@bootlin.com>)
 for <bastien.curutchet@bootlin.com>; Mon, 12 Oct 2026 16:42:34 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D361E11D70508; 
 Mon, 12 Oct 2026 16:42:28 +0200 (CEST)
Date: Mon, 12 Oct 2026 16:42:28 +0200
MIME-Version: 1.0
Message-Id: <20261012-perf-fix-v2-1-aa77b97ecc04@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XMQQrCMBCF4auUWRvpxJCoK+8hXZg0Ywc0KUkJS
 sndjQVx+T8e3wrZJ/YZzt0KyRfOHEMLuevATbdw94LH1iB7qXsjlZh9IkH8EoRqRGfI6iNCu8/
 Jt3mjrkPrifMS03uTC37XH2L+SEGBQlsie0KlpT5cbIzLg8PexScMtdYP2JCCKaIAAAA=
X-Change-ID: 20260724-perf-fix-f14d1c7fb681
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fengwei Tan <tfx2001@outlook.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 8E53811D7188E
X-Spamd-Result: default: False [-4.48 / 30.00]; BAYES_HAM(-5.48)[99.96%];
 DATE_IN_PAST(1.00)[27]; MIME_GOOD(-0.10)[text/plain];
 RCVD_NO_TLS_LAST(0.10)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 BCC(0.00)[]; FORWARDED(0.00)[bastien.curutchet@bootlin.com];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_CC(0.00)[bootlin.com,outlook.com,gmail.com];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; NEURAL_HAM(-0.00)[-1.000];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
 PREVIOUSLY_DELIVERED(0.00)[bastien.curutchet@bootlin.com];
 RECEIVED_HELO_LOCALHOST(0.00)[]; RCPT_COUNT_FIVE(0.00)[5]
Subject: [Buildroot] [PATCH v2] packages/linux-tools: perf: explicitily
 disable rust
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since kernel v7.0, perf uses `rustc --version` to know whether or not
rust is available. If rust is installed on the host, this `rustc
--version` works fine but then the perf build fails with following error
(on aarch64) if the host-rust isn't selected:

rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildroot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
error[E0463]: can't find crate for `std`
  |
  = note: the `aarch64-unknown-linux-gnu` target may not be installed
  = help: consider downloading the target with `rustup target add aarch64-unknown-linux-gnu`

error: aborting due to 1 previous error

In perf, rust is only used by one file of the test suite
(tools/perf/tests/workloads/code_with_type.rs) so we can safely disable
it.

Always use the NO_RUST flag to build perf.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Changes in v2:
- Always call NO_RUST=1
- Link to v1: https://lore.kernel.org/r/20260727-perf-fix-v1-1-6bffb9146263@bootlin.com
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3238948d76..8c91c2cc6b 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -29,6 +29,7 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
+	NO_RUST=1 \
 	NO_SHELLCHECK=1
 
 # We need to pass an argument to ld for setting the emulation when

---
base-commit: e17cfc9b3b728059d97f9f8c4d890b4444125d1e
change-id: 20260724-perf-fix-f14d1c7fb681

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
