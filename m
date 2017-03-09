From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:35:34 +0100
Subject: [Buildroot] [git commit] python3: explicitly disable OpenSSL
	support for the target
Message-ID: <20170309213619.B37DC7F969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b17d9f5f7e7968e4eddebfd9d06b76027bc8ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fa627738266e ("python3: do not use the system OpenSSL in the host
variant") added a patch that allows to disable building the OpenSSL
related modules in Python, even if OpenSSL is found.

But in this commit, it was only used to unconditionally disable OpenSSL
support for the host python3.

This commit extends that to use the --disable-openssl option also for
the target python3, when BR2_PACKAGE_PYTHON3_SSL. This ensures that if
BR2_PACKAGE_PYTHON3_SSL is disabled, but BR2_PACKAGE_OPENSSL is enabled,
we still don't get the OpenSSL modules built, as the user would expect.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8bfae79..4ca049c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -90,6 +90,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
+else
+PYTHON3_CONF_OPTS += --disable-openssl
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
