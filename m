Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27947CA5FED
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 08:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCE740942;
	Fri,  9 Oct 2026 08:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaE8Dz0_DG0z; Fri,  9 Oct 2026 08:34:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE9D840935
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791534870;
	b=kXfz+s+ivQLfE1CNSZ88VQPmjJjTi8JxYtvcYse5LPdJSW+1Sq6987EQ8tSuDbpBlalX
	 g97c9hzAPLw8VShhUNGcYmWJMGf8rxRIovhvlHC29tUxSiYH4QmX3eeqAavvFxLtVNPBe
	 Q/rRGSMUUpi5rXsezyi4Xl3sxVsQ8TKpWGIeMDnYNsrtvbYe7bfXZ/z7DRmspYfQ1ucwH
	 k2iVSkU6zqdu0qmHuxDE10oaUB526aMwAY7pZZ8RrZ1ZFGKjFxOIo46/rM4NHmSZ+CKHk
	 4/4KBY4iDVoJzHcX6kPNdVhzFLOYAymAmV5ynvhyCyHH/65ORhJyrtvo3B7V2cITtcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791534870;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7AmMsqkU9FJRqcsWfsgVY60D4+OkdL+bxMmFRcfV1lM=;
	b=V4bfy9zbyCflJV9shwL3LKRp9kflajX6nthinvJO3nk7Wyo3dDoasknZH/K2l/CYuETX
	 Ii71IZWxmlk+efhr1CS3ThIfakN6zPhGo8J6TmybgnpojXVnjOpKn3NqljO/+eLZveCbN
	 t3pdG6qDO/qc+U7F4fF7GB5nOaTrWiukcFQ7GZmyPhM9qSsOeEHdEIgc/jUUPs77GOCIk
	 +8/iYWwMG1oQpr0rLrAED/FQlti15gLGUyLHs0TApIzNlTokEZP2SO8ZhRnDnB01jU5Yq
	 /zdUM6leSWSdS15n9FqtgHwWJf8mqU56jJaQ8UkmHMYaKbzVqKDshwpTbgHeXDd1j0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=qWN0NTuk;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791534869;
	bh=7AmMsqkU9FJRqcsWfsgVY60D4+OkdL+bxMmFRcfV1lM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YPP12UNhH7JvpRzjcqBT2YE+4QJcEMB556oVTdwxgHp3Rhc9srE6Y7ncpr3qQDndM
	 B2dfhNYzaYFBrG/9qrDOahyJ3OS0/xIKeIYN6/X3wvbyddfn6zv2pjeyGMCHeQS5Mu
	 Qtpz1o5RgB7UAuiBuuzTTE7YkOhmQ95qQMZ2mp4G9UZMaDKmKAmXdOgd2LFQVmmPYv
	 TS9iuLqBQtw0CWIrpkoGwAEUsaCeKNsq+G32oWbrpASpA6lnzmjZF4glpZPHJ1V+gJ
	 E69xkxAfD1/tgq4jqrkTc1GvRdghe+6QVGpe/5IVN2NaoRg2ReSPzlljzgtb3vi5eo
	 YIYS2ZXlkIggA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9D840935;
	Fri,  9 Oct 2026 08:34:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1935C1C6
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B30E40935
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxmJ9Y2A5-4w for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 08:34:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D89BE40903
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791534868;
 b=qMdHHj4sxlbCFsEnSQsQbhI61UNr5H7z62G7Hms6BbIWBsu76w42lJx3rkPgeo4qVyn0
 5rDB/XchNuaG7+e3wimB6RdEQPWBlVdaua7yHl/o2kVO1WqMBYOvpcsKBba0DVmUlrGTF
 XaEXPgWOFnmmYmm9mzwIJqfioyXWpy6d2gunSTOwlUOsjJwokxhlaQhV84tO3+jCNT3Yh
 sXjSFpEdMwceXBoH9dLhPeVsd0w8PlxZLxdLnsgYrQ5y04/Y6m9MDz+kask0WbHv1I/gM
 497v+ELfGXZ7GN1wStsbVE5kAaU7vJGn6/dmZp35EPJDEF4BXbqqAj3PfPIuO07xyNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791534868;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=f9dW78bjU8TIHyPf4OMbLAl6iT3V+HQbcYMuZZAl2dQ=;
 b=d1ejTeUmKLn/bZZxMsrZu+7WR/74wl0D0nH7UsBY8tDGlezG19oF4vftTlH2TIs86TfA
 Z/WglGjx1GiyOLMEDA33eLq+bKHgG12s/fgjO8U8SStbrvBgjyvNeo2Oh4og6aeaEUFrz
 0qZEEmkRTlI+CQvhpxYfSFldXi8JOcUbUSHDlzKobNa6U69qeSA212dbL7bZyZV0EhCfG
 EhocXNm6gBi8HYuxUZxGEAuOHfoDl4iDgzcllO70/4xyg6vEExLRnVVqfIPk/Q1kf2RIL
 PRul5KJ1bXptb7pgu+NjvnYKTcTZckX4Hz8E8a3TFomQ37CtV3Atz6ENCNG6ACcrLDA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=qWN0NTuk; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qWN0NTuk
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D89BE40903
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 08:34:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso318713366b.0
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791534866; x=1792139666; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=f9dW78bjU8TIHyPf4OMbLAl6iT3V+HQbcYMuZZAl2dQ=;
 b=qWN0NTukrX1S2zop+fELNXQBH4mNgRvFgOAfvDbFzKX9crFeVxV/cNTPaRCyzEK2iO
 565ukFY9siq/MdZfN7IefYN5nguPxTfhgzmjFlek7k8qf/dpvbAddFt4zPf9uH7m7hcj
 xDyXUibXXz1g1NtljwP3enuI/K1k8wWjwIVs52SWQ1kwE2+oDZ2RwaVLJUaP3yzor8f3
 Y/bQBIxoYRlr22JLD5MxQ49UFrQ9l+7ttxeREiDecOP5Qaz52VnVBuIczwVILmGXMjTt
 wUUS+sN+PC+/IV+wBP1JlflLgow7i+aHT62q621Co494kZzVSPT1f4KtD6ASx6Rgne52
 L0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791534866; x=1792139666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f9dW78bjU8TIHyPf4OMbLAl6iT3V+HQbcYMuZZAl2dQ=;
 b=wSicRaOW/qLF4P2xJcPJZ0diheU228/I5uHG8dmDm33qvlHxQfCd95CV3RFsXnqljW
 2IlnBsLrxMjUprA4t8VlCk3fPnkwJkd8aATShJqbsbIMQTMrc1c4Z6D3BpjExAyCXVle
 RwcGpcDAJn+sEkUtTO1VpvjiHM5UNV041cZ5tZcpMYQZogEnLMh+yyfDjYfjtX672x9V
 i3TeLJH3oGfyvlZVUj5gZt4lXbGIfEzKXDTH2dibaYSxNt45tt4vIBYX8yo922Ez03vz
 Cwe/Br60RuVKJhlijvuYchFyaFfSDazvl8XVPQKzxQz4pjF0i1qcs4lVNPWjnup1eh/2
 E97Q==
