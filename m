From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Mar 2020 10:54:48 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-validate: disable introspection
Message-ID: <20200307095448.19707-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable introspection unconditionally (as already done for all
  other original gstreamer1 packages)
- use '=' instead of '+=' for the first usage of GST1_VALIDATE_CONF_OPTS

Fixes:

  http://autobuild.buildroot.net/results/e6e43fb85c71af9bb599ea8bbe2e805b392cf1ad

    GEN      GstValidate-1.0.gir
  Couldn't find include 'GstPbutils-1.0.gir' (search path: '['/nvmedata/autobuild/instance-6/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/nvmedata/autobuild/instance-6/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-6/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
  make[5]: *** [Makefile:1612: GstValidate-1.0.gir] Error 1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - blind patch (as I could not reproduce the failure locally)
  - the autobuild failure is from next, but I believe the patch
    does not do any harm on master
---
 package/gstreamer1/gst1-validate/gst1-validate.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index ff96d844ba..92c5662efe 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -22,6 +22,8 @@ else
 GST1_VALIDATE_DEPENDENCIES += host-python python
 endif
 
-GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
+GST1_VALIDATE_CONF_OPTS = \
+	--enable-introspection=no \
+	--disable-sphinx-doc
 
 $(eval $(autotools-package))
-- 
2.25.1
