Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D175FC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 14:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F34F41A5F;
	Wed, 20 Dec 2023 14:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F34F41A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDVCakdxH3Qr; Wed, 20 Dec 2023 14:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3A0041928;
	Wed, 20 Dec 2023 14:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A0041928
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C120F1BF391
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 963258278F
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 14:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 963258278F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3VRY4jkZDFg for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 14:09:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB7E8293D
 for <buildroot@uclibc.org>; Wed, 20 Dec 2023 14:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB7E8293D
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 68C0887BFC; Wed, 20 Dec 2023 14:09:13 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 20 Dec 2023 14:09:13 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15895-163-60pTuUTbo0@https.bugs.busybox.net/>
In-Reply-To: <bug-15895-163@https.bugs.busybox.net/>
References: <bug-15895-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15895] glibc version 'GLIBC_VERSION' does not
 match released glibc version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

https://bugs.busybox.net/show_bug.cgi?id=15895

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
This CPE id is generated based on GLIBC_VERSION, in package/glibc/glibc.mk:

GLIBC_VERSION = 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701

So indeed, the CPE id version field is
2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701.

glibc.mk should probably do:

GLIBC_CPE_ID_VERSION = 2.38

so that the CPE id has 2.38 has the version, allowing correct matching with the
NIST database.

*However*, this still will not give the correct results. Indeed, the matching
with NIST database will be done assuming we use 2.38, so it will report all
CVEs that affect the original 2.38 release. But Buildroot is not using 2.38,
but 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701, which is 27 commits
above 2.38. This means that all CVEs fixed in those 27 commits will be reported
by this matching process, even if they are not applicable, because we already
have the fixes.

One option of course is to add GLIBC_IGNORE_CVES entries for those CVEs so that
they are ignored. But normally, we use that to ignore CVEs because they are
fixed by local patches, or because they are not applicable to the Buildroot
use-case/situation. It is a bit weird to have a GLIBC_IGNORE_CVES for a CVE
that in fact does not affect the version that we use. But admittedly, it would
be a valid entry for the version documented by GLIBC_CPE_ID_VERSION.

So in other words, my proposal would be:

- GLIBC_CPE_ID_VERSION = 2.38
- Addition of GLIBC_IGNORE_CVES entries for all CVEs fixed between 2.38 and
2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
