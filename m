From: Ben Boeckel <mathstuf@gmail.com>
Date: Sun, 18 Oct 2015 17:46:45 -0400
Subject: [Buildroot] [PATCH 1/1] postgresql: add an option to build the
 server
In-Reply-To: <20151018181943.4faaefe2@free-electrons.com>
References: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
 <1445179920-2413-2-git-send-email-mathstuf@gmail.com>
 <20151018181943.4faaefe2@free-electrons.com>
Message-ID: <20151018214645.GA9759@bronto-burt.dev.benboeckel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 18, 2015 at 18:19:43 +0200, Thomas Petazzoni wrote:
> On Sun, 18 Oct 2015 10:52:00 -0400, Ben Boeckel wrote:
> > Unfortunately, postgresql upstream doesn't have a configure option for
> > this. Instead, to get bits of the build, compiling and installing
> > different subdirectories is the preferred way.
> > 
> > The directories come from those used in the FreeBSD port.
> > 
> > Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> 
> Just to clarify: in our current packaging, we build and install both
> server and client?

Correct.

> As I suggested, doing:
> 
> 	select BR2_PACKAGE_POSTGRESQL_CLIENT if !BR2_PACKAGE_POSTGRESQL_SERVER
> 
> woudl be good.

Yeah, that looks much better.

> > +POSTGRESQL_BUILD_DIRECTORIES =
> > +POSTGRESQL_INSTALL_DIRECTORIES =
> 
> Not needed, variables are empty by default.

I know; it was for clarity (which is an "IMO" thing). I'll remove them.

> > +POSTGRESQL_CLIENT_DIRECTORIES += config src/include src/interfaces src/port \
> > +				 src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
> > +				 src/backend
> 
> Lines are a bit too long. What about instead:
> 
> POSTGRESQL_CLIENT_DIRECTORIES = \
> 	config src/include src/interfaces src/port src/backend \
> 	src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
> 
> > +POSTGRESQL_SERVER_DIRECTORIES = src/common src/timezone src/backend \
> > +				src/backend/utils/mb/conversion_procs \
> > +				src/backend/snowball src/backend/replication/libpqwalreceiver \
> > +				src/bin/initdb src/bin/pg_ctl \
> > +				src/bin/pg_controldata src/bin/pg_resetxlog src/pl \
> > +				src/bin/pg_basebackup
> 
> Ditto.

I'm fine with this.

> > +POSTGRESQL_INSTALL_DIRECTORIES += $(POSTGRESQL_SERVER_DIRECTORIES)
> > +POSTGRESQL_BUILD_DIRECTORIES += src/port $(POSTGRESQL_SERVER_DIRECTORIES)
> 
> Is it problematic if src/port gets installed in the server case? If
> not, then you don't need to have this difference between
> POSTGRESQL_INSTALL_DIRECTORIES and POSTGRESQL_BUILD_DIRECTORIES.

I'm not sure; I think it may have just client-related things which are
needed by the server build, but not install (e.g., headers). See below
for more.

> > +		echo $${dir}; \
> 
> Left-over debugging?

Indeed. Will remove.

> > +		$(MAKE) -C $(@D)/$${dir} || exit 1; \
> > +	done
> 
> Could you use a foreach loop instead ?
> 
> 	$(foreach d,$(POSTGRESQL_BUILD_DIRECTORIES),\
> 		$(MAKE) -C $(@D)/$(d)$(sep))
> 
> > +	for dir in $(POSTGRESQL_INSTALL_DIRECTORIES); do \
> 
> Ditto.
> 
> > +	for dir in $(POSTGRESQL_INSTALL_DIRECTORIES); do \
> 
> Ditto.

Ah, yes, this is better.

> Also, above the definition of POSTGRESQL_CLIENT_DIRECTORIES or
> POSTGRESQL_SERVER_DIRECTORIES, can you add a comment with a reference
> to the postgresql documentation that says which directories should be
> built/installed for the client and server cases? This way if we need to
> update the postgresql package in the future, we can do it by looking at
> the documentation.

The documentation just tells how to install just the client bits from a
full build; there is no mention of a client-less server install. These
bits are cribbed from the postgresql94-{server,client} ports from
FreeBSD where the two are completely separate ports. This is likely the
reason for src/port not being in the install for the server, but it is
built. Here, since there's a single build, it isn't such a problem.

I'll try using the specified directories in the documentation for the
client side. For the server side, comments could be added to the
src/bin/ directories for the server side, but the other bits are likely
"what it takes to build the binaries".

--Ben
