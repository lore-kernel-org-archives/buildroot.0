From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:26:58 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/polkit: add
 upstream fix for SIGTTOU
Message-ID: <20200506051932.33D04882AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bad149c07ca996f5dca8dfca20cd2feaa91cfa8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

If tty_handler() resets terminal while pkttyagent is run in background job,
the process gets stopped by SIGTTOU. This impacts systemctl, hence it must
be blocked for a while and then the process gets killed anyway.

Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d749be3e1c144ed711908da49dac9f274bfc996)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...03-polkit-0.116-pkttyagent-sigttou-bg-job.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch b/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
new file mode 100644
index 0000000000..fb41df3af2
--- /dev/null
+++ b/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
@@ -0,0 +1,34 @@
+From 76aae4fce586b400f5fe08df31497db19d624609 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Thu, 1 Aug 2019 06:46:10 +0000
+Subject: [PATCH] pkttyagent: process stopped by SIGTTOU if run in background
+ job
+
+
+(cherry picked from commit 76aae4fce586b400f5fe08df31497db19d624609)
+Signed-off-by: Jan Rybar <jrybar@redhat.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ src/programs/pkttyagent.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/programs/pkttyagent.c b/src/programs/pkttyagent.c
+index 3c8d502..13879a2 100644
+--- a/src/programs/pkttyagent.c
++++ b/src/programs/pkttyagent.c
+@@ -264,6 +264,12 @@ main (int argc, char *argv[])
+ 
+   memset (&sa, 0, sizeof (sa));
+   sa.sa_handler = &tty_handler;
++/* If tty_handler() resets terminal while pkttyagent is run in background job,
++   the process gets stopped by SIGTTOU. This impacts systemctl, hence it must
++   be blocked for a while and then the process gets killed anyway.
++ */
++  sigemptyset(&sa.sa_mask);
++  sigaddset(&sa.sa_mask, SIGTTOU);
+   sigaction (SIGTERM, &sa, &savesigterm);
+   sigaction (SIGINT, &sa, &savesigint);
+   sigaction (SIGTSTP, &sa, &savesigtstp);
+-- 
+2.24.1
+
