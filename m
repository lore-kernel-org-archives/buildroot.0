Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E4C1077617
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30F2A4174A;
	Wed, 18 Mar 2026 20:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaOLt0uDxeIs; Wed, 18 Mar 2026 20:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B423C41749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773865883;
	bh=K3eaxtAA+yioucB+PUKiXUkQFnsEkaqliUqnXIkTtnI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVEGNuGSKgwUIXEaPD5e5h8lj26TDROW7zMy9vJU8OD8QeoOJ46EMfoN4VMmyarKo
	 u4mGrbFMPImMwIuVA6s7IFNc2zECZF/T6S8hx2MiL+llcZnLxpz2/X8vcGsbVc3s2i
	 E5LlBOz4GqUp/wFvG7GbGaqXijzGCfOFx0hHZUqQXFTRPfjBsSGGyvbn4YZ8TS17Lx
	 KrE6ciPqwB583NRaTyQHqoSM9pABeoRUYodis3JOs2b3dpR6xLbw0x8CnffE7p3dlP
	 5UqYpJEP92BLZbtXTYuONrtxWLNF4AzaRDW4KOlfCkDL6/++WXlPlp7H0T2uPd6/xG
	 5o6IZd92aNyMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B423C41749;
	Wed, 18 Mar 2026 20:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 537E21B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4501041749
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58DUbqgc6jiU for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 184CA41738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 184CA41738
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 184CA41738
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:31:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2059486371; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Mar 2026 20:31:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w2xXv-00000008M3O-3EZK;
 Wed, 18 Mar 2026 21:31:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260314183500.3159948-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 14 Mar 2026 19:34:59 +0100")
References: <20260314183500.3159948-1-bernd@kuhls.net>
Date: Wed, 18 Mar 2026 21:31:15 +0100
Message-ID: <87h5qcg9rg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fj5S3Ao9o5j64OTGUBWKhTQY6ZQVzPJeFnxXkGfOB7w5De3xtgqcy0qds1Us8TvnffzzFoqLv2wgbhQOF+5sd9iKpkLNhCC1lIqLxesuLByf4adARCGGH/WrIQioXdABSGtOYA6nNLqwjzlj0vAudF2VGbr7QjymnhVuSuty7R1dcNzKC6rqVUEti9e9jIxdQKineHFZvbSVgFy1EVsSgeBMJYDCI6g2K0kzY94sdRTzTF9me6xc4OSeJJJu1OEqm2uNGfetb+4PbxpOs3r79zi4qSIS2SQnKL6zDFE9WsTcJgGYW6oCzMLDqyDeNUSUPKmVvKZAu43lx258Tun/BQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=huR6NM91iir+RDbOYBs0iRxvKYXuCYrHkdGGTA7bf3M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fj5S3Ao9
Subject: Re: [Buildroot] [PATCH 1/2] package/daq3: bump version to 3.0.25
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

 > https://github.com/snort3/libdaq/releases
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
