From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 18:02:52 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/putty: bump to
 version 0.72
Message-ID: <20191002155813.9CF9B88097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0fa5898e12a2e22dc0f83136c22be9f9571b88f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Drop upstream patches.

Remove autoreconf; we no longer patch configure.ac.

Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2047dd9d228b07f190f6367ac2833e86cff3fcb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-compilation-with-NO_GSSAPI.patch      | 266 ---------------------
 .../0002-unix-uxpoll-need-_XOPEN_SOURCE.patch      |  39 ---
 package/putty/0003-Fix-uClibc-build-issues.patch   |  93 -------
 package/putty/putty.hash                           |   6 +-
 package/putty/putty.mk                             |   4 +-
 5 files changed, 4 insertions(+), 404 deletions(-)

diff --git a/package/putty/0001-Fix-compilation-with-NO_GSSAPI.patch b/package/putty/0001-Fix-compilation-with-NO_GSSAPI.patch
deleted file mode 100644
index 56a29e19dc..0000000000
--- a/package/putty/0001-Fix-compilation-with-NO_GSSAPI.patch
+++ /dev/null
@@ -1,266 +0,0 @@
-From 7ad08649a223a4cd61e67d8334a147f55c79399d Mon Sep 17 00:00:00 2001
-From: Jacob Nevins <jacobn@chiark.greenend.org.uk>
-Date: Mon, 25 Mar 2019 23:46:59 +0000
-Subject: [PATCH] Fix compilation with NO_GSSAPI.
-
-This is a fairly shallow patch, which removes the UI and interactions
-with external libraries. Some other machinery (which is dead code in
-this configuration) is left in place.
-
-Adapted by me from a patch by Jeroen Roovers.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 7ad08649a22
-
- config.c        |  4 ++++
- settings.c      | 12 ++++++++++--
- ssh.c           | 16 +++++++++++++++-
- ssh2transport.c |  3 +--
- ssh2userauth.c  |  8 ++++++--
- sshserver.c     | 13 ++++++++++++-
- 6 files changed, 48 insertions(+), 8 deletions(-)
-
-diff --git a/config.c b/config.c
-index 9c299feecc21..6528a9696584 100644
---- a/config.c
-+++ b/config.c
-@@ -2442,10 +2442,12 @@ void setup_config_box(struct controlbox *b, bool midsession,
- 			      HELPCTX(ssh_kexlist),
- 			      kexlist_handler, P(NULL));
-             c->listbox.height = KEX_MAX;
-+#ifndef NO_GSSAPI
- 	    ctrl_checkbox(s, "Attempt GSSAPI key exchange",
- 			  'k', HELPCTX(ssh_gssapi),
- 			  conf_checkbox_handler,
- 			  I(CONF_try_gssapi_kex));
-+#endif
- 
- 	    s = ctrl_getset(b, "Connection/SSH/Kex", "repeat",
- 			    "Options controlling key re-exchange");
-@@ -2455,11 +2457,13 @@ void setup_config_box(struct controlbox *b, bool midsession,
- 			 conf_editbox_handler,
- 			 I(CONF_ssh_rekey_time),
- 			 I(-1));
-+#ifndef NO_GSSAPI
-             ctrl_editbox(s, "Minutes between GSS checks (0 for never)", NO_SHORTCUT, 20,
-                          HELPCTX(ssh_kex_repeat),
-                          conf_editbox_handler,
-                          I(CONF_gssapirekey),
-                          I(-1));
-+#endif
- 	    ctrl_editbox(s, "Max data before rekey (0 for no limit)", 'x', 20,
- 			 HELPCTX(ssh_kex_repeat),
- 			 conf_editbox_handler,
-diff --git a/settings.c b/settings.c
-index 8d56302677d9..54f5ab7b2919 100644
---- a/settings.c
-+++ b/settings.c
-@@ -592,21 +592,25 @@ void save_open_settings(settings_w *sesskey, Conf *conf)
-     write_setting_b(sesskey, "Compression", conf_get_bool(conf, CONF_compression));
-     write_setting_b(sesskey, "TryAgent", conf_get_bool(conf, CONF_tryagent));
-     write_setting_b(sesskey, "AgentFwd", conf_get_bool(conf, CONF_agentfwd));
-+#ifndef NO_GSSAPI
-     write_setting_b(sesskey, "GssapiFwd", conf_get_bool(conf, CONF_gssapifwd));
-+#endif
-     write_setting_b(sesskey, "ChangeUsername", conf_get_bool(conf, CONF_change_username));
-     wprefs(sesskey, "Cipher", ciphernames, CIPHER_MAX, conf, CONF_ssh_cipherlist);
-     wprefs(sesskey, "KEX", kexnames, KEX_MAX, conf, CONF_ssh_kexlist);
-     wprefs(sesskey, "HostKey", hknames, HK_MAX, conf, CONF_ssh_hklist);
-     write_setting_i(sesskey, "RekeyTime", conf_get_int(conf, CONF_ssh_rekey_time));
-+#ifndef NO_GSSAPI
-     write_setting_i(sesskey, "GssapiRekey", conf_get_int(conf, CONF_gssapirekey));
-+#endif
-     write_setting_s(sesskey, "RekeyBytes", conf_get_str(conf, CONF_ssh_rekey_data));
-     write_setting_b(sesskey, "SshNoAuth", conf_get_bool(conf, CONF_ssh_no_userauth));
-     write_setting_b(sesskey, "SshBanner", conf_get_bool(conf, CONF_ssh_show_banner));
-     write_setting_b(sesskey, "AuthTIS", conf_get_bool(conf, CONF_try_tis_auth));
-     write_setting_b(sesskey, "AuthKI", conf_get_bool(conf, CONF_try_ki_auth));
-+#ifndef NO_GSSAPI
-     write_setting_b(sesskey, "AuthGSSAPI", conf_get_bool(conf, CONF_try_gssapi_auth));
-     write_setting_b(sesskey, "AuthGSSAPIKEX", conf_get_bool(conf, CONF_try_gssapi_kex));
--#ifndef NO_GSSAPI
-     wprefs(sesskey, "GSSLibs", gsslibkeywords, ngsslibs, conf, CONF_ssh_gsslist);
-     write_setting_filename(sesskey, "GSSCustom", conf_get_filename(conf, CONF_ssh_gss_custom));
- #endif
-@@ -937,7 +941,9 @@ void load_open_settings(settings_r *sesskey, Conf *conf)
-     gppb(sesskey, "TryAgent", true, conf, CONF_tryagent);
-     gppb(sesskey, "AgentFwd", false, conf, CONF_agentfwd);
-     gppb(sesskey, "ChangeUsername", false, conf, CONF_change_username);
-+#ifndef NO_GSSAPI
-     gppb(sesskey, "GssapiFwd", false, conf, CONF_gssapifwd);
-+#endif
-     gprefs(sesskey, "Cipher", "\0",
- 	   ciphernames, CIPHER_MAX, conf, CONF_ssh_cipherlist);
-     {
-@@ -990,7 +996,9 @@ void load_open_settings(settings_r *sesskey, Conf *conf)
-     gprefs(sesskey, "HostKey", "ed25519,ecdsa,rsa,dsa,WARN",
-            hknames, HK_MAX, conf, CONF_ssh_hklist);
-     gppi(sesskey, "RekeyTime", 60, conf, CONF_ssh_rekey_time);
-+#ifndef NO_GSSAPI
-     gppi(sesskey, "GssapiRekey", GSS_DEF_REKEY_MINS, conf, CONF_gssapirekey);
-+#endif
-     gpps(sesskey, "RekeyBytes", "1G", conf, CONF_ssh_rekey_data);
-     {
- 	/* SSH-2 only by default */
-@@ -1007,9 +1015,9 @@ void load_open_settings(settings_r *sesskey, Conf *conf)
-     gppb(sesskey, "SshBanner", true, conf, CONF_ssh_show_banner);
-     gppb(sesskey, "AuthTIS", false, conf, CONF_try_tis_auth);
-     gppb(sesskey, "AuthKI", true, conf, CONF_try_ki_auth);
-+#ifndef NO_GSSAPI
-     gppb(sesskey, "AuthGSSAPI", true, conf, CONF_try_gssapi_auth);
-     gppb(sesskey, "AuthGSSAPIKEX", true, conf, CONF_try_gssapi_kex);
--#ifndef NO_GSSAPI
-     gprefs(sesskey, "GSSLibs", "\0",
- 	   gsslibkeywords, ngsslibs, conf, CONF_ssh_gsslist);
-     gppfile(sesskey, "GSSCustom", conf, CONF_ssh_gss_custom);
-diff --git a/ssh.c b/ssh.c
-index e35ebc64e2b5..e8ad61b8085d 100644
---- a/ssh.c
-+++ b/ssh.c
-@@ -50,7 +50,9 @@ struct Ssh {
-     ssh_sharing_state *connshare;
-     bool attempting_connshare;
- 
-+#ifndef NO_GSSAPI
-     struct ssh_connection_shared_gss_state gss_state;
-+#endif
- 
-     char *savedhost;
-     int savedport;
-@@ -252,10 +254,18 @@ static void ssh_got_ssh_version(struct ssh_version_receiver *rcv,
-                     conf_get_bool(ssh->conf, CONF_tryagent), username,
-                     conf_get_bool(ssh->conf, CONF_change_username),
-                     conf_get_bool(ssh->conf, CONF_try_ki_auth),
-+#ifndef NO_GSSAPI
-                     conf_get_bool(ssh->conf, CONF_try_gssapi_auth),
-                     conf_get_bool(ssh->conf, CONF_try_gssapi_kex),
-                     conf_get_bool(ssh->conf, CONF_gssapifwd),
--                    &ssh->gss_state);
-+                    &ssh->gss_state
-+#else
-+                    false,
-+                    false,
-+                    false,
-+                    NULL
-+#endif
-+                    );
-                 ssh_connect_ppl(ssh, userauth_layer);
-                 transport_child_layer = userauth_layer;
- 
-@@ -267,7 +277,11 @@ static void ssh_got_ssh_version(struct ssh_version_receiver *rcv,
-                 ssh->fullhostname,
-                 ssh_verstring_get_local(old_bpp),
-                 ssh_verstring_get_remote(old_bpp),
-+#ifndef NO_GSSAPI
-                 &ssh->gss_state,
-+#else
-+                NULL,
-+#endif
-                 &ssh->stats, transport_child_layer, false);
-             ssh_connect_ppl(ssh, ssh->base_layer);
- 
-diff --git a/ssh2transport.c b/ssh2transport.c
-index 8640d89d4be4..5e8955a0275f 100644
---- a/ssh2transport.c
-+++ b/ssh2transport.c
-@@ -1781,6 +1781,7 @@ static void ssh2_transport_gss_update(struct ssh2_transport_state *s,
-     if (mins > 0 && s->gss_ctxt_lifetime <= mins * 60)
-         s->gss_status |= GSS_CTXT_EXPIRES;
- }
-+#endif /* NO_GSSAPI */
- 
- ptrlen ssh2_transport_get_session_id(PacketProtocolLayer *ppl)
- {
-@@ -1805,8 +1806,6 @@ void ssh2_transport_notify_auth_done(PacketProtocolLayer *ppl)
-     queue_idempotent_callback(&s->ppl.ic_process_queue);
- }
- 
--#endif /* NO_GSSAPI */
--
- static bool ssh2_transport_get_specials(
-     PacketProtocolLayer *ppl, add_special_fn_t add_special, void *ctx)
- {
-diff --git a/ssh2userauth.c b/ssh2userauth.c
-index fc4139230557..7f5a129295ab 100644
---- a/ssh2userauth.c
-+++ b/ssh2userauth.c
-@@ -613,8 +613,10 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                  * Scan it for method identifiers we know about.
-                  */
-                 bool srv_pubkey = false, srv_passwd = false;
--                bool srv_keyb_inter = false, srv_gssapi = false;
--                bool srv_gssapi_keyex_auth = false;
-+                bool srv_keyb_inter = false;
-+#ifndef NO_GSSAPI
-+                bool srv_gssapi = false, srv_gssapi_keyex_auth = false;
-+#endif
- 
-                 for (ptrlen method; get_commasep_word(&methods, &method) ;) {
-                     if (ptrlen_eq_string(method, "publickey"))
-@@ -623,10 +625,12 @@ static void ssh2_userauth_process_queue(PacketProtocolLayer *ppl)
-                         srv_passwd = true;
-                     else if (ptrlen_eq_string(method, "keyboard-interactive"))
-                         srv_keyb_inter = true;
-+#ifndef NO_GSSAPI
-                     else if (ptrlen_eq_string(method, "gssapi-with-mic"))
-                         srv_gssapi = true;
-                     else if (ptrlen_eq_string(method, "gssapi-keyex"))
-                         srv_gssapi_keyex_auth = true;
-+#endif
-                 }
- 
-                 /*
-diff --git a/sshserver.c b/sshserver.c
-index 5f6e7ddeeaec..5c34bb356757 100644
---- a/sshserver.c
-+++ b/sshserver.c
-@@ -50,7 +50,9 @@ struct server {
-     PacketProtocolLayer *base_layer;
-     ConnectionLayer *cl;
- 
-+#ifndef NO_GSSAPI
-     struct ssh_connection_shared_gss_state gss_state;
-+#endif
- };
- 
- static void ssh_server_free_callback(void *vsrv);
-@@ -245,9 +247,11 @@ Plug *ssh_server_plug(
-     bufchain_init(&srv->out_raw);
-     bufchain_init(&srv->dummy_user_input);
- 
-+#ifndef NO_GSSAPI
-     /* FIXME: replace with sensible */
-     srv->gss_state.libs = snew(struct ssh_gss_liblist);
-     srv->gss_state.libs->nlibraries = 0;
-+#endif
- 
-     return &srv->plug;
- }
-@@ -297,7 +301,9 @@ static void ssh_server_free_callback(void *vsrv)
-     conf_free(srv->conf);
-     log_free(srv->logctx);
- 
-+#ifndef NO_GSSAPI
-     sfree(srv->gss_state.libs);        /* FIXME: replace with sensible */
-+#endif
- 
-     sfree(srv);
- 
-@@ -442,7 +448,12 @@ static void server_got_ssh_version(struct ssh_version_receiver *rcv,
-             srv->conf, NULL, 0, NULL,
-             ssh_verstring_get_remote(old_bpp),
-             ssh_verstring_get_local(old_bpp),
--            &srv->gss_state, &srv->stats, transport_child_layer, true);
-+#ifndef NO_GSSAPI
-+            &srv->gss_state,
-+#else
-+            NULL,
-+#endif
-+            &srv->stats, transport_child_layer, true);
-         ssh2_transport_provide_hostkeys(
-             srv->base_layer, srv->hostkeys, srv->nhostkeys);
-         if (userauth_layer)
--- 
-2.20.1
-
diff --git a/package/putty/0002-unix-uxpoll-need-_XOPEN_SOURCE.patch b/package/putty/0002-unix-uxpoll-need-_XOPEN_SOURCE.patch
deleted file mode 100644
index fb4b6c26e5..0000000000
--- a/package/putty/0002-unix-uxpoll-need-_XOPEN_SOURCE.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c1b9d07d39e33e40d2ad04be176367cf48271cfd Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 26 Mar 2019 20:00:45 +0200
-Subject: [PATCH] unix/uxpoll: need _XOPEN_SOURCE
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The code needs _XOPEN_SOURCE for some poll() flags.
-
-Fix this build failure with uClibc:
-
-./../unix/uxpoll.c: In function ???pollwrap_add_fd_rwx???:
-./../unix/uxpoll.c:75:32: error: ???POLLRDNORM??? undeclared (first use in this function); did you mean ???POLLNVAL????
- #define SELECT_R_IN (POLLIN  | POLLRDNORM | POLLRDBAND)
-                                ^
-./../unix/uxpoll.c:87:19: note: in expansion of macro ???SELECT_R_IN???
-         events |= SELECT_R_IN;
-                   ^~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: issue reported to upstream developers
-
- unix/uxpoll.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/unix/uxpoll.c b/unix/uxpoll.c
-index bbc5490d125d..6fe6ac7ba0c1 100644
---- a/unix/uxpoll.c
-+++ b/unix/uxpoll.c
-@@ -1,3 +1,4 @@
-+#define _XOPEN_SOURCE
- #include <poll.h>
- 
- #include "putty.h"
--- 
-2.20.1
-
diff --git a/package/putty/0003-Fix-uClibc-build-issues.patch b/package/putty/0003-Fix-uClibc-build-issues.patch
deleted file mode 100644
index ceefded976..0000000000
--- a/package/putty/0003-Fix-uClibc-build-issues.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 0554cfbb926a2ba26efda08865b270af8536e0bb Mon Sep 17 00:00:00 2001
-From: Simon Tatham <anakin@pobox.com>
-Date: Tue, 26 Mar 2019 20:03:09 +0200
-Subject: [PATCH] Fix uClibc build issues
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix two uClibc build failures.
-
-Missing sys/auxv.h header:
-
-./../unix/uxutils.c:5:10: fatal error: sys/auxv.h: No such file or directory
- #include <sys/auxv.h>
-          ^~~~~~~~~~~~
-
-Missing futimes() implementation:
-
-./../unix/uxsftpserver.c: In function ???uss_fsetstat???:
-./../unix/uxsftpserver.c:441:25: warning: implicit declaration of function ???futimes???; did you mean ???lutimes???? [-Wimplicit-function-declaration]
- #define FD_PREFIX(func) f ## func
-                         ^
-./../unix/uxsftpserver.c:435:17: note: in expansion of macro ???FD_PREFIX???
-             if (api_prefix(utimes)(api_arg, tv) < 0)                    \
-                 ^~~~~~~~~~
-./../unix/uxsftpserver.c:470:5: note: in expansion of macro ???SETSTAT_GUTS???
-     SETSTAT_GUTS(FD_PREFIX, fd, attrs, success);
-     ^~~~~~~~~~~~
-
-unix/uxsftpserver.o: In function `uss_fsetstat':
-uxsftpserver.c:(.text+0x1058): undefined reference to `futimes'
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: patch suggested by upstream developer Simon Tatham
-
- configure.ac        |  3 ++-
- unix/uxsftpserver.c | 10 ++++++++++
- unix/uxutils.c      |  3 ++-
- 3 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 35552ed24dbe..1949ef62f219 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -173,8 +173,9 @@ AC_CHECK_LIB(X11, XOpenDisplay,
-              [GTK_LIBS="-lX11 $GTK_LIBS"
-               AC_DEFINE([HAVE_LIBX11],[],[Define if libX11.a is available])])
- 
--AC_CHECK_FUNCS([getaddrinfo posix_openpt ptsname setresuid strsignal updwtmpx fstatat dirfd])
-+AC_CHECK_FUNCS([getaddrinfo posix_openpt ptsname setresuid strsignal updwtmpx fstatat dirfd futimes])
- AC_CHECK_DECLS([CLOCK_MONOTONIC], [], [], [[#include <time.h>]])
-+AC_CHECK_HEADERS([sys/auxv.h asm/hwcap.h])
- AC_SEARCH_LIBS([clock_gettime], [rt], [AC_DEFINE([HAVE_CLOCK_GETTIME],[],[Define if clock_gettime() is available])])
- 
- AC_CACHE_CHECK([for SO_PEERCRED and dependencies], [x_cv_linux_so_peercred], [
-diff --git a/unix/uxsftpserver.c b/unix/uxsftpserver.c
-index 6fab0ba090d6..a90344e04219 100644
---- a/unix/uxsftpserver.c
-+++ b/unix/uxsftpserver.c
-@@ -412,6 +412,16 @@ static void uss_fstat(SftpServer *srv, SftpReplyBuilder *reply,
-     }
- }
- 
-+#if !HAVE_FUTIMES
-+static inline int futimes(int fd, const struct timeval tv[2])
-+{
-+    /* If the OS doesn't support futimes(3) then we have to pretend it
-+     * always returns failure */
-+    errno = EINVAL;
-+    return -1;
-+}
-+#endif
-+
- /*
-  * The guts of setstat and fsetstat, macroised so that they can call
-  * fchown(fd,...) or chown(path,...) depending on parameters.
-diff --git a/unix/uxutils.c b/unix/uxutils.c
-index fcbcc4d422c1..f01bc2c14a2d 100644
---- a/unix/uxutils.c
-+++ b/unix/uxutils.c
-@@ -1,6 +1,7 @@
- #include "ssh.h"
- 
--#if defined __linux__ && (defined __arm__ || defined __aarch64__)
-+#if defined __linux__ && (defined __arm__ || defined __aarch64__) && \
-+    HAVE_SYS_AUXV_H && HAVE_ASM_HWCAP_H
- 
- #include <sys/auxv.h>
- #include <asm/hwcap.h>
--- 
-2.20.1
-
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 30f51848f8..7df3b2c666 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,6 +1,6 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.71/{sha256,sha512}sums
-sha256 2f931ce2f89780cc8ca7bbed90fcd22c44515d2773f5fa954069e209b48ec6b8                                                                 putty-0.71.tar.gz
-sha512 f8791210bd5925b26d51b13f0558eea15dbac40808051165b236d6436226f5c2b0aa7d69288ed9e2bddc1066455678cfd0af73ef6b715a136c42f3b6f754ac07 putty-0.71.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.72/{sha256,sha512}sums
+sha256 f236b5a26b0905809b3cd190158e8b95d81f86ad34fdd97a4312c1877f2cec5f                                                                 putty-0.72.tar.gz
+sha512 a963985e55dcd589c08ef51085808a6364629edd8ce6708ebdf516e0339a41b7f186f91d7d7f26b1fec03d60767f365246e6fa06e9ef042898355c2f90f355dd putty-0.72.tar.gz
 
 # Locally calculated
 sha256 b517b4a9504ba0f651d5e590245197b88d9a81d073905cc798cc9464c5ca7ba8  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 68622a5743..af82904f7f 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.71
+PUTTY_VERSION = 0.72
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CONF_OPTS = --disable-gtktest
 PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
-# Patching configure.ac
-PUTTY_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2
