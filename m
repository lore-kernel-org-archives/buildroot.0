Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BA5C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 12:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 767AD80E92;
	Sun, 16 Aug 2026 12:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQOPAGRJrAnD; Sun, 16 Aug 2026 12:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 626D780E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786883631;
	bh=OQM0ZAvtQQo/Rs50kmrc+w0PaeTaos2RptLX8d8Krjc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OulD/9zUlCZhNDqhMV3RyDHZ93xPT+m97FKdAFChJIA9PxmHKmF7Cs9AmYbNN8ed5
	 aUefne79M7l/dOPKhHlVWyn+8ckgjrCZ3eX7UTWgp7fo7L+EzH0E7zUQ44+TPoDSXj
	 9K5j8+pKgaS5F/R4UFg0Jf8QlqYPCwhcix+HrOWeW5O/WcfqQtXUQRkXNtSNMrCFdI
	 BuuSxMY5Coz7BSGL4GdBwajhkXxq7pBqcNyt2W2mjwYhh34OB5ReciOLb0nIgEeX0E
	 xSBnSxnY7MTfrWHn9pMCNKDCFcztq1nlqGRmQ7hf63cToEbnR5OCN2k1xh5pwv6iC9
	 syAkXOdpCD72g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 626D780E7F;
	Sun, 16 Aug 2026 12:33:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECF9B336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F30406DF
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGd1tLiy1z3F for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 12:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B1E6406DA
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B1E6406DA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B1E6406DA
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786883626; bh=nN6dPS8/jczRD/BGvLMdTDDuE+ndKFwAladeldRcFlA=;
 h=Date:From:To:Subject:From;
 b=WT5xRSuOGKV71SVQpeZKLN//FS/9EfUy90XItuy0mOLsjlW9k6PaEzlTwfCOpUPIn
 Wgf+8MtacUlW8dbqVArHh9a7nLsk4i5+Ll7Fi94Ne5u0EwBTpbX71YkU0cebZOw0kn
 i4D+l/Rtg4A1W6DHhF8Z+xh0w+SZizy2ZX4W+/BBuoYiXPjxR95a9Yp+dLU+NivkYS
 cH2ErQ57jrns4MEygoa5mZ9X/F8GxJqeM3Mw4vn7hgOnigMYWh8yDJPHhpFxfgiijD
 epI4w/Pj0lssZCIaWqVtkeehCU8lEk7HVkj01/w7C2IbQ7SyhKG76zynyub79zJqj3
 1hjIM3pFfHO1Q==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5EAF331E0A1D; Sun, 16 Aug 2026 14:33:46 +0200 (CEST)
Date: Sun, 16 Aug 2026 14:33:46 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoGuKjDayPKtSpxp@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] Is it possible to depend on internal toolchain when
 uClibc is in use?
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

Hi Buildroot maintainers and developers,

now that my uClibc-ng patches landed in git master I would like
to enable some packages, which were disabled because of missing
features inside uClibc-ng default config (fenv, uchar).

When I would add f.e. quickjs it would fail in the autobuilders
because of external bootlin toolchains, which does not contain
these features, yet.

Is there a way to describe this situation in Kconfig language?

So depends on buildroot internal toolchain if uClibc is used.

Thanks in advance for any help.

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
