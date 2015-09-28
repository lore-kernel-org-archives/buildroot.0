From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 28 Sep 2015 18:10:32 +0200
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with a
	trailing slash
In-Reply-To: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A trailing slash in FOO_SITE is useless, since Buildroot automatically adds
a slash between FOO_SITE and the filename as appropriate.

Moreover they are potentially armful, which led to introducing a workaround
to strip them:

    commit 1cbffbd015106ea90fe49e27433375769dc1035b
    Author: Shawn J. Goff <shawn7400@gmail.com>
    Date:   Fri Apr 12 09:40:30 2013 +0000

        eliminate double slashes caused by FOO_SITE ending in a slash

        When a FOO_SITE variable ends in a slash and gets joined with a
        FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
        has a double slash. While double-slashes are fine in unix paths, they
        are reserved in URIs - the part following '//' must be an authority.

So let's ban trailing slashes entirely. They have all been removed in
a recent commit, now add a check to error out loudly in case a new one
is added.

Example commands to test this check:

  $ make busybox-dirclean busybox-source
  rm -Rf /home/murray/devel/buildroot/output/build/busybox-1.23.2
  busybox-1.23.2.tar.bz2: OK (md5: 7925683d7dd105aabe9b6b618d48cc73)
  busybox-1.23.2.tar.bz2: OK (sha1: 7f37193cb249f27630e0b2a2c6c9bbb7b1d24c16)
  $
  $ make BUSYBOX_SITE=http://www.busybox.net/downloads/ busybox-dirclean busybox-source
  rm -Rf /home/murray/devel/buildroot/output/build/busybox-1.23.2
  BUSYBOX_SITE (http://www.busybox.net/downloads/) cannot have a trailing slash
  make[1]: *** [/home/murray/devel/buildroot/output/build/busybox-1.23.2/.stamp_downloaded] Error 1
  make: *** [_all] Error 2
  $

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changed v2 -> v3:
 - Simplify the check logic removing a useless "&& true".
 - Expand commit log message. This is a pretty important change, so it
   should be well justified.
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5201fca..73353aa 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -70,6 +70,8 @@ endif
 
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
+	@(echo "$($(PKG)_SITE)" | grep -Eq "[^/]$$" || \
+		(echo "$(PKG)_SITE ($($(PKG)_SITE)) cannot have a trailing slash" && false))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
-- 
1.9.1
