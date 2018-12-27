From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 27 Dec 2018 21:50:15 +0100
Subject: [Buildroot] Building cargo with per-package directories
In-Reply-To: <20181226154959.6a793c8d@windsurf.home>
References: <20181211171252.02ddb571@windsurf> <20181211212705.GA13119@itchy>
 <20181212225041.GA15035@itchy>
 <20181226154959.6a793c8d@windsurf.home>
Message-ID: <20181227205015.GA27373@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-12-26 15:49, Thomas Petazzoni wrote:
> Hello Eric,
>
> On Wed, 12 Dec 2018 23:50:41 +0100, Eric Le Bihan wrote:
>
> > diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
> > index 1b1053ba41..891901578e 100644
> > --- a/package/cargo/cargo.mk
> > +++ b/package/cargo/cargo.mk
> > @@ -70,7 +70,7 @@ HOST_CARGO_SNAP_OPTS = \
> >  	$(if $(VERBOSE),--verbose)
> >
> >  HOST_CARGO_ENV = \
> > -	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
> > +	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib -Clink-arg=-L$(HOST_DIR)/lib" \
> >  	CARGO_HOME=$(HOST_CARGO_HOME)
> >
> >  define HOST_CARGO_BUILD_CMDS
> > ```
> >
> > [1] https://doc.rust-lang.org/cargo/reference/build-scripts.html#outputs-of-the-build-script
>
> Thanks a lot, I was finally able to test this, and confirm it works
> fine.
>
> I propose to change it to:
>
> 	RUSTFLAGS="$(addprefix -Clink-arg=,$(HOST_LDFLAGS))"
>
> so that if we ever change HOST_LDFLAGS in the future, it will continue
> to work. What do you think ?

I tested this change without issues, so I will post a patch to include
it in the cargo package.

Regards,

--
ELB
