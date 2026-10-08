Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8113CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED2540434;
	Sat, 10 Oct 2026 09:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_f5_mfgRERb; Sat, 10 Oct 2026 09:22:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B0428404EF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624142;
	b=LPYccn4/xmGvvqgb9likCSOcNbtaE48iNrxpZW7kbqNVhdB+YLmWtSmXV9zGJKIMtXtk
	 FgLyNPcK5LgsDtvusZXp9ZqTWsDyqB639QPH2SK0KVWndMEgwMIDTX96usOi5lyF0KTdQ
	 hwaRp26NBFP84Oo8SDBKPw9ZLPeZVC6KvCRw/sqwS59mkjeZqU0vh27eDWPv70Sg5lped
	 UbwMuhgiiyNOoQPC/ssH+G6COU9S8p4JyQJ8OK8ae5o0H3WRsHtYQUeSStJ7OxP3j0hNS
	 xhW1DTrQ9nejuOq6voazzc1mOuDolI6/w/44IsonLAvFKmxbMGHoCgy/LGfBrvjuC5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=lUUCs8oMRElveXGvkkASOUOJPmSg+rFxyIVncFOVSsE=;
	b=FvXBKVrcb3pv0v1z3d6y1izvjUTsFIj+P5tEaKDOKxRU26WZEec+CfbtKAT1mZfxNW70
	 eWgcnkh1/U9RPU0HscLe0H6H9vyOCGedCb6j3jrEgmxfmHD4VV17XLFWvT3Lx1ltCQo2R
	 ptk81xtv6W2/Ucyupwxdr56mIViokKTI2rckissYxAzDwR+OwTedOhp8ZjVvJJoa1LAD5
	 gf7CFPsnlO4FCg7g0Iq0WcJzXakSomWmNt3gsgyZ2aFN8dD74TcxCE+aX2lU1kdJL4I/A
	 zqVGcYYTSx/kti3YWfa/klm7cAEou0OTb86FZPCKb/EJ+2qiIyElZN7IIh9BgYnL19w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624142;
	bh=lUUCs8oMRElveXGvkkASOUOJPmSg+rFxyIVncFOVSsE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s4pB3ZHgbr79xFVMc/Ux8tECv9a0Hm1cTgmidY26xOnl9C3/pRhHPBb1MGkHS0uTu
	 FsZTkG+xjjmaCxzAWi39e3r/vcMSd5XgGgqVuDTKkfzesx83ujPH9zooTl3UveuQec
	 zAaXaKpQ+RTdvE9K6KgPSdMwJjKbFO7scUx4puHbGXll+2C5YF/Md4a+nfj/YKX5mD
	 Jt2AVPgD+Bq3wcAAcJ9Cgjtn46XF17zNd2mF1TvI9/wUlGWGNHb1563O3B6Ia1YY7L
	 nc6+V4b9RGEk3BfBO9UH5mvldLwj3EUU2vxsCshPVJQZkn+MyQ2jJpBNsYlACpjyyA
	 Ar0kcAoLR4w+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0428404EF;
	Sat, 10 Oct 2026 09:22:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9670DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B9AB812A8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3wdEuQu174W for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D51EA811FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=c25JyUOS56pM+JiyYpBXgmFBke42tqXH0W5K0wArmrpmBSqn2Q3Ai3/6p3DJezWDTjF1
 5VoQynjJQPCKjfUOsP5RTc88fn1/ENkyft3yc5iaISVsDohfzUo4CTKHUC18tG3C3PQbu
 jNu1f7a5p/I6EuSrYNYNUtQeUU+HPotHifYr+7nVKHXcRzttQCCXp16XWP78tRhdrzQPs
 ZEeBOMsmi3xMQMlA+8KqKFam1Rr7gHbgnIefOk8aG/tCVLqFZJL1wwvPitpqdWSgSoAcZ
 tMD2K8lOkhPPCxfGiFF2KP2khooUNSKxg1uFMiF24SyekXPoCcIOtgOxWZZxcFGMXug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=grWGGFV5MkBXfi75K/SrTTVlnIR2JJ9hA+Z0VPAU3xk=;
 b=Cjve0ew2k3fpZjWsEOuiDH2InbqJIZGvSaOBNnSGnUbBCtOtvWzXI8zCj/QXwA3p6dPt
 OOLSY9ADlzPYl80ahuGWuSTNOVa0xOLiYbMY7+d9301nP52y78KataP/Drl9wZw9yvm69
 RNstKgWnngIVu2Ua2Y5LPKyum6x80KysLpjg27i/CXiwR8VhrWjjZR0XdSHL77I/qn8U1
 DWlpWf5BpfG3iPD7EzPsZ9FGcT6jLVetpoLbwO27aqpR+hgm1vBi8aWtzK8EU5H5vX2Mi
 ThM5Ny7NF8O8pK4STuSxsF9xsh8rsjQ69LJozCnkMTNKcCEwXH1RkhGAvhBXSKNC86Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D51EA811FC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5FF8F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:28:33 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: daa15b62e46b6e12f4e3ca60cbd36cbcbe94d0be
X-Git-Newrev: 71a0aff9cf58791f2b777f2e52f1505270a8b16d
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.BF5FF8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/swig: also create
 a swig4.0 symlink
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
Content-Type: multipart/mixed; boundary="===============4343734269721251695=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4343734269721251695==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71a0aff9cf58791f2b777f2e52f1505270a8b16d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

FindSWIG in CMake searches for swig4.0, swig3.0 and swig2.0 before it
tries plain swig, and it searches the whole PATH for one name before
moving on to the next. We only create swig3.0 and swig$(SWIG_VERSION_MAJOR)
(swig4.5) symlinks in $(HOST_DIR)/bin, so a swig4.0 installed on the
build machine, as Ubuntu 22.04 does with its swig4.0 package, takes
precedence over our host-swig for every CMake package that does not pass
SWIG_EXECUTABLE explicitly. With CMake 3.22.1, libftdi1 with Python
bindings ends up with

  -- Found SWIG: /usr/bin/swig4.0 (found suitable version "4.0.2", ...)

Also create a swig4.0 symlink, and update the comment accordingly.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9722f61382cd86a55e80585af3a088b4d121def4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/swig/swig.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 71e5e05f96..0776ad3d74 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -30,18 +30,19 @@ endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
 
-# CMake looks first at swig3.0, then swig2.0 and then swig. However,
-# when doing the search, it will look into the PATH for swig2.0 first,
-# and then for swig.
+# CMake looks first for swig4.0, then swig3.0 and swig2.0, and only
+# then for swig. However, it searches the whole PATH for one name before
+# trying the next one.
 # While the PATH contains first our $(HOST_DIR)/bin, it also contains
 # /usr/bin and other system directories. Therefore, if there is an
-# installed swig3.0 on the system, it will get the preference over the
-# swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
-# this from happening we create a symbolic link swig3.0 -> swig, so that
-# our swig always gets used.
+# installed swig4.0 or swig3.0 on the system, it will get the preference
+# over the swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
+# this from happening we create swig4.0 and swig3.0 symbolic links to
+# swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig4.0
 	ln -fs swig $(HOST_DIR)/bin/swig3.0
 endef
 

--===============4343734269721251695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4343734269721251695==--
