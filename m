From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 11:33:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix CVE-2021-36217
Message-ID: <20210717093313.954035-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Avahi 0.8 allows a local denial of service (NULL pointer dereference and
daemon crash) against avahi-daemon via the D-Bus interface or a "ping
.local" command.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Fix-NULL-pointer-crashes-from-175.patch | 152 ++++++++++++++++++
 package/avahi/avahi.mk                        |   3 +
 2 files changed, 155 insertions(+)
 create mode 100644 package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch

diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
new file mode 100644
index 0000000000..7e191e8da7
--- /dev/null
+++ b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
@@ -0,0 +1,152 @@
+From 9d31939e55280a733d930b15ac9e4dda4497680c Mon Sep 17 00:00:00 2001
+From: Tommi Rantala <tommi.t.rantala@nokia.com>
+Date: Mon, 8 Feb 2021 11:04:43 +0200
+Subject: [PATCH] Fix NULL pointer crashes from #175
+
+avahi-daemon is crashing when running "ping .local".
+The crash is due to failing assertion from NULL pointer.
+Add missing NULL pointer checks to fix it.
+
+Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
+
+[Retrieved from:
+https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ avahi-core/browse-dns-server.c   | 5 ++++-
+ avahi-core/browse-domain.c       | 5 ++++-
+ avahi-core/browse-service-type.c | 3 +++
+ avahi-core/browse-service.c      | 3 +++
+ avahi-core/browse.c              | 3 +++
+ avahi-core/resolve-address.c     | 5 ++++-
+ avahi-core/resolve-host-name.c   | 5 ++++-
+ avahi-core/resolve-service.c     | 5 ++++-
+ 8 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/avahi-core/browse-dns-server.c b/avahi-core/browse-dns-server.c
+index 049752e9..c2d914fa 100644
+--- a/avahi-core/browse-dns-server.c
++++ b/avahi-core/browse-dns-server.c
+@@ -343,7 +343,10 @@ AvahiSDNSServerBrowser *avahi_s_dns_server_browser_new(
+         AvahiSDNSServerBrowser* b;
+ 
+         b = avahi_s_dns_server_browser_prepare(server, interface, protocol, domain, type, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_dns_server_browser_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-domain.c b/avahi-core/browse-domain.c
+index f145d56a..06fa70c0 100644
+--- a/avahi-core/browse-domain.c
++++ b/avahi-core/browse-domain.c
+@@ -253,7 +253,10 @@ AvahiSDomainBrowser *avahi_s_domain_browser_new(
+         AvahiSDomainBrowser *b;
+ 
+         b = avahi_s_domain_browser_prepare(server, interface, protocol, domain, type, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_domain_browser_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/browse-service-type.c b/avahi-core/browse-service-type.c
+index fdd22dcd..b1fc7af8 100644
+--- a/avahi-core/browse-service-type.c
++++ b/avahi-core/browse-service-type.c
+@@ -171,6 +171,9 @@ AvahiSServiceTypeBrowser *avahi_s_service_type_browser_new(
+         AvahiSServiceTypeBrowser *b;
+ 
+         b = avahi_s_service_type_browser_prepare(server, interface, protocol, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_type_browser_start(b);
+ 
+         return b;
+diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
+index 5531360c..63e0275a 100644
+--- a/avahi-core/browse-service.c
++++ b/avahi-core/browse-service.c
+@@ -184,6 +184,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_new(
+         AvahiSServiceBrowser *b;
+ 
+         b = avahi_s_service_browser_prepare(server, interface, protocol, service_type, domain, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_browser_start(b);
+ 
+         return b;
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e579..e8a915e9 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -634,6 +634,9 @@ AvahiSRecordBrowser *avahi_s_record_browser_new(
+         AvahiSRecordBrowser *b;
+ 
+         b = avahi_s_record_browser_prepare(server, interface, protocol, key, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_record_browser_start_query(b);
+ 
+         return b;
+diff --git a/avahi-core/resolve-address.c b/avahi-core/resolve-address.c
+index ac0b29b1..e61dd242 100644
+--- a/avahi-core/resolve-address.c
++++ b/avahi-core/resolve-address.c
+@@ -286,7 +286,10 @@ AvahiSAddressResolver *avahi_s_address_resolver_new(
+         AvahiSAddressResolver *b;
+ 
+         b = avahi_s_address_resolver_prepare(server, interface, protocol, address, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_address_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-host-name.c b/avahi-core/resolve-host-name.c
+index 808b0e72..4e8e5973 100644
+--- a/avahi-core/resolve-host-name.c
++++ b/avahi-core/resolve-host-name.c
+@@ -318,7 +318,10 @@ AvahiSHostNameResolver *avahi_s_host_name_resolver_new(
+         AvahiSHostNameResolver *b;
+ 
+         b = avahi_s_host_name_resolver_prepare(server, interface, protocol, host_name, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_host_name_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
+diff --git a/avahi-core/resolve-service.c b/avahi-core/resolve-service.c
+index 66bf3cae..43771763 100644
+--- a/avahi-core/resolve-service.c
++++ b/avahi-core/resolve-service.c
+@@ -519,7 +519,10 @@ AvahiSServiceResolver *avahi_s_service_resolver_new(
+         AvahiSServiceResolver *b;
+ 
+         b = avahi_s_service_resolver_prepare(server, interface, protocol, name, type, domain, aprotocol, flags, callback, userdata);
++        if (!b)
++            return NULL;
++
+         avahi_s_service_resolver_start(b);
+ 
+         return b;
+-}
+\ No newline at end of file
++}
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 1d57aa14e2..9de6ebc4d2 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -16,6 +16,9 @@ AVAHI_INSTALL_STAGING = YES
 # part of the Debian packaging and not part of upstream avahi
 AVAHI_IGNORE_CVES += CVE-2021-26720
 
+# 0001-Fix-NULL-pointer-crashes-from-175.patch
+AVAHI_IGNORE_CVES += CVE-2021-36217
+
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share
-- 
2.30.2
