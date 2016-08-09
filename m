From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:50:21 +0200
Subject: [Buildroot] [git commit] system: zoneinfo usable by musl, too
Message-ID: <20160809205041.7527E82132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aae8513c401e287af7a9cd74548828182a1473da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we limit installing zoneinfo to non-musl toolchain, by lack
of knowledge on how it would work on musl.

Turns out that musl uses the same zoneinfo format as glibc does.

Make it possible to install the TZ info whatever the C library; for
musl, use tzdata as for glibc.

Thanks Rich! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Rich Felker <dalias@aerifal.cx>
Cc: Marc Khouri <marc@khouri.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 4c7efac..5855707 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -418,9 +418,8 @@ config BR2_GENERATE_LOCALE
 
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
-	# No timezone for musl; only for uClibc or glibc.
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Say 'y' here to install timezone info.
