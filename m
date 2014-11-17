From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 23:33:16 +0100
Subject: [Buildroot] [PATCH] pakage/erlang: fix host build without termcap
	(curses) library
Message-ID: <1416263596-11129-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do not need termcap (curses) support in the host variant of erlang.

Fixes a bunch of autobuild failures;
    http://autobuild.buildroot.net/results/4be/4bef658b6815929058c769037211f7e0fc8d1f9c/
    http://autobuild.buildroot.net/results/726/72619ed15590a3a5a41b7c398d973766ecab0a2e/
    http://autobuild.buildroot.net/results/366/366439438549d5f7656be72f71dae3bb5f99c6b2/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nathaniel Roach <nroach44@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Cc-ing Nathaniel, as all failures happen on his build server. Thomas and
Nathaniel, could you please review the setting of that autobuild server?
And the others as well?

It seems legit ncurses is missing on a build server, but we did not notice,
because we do require it for menuconfig and nconfig, so virtually everyone
has it, and it is most probably installed on other autobuild servers
because owners want to be able to run menuconfig on them to debug stuff.

Care to have a look, please?

Regards,
Yann E. MORIN.
---
 package/erlang/erlang.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index e6899de..ef0e0a2 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -27,6 +27,8 @@ ERLANG_CONF_OPTS = --without-javac
 HOST_ERLANG_DEPENDENCIES = host-openssl
 HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)/usr
 
+HOST_ERLANG_CONF_OPTS += --without-termcap
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 ERLANG_CONF_OPTS += --with-termcap
 ERLANG_DEPENDENCIES += ncurses
-- 
1.9.1
