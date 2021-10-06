Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8176C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A279611C6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A279611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA8183F4F;
	Wed,  6 Oct 2021 06:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5L6tWI5VN6h; Wed,  6 Oct 2021 06:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CEB583E30;
	Wed,  6 Oct 2021 06:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47EFE1BF25F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3658960E61
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nYyjEoINmBy for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:20:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56B3E60E5F
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:20:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y26so5720089lfa.11
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjfFYyYB1CGS2r/Szr7sUNdTriPyxuqoFWbqer/Q9C8=;
 b=u2RX2xhnmmjKSDP7eSA37wzB3zshXQDsK2oVEJtA93XAS2onUNEDdWIMRGmHpQ+U03
 U6X/+L020AT4Qt9PO33TN55jm8CAA0DrsSGfee7QMI4BoJgpYz2YxJwTpj9Iea+mrb5l
 9pahA0elMG6lNdoCWSNf7OrmYdcXTzc4V+o6JW2n7YL3xEs+6MgOYXmlgEjoxkbcthWi
 8ZycEsJ0lt+j3SVmAXbZ/OLegTWO/uZFvpn15MZfJoauc2s0OMh5UDYEu+SBOs+iKArw
 xCfOaidEOHRQ1y2QpBUlNgy4e9yoZJzopb6HdIeSRgU7FQHdUn+JeIF74HqYvsZc9MW1
 7kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjfFYyYB1CGS2r/Szr7sUNdTriPyxuqoFWbqer/Q9C8=;
 b=I63CTUmnbNCyC8g4bkVscb9/GOjiNoW5+YvNqscW5yRRQsvnsfZDXKb/8bqqMF7c2I
 aG95Vp7PjUoT5D4suIBitlWbrKQIVoHC7tFXGIUyqCzw18pXypjIXgso+zf+dKoOhDpl
 OcQqaekiTYKEyV04THmp8Oqj537QtVlJXODgVByhOl6wV/1uME8lDs+G2U/bcBxDoBD+
 XSuLoeGJcTifYbsNyGjZmaqv18YYCfeEPy9RT5RFoomHk3XMtPj/HGb3dcP8K9IrvUTi
 d6+bS3QZwO0eobNU+W0jk8xtTKteubRs4Vt7EOySKbs9EOm2ze0rbU2k4GwZtit37sk0
 H5zA==
X-Gm-Message-State: AOAM532H3p+1+6bNv53RJKfKNM9oi3MvwbdMNrsvEFPxA7nd23/e7pL0
 ze/ZGV4CT62Wp6a2CgLOEzqUfIqNiENfIrHF
X-Google-Smtp-Source: ABdhPJybeOzTlouKZPN8ls0mjbfsB9lo2M4NosMSsTwPjZsPRwZrrkoiX+2qdkIpx8E/gZj2OLvtFg==
X-Received: by 2002:a05:6512:3d26:: with SMTP id
 d38mr7712916lfv.474.1633501233244; 
 Tue, 05 Oct 2021 23:20:33 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id w11sm1477352lji.108.2021.10.05.23.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 23:20:32 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 09:20:31 +0300
Message-Id: <20211006062032.4120-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iptables: S35iptables script cleanups
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCByZW1vdmVzIHVubmVlZGVkIHJlZGlyZWN0aW9ucyB3aGVuCmNhbGxpbmcgaXB0
YWJsZXMtcmVzdG9yZSBhbmQgaXB0YWJsZXMtc2F2ZSwgYW5kCml0IGFkZHMgdGhlIHNhdmUgb3Bl
cmF0aW9uIHRvIHRoZSB1c2FnZSBoZWxwLgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5l
biA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQogcGFja2FnZS9pcHRhYmxlcy9TMzVp
cHRhYmxlcyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMgYi9w
YWNrYWdlL2lwdGFibGVzL1MzNWlwdGFibGVzCmluZGV4IGZmM2Y1MWEyYmEuLmEyZGUyOWQyMjIg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaXB0YWJsZXMvUzM1aXB0YWJsZXMKKysrIGIvcGFja2FnZS9p
cHRhYmxlcy9TMzVpcHRhYmxlcwpAQCAtNiw3ICs2LDcgQEAgSVBUQUJMRVNfQVJHUz0iIgogCiBz
dGFydCgpIHsKIAlwcmludGYgJ1N0YXJ0aW5nICVzOiAnICIkREFFTU9OIgotCWlwdGFibGVzLXJl
c3RvcmUgPCAvZXRjL2lwdGFibGVzLmNvbmYKKwlpcHRhYmxlcy1yZXN0b3JlIC9ldGMvaXB0YWJs
ZXMuY29uZgogCXN0YXR1cz0kPwogCWlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KIAkJZWNo
byAiT0siCkBAIC0zNiw3ICszNiw3IEBAIHJlc3RhcnQoKSB7CiAKIHNhdmUoKSB7CiAJcHJpbnRm
ICdTYXZpbmcgJXM6ICcgIiREQUVNT04iCi0JaXB0YWJsZXMtc2F2ZSA+IC9ldGMvaXB0YWJsZXMu
Y29uZgorCWlwdGFibGVzLXNhdmUgLWYgL2V0Yy9pcHRhYmxlcy5jb25mCiAJc3RhdHVzPSQ/CiAJ
aWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsgdGhlbgogCQllY2hvICJPSyIKQEAgLTUzLDYgKzUzLDYg
QEAgY2FzZSAiJDEiIGluCiAJCSMgUmVzdGFydCwgc2luY2UgdGhlcmUgaXMgbm8gdHJ1ZSAicmVs
b2FkIiBmZWF0dXJlLgogCQlyZXN0YXJ0OzsKIAkqKQotCQllY2hvICJVc2FnZTogJDAge3N0YXJ0
fHN0b3B8cmVzdGFydHxyZWxvYWR9IgorCQllY2hvICJVc2FnZTogJDAge3N0YXJ0fHN0b3B8cmVz
dGFydHxzYXZlfHJlbG9hZH0iCiAJCWV4aXQgMQogZXNhYwotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
