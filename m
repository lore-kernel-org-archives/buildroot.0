Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFEC61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 18:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F2280B0C;
	Sat, 29 Aug 2026 18:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htqrMVZZws2V; Sat, 29 Aug 2026 18:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788028023;
	bh=vRaLnSJw51c2CkXCDxB1lLgjKvUayGNJwkQy+AJ3MB4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxI4Biboa47KpS3tv8K+2HrdBHSR82K/VyqK0CVSd8q0LgJvcrGFnujCvk5Y+t5Dp
	 mlVwF5SXHSUZUcgVu8ZWBIW1xEeZSEJdHMFiobaQdhw6xlozXMntDqOeGQ2gILX8sF
	 OQgOhV5CZeCWQw2t4/HMjiYaKHlSoXKQut8wqQIT1rwbR8lgBdXD5qanO/1cTZlYwx
	 rV5MwBQM/huofmPWQzU1UHAOZ8r8WC7HnM9jlUOytFQhUHWRgmLTu4+glmuBFzPBAP
	 uUN5viDZ9gvWDMxHYieHKMx4BRi3N7wSMaGegIt6slMad2zfunFSR65vAipdfuuOyo
	 CMgP9OkwcTSog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6CBE80A82;
	Sat, 29 Aug 2026 18:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1EDE9D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E2D808AD
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmhUC3MgLaSI for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 18:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=bYbKVN6J
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D88CE8081E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 18:27:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=bYbKVN6JemKHIwv3nXGUKbh3Aheo9MBay+FuRxHjE/xQ73ErnSynr77gZ3E8y2wubY2RLx431Dk4f4b1+FHweDGVfwh1uU541uu0Qikie3tg9VUt/ILEKbVkgeUIKfw9TchS6fS8fhd5aBYUucsPliyuBeNcegb+A6nRUfLQi8jkL0H1slJZhDXtdXEhi8sKvEfIMZ6VLBeElluTYGG0CBgRQUPm1IGF8HuiIL0ljGQvSo6wOUM8J5zGchscro47wS0x/l/g9/krrill79nWjibkWgPEnOtqM35PIjzQnSVF+iymTSD6iAxlCfxbBpdZLcOcYcuDmWaAfYOTtnqkLQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=vXSwNr6/Nh1dn/fZXBDobQqKY6al0XjgfJ2wyJmyVkc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 180708989; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 18:26:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0NlX-000000002m2-2lDD;
 Sat, 29 Aug 2026 20:26:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260829173825.93129-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 29 Aug 2026 19:38:25 +0200")
References: <20260829173825.93129-1-bernd@kuhls.net>
Date: Sat, 29 Aug 2026 20:26:55 +0200
Message-ID: <87y0dou6j4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.7
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

 > https://sourceforge.net/p/fetchmail/mailman/message/59381086/
 > "Fetchmail 6.6.7 bugfix version has been released"

 > https://sourceforge.net/p/fetchmail/mailman/message/59350877/
 > "The 6.6.6 critical bug fix release of fetchmail is available"

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
