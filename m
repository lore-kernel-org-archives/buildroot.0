Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7C4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B44D60F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B44D60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B437B605D0;
	Sat, 13 Nov 2021 13:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOuAO6ZsQDS2; Sat, 13 Nov 2021 13:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7924605AD;
	Sat, 13 Nov 2021 13:28:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B19D1BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A59C80B44
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16PQ3JfzIZz4 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D2E180B33
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so20594585wrd.9
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fC1tbZ3vlJSXsm3WZonQ8oFnmNspGs68ZwwSFor+ffc=;
 b=UJxuPP7VlvDYWuPlPMqKj8shF+ca0xYv9T5PYL+dtY5BAshVRt+GzV53bFigZRnIHX
 vJ8IcG3dOIrP5rZhz/b4gBZ16zoOQo/2Q9NNE73Ic0yca8eqcE2gr/V4xuc1JRC/fvTr
 QvHUvBhKLvILqm8gau6N5nWlNDAUIYvNq2zNqSYo1QbVH68gO+R4CCNVNk474p4yrK9f
 F+K3MGOaUaG8JpyOfE+EjtTplTDoTygBqc/E0OjGwcniCkCaQYxZlHQoQOTEVOgPs9MF
 4++tHJ0CCGNk1gzEGahyqq0KF9hF6B4xdZd0S1exphYuiU6Nd1+8D4GNx5l/omBALLaJ
 uEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fC1tbZ3vlJSXsm3WZonQ8oFnmNspGs68ZwwSFor+ffc=;
 b=JUygIOVmBPFbbWQMUjyZMbZP/8HLe1PrOZZ+BxkYpQCHmziBigXdwE0E9AVmnuI7/d
 GP7VubmyFfkYxotdiSlTrTLRnfqpS6FAHH6OfkT+GQ9qbOw/y5JtxowRM3vWnglcJLc2
 9ZZnyo/VjZ6cfXSuqUl4ojESU3qpSsHCJ1yd4Xu1lFmS3iYEzjxoV4jy/vWbfp2Zd+A7
 eA8uCNq5jLcoJTwO+fRAVmydq+bTL8xYJo4fWQIdgA0GBJRIG6LrfrE8pw1CPbKXqoeG
 6pLKgAaGjVzKfwQRxDnYlwAX1PzdNkLB2p5fmVdzmQxSknKDp4+udGrY0IfNFcwBjROn
 JHIQ==
X-Gm-Message-State: AOAM532U0//Lr4a4P78a63anzCHoCMequyxiZzE1gweBE5uvoFlv4ZmD
 1ve4/VHS5Wmy6X56vHMg4Q1c+Cvpsq41wg==
X-Google-Smtp-Source: ABdhPJwoAlCZFAPjVQ49qTbhO18lYo7L4eN28NFYIBLOeQZvohBTOxQO9S24yZyefjeyxYt+8CXM9Q==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr27598313wry.142.1636810106320; 
 Sat, 13 Nov 2021 05:28:26 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id h17sm14510844wmb.44.2021.11.13.05.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:25 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:24 +0100
Message-Id: <cover.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 00/16 v2] core: add show-vars,
 a json-formatted equivalent to printvars (branch yem/show-vars)
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Herve Codina <herve.codina@bootlin.com>, eeppeliteloop@gmail.com,
 Vadim Kochan <vadim4j@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxsIQoKVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhIG5ldyB0b3AtbGV2ZWwgY29tbWFu
