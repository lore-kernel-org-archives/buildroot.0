Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC86BC53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 09:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 244238130D;
	Tue, 28 Jul 2026 09:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orQEvMDyyyiO; Tue, 28 Jul 2026 09:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC3B812C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785232667;
	bh=Mr7vrZonhwqQILYfUfPXhYf1v5mcqmAA/ok0O71aL74=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=L5uiY2Zv3ykNUkRTu5Ec7C2ys++DMZcGOKP70JpW/aP41xTXVTHruPUPQVSts5kA4
	 E4qV9OeJl9TA5bbDLrQwKmgYZfBtS+k5vXdZCmP/1Weu5enzEBSj8u9Yyd1OkujPVY
	 6Nt05RHpjrptEVmZMPpxlyND29Qq1fY7gxo5E/secxtTFqepEcFpJq6fB3oNrFCNDD
	 tPdb+ZQihI2ho8oLaRoAPNG5F7rvlp2YzXJ2LVXwbedXp+SQkOSbUi2jPCHa1BhZEr
	 9z4ItUYggdKZ8TEXONxSkZYwb+Sx2YLMeZB6EJbjL1VNREoHBnvNqe8Naz6pt5v4HA
	 /nxPQ1i5ndhYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC3B812C9;
	Tue, 28 Jul 2026 09:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD7745B
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 09:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BD45400EF
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 09:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bb6RaUnUAS9D for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 09:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 308D1400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 308D1400D3
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 308D1400D3
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 09:57:44 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-69ffbd2a277so3003834a12.0
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 02:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785232663; cv=none;
 d=google.com; s=arc-20260327;
 b=cK2gg8uqHIJeUnAJXQmqVuzmF6tJDf57Kj+884tZR5C/QIAmbDJxg/9dOBfZdn1KdJ
 OHOHM/bZ0zth+opd2SrfuidWYsG3bxH5+gizpKVc04J5ihYKh/zzPrtN4R5aBgeGpStZ
 xtEFQ4JrtkBjIdp+esUW5uie9swLFP4u/E6t3gGktbJKKzasUO3uiV15bwS9UQnLR2U5
 zzIeC2Z+K9MmuqxKeaOTJ4+rKVG6Jo8KxqKwQPOY1z2ritp/GJe/cFzzqK4ugIgKMws2
 YAhdWCscrjiULqf27uJbrw34K8eXFe6UR45NmoUM3pyuXw9DfB6YQE0vqMlpYHjGQNYv
 aCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=X3bx6goEQJtgaBrs8VJL/25FmumWEI2zvROYyufRHQw=;
 fh=YkLInGSfxMiHdoz0U7OSMqVnqBazlDmi9OcZdeA+mIA=;
 b=Vuq9TITEnRql+CdzUjOJH0DDh1G4LpG+8kvqQtzhXmNcoXwFb2AnyC3NioopMrUMmy
 +qS3gy3kLnOtEpf20L7WGmX4QjCFxjFuqPjPH4asVsIAoN66+eiT3M+SCzBKZXoy+t80
 I7aw5NAxcbwEyWK/UkuHFB5a8Pq/j+Gd1DMktO4YnXaevoBx41o7VRt5B4jCdHsGWXeD
 YoilnslPq7wp5+q8O/g+vOO8j//KRXKnh/pudILpXTXXboJEOxWzbesgjwuj7nxHUYlj
 v/LC4XvCs02R4CkNo+ax+PV9djIxpoxYTmEj6jIMBw9Hy72ggfIlhGH1O5lLQBd6CQ4M
 iOdQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785232663; x=1785837463;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=X3bx6goEQJtgaBrs8VJL/25FmumWEI2zvROYyufRHQw=;
 b=Wspdz913Brwm5z7UAMM5LbMY0ajcMhMOuj4GbDtg7tSIpx61JmJl1ibEJ0r5P2MGfg
 SnBr56d+IiTH7fW/dmgMQ2Fb2nZWDaJoLdIqk5pgCiuX836jwY5tgaxcSadZCa+OoTT0
 t4btN1abA4Ja+JITOJZCWFngmsWiq0Qli1Jp9UouwBUCJlGaZo/6jKOEGcnsefXjJ5W0
 ybP7kJpxCM+yN92wemby8urkOEgsR8+PLKl+c4dTRCoGBHjc/5tSl7QUYuCirAcYq0Wq
 AMf2osBq6C8GfHvuQOqto0YkJwf9wbGNhu1v4BWzkbZtq21YUvXgQFyvafhAMZqMUss3
 2jZg==
