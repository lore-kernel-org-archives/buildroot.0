From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Nov 2016 22:23:38 +0100
Subject: [Buildroot] [PATCH 4/6] package/pseudo: expose the host binary in a
	variable
In-Reply-To: <cover.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <36c6de6cdc72a8340da56bf9d44bdab064a9fd61.1478553802.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running pseudo is more involved than running fakeroot. In the transition
from using fakeroot, we just did not account for the extra requirements.

First, we explicitly tell pseudo where it is, otherwise it tries to
guess. Its guess is correct, but it prints a warning, which is not nice.

Second, we tell it where to find the passwd and group files in case it
has to emulate access to them. We currently do not use that feature, but
better safe than sorry.

Third, pseudo spawns a background daemon, and talks to it (when fakeroot
would emulate the state all in the current process' state, pseudo uses
the daemon to coordinate the state across multiple processes). We are
not much interested in the daemon lingering around, so we just tell it
to termintate as soon as the last clients quits (this can take up to one
second).

Fourth and last, pseudo always stores its internal database when
exiting, and reloads it when spawned. The database is by default stored
in a sub-directory of the prefix it was installed in, but this is
impractical for us, in case the host-dir is outside the config dir
$(BASE_DIR). We want the database to be specific to the one config dir
we are building. So, we store the database in a (hidden) sub-dir of the
build dir, thus ensuring it is never shared with another build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
---
 package/pseudo/pseudo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 98c7de5..2a3e31f 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -23,6 +23,13 @@ HOST_PSEUDO_CONF_OPTS = \
 	--libdir=$(HOST_DIR)/usr/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
+HOST_PSEUDO = \
+	PSEUDO_PREFIX=$(HOST_DIR)/usr \
+	PSEUDO_PASSWD=$(TARGET_DIR) \
+	PSEUDO_OPTS=-t0 \
+	PSEUDO_LOCALSTATEDIR=$(BUILD_DIR)/.pseudodb \
+	$(HOST_DIR)/usr/bin/pseudo
+
 define HOST_PSEUDO_FAKEROOT_SYMLINK
 	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
 endef
-- 
2.7.4
