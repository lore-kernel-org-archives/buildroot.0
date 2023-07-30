Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC589C00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 17:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900DF400EE;
	Sun, 30 Jul 2023 17:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900DF400EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_puK6Y2Bb11; Sun, 30 Jul 2023 17:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFDEC4011E;
	Sun, 30 Jul 2023 17:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDEC4011E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B475E1BF3BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B1A960B3B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1A960B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S10eSgICum3w for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 17:13:12 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 581DC60F08
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 17:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581DC60F08
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F40FEA4C1076;
 Sun, 30 Jul 2023 19:12:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ9y4-00088q-2B;
 Sun, 30 Jul 2023 19:12:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 19:12:31 +0200
Message-Id: <20230730171232.3381097-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730171232.3381097-1-bernd@kuhls.net>
References: <20230730171232.3381097-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690737153;
 bh=Zq9OLXtND9gjKOdKxGfjTWCC5mHZHNZ2m8aZTwMbDVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=frnzgmAa7KPNOJU8LeltvBgb9p15y+PRyGaWEXRFvmHf1Jl/wf4pn1ULlU3bg61x7
 ZGQxJWRVUKvPOognyTa8RiEg0d9OX03XPQ6aUEtWw0CJblxG0KvzSh0k1Izut7Qn/z
 oyYr46+MBVTsWgWXCCncgKABBxuUgjpgFGG1/LFPXW7Gh6CVO1Z48b1rNqlwRvzdJs
 ddjKqzotNt+ZG6MQZ5KD9h4PlDmcKkcXe8/HFYHdQ5Q6XFsZt/xwT/Vsr5w2807Ag8
 A8Kl+tZ8opHq7UKUWotq7ch5U7IUUMwniG5zmDFrsNy6AggCrNpEkBaHZa/LAIMmeL
 2CDPm742jiV8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=frnzgmAa
Subject: [Buildroot] [PATCH 4/5] package/gerbera: Fix building with fmt >= 10
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch depends on bumping gerbera to version 1.12.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-buildfix-support-fmtlib-10.patch     | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 package/gerbera/0001-buildfix-support-fmtlib-10.patch

