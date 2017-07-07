From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 09:57:14 +0200
Subject: [Buildroot] [git commit] toolchain-wrapper: fix breakage after
	host/usr removal
Message-ID: <20170707075407.3DA887F984@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=015d68c84c9c6ad6f6d41f181d19d813f309088b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain wrapper, when called through PATH, strips the last three
levels of /proc/self/exe to find HOST_DIR. However, after the host/usr
removal, this should be just two levels.

The toolchain wrapper has different logic for when it is called with a
full path (i.e. $HOST_DIR/usr/bin/arm-linux-gcc) then when it is called
through the PATH (i.e. just arm-linux-gcc). The latter is never used
internally in Buildroot, that's why this wasn't discovered through
testing.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Mark Jackson <mpfj-list@newflow.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-wrapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 3a4455f..a73e6d6 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -192,7 +192,7 @@ int main(int argc, char **argv)
 		for (i = ret; i > 0; i--) {
 			if (absbasedir[i] == '/') {
 				absbasedir[i] = '\0';
-				if (++count == 3)
+				if (++count == 2)
 					break;
 			}
 		}
