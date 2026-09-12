Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ACEC88E45
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20460407BE;
	Sat, 12 Sep 2026 07:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZq82OvDGJYm; Sat, 12 Sep 2026 07:39:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA82F4079D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198759;
	b=tILUIatYRXg+XgKyNJK4JDQVbIip0sLBJKSfEnrjaBS3mfnFKqkUxlMswUkVGnxSL6rv
	 vvODUUs8iN0OtkgVTOD2+EGPzlQHQC4/OzJu3yWWePTAOy0MZ4E/DSxWIV7gF1JF16VnA
	 76aNAfpeZMiscFNDR7QtXOk4Cgd97nU+ZNBxpEtuG4GAfI3CTXKTCSlnAvZP52Cx3dUko
	 +lEN41RpRZagP1D7237LBhydABLRAWs3ZXdxkSk5GKQlQpcXyus8B80ciXyy4IMYcClhL
	 HKJ2CT9tIJb1Z+qGofNjkBvRcB/SabdMbdUTmYNdkTHymKIst/Q2num8i7Okd5w4/Fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VugyK40q9P97PYw1M3mpLKZHTgpPYnLKDuMJMSUIHpk=;
	b=UUF7O6hvRbU9xwYvUKlmYdA/neb8EVTE3qQAls2hw+TaHpb+gdElY3m0dszm66hOdut7
	 nv0aMC4mrI2l7u2AqNhNAKFrwcM3a2hwrtCQQXyB5qsrReNsQ3+VXnhKx9mW35Rs1Kahi
	 wOHwp72kuBLftRbIky4GWMDctNvu4HEzwCjSaPz07Ka1vTxlmr0NssUIswhKSh+0JG0k8
	 Sbp4YSJNNU/j2BsoMt/fG9naW8b1zt4PmKyfl1VNj+2xjKzniqyAUecBLV2KiM3zRP/zT
	 Sl+F5teNyi+b3a/u8WHSRrqkSHeL3qvWUOCtQXkPg5at2vuqMLv1g6XiWmW+FxSXpTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198759;
	bh=VugyK40q9P97PYw1M3mpLKZHTgpPYnLKDuMJMSUIHpk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mtJ8PiSuDj1I6YeBIXJksQGw3ezhoLdbTOjJdlnyNDJBbadXjV6RSdo2m9Q3yUIGp
	 WxP5OrZJ0OLWAOa2AKVTNGSEsHYuh192YlDxjkj3KebT+nlXVxUBUOwrzr9j1fUwqV
	 0TODCPPKoTC023DZ3OG9MpRzaEGCqrY/cIKgWixXYAWEz5vcR3B5csF2Vn8uhgaCQH
	 rTTlk/sHYM0MiyqU7TSSoK6xV/YprcHLopojJFmfxTMXWUoKT/6+DnZujB8Hln59e2
	 uwR1fVsHmKgwegegARpTeIT3yFvSH6sVUAXpf5P9Q6I4QjdcIyU2RbA+HcDKgNRlsO
	 ZxD0O83ZddYbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA82F4079D;
	Sat, 12 Sep 2026 07:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 269CCEB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EC6080EC1
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NojKRod70c0a for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:39:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2DE3380EC0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198756;
 b=KGNWpjLgpbi0bKthkUDNcU8/q9e1UdIgCuobg1OXkmMsDEI5uaMjY1sLzQM6LX654OyI
 z10k0sot/Ix+oNYQAN0UykAgBlLh4GPxtFG2hx8+sUSenrCWFj7yZTPISBgUDjQauT3n7
 W5rDeMC9XuZPJNnHTD4nHPchd4pXLZOw0Rw7ez84CmhAA2YszC2OrR2NjDH4eGKk4PY71
 vnJtQi072Sp24XluV0dfvOneZEgJOeapW1dr7l+j4EN+t+yImusJ1sPCaU1PA3R7EwqJu
 /eEfg2E+KfJk3xkZTO6PSZBAJe3CiRyGGjr5OXtTXNWvo1MUQfz72ZIOfuWl2d+vp8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198756;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=OT2k1gp8qdEAGnQhcAETUrUs2PSvlvMPaqqNvlJ67LM=;
 b=YQionSPw0zPB0MlA8M29BkaVer6Ls40UMcB1eTCUQ9h/ausPrcFZOirP7jq4Sj4dDc+F
 jsQ92AnFD5Af19S9eZ8L7z4kyTDP90zkM03X8SWennS8wzvZ8Lwzgt7FQgk9Yed6Grlee
 4d4kcrcXlqKNzx+oraqjWGFdSl5orbZlBVydBdj+hhkkLXmN1fudBwW2Isx0QTxJsbTE/
 bfmaJZOr9lNV6/YvW+BDOLR+RaMiY8PpaoQ0Igrha2USptKIp+wT+cNy8eeBmgQSkfhRY
 XMJa5BnRvxR/Bd3INYBRS82kGCLZMXNqeKJgsMjghltqMmAlhd+E+0ccCxrZapCDYjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=rK0acMvr; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rK0acMvr
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DE3380EC0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:39:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=rK0acMvrE2qyfJ+6FxD0wjr0p0sP7XlnhmhBIy5DcRORQvJ1rB/U8qj3hpAUEnFy6sOfwjxtcBFyRmK9sPY/0o+EZvjKIDqkAifwPqG/rYaLCdtMR8effwpzaID8M/xrFryKCZQSJ2kT5T944Olff9m+//Rr2SMp/8XxVAZvYY9qm2Q+5R++HYxRu7FWA1qpl28UxnsI5nDSeCFiKH4AjpQ4hjgAY7QAnn5NmJfMxNYXd1QA/oyOypH9+62zx6YBm0co8ozLnDbv13+yfa3GT6VtiS2J5RRMsMxkvyx83bnM5FD/BwyhUbfGT6YgwNvGhAsUM6iD84z01Z5XK9Rcng==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=CffSTj+cWLh4EY6khdOVI8iVSV7wzBowGl6VBpnUS8Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -56771444; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 12 Sep 2026 07:39:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5IKK-0000000FCk5-2vk1;
 Sat, 12 Sep 2026 09:39:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910201105.2543208-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 10 Sep 2026 22:11:05 +0200")
References: <20260910201105.2543208-1-bernd@kuhls.net>
Date: Sat, 12 Sep 2026 09:39:08 +0200
Message-ID: <87v78adilf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: security bump version to
 5.8.4
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

 > https://github.com/tukaani-project/xz/releases/tag/v5.8.4
 > - lzma_alone_decoder(), lzma_lzip_decoder(),
 >   lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
 >   invalid memory access after memory allocation has failed and
 >   the application reinitializes the existing decoder to decode
 >   a different file. This bug could at least result in a crash.
 >   This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
 >   (Also in v5.2, v5.4, and v5.6.)

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
