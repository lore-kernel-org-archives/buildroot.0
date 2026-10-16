Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93F8CCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14766104C;
	Fri, 16 Oct 2026 13:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRMS6GD2CR-i; Fri, 16 Oct 2026 13:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A57A36107C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156267;
	b=LkIwVV5uK3BegrO5RDWuXBzRb/rPx5IGddDeL8v4jq8rDFzjYBklf794/IwfNRddbpCk
	 SjDCMrLs+uoJnXzPT8sl1AQLzByzXKYRG6vb/SJ0ObJB82CRIuf4wX6xM1ZBr8vG7SG8M
	 zik/M6uH5Rd6DBYeyLWDpcUWfpXR2YUW6BhX0E9t20gOZXKAlccw9/bRP/teRs/vU35gs
	 ilyPxjQPqyJenjloHqQ0zWIc7KHXrPZq0tSkQqbdrBVqldhpJSBRlklYQqBtvJ002JqqI
	 1nqzlwT98Mh1IsBiUdl5R7/PaTgMZcU0cUMtecFT9tBtDTmS4S7WVgduEqeRTlA+dlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=R3tyKsMuyg0dxjkqrO3/oDOcc9vrb0XrpnHtO3Y//hI=;
	b=jR8j2lXQX5H8bW6a0mmT733B2ZM72Kx2acJEmt5M8g8zS3Jp3QPwdNYZzGiryN2PgTg4
	 w0Nc4Lu65XY0x5MEiz7wHNOvKacpsyaEeD+hSvg2z8u3TNPdLSueaAm/1V4wKdKsjTY71
	 aS5KXuJnEC4iL6o7eK+hIM2X9y0HUZQ2pTL+742a94FyH7LchcbEvfVRKeXDdSUYizrlK
	 GrddC+jbJkNnXerQrHiA3sT1vEAEZuKfQB7DvVAq34uyDvOayZU8sm35AW4Vlg32V/dbq
	 LLeunu2e/du3WkA03gT3XG7p8vAamcEOSaOlWa0nVOZw6cr1bqf8WmSEOhus8vgdasw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156267;
	bh=R3tyKsMuyg0dxjkqrO3/oDOcc9vrb0XrpnHtO3Y//hI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J7elQ3XBrcGspEnO6yxr04CYiWKWr1tOU2QzZqMDOiCpqGeguxJqN46KVPbFUGSlM
	 WsUBM50InnvWJtNefeN2Klntg+C+Im+pzSAthwxJETuJ4Ev4hPnczkqd6kpyD5f52X
	 SE8YcB/CfJkQqtj1P2hcTHJmrB8BynsB2yeiwlLcO+sAr55atYGNOjRd0eQphkvPzG
	 mPzO7yruDCT4c6Se9befxNtvg9Ci9XdaSIO1kSy7wtvHOgsKFdAYKd1/KJisNst4A/
	 tv/s1NjM+Q+m/WcaUeqPWrJLYCZ2xiCUBCPXv+G5d99ZY8akLwZbBqvgumGb6HJO+7
	 cTU5MjkPE7ljw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57A36107C;
	Fri, 16 Oct 2026 13:11:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A65BF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F15780772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgvS0q81qiAa for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 55DA381517
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=rM72GtaET4whcKm+pOY8u5MsL9mRv5zUzBWnOtWTLARFry6CgvRGjxyJRz5mmX81PWxW
 FpFawi6Ay5cA7G8cTwrTVhbLNcl1+HN2mmdqGd2+Eq32AMwdtzDbgVRdWitkUDzHzEXVc
 d+1DrA9xt1+Rh8TtBqpgtPijRN96/9rOJLS4e9dUzEoNx5lvqGd4fHvA6VvbPfbv1VB+G
 wkts2ztCC7uqpfQROZsdB+8QmjCOSFRlJ03TQsflc+cwC5o7loxiUY9JxH4eDOY1yTaFT
 yPQjaEJof/ldxL5aBOhNr3ZCy+6Mn7U2oL728QlvZrLJ8R97V6Y21PrUIsJls2qK8Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L7qhM5gu5CWpuPJCxAEyFZQ3PcMS/9I5ao4aZiNCRRo=;
 b=sB0eCVCIWMJklTzc2DdRMgKmuv+dnc8Sr0OULD5Dr9mvCBMespK+UfpU6Q+uySzMMreh
 JM9qNIaGg3srhXVySs+dqfmXITN0RbiQuwzIELzNcrMKGzzXPhs8+hFtPj4Uh5WC3bN2H
 U/8PUWJckxyzCIFKd0dpvIzt2UlLgGIhYE6WCslCJbNtWbhWYb1pcGxAqONW1tTq87dpp
 MjAHK6rmngq+HXiH+XmUMGP/N2ojl3LnQvRnwowE3sqTPKFDIQRWmOgyzf1aeilVrSX6G
 FWjBSRrmwyTJLpdAu0V6Q9pzKZNIRES+KoUTP8efwx8JEJ31L/oGIYWGOyrWFqzAilA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55DA381517
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46F8A960D5; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 14dee75302f7d2b6e6345369aa5c15c1c080d81d
X-Git-Newrev: f80c0fe450b62a4c20a35bc002bf78ea7386efb5
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.46F8A960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/grub2: use one
 IGNORE_CVES assignment for the 0050 patch
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
Content-Type: multipart/mixed; boundary="===============7066639623856146172=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7066639623856146172==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f80c0fe450b62a4c20a35bc002bf78ea7386efb5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

check-package associates a patch comment with the first _IGNORE_CVES
assignment that follows it (and its continuation lines) only. The
0050 patch fixes two CVEs, which were ignored in two separate
assignments, so check-package reports:

  boot/grub2/grub2.mk: patch file '0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch' 'CVE:' tag(s) 'CVE-2025-0678, CVE-2025-1125' does not match the ignored identifier(s) 'CVE-2025-0678'

Ignore both CVEs in a single assignment.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 boot/grub2/grub2.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 5de2afcc32..20698910e7 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -40,8 +40,9 @@ GRUB2_IGNORE_CVES += CVE-2025-0689
 
 # 0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
 # (yes, two CVEs are fixed by this patch)
-GRUB2_IGNORE_CVES += CVE-2025-0678
-GRUB2_IGNORE_CVES += CVE-2025-1125
+GRUB2_IGNORE_CVES += \
+	CVE-2025-0678 \
+	CVE-2025-1125
 
 # 0074-Constant-time-grub_crypto_memcmp.patch
 GRUB2_IGNORE_CVES += CVE-2024-56738

--===============7066639623856146172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7066639623856146172==--
