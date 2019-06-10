From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 15:33:00 +0200
Subject: [Buildroot] [git commit] iputils: set the permissions with
 IPUTILS_PERMISSIONS
Message-ID: <20190610134318.B28618F40E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2821a494b06325a1f3554012cd25dec831e84d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... for arping, clockdiff and ping. These require root permission for
socket(). Upstream solution (script setcap-setuid.sh) requires
setcap binary on the host and cap_net_raw+ep + libcap, or setting
setuid root executable (which is dangerous). Neither would work anyway
since we install as non-root user.

This restores behavior used for version s20180629. We used to setuid the
ping and traceroute6 programs. traceroute6 is no longer built since the
bump to s20190515, but now arping and clockdiff are built, and these
need setuid as well. So enable setuid on arping, clockdiff and ping.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iputils/iputils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index d9a51ece2a..8be54b4788 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -52,4 +52,12 @@ endif
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
+# handle permissions ourselves
+IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
+define IPUTILS_PERMISSIONS
+	/bin/arping      f 4755 0 0 - - - - -
+	/bin/clockdiff   f 4755 0 0 - - - - -
+	/bin/ping        f 4755 0 0 - - - - -
+endef
+
 $(eval $(meson-package))
