From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Fri, 24 Jan 2020 13:39:34 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 12.14.1
In-Reply-To: <791e6cb2-07c0-3da5-76a4-749a598adab4@codethink.co.uk>
References: <20200121023242.94475-1-james.hilliard1@gmail.com>
 <b25a1221-50a0-4915-9b73-1b304f033f87@codethink.co.uk>
 <CADvTj4qNBoJBm1nPfKJ+=0qBWda+-XSU2LQ=FD0WHaYHF-_TsQ@mail.gmail.com>
 <791e6cb2-07c0-3da5-76a4-749a598adab4@codethink.co.uk>
Message-ID: <a5a61bbc-82ac-9e0b-3403-afb024dd85e9@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/01/2020 11:31, Thomas Preston wrote:
> There's a few things fishy;
> 1. Three instances of `-I/home/br-user/output/host/include`

The first `-I$(HOST_DIR)/include` is because nodejs configure.py uses
buildroot's host-pkg-config script to get the include directories for
zlib, which happens to be /home/br-user/output/host/include - which
also includes host-icu headers.

The final two `-I$(HOST_DIR)/include` are from:

	CFLAGS.target
	CXXFLAGS.target

It's really an ordering issue, because nodejs configure.py looks for
ICU headers in `-I$(HOST_DIR)/include` before the bundled icu-small
directory.

One workaround is to remove "--shared-zlib" so that
`-I$(HOST_DIR)/include` isn't listed before the icu-small arguments

	-I../deps/icu-small/source/i18n
	-I../deps/icu-small/source/common

Zlib is still found because it's in the host system include dir,
although I'm not sure how acceptable this solution is to upstream
Buildroot. Maybe remove it but add a comment?

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 62c4c1abb1..181668b743 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -63,7 +63,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
                --shared-openssl \
                --shared-openssl-includes=$(HOST_DIR)/include/openssl \
                --shared-openssl-libpath=$(HOST_DIR)/lib \
-               --shared-zlib \
                --no-cross-compiling \
                --with-intl=small-icu \
        )
