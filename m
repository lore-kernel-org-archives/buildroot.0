Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D79C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F380760EBF;
	Fri, 18 Sep 2026 19:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHmPObCMNrIc; Fri, 18 Sep 2026 19:35:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2677F60EB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760145;
	b=Nli5TBHJzguN8T4c7K6Q8+w7hA95EHOgiYWVTJkKc2hTIBlHLB6ol/tZP98JxtIRFt43
	 CfnJghmuCqT6GzzhkfAlgMwZdMnhlzY34+Y+gp3llxwOTYeTt5/cFl3IS5eNCjS9dG1VQ
	 RNi90jsaVlcaPAGmwCD/C1SRgZmY33n1GRT2/M7EmzhR5FUEU2TPdBUUWJmJ1Y036oKIK
	 x2Ap/3kUnlKPc6khnadWqBJWzhzcWIgSLKWEXZD5nOEupLey0YYCY4z9JXsiEN1+sAS+l
	 nHLe8GrYOMms8bUZcL84Hrv38UukOhR3J5oLFSQUU+SBMzx+LSYmEMJPMkR2ZVmbhSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eh/YxoxS6c5/EgpEh8Y1VoSfXzpZazw0q8tcc7AY5MY=;
	b=kUmN6PPq22E7AtTvOaopXmtYlx2ETJTQYDV4R/DiqkiP3LEwfzstsj67xBn3WaqnB1WO
	 FAtbb0GAxob2li31j59FdmJkR2ICPO4n8/yY5pimedU8qdXAcYaZp70R5OWSvmMdr7+HF
	 O/AUI7XaklpjVBEPZg7m3H81+q8ASypG0HVBvKZp7Zps6agl6/uNwUpYQbxZLixo+CLRc
	 JSqlDzVSDxgTbINxH1OEfetCag9XxE/XP4Hb5Jchnch0fsRYNvc0/HRLbF6abXPvB4b+F
	 gQFF17nhHNwhz7Da5Gw3lrN2GRywUW91lYpMM0WR+MJVVoF61TcEUUySl1wfATzWPhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760145;
	bh=eh/YxoxS6c5/EgpEh8Y1VoSfXzpZazw0q8tcc7AY5MY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jhXdJlhpp8Kqf/kWry5r3U4EbRzzwrF3qjHCeiIn3TdHmXs/Y+kKIb8EfB6aya0xw
	 9fvj45EAjTLLbNHs+dKlH8SBZXJAofNDAKniJoNEVKmK9glXGcTarMkezdH0voHtlw
	 Xf9I0wk3v9stsSfzkge2D0k0StoQ/dEcWawjT8sGv66TgnaAjbDuxXlnN+XjJG73LD
	 gMJ6bucLbvMC5zNR62jkdfY7OODk/4ymX/M5zpgoP+uzmKTTQFYHWETyzb5sMbbpJJ
	 53Yu+QVFuq10JPfPQulVcqq2uKjx1ZSITWy8c9yA9Hw2ZhyZIqdIHB9J7jbKdlkhyC
	 SSt6LTeoBp1ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2677F60EB7;
	Fri, 18 Sep 2026 19:35:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC16413D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9FF260E02
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XwYrri3fOnZ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D77EE60E30
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=sOTdDyPibhhi7KXE7oeDVeYYYHiQPGij6I5pTnhc94KxN8tSqiNsTeZ+XaXTEt1NwtY0
 F+e4zE5gVPgKMK28uwIK6x119ZoRtYGd6e6yLsh9WUS/qyW88apKXNcS3yoS9QvW/sXuc
 p75ATi8XDkAEUQTq00Mu14RIRDrU2aqnOVgWik2PvofQacXqyrFoU3SQhO8WMY3pjggIl
 rAB7d3eARAoj25HJ78AYLps17w1pFar96kpjnQKEZKX34WEDWX0Y2cvLpFs9lpEwnLJyn
 4CSDPVLylD3fhm0bUtq7ha1sjXv0c8lvW+SPuN1MAKkX32ydZypRbaRQ2/UpM5nc4Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ul6HOphP3h7UxHXEGPjuuBQSSCfO0ViTpaqMkm4MzFs=;
 b=iDk+Ls2sAXMIKZZYxtofdh9S2VqAFBh4sgNtzpO/DF0q4r3zD1V4qIDbrZF+3Gmt4to1
 JlTLjLvsSK7ygfiPPIMPVopf/AZg2QYjcaVrPNd2MSwQGzpssAt1eryZs2MsARhbOmsXz
 vLIsbO462yI5pKCBtpKDasy148BzvQWApzboFXauZBFTQT/yJtp67GdXEsz13OtieU8Bt
 VzteDjUX/9+rg2JHaCK1KS39/V6XrdS/FK8gU4daTTnWWI6kL4zGNNTvrkIs3xmTPvYyM
 m3T09hWwX5/+YB4MOFkG6lvvjXsseC/S6cgCQvGZmsYG/c5SSqlc6YvDsWpfcDFsD6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D77EE60E30
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B109976B0; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6986e6d2e284604bcac43bf9dfd79f3d028ef6d
X-Git-Newrev: fbb9739dd8012bbd33098a05b6eae91ff13ce71f
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.4B109976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: show Config.in comment
 only when needed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fbb9739dd8012bbd33098a05b6eae91ff13ce71f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The comment about the toolchain requirements to have Python support in
gnuradio is always displayed, even if architecture requirements are
not met and if Python is not enabled. For the latter: the option
BR2_PACKAGE_GNURADIO_PYTHON also depends on python, so it makes sense
for the Config.in comment to also depend on it.

Fixes: 7a546b87d5b8781b03f3ba5d311d61f4169ee899 ("package/python-numpy: add reverse dependency on packages using python-numpy")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnuradio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index e87275de4d..0e8dc66dc4 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -89,6 +89,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	  Enable python component
 
 comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
