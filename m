Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB99D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F0A41199;
	Thu, 11 Dec 2025 19:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PMKUVGWf4as; Thu, 11 Dec 2025 19:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7261410C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481423;
	bh=3XgR8F24Fbi+6Qn7M10ZFwbg7fsF0AYVJDIKcOAC8po=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gEPlzfVopNIebY3/Q0qHbh+QmTKVT2WkADg4cqRXJt18VuCsq5wEprat/tXjgU5GP
	 LzM796Fzac03gw6HU4aVip8oz42JeBNF5ArrqCdbe2U43L4eteIJqvcDDX7CApiw8h
	 nTwfTPeMg0LRF/K0TVPniO7/lwpQy8akj9CKngNcCJnuLI442ma2iBtGe5U8IQpA3f
	 rypCsUQjbpYeiqJKBd6eEeosfDxCAfulmx/GwzrC8BsqGdQk033PvoWbbMxpaAwVML
	 GQ8TnWWUklySVbBBkZiv3JgXCKUnbIdtFazg9Qnz3+DdmdkkHJzzvkN1NEF4RLqVe4
	 9hASK59JOikYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7261410C3;
	Thu, 11 Dec 2025 19:30:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F123E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 752C480DFB
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9p-vrcz798Y for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E0980E2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1E0980E2F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A109F86BE7; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:59 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 1d5f7045d645e56dc058c1c4528112e38c0ed39e
X-Git-Newrev: 44beca14a269d0c90ac62771ed7806f8c23c74c7
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.A109F86BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=44beca14a269d0c90ac62771ed7806f8c23c74c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
