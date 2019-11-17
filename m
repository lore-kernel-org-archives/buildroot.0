From: Florent VIARD (Mojix) <florent.viard@mojix.com>
Date: Sun, 17 Nov 2019 17:12:37 +0100
Subject: [Buildroot] [PATCH 1/1] core: load a global.mk file if it exists to
 override global vars
Message-ID: <06c9840e-2577-dc81-c0ab-f9301b5bcce7@mojix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


For example, this can be useful to permanently set a
BR2_EXTERNAL without having to use the "env var" at least once.

The global.mk file has to be located inside TOPDIR.

Example:
-- global.mk --
BR2_EXTERNAL = ext-myproject

It can also probably be used for BR2_VERSION customization or to add
global variables to be used in custom config files.

To give a little bit of context of the genesis of this change:
- I have a project using buildroot for a custom product.
- I have an "ext-myproject" folder at the root of TOPDIR that is an
external folder.
- All the configs, scripts or vendor specific packages are located
inside this external folder.

Like that, the project is kind of "out-of-tree", with everything located
in a specific dir, and the buildroot original file/folders stay clean.
So, it is more easy to merge updated versions.

The issue solved by this change is that, currently, path to external
folder(s) has to be manually set through the env var at least once by
everyone in the team after a checkout and eventually again after a make
distclean. Because, the BR2_EXTERNAL path settings are saved within the
"output" folder.

Using the global.mk file, i can setup the BR2_EXTERNAL and save/commit
it with the project, so that anyone can start building with a single
"make" without non obvious manipulation.

As a side effect of this change, using this can help overcome a
regression in
buildroot that I have noticed:
External paths are supposed to be absolute or relative, but a change
pushed a few years ago, automatically change external relative path to
absolute before generating the temporary files.

Signed-off-by: Florent Viard <fviard@cxignited.com>
---
Makefile | 3 +++
1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index c78c2cbcf6..f2c43ef40f 100644
--- a/Makefile
+++ b/Makefile
@@ -170,6 +170,9 @@ export CDPATH :=
BASE_DIR := $(CANONICAL_O)
$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))

+# Include the global override file if one is provided
+# This is useful, for example, to allow the user to permanently set
BR2_EXTERNAL
+-include $(TOPDIR)/global.mk

# Handling of BR2_EXTERNAL.
#

-- 
2.17.1



-- 


*
CONFIDENTIALITY NOTICE:*?This message and its contents are 
Confidential. If you received this message in error, do not use or rely 
upon it. Instead, please inform the sender and then delete it.

?

*AVISO 
DE CONFIDENCIALIDAD:?*Este mensaje y su contenido son de uso Confidencial.? 
Si usted ha recibido este mensaje por equivocaci?n no lo use ni conf?e en 
su contenido; asimismo, le pedimos notificar al remitente y borrar el 
mensaje.
