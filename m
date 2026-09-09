Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B39C79FBB
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD10607A5;
	Wed,  9 Sep 2026 13:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c2s_hR5LD_Y; Wed,  9 Sep 2026 13:47:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 84A86607A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788961620;
	b=fMN7EuAB5LoMjh4aoP/IeHqW9OXRTp7VGrHmXUldfB6FBsLag7YN1l4X93pcHTg8PMfn
	 UyEf0u00Yb+L197/2IY7HaBaUV1JTRyk7+tkjGSWHCbm9YQhtbc7W9Poab4RGeEnsnZvb
	 fJEaBF/YS95c5veKrE3qrAEqKYQ86LmIOLinxXdwFymTBnADWGcqyX+bPsbKDH8p4wr6o
	 FbAir+W8ePSVaWBeqGoMevLWBA/IbCvrlwk1fCrwF7mowsCE7aE5k8CB59gP7MUnWNOq/
	 tkwMj63cCmNF4B9kHQ7Ug00Tj62Qvm/rRoSoSUuQQXjb4rPHrfsu5Cl4GuyLlUA7SdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788961620;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O28rmzQ7HreZhAxw6+E0BjtHibU1vcse+QpHmFALk78=;
	b=fcyKYzMN1wYhEz2+JaSN1gFjl+hObXeGxifCX0duqUNNACM5Atu/0QkzUyChZle/e/Zs
	 4oROfElvTcEZU726nPB2f1OVzlyr4IYxSCZg7T7NoRL1BcCUpA6RffO+UtpLovTIcDD07
	 SOmbc+4HLuLJTeweqYn1DnW4sK3UAJZ1YpiQbirLIV3KKmGrMnpn+cjUjzww5ne7f3EXp
	 br55UuTa625Y2reIsfbIG4ru035ofma/b/eW2H+MsL8qUoxlEzWFFlxhGVJydPXqnkML7
	 KILNyDD/nf0j76tyNGOWn3ggMglVAnX3ICzJ3dEGEMSWFLIgcYFBLeHO3YTCGI5DAZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788961620;
	bh=O28rmzQ7HreZhAxw6+E0BjtHibU1vcse+QpHmFALk78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLoOP85vcS5ZNyaMDUDILRpOoVXWoDQv9wWB8CEMF+uH4ZpDZ+11HjtdhXQIfM1p/
	 NeVRFDPuuB9O14Xt87GI358TpQtMMzTTQvp3aeBOZqvrqKbu0u01xlMFfEnDDIGOtW
	 6rvlGDhxf+7e+ingBTUNthR+s+2scSQ4iulYRWLMKOiKbV0+88+A1zgXEXT4I5KzGr
	 HV/EecSL40c5vQoIbkGPDsrXOVhHPr6/2X9QI1zPvgXho8EVVw2pnZVv/SXKD8XWuD
	 9Z6B3v4ApRIbfrLBH0n549KnClwcvL7m5/kV7ov7xchaHJexhx2/UDKK6pV4pwsdPN
	 i+ajhzYkiDnnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A86607A0;
	Wed,  9 Sep 2026 13:47:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDF433AF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B34BA60769
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qG3KH9bya0oZ for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:46:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 78CD260756
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788961615;
 b=B71KtcpowuImsOCjcE4QdNwAUxWVitBco6AErViIz/6wW7SB0U+H/cw7vljDCb3I4Gmr
 rLwO1C/WJPqw5PbU0nOsodVKrltACncGvJJmyrmib4hneJ9QFzNbPSPFU7LB2AO7iawg/
 mOnzFeHwYkIYEziGcxqaWbT9I+tvPjgKlhq36lM81VsRMDOLN7dYc2kX8ozRVHm5nLxa8
 G30673K8l9VJN5VIwMzjMM5sKxC/AJ2Nuvr2cyLwGFqQyiAtLOIR+kVTSPJyD6saC6Ggx
 zj3psSbNsTfwQhVlTj8O+o3WR3Z3fvQEvzH+NmbmS2q0+OM8vU5koc2IqxyiuNxQsYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788961615;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Wv/zjaO0e/0Oa/MrJZnrn7igNn6vMsgzA1/BJY8ympE=;
 b=rKTmeuqb6ddwWOWeGbcwNZzvuREVxstY+L4jgQT8XMJauUlzJcgbQ+Ys7UdqimIi5Mn2
 35+OJ1ra0QlYZqUxIQr+nYcoXVo8CZ2HSWViNoSEU5flmrsxANvtWeRosw5TRfe3KvJgj
 /27MhXFkXaTrTno+fVLIqwsaitOUfOQN1lzjREhQeLW6ICxWDRULU069ORZOtMGNkpYSF
 +uZHu1pHCGlsrUp+ivsLma+sF6LUjBb5joYRV3MYOB4VjKGDiktyJohxGTpueMcqUNXw1
 k1OlfRt0Ac+Nqw85RkcZASZ0Z4qrgaoS9JD4hK0OrOdIc5Wccq0jhIeLSxKnOaAuOJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78CD260756
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D88A954D0; Wed,  9 Sep 2026 13:45:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 15:45:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6bb4d52c0f5bbd6fe27f023ecdf2326cc0f03ff
X-Git-Newrev: 5b076d3755ffc9865806bdf19efa99c5e70d3b03
X-Patchwork-Hint: ignore
Message-Id: <20260909134552.7D88A954D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: needs chacha support in
 libopenssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b076d3755ffc9865806bdf19efa99c5e70d3b03
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

/home/thomas/autobuild/instance-2/output-1/build/i2pd-2.59.0/libi2pd/Crypto.cpp:661:49:
 error: 'EVP_chacha20_poly1305' was not declared in this scope; did you
 mean 'SN_chacha20_poly1305'?

The code was added upstream in 2018:
https://github.com/PurpleI2P/i2pd/commit/58c92b8405f5da687734c1b0d6f7ec63dbb2d3b0

The build error could be reproduced with i2pd version 2.22.0 added to
buildroot with commit 1035e80aaa7492fec12cbc2fc5faa9bf32ef1cf3 so a
backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/bd8/bd8616f04df2e1b9e18d1e16921979a852bd566f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index fc2f3b9367..563f165574 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_I2PD
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
