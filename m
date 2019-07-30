From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Jul 2019 22:31:47 +0200
Subject: [Buildroot] [RFC PATCH v3 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190730203147.21113-1-petr.vorel@gmail.com>
References: <20190730203147.21113-1-petr.vorel@gmail.com>
Message-ID: <20190730203147.21113-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not setting for arping as it can be used for ARP Poisoning.

Use cap_net_raw+p (drop +e) as upstream sets that via
cap_set_flag(), see https://github.com/iputils/iputils/issues/194

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Same as v2.

 package/iputils/iputils.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e6a3e2fc5..f1d3e1fc6a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -76,8 +76,11 @@ IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
 	/usr/sbin/arping      f 4755 0 0 - - - - -
 	/usr/bin/clockdiff    f 4755 0 0 - - - - -
+	|xattr cap_net_raw+p
 	/bin/ping             f 4755 0 0 - - - - -
+	|xattr cap_net_raw+p
 	/usr/bin/traceroute6  f 4755 0 0 - - - - -
+	|xattr cap_net_raw+p
 endef
 
 $(eval $(meson-package))
-- 
2.22.0
