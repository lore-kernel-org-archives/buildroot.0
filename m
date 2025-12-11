Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7646D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1F6410C0;
	Thu, 11 Dec 2025 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6HSd3lzKHWR; Thu, 11 Dec 2025 19:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3221D410B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481285;
	bh=dbVWJUWRFWOZ9tzyWAiVK+KGBPow5MahwBaw+ABCAwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DaU38Wi82mzqbRm8SnjQ0aESBLYbMC6H8TxWxrYguXIYfiVEtnXes5HLM9Pge54kc
	 M8iurcP+ZVnWKhjM3UvtS3npf89spGD4FkOHdCNsNjHg5zgsyF0k6FGoQHLOLn/qSb
	 uW9Hlfhq1VeJpiNkOuqWls/8BgQEZmcYDB6qW0SqeWh+iPfZPP/IMRMdekllwlQyC4
	 2hW8F4YeHVOaBv/Mg1ku2WjlYhqZ7pPp43UT7yyQUSw7WIbdkMmdbBhKbfOUubEXxB
	 0FxfKlPM4Y79oF3RNWyJMnP41T0SZIlnWPuxtE9MXRkOmPLXh0yeNYfGkT1mucZ4Ui
	 y1MMoHG2ImJKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3221D410B8;
	Thu, 11 Dec 2025 19:28:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D2B2E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BB144005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0dWPEQIx5yd for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E3A4400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E3A4400E3
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DD92838CC; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:17 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 03bc288c6b7f59eb583be73f2df19da4886f8bc9
X-Git-Newrev: 10fee753bb30d056143eb1856fc8a6db167cb7ef
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.2DD92838CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/cve-check: don't fail with unknown CVE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10fee753bb30d056143eb1856fc8a6db167cb7ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit fa7fac09854b753cbce26298dd07622e65b1c4f0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
