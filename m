From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 5 Sep 2007 00:11:47 +0200
Subject: [Buildroot] [RFC] config cache
In-Reply-To: <000301c7ed9d$c08b9510$54b0780a@atmel.com>
References: <20070901193243.GQ11697@aon.at>
	<000301c7ed9d$c08b9510$54b0780a@atmel.com>
Message-ID: <20070904221147.GZ11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 02, 2007 at 05:58:02PM +0200, Ulf Samuelsson wrote:
>> Hi,
>> 
>> read ./TODO
>> 
>> Now i'd like to think loud about how to "implement" this.
>> 
>> preface:
>> ========
>> First, i'm not too happy (any more) with the naming of the variables
>> TARGET_CONFIGURE_OPTS and TARGET_CONFIGURE_ARGS -- same for HOST.
>> Both are variables and not really OPTS, as opposed to the cache
>> option/argument.
>> 
>> Let me suggest that the CC= CFLAGS= settings live in (the respective
>> CONFIGURE_ENV) variables.
>> 
>> Suggestions for the known cv_* vars? CONFIGURE_SETTINGS come to mind,
>> but that's a bit long to type.. TARGET_CONFIGURE_PARAMS ?
>> 
>> cache:
>> ======
>> 
>> Per PROJECT, we use (resp. i suggest to use a) *central* config.cache,
>> via --config-cache=$(PROJECT_BUILD_DIR)/target_config.cache which is put
>> into a TARGET_CONFIGURE_OPTS variable (we renamed the formerly _OPTS to
>> something like PARAM that is passed *before* the
>> $(PACKAGE_DIR)/configure script).
>> 
>> Since the advent of PROJECT one may even consider to build the
>> autoconf'ed packages out-of-tree, i.e. unpack them in build_dir, step
>> into project_dir/package/ and there do a
>> $(PACKAGE_DIR)/configure $(TARGET_CONFIGURE_OTPS) && make
>> 
>
>One of the advantages of the PROJECT thing, is that you can share
>the result of the build between projects.
>Only packages which can be configured in different ways should be
>built in the project_build_dir.

Every network app, everything dealing with files/disks and perhaps some
of the apps with optional X11 support are project specific, by that
definition (and every app with optional locale support too, of course).

This leaves only a handful of packages that live in build_dir
legitimately. That's the reason why i was not too fond of the project
thing in the first place, but ok (digressing, the project thing is
just a detail wrt the config.cache idea).

>> We would end up with a stanza like (modulo naming of the variables):
>> 
>> (cd $(PROJECT_DIR)/$(PACKAGE_NAME) && \
>> $(TARGET_CONFIGURE_ENV) \
>> $(TARGET_CONFIGURE_PARAMS) \
>> $(PACKAGE_DIR)/configure \
>> $(TARGET_CONFIGURE_OPTS) \
>
>Are you not using $(TARGET_CONFIGURE_OPTS) in a new meaning then.
>I think in that case you should come up with a new name
>to avoid bugs.

I'd replace them globally in one sweep, so the _OPTS should be no
problem.

What do you all think about this proposal of a central config-cache
in general?

One possible issue that i could think of was that i don't know how this
would work out for toplevel parallel builds (that never worked anyway,
which is something i'd like to fix). Could be that updating the central
cache by multiple instances of configure would go up in flames in a
spectacular manner. Does somebody know off-hand if that works or not?
