Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6D7C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1C86113E
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF1C86113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A4340154;
	Mon, 30 Aug 2021 11:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M73ze4fmNMBF; Mon, 30 Aug 2021 11:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B91414017E;
	Mon, 30 Aug 2021 11:45:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4F31BF39C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CA8D401B6
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wswQCWdxcq6G for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 11:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74564017E
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 11:45:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id l2so22508117lfp.2
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JoiqUXkAlp1sbunSGvnMnC1lzjdv2JBkO9JxcJRNNz4=;
 b=e7EZjBqhZkSYDos1Hlx91YVjA2p32rB0HYv4bpv2q6MB+mcZFLDgFW6K3c6DVOhs/O
 Vb345sstTe/3zGZRqwgMmz/Tq6SSvzIhQp7B9TzHqpD6zQDOUYwgb2k4REykBWE7SGYq
 evgGz0Yf+YsJZKMDB1QlqQpqv8uTrEhe+Wkt0GKTnWyYBJl18bhA3y4vxc7xRSfZObM1
 aZgNyoebpur9Jtlk8lggH5V8R5lVFNd4Im3aKeVhqmEom3RrsA9v5toDKmvH5BuxtmLw
 Xq3XL8Cl4R7L5QNY8A61INJv40+PfEJPPwIj09nIE4X4uuD5BfddtzhywPTDDkfKxkgm
 B1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JoiqUXkAlp1sbunSGvnMnC1lzjdv2JBkO9JxcJRNNz4=;
 b=Lop/0hX5299QrqQtVxj4jIWU0P6fAEn8l917sdJt2OhTcfJ/sBRmRM8t30ngrWUr5w
 ap3aXDN4jt9G14uQD4NtP9Mj2E1LOdodjfNXmcJPt4ncNCZ3nf4VRCzq/4Yw2Vv3svIy
 AB96c+slnio8bwEaVUH+RHnwUI9qvShr7cnC2adID2PGgcbMJd7Pp7fBMgDSidz1jPvj
 aaACH8xq27H0ICIwH9Lp5JW+9Z+rQr1hPyBFDT1dWjzX6tjWk339gROR8y6Vbysjwuzk
 Fox6hBioB3/asX+Liz9NBi7yr17EhPjE17ea+Of7eIyIKxS+xghwVlTJ238a50O5Q+OZ
 B3CQ==
X-Gm-Message-State: AOAM531P+Bmxo4vauEtBmbLPsz7ChGl2jMSqhL9lFAT7ee6w6aMca5s5
 pLEJ8SVwHCTH79LT6hUkhe02IGb8W5FKXoyt
X-Google-Smtp-Source: ABdhPJzH2pp/wwtHu50ktNbxwQnQ7NiPHWVJ+E75/zww0/1EotMlKXSTwSilWDBzVp3jpCL/49HZ9Q==
X-Received: by 2002:a19:dc09:: with SMTP id t9mr17088117lfg.593.1630323934682; 
 Mon, 30 Aug 2021 04:45:34 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id x13sm957497lfq.262.2021.08.30.04.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:45:32 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 14:45:31 +0300
Message-Id: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/refpolicy: Treat all modules as custom
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

VGhlIGN1cnJlbnQgcHJvY2Vzc2luZyBvZiB0aGUgbW9kdWxlcyBkb2Vzbid0IHdvcmsgZm9yCmN1
c3RvbSBtYWRlIHBvbGljaWVzIGFwcGVuZGVkIHRocm91Z2ggdGhlIGV4dHJhIGRpciBtZWNoYW5p
c20sCnNpbmNlIHNlZCB3b24ndCBmaW5kIGEgbWF0Y2ggZm9yIGN1c3RvbSBtb2R1bGVzLCBpdCB3
aWxsCmNvbnRpbnVlIHdpdGhvdXQgdHJpZ2dlcmluZyBhbmQgZXJyb3IuIFRoaXMgcGF0Y2ggcmVt
b3ZlcwphbGwgdGhlIG1vZHVsZXMgZnJvbSBtb2R1bGVzLmNvbmYgYW5kIGFkZCB0aGVtIG9uZSBi
eQpvbmUgdXNpbmcgUkVGUE9MSUNZX01PRFVMRVMgdmFsdWVzLgoKU2lnbmVkLW9mZi1ieTogSm9z
w6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQogcGFja2FnZS9y
ZWZwb2xpY3kvcmVmcG9saWN5Lm1rIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVmcG9saWN5L3Jl
ZnBvbGljeS5tayBiL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tawppbmRleCAwMTk0NzA4
YjM3Li4xYzBhMmMzMzg1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3ku
bWsKKysrIGIvcGFja2FnZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rCkBAIC04NSw5ICs4NSw5IEBA
IGVuZGVmCiAjIEluIHRoZSBjb250ZXh0IG9mIGEgbW9ub2xpdGhpYyBwb2xpY3kgZW5hYmxpbmcg
YSBwaWVjZSBvZiB0aGUgcG9saWN5IGFzCiAjICdiYXNlJyBvciAnbW9kdWxlJyBpcyBlcXVpdmFs
ZW50LCBzbyB3ZSBlbmFibGUgdGhlbSBhcyAnYmFzZScuCiBkZWZpbmUgUkVGUE9MSUNZX0NPTkZJ
R1VSRV9NT0RVTEVTCi0JJChTRUQpICJzLyA9IG1vZHVsZS8gPSBuby9nIiAkKEBEKS9wb2xpY3kv
bW9kdWxlcy5jb25mCisJJChTRUQpICIvID0gbW9kdWxlL2QiICQoQEQpL3BvbGljeS9tb2R1bGVz
LmNvbmYKIAkkKGZvcmVhY2ggbSwkKHNvcnQgJChSRUZQT0xJQ1lfTU9EVUxFUykpLAotCQkkKFNF
RCkgIi9eJChtKSA9L2NcJChtKSA9IGJhc2UiICQoQEQpL3BvbGljeS9tb2R1bGVzLmNvbmYKKwkJ
JChTRUQpICIvXiMgTW9kdWxlOiAkKG0pL2FcJChtKSA9IGJhc2UiICQoQEQpL3BvbGljeS9tb2R1
bGVzLmNvbmYKIAkpCiBlbmRlZgogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
