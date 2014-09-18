From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 06:56:40 +0200
Subject: [Buildroot] [PATCH v2] Add support for Flattened Image Trees
In-Reply-To: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
References: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <c3bf0f66-d29d-4a77-930d-c33ac938368c@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor Yefremov <yegorslists@googlemail.com> schreef:
>This patch provides an option to specify a FIT source
>file (*.its), that will usually be stored in a board directory,
>and the resulting blob file name (*.itb).
>
>Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>---
>Changes:
>	v2: moved configuration to fs infra instead of linux
>
> fs/Config.in     |  1 +
> fs/fit/Config.in | 28 ++++++++++++++++++++++++++++
> fs/fit/fit.mk    | 19 +++++++++++++++++++
> 3 files changed, 48 insertions(+)
> create mode 100644 fs/fit/Config.in
> create mode 100644 fs/fit/fit.mk
>
>diff --git a/fs/Config.in b/fs/Config.in
>index 5853113..8d882d0 100644
>--- a/fs/Config.in
>+++ b/fs/Config.in
>@@ -4,6 +4,7 @@ source "fs/cloop/Config.in"
> source "fs/cpio/Config.in"
> source "fs/cramfs/Config.in"
> source "fs/ext2/Config.in"
>+source "fs/fit/Config.in"
> source "fs/initramfs/Config.in"
> source "fs/iso9660/Config.in"
> source "fs/jffs2/Config.in"
>diff --git a/fs/fit/Config.in b/fs/fit/Config.in
>new file mode 100644
>index 0000000..add4d27
>--- /dev/null
>+++ b/fs/fit/Config.in
>@@ -0,0 +1,28 @@
>+config BR2_TARGET_ROOTFS_FIT
>+	bool "Flattened Image Tree support"
>+	help
>+	  Compile a flattened image tree source into a flattened
>+	  image tree blob. Select the *.its file to compile in the
>+	  options below.
>+
>+if BR2_TARGET_ROOTFS_FIT
>+
>+config BR2_FIT_PATH
>+	string "Flattened Image Tree source file path"
>+	help
>+	  Path to the image tree tree source files.
>+
>+config BR2_FIT_BLOB_NAME
>+	string "Flattened Image Tree blob file name"
>+	help
>+	  File name for the resulting FIT blob.

Two extra comments after sleeping over it:

- is it really needed to ask for the blob file name? We
 could simply use the same file name as the source,
 but with modified extension.

- I think we should add support for multiple fit images
 at once, which is not hard to do. The user would
 specify a space separated list of its files.

Best regards,
Thomas
