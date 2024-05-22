Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A388C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C0A80C08;
	Wed, 22 May 2024 07:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBGzfd1aXakH; Wed, 22 May 2024 07:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4548F8211D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4548F8211D;
	Wed, 22 May 2024 07:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 879831C585C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 745CB60872
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cb1bQ1MRohtH for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5122B60851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5122B60851
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5122B60851
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-573061776e8so9718115a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361388; x=1716966188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgfWGgiQajxxZIbFh0WrrBQ7eWIro5sUJL90CTsJ53I=;
 b=e94w4Dt0G/FyPz66KCZeGij8eN/Q0fywybZNJk8W0qmADD7F7hOPZViv3kaN8ThLXw
 73gIe62Xupq9SySeCE1VZb4qp691+ijAQv6Ub+7NmfWosmS6lLqMJynnTlZxpusaag8Z
 kbLDVuca63gd0nyC+wGKXN7y1nqoNUK8QZ1B3jAnDIgR96btmMbxDhpAzHYDbC+6J8yz
 LSko4hDpC7S84OVooi68c3ltXhYTllwSrWjpA4z5evLydVicYuDhFiuKQBBmdk3tS6rG
 2JcQjGNPKlEWNcxDSalmnhHvJo1biVEI1S1ZdEq5G8pdRTyt4OgSPQH7R3eX98/JVIja
 hy4A==
X-Gm-Message-State: AOJu0YwkIaOmpBcAfudVfsq/W6/1QmDmwSLR8u6L03q+Gf9jbWi8ENAK
 g0eSL4kvMZstNx4vqaxAmWZXisG05sJzzLq31bb02MyMziIMxPA287Sg/I6fPJHF48W4PNqB5CW
 1PQQ=
X-Google-Smtp-Source: AGHT+IFRAdTjKq5H8vLXk7yyrNmHjL3dL8IxU2eAPUIpYT8I5WKv4ri4vDiU4CpH6bQ6/IIcCCBwcw==
X-Received: by 2002:a50:a40e:0:b0:572:71b3:3c4d with SMTP id
 4fb4d7f45d1cf-57832c3c679mr568402a12.34.1716361387204; 
 Wed, 22 May 2024 00:03:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:33 +0200
Message-ID: <20240522070238.3282121-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361388; x=1716966188;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgfWGgiQajxxZIbFh0WrrBQ7eWIro5sUJL90CTsJ53I=;
 b=MZQkNbso7jHzcLQUwVw4lKWIE7Y68+5qo+OJkDID3CNi553J28Al+pI733RGgN0UKp
 rBlrFYf3LMqQHhYzgnZPB2948zhE9uwjv4Ew7aMqEtbHaF9eDEiNZM+EymrP2rza2haW
 9GBFDA0De0Q1+3YvlDuu7LLcsDYdbJd64YgVw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MZQkNbso
Subject: [Buildroot] [PATCH v2 14/18] package/patchelf: update the patch to
 be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ke-the-rpath-relative-under-a-specif.patch | 48 ++++++++++---------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
index 8710bfb629af..c29fac7d9fb7 100644
--- a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
+++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
@@ -1,4 +1,4 @@
-From 618220bfb55c875d6a4d197cb24fe632ac93ec85 Mon Sep 17 00:00:00 2001
+From 6e8915572db65cf63b7a82f9b24af6f9cad92ba7 Mon Sep 17 00:00:00 2001
 From: Wolfgang Grandegger <wg@grandegger.com>
 Date: Mon, 20 Feb 2017 16:29:24 +0100
 Subject: [PATCH] Add option to make the rpath relative under a specified root
@@ -43,15 +43,17 @@ pending.
 Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
 [Fabrice: update for 0.13]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- src/patchelf.cc | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 175 insertions(+), 21 deletions(-)
+ src/patchelf.cc | 199 +++++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 171 insertions(+), 28 deletions(-)
 
 diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 1d9a772..35b4a33 100644
+index fd1e7b7b61c3..f3b7ba8867bf 100644
 --- a/src/patchelf.cc
 +++ b/src/patchelf.cc
-@@ -46,6 +46,10 @@ static bool debugMode = false;
+@@ -45,6 +45,10 @@ static bool debugMode = false;
  
  static bool forceRPath = false;
  
@@ -62,8 +64,8 @@ index 1d9a772..35b4a33 100644
  static std::vector<std::string> fileNames;
  static std::string outputFileName;
  static bool alwaysWrite = false;
