Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A52CE73140
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E3C78289B;
	Mon,  2 Feb 2026 08:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1kGhcyonFtJ; Mon,  2 Feb 2026 08:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4279A828A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021160;
	bh=uhKUbAr3iGUAmYjC6aLyPPZgt12MhQLD1jEQklE+rpU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gsg291PnOq6awr7jJSKguvdxR76SKGFffL81cvkMosqsc2ClYt7xiU37+hJjWvPp9
	 Nww/QAkLvoLe2yh9dFmrA9PubiOTZxc4btz2EYjVDMDFuswq6Ze1i1QbmrVvecGGDi
	 Z9QxCs553qVNxwqJup77XaShwGBaCGxYciOCDaOhCl4TVoNmAg+OayShf0qQEsT6Of
	 Cl+Ut4YNca2e2VfPSVKZtWO/hV3mH2zYAdkGSTyYrG77V/E1Ma7gDVlf33hjjly0sC
	 hB1t6HKG9joPPARR6A7515g+mGp4Eqh9Um4hrpHZuZ2yC0YQX7IQn0+PM435NUcBkT
	 Z5mt4BlYvYayA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4279A828A9;
	Mon,  2 Feb 2026 08:32:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD52D149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0175401E8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lc_B9TdXGpfn for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 918004018B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 918004018B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 918004018B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:32:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1664534519; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:32:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpMI-00000005oiS-2Mwq;
 Mon, 02 Feb 2026 09:32:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260126130414.59175-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 26 Jan 2026 14:04:11 +0100")
References: <20260126130414.59175-1-thomas.perale@mind.be>
Date: Mon, 02 Feb 2026 09:32:34 +0100
Message-ID: <87ldhb7dgd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ccbA2Ck+05/4kzqF2kp9wJtNlUCX23sclot9gcG5oWwUV9zIxNIasC7+Jp8u6sw+900eEPLAplz5mo7wP30TBNVUfDB86+ZmtPpw90hX73MFX7Y15apXf+Z5FSTlxiB5SfI3AaVaBAKx1Da1Kr4gHCvFCxyPNWndLivuLWK7m0nDHKxht/hV1Gd5CML2hWcQBZVP9vBiv+HM2E9aUzZ8s9uQbeWUxWaqiBF7QF3S4YDW6g2UD+DxCopnd24R0m2xsmT7Nt4qpryBFKzVaNCzUmu2UtOjgrTGany9hFrXH1AIFScgUauUtYtBnlkCTTZi+k3DPUug/pPnjcjhsYN3Ag==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=fCRtu8DUtt+IdCEC213VRKGtVyaoxU/+UqqDm0wtnhs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ccbA2Ck+
Subject: Re: [Buildroot] [PATCH v2 1/4] utils/generate-cyclonedx: fix
 'project' dependency
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

 > The definition of the project name & version is stored under the
 > `metadata:component` CycloneDX property.

 > Since the introduction of the `generate-cyclonedx` script [1] a
 > 'buildroot' dependency entry that depends on every components has been
 > part of the generated SBOM.
 > Tools such as 'DependencyTrack' relies on such entry to create graph of
 > the entire project.

 > With the commit [2] that introduced the option to pass a custom project
 > name and version, this dependency reference was not updated to match the
 > custom 'bom-ref'.

 > This patch fixes the reference to match the custom project name.

 > [1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to
 > generate CycloneDX-style SBOM
 > [2] 9cbbc47762 utils/generate-cyclonedx: add project name and version options

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
