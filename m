Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF02CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DD481DD8;
	Fri, 29 Aug 2025 15:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRQ9NRMgdx-3; Fri, 29 Aug 2025 15:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F1D821B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F1D821B6;
	Fri, 29 Aug 2025 15:49:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 358CD6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BAE541953
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4FmI8oyg5pB for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4638B4112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4638B4112E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4638B4112E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:49:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1514164810; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:49:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us1M4-00Ck16-0i;
 Fri, 29 Aug 2025 17:49:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Stefan Ott <stefan@ott.net>
References: <20250828100145.1356985-1-peter@korsgaard.com>
Date: Fri, 29 Aug 2025 17:49:32 +0200
In-Reply-To: <20250828100145.1356985-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Aug 2025 12:01:44 +0200")
Message-ID: <87ms7igmb7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=m44Wy/aKj/ycb+plVK8EJ7jKJ5yKcecJsOhcOAaZB6QfgKS3gfgb1ovzfnEjaO6cxAqhTKZFaXIRMohL9vc8ai/dUmLboeCgcCqR5bey+HjJRbTTcINGxs1TvR3iES7XXNdFruMX4nDprEPOZKwtjOZKFqvehREo8GWOXnqCmYjMF/RQDEdZmG335zjJBAusKEyXPqcPsqUDKwTxmDlNaYPY9qUgOY6yM8VooxCMqEmT1Tjkh9nX/k0I+W5Fm1uvYtauFwMIxyuoGScffpKgykS6zdC7++EN5LjogcNSSEuVm5Bp5EWqh1igwkuQNP3904M9J6u9pdJ+oMlbq6Aw7g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=POe9GwVScgV/huUtnBI7XdMPypmpd9FejTNyvdQwicg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=m44Wy/aK
Subject: Re: [Buildroot] [PATCH] package/unbound: mark CVE-2025-5994 as not
 applicable
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Unbound is vulnerable to CVE-2025-5994: "Cache poisoning via the ECS-enabled
 > Rebirthday Attack" if built with --enable-subnet, which is not the case in
 > Buildroot, so mark it as not applicable.

 > https://nlnetlabs.nl/downloads/unbound/CVE-2025-5994.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
