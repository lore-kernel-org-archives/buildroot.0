Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D68FC432BE
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 09:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053C16023E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 09:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 053C16023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3CA740781;
	Thu, 19 Aug 2021 09:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uw1Rqdn-riKD; Thu, 19 Aug 2021 09:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137A840797;
	Thu, 19 Aug 2021 09:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2058F1BF328
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 09:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1069760649
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 09:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tteQ934BalD for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 09:29:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCA7A60BDF
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 09:29:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o10so11419510lfr.11
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKOg14eUTnmSdVQhlDlpMsm5Gwmt8w1g96xxhf5Bjp8=;
 b=yslGluqZ7cYMyvm+Z9ORPAYZbDBxDjbqpZl/7qKyRogAQChyczX/NacBYddIeP2moE
 CrXg5m9ejaZIW7fpoRtTb9F0ukNq0LqTwll/sCY9l0HdHA6UbzvtkZ+jVRWluNuDBaou
 BAlBNuo94aITqU/4ktxxiGas9u9jw164uetwX8RgZ14daeIIukdGSGMz/cd1G7iTjsxh
 vff081/Diif+lKCmf5a1VPlk3WPtjpYqULVo0i4wkYohlUD2NUgeCvAC0RlqJPXTwp1e
 6BA7C09ycEAJN6WzIoAW5Cc5NlrlE1lDZtXugSQ/cM93DvbDSeYs5N/In+JA9v8rxbB/
 sQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKOg14eUTnmSdVQhlDlpMsm5Gwmt8w1g96xxhf5Bjp8=;
 b=SSiq03s2uMADE/MV8LKsNb7uKjTeMnU2llmSi5oYXRhGOsRABqc1uoJZLcyUN5ocEb
 GgisRrP0CD/2q7nm+WmLUsclkHx0Az1RpxEfGMEuQwdCBoJr9KXuXztVy9mibLuEwmDr
 4/qjCjC0YbGjeaSnjqHkhS+GZvUN2sBTMfUXDub7o4CMgI7xERrxvakULvpowP6vQWIl
 1EKvFMURq6yYDqzwwXzHWPBLUrUBcaTIIWgZCZa3TJyhlF8fUr7vIwkCus1DGJtFhOc5
 D4iAHD78qVrloVCXsvBE53H6rqBvD42duKqpeaQ2LyVtI5u4Si8OztDxkFIWSxxjdw1p
 patQ==
X-Gm-Message-State: AOAM5319qaJhldOTJYvdJWIe8xAKJ0XMkX9kdgTBeAfUfYsf69zAefaY
 YlPDR6GOJQrAi5s9CQaMLW4wToUQZT78kVlS
X-Google-Smtp-Source: ABdhPJy2misL1IAMPtu9582wtjNwaBYarZN1UzdH2BOxKALRc4vx38wQMsNTBA4rgZji1OUtYo1OvA==
X-Received: by 2002:ac2:4e45:: with SMTP id f5mr5895960lfr.628.1629365346062; 
 Thu, 19 Aug 2021 02:29:06 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id z7sm214872ljh.59.2021.08.19.02.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:29:05 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 12:29:04 +0300
Message-Id: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libselinux: Add autorelabel for
 first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Q3VycmVudGx5IGJ1aWxkcm9vdCBzaGlwIGxpYnNlbGludXggd2l0aG91dCB0cmlnZ2VyaW5nCnRo
aXMgb3B0aW9uLCB3aGljaCBvZnRlbiBzaG93cyBpbmNvbnNpc3RlbmNpZXMgYmV0d2Vlbgp3aGF0
IHRoZSByZWZwb2xpY3kgZGVmaW5lcyBhcyBhIGxhYmVsIGZvciBhIGZpbGUgYW5kCndoYXQgdGhl
IGFjdHVhbCBmaWxlIGhhcy4gVHJpZ2dlcmluZyBhbiBpbml0aWFsIHJlbGFiZWwKd291bGQgaGVs
cCBhY3RpdmF0aW5nIGVuZm9yY2luZyBzdGF0ZSByaWdodCBhd2F5IHdpdGhvdXQKcmVxdWlyaW5n
IHRvIGVudGVyIGl0IG9uY2UgaW4gcGVybWlzc2l2ZSBhbmQgdHdlYWsgdGhlCmxhYmVscy4KClNp
Z25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29t
PgotLS0KWyB2MSAtPiB2MiBdIEZpeCBpZiBzdGF0ZW1lbnQgaW4gbGlic2VsaW51eCByZWNpcGUK
CiBwYWNrYWdlL2xpYnNlbGludXgvQ29uZmlnLmluICAgICB8IDcgKysrKysrKwogcGFja2FnZS9s
aWJzZWxpbnV4L2xpYnNlbGludXgubWsgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzZWxpbnV4L0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvbGlic2VsaW51eC9Db25maWcuaW4KaW5kZXggNjIwNzBjOGQ1OS4uZGY4YmQ3ZmZkMCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9saWJzZWxpbnV4L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xp
YnNlbGludXgvQ29uZmlnLmluCkBAIC0xOCwzICsxOCwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
TElCU0VMSU5VWAogCiBjb21tZW50ICJsaWJzZWxpbnV4IG5lZWRzIGEgdG9vbGNoYWluIHcvIHRo
cmVhZHMsIGR5bmFtaWMgbGlicmFyeSIKIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTIHx8IEJSMl9TVEFUSUNfTElCUworCitjb25maWcgQlIyX1BBQ0tBR0VfTElCU0VMSU5V
WF9BVVRPUkVMQUJFTAorCWJvb2wKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQlNFTElOVVgK
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0ZJTkRVVElMUworCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfR1JFUAorCWRlZmF1bHQgeQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzZWxpbnV4L2xpYnNl
bGludXgubWsgYi9wYWNrYWdlL2xpYnNlbGludXgvbGlic2VsaW51eC5tawppbmRleCBmZGQxM2Fh
OTQyLi5hZGY0YjNkNmY2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnNlbGludXgvbGlic2VsaW51
eC5taworKysgYi9wYWNrYWdlL2xpYnNlbGludXgvbGlic2VsaW51eC5tawpAQCAtNzEsNiArNzEs
OSBAQCBkZWZpbmUgTElCU0VMSU5VWF9JTlNUQUxMX1RBUkdFVF9DTURTCiAJJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgLUMgJChARCkgXAogCQkkKExJQlNFTElOVVhfTUFLRV9PUFRTKSBERVNU
RElSPSQoVEFSR0VUX0RJUikgXAogCQkkKExJQlNFTElOVVhfTUFLRV9JTlNUQUxMX1RBUkdFVFMp
CisJJChpZiAkKEJSMl9QQUNLQUdFX0xJQlNFTElOVVhfQVVUT1JFTEFCRUwpLAorCQllY2hvICIt
RiIgPiAkKFRBUkdFVF9ESVIpLy5hdXRvcmVsYWJlbAorCQlta2RpciAkKFRBUkdFVF9ESVIpL3Zh
ci9saWIvc2VsaW51eCkKIAlpZiAhIGdyZXAgLXEgInNlbGludXhmcyIgJChUQVJHRVRfRElSKS9l
dGMvZnN0YWI7IHRoZW4gXAogCQllY2hvICJub25lIC9zeXMvZnMvc2VsaW51eCBzZWxpbnV4ZnMg
bm9hdXRvIDAgMCIgPj4gJChUQVJHRVRfRElSKS9ldGMvZnN0YWIgOyBmaQogZW5kZWYKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1
c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
