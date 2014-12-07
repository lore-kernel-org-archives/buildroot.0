From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 00:05:05 +0100
Subject: [Buildroot] [git commit] package/mutt: specify the mailpath
Message-ID: <20141207231120.8C4B3800E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18ebf0e5e1e495cad670c085e5932c09cd84ae3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mutt's ./configure looks for different paths for where to look for
incoming mails.

This is absolutely worng in the case of cross-compilation, because the
path it may find on the host may not exist on the target.

Not only that, but some host may not even have any of the paths
./configure looks for.

Fix that by specifying the mailpath, and set it to the value documented
in the FHS [0]

Since Buildroot only guarantees /tmp to be writable, make /var/mail a
symlink to /tmp .

[0] http://refspecs.linuxfoundation.org/FHS_2.3/fhs-2.3.html#VARMAILUSERMAILBOXFILES

Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/mutt.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index b4f18b0..92457a1 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -57,4 +57,11 @@ MUTT_CONF_ENV += \
 	mutt_cv_iconv_good=yes \
 	mutt_cv_iconv_nontrans=no
 
+MUTT_CONF_OPTS += --with-mailpath=/var/mail
+
+define MUTT_VAR_MAIL
+	ln -sf /tmp $(TARGET_DIR)/var/mail
+endef
+MUTT_POST_INSTALL_TARGET_HOOKS += MUTT_VAR_MAIL
+
 $(eval $(autotools-package))
