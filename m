Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C37D13C00
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 13:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE04809E9;
	Mon, 26 Jan 2026 13:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9dKsgBks5wi; Mon, 26 Jan 2026 13:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10200808C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769432662;
	bh=bICW7cMfMBEj7L9cffVJfdxHX6VDpFKnEaG5WF4juqU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IjZDV1oikpcGvFOtO12jj4bvF0jdrYRCM9UxuldI2t4wssvoDk0FqOkDZimwGFzlW
	 rwMUwiUwHkB/VvyBKDoMlqBn+KsUjwGoFBbsyZ8gcqV4airSF0+HH/X730v7pBW1y5
	 Bm5hIY81GkIvrKJxWeVjY+2wDuR9Ugjl3/2ObqivNNN2gHjTS1lYRRPq4rvl/NxjXp
	 htYa+t1l114GIDlox88MWXMxhsYxrXwu4+wCziNK+xozz7YuC0P3jcZIYK06azmx2Z
	 TfXr4gHioUxIfWfxCRP0LSreWnlnw8nI3xrLwpuCLaggk2rTJ1xjetBZ17ZS2yBEtM
	 pJ7q+ZH1fRpYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10200808C0;
	Mon, 26 Jan 2026 13:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 108AB355
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3C5C4084F
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeObNfuQW2J5 for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 13:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E240D40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E240D40026
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E240D40026
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so51745015e9.1
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 05:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769432655; x=1770037455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vo4RfQuFGANu2D4Es0JUczr/QPpNAA+3+YfPt9J8vI4=;
 b=rcbo5tvcFlSZQZp+JuTMEARTYNODuo5af/GWwvuel+qJEjnOKAZUjn1XM4vQNEYyFO
 P+A9az9Xp56pvOhCW2mjLrOgd9UEZ3n4x645nZxecH8dsqtWjZ4Hja66SCyFo08/CB46
 K2Fk+0IhdhbseanJ0tXyt5zFFjQjKWRG7DB9DDPHOh56/u/mrzGRHwcpMPNQ8hj0TZts
 U4uhfia37SZft0aqIEYO7FkRSguB8AFgne2P8K7X22fjPX6Hm7rfMAY047W6gbvqqyOo
 rx9Y3A7YvEH+GUq6ZO8n9BhUna6WgRYdjNOAesXsJSDoBWZ89SXf+KjVoB0+SnKMF4Lg
 JimQ==
X-Gm-Message-State: AOJu0YwWe/sg7jojs5g3TSXKmtamGIjxgJV+wedA78eXyZSBdFw2FHjH
 kvPz6m/vpoerbNbhchHwdXz6k6Ci9FNBsLAtp++Zk2hLvPiidR/bl+aD9hURsKKoBwpZyZCwj7F
 zzPsk
X-Gm-Gg: AZuq6aJjTnv4urnBcAC5/lAyRa0zDskg86kS2Ja4Tz61PjUTym15s2VoyBiTUa3tFZ7
 nyd4NaEer10EVXn1jPR3lf9bB6G5mg7VUDM4eykZyn3sU9rib01VIpbf/D7gCQUWi87Nbdb3c3F
 0Qtz4hD+zdP0FTReVNGKBGIz4duXUe2YvM6LjCZ3Mb0HENhGaywIPF9aW8d3jzvSeCnLdjnDwdr
 HYosRy+yxkqbUg5tJx+ybtg+LGGjmZzgqnzaW1xac9WqT4pVAIip+aAoEPwrfilYEdnVwrm1svn
 w9rNy5k/RgrdZqu3tG0dYKU4tfC84/CaVlW0Ai1az0ulNeiQESvb17fXw3SmRt/GgfZOVoIiY19
 D9UlRGQLTomrxa127AHPoZbvSX0OEwMtJ5YP3EitvEOTTzKrZoEdv5QP63Wbjc2A9HtDYQZAohQ
 BXVo9fbxnw+7nucMk00zQk0xS8tpIDpX6ECLurB0WVwmflClMG
X-Received: by 2002:a05:600c:3b08:b0:47e:d943:ec08 with SMTP id
 5b1f17b1804b1-4805cf67f0dmr66991955e9.28.1769432654994; 
 Mon, 26 Jan 2026 05:04:14 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470cf1acsm359603435e9.14.2026.01.26.05.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 05:04:14 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 26 Jan 2026 14:04:11 +0100
Message-ID: <20260126130414.59175-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769432655; x=1770037455; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vo4RfQuFGANu2D4Es0JUczr/QPpNAA+3+YfPt9J8vI4=;
 b=d33EEa9CWhlsslcSEoqtDHm2XTNDga7f6XOvNjk/NPr3kR33eaRELa5z4yyQHI36cb
 23NMBYFzz6WeGJ8BiCds0p4mTV5S29Zfcx0MwXHZYSurzcIEPenEyhFE3u+iZziNslPy
 DO8/ViAUFcA9/QV/me5IBph/PtgZ2ReFoT5mbK/CXhLcIImBxwzJp0hKudJdxj1Nop61
 zrt6LvRhaEXd10HqXnn0sH0QKDQkkVGxaSRV4kgni9ta3ALNyd9lWACHk7fpHULL5ruu
 wwstwTSg3MSnIzY1PjvLZ8deOJymflYwUEKhZHu+9/CwmGfQ6Xo6rtwBEjejr6gdxPjM
 QfMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d33EEa9C
Subject: [Buildroot] [PATCH v2 1/4] utils/generate-cyclonedx: fix 'project'
 dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The definition of the project name & version is stored under the
`metadata:component` CycloneDX property.

Since the introduction of the `generate-cyclonedx` script [1] a
'buildroot' dependency entry that depends on every components has been
part of the generated SBOM.
Tools such as 'DependencyTrack' relies on such entry to create graph of
the entire project.

With the commit [2] that introduced the option to pass a custom project
name and version, this dependency reference was not updated to match the
custom 'bom-ref'.

This patch fixes the reference to match the custom project name.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
[2] 9cbbc47762 utils/generate-cyclonedx: add project name and version options

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a103b7b707..e864edf181 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -428,7 +428,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
+            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
