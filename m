From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Nov 2013 11:45:07 +0100
Subject: [Buildroot] Makeinfo
Message-ID: <CAAXf6LWWWG4DABPQzNezk+Tnr1tbDx9mc6+zXZ457vskm1VFBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm having an issue in building a package (libuio, which I did not yet
submit) on machines that do not have makeinfo (part of texinfo).

Recently, Arnout changed package/stress as follows:

--------------
stress: disable documentation

It fails to build with my makeinfo version. Note that the autobuilders don't
see this, probably because they don't have makeinfo installed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -17,7 +17,10 @@ STRESS_AUTORECONF = YES
 #
 # If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
 # --disable-static explicitly to get stress linked dynamically.
+#
+# Also, disable documentation by undefining makeinfo
 STRESS_CONF_OPT = \
-       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
+       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
+       MAKEINFO=:

 $(eval $(autotools-package))
-------------

I'm now wondering if this is an approach we could add globally: set
MAKEINFO to : to effectively disable the generation of
documentation...

What do you think?

Thanks,
Thomas
