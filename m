From: Christian Stewart <christian@paral.in>
Date: Mon, 27 Jul 2015 14:45:48 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/mosh: remove unnecessary patch
Message-ID: <1438033548-10582-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to upstream (keithw/mosh issue #650), it's okay to have the
"locale" system command fail with "command not found" because this is a
non-critical action that occurs just before Mosh exits with an error
anyway. Thus, this patch is unnecssary, and can be removed.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/mosh/0001-remove-system-locale-calls.patch | 46 ----------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 package/mosh/0001-remove-system-locale-calls.patch

diff --git a/package/mosh/0001-remove-system-locale-calls.patch b/package/mosh/0001-remove-system-locale-calls.patch
deleted file mode 100644
index 114e6ed..0000000
--- a/package/mosh/0001-remove-system-locale-calls.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-The locale command is not available on many systems. As this variable
-is unused and appears to have been written with the intent of
-displaying the locale settings to the user, it's not really necessary.
-As this breaks Mosh on a lot of systems, it's best to remove the calls.
-
-Upstream status: refused, see: https://github.com/keithw/mosh/issues/650
-
-Signed-off-by: Christian Stewart <christian@paral.in>
----
- src/frontend/mosh-server.cc | 4 +++-
- src/frontend/stmclient.cc   | 4 +++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/frontend/mosh-server.cc b/src/frontend/mosh-server.cc
-index 76ed2ed..0d2f222 100644
---- a/src/frontend/mosh-server.cc
-+++ b/src/frontend/mosh-server.cc
-@@ -313,7 +313,9 @@ int main( int argc, char *argv[] )
-       fprintf( stderr, "mosh-server needs a UTF-8 native locale to run.\n\n" );
-       fprintf( stderr, "Unfortunately, the local environment (%s) specifies\nthe character set \"%s\",\n\n", native_ctype.str().c_str(), native_charset.c_str() );
-       fprintf( stderr, "The client-supplied environment (%s) specifies\nthe character set \"%s\".\n\n", client_ctype.str().c_str(), client_charset.c_str() );
--      int unused __attribute((unused)) = system( "locale" );
-+
-+      fprintf( stderr, "This is a buildroot system, 'locale' debug output has been removed." );
-+
-       exit( 1 );
-     }
-   }
-diff --git a/src/frontend/stmclient.cc b/src/frontend/stmclient.cc
-index 9e4d916..06fac8b 100644
---- a/src/frontend/stmclient.cc
-+++ b/src/frontend/stmclient.cc
-@@ -85,7 +85,9 @@ void STMClient::init( void )
- 
-     fprintf( stderr, "mosh-client needs a UTF-8 native locale to run.\n\n" );
-     fprintf( stderr, "Unfortunately, the client's environment (%s) specifies\nthe character set \"%s\".\n\n", native_ctype.str().c_str(), native_charset.c_str() );
--    int unused __attribute((unused)) = system( "locale" );
-+
-+    fprintf( stderr, "This is a buildroot system, 'locale' debug output has been removed." );
-+
-     exit( 1 );
-   }
- 
--- 
-2.1.4
-
-- 
2.1.4
