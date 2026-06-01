Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B92CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 18:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C5560648;
	Mon,  1 Jun 2026 18:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKzK1RzvGwac; Mon,  1 Jun 2026 18:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE4E605F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780337455;
	bh=B/jW6xTPSMY3JqQIJVjcbv/yHrnlgDSQgdZVZGj5uqE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pHckr9m4/u4a+sq6JTVEawf+Jl4ru3D2iJX8XeWzXIOyEmpcjWTn/d0ZKibEHMZgT
	 1b4HW4ykR2rd0bwzLqCx7zQx3KlYMTgE98pZ2E+SlbLmPRuvfVnv+W7/0LeEst8GSq
	 qwvgLeWvChwCfESiEHY7o6shsnIDm4BaJj55529YXKZwx0Hi3AMG7n22XSv2tsaVs7
	 kHiASHwExLL2ZS6PVg65XCRwV5u/uDC8ByMHIvAYEnY8QyMWDLDnFzok66eXqN50Ua
	 wB5vwWrcL2iHihCCpTZXL6rDu4yJ+Az+nJ6mN3ov+ZjSpB50GxTphVPxOkMBn4wUVX
	 EPjypvxuwijpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE4E605F1;
	Mon,  1 Jun 2026 18:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE15DF5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F51840083
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 18:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyYN-_-tVHOi for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 18:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEC6440068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC6440068
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC6440068
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 18:10:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CFD7A4C3854
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:10:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58368)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wU76A-000000003Jc-2OiS
 for buildroot@buildroot.org; Mon, 01 Jun 2026 18:10:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  1 Jun 2026 20:10:49 +0200
Message-ID: <20260601181050.2022722-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780337450;
 bh=06KoH3iIfo4sHkNEJMV430+VRwpde7Zuz92W20V4T3E=;
 h=From:To:Subject:Date:From;
 b=iyANplXhe1TdNa6SOKuA+mEzA4Qc5RHQk58XDs+0NR0Enn8w/r/LZ9FoyU24s1xYd
 mGcARLWj5P+oxgI0C97D5hJ9y/JmwMHK/7RXoRka7V9miwO6FXZaX1VJqCQXelDe5F
 eliWtBnQrYdvHAv4xB3JCu2D/De4CqCXfwCOl9kN5fx5NSkh2lLSkF7jJe9p4LLdrc
 5xkxC0gePgtSgWYUn4dBglhchcJHOPi7Ly1QPIALPtg134zmuCE/mrCZtAvSIg+iu/
 Jr8DAtj6C0TvgIQ07LWRTshGGocM4j20AXfoSQIm7Zs3qKrh3eBoUykTpbdrPsqOpx
 /xk+KZCOW+GWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iyANplXh
Subject: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions: update
 for split hash file
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

Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
linux hash files are split between pre- and post-6.17.

With buildroot commit da01b7271a4a9048ae8e8ae18753edc5da785a44 the
script was updated for the new situation but still needs to update the
version-numbered links to the directories with the correct hash files.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2568080242

 utils/bump-stable-kernel-versions | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
index 6303bf4010..0e76cd1168 100755
--- a/utils/bump-stable-kernel-versions
+++ b/utils/bump-stable-kernel-versions
@@ -78,6 +78,10 @@ update_linux_hash() {
                 echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
                 sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
                     package/linux-headers/Config.in.host linux/Config.in
+                git mv package/linux-headers/"${old_version}" package/linux-headers/"${new_version}"
+                if [ -d linux/"${old_version}" ]; then
+                    git mv linux/"${old_version}" linux/"${new_version}"
+                fi
 
                 updated_releases_list="${updated_releases_list} ${release_version}.x"
                 updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
