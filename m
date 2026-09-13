Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55BFC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9ED80E76;
	Sun, 13 Sep 2026 08:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xH-HPPsQBWj; Sun, 13 Sep 2026 08:15:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 64E1F80E45
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789287318;
	b=efH9rAo+Vq56xtEqoqY4/12gdTGiufyTHXwtuZDwX2zAlikx4+dJkiRO0D9zmxt9Tpzy
	 /KlNSaTFFcMY9hHw+OWSHjqueiiaVfL4iEppI+rnCrAtBzXnxk/pUE5XR8KILTH3LETBy
	 nJQfrJUQEs1TXJw+ihACNTDHCp4EJT8vjSzRZKp2XMJeiSybjGqIyAh6edvp9E9LOXvWN
	 BjtdnkfeQ1VoJuEGBRALS+4X1/L3LYcxkduxvDuoTrItf8+99YsM/wOR+/H3GGlk0PUAd
	 zdMYVRmzpUiPgl4abvUsMvV1Tp/jWrVJL4vm7SOxxUWO/4bJ88KqPGVouhneNda7wLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789287318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MUBX801Qlzg9oGWBBrpzF4K0A/mOHJpG5XMA6ZxPDzg=;
	b=jm0XzLOpYiwP091SezCs5DnsHhmK7Y0B2KlVUMv/747A9XbxoUfyMwdzj5nf1X/oB8y9
	 ULCgrheObEqLrcKyLcR4J4VAc63+0wG16nZ1f3BhId2US8lYaJLjSYD84LHeiY0b5h9Nh
	 qFvoML4kkXvpiHVERIUDjrmmLAK6FLMlIaSJ7qw6FZl9WEYbX+15MTv4prDi8yGzv5tXK
	 El3VwpQs7x0i8IIg9BFIkOjlwYDswuJGwwZ5pCPCzn3hhHjc441tVOnKafGo48b5OCyDm
	 agKONE4nlGN9Q8uht3yihB8e1/4XG0vvSiciKqHGwfi5TE/5Zy1nP0PcARuXfD8i8ww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789287318;
	bh=MUBX801Qlzg9oGWBBrpzF4K0A/mOHJpG5XMA6ZxPDzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qkKzU37837Dxg9qervxDJsg8mOovYGTTapVmBQ0Kt/zfW26QpmmWxJ8tB7/cIVAfA
	 K4aqYfOIOFmwRGax6HdAFsqapSafOiwkkPij8kLbDsfjAql933kjVZLcp4ejV8EvqU
	 poT539PAFXMnwfQG3mI8nrl3VRQ/K0rocd2Gr0nRdlyvY5ynUdYPJDcTvP6+y8t9ll
	 1rFXi90JrARprlpKoE6kLKbYE1Vn8pSQO5cHE0V7LTYJ+QwqyZ+RbpJxtA8kbqiBWN
	 4+j2xH3zAMjMwqTdiRufwww4464pCOH3pHsMUQn1BTawmODeS3RU3KYeYzQE0hJg+b
	 13F2i1I+u184g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E1F80E45;
	Sun, 13 Sep 2026 08:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BD8729B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893DC400AC
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTT261TwvH_L for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:15:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D0BDB40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789287315;
 b=FmFM0g+AhrMPKOzcrc13RdE8hdpkZOWMKE/vgZVHo5XAvw3ANr/3vy8FnxH/xkPtRDsw
 +CRhO5yAt0t8T0vEWr05PqBwM3Gp9VSVdi3U0KEYPN7cQ4vypq5rhrSQbcOwtyf5hhYSi
 MEwSFumLCaIw7zTPJXXDTIsNwxLT81g8m5h+7I+ANKpd6YkCbG9ZscXFJj84bpopH2f8c
 uDSExE30Nt7rXl8iskVxLUdvHusITdmGGBVVnobomNNDIHdycRWjDoyV5IKrDzTVP1XMM
 Mn9vW8PWcLVmncXjac4UGh1lfcOmhIqJ2A7BfEx2gfk0pzQaDq9npgnIrr+YLNTpo4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789287315;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UM4VSTlLmW8SLHgn53kDZ2rEeaxfgrXnS7yjl95sVdU=;
 b=Q0Okt3NGs9l1+54No2SSoFb3bhcqQvXRFmg2mLs/rsUg7MjZPe1KuvFPHqqlQVeOxgp3
 LbIZQeCGuIufHRh/A1+ZXlN0Wxg16kMblzV6/NyvkfNZ6t0HqZ/G1vQC+q7LEI6n8f1ww
 ZGYoXahxqw0b8Iki1+eQbLl7Fc8DRGxUfbvQj3+Lf2Q0MQm1YCCDTTFQLrLZevzCa7teY
 wtvZG8Oi6CmtzWy1tLBzLfRD9CD3pnec6mn2pdHhh6N7DRcZEK0+kHKa++k09Lqocg0Sf
 9HVxIlTlHGhI3d8YGOywGdnXUOo7PHZIOMYkwEu6YHZoBzRfAa+75FCvica8G4fG3xA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0BDB40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:15:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A6E6959E1; Sun, 13 Sep 2026 08:14:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 09:52:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71d3ffd3727f44331c7a330a9b687f503852e839
X-Git-Newrev: ccad393abf2abb386d3031ee4a28f8317ba9a891
X-Patchwork-Hint: ignore
Message-Id: <20260913081411.0A6E6959E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: enable smb support on uClibc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccad393abf2abb386d3031ee4a28f8317ba9a891
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

samba4 is available on !musl, but samba support in mpd is available
only with glibc. Turns out that samba support in mpd builds just fine
with uClibc-ng, and that samba4 no longer needs native RPC support: it
can use libtirpc when needed (it's handled in the samba4 package
itself).

Tested with the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE=y
BR2_PACKAGE_MPD=y
BR2_PACKAGE_MPD_LIBSMBCLIENT=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/Config.in | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1b6815e904..831cbe933d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -226,16 +226,17 @@ config BR2_PACKAGE_MPD_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
-comment "samba support needs a glibc toolchain w/ dynamic library, RPC"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "samba support needs a glibc or uclibc toolchain w/ dynamic library, NPTL"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_USES_MUSL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	bool "samba"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL # samba4
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # samba4
+	depends on !BR2_STATIC_LIBS # samba4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # samba4
 	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
