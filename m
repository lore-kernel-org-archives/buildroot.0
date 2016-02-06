From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 12:30:32 +0100
Subject: [Buildroot] [git commit] boost: fix missing select on
	BR2_PACKAGE_LIBICONV
Message-ID: <20160206113149.6F9F07FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2babbddac9ec60a0be566ede3247dd5868978991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost package adds a dependency on the libiconv package when
boost-locale is selected but locale support is not available in the
toolchain. However, it forgets to select BR2_PACKAGE_LIBICONV in this
situation, causing the following build failure:

  http://autobuild.buildroot.org/results/ab1809f4fa8cf29208f9503edd90aca87fe397c2/

This commit fixes this mistake by adding the necessary select
BR2_PACKAGE_LIBICONV.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 03935e8..ed67285 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -103,6 +103,7 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