diff --git a/package/gerbera/0001-buildfix-support-fmtlib-10.patch b/package/gerbera/0001-buildfix-support-fmtlib-10.patch
new file mode 100644
index 0000000000..b274aab75b
--- /dev/null
+++ b/package/gerbera/0001-buildfix-support-fmtlib-10.patch
@@ -0,0 +1,166 @@
+From 37957aac0aea776e6f843af2358916f81056a405 Mon Sep 17 00:00:00 2001
+From: Mamoru TASAKA <mtasaka@fedoraproject.org>
+Date: Thu, 29 Jun 2023 22:09:15 +0900
+Subject: [PATCH] buildfix: support fmtlib 10
+
+With fmtlib10, fmt::format does not accept pugi::xml_node as it is.
+Use name() member function, as this usage appear on other places of
+gerbera source code.
+
+Closes #2839 .
+
+Upstream: https://github.com/gerbera/gerbera/commit/37957aac0aea776e6f843af2358916f81056a405
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/config/setup/config_setup_array.cc       | 6 +++---
+ src/config/setup/config_setup_autoscan.cc    | 2 +-
+ src/config/setup/config_setup_client.cc      | 2 +-
+ src/config/setup/config_setup_dictionary.cc  | 6 +++---
+ src/config/setup/config_setup_dynamic.cc     | 2 +-
+ src/config/setup/config_setup_transcoding.cc | 2 +-
+ src/config/setup/config_setup_tweak.cc       | 2 +-
+ src/config/setup/config_setup_vector.cc      | 4 ++--
+ 8 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/config/setup/config_setup_array.cc b/src/config/setup/config_setup_array.cc
+index 62dd5c9a7..a5f8958ce 100644
+--- a/src/config/setup/config_setup_array.cc
++++ b/src/config/setup/config_setup_array.cc
+@@ -137,11 +137,11 @@ std::vector<std::string> ConfigArraySetup::getXmlContent(const pugi::xml_node& o
+     std::vector<std::string> result;
+     if (initArray) {
+         if (!initArray(optValue, result, ConfigDefinition::mapConfigOption(nodeOption))) {
+-            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue);
++            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue.name());
+         }
+     } else {
+         if (!createOptionFromNode(optValue, result)) {
+-            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue);
++            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue.name());
+         }
+     }
+     if (result.empty()) {
+@@ -150,7 +150,7 @@ std::vector<std::string> ConfigArraySetup::getXmlContent(const pugi::xml_node& o
+         result = defaultEntries;
+     }
+     if (notEmpty && result.empty()) {
+-        throw_std_runtime_error("Invalid array {} empty '{}'", xpath, optValue);
++        throw_std_runtime_error("Invalid array {} empty '{}'", xpath, optValue.name());
+     }
+     return result;
+ }
+diff --git a/src/config/setup/config_setup_autoscan.cc b/src/config/setup/config_setup_autoscan.cc
+index 9ae4e61f8..5e1394585 100644
+--- a/src/config/setup/config_setup_autoscan.cc
++++ b/src/config/setup/config_setup_autoscan.cc
+@@ -245,7 +245,7 @@ std::shared_ptr<ConfigOption> ConfigAutoscanSetup::newOption(const pugi::xml_nod
+ {
+     auto result = std::vector<AutoscanDirectory>();
+     if (!createOptionFromNode(optValue, result)) {
+-        throw_std_runtime_error("Init {} autoscan failed '{}'", xpath, optValue);
++        throw_std_runtime_error("Init {} autoscan failed '{}'", xpath, optValue.name());
+     }
+     optionValue = std::make_shared<AutoscanListOption>(result);
+     return optionValue;
+diff --git a/src/config/setup/config_setup_client.cc b/src/config/setup/config_setup_client.cc
+index ffd12fc01..857db3c3e 100644
+--- a/src/config/setup/config_setup_client.cc
++++ b/src/config/setup/config_setup_client.cc
+@@ -183,7 +183,7 @@ std::shared_ptr<ConfigOption> ConfigClientSetup::newOption(const pugi::xml_node&
+     auto result = std::make_shared<ClientConfigList>();
+ 
+     if (!createOptionFromNode(isEnabled ? optValue : pugi::xml_node(nullptr), result)) {
+-        throw_std_runtime_error("Init {} client config failed '{}'", xpath, optValue);
++        throw_std_runtime_error("Init {} client config failed '{}'", xpath, optValue.name());
+     }
+     optionValue = std::make_shared<ClientConfigListOption>(result);
+     return optionValue;
+diff --git a/src/config/setup/config_setup_dictionary.cc b/src/config/setup/config_setup_dictionary.cc
+index 003b4cc59..69d1a7255 100644
+--- a/src/config/setup/config_setup_dictionary.cc
++++ b/src/config/setup/config_setup_dictionary.cc
+@@ -163,11 +163,11 @@ std::map<std::string, std::string> ConfigDictionarySetup::getXmlContent(const pu
+     std::map<std::string, std::string> result;
+     if (initDict) {
+         if (!initDict(optValue, result)) {
+-            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue);
++            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue.name());
+         }
+     } else {
+         if (!createOptionFromNode(optValue, result) && required) {
+-            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue);
++            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue.name());
+         }
+     }
+     if (result.empty()) {
+@@ -176,7 +176,7 @@ std::map<std::string, std::string> ConfigDictionarySetup::getXmlContent(const pu
+         result = defaultEntries;
+     }
+     if (notEmpty && result.empty()) {
+-        throw_std_runtime_error("Invalid dictionary {} empty '{}'", xpath, optValue);
++        throw_std_runtime_error("Invalid dictionary {} empty '{}'", xpath, optValue.name());
+     }
+     return result;
+ }
+diff --git a/src/config/setup/config_setup_dynamic.cc b/src/config/setup/config_setup_dynamic.cc
+index 0074cb6d3..d6962afe6 100644
+--- a/src/config/setup/config_setup_dynamic.cc
++++ b/src/config/setup/config_setup_dynamic.cc
+@@ -192,7 +192,7 @@ std::shared_ptr<ConfigOption> ConfigDynamicContentSetup::newOption(const pugi::x
+     auto result = std::make_shared<DynamicContentList>();
+ 
+     if (!createOptionFromNode(optValue, result)) {
+-        throw_std_runtime_error("Init {} DynamicContentList failed '{}'", xpath, optValue);
++        throw_std_runtime_error("Init {} DynamicContentList failed '{}'", xpath, optValue.name());
+     }
+     optionValue = std::make_shared<DynamicContentListOption>(result);
+     return optionValue;
+diff --git a/src/config/setup/config_setup_transcoding.cc b/src/config/setup/config_setup_transcoding.cc
+index 17d1780dc..1f6fb0604 100644
+--- a/src/config/setup/config_setup_transcoding.cc
++++ b/src/config/setup/config_setup_transcoding.cc
+@@ -501,7 +501,7 @@ std::shared_ptr<ConfigOption> ConfigTranscodingSetup::newOption(const pugi::xml_
+     auto result = std::make_shared<TranscodingProfileList>();
+ 
+     if (!createOptionFromNode(isEnabled ? optValue : pugi::xml_node(nullptr), result)) {
+-        throw_std_runtime_error("Init {} transcoding failed '{}'", xpath, optValue);
++        throw_std_runtime_error("Init {} transcoding failed '{}'", xpath, optValue.name());
+     }
+     optionValue = std::make_shared<TranscodingProfileListOption>(result);
+     return optionValue;
+diff --git a/src/config/setup/config_setup_tweak.cc b/src/config/setup/config_setup_tweak.cc
+index 65dae2759..4da9fca1b 100644
+--- a/src/config/setup/config_setup_tweak.cc
++++ b/src/config/setup/config_setup_tweak.cc
+@@ -257,7 +257,7 @@ std::shared_ptr<ConfigOption> ConfigDirectorySetup::newOption(const pugi::xml_no
+     auto result = std::make_shared<DirectoryConfigList>();
+ 
+     if (!createOptionFromNode(optValue, result)) {
+-        throw_std_runtime_error("Init {} DirectoryConfigList failed '{}'", xpath, optValue);
++        throw_std_runtime_error("Init {} DirectoryConfigList failed '{}'", xpath, optValue.name());
+     }
+     optionValue = std::make_shared<DirectoryTweakOption>(result);
+     return optionValue;
+diff --git a/src/config/setup/config_setup_vector.cc b/src/config/setup/config_setup_vector.cc
+index e5efe2767..9a9670569 100644
+--- a/src/config/setup/config_setup_vector.cc
++++ b/src/config/setup/config_setup_vector.cc
+@@ -181,7 +181,7 @@ std::vector<std::vector<std::pair<std::string, std::string>>> ConfigVectorSetup:
+ {
+     std::vector<std::vector<std::pair<std::string, std::string>>> result;
+     if (!createOptionFromNode(optValue, result) && required) {
+-        throw_std_runtime_error("Init {} vector failed '{}'", xpath, optValue);
++        throw_std_runtime_error("Init {} vector failed '{}'", xpath, optValue.name());
+     }
+     if (result.empty()) {
+         log_debug("{} assigning {} default values", xpath, defaultEntries.size());
+@@ -189,7 +189,7 @@ std::vector<std::vector<std::pair<std::string, std::string>>> ConfigVectorSetup:
+         result = defaultEntries;
+     }
+     if (notEmpty && result.empty()) {
+-        throw_std_runtime_error("Invalid vector {} empty '{}'", xpath, optValue);
++        throw_std_runtime_error("Invalid vector {} empty '{}'", xpath, optValue.name());
+     }
+     return result;
+ }
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