X-Gm-Message-State: AFq9FYLRgSpVevvRikxY/8xAZ5vjGqRagHqAB8SSKNsvM9UodOVTOm8E
 D173xwJE40GTrMeojbtaeRFiRSYCy0pJxmnPV3aKtAVmIDME2VLPtoeeOEpuEg==
X-Gm-Gg: AYBFou0rJvQ0AMv5z2qXQ+wvOl3eMC6MpK5D8C5rCZ/wLjDRR88eccJ6C3lBA1y2pij
 buW6T8k+7Z06puag/486dwXzq0mS8UzACyghp7xgQ0wLYR+XfTKBocPFiHlyzX5e0C7/edeEUyS
 u92jFZwuMbso5RgQ5sKDV4TNEtmN2Rul8kW2ptN8gefBJ8YFqrGnP80ELiwRrZTJ9UXP13mWdKt
 Fa5rQVATRx49OJ1qsrIAUQV2C8Khuv5ui2SekeDipceg91nBK0Yq26ZtNwO2FgW5UAvCIekMZgg
 0WAvEK6n8KpxPnyDnkS0cO/Z+SOLOTawY+Dm2+RUoS8qlFcm7ygpDF+BtfV3etSXw0iklhe4AxY
 rUHY4AyjnNrAi5M3fSWtj1YnEb6p+iAf6zdUNLz2Ej2RstBgqrli2hVI7WoHXTI/Kv9kEMWy3AI
 DFfe8C/AF8IDfVupgfmRSvzWcXfw7agngBZFhWTwSieWdXIhzslR9DSwmu7UDKxDgi8dWxRsbJV
 b7fDPjLq9WsXNXf0o6lkSZ/Zuipdps5STh13sTxhUDFmkG3UoatiN7lNA==
X-Received: by 2002:a17:906:7943:b0:c2a:4847:231b with SMTP id
 a640c23a62f3a-c31aa03cd06mr121640266b.24.1791534865275; 
 Fri, 09 Oct 2026 01:34:25 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3ae32sm63836966b.28.2026.10.09.01.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 01:34:24 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Oct 2026 10:34:18 +0200
Message-Id: <20261009083420.1298439-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/python-types-*: fix build with
 setuptools < 82.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The latest typeshed stub packages (types-python-dateutil, types-psutil
and types-setuptools) use "<pkg>-stubs" keys in
[tool.setuptools.package-data] and require setuptools >= 82.0.1, as
older versions reject such keys, see
https://autobuild.buildroot.org/results/1ce798157bff8a423ca8c7c9f0e82620890ec3b3

Bumping setuptools is not an option for now, as 82.x breaks older U-Boot
versions using binman (see commit aa8e6bc395fe), so instead of fixing
up each pyproject.toml, this series backports the relevant part of the
upstream validate-pyproject fix to our setuptools 80.9.0 and skips the
now unneeded build dependency check in the three stub packages.

Tested by building python-types-python-dateutil, host-python-types-psutil
and host-python-types-setuptools for an i686 Bootlin toolchain and
checking that the stubs get installed.

Yegor Yefremov (2):
  package/python-setuptools: accept PEP 561 stub names as package-data
    keys
  package/python-types-{python-dateutil, psutil, setuptools}: skip build
    dependency check

 ...-561-stub-names-as-package-data-keys.patch | 42 +++++++++++++++++++
 .../python-types-psutil.mk                    |  3 ++
 .../python-types-python-dateutil.mk           |  3 ++
 .../python-types-setuptools.mk                |  3 ++
 4 files changed, 51 insertions(+)
 create mode 100644 package/python-setuptools/0002-config-allow-PEP-561-stub-names-as-package-data-keys.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
