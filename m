From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:29:55 +0100
Subject: [Buildroot] [git commit] package/exim: fix target build on some
 toolchains
Message-ID: <20200211223133.BB3FF8DAAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ae3400e1cf91112b58361b3e59a037b883e2c10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building with the Sourcery CodeBench ARM 2014.05 the build fails with this
error:

  >>> exim_dbmbuild utility built

  .../buildroot/output/host/bin/arm-none-linux-gnueabi-gcc -DEXIM_DUMPDB exim_dbutil.c
  exim_dbutil.c: In function 'main':
  exim_dbutil.c:568:1: error: 'for' loop initial declarations are only allowed in C99 mode
   for (uschar * key = dbfn_scan(dbm, TRUE, &cursor);
   ^
  exim_dbutil.c:568:1: note: use option -std=c99 or -std=gnu99 to compile your code
  exim_dbutil.c:630:2: error: 'for' loop initial declarations are only allowed in C99 mode
    for (int i = 1; i <= wait->count; i++)
    ^
  exim_dbutil.c:642:6: error: 'for' loop initial declarations are only allowed in C99 mode
        for (int j = 0; j < MESSAGE_ID_LENGTH; j++)
        ^

Fix by enforcing C99. This completes commit
2c692e81a844b30b4d3161dfd9897b3265bb9279 ("package/exim: fix host build")
to also fix target builds.

Fixes: http://autobuild.buildroot.net/results/6b7e08090f5f0f2627cc3e89b349c2052b6e3116/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index c07d6f919c..0ad9a8de80 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -127,7 +127,8 @@ define EXIM_BUILD_CMDS
 		LNCC=$(HOSTCC) \
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
-	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
+	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) \
+		CFLAGS="-std=c99 $(TARGET_CFLAGS)"
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
