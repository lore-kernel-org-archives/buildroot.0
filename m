From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Aug 2018 19:23:58 +0200
Subject: [Buildroot] [RFC v3 1/3] libopenssl: bump version to 1.1.0h
In-Reply-To: <fnmm4fxjln.ln2@ID-313208.user.individual.net>
References: <20180508195431.19944-1-ps.report@gmx.net>
 <0470f9f2-f90d-c19d-ee47-c97d393ced05@gmail.com>
 <20180611220749.24b8d3c9@gmx.net>
 <fnmm4fxjln.ln2@ID-313208.user.individual.net>
Message-ID: <20180819192358.58d6f31f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 19 Aug 2018 01:29:19 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Mon, 11 Jun 2018 22:07:49 +0200 schrieb Peter Seiderer:
> 
> > Many thanks for testing and the mariadb version bump suggestion, will
> > add it to the next patch set iteration...  
> 
> Hi Peter,
> 
> just wanted to let you know that I am currently working on updating the 
> patch series, this includes build tests and, if necessary updates, of 
> nearly all buildroot packages using openssl.
> 

Many thanks for taking over (did not find much time for additional work),
only started the mariadb update (not yet finished):

    mariadb: bump version to 10.3.7
    
    - change WITH_SSL for host build from bundled to system (and add
      host-openssl dependency) to avoid the following configure failure:
    
      CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
        Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
        (Required is at least version "3.3.24")
      Call Stack (most recent call first):
        /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
        /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
        libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)
    
    Signed-off-by: Peter Seiderer <ps.report@gmx.net>
    ---
    Note:
      - WITH_SSL related bug report, see [1]
    
    Changes v3 -> v4:
      - new patch (suggested by Ryan Coe)
    
    [1] https://jira.mariadb.org/browse/MDEV-16014

------------------------- package/mariadb/mariadb.hash -------------------------
index e4736465e0..5a8f797d40 100644
@@ -1,9 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.1.35/
-md5 935f401314ff08a4177beb70fed6055c  mariadb-10.1.35.tar.gz
-sha1 d322f0da17f4de475832dd534657eba5a936f77b  mariadb-10.1.35.tar.gz
-sha256 9e91d985ed4f662126e3e5791fe91ec8a2f44ec811113c2b6fbc72fa14553c4d  mariadb-10.1.35.tar.gz
-sha512 88e6049f3bbc3aa047e108f91a2c4f335758e80f25bfa2974b5f8c2e13f5758824d7835dece021b515c531e5641b9998e4de92256ad4b47b7f694da99bd471aa  mariadb-10.1.35.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.7
+sha256 e990afee6ae7cf9ac40154d0e150be359385dd6ef408ad80ea30df34e2c164cf  mariadb-10.3.7.tar.gz
 
 # Hash for license files
-sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
+sha256 dec3c92fdc58070facec08db681aa6b9cb05fd21e463358161c1df92e1c0653f  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING

-------------------------- package/mariadb/mariadb.mk --------------------------
index 23822187c3..47af017a4e 100644
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.35
+MARIADB_VERSION = 10.3.7
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
-MARIADB_LICENSE_FILES = README COPYING
+MARIADB_LICENSE_FILES = README.md COPYING
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
 
@@ -67,7 +67,8 @@ MARIADB_CONF_OPTS += \
 	-DMYSQL_DATADIR=/var/lib/mysql \
 	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
 
-HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
+HOST_MARIADB_DEPENDENCIES = host-openssl
+HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
 
 # Some helpers must be compiled for host in order to crosscompile mariadb for
 # the target. They are then included by import_executables.cmake which is

And

HACK: mariadb: fix install

-------------------------- package/mariadb/mariadb.mk --------------------------
index 47af017a4e..0f5ef2e058 100644
@@ -109,10 +109,10 @@ endif
 # We also don't need the test suite on the target
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
-	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
-		$(TARGET_DIR)/etc/mysql/my.cnf
-	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
-	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
+#	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
+#		$(TARGET_DIR)/etc/mysql/my.cnf
+#	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
+#	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
 
 MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL

No default config files provided?

Regards,
Peter

> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
