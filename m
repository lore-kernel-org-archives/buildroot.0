From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:39:59 +0200
Subject: [Buildroot] [PATCH 2/7] pkg-infra: assign BR_NO_CHECK_HASH_FOR so
	it is recursively-expanded
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <e8cce5d9bbb1b75dbf02c0f9ee44ee23a0314d38.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, assigning to BR_NO_CHECK_HASH_FOR in conditionals, but
referencing vairaible assigned to later, fails. Here's a failing
test-case, which is the reduced test-case of how we handle
BR_NO_CHECK_HASH_FOR for now:

    export FOO

    ifeq ($(BAR_V),)
    BAR_V=1
    else
    FOO += $(BAR_S)
    endif

    BAR_S = bar-$(BAR_V).tar

    all:
        @echo "BAR_S=\"$(BAR_S)\""
        @$(SHELL) -c 'echo "FOO=\"$${FOO}\""'

Run it with:

    $ make
    BAR_S="bar-1.tar"
    FOO=""
    $ make BAR_V=2
    BAR_S="bar-2.tar"
    FOO=" "

Now, change the firstline to read:

    export FOO =

And we now get:

    $ make
    BAR_S="bar-1.tar"
    FOO=""
    $ make BAR_V=2
    BAR_S="bar-2.tar"
    FOO=" bar-2.tar"

This new behaviour will be needed later for Xenomai, which handles the
version string in an unusual way.

(Note how there's a leading space in both cases? In Buildroot, we do not
care that extra space, it is simply ignored).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a38062e..f0651db 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -56,7 +56,9 @@ domainseparator = $(if $(1),$(1),/)
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
 # Expressly do not check hashes for those files
-export BR_NO_CHECK_HASH_FOR
+# It needs to be assigned so as to be a recursively-expanded variable, and
+# so that it can be assigned inside conditionals.
+export BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
-- 
1.9.1
