Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C148FEFB7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D1140D4B;
	Fri, 27 Feb 2026 19:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKF7RltW0M9A; Fri, 27 Feb 2026 19:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5573240D49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772220476;
	bh=fmQAIzGTxYh0JIMUGWcfq5XCI+mfOisrOxk54iUCP4s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TU7yYgmCXHeojJ0AggvsWOXBei8cYGN05pFeWUKAN7EUdj6JJU4O0GUitkswkTUaQ
	 /OiqE9VL/KX0cmMYQ+dG0M6OwmkVaXLEAjb19nFYPL5zkEbGDzHVlzZtI+joC+4wLD
	 JxPXH6og2ywSHKyjZVSZp2m+FWRwl+iNymhiSrK9zSfGsbx5BxICkBDTG0HOj7HelX
	 BaGqLngn2mg7YbEkO3eIcKpm6Z1b3Ah/AaitZW/gQNC7ayWzQLaR9mder7o2fUYYe8
	 n7HMTU5gDRDYhxDm5KXyMQkL00VUHtMs0Vi3EYvtnnofsAAfnzMnKyNtFTWNBGKGcR
	 XahkyobRJRy+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5573240D49;
	Fri, 27 Feb 2026 19:27:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB0D01F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACA6640BE2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R95tgq478BFP for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:27:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 945D34060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945D34060A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 945D34060A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:27:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -292536122; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Feb 2026 19:27:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vw3V6-00000008Ih9-0Tjv;
 Fri, 27 Feb 2026 20:27:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260227181954.1335186-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 27 Feb 2026 19:19:54 +0100")
References: <20260227181954.1335186-1-bernd@kuhls.net>
Date: Fri, 27 Feb 2026 20:27:48 +0100
Message-ID: <87ms0uoukr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HzVskuSkahQIZYtsp0pTYLSRAq0qvmz6U63oX9JByaZN7UiM4CvGb92xdrW+qoCJF/jLj4pzRxc+hXgsJdcThEQPA5yGdlBxdPok8nxXEsQUtjvn8KsxCZplwhI2NQNSIh52/zrHALzt8/9CxrYaXm4/Cjis0SEmFrbOzgSFdOcLamxmWlu87KYJGpcCTPnOfwS06aqezx2Od7ReWw+cjU4YdvsnxQCDkiXvnCkq8Abtn/Uvv0+BjIR1uFcW+zs4AuZlbuqj/bzazgVO/wnKLJvhMB1yfRFqFr1GogNwmnEuKVEb6L4r7jQppoqSbG6AhlfkKLAWHQk/cMBsu2GJBg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=VOuoa1pqxz/IF2VR4dmmCjWCUjDgKqGO2kZNtvqmecQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=HzVskuSk
Subject: Re: [Buildroot] [PATCH/next 1/1] package/wlroots: bump version to
 0.19.2
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

 > https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.2
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I see you marked this for next - But Looking at the changes for 0.19.2
(and 0.19.1), they seem to include a fair number of bugfixes, so I have
applied this to master instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
