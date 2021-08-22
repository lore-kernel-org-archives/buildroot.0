Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4346DC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060C26126A
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 060C26126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D0580D45;
	Sun, 22 Aug 2021 18:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMXHTtZxsfWl; Sun, 22 Aug 2021 18:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6004680D50;
	Sun, 22 Aug 2021 18:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 388CA1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2761940295
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgB4p1ayvX_m for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 18:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D398401EE
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 18:53:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso12517419wmc.5
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkBFIxMPiq9Zn5b8KYhPr400mG6fJBO+vniFQ+JG71o=;
 b=nQAU7Hc5UHaUaTFhUJUZ6RmmdhmSeEn7ZW2jEcs0TCtdMPZJ2v1KnPNAWscikx94+v
 Dq0JdKDyLgg+88fILn1QfxTxf9/bbgNh71ok2XfFkmLdZKTjc88wfFGwHS/2zc0HdCg/
 /juqqGvUmNvMF7v5XaEXXnrPi7EpgwIus+b/0H2hiKD4AmMfIIJrIsqCyoX5+uVkO3p4
 RK31W9N/+s414h9daMDa2JYTAnWcXjahRcwokYsq9l68RfX6RE3aBnkmka5y4CT9SoTd
 /6SwrPXU6B4NEzWQT1d5rv+vmHjXcjPFDGT25cb6jtJxdPmNe2PV5a7nMe3X+VkM+mG6
 4nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkBFIxMPiq9Zn5b8KYhPr400mG6fJBO+vniFQ+JG71o=;
 b=eGdWcCG36cPsbZEnwqpLTFD2MNyyzZxIuZ/BKdbKhZPR3B4eudo70AWBcgyJYnrRPN
 ZKcamLd7W+DrvQcAzvsAmvuSdY7svLNt2jGrpSH2KctljbVw80WgY0VAK8ebYbUSV5hL
 3oD+jIWe2H7WiYLdoY/Xdk1J33YPGEe3NZGZekXPdgNZuj9iepQTSxjyZnwZ3mVtyHlq
 C7bbC42elyTMH6YlTlHDvH2knBhXeLLk5idBXPv5tUJJUdcnB1y3ah9Dbay/KmCiCOQT
 Ab/FwF3AszL9vS1R0VxvcymApsrUXxc2KFYN7mjFDLHz7HfwdPnaB2/mNTm4UGG47REK
 oTFg==
X-Gm-Message-State: AOAM5307PYpBe0vFei9fAplWsywXPv+RNW4yRzgGDWFOaCc+VctgQ5Df
 rr5iveGyoPWNERFLRJp+JoG4fcaUvrk=
X-Google-Smtp-Source: ABdhPJzIDgPZhWFaDlfWPsQwNnqNKzDwS8HthurfGuvQ2iwFK69j60zPGKacDy7UXy0lBUEW0m4Ufg==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr2607654wmi.147.1629658395646; 
 Sun, 22 Aug 2021 11:53:15 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id q22sm16174970wmj.32.2021.08.22.11.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 11:53:15 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 20:53:09 +0200
