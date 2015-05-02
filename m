From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 11:05:00 +0200
Subject: [Buildroot] [PATCH 1/7 v2] pkg-infra: assign BR_NO_CHECK_HASH_FOR
	so it is recursively-expanded
In-Reply-To: <cover.1430557268.git.yann.morin.1998@free.fr>
References: <cover.1430557268.git.yann.morin.1998@free.fr>
Message-ID: <53278b68a425c2b6ad61a7c89f2187ad9158310a.1430557268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, assigning to BR_NO_CHECK_HASH_FOR but referencing variable
assigned to later, fails. Here's a failing test-case, which is the
reduced test-case of how we handle BR_NO_CHECK_HASH_FOR for now (warning
added for test-case):

    export BR_NO_CHECK_HASH_FOR
    BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
    XENOMAI_VERSION = 2.6.4
    XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
    $(warning BR_NO_CHECK_HASH_FOR='$(BR_NO_CHECK_HASH_FOR)')
    all:

Run it with simply make:

    $ make
    BR_NO_CHECK_HASH_FOR=' '

Now, change the first line to read:

    export BR_NO_CHECK_HASH_FOR =

And we now get:

    $ make
    BR_NO_CHECK_HASH_FOR=' xenomai-2.6.4.tar.bz2'

This new behaviour will be needed later for Xenomai, which handles the
version string in an unusual way, so we can exclude its custom versions.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - update comment about the reason for assigning  (Arnout)
  - further reduce the test-case  (Arnout)
  - drop comment about leading space  (Arnout)
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a38062e..f6ed8be 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -56,7 +56,9 @@ domainseparator = $(if $(1),$(1),/)
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
 # Expressly do not check hashes for those files
-export BR_NO_CHECK_HASH_FOR
+# Exported variables default to immediately expanded in some versions of
+# make, but we need it to be recursively-epxanded, so explicitly assign it.
+export BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
-- 
1.9.1
