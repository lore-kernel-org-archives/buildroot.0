From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Mar 2011 20:51:48 +0200
Subject: [Buildroot] [git commit master 1/1] package/config;
	br2_symbol_printer(): fix off-by-1 in string handling
Message-ID: <20110330185519.067E881D41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ef31b16c1ad68eaa8ceb34f38333e12b4ab8871
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by bbj17 at gmx.de.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/patches/08-make-write-deps.patch |    6 +++---
 package/config/util.c                           |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/config/patches/08-make-write-deps.patch b/package/config/patches/08-make-write-deps.patch
index 0f9c7e3..b69daad 100644
--- a/package/config/patches/08-make-write-deps.patch
+++ b/package/config/patches/08-make-write-deps.patch
@@ -16,12 +16,12 @@ Index: config/util.c
 +	char *ret;
 +	if (len < 1)
 +		return NULL;
-+	ret = malloc(len);
++	ret = malloc(len+1);
 +	if (!ret) {
 +		printf("Out of memory!");
 +		exit(1);
 +	}
-+	memset(ret, 0, len);
++	memset(ret, 0, len+1);
 +	i = j = 0;
 +	if (strncmp("BR2_", in, 4) == 0)
 +		i += 4;
@@ -34,7 +34,7 @@ Index: config/util.c
 +	return ret;
 +}
 +
-+/* write dependencies of the infividual config-symbols */
++/* write dependencies of the individual config-symbols */
 +static int write_make_deps(const char *name)
 +{
 +	char *str;
diff --git a/package/config/util.c b/package/config/util.c
index 5fc36c7..f962cef 100644
--- a/package/config/util.c
+++ b/package/config/util.c
@@ -35,12 +35,12 @@ static char* br2_symbol_printer(const char * const in)
 	char *ret;
 	if (len < 1)
 		return NULL;
-	ret = malloc(len);
+	ret = malloc(len+1);
 	if (!ret) {
 		printf("Out of memory!");
 		exit(1);
 	}
-	memset(ret, 0, len);
+	memset(ret, 0, len+1);
 	i = j = 0;
 	if (strncmp("BR2_", in, 4) == 0)
 		i += 4;
@@ -53,7 +53,7 @@ static char* br2_symbol_printer(const char * const in)
 	return ret;
 }
 
-/* write dependencies of the infividual config-symbols */
+/* write dependencies of the individual config-symbols */
 static int write_make_deps(const char *name)
 {
 	char *str;
-- 
1.7.3.4
