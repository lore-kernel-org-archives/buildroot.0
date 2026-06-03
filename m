Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2690BCD6E64
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 08:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87C76139A;
	Wed,  3 Jun 2026 08:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQW5OKEzh7EA; Wed,  3 Jun 2026 08:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0070D613E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780473871;
	bh=zsa1rk6HkM2Vz0DLN9PPDRwNgdRkfdiPp2ZjGJrQVT4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjVKzpsHxsgK6rK721+VHNAYrOJ/OYFS2EyM/NPOyXg/msFUQ300VLus+tFl5dkJz
	 EzSpQ78IBjvbOKY4gNnqKQwnXBsagn8H+5ntomtoss0leWrcmjdiXIo79If1cQ6oYf
	 uy3B4IoR3Hw8y2TEIUfNOEGnaFl6uVwhcn5fmQuT0lVXSBnKobMpWyR+CaUV7FoynH
	 9zAFna3Jya+hcQdIRJ6uo7ZvBUeUuqiXD1v0z46KIB9a4QKci+ZhGA2Z7rXn3fXWft
	 RIHLeRsDaJGzMpM0oC2grynWel2yKr/5GU7j7G8nk3l1zC6DAeKYEPsFdzjcFsacEL
	 XaRKByO6ZO5rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0070D613E5;
	Wed,  3 Jun 2026 08:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C5F3192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE389613E5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9T5Lf1Vseef for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 08:04:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D66786139A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66786139A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D66786139A
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:04:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1085885323; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 08:04:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUgaQ-0000000CHyK-0zfN;
 Wed, 03 Jun 2026 10:04:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Koen Martens <gmc@sonologic.nl>
In-Reply-To: <20260602205157.124479-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 2 Jun 2026 22:51:57 +0200")
References: <20260602205157.124479-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 10:04:26 +0200
Message-ID: <87qzmooxrp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nZnpVE0anE40QDsKAeWL9PxEYs9Ok3arzp/rw/wjhXlMBQRUnu9JT30UU1XsWdU25JBhnLPPI5mpMoeXivg8iyoaXEVB98+Gb4Z0hTZcH7T3X9uPkuZ3RQYeUsFiIZL5MFA8v76d1vuF3b165rNlyUfXwAjDpN0Y42toC/LmRkwYgMYEOgGZDDYpPOK18tOlmEML+d09PARW8qnH8Kb3EFVuuKqemjsj3ZV8tkSUipTHPH2LoCDmOM6wHpcZ+aHlRYsvLZsIODmDsvAIhGAwvxHQJQ8/1CXM87lq8tNU4UDirHIJxqx/1z+ns6+fMuTELpuP7Hmn0Qc3T8Y4x+M1cA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=JXxJwgAER9yy8OU8f2jFaZw4wTQDS3ixmRh+23yCjac=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=nZnpVE0a
Subject: Re: [Buildroot] [PATCH] package/capnproto: patch CVE-2026-322{39,
 40}
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > - CVE-2026-32239:
 >     Cap'n Proto is a data interchange format and capability-based RPC
 >     system. Prior to 1.4.0, a negative Content-Length value was converted
 >     to unsigned, treating it as an impossibly large length instead. In
 >     theory, this bug could enable HTTP request/response smuggling. This
 >     vulnerability is fixed in 1.4.0.

 > For more information, see:
 >  - https://github.com/capnproto/capnproto/security/advisories/GHSA-qjx3-pp3m-9jpm
 >  - https://www.cve.org/CVERecord?id=CVE-2026-32239

 > - CVE-2026-32240:
 >     Cap'n Proto is a data interchange format and capability-based RPC
 >     system. Prior to 1.4.0, when using Transfer-Encoding: chunked, if a
 >     chunk's size parsed to a value of 2^64 or larger, it would be
 >     truncated to a 64-bit integer. In theory, this bug could enable HTTP
 >     request/response smuggling. This vulnerability is fixed in 1.4.0.

 > For more information, see:
 >  - https://github.com/capnproto/capnproto/security/advisories/GHSA-vpcq-mx5v-32wm
 >  - https://www.cve.org/CVERecord?id=CVE-2026-32240

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
