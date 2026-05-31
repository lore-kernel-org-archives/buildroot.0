Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD23CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1840851F1;
	Sun, 31 May 2026 06:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuHbAHt2npe5; Sun, 31 May 2026 06:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 592F3851D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210442;
	bh=l2vhd4/Qrq6wTY7q701SHmJ5N+GXdZKC8sUhqQRFT2E=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDxok8dMBmPW1KAla1ScMRbagdFZuJbNj++mBIhbVGwYICTSiF2ApGZs2JS62xX3j
	 a9Qz9FamKhZr3WEtp0vYgn2qZop1WcTJwbvlHMgqfJCsmwDnUdUDMR5MIs0De0sZm4
	 sM6szm8CQ8DG+JusBUdw1zhBZK5PjSyMNKbxP7/p/Lz4FNYmnW58x8MhahcCWPt5iZ
	 xsUHJNnTCG2GkYVayHbYFA+umoaUQ1E3kpiyMmX8UAEzbeliFfuas6jPYZeHeD/Mej
	 W+K6OuM6itxQOXMiBUAefDBAv4BDjRiwSF8ij8/ctE1bsOriHWPKIHpfB1vO9flugX
	 kCbsfMNQ9PZxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 592F3851D1;
	Sun, 31 May 2026 06:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB70389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 236A960F03
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HE1ExXovSe6A for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82EB960ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82EB960ED6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82EB960ED6
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:53:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1588942612; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 May 2026 06:53:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTa3U-00000006gEn-0IkD;
 Sun, 31 May 2026 08:53:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Horatiu Vultur <horatiu.vultur@microchip.com>
In-Reply-To: <20260118133155.1910082-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 18 Jan 2026 14:31:55 +0100")
References: <20260118133155.1910082-1-bernd@kuhls.net>
Date: Sun, 31 May 2026 08:53:52 +0200
Message-ID: <87mrxgdq7z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eBpvVQgKJvJbVmH3thHnJG+EWywpbMbSobtEkhnVx6fmJq8449HhRP0ihzLtNSRqN31+7n7OpZXkcR44i5AOkYXBvvX2WC6+idLs/3t28KmVq5MQaTiqvXiJW5WOib4Axo/xtmdoc72s3mdT/wPWtlv3NyA4KFnKF9bXOZutpvXYho/QT2yF6QPPuwRzVoobW1E2JbR98W5lxBTRrs4v+g9ZMupOJA57uh521ble/JwopuCais1FnutFFCZDBPHUM0e/9HGTlzt1+07nI2JxGTh7X2waFlyu9Tr22w82GCDBbBgTEi+nhJ34xgbxI97FHCT7jw1o/KReNwsGy4dqgA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=iIlrKYw4zzP7GRRd9cn94IVCo1pdSyInE3YJ2N95Ygw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=eBpvVQgK
Subject: Re: [Buildroot] [PATCH 1/1] package/mrp: fix cmake 4 compatibility
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

 > Fixes:
 > https://autobuild.buildroot.net/results/d93/d938025a881a14003c1b50065f163115e36cf33e/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
