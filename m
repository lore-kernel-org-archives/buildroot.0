From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 22:48:50 +0100
Subject: [Buildroot] [PATCH 4/6] package/libcurl: carefully override
	LD_LIBRARY_PATH
In-Reply-To: <cover.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <2fcbe9513b2535d0d0e0075cb57e079d8416db0a.1447449754.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build libcurl, we need to override LD_LIBRARY and force it to a sane
value, otherwise libcurl is confused when target == host (see a51ce319,
libcurl: fix configure with openssl when target == host).

That is currently OK, since we always set LD_LIBRARY_PATH to a non-empty
value.

However, we're soon to stop setting it at all.

So, if the user has an empty (or no) LD_LIBRARY_PATH in his envirnment,
we'd end up adding the current working directory to LD_LIBRARY_PATH (as
an empty entry in a colon-separated list is most probably interpreted as
meaning the currentworking directory, which we do know can cause issue,
and which we expfressely check against in support/dependencies/dependencies.sh

Fix that by only using an existing LD_LIBRARY_PATH if it is not empty.
Also use a Makefile construct as it is easier to read than a shell one
(we can do that, as all variables from the environment as available as
make variables).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
