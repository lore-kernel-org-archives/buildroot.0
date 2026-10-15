Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F22CC6B33
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 16:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F4CD607D3;
	Thu, 15 Oct 2026 16:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUR4P7sGzD7o; Thu, 15 Oct 2026 16:01:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 368CD60881
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792080082;
	b=CttkwjBbUOY+IN/4G4J4CX2g1Rn9ufjSaZIrKqNEx4EUu63aeR7dUWcF66/n0/ESBUKV
	 gVydhZM43c/63CpOT1fhXqTHZSuZqIIUePz8/ymnNsfkOhQZjUHR6tGsjYkvxsbG+zu01
	 eqJlC2aW1m6vt+hwhtoLbkmkN2xVXuAG0Kptj/I+W0H8rnT+txEfBSewcJDlGZ9RzP4dr
	 GTFsO1nlRZKUd0kNizOqu/EWWBRICiGfCCFDAXnRTU0Ja0hN8SXpxkORlHy8Zgsey+w0m
	 jRuHkT/Kp0DBD8kIo2d48dNbRk/QBwpzBS9PC/M0EoKO6Q02sHhaW5IHvCd0U+f3eAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792080082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tufrPbBBPVoSEmkEQMprAq/5zSSP3rhvQe1qWUu620k=;
	b=fBDkD948OcsWIlpujYX6dzgqiA7TdwiBMTL5nbzVExZUs/dgoaUMq/S7/j58T4H4GYN1
	 bLq6vTevyqcwippOFcgjuyD9Rza4EhebNvas1yV8Ufse/ihiHQRTofMjNBERXIO5eKXwX
	 1AEQfFCKGaYvr/0svlhMY+ba2RpRfMOZfjsGn7tyQ8S45Gwj205WlYn7ZcDmYJaxhVzja
	 hd7MQiHq+kd6NkjaQZ5ldyZcTzNGe0utwmCFEdshmFlQrHzEMRtAvSXisvatFBhvyp0uZ
	 RM/Z2l/jtRzpFO0W+ZggKQUCzWWCMtB/6DQYXUrsTBsfm1pbkh6FkS2vKJt06S9e1uA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792080082;
	bh=tufrPbBBPVoSEmkEQMprAq/5zSSP3rhvQe1qWUu620k=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lS939Mu7EIi+wat1w1UAQ1UVzEBwfKg9GXzDqLf292+YrUCHCTncLbES3lsRTix7E
	 m8Cvh5UJjM/42zCeLnv8ygHw21DKC24YQKqW3q0fYklPSN9USZDHyKFp3jJQNRafXB
	 VpN+z2D5LvMOM9FqhUHyuwUCWyix64mbN6eIzoADjCEjKzKCw7M2ECMTWsbDNjsf31
	 NIw/umpu+131StNmOzMNnOH37o/8+q3D7uEeuCGfBMPhc3JcMz5XoZwJoGwgPVYIRs
	 poGWJswmP9Jufq3DDbxwSHYgirv2upbgPzBfzw5LMX6opT9OF640w4bWIbbb6D2vgv
	 18z/mF0fa31wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368CD60881;
	Thu, 15 Oct 2026 16:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F068A2AC
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDB0640116
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3mDU8sI9jvX for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 16:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A3E9B400F3
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792080079;
 b=CvKRb69+nCHYpoaxLJNmhb8sOmjL9rBFDKVWJfIVhWSTo2zbKvSTjdy4jqbsjxz5bB12
 WLbGvBt1JOqc9eglZbqhKtpy3VUnnDHbDWCuT3446ReXgyB8qZ1T3XBHUXUmotCbiwAM/
 gDz+MfhC2zPA/C7RB5Yd2hkHWDr+LtuL0ndLVNZ81TK/9+pgVBAejNnqOcjjVLmh0eu7c
 En7i8KHRk14+BJX4rH1bDykeeGjqwt4gfLn1647U3CpcdfeW1wCCPrmz3IRrdiF1TV4UL
 B62R/iRXpAiTS23XJZQvAtx/sl4u5wfAWFxelhvPD3ZkBVXjnF2lYgE7OLI1HOdMkOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792080079;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=c4ulZ2cSiseW1ajAEBU/KLRVXg7w6SbL0gciDx746o8=;
 b=Jbac3hs5TgyRxx+DpClP+4Es+M/fzsbfMuXIdRLEAQXnRGfY4so7CJnMvC+6uQOhq0+U
 LLkV8e3Ed7G8iGo5NYfKdj8q+9YxcFJ1U0k2xkarJwOCHBcA2yTIjc6bfKNLZst2B4PUZ
 rUcJ2FY929AQVztmLOw4Jtz/ZsShxnzOak6wmndv6stHjZYLR/FQZD3IvqHSVkt1pWuRv
 18doqr3Z14zEpo+ha+eNhSVOYdaF4KXvhzcHPzRmnI6MqbCdW6EAhOlHrCWGvKcESrDbM
 mkq+UGE010Ed47Z7H1nYMik8DTtOs6NE77wb1OX2eLiClxOA/CNq00oVzfR6zG2tvJA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=HBWoydFx; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=HBWoydFx
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3E9B400F3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:01:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HBWoydFxblfgocvS5bf9nqINUo8wYsMPbc8BUZk/+6HAiDqihCA+0GpgVZljEw7ZksTQ6Brr6WzMB+ItmmQAaKo6EWqStmdzYFAhYsJx5Inc0jLG2N1vXFqovVcq3BaPOgX3cEwmCYbhT+jDYy2HcU83h9H4Uo4LfaRrLGU7q2BfD4DOpEAl/jsQnoKaHUKU6etAo1mgp8p/f1zTrF6vPVmVb81kBvWT1hk+9xUSiSIognN+8SplL47Fgt+Q31BDv5fWdKtpCBCrSRBwhTtzLPnxnmeeeDUcdF5VHrsry1o6WazBuE2YOW5QaGUupGwwRi5OAVed1m5FSQQvJ0KUfw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Z6XYPpqNR5hzawlgORbK1ZW0+hIWmlBgKs06rhibeyE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1555918967; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 16:01:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xHNtH-00000000Tcl-0Fa0;
 Thu, 15 Oct 2026 18:01:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi <michael@amarulasolutions.com>
In-Reply-To: <20261015151535.2820435-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 15 Oct 2026 17:15:35 +0200")
References: <20261015151535.2820435-1-dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 18:01:10 +0200
Message-ID: <871p9rdkc9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux
 to 6.12.112 and U-Boot to 2026.10
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
 > version 2026.10.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

You may want to move to 6.12.113 instead though:

https://lwn.net/Articles/1100611/#Comments

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
