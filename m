Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE37CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C8F60BA4;
	Fri, 16 Oct 2026 13:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrv0vVosaywh; Fri, 16 Oct 2026 13:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5FCF560BB1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156148;
	b=EoF9CXTBOoljNP7KvN2sbtOI02v381fiBLcAaqmDEx4NrHSH9ykV3NIovF+NIvxZf3YK
	 Vjlzczr8QKRDqaZ5l+WHROjUZhSScLOqw9GutCLJrB37+ecSzJgz0VQHpxaOAiqHQ6RoY
	 fCHsGXX+RofmmnA+l772Q8mywHNdStbX3gdHw78unrsDpqK+xVIri+2+qU7Qba+TLwDcl
	 eBJwdKQplpYurHRll0omnsQCVNlqKbs/nhPCGIXwBtJszQtApHXY5RYXpQYkR344jUTDA
	 RY9l4qSntjkXoMF/hiIZxpEghdbJgo8IhH6yXkI1ajbNOk+osuAJM42zRSEiDiVxjyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZX5P/AUpSPW1VMdMDRqvcNn0eabpe7i5fhRWCvdG3+U=;
	b=p2lVLQmAxPDxa6HuAdsL5bhIC/VTZBQ0LM7/dmJ19eLxOnHL+Qg9JZJ6Julx4Wn7w+AN
	 9MfwZfpWm5yk34Z28RMrlmWwpPjwEMb+Kao2vPxfVzRNGe3o8XwQ9uUr0vE2h+jr811qP
	 lGezxw0Y6SQPCkrne5yz2jN0U4cmOfBSK7/Gx55qvXRNQqhBL1/v1pez0gga36F5tFeRH
	 InwgaLNxZ2RurzVC/Bc3hkejHn1PkEeydOGF7jj0EhEjKKeBd314xt9tSG9qbjj3R6A7S
	 ik/uV17XeToid3AgCyyP6oRo9pVUH4LsYa8CBRpknL4l71EGUAyXdbUklbgyMyXGtxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156148;
	bh=ZX5P/AUpSPW1VMdMDRqvcNn0eabpe7i5fhRWCvdG3+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K8V8w1Zg2RuKbt3RgiQ5r2E7cmm4Ehk4RnHOUllxMVA4HqX8Fdzzg0PUAfjCy/qDc
	 ZPvRud2JaXWnYOAt6AQ5E0ZgqlQFILPuP4nqDtGUSFgBoklEWKBO0kcOymDXdgp2KD
	 LVY4iwZxBeWakRoLllgGjxVN2ASGhjeU/GEHUhNz+pCyaL+1RMnZ1+v8JiMLVEUPwN
	 tSiDEqaYFW1azMxyMF8/MN09LNx0wDxJIzLiC/oa2vD6T+kCdyFu3V+nWtnujhfHxh
	 4aLjmx8eDb+/8sqYn8qca44lynw2Sd1iFuN0DULLpcRfSWhDO1+rvHQhyPu4BeEZDZ
	 zNbmCcxgdHW5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FCF560BB1;
	Fri, 16 Oct 2026 13:09:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7264920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBFC040A01
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ssiZXRU6xAz for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A836540A06
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=Eqc6MQLg+kYtAD7h3UDuAJ7qXJYQ7hAzzmg7EGAlhZStutKG1eXV4V6uNXep8EBtyAym
 GD6rO9zXz9z0qEJUFuatqVtVXx3im3QGzLp/Bp7h0jnGOCAFwBqooWR7Mj2qE80c5t+jW
 UXanNOSMC5MCxUnvv1XC0BX0pOho76IkEkLQcIVgjJ9pOBWunXHYj8WH36ypCHN8X1pwp
 V7scLgTtc49VYriMF7Co6Z3506CvCxotClFk9+5+n7UigdBSPovPDTdI2w5MD7be9JbCj
 z3pWJVtDSchN7kQYsEJdSeou28AIhyAfWZOK0H5+TE7CZWs0zaBrMUO0INi6mJXSLPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FRCQz38Sx8VROUhpb31gZWQocbPfqJReUi/OkWpsbvg=;
 b=fWiNT8PZrgCh0EGAzDronN9fPulz6t4hGbSr56xXn79vNR0s8joyB76SeEvER6LhdGk2
 mwkps+dGDVnLYNW4t9qVegk03aMnyjBHNYvXIQospVtpxfdcvHmL2YZvD9/GSkb+t8Rjt
 lnsQeB0p3U3gDFfk5AfdHqGEuiM857o9dfCDZRBFn2c5Y3iPRVngGNCKdgth9+KkAovG5
 IvOD2VJRIHAfXAJDFHKPpCNgmAv+TbNFQUedZYRCiOVA+FQNBn4oczpqfpnVex90BOx/f
 U5eQnuk96uqdrwvBIa8YlNGBP7SOGGBDr5qhjGC1Sf/mYAC5nuzCFR2/PQaQhUAoSLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A836540A06
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9963D960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 68b09e4428c7218a147b0ac5b64d4e2007c4e9ab
X-Git-Newrev: 5d682aa094d7a8452ef7dd5e37895eef49cdc176
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.9963D960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc/gcc-initial:
 add CPE
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
Content-Type: multipart/mixed; boundary="===============2472888456659822229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2472888456659822229==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d682aa094d7a8452ef7dd5e37895eef49cdc176
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

gcc-final already had a CPE.

The resulting CPE ID is:

cpe:2.3:a:gnu:gcc:15.3.0:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2019-15847

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 32d08d194509a454c80fdffa7657c9564fdddec7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gcc/gcc-initial/gcc-initial.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..5ddded0a42 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,9 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_INITIAL_CPE_ID_VENDOR = gnu
+GCC_INITIAL_CPE_ID_PRODUCT = gcc
+
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.

--===============2472888456659822229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2472888456659822229==--
