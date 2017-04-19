From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 22:00:07 +0200
Subject: [Buildroot] [PATCH 9/9] xenomai: add string option for additional
	configure options
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-10-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Xenomai has many configure options that users may or may not want to set.
Providing individual Buildroot config options for every single one of them
is not maintainable.

Therefore, add a string option to allow the needed flexibility.
Important options, or those that have 'select/depends on' impact, can still
be turned into real Buildroot config options.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 6 ++++++
 package/xenomai/xenomai.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 09e18bf..96e478e 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -116,6 +116,12 @@ config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH
 	  To use the Xenomai default (currently: /var/run/xenomai), leave this
 	  option empty.
 
+config BR2_PACKAGE_XENOMAI_ADDITIONAL_CONF_OPTS
+	string "Additional configure options"
+	help
+	  Specify any additional options to pass to the configure script here.
+	  See Xenomai documentation for details.
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 31424a1..4044725 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -52,6 +52,8 @@ else
 XENOMAI_CONF_OPTS += --disable-registry
 endif
 
+XENOMAI_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_XENOMAI_ADDITIONAL_CONF_OPTS))
+
 # Some of these files may be desired by some users -- at that point specific
 # config options need to be added to keep a particular set.
 define XENOMAI_REMOVE_UNNEEDED_FILES
-- 
2.10.2
