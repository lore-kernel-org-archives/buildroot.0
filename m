From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 08:35:28 +0200
Subject: [Buildroot] [PATCH 09/12] gcc: force symlink creation
In-Reply-To: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377671731-28656-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The HOST_GCC_CONFIGURE_SYMLINK creates a symbolic link
$(@D)/build/configure -> $(@D)/configure for each build step of
gcc. However, it was only using 'ln -s' and not 'ln -sf', which was
causing problems when doing 'make host-gcc-final-reconfigure' for
example, because the configure commands (including this macro) are
being re-executed, but the symbolic link already exists.

Changing this symbolic link creation to 'ln -sf' fixes this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cd6efed..20d6d14 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -76,7 +76,7 @@ endef
 
 define HOST_GCC_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/build
-	ln -s ../configure $(@D)/build/configure
+	ln -sf ../configure $(@D)/build/configure
 endef
 
 #
-- 
1.8.1.2
