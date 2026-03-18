Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578BC1077617
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C5083BC1;
	Wed, 18 Mar 2026 20:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkzI5G56ygLA; Wed, 18 Mar 2026 20:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B88D483B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773865891;
	bh=wZwHSBTAtpzGdpKqROepO42gmJ3KKWqa8MlKQk7gHt8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDF+1BdtGoPI2USuLv7iKv90Bv5eDk3L/58YbhmbWCos6A8fJN8gQu1h6o/++WukD
	 pE9eXdB53ONCpYAmXmWp+GSv8e3Yp4UagLGBBs/vuXe96JKy7VzxX5E1VARY9LySIg
	 rKQ6mmZD/dWwFBm3LNdhKD91Qv6DqAtGXrSHK5YwScPfKx2LIPsIAQFvT2/yfb5/Z0
	 qLbr2nB7HxfLtdoBUj548fisxjqkfsXBn0Ah/UE46JJuC7YDL/coBr9XWaUyKR3Gcg
	 uY4HdVlEiFNzHYyYF3EcBcbU1AV2HBcihPt8gqwWSh85q0uFIdoHthuA/cqVUGIZZw
	 GhOFiZkfC7iEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B88D483B8A;
	Wed, 18 Mar 2026 20:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52E4A1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C4441759
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCwOFqYpHswa for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:31:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AADC4174B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AADC4174B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AADC4174B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:31:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1178291266; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Mar 2026 20:31:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w2xY4-00000008M7r-12u1;
 Wed, 18 Mar 2026 21:31:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260314183500.3159948-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 14 Mar 2026 19:35:00 +0100")
References: <20260314183500.3159948-1-bernd@kuhls.net>
 <20260314183500.3159948-2-bernd@kuhls.net>
Date: Wed, 18 Mar 2026 21:31:24 +0100
Message-ID: <87cy10g9r7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ODxmHCPKaaP4LDEPwV9SLAEprpi6xbtAwfnJruwsjk0VhImZfTyfXW6dDxxUs6Jc3mKL1aUXJl5KtA7iAco2Sx7p8ieMqqFaD6UtsxBKmVw0BKEAuGpXZwN1GhBvVco1DHcgysTH5nw//mTOGhbONvl9BpRVEIumHAv68V0es5p9O6JDeovsIzqnda/ywLd4aPBklhyUFeskuIWB/iaca1dsI2em0OPa49BkLFYv66yoSREeuSC3kkVZxdCoMLuvk58wM3GxFDXSpPNCUIOoh8BwshXEiwVh4z7eEboLpyhHu9zrXDIolpfX3mVY3/bz4DwAy+OcNjf9CLHz4+L9ew==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=QVDI8keQrRi5FZ9peukyndqg14X+0edA/DuL3aE/cHw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ODxmHCPK
Subject: Re: [Buildroot] [PATCH 2/2] package/snort3: bump version to 3.11.1.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/snort3/snort3/blob/3.11.1.0/ChangeLog.md
 > Removed patch which is included in this release.

 > Upstream switched from pcre to pcre2:
 > https://github.com/snort3/snort3/commit/bb80b5d754774fc8b1c9c1d9208b6b78cc609521

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
