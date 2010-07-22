From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 14:17:51 +0200
Subject: [Buildroot] [git commit master 1/1] kconfig: make rand{,
	package}config fair
Message-ID: <20100722121811.311D781865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7705e6e4150a5271f574c52c5a76b75116dc0875
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Give each boolean symbol a 50% chance of getting enabled, rather than 67%.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/confdata.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/config/confdata.c b/package/config/confdata.c
index 51a3d9a..728f708 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -864,7 +864,8 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
-				sym->def[S_DEF_USER].tri = (tristate)(rand() % 3);
+				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
+				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
 				break;
 			default:
 				continue;
-- 
1.7.1
