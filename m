Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9106E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A996087F;
	Tue, 31 Dec 2024 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvKseJz0EcxF; Tue, 31 Dec 2024 16:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A57B460858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57B460858;
	Tue, 31 Dec 2024 16:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A350F972
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90C1E40F04
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8ZLQgHj0Sg2 for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 16:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08C8140ED1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C8140ED1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C8140ED1
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:03:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 571725677; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 31 Dec 2024 16:03:17 +0000 (UTC)
Message-ID: <5e86de13-9fb2-4d0b-ac30-7d8cb8b20394@korsgaard.com>
Date: Tue, 31 Dec 2024 17:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>,
 Jesse Van Gavere <jesseevg@gmail.com>
References: <20241231103518.1681479-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241231103518.1681479-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VG+RI1eyNs+R4YP/LAJ3GpdmF++fkTcdil5MDexGlBMnOqvEP2EBMy2YF0K0R1z81dHuENtrANhwB0e2jG1kz/lp1HqRgT2TGQ/VZ1QlHqW96BT3P7ucZ6AktFnbKZ2PANYbOuQXkGcerrds6wBndujvTfDogt29eKVofyEp7h1TK5a6fXDl28qPJyXJuRMc5At71i6vMQDIxbMKRs1oaSxC9Osv+fTQqBGHI0AdXzxL0o6P+iA1vvWL9hnnUdtmsTSe8sEU0td9DdkHXIFXeg7mBrBh1SD/Q7n8dFKiO7IHwnFsTJVz3R781rmXKZYWtX4zyL0O9NNMPkNDhpDFHg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=tg1iMuKdVer+NTquA9IQJP2stasbmdyBVFIrKzhgfRQ=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VG+RI1ey
Subject: Re: [Buildroot] [2024.02.x] package/qt6/qt6base: fix
 QT6BASE_IGNORE_CVES for CVE-2023-51714
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/31/24 11:35, Thomas Petazzoni wrote:
> Commit 4009842cba631b1061bcdea799e0802c40ea549c ("package/qt6/qt6base:
> backport fix for CVE-2023-51714") brought in a fix for CVE-2023-51714,
> but got the QT6BASE_IGNORE_CVES update wrong, due to a copy/paste
> error with the previous QT6BASE_IGNORE_CVES entry. Due to this
> CVE-2023-51714 is still reported as affecting qt6base, while the
> security fix is already there.
> 
> Fixes: 4009842cba631b1061bcdea799e0802c40ea549c ("package/qt6/qt6base: backport fix for CVE-2023-51714")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
