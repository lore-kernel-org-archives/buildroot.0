Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E754D5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 13:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A828440B3C;
	Sat, 13 Dec 2025 13:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtvlNXM0CbTa; Sat, 13 Dec 2025 13:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0320B40B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765633704;
	bh=oxp+RLl79Ia67/UpbkN9lMPLCRZ9rQNZdgEtoUrhqM4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9Dmb/dRDd4nGP8N1HPqlE9EGtgpsLQj34tE9hRwmV8sNPiqdoyEdmmdsNtclGksx
	 3hGnU5wakr7hkzJ13LsQ/Ty87qtYNHg1MbZuUQh6fpvgizVMtjUJno+B+u0CUQwvpz
	 6G6++cg+NBGFBpt53LZIuy9HYX+yXW3BCEPnPtyQPl1y9gvnF55ue23knCBg69d6BR
	 8LZIf9B38fSi+FRNUJlptxADZjZzKal7E3yy/rNY1rTgV6WKww7Zeq68Y8DhHuRdtK
	 aIXXzb6npAaEEqTqSAIj2ci3L+tCyvId0/Bx/QGx0m1CxFoJjZ6HT9ebyAIRVv9omx
	 ZGrzE0U+xmyjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0320B40B15;
	Sat, 13 Dec 2025 13:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B1682C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 13:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 717DA40235
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 13:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf7Ad5WD7Ujf for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 13:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1836D40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1836D40018
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1836D40018
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 13:48:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 621712721; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 13 Dec 2025 13:48:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vUPyr-00000002XBr-0rdA;
 Sat, 13 Dec 2025 14:48:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20251030190936.262624-2-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 30 Oct 2025 20:09:35 +0100")
References: <20251030190936.262624-1-thomas.perale@mind.be>
 <20251030190936.262624-2-thomas.perale@mind.be>
Date: Sat, 13 Dec 2025 14:48:17 +0100
Message-ID: <87sedeze5a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ALRlPhsUO7O6351F0Hn1ZtfLUn8vqqSEhz2y8sCCUxE6YpaIabFUyWhz0U9Ux+ObdeonRJs8YA0VNfY1mHlBMizYip1XdWJ70GwwLljVtajgXyOhDqucQOCfnIq9FvIMvlexMgDYF2czls95U6d+XmGXSRhm+nK4JlD3ORv2t6lQNu6oQeYy7UOPtoDiigqdqAFplEnmRlNt1yAsByoy2WbTIInjGE1lL7RkNIHtkroWqojf6seVa2+M1X36kkaTF5cPE8FumRGg/FMKbLf4eTA6/HL4yfISTcHnLfSHs+stMXhGJT8/M2P5iJ8jFQbwtN9LGd03blUE//dSQtKzAg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GKbbqj3QsEthdNeN72A9nUL6zUkfP3wLjxhOJMoQYBA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ALRlPhsU
Subject: Re: [Buildroot] [PATCH 1/2] utils/generate-cyclonedx: add support
 for 'resolved_with_pedigree'
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

 > The CycloneDX specification for vulnerabilities defines four analysis
 > states ([1]) for cases where a vulnerability does not affect a component:

 > * 'resolved'
 > * 'resolved_with_pedigree'
 > * 'not_affected'
 > * 'false_positive'

 > Currently, the metadatas present in Buildroot does not allow an accurate
 > mapping of ignored CVEs to the appropriate CycloneDX vulnerability
 > categories. As a result, all ignored CVEs are currently marked as
 > 'in_triage' by default.

 > This default analysis was was established during the introduction of the
 > 'generate-cyclonedx' script. The reasoning at the time was that SBOM
 > consumers might want to re-evaluate ignored vulnerabilities, as the
 > Buildroot infrastructure could not reliably determine their actual
 > state.

 > This patch adds support for automatically marking vulnerabilities as
 > 'resolved_with_pedigree' when a Buildroot patch includes a 'CVE:''
 > tag in its header referencing the CVE identifier.

 > The 'CVE:' tag appears alongside the already required 'Upstream:', if
 > the patch address a security vulnerability and may be repeated if a
 > patch addresses multiple vulnerabilities.

 > If a vulnerability is addressed by multiple patch, each patch will need to
 > reference the vulnerability identifier.

 > For details on how CycloneDX handles 'resolved_with_pedigree', see
 > [1][2].

 > As an example, the CVE-2025-3198 from the binutils package will result
 > in the following pedigree for the binutils component:

 > ```
 > {
 >     "type": "unofficial",
 >     "diff": {
 >         "text": {
 >             "content": "..."
 >         }
 >     },
 >     "resolves": [
 >         {
 >             "type": "security",
 >             "name": "CVE-2025-3198"
 >         }
 >     ]
 > },
 > ```

 > The `resolves` property is an array of issue the pedigree resolves. If
 > multiple are adressed by the same patch, the multiple identifier will be
 > present in this array.

 > In the listed vulnerabilities the entry for the CVE-2025-3198 looks like
 > this:

 > ```
 > {
 >     "id": "CVE-2025-3198",
 >     "analysis": {
 >         "state": "resolved_with_pedigree",
 >         "detail": "The CVE 'CVE-2025-3198' has been marked as ignored by Buildroot"

Maybe the wording should then also be stronger for that case, E.G.
"marked as resolved"?

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
