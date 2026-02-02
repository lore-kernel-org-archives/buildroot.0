Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8271BE73145
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F04540946;
	Mon,  2 Feb 2026 08:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ka3t5ICaQX8Q; Mon,  2 Feb 2026 08:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A80407DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021206;
	bh=9vmF8JypI91TQIyboJgwhBCyIVhcVCD1NcXSRUsQNNE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8f6sgj3I1THf/q0DKvS3WNYPPhrXC0s5iLkrsHlPQgPBnqacxNSqwNzNBjFVYKYJ
	 Xa461aDPeikSh1ci/oHd8wXOL5/JplrXno1Uc7CoWmPWxSXllmhhUzZRegbvd3AsuP
	 Hja/ZE9G+QzPAYB7noT46DA/+0lbO7c6GNPd7rDeeCfqDon1hcYFKLogbnLLVkXN1Z
	 HF4zjvgvNS0b/AZGTH/+XJJa+9iyhMJXaJJW9mlIoldg2QvptOzKqFmgraT03e1p3Q
	 yz0g0Q1VorBERoMEk7WX+wamTGWUZPX0OZZfQgEBsncpbsPN0rJmuF0V9klarEx3Lj
	 jMIrEe2l9OXMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A80407DA;
	Mon,  2 Feb 2026 08:33:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBD74149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F898828A9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urF3OKns5_lh for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 755908289B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755908289B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 755908289B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:33:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2005669251; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:33:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpN2-00000005ojs-1GiU;
 Mon, 02 Feb 2026 09:33:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260126130414.59175-3-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 26 Jan 2026 14:04:13 +0100")
References: <20260126130414.59175-1-thomas.perale@mind.be>
 <20260126130414.59175-3-thomas.perale@mind.be>
Date: Mon, 02 Feb 2026 09:33:20 +0100
Message-ID: <87cy2n7df3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rmLwj0RqDyuf9QIIxg9AdKZNEM6OTQKnmq8N+HmhvvZYuXyc2FjVA1vw5w/lM5NibVlEL3JPnF5tf8T2/DvkSWvoR22HN9nxp1w+mD7gccCS6broOj5fhFz41qpeyb/V7if/cv5QAuYREA2jowpSMbNl380oyCadj0CdyRIwn+l4xNDz+jKnOe7RHK246pFkrBkWyR+5jMnra3viPLnXEZ8OE2O4ZW7UYGvvffDkRdSsNdMkZZLIRfSWtixsgqppTIQ1HoOzh8fIikoKOEnQYkXboyi8c8JO8geAvtWLAHsA2XWh5EfH+tzBINQzDV5uKH2J/skcx2kvywkSZvULUg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=cwlAtyEe+4xCHhACid1E8OIV6nu7YjACEUoVWXtij9U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=rmLwj0Rq
Subject: Re: [Buildroot] [PATCH v2 3/4] package/pkg-utils: add 'provides' to
 show-info
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Add the list of virtual packages a show-info entry provides to the
 > output.

 > For more information on virtual packages infrastructure see [1]

 > [1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
