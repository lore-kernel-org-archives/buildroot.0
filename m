Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BFBCD6E4A
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBAF841E2;
	Wed,  3 Jun 2026 07:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYvgJwWNa90U; Wed,  3 Jun 2026 07:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACF298419E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780472933;
	bh=HQD8+++mkRSd3828PcIK7SQa9z+INAh2jllepKGnDZU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxUYJXCC8BAGG/wW2AEnwK6rMrmrCCOgEeIKFwNMlS4Vwg3UJMkWpd7D3NyZ8eFY+
	 39Ir5WX0TmUUSLa81d+X55LA/ahu3fUcY1qks469F80y6rX5KH15FkIqgCVZRHd8jy
	 kprAOpUDYb2qBAlNf2gGNmG5KxoSmLIBpXx+pQwkJBkaVUJBLYlvjR65bu75YtBVx+
	 2EYFKi8EWQTjhOmw+DfkayY9P5qhyRQP82Ml8IU5QYTz7kU+r6XQKmujtMrK7wz/yY
	 WV77WdfVkwvLqLa8Xoj+wBR5Hz2QfEdbM5WVgNaWSKig/zRlwzyOruXQ9edgiRSV1T
	 t7rRhJxPx0ypA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACF298419E;
	Wed,  3 Jun 2026 07:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFF0E192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D13CA8419E
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz0OL6kONqfE for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C737884198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C737884198
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C737884198
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:48:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -184504224; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 07:48:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUgLJ-0000000CGjS-1iGN;
 Wed, 03 Jun 2026 09:48:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260602202245.51928-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Tue, 2 Jun 2026 22:22:45 +0200")
References: <20260602202245.51928-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 09:48:49 +0200
Message-ID: <8733z4qd26.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SpD+bIYR1rlWLoay1rEzQPMgWuIT0ab5gKLEbJOUUmpGiD6FP5H4PXTvZ+HAjpHXk2Alxf9/aSSrnbPAdmm6dRBumwz1TedxMBhAD81lRY53ggcG27JyDL1W32jS3EHIe0sse4MPhOOL/eHdeWbw/VSt2kJmWVlqwE2St2wYjK9woh0p60R2JD/JMG2tY6I4kv1bwKpCoDaei2iASSfLvM6c/fOsaGTcaMiM8L7Odop4g0e9N7szDrTe42JcilQbmZBf+5h/pZGy+byG3D9DB2s6lj8B+m8MfTD3lNn3DKekF9WuUb/JS6XOseziSZUkk4RzuVqR5YVjuEO4jvUkog==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=OOAv9KgfzTVU5KYqAw02zj5zHCP4HvME7zua2idK70s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=SpD+bIYR
Subject: Re: [Buildroot] [PATCH] package/libssh2: patch CVE-2026-7598
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

 > This commit fixes the following vulnerability:
 > - CVE-2026-7598:
 >     A security vulnerability has been detected in libssh2 up to 1.11.1.
 >     The impacted element is the function userauth_password of the file
 >     src/userauth.c. Such manipulation of the argument
 >     username_len/password_len leads to integer overflow. The attack may be
 >     launched remotely. The name of the patch is
 >     256d04b60d80bf1190e96b0ad1e91b2174d744b1. A patch should be applied to
 >     remediate this issue.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2026-7598
 >   - https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
