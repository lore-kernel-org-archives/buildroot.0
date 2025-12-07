Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A589D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 565994082F;
	Sun,  7 Dec 2025 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxbOvAQUzXQc; Sun,  7 Dec 2025 21:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0AC407C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765142880;
	bh=qa/eRNwdH0c4YjMXMlv2SmSl7jZNlnrisu4gIQBV3+g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sBlIDFr5J9iRaXmti6Mx5++rQLRZKOX6+8EwoaYua0K9Tr8IeX/MTp77wUj7sL7ry
	 Q49oIPvEHFQLfbnlsjXtSNxuQSd+MSxZnC0E4vZlTws8s+nmfobZDqCJa3Ff+Tnu42
	 dmrKynl86M3/4lTrFbrCzLnkuIjTrMxRlzZ/QmaV3OZjOsfgVYTmq+sERgBbtxQq6J
	 ozsQsC0gOJeBQWfH/9xc96rZXysArUsOKOpaxDuSLpEBHNOZwWogaF7PoTiy3YD06l
	 ThOjfNh0KPFBFymNH2eir05DC7wTzQV0Sf1yhq0LIlMPYqUaC8lDv06XJTxxpvCgEN
	 WidOrArZFg83g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0AC407C6;
	Sun,  7 Dec 2025 21:28:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 734D3E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A752740516
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD95zdiR8gHJ for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA9F140548
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA9F140548
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A619A86895; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 21:40:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b740cee42c8dd41db735021c02abc91874fc9eb
X-Git-Newrev: fa7fac09854b753cbce26298dd07622e65b1c4f0
X-Patchwork-Hint: ignore
Message-Id: <20251207212751.A619A86895@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve-check: don't fail with
 unknown CVE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa7fac09854b753cbce26298dd07622e65b1c4f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NVD database has CVE entries that are not present but may be
referenced in other security trackers.

For instance the CVE-2024-12455 is documented in the Debian security
tracker [1]. However, the NVD page is empty [2] and this entry is not
present in the NVD database mirror.

The following command would make the script fail:

```
echo '{
  "vulnerabilities": [
    {
      "id": "CVE-2024-12455"
    }
  ]
}' | support/scripts/cve-check --enrich-only
```

No CVEs present in Buildroot ignored CVEs are affected. But when
enriching an SBOM with legitimate CVE not present on NVD, the script
will fail.

This patch change the behavior to just log to stderr unknown CVEs
instead of making the script fail.

[1] https://security-tracker.debian.org/tracker/CVE-2024-12455
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-12455

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: Tweak warning message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/cve-check | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index a72547ab38..ff14e4b238 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -271,10 +271,13 @@ def enrich_vulnerabilities(nvd_path: Path, sbom):
         if vuln_id is None or not vuln_id.upper().startswith("CVE-"):
             continue
 
-        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln["id"])
+        cve = cvecheck.CVE.read_nvd_entry(nvd_path, vuln_id)
 
-        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
+        if cve is None:
+            print(f"Warning: '{vuln_id}' doesn't exist in NVD database.", file=sys.stderr)
+            continue
 
+        vulnerability = nvd_cve_to_cdx_vulnerability(cve.nvd_cve)
         vuln_append_or_update_affects_if_exists(vulnerabilities, vulnerability)
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
