From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:34 +0200
Subject: [Buildroot] [Patch v5 1/7] pkg-virtual: fix host dependencies
	handling
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If $(BR2_PACKAGE_HAS_HOST_FOO) is defined, then the pkg-virtual
infrastructure will check if $(BR2_PACKAGE_PROVIDES_HOST_FOO) is not
empty.

But later, $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES) will be set from
$(BR2_PACKAGE_PROVIDES_FOO), ignoring $(BR2_PACKAGE_PROVIDES_HOST_FOO).

So fix this discrepancy by setting $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES)
from $(BR2_PACKAGE_PROVIDES_FOO) only if $(BR2_PACKAGE_PROVIDES_HOST_FOO)
is empty.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/pkg-virtual.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 2e83e07..b8878ad 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -49,7 +49,11 @@ $(2)_IS_VIRTUAL = YES
 ifeq ($(4),target)
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 else
+ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)
 $(2)_DEPENDENCIES += host-$$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(3)))
+else
+$(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
+endif
 endif
 
 # Call the generic package infrastructure to generate the necessary
-- 
2.9.3
