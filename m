Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23D0EE20B5
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 17:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4165241A84;
	Fri,  6 Feb 2026 17:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8FiAzBJzwCQ; Fri,  6 Feb 2026 17:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E2441AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770398325;
	bh=WeOE8ZZ4z0PofcmbDjpPHLEaNl7Z171Mm9LcP5QR/1s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bo1c4yjdPb8NgfPX9MFX9I6IuzXK2HikpGQkYYRwLtUG5l6cbu0BPBFszN37nMzwj
	 Rn9fCoo8wtslybxnWdE7BhvFV2UvsJoSm5o5nrNjX7Ola/k7/ugZTIJDKEn0D4rw5Y
	 kP1pyczFUJAAlsAuqFtvzf6XryDpLzw35l35LhvQm4qcPK5ONRDy3skri0UX0EkLrK
	 gFlVADr3y3pnPtUpZjifStQr8XvhYedFBmg+Be0u9X4cjPBO+M+c550FU5XeuzcX6t
	 gw9qFBi/mb+G+9EoeYO73MCh476hBSlcZN8JV3XxuOF5oaa0hTPBrIrPJ8V2onDtAx
	 Vpr6/g57sRMHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E2441AA8;
	Fri,  6 Feb 2026 17:18:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F571378
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7E840260
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id midKy_Pnri6k for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 17:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1BEA40073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1BEA40073
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1BEA40073
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:18:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1909840362; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Feb 2026 17:18:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1voPTa-0000000FLUV-07oo;
 Fri, 06 Feb 2026 18:18:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260205182549.3299927-3-fbstachura@gmail.com> (Franciszek
 Stachura's message of "Thu, 5 Feb 2026 19:25:51 +0100")
References: <20260205182549.3299927-3-fbstachura@gmail.com>
Date: Fri, 06 Feb 2026 18:18:37 +0100
Message-ID: <87tsvtoknm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gl9aLLEJ1avjvdybTcb8QIJ+aGZhRez5YqoaHJOQua2ek+n+kHMelxGBpGDV9jps37WAI63j9ygYMtf4avVS46utymcUjwqzvjzNg+pewIp+Yj8ZHkyDcB2N6ATQdgyQgrJq1idZK3Wlvs6qfJlvRy9KshoZAsF/t4J+agDFPNO0lSfBULxH5HYBDhokVxL0L58ZVQDxXef1zkAJKpNaqtXyKzZbv9kjStJZVXHJRk+6rFXVMFOQfTr0poWNaXNe04x+0xipGWm2+/GvrksIndPpKOisChSxszwgDJaAHY41lj1k9syHFn6Qfg9canbovtSvw9GsZM+JVYVv2z0d5w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=yaGqWgd6JjmTsdMMg0Qm4UxYMTZ33QDwld6QweA3e1k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=gl9aLLEJ
Subject: Re: [Buildroot] [PATCH] package/memcached: bump version to 1.6.40
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

>>>>> "Franciszek" == Franciszek Stachura <fbstachura@gmail.com> writes:

 > Release notes are available here:
 > https://github.com/memcached/memcached/wiki/ReleaseNotes

 > Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
