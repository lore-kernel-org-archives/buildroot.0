Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E0BCAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2EE60E0A;
	Sun,  5 Oct 2025 13:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cac6YcaV357d; Sun,  5 Oct 2025 13:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03EEA60DB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EEA60DB9;
	Sun,  5 Oct 2025 13:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E9AB909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AF5783CAB
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdqpO546UsuT for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C88B83C8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C88B83C8F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C88B83C8F
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:43:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -237860125
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:43:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5P1m-00GnpR-29
 for buildroot@buildroot.org; Sun, 05 Oct 2025 15:43:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250929085404.918021-1-peter@korsgaard.com>
Date: Sun, 05 Oct 2025 15:43:54 +0200
In-Reply-To: <20250929085404.918021-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 Sep 2025 10:54:03 +0200")
Message-ID: <875xct31lx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fxb+++XsjIrwXakGhExejPmNAn7T21wIbmHrophPDELt/yVJAWaC19QTLVGkZMqapMk33TrDOqqka7Hp9nB4KEIkxNYLb+MVXfCV1UW6nDqZkjgE6T0hmVvvqtrBQ7na9ZmWEj8OZuKFd+aWBuPVAXZ5rpJy4c5wTYpvr9G/DYEXiBE15GgDWjDHTTtqdR+4m0eEtUgDmQ+pDXO+HApPE62c7K6mlqYoCnrP9uzHmRehTYrdabO7HQDUGWynaVnIQb6tjN0nLVQdNN/xOKp/G74hf1yrlnL2uSM+obuT2k9LJlE3a9TpPOYNlzV+2+etfsJnYE3hEuOte1I7di74YA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=WxBcPPYgHnhcGWqgLQIjtGjsxahBwGtOG9xXMXDnG1A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fxb+++Xs
Subject: Re: [Buildroot] [PATCH] configs/roseapplepi: remove defconfig,
 broken
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

 > The roseapplepi defconfig fails to build u-boot since the move to GCC 15.x:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/11501385206

 > The issues are mainly related to missing includes, but given that the build
 > has been broken for a while, there is no mainline u-boot support for the
 > platform and the minimal kernel support has not seen any updates since it
 > was added for v5.15, just drop the defconfig.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
