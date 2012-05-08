From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 May 2012 11:27:19 +0200
Subject: [Buildroot] [PATCH 1/4] blackfin: adjust available ABIs
Message-ID: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FLAT (Separate Data) and FLAT Shared ABIs are rarely used, and the
FLAT Shared ABI requires the user to manually assign an unique ID to
each shared library, which we will never support in
Buildroot. Therefore, restrict ourselves to FLAT and FDPIC.

In addition to this, ensure that when FLAT is selected, only static
libraries are produced, because this is what FLAT supports. It will
fix problems such as
http://autobuild.buildroot.org/results/2d756d75162e8737e99df8189bde93ed1a09feef/build-end.log.

Moreover, we make FDPIC the default ABI, since if someone is using
Buildroot, it's most likely to generate a fairly elaborate embedded
Linux system, on which shared libraries are probably useful.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 941cd1b..a42bfd6 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -228,15 +228,12 @@ endchoice
 choice
 	prompt "Target ABI"
 	depends on BR2_bfin
-	default BR2_BFIN_FLAT
+	default BR2_BFIN_FDPIC
 config BR2_BFIN_FDPIC
 	bool "FDPIC"
 config BR2_BFIN_FLAT
 	bool "FLAT"
-config BR2_BFIN_FLAT_SEP_DATA
-	bool "FLAT (Separate data)"
-config BR2_BFIN_SHARED_FLAT
-	bool "Shared FLAT"
+	select BR2_PREFER_STATIC_LIB
 endchoice
 
 choice
-- 
1.7.9.5
