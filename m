Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A626CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC0B160F39;
	Sat, 10 Oct 2026 09:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFVAlhKEuodQ; Sat, 10 Oct 2026 09:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D59D660ED2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624496;
	b=RNd59ErSfy2IEvu0WPaNbET/RX16stDYekbOnnvW6ebpwBqOP6YSG1xmbj48O0Xj7Wdk
	 jVAKy3RA9i2TtYzhjUHZNbuMIiJa/hYNMbMMd/btVVl3okXmaNeSHKmpTM5uWTdNgMF6S
	 UB9xq/sSD3MerxwDW9hqt74ojfD3B/2okf3VufGxaD/GtMmmaUAnwfd7+IuJ+LI2PCBhx
	 owLHng6nfO2zi0Jayv7EBf6+Pdop1hQ+6wGIWjeAIzeUZ5bbYf9A2ZBDsNsT+gvEkZrLN
	 8RLhp/n73X6/LLjC5RG5mQmixhgWi0Enux2TAAXSWJKk5Hb9RkiysjK2oTkUY7j8Lmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HpFgJdD1Pnv2Cmi5KKhAJ5HAqSyxAS7YHKb44ct6yPM=;
	b=mVSiayspeoGS3xVxWbD08wYjN7OxjWQItvVmkjHmS8JmMzLCX9htFDJR/gr5n4Pzyku+
	 DN2thHBONTIEXro3cb12Y8HhX5OY4qxcrZf1tRiFlBvJu2G4KiSvrCq0lOC4hC1KNYYMv
	 QnqgtaPf9jEjNcooGL8GoUJXcYiOE1E4OXEqJbSXfjkOFYFprL1m5OU1NXXy4pY9aoNys
	 5252P0UXFuIdhj5qeoftlWGT9GQvAC3rqHEKWBwqvFJajuLfMZDGpVl7xU/72i+kJefGT
	 ODjU+OGx32e4ZG0Lf87Nxk5wMf1XoFtC1LbaEXVCWX7jgRuq+R1fMdi/biuic6PcYsQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624495;
	bh=HpFgJdD1Pnv2Cmi5KKhAJ5HAqSyxAS7YHKb44ct6yPM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gUPOLDx92ZghBTRu0FVevvk1TgXtrwKGMJUN1GXiEs/1vBR4HjX60wIy6SgD/j18a
	 F3A/P1QR5txcgv+jO8uCXyRcfLqGZItWbh2++Qry6Ukbk0dVZRTF5x4Iqa2qE+fwCP
	 /kIfKUDrdjquekM+hkaHqrXatxEbdge9x+GC97x8RSbuo4ODMzqZ9s0K7X/1VcUi/u
	 ChmnzdrEnlfwypZ0ZmHpWw+cENCp8eXCkdNxzfnWcFq5FEuyAe0zl4JxcJ1j958UPE
	 buRATqqjj/DOmixtmgnTSXEazdxWjIWiD5+9tCWa0iq9FhuCmthMTl1Ya7Kug0il7h
	 ug19p20ex3V3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D59D660ED2;
	Sat, 10 Oct 2026 09:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8577DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E32DB80F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S23KmkC0rVRD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 89EE08111D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=q/IWoIexjTtDvQK94SdKoaexJL0B/WVch8RkGGdvZKjY59uwpvqJf5iUfjqVwT9fchRS
 +ThS0tF6svB4/Qm+a2bnAL7JSkFtnwoXW+TXLkjsqCigh29jSw6gNqjfJVIw0GhMbDabb
 UOiv3ahhg8KC4QVC5PNBv6UpI4q6Oj/yPWjsT+H/xqFJ5yjzCGvtSSBhJj8+UWc3tk85w
 1X77ASVK9a9sDpWAolTqg1LQxGrF6fJY+XBoJfy1mpr+VP/5ofvuXcs/J+m230dPpz8tX
 lD+6Q6JaDv+I8funEgQxKwpUBROf9QbAEJG2d6ckcUd8aXA+1B/dDbQh4B66oThxCoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XAoYbDUhVUiemTf9BR8mczTXYyoR/N6z2dPlwjyD134=;
 b=jzHrBrV5UxW78azSVW3GgHUzU8GmoTkdBYTX+tPnvu5+qY9URGr62c4PhRm/s7Za6Sji
 MzoSvcOQfWOtmaMuK+HWUJjsJWBwc1cP+7ZukpAxoh6N+u53zSh2c0SbM3uGyC4c1SsVT
 M40cdOeYseteqnD61Ce58wtFY8ZNq10xfA7byca53mvtfebeQb25wtWGUERjBVFg6JiHb
 FmpgRbsnS6cGTfnl3YWH3BfT2UMXUtyCsNIaIFX3r/D7Uh4R7bGPb7qsX4+VLRqwnBAa7
 QnIoVwEl03VVCxlIjWaryHslY9bHvOOkB3h4yz32JwmcGX7xDLIs+TWWy9/BRfj527g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89EE08111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 726318F1BF; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c26b6aeb411ac040fadf6015570d548195b7405f
X-Git-Newrev: 7b9c2637efa49b7b35e8bbd4756f70fc0951c714
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.726318F1BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/setserial: CPE ID
 for setserial
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5331345590853198683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5331345590853198683==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b9c2637efa49b7b35e8bbd4756f70fc0951c714
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is a valid CPE ID:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:setserial_project:setserial:2.17:*

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3010c801e36762a97c453cd7bd173bd02f4b6b6e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/setserial/setserial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9beee349c8..98b2dde2f8 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -10,6 +10,8 @@ SETSERIAL_SITE = https://snapshot.debian.org/archive/debian/20250307T084701Z/poo
 SETSERIAL_EXTRA_DOWNLOADS = setserial_$(SETSERIAL_VERSION)-57.debian.tar.xz
 SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
+SETSERIAL_CPE_ID_VALID = YES
+
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
 

--===============5331345590853198683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5331345590853198683==--
