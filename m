From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Apr 2012 23:16:18 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE helper
	functions
Message-ID: <1335647781-16536-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Many packages have the following type of construct:

ifeq ($(BR2_PACKAGE_ACL),y)
       SYSTEMD_CONF_OPT += --enable-acl
       SYSTEMD_DEPENDENCIES += acl
else
       SYSTEMD_CONF_OPT += --disable-acl
endif

 The first patch in this series abbreviates that to

$(eval $(call CONF_PKG_ENABLE,SYSTEMD,acl))

 It makes it possible to abbreviate similar constructs as well.

 The main advantage I see is not so much that the .mk files get
shorter, but more importantly that it's easier to keep things consistent,
e.g. making sure that --enable and --disable are always given explicitly.

 The second and the third patch are examples of how this can be used in
practice.  I've chosen two random packages that have a lot of these
--enable/--disable options.  Once the main implementation is accepted
I'll probably start to convert some more packages.


 Note: I don't particularly like the way the call statement looks, but
I couldn't find a better way to do it.  Suggestions are definitely
welcome!


 Regards,
 Arnout

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (3):
      pkg-infra: add CONF_ENABLE and CONF_PKG_ENABLE helper functions
      avahi: use CONF_ENABLE and CONF_PKG_ENABLE
      cairo: use CONF_ENABLE and CONF_PKG_ENABLE

 package/avahi/avahi.mk     |   34 +++++-----------------------------
 package/cairo/cairo.mk     |   44 ++++++--------------------------------------
 package/pkg-autotargets.mk |   57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 67 deletions(-)
