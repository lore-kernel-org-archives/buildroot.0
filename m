From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Dec 2014 23:04:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/nginx: remove rtsig module
	support
In-Reply-To: <1417471496-7391-1-git-send-email-s.martin49@gmail.com>
References: <1417471496-7391-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1417471496-7391-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rtsig module uses the deprecated sysctl syscall, which is not
implemented on some recent architecture (such as arc).

Also, rtsig module is almost consider as deprecated by some nginx
developers [1].

So, just remove this option.

Fixes:
  http://autobuild.buildroot.org/results/730/730105fc0a89b381b3b29192d07f28ef1f13cbb3/

[1] http://mailman.nginx.org/pipermail/nginx-devel/2014-November/006295.html

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- just remove rtsig option (instead of adding sysctl check in nginx)
---
 package/nginx/Config.in | 5 -----
 package/nginx/nginx.mk  | 1 -
 2 files changed, 6 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index ddab0ca..c2a6af1 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -309,11 +309,6 @@ endif #BR2_PACKAGE_NGINX_MAIL
 
 comment "misc. modules"
 
-config BR2_PACKAGE_NGINX_RTSIG_MODULE
-	bool "ngx_rtsig_module"
-	help
-	  Enable ngx_rtsig_module
-
 config BR2_PACKAGE_NGINX_SELECT_MODULE
 	bool "ngx_select_module"
 	help
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 55ae844..06f1312 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -88,7 +88,6 @@ endif
 
 # misc. modules
 NGINX_CONF_OPTS += \
-	$(if $(BR2_PACKAGE_NGINX_RTSIG_MODULE),--with-rtsig_module) \
 	$(if $(BR2_PACKAGE_NGINX_SELECT_MODULE),--with-select_module,--without-select_module) \
 	$(if $(BR2_PACKAGE_NGINX_POLL_MODULE),--with-poll_module,--without-poll_module)
 
-- 
2.1.3
