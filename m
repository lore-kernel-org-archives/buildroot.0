From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Aug 2016 00:19:38 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: purge locales by default
Message-ID: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our current default is to keep all locales installed in
/usr/share/locale/. However, in practice, those locales take up a
significant amount of space, and most users do not need
locales. Therefore, it makes more sense to default to purging locales,
in order to keep only a few useful ones rather than keeping them all.

It helps in providing a small filesystem size by default, and still
allows advanced users who really need locales to tune their
configuration.

As an example, a very basic system with just util-linux enabled (not
even Busybox) weights 11 MB, including 6.4 MB of locales. With this new
default, the generated system is only 4.2 MB.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index ff667c0..dae34ab 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -44,6 +44,7 @@ config BR2_TOOLCHAIN_SUPPORTS_PIE
 
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
+	default y
 	help
 	  Explicitly specify what locales to install on target. If N
 	  then all locales supported by packages are installed.
-- 
2.7.4
