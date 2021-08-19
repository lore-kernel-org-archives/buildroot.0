Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F57C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:27:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7978610A3
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7978610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A42E681934;
	Thu, 19 Aug 2021 18:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_Mi-_EdniFh; Thu, 19 Aug 2021 18:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D8481947;
	Thu, 19 Aug 2021 18:27:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95D181BF402
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85C1281947
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOCCkIhMHB0J for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 18:27:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BE1C81934
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 18:27:30 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso5422211pjb.1
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Lt+eD/SXUmUxRtAgt0v0RicLdrlTQ7yIsrsJHRwIhbY=;
 b=oGR+k8nv3YNRWcWxQRfUgL0ts+6r2ZYVdQN7pdag4sK5BkalqGldY6c2ITeKyhQWHj
 zR4yGGnyaJsnFo4Bho53vqkb5iVypJEX1KR1a3Er5QzSsyO4oCi1v8RH3mIs8wIvRHpL
 J2htPPTicl8FDdZVblm9+0TBNdWhxYk+7GEy/rDpda3QRREfJ9BA6q7/tlE3BII+//nb
 Y18QAebMPP7/EMx35R6TE+3g1cPnQSrPpJvlBWsq0O0umOTiQGi3s4SdOt0f7IZwQ8oz
 bS8GyJwv/bnZuXHFkp6C4v1qnI6T07MMiAehMhoq9I44R7RzXfkhcvEBDpWzQzkTgW+s
 WuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Lt+eD/SXUmUxRtAgt0v0RicLdrlTQ7yIsrsJHRwIhbY=;
 b=q3Kun7Hhbh1gPCcIyNOCtO7e2RglTZN7mUbV7AZFxd3YKDeH7x/6e9/a5cEgxbWuGp
 rGKNdtG8pVI3tEH1PZazOglNZGsou0eIcJGOIdmejWJxoaXtx+px65CvvIjRbmpF2LQ4
 MwkEed4jsHhjUdbLgXQ5fJfaAWMGBT4WG7UF6HaSmc45RbmRtHYqTPGPAQ9BoNLHaG6e
 Pw7nSHwXUNJUSf2aRnTXG0OA9OJiQDfWJG794EOJCCd7F2I+ESDoOMgyeDRFMKNC3hGb
 G+wdBTvzh57XOp4KylitshZNa1IYkCS3BHvM44/roJRYtzESKDxAidTmzxuxWS6ZMvAt
 tTGw==
X-Gm-Message-State: AOAM5305MW5ExekuTSYuSbSeJ3r+nUb5oaiwCMDjtp3rRN0E+yg1LvVG
 TRiJahvoeHVsDSeacivP9fc0PJvpRbn4aOF4AUm0OOBlhSoP2A==
X-Google-Smtp-Source: ABdhPJxdWs5TUlr2MSjeBE6xNB1IWXP+oKpUL07M4kQ205NCuOhggU0yuZpCYnb9/hnahbZwWM0D4ZttRonkd31rAfo=
X-Received: by 2002:a17:90a:2f88:: with SMTP id t8mr114619pjd.2.1629397649320; 
 Thu, 19 Aug 2021 11:27:29 -0700 (PDT)
MIME-Version: 1.0
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 19 Aug 2021 20:26:53 +0200
Message-ID: <CALtfCQajW_ZAvVq3J5cA=XgSh1w6u9_Sv+VoRcqLkSMO46aghg@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Issues with SVN keywords and SITE_METHOD = svn
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgZXZlcnlvbmUsCgpJIGFtIHVwZGF0aW5nIG15IGJ1aWxkcm9vdCBmcm9tIDIwMjAuMDguMiB0
byAyMDIxLjA1LjEgYW5kIEkgaGF2ZQpmb3VuZCBhIHByb2JsZW0uCgpJIGhhdmUgbXkgb3duIHBh
Y2thZ2UgY3JlYXRlZCB5ZWFycyBhZ28gd2l0aCBTSVRFX01FVEhPRCA9IHN2bi4gVGhlcmUKYXJl
IHNvbWUgZmlsZXMgaW4gdGhhdCByZXBvc2l0b3J5IHdpdGgga2V5d29yZCBzdWJzdGl0dXRpb24g
dGhhdCB3aXRoCmJ1aWxkcm9vdCAyMDIwLjA4LjIgd29ya3MgcGVyZmVjdGx5IGFuZCB0aGUgaGVh
ZGVycyBvZiB0aGUgZmlsZSBpcwpkb3dubG9hZHMgZnJvbSB0aGUgcmVwb3NpdG9yeSBwZXJmZWN0
bHksIGFzIHlvdSBjYW4gc2VlOgoKISAvdXNyL2Jpbi9weXRob24KIyAvKioKIyAgKiBAZmlsZSBu
YW1lLnB5CiMgICogQGF1dGhvciAgT3NjYXIgR29tZXogRnVlbnRlIDxvZ29tZXpAeHh4eC54eHg+
CiMgICogQHZlcnNpb24gJFJldjogMTYxICQKIyAgKiBAZGF0ZSAkRGF0ZTogMjAyMS0wOC0xOSAx
MTo1MDoyNSArMDIwMCAoanVlLCAxOSBhZ28gMjAyMSkgJAojICAqIEBzZWN0aW9uIERFU0NSSVBU
SU9OCi4uLi4KCkJ1dCB3aXRoIGJ1aWxkcm9vdCAyMDIxLjA1LjEgZG9lc24ndCB3b3JrIGZpbmU6
CgojISAvdXNyL2Jpbi9weXRob24KIyAvKioKIyAgKiBAZmlsZSBuYW1lLnB5CiMgICogQGF1dGhv
ciAgT3NjYXIgR29tZXogRnVlbnRlIDxvZ29tZXpAeHh4eC54eHg+CiMgICogQHZlcnNpb24gJFJl
diQKIyAgKiBAZGF0ZSAkRGF0ZSQKIyAgKiBAc2VjdGlvbiBERVNDUklQVElPTgouLi4KCkkgaGF2
ZSBjaGVjayB0aGF0IG15IHN1YnZlcnNpb24gaXMgd29ya2luZyBwcm9wZWxybHkgaW4gbXkgY29t
cHV0ZXIsCnNvIEkgZG9ub3Qga25vZSB3aGF0IHRvIGRvLCB0byBrbm93IHRoaXMgUmV2IGtleXdv
cmQgaXMgdmVyeSBpbXBvcnRhbnQKZm9yIG1lIGR1ZSB0byB0aGUgZmFjdCBJIHVzZSBpdCBmb3Ig
c2hvd2luZyB3aGVuIEkgZXhlY3V0ZSB0aGUKcHJvZ3JhbS4KCkRvZXMgYW55b25lIGhhdmUgYW55
IGlkZWEgaG93IHRvIGZpeCB0aGlzIGlzc3VlPwoKVGhhbmtzLgoKw5NzY2FyIEfDs21leiBGdWVu
dGUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
