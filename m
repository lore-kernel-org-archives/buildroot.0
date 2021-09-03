Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF83C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F2360F12
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9F2360F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E2461510;
	Fri,  3 Sep 2021 06:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AG4Eu-VhEqnu; Fri,  3 Sep 2021 06:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF4761402;
	Fri,  3 Sep 2021 06:53:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7BD1BF44C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE3661402
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHI1opTsIooO for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 06:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F2C1606BB
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 06:53:24 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z19so6545135edi.9
 for <buildroot@buildroot.org>; Thu, 02 Sep 2021 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32o1JNsduJrPieJAjjSHVJxkyXcPC7FMuhHtevFjNzo=;
 b=kRmw+SMvZ+uWhHk/K6vvZPPQ4prG01InGwKSwKPEKKLBMdN9k5nhDwRTCDGRNfUr/q
 MgIRGGTEJwKYHB0YhURa/thb7z+V79E5cw/WVdb9sVPaX4N1PsR+DwQMWHGZEm4vgaVW
 hNzAKjwmCDrAogiq9ui6afRQM6edBuALHX0cKYEa79DgWoD9VS5khEacAEpRiVuqHE6z
 x09P9xO9KlkhhBxVSYxr99FwIU+XS8xezA26jchWi4/IghtLzdG4VfrgET6Ii7kGF5K4
 PsTqgOqCW6YTaMTn63vlAApDDKgv8A8T09aLQlQYfmk1mKGSs8HH/Qe7D0Ov3q81kXHD
 BJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=32o1JNsduJrPieJAjjSHVJxkyXcPC7FMuhHtevFjNzo=;
 b=qw3LdsaR07dicUTSEGV/WviwQQ8wlRiQ6ui9RDq6cLy2J5eYpZ7mgUT5xJ5mLE8fU7
 VjJlMh0FAFb4A/lHwIrH2iVPml12ZPTODiQzcj5aq8EeW5gpU0L5bDCOt6TrvkY2/1bN
 iiB8LtpCGoQsnFjCmuDufHkYG/5HYvg75CjiLQvwZ/JLd0ZJJlUfhoGpjorQM31QiU9Y
 LqXGNCHuflpybYShDBp62zUI83G/YTYsyyZkzP+8EsbPHpcgzpHz3ZN+aLzvSOZNTpW2
 qVw/FbThhrqeSohX4QHb0Rgxo71rrtHRn1ixuwePdSeB1XoBQ+MYU1fSl70ncafDPA4L
 JZSQ==
X-Gm-Message-State: AOAM532BHahF2Nh9xI4ab2dAT5tb0qzVHSOf0mODvXNxcj8e0YAMlkSo
 C8BU3tammzslw5dPF3NAHc62azOc1NU=
X-Google-Smtp-Source: ABdhPJzW/SK3ND3bJfjmPeMVnGdobTKQNfjiF3NWSXffGZ8FixvBTO70QTn9CNpwgI9P9GO+Z9laWQ==
X-Received: by 2002:a05:6402:1cb9:: with SMTP id
 cz25mr2411195edb.11.1630652002494; 
 Thu, 02 Sep 2021 23:53:22 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 e22sm2469326edu.35.2021.09.02.23.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 23:53:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mM34j-0002dt-2h; Fri, 03 Sep 2021 08:53:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 08:53:18 +0200
