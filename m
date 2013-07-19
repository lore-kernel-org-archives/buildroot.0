From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 08:32:39 +0200
Subject: [Buildroot] [git commit] toolchain: instrument external toolchain
	wrapper
Message-ID: <20130719063318.459299A62E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aaa06aaa82787b77ea56a7664cb4b0a22eca5c31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR_DEBUG_WRAPPER is set in the envirnment, dump the actual command
being exec()uted, to ease debugging issues with the wrapper.

[Peter: adjust code style and output format to be cut'n'paste compatible]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../toolchain-external/ext-toolchain-wrapper.c     |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 460f255..befd735 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -136,6 +136,15 @@ int main(int argc, char **argv)
 	/* finish with NULL termination */
 	*cur = NULL;
 
+	if (getenv("BR_DEBUG_WRAPPER")) {
+		fprintf(stderr, "Executing");
+
+		for (i = 0; args[i]; i++)
+			fprintf(stderr, " %s", args[i]);
+
+		fprintf(stderr, "\n");
+	}
+
 	if (execv(path, args))
 		perror(path);
 
