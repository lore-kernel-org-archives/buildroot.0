From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:07:03 +0200
Subject: [Buildroot] [git commit] xenomai: add string option for additional
	configure options
Message-ID: <20170420211017.2B8C181E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9470687c0feeedec6cf7730ab95f5d35b62850b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xenomai has many configure options that users may or may not want to set.
Providing individual Buildroot config options for every single one of them
is not maintainable.

Therefore, add a string option to allow the needed flexibility.
Important options, or those that have 'select/depends on' impact, can still
be turned into real Buildroot config options.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  | 6 ++++++
 package/xenomai/xenomai.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 6646ec0..4bbffb2 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -120,6 +120,12 @@ config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH
 	  To use the Xenomai default (currently: /var/run/xenomai),
 	  leave this option empty.
 
+config BR2_PACKAGE_XENOMAI_ADDITIONAL_CONF_OPTS
+	string "Additional configure options"
+	help
+	  Specify any additional options to pass to the configure
+	  script here.  See Xenomai documentation for details.
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 89b022a..2d92e91 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -57,6 +57,8 @@ else
 XENOMAI_CONF_OPTS += --disable-registry
 endif
 
+XENOMAI_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_XENOMAI_ADDITIONAL_CONF_OPTS))
+
 # Some of these files may be desired by some users -- at that point specific
 # config options need to be added to keep a particular set.
 define XENOMAI_REMOVE_UNNEEDED_FILES
