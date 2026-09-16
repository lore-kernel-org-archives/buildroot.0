Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A9AC982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 042C040CA5;
	Fri, 18 Sep 2026 13:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91A3Bzro4UJU; Fri, 18 Sep 2026 13:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A24A40CA4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736837;
	b=DPBvXVqhCBzqlF0jPqRNdLmfzmjjDH1Jwv08dEuWJw51YX/q6IxISQ//ZAcR8pkZY8z+
	 Ea9vZaYXSIEfz9JDNjRAyAlaxCu+M56SusppeecAMeevnxqg0osKf8hOmRqoyALGaEILV
	 xa4wnMxV/Ku9Nr2KX7QMMNf82M28iscIdfz9HbCwWS8LLu7ZRRMOeJyaErqpNCkj/X9Nr
	 0LvYYAI/JMxH1SsgnE9XAlgcKwG8GtkNCgaE8Q5ZwKwfoniln7ykdla1h9Br6GmhHUoaa
	 ykmti9Go+m5eZWN1yRKQcqltwTwyd15GekUox2SvdkaiO8ZwF/M2QvZCZCh3IObqpZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=meyLPFcFW/mBc/xiv/6/fYbmCMFi2gnKHgm33ToFXqk=;
	b=dXUKLTaSrZFTLhH9/lN8jtVQvTz3cw1JCXHpzAzPhzzb/4FFKDYqfnsDSU+pI4hFLAf5
	 z19k4Ninqr3B0bV9uVQNwld9kSCAGTo7iB20sUypHUnDr9MO6EsWC5aFapItQLVsZvRxp
	 gmzEZWXU8y5dRSw1xnuDCdIAF7+uKtHzdDsXL/Cu7ON7ZSQ/0G+7iyrzMSoeKiYHs+eoL
	 g8UCGRWZcfNvF3NukyaAN0MSt7DKeOoK+/zbZR7k9FBpcjcmO+D0rJs98QLOOAUEolZLT
	 I66agekQNnvQd1C4MOuw5fOsMd1EmzwiW1YuYaE8tr/6SWKKwpplZIEIOikrMD8DkOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736837;
	bh=meyLPFcFW/mBc/xiv/6/fYbmCMFi2gnKHgm33ToFXqk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=beO2IAC5f0wvkSiF1P1lfpIxXqZWV0/7poHOXYJoaY2dK1mfsW3WviQSVVDMOTBsX
	 WcgGIL2cuiET+d7VZBKmuY8+CSECGFsqoL4tswnauwqltvEgSiZXaGUtGDxvhGGf3m
	 p2AL4C9BGVeI7j5mvh6sOIYcNHYB5B2Cl1IKzGV5cA109fKem1bJUbj97e44UW4uZK
	 idqCtejjIzVLBaaBNguSd+OYPU0a1UiZJc1RR8i73m2L5vQofzATB0KEBkacjn7WkZ
	 DbUn0tBC2qBdzQ4ZpQyxyAOGexm9XsjfkhPL3eFUNcl7yKoH9PsxW6fW9wq12YGoet
	 NOqxcSg88veXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A24A40CA4;
	Fri, 18 Sep 2026 13:07:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE960B0C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C39D340B79
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jOlWO-EWGyX for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 173C140BEA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=CRp7LJ/2QRO38DTX5HS7lD3fpko1WPeU4dsigN3EJ2TXiDF1IziEtiE2rM1ATugXoUfX
 z29G597iMZWnv+JrEikji5ma08CbwHBIx8liOXUMMK0fv45w7ugVhR4qYHxzdd8fhEMp3
 Za9LUb44r6jf2aZJb9iureKHMIMg/dXfvuIhg+w567kutnpzDqGRuu9eGAUS51Gu6I4Ja
 G10BYcJNTIgv5Xo5OaZYotoxdq94Gmso9+QtmbS+V9B1+UQK6SzZiOXM6IE8H56Rl4UxK
 uzG3+k3uSzE3ixUJcTVFZF5nkgDaBwtE3kKz5to+QZHtI62cpD+XPYqjw+1TUEzlcyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yXmLS/fI2OXmqBsKfK+lUDLE+RqcT6r1Ca/gUN4geNE=;
 b=KlBCgTYj9eHnoLchvKNlsWgSHmlDoxn9P8OAGHyJS4Bq0cNMW8ymSXL5J+f62I1CpEHX
 0rbStS254/nP8DJWbEcAvBUDYCdllmIv4imx1ZVuLXb52YturL4fZbLXlz9HiXuxjsed9
 kWQtPnAgsF61uRkmxhz4f6ZSTC1xSYOYNxkCf6aVVxukcWWDHgxkRDNTJOlghnKqtVwQ1
 5rkxeAHtHWHs/tuDXVay5EmvwQBfA5VgjHG2NTcf52FKisNCjBga2DZviCHn77F89K2/T
 C4j4sFJpK2G882WoXu0E4AOldL0IMb8Q5Lamfm7Twu/tRYUgdjK9Y5/nby4cIBy4UAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 173C140BEA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C484D97698; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:57:56 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2802566302db6c759c3e7a1b78472fa5fcc7cd57
X-Git-Newrev: c27bc6f3d049728d646957ecb31289491d925735
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.C484D97698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-googleapis-common-protos: add missing
 BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c27bc6f3d049728d646957ecb31289491d925735
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS selects
BR2_PACKAGE_PYTHON_PROTOBUF but did not propagate
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS.

Fixes: d37766a886a8dc3d49d45e14955411700a5efd26 ("package/python-googleapis-common-protos: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 548904619c6498edc3a522d2a20dbb4179a206c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-googleapis-common-protos/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-googleapis-common-protos/Config.in b/package/python-googleapis-common-protos/Config.in
index 8f487f5ee6..541cb5bee2 100644
--- a/package/python-googleapis-common-protos/Config.in
+++ b/package/python-googleapis-common-protos/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS
 	bool "python-googleapis-common-protos"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  Common protobufs used in Google APIs.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
