Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38532C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 07:58:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7FA961131
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 07:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7FA961131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6F140770;
	Thu, 19 Aug 2021 07:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nc-dtI6pi6B9; Thu, 19 Aug 2021 07:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25F840781;
	Thu, 19 Aug 2021 07:58:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1CD1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 07:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18EAA40160
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 07:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3n3vHJu1Nbd for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 07:58:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92F5C400AE
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 07:58:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id w20so10901216lfu.7
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vNTzMl/y/JGurQq4pQCAmrnMqS81ky0qkdmyED6Tzrw=;
 b=HBBwx7/ruJ4Yg1befneUWN1MZu/iE94dZKpadJmTnMDkrW/vnLe6m8xHthgYHioauY
 rD2Uxxv+fBXf0+pWHmc/easworBnK0CBVjJ/dhLU66yeKeKYMG/dyc7t5O5olt6f+oHj
 Na6Md5HBwzPO8Eu5345SEg8Pzsn6UyNsdnZ9C8E/HJSCqOsSYa0p6apAnPUAk+yeTsCg
 JJzu964uw4wBBMqc3YLKcG0kPYcI/weenIQffIEG4L68VUX0qi00aNc2J4gDZRML5Tmw
 aeoPoIdpst44o5bsNGovMuvfxszxiPRBIGmBm1x06oElvO9Ncw4AZ8cSWidtRflSYxaM
 I9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vNTzMl/y/JGurQq4pQCAmrnMqS81ky0qkdmyED6Tzrw=;
 b=CRv9nGFcf9nQqTLGrEznROuhMfMyallpOsvzX/kux8svhJxsb9Zyv5DtiHnsijzg4w
 DYwcRF2fNIj2woAZmhCBne6XUjnOSs/XiRG//YyrnYv4p9gSV+gEU/nFYOMWmFv0wiFc
 FbW6MUp1tKBMeI5zYu97cw2UtMR8NuAViuUSBTDYcJWF3IQKl2s/HpGsPP47mk+ZoXoe
 Tha9q6PYj2kIWPMnByW9SNMP+v3WkowN8il0RPFb4he/Tbh23RuFIpD3kizxB0QZ/5Hl
 qQtD3aj7mcGXVP2rgSdJJqibj93Qmlym1bXjZ7cYZjkxfQP1dpMYdn2XLdTrY/p7W3px
 /kEw==
X-Gm-Message-State: AOAM531kmC2CqInNCeXd8rw/2IM1bSCD5hWwqjIwEu5yF3b/uCzl1JX6
 9V61PtnqDMQiJL3XPsP+CQGncQJD5Z531G1a
X-Google-Smtp-Source: ABdhPJzR9ynhobtOjDMmhzVlVZC2z0T2epAJ17T6yo5dTNm+J4TKuSGF88mTTlrt0aoW3K42eHDyvw==
X-Received: by 2002:a19:430a:: with SMTP id q10mr9778515lfa.378.1629359880413; 
 Thu, 19 Aug 2021 00:58:00 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id h8sm217694ljh.27.2021.08.19.00.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 00:58:00 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 10:57:58 +0300
Message-Id: <20210819075758.286416-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/policycoreutils: Install scripts folder
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

VGhpcyBmb2xkZXIgaW5jbHVkZXMgdGhlIGZpeGZpbGVzIHNjcmlwdCB0aGF0IGlzIHVzZWQKYnkg
c2VsaW51eCBhdXRvcmVsYWJlbCBmZWF0dXJlLiBDdXJyZW50bHkgaXQgaW5zdGFsbHMKaXQgdW5k
ZXIgL3Vzci9zYmluLgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtr
YXJpbmVuQHVuaWtpZS5jb20+Ci0tLQogcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29y
ZXV0aWxzLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0
aWxzLm1rIGIvcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0aWxzLm1rCmluZGV4
IDBkZmRjN2FmMDMuLjUyOTBjNWI5ZjggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcG9saWN5Y29yZXV0
aWxzL3BvbGljeWNvcmV1dGlscy5taworKysgYi9wYWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xp
Y3ljb3JldXRpbHMubWsKQEAgLTQzLDcgKzQzLDcgQEAgUE9MSUNZQ09SRVVUSUxTX01BS0VfT1BU
UyArPSBcCiBQT0xJQ1lDT1JFVVRJTFNfTUFLRV9ESVJTID0gXAogCWxvYWRfcG9saWN5IG5ld3Jv
bGUgcnVuX2luaXQgXAogCXNlY29uIHNlbW9kdWxlIHNlc3RhdHVzIHNldGZpbGVzIFwKLQlzZXRz
ZWJvb2wKKwlzZXRzZWJvb2wgc2NyaXB0cwogCiAjIFdlIG5lZWQgdG8gcGFzcyBERVNURElSIGF0
IGJ1aWxkIHRpbWUgYmVjYXVzZSBpdCdzIHVzZWQgYnkKICMgcG9saWN5Y29yZXV0aWxzIGJ1aWxk
IHN5c3RlbSB0byBmaW5kIGhlYWRlcnMgYW5kIGxpYnJhcmllcy4KLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
