Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1,
	WEIRD_PORT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A5AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 16:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A0160FA0
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 16:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A0160FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADD0940210;
	Sun, 19 Sep 2021 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBU_CP_xCSpL; Sun, 19 Sep 2021 16:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBEDB401D1;
	Sun, 19 Sep 2021 16:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7D861BF23F
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 16:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7AA980EE9
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 16:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNMMz1mhuYWM for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 16:59:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5979280E45
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 16:59:22 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:3cdc:b696:5c56:e28c] (unknown
 [IPv6:2a01:e0a:947:6e20:3cdc:b696:5c56:e28c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 1BFA2C02CB
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 18:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1632070759;
 bh=WeK6JytVN18cF8sm+xfF5+pES4CTJhbRGu1OYu6vk90=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jW2j3ZKMniacpKlDJUWskP0XwBuhefOz2aJ174WHYn5A92SyV23fl93m9hWQCNXT6
 jBzITGdsIROJz8smPDErq/VQg/KUxTwuG1YhgN8TClRnGGYoIDI+POkmXAIaakU/yX
 9pkRJXLpqE16KHwIe8/t2QkraQLMUlQiJvHlGxI48I+dC0t2rIFmKApzmhgy9Wj/c/
 cd7ECyt2KjKHWAuRH+Bmj2GI0SKXT3zsT/fdg16fVYF9f3PwzjOnHkxVpr/e5CSGX0
 IHJtl/Y0HQ08H4GWjBgGqh7qq3PAtfKve35UcuCjjtDKQztN/N9oqsGRa1Lz18NLrA
 emYRVTVSwy1kQ==
To: buildroot@buildroot.org
References: <20210919141053.3afc7389@windsurf>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
Date: Sun, 19 Sep 2021 18:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919141053.3afc7389@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8hCgpUaG9tYXMgUGV0YXp6b25pIHdyb3RlIGFib3V0IHN1cHBvcnQvdGVzdGluZy9pbmZy
YS9lbXVsYXRvci5weToKPiB0aGUgY29tbWFuZCBbLi4uXSBnZXRzIHdyYXBwZWQgb24gdHdvIGxp
bmVzLCBsaWtlIHRoaXM6Cj4KPiAjIGN1cmwgLXMgLW8gL2Rldi9udWxsIC13ICIle2h0dHBfY29k
ZX1cbiIgLVggUE9TVCAtSCAiQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbgo+IC9qc29uIiAtZCAn
eyJlbWFpbCI6ICJ0ZXN0IiwgIm5hbWUiOiAidGVzdCJ9JyBodHRwOi8vMTI3LjAuMC4xOjUwMDAK
CklzIGl0IGp1c3QgYSBjb2luY2lkZW5jZSB0aGF0IHRoZSBsaW5lIGdvdCB3cmFwcGVkIGF0IGV4
YWN0bHkKODDCoGNvbHVtbnMsIG9yIGlzIGl0IGFsd2F5cyBhdCB0aGlzIHdpZHRoPyA4MMKgY29s
dW1ucyBpcyB0aGUgd2lkdGggb2YgYQp0cmFkaXRpb25hbCBJQk0gcHVuY2hlZCBjYXJkLCBhIFZU
MTAwIHRlcm1pbmFsLCBhbmQgbGlrZWx5IHRoZSBkZWZhdWx0CmZvciBhIHBzZXVkby10ZXJtaW5h
bC4gRG9lcyB0aGUgYmVoYXZpb3IgY2hhbmdlIGlmIHRoZSB3aWR0aCBvZiB0aGUKcHNldWRvLXRl
cm1pbmFsICgiZGltZW5zaW9ucyIgYXR0cmlidXRlIG9mIHNwYXduKCkpIGlzIGNoYW5nZWQ/CgpS
ZWdhcmRzLAoKRWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
