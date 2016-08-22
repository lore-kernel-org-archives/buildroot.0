From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 00:08:13 +0200
Subject: [Buildroot] [git commit] m68k: disable BR2_BINFMT_FLAT_SEP_DATA for
	coldfire
Message-ID: <20160822220917.A3163800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=446177237c98e5f222571f771b8c4dc5c99afb27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_BINFMT_FLAT_SEP_DATA can be used to create XIP userland and works fine
for m68k. Unfortunately a lot of basic packages as pcre are not compileable
because of a CPU or hardware limitation. The reason for failing are very
big functions used in the libraries or application code.

Typical errors are:

Fatal error: Tried to convert PC relative branch to absolute jump
or
error: value -yyyyy out of range

Add kernel patch from 4ec5542679264bc06a0356ef92f06ad7a0abe06d to make
BR2_BINFMT_FLAT_ONE compiled firmware work fine.

Fixes:
  http://autobuild.buildroot.net/results/20b/20b1586757450d6aad8583ad7a787a7ca11acef1/
  http://autobuild.buildroot.net/results/d31/d311955ada1ffcd7f69e82965c8fe33eabe488cd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: add comment in Config.in file about sep-data existing on m68k,
but being disabled due to build issues with numerous packages.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 8000dca..3caca15 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -336,7 +336,12 @@ config BR2_BINFMT_FLAT_ONE
 
 config BR2_BINFMT_FLAT_SEP_DATA
 	bool "Separate data and code region"
-	depends on BR2_m68k || BR2_bfin
+	# this FLAT binary type technically exists on m68k, but fails
+	# to build numerous packages: due to architecture limitation,
+	# big functions cannot be built in this mode. They cause build
+	# failures such as "Tried to convert PC relative branch to
+	# absolute jump" or "error: value -yyyyy out of range".
+	depends on BR2_bfin
 	help
 	  Allow for the data and text segments to be separated and placed in
 	  different regions of memory.