X-Gm-Message-State: AOJu0Yzn6+1EHs3merBVikSBrhka9qP6h5A43a3aSPbuI7xNR94RNw0b
 kyMO/rIrE+xEWKs5Fx2F86X+lWuqax0Kjm0ddoU3UnUql/WdyFdF5EG/1TjwRtkGZQNbpE+s1IR
 TGmrwBrtvGe3p6AoJrp+BAUiatrY2VanIoHrE
X-Gm-Gg: AR+sD11IRIQnhi/j30lfxjm3JxgKyP1gfnZ0SYp6H72TWuM++iFNe+BrWx4dKPPxHM0
 sGc77m1ZO0GibgPgw2bleNLCJP1Jhboxa3LMuEeuLSmaTSjPvzl0P80I1bm71bG/UkM1fDPD0Os
 6HFKLJzsHSX+8ZQIpTquRLDa4eGrlOBNK6Vj6sACh/FvC/7bfpAKhRo6ctBlqhxffQ2GnqhUZ2I
 /NQ0I6nWElDBbnuMweF9uwz/i4XFzTGMCBCrzyQWOHNr3/Y2/ekRu3/TowA1kE=
X-Received: by 2002:a05:6402:44d5:b0:69f:b166:ea0c with SMTP id
 4fb4d7f45d1cf-6a034a71abfmr656688a12.27.1785232662861; Tue, 28 Jul 2026
 02:57:42 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 11:58:37 +0200
X-Gm-Features: AUfX_mwGyIRLS9_mJJnB7lAu0xYwLPlzYgcg77fBjNZwFWnXJJ_wNlNi4yIEEZ8
Message-ID: <CAGm1_kv07Rcwy5km56rbWHQBmJauhDaCh2uwcnq5izC_pH-oaQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1785232663; x=1785837463; darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X3bx6goEQJtgaBrs8VJL/25FmumWEI2zvROYyufRHQw=;
 b=EBoBLZLs6DfjOtxquLzAtA6vKJWH6IGjyRlvNIMIEv0ANUjpEm7cxyEAimcZmfWkEf
 Ju1nMpGPc5vYGmuggv1LO/WKkC6ISzRyABTXRLHOBp2KhrUtWxQc/165NJp37BqbRS3q
 SZgljds9iLqyBtaKiQUk5wxCLcXxJxwylpTznBxqIhtrFyvj12OmC2VdlgCtuXCWvElM
 RedaQHhyZB1LlNQMS7bKE89pna0HHnrC2ActVsFL4vNiT6P2IL9ap9T/WBLzHsXVbBWS
 v5X02+kxEQzZxpy7uyQw2W3YOrFJw0jWTeOMLD4vOZ4kb2kO9QjIr/lCVPBJFpnKzp6B
 FEHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EBoBLZLs
Subject: [Buildroot] libmicrohttpd: unrelated CVEs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

when generating a SBOM (pkg-stats), libmicrohttpd lists two CVEs:

https://security-tracker.debian.org/tracker/CVE-2025-59777
https://security-tracker.debian.org/tracker/CVE-2025-62689

According to the description, only version 1.0.2 and earlier are impacted:

NULL pointer dereference vulnerability exists in GNU libmicrohttpd
v1.0.2 and earlier.

The problem was only triggered when --enable-experimental was
supplied. This is not the case with BR configuration.

Should LIBFOO_IGNORE_CVES be applied to both of them?

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
