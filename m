From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:36:41 +0100
Subject: [Buildroot] [git commit] package/easy-rsa: select the appropriate
 option for openssl binary
Message-ID: <20191213152849.A0C758A4A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef3f8ba99e9703383445e9fb0c2406d0b954c0b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since openssl was converted to a virtual package,
BR2_PACKAGE_OPENSSL_BIN no longer exists: it was renamed to
BR2_PACKAGE_LIBOPENSSL_BIN, but easy-rsa was not changed accordingly.

easy-rsa needs to take into account the two providers of openssl, and
select the appropriate suboptions depending on which openssl
implementation was chosen.

Ideally, we would probably need a more elaborate option that ensures
easy-rsa doesn't have to know the details of which openssl
implementation is selected, but practically speaking with just two
providers of openssl at the moment, the proposed solution is good
enough.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/easy-rsa/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/easy-rsa/Config.in b/package/easy-rsa/Config.in
index 883d679e98..56db64a590 100644
--- a/package/easy-rsa/Config.in
+++ b/package/easy-rsa/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_EASY_RSA
 	bool "easy-rsa"
 	select BR2_PACKAGE_OPENSSL # runtime
-	select BR2_PACKAGE_OPENSSL_BIN
+	select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL
 	help
 	  Simple shell based CA utility
 
