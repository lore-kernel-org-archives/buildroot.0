Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AA8CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 19:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7724615BF;
	Thu, 18 Jun 2026 19:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siXdeA2qlmsR; Thu, 18 Jun 2026 19:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23811615B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781812032;
	bh=6x3gYvUBPLvcskkI4NF0CwfMToTEHddqypq7EvgVn2g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RpeVctAkngysBxt/oOFWLtCKDnz2/iofZlAAKyPzJ/+cq/3z2Og5P0fBxhe8MUmnz
	 gGGHTVR3+hsTIPbTzWMtDe6M1WbhQHzKKYe9QxDsg6lAC3Z1bSrl6Sa6/vmjlSdYI7
	 L7nAw4+cJxzmHWE7BSe2HkpMfZZtoFhj8ptbSoOEVhjDfjP4DNdD1k/8yxOXyrJapw
	 trOqa59yZ+G4nMhqBb5zG0DHuu/upqT866L8Qtm6T6DU6ASnKNPxmZwkmcaaEasftv
	 5SA21cNSUU0eEGMtdJUYuxRv9qNx5lM1nEgpVpYwSG6sRokb5LtDJp/VULpJAScnYE
	 vYDJXJTrOXqpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23811615B4;
	Thu, 18 Jun 2026 19:47:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D43B9358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA70F8445A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvFL-HYNIHIS for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 19:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85F6883BF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F6883BF1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85F6883BF1
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:47:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 711537817; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 19:47:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1waIhW-0000000CpPI-4C07;
 Thu, 18 Jun 2026 21:46:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260617185844.736701-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 17 Jun 2026 20:58:44 +0200")
References: <20260617185844.736701-1-bernd@kuhls.net>
Date: Thu, 18 Jun 2026 21:46:58 +0200
Message-ID: <87qzm3d425.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LX/RjHrjudo9DJq5SrXB27eeESuS/usTIg8D7yN/GO/0ChFmzS00I4NRciHXz8SCCvSSO0XMFchxBsbTgfgPjGCJkFdiD//IlgfFRByjWXwVqFObuf632FW/CLJCz66qqCR2vmoSQbIdu+3/e5YAMsV2LHq2XeFVQMNSjyDNKBnTWT0B9fn9rL1ovO5rVUXaR5HuoXgZitvPBdiNIokmOm+LEPyX4OkPasywo9Vwy+CmrTFsLLKB6yCbkVRYA1ZPU3R51+hLJuomBNlx2bENAduCvBaGiYlTJPaJl7hai7krRKuTLWwVkmQMQvptGVGkKVnJXVWRUIIraZEJqy+0yg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=EW7PzfRb+lJ2BIAeDJC0r9D+YSsneaSRUwKbfWlRoyw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LX/RjHrj
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: security bump version to
 7.6
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

 > https://github.com/squid-cache/squid/blob/SQUID_7_6/ChangeLog
 > https://seclists.org/oss-sec/2026/q2/896

 > Fixes CVE-2026-47729 and CVE-2026-50012.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/ddc267d7369b295a47838888dce316c02f22f5fc
 > with the exception of an unrelated build error of the libcap package
 > using the defconfig br-arm-full-static.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
