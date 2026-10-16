Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BADCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5277960BB1;
	Fri, 16 Oct 2026 13:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAOu5FhGi3wY; Fri, 16 Oct 2026 13:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3272C60BC3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156152;
	b=lNld8h9sSvCuvXIuuaxw3UhHxXGTwiM7YMsEt7rJs3P1sSXi516EcRFXSJL3bZva6mjQ
	 ta0nKEKpy5CmOzXvR9l8+IkRNXklq68EEJfC2wFeIFGH448BWWcdGHxLRDXjSbNns3qNj
	 LyfZFLsasqL/bf0ouROE13cBbegzXbnI7r5Eu3FguKzsWEeBb0T4MxEHYtx0h+ejHWm3f
	 ims2LkVS9YqsAEBVW/3AKZAxGyorZ2ZHvJLiJ7Q20sCyV8lLNyEW6/TPKZMjdrLLpQ0KN
	 tEEwnsBrSp8QEpuaMImpinNuEECmqA2I5c0Tqor9I+OqfyyXxF5OTDag7lvzkSmjC2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+jiU+zDprLmoKuoYO1UyeRAgtnbkUM2dDUbdJcbrxck=;
	b=enGPkAUoLIwN84Cd+eKCUTS+A8DFszk19Sj4pJEcYWZ4ave2rEymKEc09i2xwEA1nrHh
	 ycIXGB6NIjlxs12cPNLsGQm61KFdoaWJYlWmvUg+DlaSXFGiT29VjKAMJ17splC6Ot53p
	 /7Mkfg7AA5cY1EWBuC9NVCwG2tgl3f6tyHxVeAZn9RthkAne0ROZ2XpBdG3qxHwsoTSfT
	 1RLKudv7Hcfo0Sf4XC3+1U44zP8rPYkuJRc/ZMRwxaFhCrVl82QHZ1knLqkb1CobzaxGS
	 1plGjcRzkBtmJe8QtlNNXtVVexfdIoUhtN6A0N3nVn5idYw+cWvoxxfAPxgXSHQ2rrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156152;
	bh=+jiU+zDprLmoKuoYO1UyeRAgtnbkUM2dDUbdJcbrxck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fDEGI+cbv6BvnHnHdUhLZzLEmxfeTSkPTT+KX4Fou9k6G6CXNe3DgyjJQ40rLk3IS
	 Ux5oD/GU+KWmKOhMeN6Ks9waOnAKsegWpQKkm7zzPW6Cy2Bs7LsuXHD2NMocYqTSGK
	 i8jRJcbvcW7/uLMIOOZiRRrNbBBbU2N/SRavt0RHDwSk0tpajUk6iNn0ZW7JyG/fIc
	 eSCUCoyqY34NDVFX19Ua6av9Pmb8N5Vc1zeTmMhkhYR6JZkhUijwC9THazesNQTl1v
	 Trk73KY8FMzWQ6T8hbm2LIar6pVz2T/slFNFp7TdQFzeJCvQ8jCPi2AWlNMDdYoIH+
	 YDoT+QKN6P1xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3272C60BC3;
	Fri, 16 Oct 2026 13:09:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC50151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C024240A06
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzMUopCMegCA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E32C840A0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=Gxmz1CWwxPnVj6lkr1LuNsLAixGMJGpWkPOr8HK1+xEmWWwjGhHaK/Z5ExJ1vKMiRxXm
 lvdy+2ZwAcRO5yBDU1/UgU11UnlaP/CrGEh8XM0N9Myb7IeBC+wpD+g1+gMZ6QivONOl0
 eP3Z/Qrb3PcGHDOc5PqYqygLQTUb+VW8I001YAygoKC5TRcK2jLYe2MJm2lV+JV2f638W
 7eOS5FhXIX3Q5B3hYVlE4fa9DJw+pXj3YmtZrWzPm6S2iNq/g3zRZzgvB4BV4L9r7Ssh0
 2XX1QuaEDUiSfAVazVcrj2eDuIrSxohsHF/KxyQn9BYaLTRqsmzMUb170U3S8fW+zPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vqb8XnglTAL8etrQzoxVI4XhwxmqlHt08LyOcvml/k0=;
 b=N9C6ixDlXAc5fagUzr+YvVJxM/GAMYqMT4/woZJLB9iwpdTmR5D23EPhB3IBwXfpDSDd
 BtU7L6ItzIsvXa6ByHm6Qk2wx9Ssk0i65SuWIyPkIRparpSIVueb+1oDc781wAmaGeYy/
 E+8Pe9tRdGM9eEJaMs2X+imdZYgb5SQv5r8klkQZqwrqNTZEaJMO/rvN5COlKSkCdtucL
 N35ow0cjyTEq9eQ7PPIalL33v+DTKwf2NDLuLWxyt7MnQgapRjYQXsOWNzTjNoK8npSUs
 n+IsRoy4IJgaODxXqAwu4zZHrYl1AfMDYirl1BjpNCk0RP5OhUB/2DwXFt511iH5KyQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E32C840A0C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D47E3960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b16510494383501bfeaaa1725433bbf3a370434a
X-Git-Newrev: aeaaf9bc810bf3cc67ce4bcfcd070fa1b6fd01f2
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.D47E3960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/patchelf: add CPE
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
Content-Type: multipart/mixed; boundary="===============3945485730238058116=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3945485730238058116==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aeaaf9bc810bf3cc67ce4bcfcd070fa1b6fd01f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:patchelf_project:patchelf:0.13:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2022-44940

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ee8a99137dfda8f7ab88ffb6586e3feaf152de4d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/patchelf/patchelf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index c583b228a3..911db48e18 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -10,5 +10,6 @@ PATCHELF_SITE = \
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
+PATCHELF_CPE_ID_VALID = YES
 
 $(eval $(host-autotools-package))

--===============3945485730238058116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3945485730238058116==--
