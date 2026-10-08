Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5D2CA6015
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 22:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24C2811FB;
	Thu,  8 Oct 2026 22:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmJT_x1rxQjK; Thu,  8 Oct 2026 22:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EA855813CF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791497438;
	b=MIP1hKhZbOoalg+hU71LLONg0qZcBG6uBIFmgA0EpHua8CnmRBiM4vNpCI0ukE8zuP6W
	 KwkP7Q9KOg59VhHDgKN69ua+EmoloKImWvICMBqMG+NmdYgG1oUCfjN/b+DTOCe2a7b77
	 xhMYhdgjJNnGwF6bkdDMpSA6UvIYMwepME0CpXN3W5SsEUOnFWgOLTWlCXE5TsxSvdw0Y
	 PyNKNhe8Mq8WiOOzZ8ytMMB0VncgbXKAcvIgLo1uX5hprEeXVcwE7CsgtZRL3SXgfSoU2
	 iTtJDKQfteRE8kVJ+pKJ8nFfvNjV4YnlkDursCXCg4g9GV3t9KRgueGs4CQyc6y3dqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791497438;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DpqVlAXs5k4C+q64URcdLf3tqggZAqGKdzX3K3ckFCw=;
	b=IlPEYYfchUO79VBhqcoYyxsvphjg61MbQLHCxaNShRTyCsQSxH1lRvmr1vw88IITk/xD
	 ReIjCSA4T7t3i52Ugsg5UntBDBRPpvw8hqa0OazR71JcnfNWdnoB2tVmkqk3HNRF4kP1R
	 2yLbDAndc1UH3WkyIHjT0TGhiot3WCO1jkgR8CsCfEPOYVbaQ3WB4sfRJSpJ770BtouXm
	 lfU9YNp4W166V9HOb+PEJzFfiIYGStYsMuQkzqPhDIUuOH+4b6T+CW4AJPpEYe1FIjcgq
	 TOnxCAOp32Ntz99wfilz8IgxOpUW6aPKWqBFGHI2vGcrKZzJOgaRzyzLOqU0S18jfvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791497438;
	bh=DpqVlAXs5k4C+q64URcdLf3tqggZAqGKdzX3K3ckFCw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5DAiPXTvHRzGlg4iM6vOq6EuBWBh44Gys7RXqEuyG+QDUADaNG9yWoAtJ6QiWyUT
	 62pxBwctHh4l4AaxpAP1fpYIMFhfAwMdVU7OGSgEvJXuDD3wJEGA3UvHAPZ3ijlBOX
	 S+5gGhnwYTwPVQS8SLytOHe3ixILXRIKA80KYPvxRyrvbzZ/yeiVtoftUjPJSMGcWU
	 9FPAYVgyqAgCTYPHGuB4rTi8XUc++ICFp0mcWcELplB0OqYv/WbgtOQ/jZUFVTo8mt
	 aJeCZVZSqfTNTX2k8fqN0Dl8ZyDMXXMVGp33IC5Z97937cuZaRvz/N5+hID10roeto
	 P36bH5kuX406Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA855813CF;
	Thu,  8 Oct 2026 22:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5C22E0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3CE60808
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qm2mBeJw2iyW for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 22:10:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6AB856069C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791497434;
 b=YtBaNy+EX+WJdrsYNFcYY1HHKtEiskzA0pgOIskLMbFtKQFtJuJkdt556eoRMpmDxNUK
 op5eqg4e8aQaI5tZ0ImXrSdu89nlS5x9uPN9p/8i/n+fIVI3aPvMONm6HF9c4rsNKak93
 9Z6DIlq2kz4lW6lc7sWS9sOWZjFi7ZTIlTz2vUPs4TJMZIoAn2Tom71T0T+0Qsb+SuI75
 uVgwaJEtKoZltZrGVsVP1zHT5GYfVuym6VPGbTXm18WfPF58d/JVe7xKDUJwtfvXish7D
 OBJTXv9AcLKuMWE5f0kwmb/2i0utjdNMuJ8Nd5r+9lfDKTZ+0eYieHYJORxFz5RMSGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791497434;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=PXEf70Pk3oWhKsQWK71GtURkS7YNgk4SsVMBeTMkRek=;
 b=piqS5us3laES2w/+oBXJ9Ec8R3h+yItX+5s7N9RQjG4ZdL12u/ckDNFYr+3TOM1AAO8l
 x5gaUU15yZsFeg073C4YPzqR0H1k75ZBKwfj9Qjvzqsd/fB4RSZ1lRY5ti63WLBT7op4V
 csK74eQHc0yBXnFw0KRlfbWcxDQvfFmlZBXwfKkNka5Jc+4IY3JD3curiZffhRmgTlSOk
 oCXQw/Jv5+XXFM24Ta3WTxXIG2S8cts6J6xXhJ5HK9CKWCxyBTpNZ6fV5m8r1uqmmRZkF
 NvRdruT5So+P1mBrlcAcdgSiAc69W6+EONSuxnAfqj6/FE2Aw61zLQT2goHkWICeTGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=l9AZLoni; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=l9AZLoni
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AB856069C
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:10:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=l9AZLonil42kE8v2ii1EUppLiM6WQw5Rujln5fdSVlway2UN/l8A6W0Qp4V8fGjb8jeFD1pzUrg5pfYhKk7T+ilxYe/9RLkzgmbjIObtxJudM8qXm/2fm/awui5yDjVN/SoA+uFDhTS8dLASvc09i+fvoPX9ueneS/qLtgZamZ6oAdQTjz7N+913luuoD0CoObhb93EsWkCN9vYHD9IujEN8vTbEnKoDTFi3GePp3aUJ03Aj+cWnWsRL9BkIspFid60qS2OUP+ER++DyX+lmPH/codawgGX14gdwVb7PuIgic3DQm5FloVSxI3VswCuGkhGnXZ0rBP+t64YH3wHzUw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=OPaRlvyoR2EBSXZuFLn8Qe4oGbzKeBMMKnlNDXw26Dc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1240581568; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 22:10:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEwJo-0000000FShs-029K;
 Fri, 09 Oct 2026 00:10:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Daniel Lang <dalang@gmx.at>
In-Reply-To: <20261008203526.3713797-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 8 Oct 2026 22:35:26 +0200")
References: <20261008203526.3713797-1-bernd@kuhls.net>
Date: Fri, 09 Oct 2026 00:10:27 +0200
Message-ID: <878q47zvvw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 23.1.3
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

 > https://discourse.llvm.org/t/llvm-23-1-3-released/92432
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
