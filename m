Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C5FCD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 727E44237F;
	Thu, 21 May 2026 20:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMmWtksEoCB0; Thu, 21 May 2026 20:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F330D41D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779394066;
	bh=7F/HsUOWS/ER9T3mTZzfpXwhBjLGo9eGIUOzvEG9BE8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FqcHH8QKBaZJYnyTO+klohAKsDIcDJm25z/w4xhcRkqyDFpFUTJkebijqhD/pKp0g
	 4fc0KF+8ejx+qLVyqnP/oh9EF/emYH+7LZDPa0vVnw9Pw3hQFwGdckn1x0xbgHd7hA
	 Y7eYvIHWSYAPAAgJaSpq8vR/w4lRCz/utwxYrT0s9gWAdHPc7/H3D48zejwPiDOwUg
	 OBInTd8qf1A9oIW2HGWc/WYII1fPLnF38qrchKUUnc9AyUc2BjHGBRCM+MEeUfvMoR
	 4DDMtbmBTQRrQWGoMIHWAL25mXQzoZFjuZ2nmcsiKystZaizW1gM0Ysmpe+MaY//93
	 RG6EjkBlsAkiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F330D41D6D;
	Thu, 21 May 2026 20:07:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD2C3B9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54A1D41D6D
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bppv7I_thniM for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CEF441CA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEF441CA1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CEF441CA1
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:07:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1851383385; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 May 2026 20:07:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wQ9g8-0000000CLAY-324e;
 Thu, 21 May 2026 22:07:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260520100726.535469-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 20 May 2026 12:07:26 +0200")
References: <20260520100726.535469-1-giulio.benetti@benettiengineering.com>
Date: Thu, 21 May 2026 22:07:36 +0200
Message-ID: <875x4go7av.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uHChPTltG8L1qWXjTq8rJZvERPfYj4ObEsErFJKoNOeVnx9jfG6ehWr0I4xeuOVz8oL1s7aoGHY1vWdBnSnq6bUvaLR/qItk/6m1mhMpHjHBAkma8EOPiqYt33O8SjIolF/FbA1M2rzjtjTjb0R6tp1Dk+g/TRMvcGGetMzbsNramUc4GrxQf0cQAiFs7H2OOH1hv6qNibVEj7kiX3A3mRVAL0lbixhNep2AVpVn87V5HgWukIVtRTgjswANLIqpf4NzDWySqQp1X5vStVx4ZQkNRJPht5YjRs4uB+QUm3r68pypBtHWOEjgeGE6mOLp0XaXZdJttZdSovGWSY7L0g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=auIPqwjfL3qJi0AmKiiTBegwrXU9zV4N4E2ZtZh/7Yo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=uHChPTlt
Subject: Re: [Buildroot] [PATCH] package/wireshark: bump to v4.4.16
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > For more information on the version bump, see:
 >   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.16.html

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
