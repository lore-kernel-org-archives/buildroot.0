From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 1 Sep 2007 21:32:43 +0200
Subject: [Buildroot] [RFC] config cache
Message-ID: <20070901193243.GQ11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

read ./TODO

Now i'd like to think loud about how to "implement" this.

preface:
========
First, i'm not too happy (any more) with the naming of the variables
TARGET_CONFIGURE_OPTS and TARGET_CONFIGURE_ARGS -- same for HOST.
Both are variables and not really OPTS, as opposed to the cache
option/argument.

Let me suggest that the CC= CFLAGS= settings live in (the respective
CONFIGURE_ENV) variables.

Suggestions for the known cv_* vars? CONFIGURE_SETTINGS come to mind,
but that's a bit long to type.. TARGET_CONFIGURE_PARAMS ?

cache:
======

Per PROJECT, we use (resp. i suggest to use a) *central* config.cache,
via --config-cache=$(PROJECT_BUILD_DIR)/target_config.cache which is put
into a TARGET_CONFIGURE_OPTS variable (we renamed the formerly _OPTS to
something like PARAM that is passed *before* the
$(PACKAGE_DIR)/configure script).

Since the advent of PROJECT one may even consider to build the
autoconf'ed packages out-of-tree, i.e. unpack them in build_dir, step
into project_dir/package/ and there do a
$(PACKAGE_DIR)/configure $(TARGET_CONFIGURE_OTPS) && make

We would end up with a stanza like (modulo naming of the variables):

	(cd $(PROJECT_DIR)/$(PACKAGE_NAME) && \
	 $(TARGET_CONFIGURE_ENV) \
	 $(TARGET_CONFIGURE_PARAMS) \
	 $(PACKAGE_DIR)/configure \
	 $(TARGET_CONFIGURE_OPTS) \
	 --prefix=/usr \
	 etc...
	)

What do you think?
Suggestions? Comments?