Message-Id: <20210903065319.10107-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python3: security bump to version 3.9.7
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6CgotIGJwby00MjI3ODogUmVwbGFj
ZWQgdXNhZ2Ugb2YgdGVtcGZpbGUubWt0ZW1wKCkgd2l0aCBUZW1wb3JhcnlEaXJlY3RvcnkgdG8K
ICBhdm9pZCBhIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbi4KCi0gYnBvLTQxMTgwOiBBZGQgYXVk
aXRpbmcgZXZlbnRzIHRvIHRoZSBtYXJzaGFsIG1vZHVsZSwgYW5kIHN0b3AgcmFpc2luZwogIGNv
ZGUuX19pbml0X18gZXZlbnRzIGZvciBldmVyeSB1bm1hcnNoYWxsZWQgY29kZSBvYmplY3QuICBE
aXJlY3RseQogIGluc3RhbnRpYXRlZCBjb2RlIG9iamVjdHMgd2lsbCBjb250aW51ZSB0byByYWlz
ZSBhbiBldmVudCwgYW5kIGF1ZGl0IGV2ZW50CiAgaGFuZGxlcnMgc2hvdWxkIGluc3BlY3Qgb3Ig
Y29sbGVjdCB0aGUgcmF3IG1hcnNoYWwgZGF0YS4gIFRoaXMgcmVkdWNlcyBhCiAgc2lnbmlmaWNh
bnQgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQgd2hlbiBsb2FkaW5nIGZyb20gLnB5YyBmaWxlcy4KCi0g
YnBvLTQ0Mzk0OiBVcGRhdGUgdGhlIHZlbmRvcmVkIGNvcHkgb2YgbGliZXhwYXQgdG8gMi40LjEg
KGZyb20gMi4yLjgpIHRvCiAgZ2V0IHRoZSBmaXggZm9yIHRoZSBDVkUtMjAxMy0wMzQwIOKAnEJp
bGxpb24gTGF1Z2hz4oCdIHZ1bG5lcmFiaWxpdHkuICBUaGlzCiAgY29weSBpcyBtb3N0IHVzZWQg
b24gV2luZG93cyBhbmQgbWFjT1MuCgotIGJwby00MzEyNDogTWFkZSB0aGUgaW50ZXJuYWwgcHV0
Y21kIGZ1bmN0aW9uIGluIHNtdHBsaWIgc2FuaXRpemUgaW5wdXQgZm9yCiAgcHJlc2VuY2Ugb2Yg
XHIgYW5kIFxuIGNoYXJhY3RlcnMgdG8gYXZvaWQgKHVubGlrZWx5KSBjb21tYW5kIGluamVjdGlv
bi4KCmh0dHBzOi8vd3d3LnB5dGhvbi5vcmcvZG93bmxvYWRzL3JlbGVhc2UvcHl0aG9uLTM5Ny8K
ClNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KLS0t
CiBwYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5oYXNoIHwgNiArKystLS0KIHBhY2thZ2UvcHl0aG9u
My9weXRob24zLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5oYXNo
IGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMuaGFzaAppbmRleCAzNmU4OWEwNjc4Li40NDRkYmQ5
ODJhIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5oYXNoCisrKyBiL3BhY2th
Z2UvcHl0aG9uMy9weXRob24zLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6Ly93
d3cucHl0aG9uLm9yZy9kb3dubG9hZHMvcmVsZWFzZS9weXRob24tMzk2LwotbWQ1ICBlY2MyOWE3
Njg4Zjg2ZTU1MGQyOWRiYTJlZTY2Y2Y4MCAgUHl0aG9uLTMuOS42LnRhci54egorIyBGcm9tIGh0
dHBzOi8vd3d3LnB5dGhvbi5vcmcvZG93bmxvYWRzL3JlbGVhc2UvcHl0aG9uLTM5Ny8KK21kNSAg
ZmRkYjA2MGI0ODNiYzAxODUwYTNmNDEyZWVhMWQ5NTQgIFB5dGhvbi0zLjkuNy50YXIueHoKICMg
TG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICAzOTc5MjBhZjMzZWZjNWI5N2YyZTBiNTdlOTE5MjM1
MTJlZjg5ZmM1YjNjMWQyMWRiZmM4YzQ4MjhjZTAxMDhhICBQeXRob24tMy45LjYudGFyLnh6Citz
aGEyNTYgIGY4MTQ1NjE2ZTY4YzAwMDQxZDFhNjM5OWI3NjM4NzM5MDM4OGY4MzU5NTgxYWJjMjQ0
MzJiYjk2OWI1ZTNjNTcgIFB5dGhvbi0zLjkuNy50YXIueHoKIHNoYTI1NiAgNTk5ODI2ZGY5MmJm
ZGNkMjcwMmVhYzY5MTA3MjQ5OGJiMDk2YzU1YWYwNGVlOTg0Y2Y5MGY3MGVkNzdiNWE3MCAgTElD
RU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsgYi9wYWNrYWdlL3B5
dGhvbjMvcHl0aG9uMy5tawppbmRleCBkNDkxYTRjODAwLi4zZTg4YmMwZmY0IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5taworKysgYi9wYWNrYWdlL3B5dGhvbjMvcHl0aG9u
My5tawpAQCAtNSw3ICs1LDcgQEAKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKIFBZVEhPTjNf
VkVSU0lPTl9NQUpPUiA9IDMuOQotUFlUSE9OM19WRVJTSU9OID0gJChQWVRIT04zX1ZFUlNJT05f
TUFKT1IpLjYKK1BZVEhPTjNfVkVSU0lPTiA9ICQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS43CiBQ
WVRIT04zX1NPVVJDRSA9IFB5dGhvbi0kKFBZVEhPTjNfVkVSU0lPTikudGFyLnh6CiBQWVRIT04z
X1NJVEUgPSBodHRwczovL3B5dGhvbi5vcmcvZnRwL3B5dGhvbi8kKFBZVEhPTjNfVkVSU0lPTikK
IFBZVEhPTjNfTElDRU5TRSA9IFB5dGhvbi0yLjAsIG90aGVycwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
