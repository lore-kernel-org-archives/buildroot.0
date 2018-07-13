From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jul 2018 10:08:49 +0200
Subject: [Buildroot] [PATCH] libostree: add upstream patch to fix
 linking errors
In-Reply-To: <20180712055515.20222-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Thu, 12 Jul 2018 07:55:15 +0200")
References: <20180712055515.20222-1-marcus.folkesson@gmail.com>
Message-ID: <87601jv9pq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Folkesson <marcus.folkesson@gmail.com> writes:

 > Support for Avahi in libostree depends on some support functions from
 > libsoup.
 > Use its own support functions in case of libsoup is not provided.

 > Fixes:
 >   http://autobuild.buildroot.net/results/5e5441822e2a94f8de51bfa0470aced84720ce31

 > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
 > ---
 >  ...-soup-to-build-process-when-configur.patch | 45 +++++++++++++++++++
 >  1 file changed, 45 insertions(+)
 >  create mode 100644 package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch

 > diff --git a/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch b/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch
 > new file mode 100644
 > index 0000000000..b89bd743a1
 > --- /dev/null
 > +++ b/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch
 > @@ -0,0 +1,45 @@
 > +From 1cd86d4978ad32405b41f864e11ac21a2474c2f3 Mon Sep 17 00:00:00 2001
 > +From: Marcus Folkesson <marcus.folkesson@gmail.com>
 > +Date: Tue, 3 Jul 2018 10:02:46 +0200
 > +Subject: [PATCH] build: add ostree-soup-* to build process when configured
 > + with avahi
 > +
 > +Avoid getting these link errors:
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_path'
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_new'
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_free'
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_scheme'
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_to_string'
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_host'
 > +    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_port'
 > +    collect2: error: ld returned 1 exit status
 > +
 > +Reproduce with:
 > +    ./configure --with-avahi --without-soup
 > +
 > +Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
 > +---
 > + Makefile-libostree.am | 7 +++++++
 > + 1 file changed, 7 insertions(+)
 > +
 > +diff --git a/Makefile-libostree.am b/Makefile-libostree.am
 > +index 01a209d1..dbc9ebb8 100644
 > +--- a/Makefile-libostree.am
 > ++++ b/Makefile-libostree.am
 > +@@ -238,6 +238,13 @@ if USE_LIBSOUP
 > + libostree_1_la_SOURCES += src/libostree/ostree-fetcher-soup.c
 > + libostree_1_la_CFLAGS += $(OT_INTERNAL_SOUP_CFLAGS)
 > + libostree_1_la_LIBADD += $(OT_INTERNAL_SOUP_LIBS)
 > ++else
 > ++if USE_AVAHI
 > ++libostree_1_la_SOURCES += src/libostree/ostree-soup-uri.h \
 > ++	src/libostree/ostree-soup-uri.c \
 > ++	src/libostree/ostree-soup-form.c \
 > ++	$(NULL)

As this touches an .am file you need to add LIBOSTREE_AUTORECONF = YES.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