ZCwgc2hvdy12YXJzLCB3aGljaCBsaWtlCnByaW50dmFycywgcHJpbnRzIGFsbCB0aGUgdmFyaWFi
bGVzIG9mIEJ1aWxkcm9vdCwgYW5kIGxpa2Ugc2hvdy1pbmZvLApkb2VzIHNvIGluIGEgSlNPTi1m
b3JtYXR0ZWQgb3V0cHV0LgoKVGhlIGZpcnN0IDggcGF0Y2hlcyBhcmUgcHJlcGFyYXRvcnkgY2xl
YW51cHMgaW4gdGhlIGNvcmUgaW5mcmFzLiBUaGV5CndlcmUgcHJldmlvdXNseSBwb3N0ZWQgc2Vw
YXJhdGVseSwgYnV0IHRoZWlyIHJhaXNvbiBkJ8OqdHJlIGlzIG9ubHkKcmVhbGx5IG9idmlvdXMg
d2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoaXMgbmV3IHNob3ctdmFycy4KClRoZW4gdGhlIGZv
bGxvd2luZyA0IHBhdGNoZXMgcHJlcGFyZSB0aGUgZXhpc3Rpbmcgc2hvdy1pbmZvIGhlbHBlcnMg
Zm9yCm1vcmUgZ2VuZXJpY2l0eS4KClRoZSAzIG5leHQgcGF0Y2hlcyBhZGQgYSBmZXcgbW9yZSBp
dGVtcyB0byBzaG93LWluZm8gKEknbSBzbmVha2luZyB0aGVtCmluIHRoaXMgc2VyaWVzLCBhbSBJ
IG5vdCBkZXZpb3VzPykuIFRoZXJlIGFyZSBoaW50cyBpbiB0aGUgY29tbWl0IGxvZ3MKYWJvdXQg
c29tZXRoaW5nIHRoYXQgd2lsbCBjb21lIGluIHRoZSBmdXR1cmUsIHRoYXQgd2lsbCBtYWtlIHVz
ZSBvZgp0aG9zZSBuZXcgZmllbGRzIChhbmQgbm93IGFtIEkgbm90IHRlYXNpbmcgdG9vIG11Y2g/
KS4KCkV2ZW50dWFsbHksIHdlIGludHJvZHVjZSBzaG93LXZhcnMsIHdoaWNoIGlzIHByZXR0eSB0
cml2aWFsIGluIGFuZCBvZmYKaXRlbGYgb25jZSBhbGwgdGhlIHByZXBhcmF0b3J5IHdvcmsgaGFz
IGJlZW4gZG9uZS4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCllhbm4gRS4g
TU9SSU4gKDE2KToKICAgICAgY29yZS9zaG93LWluZm86IHJlcG9ydCBidWlsZF9kaXIgcmVsYXRp
dmUgdG8gQ09ORklHX0RJUgogICAgICBwYWNrYWdlL2tvZGktKjogcnVuIHBrZy1jb25maWcgYXQg
YnVpbGQgdGltZSwgbm90IGF0IHBhcnNlIHRpbWUKICAgICAgc3VwcG9ydC9kZXBlbmRlbmNpZXM6
IGF2b2lkIHNwdXJpb3VzIHdhcm5pbmcgb24gcHJpbnQtdmFycwogICAgICBwYWNrYWdlL2luZnJh
czogZG8gbm90IGNvbmRpdGlvbmFsbHkgc2V0IGVtcHR5IHZhcmlhYmxlcwogICAgICBwYWNrYWdl
L3BrZy1weXRob246IGRvIG5vdCBzZXQgZW1wdHkgdmFyaWFibGVzCiAgICAgIGNvcmUvcGtnLWdl
bmVyaWM6IGFsc28gbGlzdCBmaWxlcyBpbnN0YWxsZWQgaW4gaW1hZ2VzLwogICAgICBNYWtlZmls
ZTogcmVhbGx5IGNvbW1lbnQgc3ludGF4IGNvbG91cmluZwogICAgICBjb3JlL3Nob3ctaW5mbzog
J25hbWUnIG9ubHkgYXBwbGllcyB0byBwYWNrYWdlcwogICAgICBzdXBwb3J0L3V0aWxzOiBtYWtl
LWNvbW1hLWxpc3QgZG9lcyBqdXN0IHRoYXQsIG5vdCBxdW90aW5nCiAgICAgIHN1cHBvcnQvbWlz
Yy91dGlsczogaW50cm9kdWNlICQodGFiKT1cdCBhbmQgJChlc2NhcGUpPVx4MWIKICAgICAgcGFj
a2FnZS9wa2ctdXRpbHM6IGludHJvZHVjZSBoZWxwZXIgdG8gcHJvcGVybHkganNvbi1lc2NhcGUg
YSBzdHJpbmcKICAgICAgcGFja2FnZS9wa2ctdXRpbHM6IGdlbmVyYXRlIHByb3BlciBKU09OIHN0
cmluZ3Mgd2hlcmUgdGhleSBhcmUgZW1pdHRlZAogICAgICBjb3JlL3Nob3ctaW5mbzogcmVwb3J0
IHdoZXRoZXIgYSBwYWNrYWdlIGlzIG92ZXJyaWRlbgogICAgICBjb3JlL3Nob3ctaW5mbzogYWxz
byBleHBvcnQgc291cmNlIGFuZCBzdGFtcCBkaXJlY3RvcmllcyBpbiBzaG93LWluZm8KICAgICAg
Y29yZS9zaG93LWluZm86IHJlcG9ydCBwYWNrYWdlIGJ1aWxkIHN0ZXBzIGFuZCBzdGFtcCBmaWxl
cwogICAgICBNYWtlZmlsZTogaW50cm9kdWNlIHNob3ctdmFycywgYSBqc29uLWZvcm1hdHRlZCBl
cXVpdmFsZW50IHRvIHByaW50dmFycwoKIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjMgKysrKystCiAuLi4va29kaS1zY3JlZW5zYXZlci1hc3Rl
cndhdmUubWsgICAgICAgICAgICAgICAgICB8ICA0ICstCiAuLi4va29kaS1zY3JlZW5zYXZlci1j
cGJsb2JzLm1rICAgICAgICAgICAgICAgICAgICB8ICA0ICstCiAuLi4va29kaS1zY3JlZW5zYXZl
ci1tYXRyaXh0cmFpbHMubWsgICAgICAgICAgICAgICB8ICA0ICstCiBwYWNrYWdlL3BrZy1hdXRv
dG9vbHMubWsgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0IC0KIHBhY2thZ2UvcGtnLWNt
YWtlLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgLQogcGFja2FnZS9wa2ct
Z2VuZXJpYy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyOSArLS0tLS0tCiBwYWNr
YWdlL3BrZy1rY29uZmlnLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzIC0KIHBh
Y2thZ2UvcGtnLW1lc29uLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgLQog
cGFja2FnZS9wa2ctcHl0aG9uLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyAt
LQogcGFja2FnZS9wa2ctcW1ha2UubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCAtCiBwYWNrYWdlL3BrZy11dGlscy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDkwICsrKysrKysrKysrKysrKysrLS0tLS0KIHBhY2thZ2UvcGtnLXdhZi5tayAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUgLS0KIHN1cHBvcnQvZGVwZW5kZW5jaWVzL2RlcGVu
ZGVuY2llcy5tayAgICAgICAgICAgICAgIHwgIDIgKy0KIHN1cHBvcnQvbWlzYy91dGlscy5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrLQogMTUgZmlsZXMgY2hhbmdlZCwg
MTExIGluc2VydGlvbnMoKyksIDkwIGRlbGV0aW9ucygtKQoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
