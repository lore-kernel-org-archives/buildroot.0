Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E4BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 09:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6748740873;
	Sun, 16 Jan 2022 09:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMjwUsTFeZQs; Sun, 16 Jan 2022 09:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38CB4077D;
	Sun, 16 Jan 2022 09:45:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57CCD1BF25B
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 09:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CAA982611
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 09:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTa4Agc3yzOn for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 09:45:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5460E825E6
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 09:45:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t24so52316577edi.8
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 01:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yl+RXOYxRm3ar4uh1Lr+9ceeSm3CIrx54EXLPgcRPRs=;
 b=F7QAWkyg3GbGkJixbxAGmObqYlR4qus89Bdp4bP4ESoGsUu1jx8iP8C7bHXnpNQLeE
 WJJ5qApmhm7c71fmEV214G19BhzR39OntJyfvWY8j5JGPkXnNwn8Okz4EfRnK3ylY7Si
 ZW8krY+oPT8n6lbMpzzCtrY9FTRYNimSYTpn6MfoUlll+PAzdiOpWjmzeZ92AW3GAdqm
 EOyFc+jTfCS4fZvKPu5rzx48czoFjwofpkCgHESFyPH6aXVsNDEagZ8dkJ319qireNCq
 IEXBYUHyUMnP6pejkkIhbezmScRKQyeDAnUdCzYgnr//XKwWygn9yCSC941PWkKmTjNg
 rvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yl+RXOYxRm3ar4uh1Lr+9ceeSm3CIrx54EXLPgcRPRs=;
 b=yB9vTyleCBhGc6jRpWINYtHMz3s2Jy90JvSOayLb5aSSzSiX6ORCRSqfgE9WPccGz+
 p/HJQWPOmK08ytAEeWp+gtaH6mFJh+7AuWJYN+A7viK1JMjx74kktnDpjW7Pgfj+7EQX
 stRXk+0Qg0bPrh8nGWP2sX1kignct1c86leQCTeTC1+UqynJoyllZ3mEzsC4vny+TM5x
 gSAkYmOe2x4WbSfFlf6KnYWRKjj3p5K/ng80ZwD9rDal991hL844HzUnunU7S/6+BaZ3
 AQcjuh5SaKiqdr4lCPXKqwtoBMmHezQj/m0iEZtkxMVORbjZSeQ19JJukTR3XeePFCcZ
 omEw==
X-Gm-Message-State: AOAM5305FI28/btepyMzI53TXqOQYl3yiLdye2s+ShXZJGYTntu4MoGQ
 yNoB6KKoV4M+VeL9vSjpG5DrfeY034bdANpEa9mdkNC7
X-Google-Smtp-Source: ABdhPJx6maWomu/EbDL2byBKEJb5V/22xeY4Em/5Dm2m4FDwq6gan9GrmUCsqjsyKl8056kwz68Gnn4e0fBrPk0AQDo=
X-Received: by 2002:a17:906:2bcf:: with SMTP id
 n15mr12631295ejg.184.1642326320395; 
 Sun, 16 Jan 2022 01:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
 <20211121145741.1fa4dffb@windsurf> <20220113231438.5aa8742e@windsurf>
In-Reply-To: <20220113231438.5aa8742e@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Jan 2022 10:43:45 +0100
Message-ID: <CAPi7W81-uZBSkZM13TidniExTbGicRZZ08g8jQbiRr_UdzgsAw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/2] Revert "package/log4cxx: select boost chrono and date-time
 with gcc < 7"
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgamV1LiAxMyBqYW52LiAyMDIyIMOgIDIzOjE0LCBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxs
byBGYWJyaWNlLAo+Cj4gT24gU3VuLCAyMSBOb3YgMjAyMSAxNDo1Nzo0MSArMDEwMAo+IFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gPiBP
biBGcmksIDE5IE5vdiAyMDIxIDE4OjU1OjUyICswMTAwCj4gPiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBUaGlzIHJldmVydHMg
Y29tbWl0IDNjMjI0NWNiNjU3NDFjOTY1ZjRiYjg3ZDM1YWMzYzY0ZjI1MGExYWUgdG8gbW92ZQo+
ID4gPiB0aGVzZSBzZWxlY3RzIG9uIGJvb3N0IHNpZGUgYXMgdGhlIGJ1aWxkIGZhaWx1cmUgd2Fz
IHJhaXNlZCB3aXRoIGdjYyA+PQo+ID4gPiA3IChtYWtpbmcgdGhpcyBjb21taXQgYSAibm8tb3Ai
KS4gSW5kZWVkLCB0aGUgYnVpbGQgZmFpbHVyZSBpcyByYWlzZWQKPiA+ID4gd2l0aCBjbWFrZSA8
IDMuMjEuMywgYmVjYXVzZSBjbWFrZSBhc3N1bWVkIHRoYXQgYm9vc3QgdGhyZWFkIGRlcGVuZHMg
b24KPiA+ID4gZGF0ZS10aW1lIHVudGlsCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9LaXR3YXJl
L0NNYWtlL2NvbW1pdC8xYWQwYzVhZTUzZmMwYzRmNzc0MTY2MzM3ZjBlOWM5M2M1NzhjZjliLgo+
ID4KPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHNheSB0aGlzIGNvbW1pdCBpcyBhIG5v
LW9wLiBJdCBjbGVhcmx5Cj4gPiBpc24ndC4gSW4gZ2NjIDwgNy54IGNvbmZpZ3VyYXRpb25zLCB0
aGlzIGNvbW1pdCBlbnN1cmVzIHRoYXQgYm9vc3QKPiA+IGNocm9ubyBhbmQgYm9vc3QgZGF0ZS10
aW1lIGFyZSBzZWxlY3RlZC4KPiA+Cj4gPiBUaGUgZmFjdCB0aGF0IHlvdSByZWFsaXplIGxhdGVy
IHRoYXQgdGhlIGJ1aWxkIGZhaWx1cmUgb2NjdXJyZWQgd2l0aAo+ID4gZ2NjID49IDcueCwgbWVh
bmluZyB0aGlzIGNvbW1pdCBkb2VzIG5vdCBoZWxwIGZpeGluZyB0aGUgaXNzdWUgZG9lcyBub3QK
PiA+IG1ha2UgdGhpcyBjb21taXQgYSBuby1vcC4KPgo+IERvIHlvdSBoYXZlIHNvbWUgZmVlZGJh
Y2svY29tbWVudCBvbiB0aGUgYWJvdmUgcXVlc3Rpb25zPwoKSW5kZWVkLCB0aGlzIGlzIG5vdCBh
IG5vLW9wIHNvIEkgc3VnZ2VzdCB0byBvbmx5IGFwcGx5IHRoZSBzZWNvbmQKcGF0Y2ggb2YgdGhl
IHNlcmllLgoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2FyZHMs
CgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
