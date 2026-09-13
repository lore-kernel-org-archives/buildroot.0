Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B125FC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7981F4064C;
	Sun, 13 Sep 2026 08:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEbf3Efmy29e; Sun, 13 Sep 2026 08:45:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8887E40670
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789289150;
	b=UZpCLWuh840SHNSwdkOL7nS5VVMqEEVIpExHNHQdhT02VEJgdhF20mvC8nlPeRqhwfvq
	 GOstd/qx2zrAVBnU6jsNbgImSYvrkgXrQw2pmv++HVbnxvRL5z6J7G/69ohuKWZ4v3Zsp
	 mhPKOEPTqYZqxgVClQmc8qp5G/4bxhZIUNVMPgK+iyQodL3R/Fzm37lIkmOouVM8uTVuj
	 uyl8qtw1fEfXQf9jejew4F21Dj38zo1keIebPEDK6JEOeEqzFuGKyxSckBPorVQbipvad
	 qywzZvOmNh2KIf3uSeprC8Njk8r6BWgnqZriM8MHW2DfqmHM9ewa6KHSv/LJ3bXKmvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789289150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z1L3e5qf4x0TBPFtj2R2nnmC68hAnXflN3MqbAZPUNc=;
	b=qvV29LwnR2U8ucunU9qHx3xMKptx7EGlveEeSTwpYejDeMCErCsrT36w1v4d2zEqLMJL
	 /LIceRcYXlYYpmK+2cgdRblmsd2apF/OD/e9hsmLGpK6Js9MQXOyTDQINyW217jziWHdG
	 ld/GDU3xj7OeLI1kpCRHqJfZMnvK45nFxN2MQ12HM3+U25mPQStnuKFDJ9jNX3tzi586u
	 EikHexN2/lQPdP3xZoyCJY/9vMiootXl35c2hpnwz9HcnS1QVo3AzzVUr6bDCDgNie6mL
	 4uM0pLYH1uB+q7y4gFs4DsJfQnuU3wn7zzHai1mRHvyTxuSadqUHFAeXTFjjkuYX/zg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789289150;
	bh=Z1L3e5qf4x0TBPFtj2R2nnmC68hAnXflN3MqbAZPUNc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JCPf+lc/GUl84eFoQbyS+KB1/7rc83BVHGsZiI6Qsy4xpY0tyLiPmzGdp2LaDpX5t
	 uAhI1yxu0M4JC602RgYfrAJ30rV5Nf8iD+8BEefxm4CMu7KQ5xiGZdApGCg6wRaPZo
	 K3uj8TA/Vmi/KHduI/jJ9o2tow3k1tjgET0Lrk3LAefUg9DzTY5cgRm+RLGqnIhXQr
	 C5pR3Nym43dYvtoeksylL9D21tRLZbNq3qPj/DgZY4b6Xw++wTnj03DPqs+BdoJHuQ
	 vADV0fTokEj0R+7/P3KLKdYNUjyBjuD40Dpve+cafmqlFc7A80ETnwmnHK/nNXteoM
	 St99xbekUOBTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8887E40670;
	Sun, 13 Sep 2026 08:45:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14D6923F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12B20400CD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b661HvdLjDfl for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6107F40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789289148;
 b=Sjb73n1mjGOKg3VG2uH3Iiyuteukz+VOf66U0F7fPwtrJJhKrtKzeNydtZ/bUQ9aTzE2
 5CsMZDPZPgZlaW4RVaGUUKhyxBx6SgrmUtS4dn0mI9looGH8vxpbnXNKGlPg6to09rhjV
 Y+VpieRjDI/tz/xYa0MfpewQPKXU9Dfj7DOvR1hiti75sgZmcUueX8hyZtBQ9+CwUGvt8
 9+Anop5Pc48pnw8ICUJVcKVwluGrdtNElb+T+ARMlwwTI4EMJvMQjKWAaW4LISqRUG/0x
 gLnX0/MAQD3+Ijle9QG8KRiT3WFC2Yfuxv0QZVttWRX5TSzLonUKV6PdwZrFgDRgwpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789289148;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0+MIwAiJMTB4ktYzX4YUBIwyWKhYV08Hoaejzrlw1dU=;
 b=ODwjz1JFl+fqEq6JN+dLhreFTjHK/jP1Tx/AxYHeT9PgV7WyLg7PlzX7KZbxeuIojpoA
 Y8BY8TlsWl+onbE+Ti0hIgSipZw0o52Fz29/ks3Gp/Y3dCUfG/DbQxcKqrVSxdwJbyc2/
 xE/hRr4pvUypaccCgd98nMBbfTBJ8Ph0pGeHPhqSygoStBifFjFYiXoorwL+AD+LhHiHn
 7U2YlpTC7P9zI7Ks2+pXRFhG1cD1iqHmNBs5gFzrFmsaZgmt9y/zvEHANbJ7zU+THMURy
 oXIsGyw75kHkz2sawyOurXLbwRM7Bi3vROfRxDJS6FhxCz0+JydHIJLmSMBUau5jYQg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6107F40049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B78D95B1E; Sun, 13 Sep 2026 08:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b8259bad9903af4b9de3ab8c67adacf12219818
X-Git-Newrev: 548904619c6498edc3a522d2a20dbb4179a206c0
X-Patchwork-Hint: ignore
Message-Id: <20260913084443.8B78D95B1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 add missing BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/548904619c6498edc3a522d2a20dbb4179a206c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS selects
BR2_PACKAGE_PYTHON_PROTOBUF but did not propagate
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS.

Fixes: d37766a886a8dc3d49d45e14955411700a5efd26 ("package/python-googleapis-common-protos: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
