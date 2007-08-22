From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 15:36:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssh
Message-ID: <20070822223605.3DE4EA459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 15:36:04 -0700 (Wed, 22 Aug 2007)
New Revision: 19663

Log:
- bump version to 4.6p1
- will need some program_invocation_name touchup, from the looks.
  Sounds like Ulf is supporting this: http://buildroot.uclibc.org/lists/buildroot/2007-August/004651.html
Ulf> Go ahead, since it is permanently broken.
  It was for ARM for the most part. Some others did work, fwiw.


Added:
   trunk/buildroot/package/openssh/openssh.002-SUSv-legacy.patch

Modified:
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssh/openssh.patch


Changeset:
Added: trunk/buildroot/package/openssh/openssh.002-SUSv-legacy.patch
===================================================================
--- trunk/buildroot/package/openssh/openssh.002-SUSv-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/openssh/openssh.002-SUSv-legacy.patch	2007-08-22 22:36:04 UTC (rev 19663)
@@ -0,0 +1,21 @@
+diff -rdup openssh-4.6p1.oorig/openbsd-compat/port-tun.c openssh-4.6p1/openbsd-compat/port-tun.c
+--- openssh-4.6p1.oorig/openbsd-compat/port-tun.c	2006-09-02 07:32:40.000000000 +0200
++++ openssh-4.6p1/openbsd-compat/port-tun.c	2007-06-28 16:08:42.000000000 +0200
+@@ -66,7 +66,7 @@ sys_tun_open(int tun, int mode)
+ 		return (-1);
+ 	}
+ 
+-	bzero(&ifr, sizeof(ifr));	
++	memset(&ifr, 0, sizeof(ifr));
+ 
+ 	if (mode == SSH_TUNMODE_ETHERNET) {
+ 		ifr.ifr_flags = IFF_TAP;
+@@ -212,7 +212,7 @@ sys_tun_infilter(struct Channel *c, char
+ 	if (len <= 0 || len > (int)(sizeof(rbuf) - sizeof(*af)))
+ 		return (-1);
+ 	ptr = (char *)&rbuf[0];
+-	bcopy(buf, ptr + sizeof(u_int32_t), len);
++	memmove(ptr + sizeof(u_int32_t), buf, len);
+ 	len += sizeof(u_int32_t);
+ 	af = (u_int32_t *)ptr;
+ 

Modified: trunk/buildroot/package/openssh/openssh.mk
===================================================================
--- trunk/buildroot/package/openssh/openssh.mk	2007-08-22 21:53:13 UTC (rev 19662)
+++ trunk/buildroot/package/openssh/openssh.mk	2007-08-22 22:36:04 UTC (rev 19663)
@@ -3,10 +3,10 @@
 # openssh
 #
 #############################################################
-OPENSSH_VERSION:=3.9p1
-OPENSSH_SITE:=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_DIR:=$(BUILD_DIR)/openssh-$(OPENSSH_VERSION)
-OPENSSH_SOURCE:=openssh-$(OPENSSH_VERSION).tar.gz
+OPENSSH_VERSION=4.6p1
+OPENSSH_SITE=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
+OPENSSH_DIR=$(BUILD_DIR)/openssh-$(OPENSSH_VERSION)
+OPENSSH_SOURCE=openssh-$(OPENSSH_VERSION).tar.gz
 
 $(DL_DIR)/$(OPENSSH_SOURCE):
 	$(WGET) -P $(DL_DIR) $(OPENSSH_SITE)/$(OPENSSH_SOURCE)
@@ -18,9 +18,10 @@
 	touch $@
 
 $(OPENSSH_DIR)/.configured: $(OPENSSH_DIR)/.unpacked
-	(cd $(OPENSSH_DIR); rm -rf config.cache; autoconf; \
+	(cd $(OPENSSH_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		LD=$(TARGET_CROSS)gcc \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -40,13 +41,14 @@
 		--disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx \
 		--without-x \
+		--disable-strip \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
 	touch $@
 
 $(OPENSSH_DIR)/ssh: $(OPENSSH_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OPENSSH_DIR)
+	$(MAKE) -C $(OPENSSH_DIR)
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/scp
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/sftp
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/sftp-server
@@ -60,9 +62,9 @@
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/sshd
 
 $(TARGET_DIR)/usr/bin/ssh: $(OPENSSH_DIR)/ssh
-	$(MAKE) CC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) install
-	mkdir -p $(TARGET_DIR)/etc/init.d/
-	cp $(OPENSSH_DIR)/S50sshd $(TARGET_DIR)/etc/init.d/
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) install
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	cp package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/
 	chmod a+x $(TARGET_DIR)/etc/init.d/S50sshd
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 

Modified: trunk/buildroot/package/openssh/openssh.patch
===================================================================
--- trunk/buildroot/package/openssh/openssh.patch	2007-08-22 21:53:13 UTC (rev 19662)
+++ trunk/buildroot/package/openssh/openssh.patch	2007-08-22 22:36:04 UTC (rev 19663)
@@ -9,217 +9,7 @@
  
  PATHS= -DSSHDIR=\"$(sysconfdir)\" \
  	-D_PATH_SSH_PROGRAM=\"$(SSH_PROGRAM)\" \
---- openssh-3.8p1/configure.ac.orig	2004-02-23 22:47:04.000000000 -0700
-+++ openssh-3.8p1/configure.ac	2004-03-19 01:41:47.000000000 -0700
-@@ -481,6 +481,9 @@
- 	[
- 		AC_MSG_RESULT(no)
- 		AC_MSG_ERROR([*** compiler cannot create working executables, check config.log ***])
-+	],
-+	[AC_MSG_RESULT(yes)
-+	AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
- 	]
- )
- 
-@@ -632,6 +635,9 @@
- 	  else
- 		AC_MSG_WARN([zlib version may have security problems])
- 	  fi
-+	],
-+	[AC_MSG_RESULT(yes)
-+	AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
- 	]
- )
- 
-@@ -696,6 +702,9 @@
- 	[
- 		AC_MSG_RESULT(no)
- 		AC_DEFINE(BROKEN_ONE_BYTE_DIRENT_D_NAME)
-+	],
-+	[AC_MSG_RESULT(yes)
-+	AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
- 	]
- )
- 
-@@ -727,6 +736,9 @@
- 				[
- 					AC_MSG_RESULT(no)
- 					AC_MSG_ERROR([** Incomplete or missing s/key libraries.])
-+				],
-+				[AC_MSG_RESULT(yes)
-+				AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
- 				])
- 		fi
- 	]
-@@ -840,7 +852,11 @@
- 		],
- 		[AC_MSG_RESULT(yes)],
- 		[AC_DEFINE(BROKEN_SETRESUID)
--		 AC_MSG_RESULT(not implemented)]
-+		 AC_MSG_RESULT(not implemented)
-+		 ],
-+		 [AC_MSG_RESULT(yes)
-+		 AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
-+		 ]
- 	)
- ])
- 
-@@ -854,7 +870,11 @@
- 		],
- 		[AC_MSG_RESULT(yes)],
- 		[AC_DEFINE(BROKEN_SETRESGID)
--		 AC_MSG_RESULT(not implemented)]
-+		 AC_MSG_RESULT(not implemented)
-+		 ],
-+		 [AC_MSG_RESULT(yes)
-+		 AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
-+		 ]
- 	)
- ])
- 
-@@ -890,6 +910,9 @@
- 			AC_MSG_RESULT(no)
- 			AC_DEFINE(BROKEN_SNPRINTF)
- 			AC_MSG_WARN([****** Your snprintf() function is broken, complain to your vendor])
-+		],
-+		[AC_MSG_RESULT(yes)
-+		AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
- 		]
- 	)
- fi
-@@ -963,7 +986,10 @@
- 		[
- 			AC_MSG_RESULT(no)
- 			AC_DEFINE(SSHD_ACQUIRES_CTTY)
--		]
-+		],
-+		 [AC_MSG_RESULT(yes)
-+		 AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
-+		 ]
- 	)
- fi
- 
-@@ -1096,6 +1122,10 @@
- 	[
- 		AC_MSG_RESULT(not found)
- 		AC_MSG_ERROR(OpenSSL version header not found.)
-+	],
-+	[
-+		ssl_header_ver="0x0090704fL (OpenSSL 0.9.7d 17 Mar 2004)"
-+		AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to $ssl_header_ver])
- 	]
- )
- 
-@@ -1129,6 +1159,10 @@
- 	[
- 		AC_MSG_RESULT(not found)
- 		AC_MSG_ERROR(OpenSSL library not found.)
-+	],
-+	[
-+		ssl_header_ver="0x0090704fL (OpenSSL 0.9.7d 17 Mar 2004)"
-+		AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to $ssl_library_ver])
- 	]
- )
- 
-@@ -1148,7 +1182,11 @@
- 		AC_MSG_ERROR([Your OpenSSL headers do not match your library.
- Check config.log for details.
- Also see contrib/findssl.sh for help identifying header/library mismatches.])
--	]
-+	],
-+	[
-+		AC_MSG_RESULT(yes)
-+		AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
-+  	]
- )
- 
- # Some systems want crypt() from libcrypt, *not* the version in OpenSSL,
-@@ -1183,6 +1221,11 @@
- 		# Default to use of the rand helper if OpenSSL doesn't
- 		# seed itself
- 		USE_RAND_HELPER=yes
-+	],
-+	[
-+		OPENSSL_SEEDS_ITSELF=yes
-+		AC_MSG_RESULT(yes)
-+		AC_MSG_WARN([Cannot run test when crosscompiling, defaulted to yes.])
- 	]
- )
- 
-@@ -1773,7 +1816,8 @@
- #else
- main() { exit(0); }
- #endif
--		], [ true ], [ AC_DEFINE(BROKEN_SNPRINTF) ]
-+		], [ true ], [ AC_DEFINE(BROKEN_SNPRINTF) ],
-+		[ true ]
- 	)
- fi
- 
-@@ -1893,6 +1937,7 @@
- }
- 		],
- 		[ ac_cv_have_accrights_in_msghdr="yes" ],
-+		[ ac_cv_have_accrights_in_msghdr="no" ],
- 		[ ac_cv_have_accrights_in_msghdr="no" ]
- 	)
- ])
-@@ -1917,7 +1962,8 @@
- }
- 		],
- 		[ ac_cv_have_control_in_msghdr="yes" ],
--		[ ac_cv_have_control_in_msghdr="no" ]
-+		[ ac_cv_have_control_in_msghdr="no" ],
-+		[ ac_cv_have_control_in_msghdr="yes" ]
- 	)
- ])
- if test "x$ac_cv_have_control_in_msghdr" = "xyes" ; then
-@@ -2229,12 +2275,9 @@
- 		)
- 	fi
- fi
--AC_CHECK_FILE("/dev/ptc",
--	[
--		AC_DEFINE_UNQUOTED(HAVE_DEV_PTS_AND_PTC)
--		have_dev_ptc=1
--	]
--)
-+AC_MSG_CHECKING([for "/dev/ptc"])
-+AC_MSG_RESULT(no)
-+have_dev_ptc=0
- 
- # Options from here on. Some of these are preset by platform above
- AC_ARG_WITH(mantype,
-@@ -2329,15 +2372,8 @@
- fi
- 
- # check for /etc/default/login and use it if present.
--AC_ARG_ENABLE(etc-default-login,
--	[  --disable-etc-default-login       Disable using PATH from /etc/default/login [no]],,
--[
--AC_CHECK_FILE("/etc/default/login", [ external_path_file=/etc/default/login ])
--
--if test "x$external_path_file" = "x/etc/default/login"; then
--	AC_DEFINE(HAVE_ETC_DEFAULT_LOGIN)
--fi
--])
-+AC_MSG_CHECKING([for "/etc/default/login"])
-+AC_MSG_RESULT(no)
- 
- dnl BSD systems use /etc/login.conf so --with-default-path= has no effect
- if test $ac_cv_func_login_getcapbool = "yes" -a \
---- openssh-3.8p1.orig/sshd_config	Fri Sep 27 05:21:58 2002
-+++ openssh-3.8p1/sshd_config	Mon Mar 17 14:55:00 2003
-@@ -89,5 +89,8 @@
- #Banner /some/path
- #VerifyReverseMapping no
- 
-+ClientAliveInterval 15
-+ClientAliveCountMax 4
-+
- # override default of no subsystems
--Subsystem	sftp	/usr/libexec/sftp-server
-+Subsystem	sftp	/usr/sbin/sftp-server
+
 --- openssh-3.6.1p1/S50sshd	Fri Sep 27 05:21:58 2002
 +++ openssh-3.6.1p1/S50sshd	Mon Mar 17 14:55:00 2003
 @@ -0,0 +1,64 @@
@@ -287,3 +77,40 @@
 +
 +exit $?
 +
+--- openssh-4.6p1.oorig/sshd_config	2006-07-24 06:06:47.000000000 +0200
++++ openssh-4.6p1/sshd_config	2007-06-28 15:58:49.000000000 +0200
+@@ -11,7 +11,7 @@
+ # default value.
+ 
+ #Port 22
+-#Protocol 2,1
++Protocol 2
+ #AddressFamily any
+ #ListenAddress 0.0.0.0
+ #ListenAddress ::
+@@ -83,9 +83,11 @@
+ #AllowTcpForwarding yes
+ #GatewayPorts no
+ #X11Forwarding no
++X11Forwarding yes
+ #X11DisplayOffset 10
+ #X11UseLocalhost yes
+ #PrintMotd yes
++PrintMotd no
+ #PrintLastLog yes
+ #TCPKeepAlive yes
+ #UseLogin no
+@@ -102,8 +104,12 @@
+ # no default banner path
+ #Banner /some/path
+ 
++ClientAliveInterval 15
++ClientAliveCountMax 4
++AcceptEnv LANG LC_*
++
+ # override default of no subsystems
+-Subsystem	sftp	/usr/libexec/sftp-server
++Subsystem	sftp	/usr/sbin/sftp-server
+ 
+ # Example of overriding settings on a per-user basis
+ #Match User anoncvs