-@@ -77,6 +81,49 @@ static unsigned int getPageSize(){
-     return pageSize;
+@@ -81,6 +85,49 @@ static bool hasAllowedPrefix(const std::string & s, const std::vector<std::strin
+     return std::any_of(allowedPrefixes.begin(), allowedPrefixes.end(), [&](const std::string & i) { return !s.compare(0, i.size(), i); });
  }
  
 +static bool absolutePathExists(const std::string & path, std::string & canonicalPath)
@@ -112,23 +114,23 @@ index 1d9a772..35b4a33 100644
  
  template<ElfFileParams>
  class ElfFile
-@@ -183,9 +230,13 @@ public:
+@@ -197,9 +244,13 @@ public:
  
-     void setInterpreter(const string & newInterpreter);
+     void setInterpreter(const std::string & newInterpreter);
  
 -    typedef enum { rpPrint, rpShrink, rpSet, rpAdd, rpRemove } RPathOp;
 +    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpAdd, rpRemove} RPathOp;
-+
+ 
+-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
 +    bool libFoundInRPath(const std::string & dirName,
 +                         const std::vector<std::string> neededLibs,
 +                         std::vector<bool> & neededLibFound);
- 
--    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
++
 +    void modifyRPath(RPathOp op, std::string rootDir, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath, const std::string & fileName);
  
-     void addNeeded(set<string> libs);
+     void addNeeded(const std::set<std::string> & libs);
  
-@@ -1041,8 +1092,28 @@ static void concatToRPath(string & rpath, const string & path)
+@@ -1267,8 +1318,28 @@ static void concatToRPath(std::string & rpath, const std::string & path)
  
  
  template<ElfFileParams>
@@ -157,9 +159,9 @@ index 1d9a772..35b4a33 100644
 +void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, std::string rootDir,
 +    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath, const std::string & fileName)
  {
-     Elf_Shdr & shdrDynamic = findSection(".dynamic");
+     auto shdrDynamic = findSection(".dynamic");
  
-@@ -1096,6 +1167,11 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+@@ -1314,6 +1385,11 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
          return;
      }
  
@@ -171,7 +173,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpShrink && !rpath) {
          debug("no RPATH to shrink\n");
          return;
-@@ -1120,31 +1196,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+@@ -1343,31 +1419,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
                  continue;
              }
  
@@ -271,7 +273,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpRemove) {
          if (!rpath) {
              debug("no RPATH to delete\n");
-@@ -1413,7 +1543,9 @@ static bool shrinkRPath = false;
+@@ -1736,7 +1861,9 @@ static bool removeRPath = false;
  static bool setRPath = false;
  static bool addRPath = false;
  static bool printRPath = false;
@@ -281,7 +283,7 @@ index 1d9a772..35b4a33 100644
  static std::set<std::string> neededLibsToRemove;
  static std::map<std::string, std::string> neededLibsToReplace;
  static std::set<std::string> neededLibsToAdd;
-@@ -1438,16 +1570,18 @@ static void patchElf2(ElfFile & elfFile)
+@@ -1760,16 +1887,18 @@ static void patchElf2(ElfFile && elfFile, const FileContents & fileContents, con
          elfFile.setInterpreter(newInterpreter);
  
      if (printRPath)
@@ -305,7 +307,7 @@ index 1d9a772..35b4a33 100644
  
      if (printNeeded) elfFile.printNeededLibs();
  
-@@ -1508,6 +1642,9 @@ void showHelp(const string & progName)
+@@ -1821,6 +1950,9 @@ void showHelp(const std::string & progName)
    [--remove-rpath]\n\
    [--shrink-rpath]\n\
    [--allowed-rpath-prefixes PREFIXES]\t\tWith '--shrink-rpath', reject rpath entries not starting with the allowed prefix\n\
@@ -315,8 +317,8 @@ index 1d9a772..35b4a33 100644
    [--print-rpath]\n\
    [--force-rpath]\n\
    [--add-needed LIBRARY]\n\
-@@ -1564,6 +1701,17 @@ int main(int argc, char * * argv)
-             setRPath = true;
+@@ -1889,6 +2021,17 @@ int mainWrapped(int argc, char * * argv)
+             addRPath = true;
              newRPath = argv[i];
          }
 +        else if (arg == "--make-rpath-relative") {
@@ -334,5 +336,5 @@ index 1d9a772..35b4a33 100644
              printRPath = true;
          }
 -- 
-1.9.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
