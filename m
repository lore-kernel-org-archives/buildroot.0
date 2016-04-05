From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  5 Apr 2016 22:40:27 +0200
Subject: [Buildroot] [PATCH 2/2] poco: add patch to fix musl build
In-Reply-To: <1459888827-20199-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459888827-20199-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1459888827-20199-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from upstream commit 30159aea4b3f6421da9d74a8bf22aad6d3bf26b4 to fix
musl build issue:

src/Error.cpp: In static member function 'static std::string Poco::Error::getMessage(int)':
src/Error.cpp:71:55: error: invalid conversion from 'int' to 'const char*' [-fpermissive]
   return std::string(strerror_r(errorCode, errmsg, 256));

There are 2 flavors of `strerror_r`, a GNU which returns a string and a POSIX
version which returns an int.

When the POSIX and GNU API collides musl always provides the POSIX API. That
being the case for `strerror_r` musl does only support the POSIX version,
despite of `_GNU_SOURCE`.

Only use the GNU version for glibc or uClibc.

Fixes:
http://autobuild.buildroot.net/results/cc3/cc392a6e294b9eed697b205329f8146a28e423e2/
http://autobuild.buildroot.net/results/693/693ef640a95702b20eb4e811936510e0a58cdfdd/
http://autobuild.buildroot.net/results/7f0/7f0966ee57aea574fda2157562e9c3202bd3819d/
http://autobuild.buildroot.net/results/7c0/7c02072a885a874e8b640905ef21929e6e143aae/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/poco/poco.hash | 1 +
 package/poco/poco.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index c3b490e..1730f1c 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  cfd311ecbc9e58accf1c4ea70170af88f92f88e73dd14944e528e7f6229e6cab  poco-poco-1.7.2-release.tar.gz
+sha256  32182791e7eac00ba367d2f22dd1dd5bfce0b6d6f76fd52f853364f98402dda3  30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 7b99b04..79452c0 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -9,6 +9,7 @@ POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = Boost-v1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
+POCO_PATCH = https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
 
 POCO_DEPENDENCIES = zlib pcre					\
 	$(if $(BR2_PACKAGE_POCO_XML),expat)			\
-- 
2.8.0
