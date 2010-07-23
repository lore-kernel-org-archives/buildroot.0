From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Jul 2010 14:27:30 +0200
Subject: [Buildroot] [git commit master 1/1] kconfig: implement
	KCONFIG_PROBABILITY for rand{, package}config
Message-ID: <20100723122842.821048295D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3435c1afb58307240be8e4607b5bb7d239fac4e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rand{,package}config enables configuration options with 50% probability,
which isn't always what we want in BR (because the "big" configs take a
long time to build and limits the chance of a randconfig detecting a
missing dependency), so introduce a KCONFIG_PROBABILITY environment
variable to tweak the probability between 0 (all options off) and 100
(all options on).

To use, simply set the environment variable before running make or pass
it on the make command line - E.G.

make randpackageconfig KCONFIG_PROBABILITY=10

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/confdata.c |   22 +++++++++++++++++++---
 1 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/config/confdata.c b/package/config/confdata.c
index 728f708..3842470 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -845,7 +845,16 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 	struct symbol *sym, *csym;
 	struct property *prop;
 	struct expr *e;
-	int i, cnt, def;
+	int i, cnt, def, prob = 50;
+
+	if (mode == def_random) {
+		char *endp, *env = getenv("KCONFIG_PROBABILITY");
+		if (env && *env) {
+			int tmp = (int)strtol(env, &endp, 10);
+			if (*endp == '\0' && tmp >= 0 && tmp <= 100)
+				prob = tmp;
+		}
+	}
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym))
@@ -864,8 +873,15 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
-				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
-				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
+				cnt = (rand() % 100) - (100 - prob);
+				if (cnt < 0)
+					sym->def[S_DEF_USER].tri = no;
+				else
+					if ((sym_get_type(sym) == S_TRISTATE)
+					    && (cnt > prob/2))
+						sym->def[S_DEF_USER].tri = mod;
+					else
+						sym->def[S_DEF_USER].tri = yes;
 				break;
 			default:
 				continue;
-- 
1.7.1
