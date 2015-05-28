From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 28 May 2015 15:21:32 -0400
Subject: [Buildroot] Package Support with systemd
	(LIBFOO_INSTALL_INIT_SYSTEMD)
In-Reply-To: <CALe+oY-tezAuQPFRVzmJky3JOCpGMyorPFSZ8U0Xh6qJsaiZ=w@mail.gmail.com>
References: <CALe+oY-tezAuQPFRVzmJky3JOCpGMyorPFSZ8U0Xh6qJsaiZ=w@mail.gmail.com>
Message-ID: <CANPyyuOHQFwdrtLa2MJj4K1V5nujCp0zsqX13V-fQci8_EfDMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Thu, May 28, 2015 at 1:56 PM, James Knight
<james.knight@rockwellcollins.com> wrote:
> Recent work I'm doing consists of building a target which uses
> systemd. I've been cleaning up my target's file system; the specific
> cleanup I want to mention is the location of my services and startup
> (*-wants) locations. Some packages appear to install an
> example/provided systemd service file into the "/etc/systemd/system/"
> or configure automatic startup under a "/etc/systemd/system/*.wants/"
> folder. Is there a reason why the /etc root path is being used instead
> of /usr/lib (or /lib)?

Putting services in /etc and /lib is probably just a result of
historical ambiguity over the correct path; there weren't really any
rules about where to place service files before. If you look through
the commit logs you'll see myself and others moving services a few at
a time to /usr/lib/systemd/system. buildroot's systemd itself has
flip-flopped from /usr/lib to /lib back and forth a few times as well.

I thought /lib was in theory only supported for systems that still
maintain an unmerged /usr (only Debian+derivatives now?), see here:
https://wiki.freedesktop.org/www/Software/systemd/TheCaseForTheUsrMerge/

Personally, I would like buildroot to merge those directories in the
base skeleton, as it would track what all distros seem headed towards,
but I don't know enough about other use cases to recommend it
categorically.

>
> From what I know, systemd will look up system services, targets and
> more under the following paths:
>  - /etc/systemd/system/*
>  - /run/systemd/system/*
>  - /usr/lib/systemd/system/*
>  - /lib/systemd/system/*
>
> (see http://www.freedesktop.org/software/systemd/man/systemd.unit.html)
>
> On the manual page it notes that the /etc root location is for "local
> configuration" versus "installed packages". Doesn't it make sense for
> built target's to use a lib folder than the etc folder? This would
> allow, on a persistable system, a user to "easily" override a built
> target's services (without having to worry about saving the original;
> ignoring any restriction the builder may want to impose). I would
> imagine the following would be better approach:
>
> ```
> $(INSTALL) -D -m 644 package/<package>/<package>.service \
> $(TARGET_DIR)/usr/lib/systemd/system/<package>.service
> mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants
> ln -fs ../../../../usr/lib/systemd/system/<package>.service \
> $(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants/<package>.service
> ```

I guess it depends on if you view buildroot's default configuration as
'local configuration' or 'installed packages'. I approached it as
default local configuration, mostly because buildroot tries to use
unmodified upstream as much as possible, so only upstream service
files (and buildroot provided .service files for packages that do not
provide their own) should go in /usr/lib/systemd/system. Same thing
for those packages that have their own .wants links, those go in /usr.
This makes it clear which parts of the filesystem are stock upstream
and which are either buildroot or user customizations. Then, buildroot
provides default local configuration in /etc enabling services, along
with all other types of default configuration placed there.

Part of my motivation is that I basically rm -rf output/target/etc
before copying my fs-overlay/etc and fs-overlay/usr. This removes all
of buildroot's default configuration and lets me place my own in both
dirs. It's easier to do this than to keep track of which files in
/usr/lib/systemd/system have been put there by buildroot instead of
upstream, and then individually removing them in post-build.sh.

>
> Examples]
>  ntp installs service and auto-start into etc:
>   http://git.buildroot.net/buildroot/tree/package/ntp/ntp.mk
>
>  postgresql installs into lib and auto-start into etc:
>   http://git.buildroot.net/buildroot/tree/package/postgresql/postgresql.mk
>
>  new packages configuring auto-start into etc:
>   https://patchwork.ozlabs.org/patch/475859/
>
> ps>
> I would have even suggested using the "/lib/systemd/system/" location
> over "/usr/lib/systemd/system/" but I don't see any mention of the
> path in the manual (although I do see the path used in systemd code
> and the default install location of basic services/targets right now
> is "/lib/systemd/system").

Yeah, I started moving things to /usr/lib over /lib because of the man
pages, it seemed like it would make more sense to newcomers to
buildroot if their package's service files ended up where the man
pages say they should.

Mike