Message-Id: <20210822185309.2914068-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822185309.2914068-1-romain.naour@gmail.com>
References: <20210822185309.2914068-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python{3}-requests: allow idna 3.x
 to be installed on python 3.x
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhlIHRlc3RzLnBhY2thZ2UudGVzdF9kb2NrZXJfY29tcG9zZS5UZXN0RG9ja2VyQ29tcG9zZSBp
cyBicm9rZW4Kc2luY2UgdGhlIHB5dGhvbi1pZG5hIHZlcnNpb24gYnVtcCB0byAzLjAgYmVjYXVz
ZSBweXRob24tcmVxdWVzdHMgbmVlZHMKcHl0aG9uLWlkbmEgPCAzLjAuCgogIyBkb2NrZXItY29t
cG9zZSB1cCAtZAogVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgogICBGaWxlICIv
dXNyL2xpYi9weXRob24zLjkvc2l0ZS1wYWNrYWdlcy9wa2dfcmVzb3VyY2VzL19faW5pdF9fLnB5
IiwgbGluZSA1ODMsIGluIF9idWlsZF9tYXN0ZXIKICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy45
L3NpdGUtcGFja2FnZXMvcGtnX3Jlc291cmNlcy9fX2luaXRfXy5weSIsIGxpbmUgOTAwLCBpbiBy
ZXF1aXJlCiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuOS9zaXRlLXBhY2thZ2VzL3BrZ19yZXNv
dXJjZXMvX19pbml0X18ucHkiLCBsaW5lIDc5MSwgaW4gcmVzb2x2ZQogcGtnX3Jlc291cmNlcy5D
b250ZXh0dWFsVmVyc2lvbkNvbmZsaWN0OiAoaWRuYSAzLjIgKC91c3IvbGliL3B5dGhvbjMuOS9z
aXRlLXBhY2thZ2VzKSwgUmVxdWlyZW1lbnQucGFyc2UoJ2lkbmE8Myw+PTIuNScpLCB7J3JlcXVl
c3RzJ30pCgogRHVyaW5nIGhhbmRsaW5nIG9mIHRoZSBhYm92ZSBleGNlcHRpb24sIGFub3RoZXIg
ZXhjZXB0aW9uIG9jY3VycmVkOgoKIFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToK
ICAgRmlsZSAiL3Vzci9iaW4vZG9ja2VyLWNvbXBvc2UiLCBsaW5lIDYsIGluIDxtb2R1bGU+CiAg
ICAgZnJvbSBwa2dfcmVzb3VyY2VzIGltcG9ydCBsb2FkX2VudHJ5X3BvaW50CiAgIEZpbGUgIi91
c3IvbGliL3B5dGhvbjMuOS9zaXRlLXBhY2thZ2VzL3BrZ19yZXNvdXJjZXMvX19pbml0X18ucHki
LCBsaW5lIDMyNTIsIGluIDxtb2R1bGU+CiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuOS9zaXRl
LXBhY2thZ2VzL3BrZ19yZXNvdXJjZXMvX19pbml0X18ucHkiLCBsaW5lIDMyMzUsIGluIF9jYWxs
X2FzaWRlCiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuOS9zaXRlLXBhY2thZ2VzL3BrZ19yZXNv
dXJjZXMvX19pbml0X18ucHkiLCBsaW5lIDMyNjQsIGluIF9pbml0aWFsaXplX21hc3Rlcl93b3Jr
aW5nX3NldAogICBGaWxlICIvdXNyL2xpYi9weXRob24zLjkvc2l0ZS1wYWNrYWdlcy9wa2dfcmVz
b3VyY2VzL19faW5pdF9fLnB5IiwgbGluZSA1ODUsIGluIF9idWlsZF9tYXN0ZXIKICAgRmlsZSAi
L3Vzci9saWIvcHl0aG9uMy45L3NpdGUtcGFja2FnZXMvcGtnX3Jlc291cmNlcy9fX2luaXRfXy5w
eSIsIGxpbmUgNTk4LCBpbiBfYnVpbGRfZnJvbV9yZXF1aXJlbWVudHMKICAgRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy45L3NpdGUtcGFja2FnZXMvcGtnX3Jlc291cmNlcy9fX2luaXRfXy5weSIsIGxp
bmUgNzg2LCBpbiByZXNvbHZlCiBwa2dfcmVzb3VyY2VzLkRpc3RyaWJ1dGlvbk5vdEZvdW5kOiBU
aGUgJ2lkbmE8Myw+PTIuNScgZGlzdHJpYnV0aW9uIHdhcyBub3QgZm91bmQgYW5kIGlzIHJlcXVp
cmVkIGJ5IHJlcXVlc3RzCgpGaXhlczoKaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJv
b3QvLS9qb2JzLzE1MjI4NDgzMjcKClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQGdtYWlsLmNvbT4KLS0tCiAuLi5uYS0zLngtdG8tYmUtaW5zdGFsbGVkLW9uLVB5dGhv
bi0zLngucGF0Y2ggfCAzMyArKysrKysrKysrKysrKysrKysrCiAuLi5uYS0zLngtdG8tYmUtaW5z
dGFsbGVkLW9uLVB5dGhvbi0zLngucGF0Y2ggfCAzMyArKysrKysrKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1yZXF1ZXN0cy8wMDAxLUFsbG93LWlkbmEtMy54LXRvLWJlLWluc3RhbGxlZC1vbi1Q
eXRob24tMy54LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24zLXJlcXVl
c3RzLzAwMDEtQWxsb3ctaWRuYS0zLngtdG8tYmUtaW5zdGFsbGVkLW9uLVB5dGhvbi0zLngucGF0
Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1yZXF1ZXN0cy8wMDAxLUFsbG93LWlkbmEt
My54LXRvLWJlLWluc3RhbGxlZC1vbi1QeXRob24tMy54LnBhdGNoIGIvcGFja2FnZS9weXRob24t
cmVxdWVzdHMvMDAwMS1BbGxvdy1pZG5hLTMueC10by1iZS1pbnN0YWxsZWQtb24tUHl0aG9uLTMu
eC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lYTlhZDE1ZGYy
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tcmVxdWVzdHMvMDAwMS1BbGxvdy1p
ZG5hLTMueC10by1iZS1pbnN0YWxsZWQtb24tUHl0aG9uLTMueC5wYXRjaApAQCAtMCwwICsxLDMz
IEBACitGcm9tIGQ3NDdjNDc1MzQ4NGFhOWI5MGEwOTRkNmJmN2VjNDVlNWFjZmI2MjMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBOYW9yIExpdm5lIDxuYW9ybGl2bmVAZ21haWwuY29t
PgorRGF0ZTogV2VkLCA3IEp1bCAyMDIxIDE2OjI1OjIwICswMzAwCitTdWJqZWN0OiBbUEFUQ0hd
IEFsbG93IGlkbmEgMy54IHRvIGJlIGluc3RhbGxlZCBvbiBQeXRob24gMy54CitNSU1FLVZlcnNp
b246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0NvLWF1dGhvcmVkLWJ5OiBNaWNrYcOrbCBTY2hv
ZW50Z2VuIDxjb250YWN0QHRpZ2VyLTIyMi5mcj4KK0NvLWF1dGhvcmVkLWJ5OiBTZXRoIE1pY2hh
ZWwgTGFyc29uIDxzZXRobWljaGFlbGxhcnNvbkBnbWFpbC5jb20+CisoY2hlcnJ5IHBpY2tlZCBm
cm9tIGNvbW1pdCAzM2NmOTY1ZjcyNzFhYjQ5NzhlZDU1MTc1NGRiMzc4NjVjNDA4NWRiKQorU2ln
bmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgorLS0tCisg
c2V0dXAucHkgfCAzICsrLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL3NldHVwLnB5IGIvc2V0dXAucHkKK2luZGV4IDdiYTRi
MmEyLi44M2Q3ODY2NSAxMDA3NTUKKy0tLSBhL3NldHVwLnB5CisrKysgYi9zZXR1cC5weQorQEAg
LTQzLDcgKzQzLDggQEAgcGFja2FnZXMgPSBbJ3JlcXVlc3RzJ10KKyAKKyByZXF1aXJlcyA9IFsK
KyAgICAgJ2NoYXJkZXQ+PTMuMC4yLDw1JywKKy0gICAgJ2lkbmE+PTIuNSw8MycsCisrICAgICdp
ZG5hPj0yLjUsPDM7IHB5dGhvbl92ZXJzaW9uIDwgIjMiJywKKysgICAgJ2lkbmE+PTIuNSw8NDsg
cHl0aG9uX3ZlcnNpb24gPj0gIjMiJywKKyAgICAgJ3VybGxpYjM+PTEuMjEuMSw8MS4yNycsCisg
ICAgICdjZXJ0aWZpPj0yMDE3LjQuMTcnCisgCistLSAKKzIuMzEuMQorCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbjMtcmVxdWVzdHMvMDAwMS1BbGxvdy1pZG5hLTMueC10by1iZS1pbnN0YWxs
ZWQtb24tUHl0aG9uLTMueC5wYXRjaCBiL3BhY2thZ2UvcHl0aG9uMy1yZXF1ZXN0cy8wMDAxLUFs
bG93LWlkbmEtMy54LXRvLWJlLWluc3RhbGxlZC1vbi1QeXRob24tMy54LnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmVhOWFkMTVkZjIKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3B5dGhvbjMtcmVxdWVzdHMvMDAwMS1BbGxvdy1pZG5hLTMueC10by1iZS1p
bnN0YWxsZWQtb24tUHl0aG9uLTMueC5wYXRjaApAQCAtMCwwICsxLDMzIEBACitGcm9tIGQ3NDdj
NDc1MzQ4NGFhOWI5MGEwOTRkNmJmN2VjNDVlNWFjZmI2MjMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBOYW9yIExpdm5lIDxuYW9ybGl2bmVAZ21haWwuY29tPgorRGF0ZTogV2VkLCA3
IEp1bCAyMDIxIDE2OjI1OjIwICswMzAwCitTdWJqZWN0OiBbUEFUQ0hdIEFsbG93IGlkbmEgMy54
IHRvIGJlIGluc3RhbGxlZCBvbiBQeXRob24gMy54CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0CisKK0NvLWF1dGhvcmVkLWJ5OiBNaWNrYcOrbCBTY2hvZW50Z2VuIDxjb250YWN0
QHRpZ2VyLTIyMi5mcj4KK0NvLWF1dGhvcmVkLWJ5OiBTZXRoIE1pY2hhZWwgTGFyc29uIDxzZXRo
bWljaGFlbGxhcnNvbkBnbWFpbC5jb20+CisoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAzM2Nm
OTY1ZjcyNzFhYjQ5NzhlZDU1MTc1NGRiMzc4NjVjNDA4NWRiKQorU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgorLS0tCisgc2V0dXAucHkgfCAzICsr
LQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKKworZGlm
ZiAtLWdpdCBhL3NldHVwLnB5IGIvc2V0dXAucHkKK2luZGV4IDdiYTRiMmEyLi44M2Q3ODY2NSAx
MDA3NTUKKy0tLSBhL3NldHVwLnB5CisrKysgYi9zZXR1cC5weQorQEAgLTQzLDcgKzQzLDggQEAg
cGFja2FnZXMgPSBbJ3JlcXVlc3RzJ10KKyAKKyByZXF1aXJlcyA9IFsKKyAgICAgJ2NoYXJkZXQ+
PTMuMC4yLDw1JywKKy0gICAgJ2lkbmE+PTIuNSw8MycsCisrICAgICdpZG5hPj0yLjUsPDM7IHB5
dGhvbl92ZXJzaW9uIDwgIjMiJywKKysgICAgJ2lkbmE+PTIuNSw8NDsgcHl0aG9uX3ZlcnNpb24g
Pj0gIjMiJywKKyAgICAgJ3VybGxpYjM+PTEuMjEuMSw8MS4yNycsCisgICAgICdjZXJ0aWZpPj0y
MDE3LjQuMTcnCisgCistLSAKKzIuMzEuMQorCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
