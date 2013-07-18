From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2013 23:54:50 +0200
Subject: [Buildroot] [PATCHv2 4/4] toolchain: instrument external toolchain
	wrapper
In-Reply-To: <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
References: <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <1374184490-13855-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

If BR_DEBUG_WRAPPER is set in the envirnment, dump the actual command
being exec()uted, to ease debugging issues with the wrapper.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - style fixes (Thomas)
---
 toolchain/toolchain-external/ext-toolchain-wrapper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 460f255..8e56414 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -136,6 +136,14 @@ int main(int argc, char **argv)
 	/* finish with NULL termination */
 	*cur = NULL;
 
+	if( getenv("BR_DEBUG_WRAPPER") ) {
+		fprintf( stderr, "path='%s'\n", path );
+		int i;
+		for( i=0; args[i]; i++ ) {
+			fprintf(stderr, "argv[%d]='%s'\n", i, args[i] );
+		}
+	}
+
 	if (execv(path, args))
 		perror(path);
 
-- 
1.8.1.2
