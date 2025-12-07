Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E8D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769E5403AA;
	Sun,  7 Dec 2025 20:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0P5YOSxL-RF; Sun,  7 Dec 2025 20:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF56406E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765140043;
	bh=mJDB2a1YUH0DzFWtEuBRCPnOwPDYQWsy13xnF9Tsz1g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XBU/2c6dVQZ7GitMK3DPEBsd95t0j7UHzxKOTciVMljjgdR+NDGNDilaBFdgPYQ0S
	 MMmd249MnZtv69wGUhFDnHZWhLrdHLcVUJj9NCVVuc1UFyZkSmEAyFZ567bVVwcGVa
	 VLKqV8EVdiZT270d/2BDdGW4Y+eY2udRMCMe8CFh6Bc8DHFUB3PXZkzR2uDDttCHdW
	 73oq1w0elcO0BV7AClp+Z6w3HOYSPneBJSey1NN7vwb7Sr1WeqUIkhHcTWgje1A70A
	 Nt+4AI8HHY7B/tIAdKsfwP5gykS9FV7tafRpCyBwg1Wa1lL+uYhzcGrS1vv35/DaPi
	 gFdVcFf7otBwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF56406E9;
	Sun,  7 Dec 2025 20:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D98151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EBA34059D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inu5r86oNPuD for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 20:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04C4D4059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C4D4059F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04C4D4059F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:40:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1329285868; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 20:40:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSLYX-00000004mEc-2QqO;
 Sun, 07 Dec 2025 21:40:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20251207092820.109515-2-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Sun, 7 Dec 2025 10:28:20 +0100")
References: <20251207092820.109515-1-thomas.perale@mind.be>
 <20251207092820.109515-2-thomas.perale@mind.be>
Date: Sun, 07 Dec 2025 21:40:33 +0100
Message-ID: <87ms3u81q6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AHIkLKGng3qILOHhhy9+smj/5KYup4+40313C8ifQiUE9IkjwX8ittL0i0DbO513SGS8Qg7+efTicCz2uHFoMhoF3G/p115mIei9cWEfshsxOQiJ7M722FgAkfu13Ao+LGYwyPmSX6/Sq1a07Ryzte5leyBNgCwsi9BfzhWc4SQV8TLEI+iDMPwiXt7EIDG2HpWBgXErOWKI8N8spse8uhpAIv0457KkzIDnAe57SzvohzN6Hqj7hWIV72wpJNa7P0Hu0a45B3sdRLBX7nAoiISgWUu67BJHtntyefYRmvHJesx+AKYdGSeTgm8VxCc5zti3homQ1zG3ezwP5TjdWA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=LrDH4/ZHEWwO2fG0B2LsowHDQoEu7Ziswuh0fExWnls=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AHIkLKGn
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/cve-check: don't fail
 with unknown CVE
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

 > The NVD database has CVE entries that are not present but may be
 > referenced in other security trackers.

 > For instance the CVE-2024-12455 is documented in the Debian security
 > tracker [1]. However, the NVD page is empty [2] and this entry is not
 > present in the NVD database mirror.

 > The following command would make the script fail:

 > ```
 > echo '{
 >   "vulnerabilities": [
 >     {
 >       "id": "CVE-2024-12455"
 >     }
 >   ]
 > }' | support/scripts/cve-check --enrich-only
 > ```

 > No CVEs present in Buildroot ignored CVEs are affected. But when
 > enriching an SBOM with legitimate CVE not present on NVD, the script
 > will fail.

 > This patch change the behavior to just log to stderr unknown CVEs
 > instead of making the script fail.

 > [1] https://security-tracker.debian.org/tracker/CVE-2024-12455
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2024-12455

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  support/scripts/cve-check | 7 +++++--
 >  1 file changed, 5 insertions(+), 2 deletions(-)

 > diff --git a/support/scripts/cve-check b/support/scripts/cve-check
 > index a72547ab38..71f93afe64 100755
 > --- a/support/scripts/cve-check
 > +++ b/support/scripts/cve-check
 > @@ -271,10 +271,13 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
 >          if vuln_id is None or not vuln_id.upper().startswith("CVE-"):
 >              continue
 
 > -        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln["id"])
 > +        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln_id)
 
 > -        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
 > +        if cve is None:
 > +            print(f"The CVE: '{vuln_id}' doesn't exist on NVD database.", file=sys.stderr)

s/on/in/

I think we should prefix it with "Warning:" to make it clear that is
what it is.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
