Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E58CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C92261668;
	Fri, 19 Jun 2026 09:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qyUlJfxhtDd; Fri, 19 Jun 2026 09:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110D2614BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859784;
	bh=tMX7JoKvogTGEuU1hmk8vEEdGIB0V8knyDvT6s5N/Fc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAZm3RORnVqhd3yjnEnCRtXDnv7yTvnp3ILWwMto+4vX+qePM5G9MnjJmtObBjVOZ
	 61bROuUMywe/IB9A2j4nfmwgh9Bhpsp1ayhG/3R9M34LBZbhU7xUAD31A3lmpjmE5n
	 rlzQNC/gQoGEf8XUkY+1vve3X/kBKOMyUALkUTVYnw/sDnH4weiMY2iwGmZC2LU9sx
	 k8jBIy9ZJc+o3W8LDvkb/TTvfpOq5gx4i69/sUKVcdYlYEluQlS1i+1UP8WuIpUGU7
	 sKJlirHZD/gkKHdDXfKzfE6fJHsGku4050j3SzpWCmDBqHTmXjlLBSarRd2tw66Wre
	 VuPVMio3nEe4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110D2614BD;
	Fri, 19 Jun 2026 09:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E4DC279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BE01614BD
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN_tx6e2th6A for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF67F6140D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF67F6140D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF67F6140D
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:03:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1756255761; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 09:02:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1waV7c-0000000DCaA-0swU;
 Fri, 19 Jun 2026 11:02:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 18 Jun 2026 14:47:52 +0200")
References: <20260618124835.2935850-1-peter@korsgaard.com>
Date: Fri, 19 Jun 2026 11:02:44 +0200
Message-ID: <877bnudhsb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=I30uUlRa40euEXEl7KrdKCOCD+GKxblrb3WcHbIHW7Hh28mpf+xcvQC0+Vbpx2wkrz+3JFq85slFoJue0ab1cJu7J7zDd7Jwc2kFzpKvazmgdCZm/61FD0fRQev0umxTQkVtN0hVmdQOR0grCFrBuUKs+HJQmv6l+UZ+j9R23qGC8xUr7hdUpZPJ+c+vUxM94+bAw83bZKZ1bhD8ZUBGDGyVGaEWH8HP7J7/TxONY/J/t4QaYSsAR13TXqSf+rq2gegibF3OlUWa3Ul37q64cXik4ct5ABZJsBNROvrFmhPFsTnA52gagVjtLzwxpZ+0Jl/gaIjWvB20t6iLUn8hsw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=sT+FG1+W+4qAa/d2CLfyFZ8vOWQBQxEVyQSsmybsREo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=I30uUlRa
Subject: Re: [Buildroot] [PATCH 01/29] support/testing: infra: add
 assertRunNotOk()
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

 > There are a number of runtime tests that checks that a command fails as
 > expected, so add an assertRunNotOk() similar to the existing assertRunOk()
 > to handle that instead of open coding it everywhere.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed series, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
