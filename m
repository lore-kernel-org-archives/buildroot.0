From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 16:42:42 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/wrapper: extend paranoid check to
	-isystem
In-Reply-To: <1471444962-32200-1-git-send-email-yann.morin.1998@free.fr>
References: <1471444962-32200-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1471444962-32200-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages, like libbsd, use -isystem flags to provide so-called
overrides to the system include files. In this particular case, this
is used in a .pc file, then used by antoher package; pkgconf does not
mangle this path; and eventually that other package ends up using
/usr/include/bsd to search for headers.

Our current toolchain wrapper is limited to looking fo -I and -L, so
the paranoid check does not kick in.

Extend the paranoid check to also look for the -isystem option.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/toolchain-wrapper.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index b8b3cbe..8a9c3b3 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -241,17 +241,19 @@ int main(int argc, char **argv)
 	/* Check for unsafe library and header paths */
 	for (i = 1; i < argc; i++) {
 
-		/* Skip options that do not start with -I and -L */
-		if (strncmp(argv[i], "-I", 2) && strncmp(argv[i], "-L", 2))
+		/* Skip options that do not start with -I, -isystem or -L */
+		if (   strncmp(argv[i], "-I", 2)
+		    && strncmp(argv[i], "-L", 2)
+		    && strcmp(argv[i], "-isystem"))
 			continue;
 
-		/* We handle two cases: first the case where -I/-L and
-		 * the path are separated by one space and therefore
-		 * visible as two separate options, and then the case
-		 * where they are stuck together forming one single
-		 * option.
+		/* We handle two cases: first the case where -I/-L/-isystem
+		 * and the path are separated by one space and therefore
+		 * visible as two separate options, and then the case  where
+		 * they are stuck together forming one single option.
+		 * -isystem is necessarily in the first case.
 		 */
-		if (argv[i][2] == '\0') {
+		if (argv[i][2] == '\0' || argv[i][1] == 'i') {
 			i++;
 			if (i == argc)
 				continue;
-- 
2.7.4
