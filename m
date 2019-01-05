From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 05 Jan 2019 18:27:06 +0000
Subject: [Buildroot] [Bug 11576] Unable to start apache with event MPM on
 raspberry pi 3
In-Reply-To: <bug-11576-163@https.bugs.busybox.net/>
References: <bug-11576-163@https.bugs.busybox.net/>
Message-ID: <bug-11576-163-96ZtVpU379@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11576

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Apache is based on apr and apr has some configure runtime checks for some
features, e.g. epoll, failing for the cross compile.

Quick test with the following (buildroot) patch enables successful apache
startup again:

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 58b1d86b28..8f29e57c59 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -26,7 +26,12 @@ APR_CONF_ENV = \
        ac_cv_sizeof_pid_t=4 \
        ac_cv_struct_rlimit=yes \
        ac_cv_o_nonblock_inherited=no \
-       apr_cv_mutex_recursive=yes
+       apr_cv_mutex_recursive=yes \
+       apr_cv_epoll=yes \
+       apr_cv_epoll_create1=yes \
+       apr_cv_dup3=yes \
+       apr_cv_sock_cloexec=yes \
+       apr_cv_accept4=yes
 APR_CONFIG_SCRIPTS = apr-1-config

 # Doesn't even try to guess when cross compiling

Tested with raspberrypi3_qt5we_defconfig and the following two
additional config options:

BR2_PACKAGE_APACHE=y
BR2_PACKAGE_APACHE_MPM_EVENT=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
