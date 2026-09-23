Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA737C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8250F41071;
	Thu, 24 Sep 2026 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CCJ_J2yviTp; Thu, 24 Sep 2026 18:58:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 80043410A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276338;
	b=b7DbDSLID71bS9ezJ6rTtcyqxzm2ypWMC8o5gidx0yvLQETkal7APA3RGKKx+pGhCl8x
	 M5+jq1CY3z2c0NyWtm1i6AO1FsoAzSn6ht1dlz4lU8SxoVkzR/dJ/ndqdxF/Lsaox62qO
	 QAHwXRFG2sFPVvJ4xnUibagtDVJWEeThseM/7RihVHDfgDhBLgcnGYdZipdwpGyaQLwO3
	 jYfsQrBt20rYmw/6wLm6gDCcxY6dMbUqjw6QTLcPVjj7TNLc8OW+RktJn+dvzZvOQtDPh
	 pRsskHSVfxSUvHDOeP7fUCHv9Ncfxi6SBhHiPuHYWmNV2u6ENnMZYGlygrPh6kU9Wqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276338;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DeKb9TsnCKSY7DADIdfSvl0AWv2Lh6AZ4dzcjX4aB5M=;
	b=WAhqYOYIrRH5Xwd4RVaVmsD2+AS2c0dPK9M3DNJBZMi2oHbL/VhQPXfTRDt1xLMIblY1
	 64U9JD2gU9vesImV9numM60WXOjEn+DdH4m3dgfIgEuUIDtdt48IXaFSZrzSdWjY11IPd
	 YptRz6vXY9X3X46jTzYrf2gxeMeLNaFhnXMphhxODkGawoAnVR3DZwUOCNSXRVu2nkain
	 Zhhj9U0I0YnKj+QpWMiRf0EEAA0uC3rJoD9PPvGBDoKBma4aMYfAs/6YOvhIYKd8h76ra
	 HR0hkG8zWXT6Kl+8KKKrX5yA/se/Rmr0Pi3/9/rKynR61fYHOyAs82id6i2724Qye2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276338;
	bh=DeKb9TsnCKSY7DADIdfSvl0AWv2Lh6AZ4dzcjX4aB5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oV2XfwZFh2DASApxQ4JJFBDiMPJhhETtGOZCotmT9Z1gonPJt9u6P1cY43XBXb1vw
	 FWvi1Kmw+QHVYprGMJzBzC+w+M5pWW+R9M+kfMmVB9NjjIskRlQVkR1tPgAkFkoRzE
	 lTH1qyt/x567VZ3OmIasLUcSlSvv6rTO1YGYSaleQDOBuduXM0FttGmW157u0QOTdo
	 B99B/Fg7zsa+wuLLcQxoT/higmw9lJMH7IXGPpk3R+Y6iIR+7DPxg5C5gAsZwzaZWm
	 qZH7PDa3vYXgQGPVHqx9IjNxQIlDIvTs/nDo5ir73fjio6lyzzBHT6QwD3W4y6KU4E
	 s5KmvpGJB5J1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80043410A4;
	Thu, 24 Sep 2026 18:58:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E46D332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F62981226
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKsDmGwt2rHu for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 82EC98122B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=PeK0VuJ2e7G2GOvKh5pHQR3wM6kcf+GBVP3BIlhUx0pwWivlN/2qH0JatHqFjTz0slw+
 3RL+isLrFZsib+33frPZKWzQWuHw4WpuIqK3++SfSZuFSFF5+SkzPVKogzO/z5GbCXqrS
 rAZVo43qr8N5QACKUXwykYtZGRW5EKjJHFZ6tHyV2C4OqaiYFGo+6/HDrz4IP0AZ0KzMI
 41dmb+VZWRAZ4h32MyBLoJ2/RbnBma7EaJZQn/mYFDlYpFCrVEn8V6cIJBSAVW2UIf5Di
 jwSEEHaZXqHA/aU94tx+sVcgUv0O6fS0+EHMomMZE1S4H37ROUnrzZaNTSywzirZnXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MB+Uev2zyy2VlKoGu22K9PWgww26i0B5XNgJPE4Zt4w=;
 b=quQ4e6Gco646pXPNrgOG5Ue5fwSINEOPLvAB04Zzfm/lF98V98J0Q2ko+mY1zOLILazE
 16fJk0nZkHJtPUJ3PgywpArnEqZBPj9Ft8BgdMyzQa5pO12pln48zU1IfbSIuHM5mzZ93
 Mu2W+sx4GhkQJOCWbNq2QGGZyPk/spKjd9ZJKmkeBIBAkre6RCFdAy22/sZDyPYmMf62o
 e8h8nLET8VlD5D82/ArF7QHDpuzfKN8yvJN1ml/t0nR+wYrN7XKx5iQ9zfUCpGU2QTh9Y
 bRfl6SgagVTUAG5suusXdc7LONj1TgS8w3bbJG5xg7zgTrIiE06A7EyKhlum9KbpHYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82EC98122B
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2629694AA9; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:05:20 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e1195dcc2a13e1176a71ae16cda824eadf60c13a
X-Git-Newrev: e249a14e995a38b8447e9a66ef2fcaf0720aaeeb
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.2629694AA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/qemu: host-qemu
 does not support AVX512 CPUs
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
Content-Type: multipart/mixed; boundary="===============5414722733505341431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5414722733505341431==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e249a14e995a38b8447e9a66ef2fcaf0720aaeeb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Building gobject-introspection for an x86 CPU variant with AVX512 fails
when g-ir-scanner runs the freshly built target binaries under
qemu-user:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

The Qemu TCG engine implements AVX, AVX2, F16C, FMA3 and VAES since Qemu
7.2, but it does not implement the AVX512 instruction set at all [0].
Therefore no -cpu value passed through
BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS can make such binaries run, and
user-mode emulation is simply not possible for these CPU variants.

Mark those CPUs as unsupported by host-qemu, the same way it is already
done for x86_steamroller and x86_core_avx2. This relies on the existing
BR2_X86_CPU_HAS_AVX512 symbol, so all AVX512 capable variants are
covered, and it disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

[0] https://gitlab.com/qemu-project/qemu/-/issues/2878

Fixes:

  https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c2bd6148c62dbc4068ea5d53c6e95ffdf6352f0c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c7dd5876e5..e5379e7224 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -23,6 +23,10 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_xtensa
 	default y if BR2_x86_64
 	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	# The Qemu TCG engine does not implement the AVX512
+	# instruction set, so binaries built for such CPUs cannot be
+	# emulated.
+	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS

--===============5414722733505341431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5414722733505341431==--
