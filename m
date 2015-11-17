From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 10:00:26 +0100
Subject: [Buildroot] [git commit] package/libcurl: carefully override
	LD_LIBRARY_PATH
Message-ID: <20151117091039.C684C81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71b1d39726672160108901c0a1fbd00ee899d0a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To build libcurl, we need to override LD_LIBRARY and force it to a sane
value, otherwise libcurl is confused when target == host (see a51ce319,
libcurl: fix configure with openssl when target == host).

That is currently OK, since we always set LD_LIBRARY_PATH to a non-empty
value.

However, we're soon to stop setting it at all.

So, if the user has an empty (or no) LD_LIBRARY_PATH in his envirnment,
we'd end up adding the current working directory to LD_LIBRARY_PATH (as
an empty entry in a colon-separated list is most probably interpreted as
meaning the current working directory, which we do know can cause issue,
and which we expressely check against in support/dependencies/dependencies.sh

Fix that by only using an existing LD_LIBRARY_PATH if it is not empty.
Also use a Makefile construct as it is easier to read than a shell one
(we can do that, as all variables from the environment are available as
make variables).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8587baa..7c259b2 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -30,7 +30,7 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # native stuff during the rest of configure when target == host.
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
-LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
+LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
