From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:35 +0200
Subject: [Buildroot] [PATCHv2 09/14] gcc: force symlink creation
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-10-git-send-email-thomas.petazzoni@free-electrons.com>
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
