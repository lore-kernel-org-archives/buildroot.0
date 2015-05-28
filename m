From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 28 May 2015 13:56:24 -0400
Subject: [Buildroot] Package Support with systemd
	(LIBFOO_INSTALL_INIT_SYSTEMD)
Message-ID: <CALe+oY-tezAuQPFRVzmJky3JOCpGMyorPFSZ8U0Xh6qJsaiZ=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent work I'm doing consists of building a target which uses
systemd. I've been cleaning up my target's file system; the specific
cleanup I want to mention is the location of my services and startup
(*-wants) locations. Some packages appear to install an
example/provided systemd service file into the "/etc/systemd/system/"
or configure automatic startup under a "/etc/systemd/system/*.wants/"
folder. Is there a reason why the /etc root path is being used instead
of /usr/lib (or /lib)?

From what I know, systemd will look up system services, targets and
more under the following paths:
 - /etc/systemd/system/*
 - /run/systemd/system/*
 - /usr/lib/systemd/system/*
 - /lib/systemd/system/*

(see http://www.freedesktop.org/software/systemd/man/systemd.unit.html)

On the manual page it notes that the /etc root location is for "local
configuration" versus "installed packages". Doesn't it make sense for
built target's to use a lib folder than the etc folder? This would
allow, on a persistable system, a user to "easily" override a built
target's services (without having to worry about saving the original;
ignoring any restriction the builder may want to impose). I would
imagine the following would be better approach:

```
$(INSTALL) -D -m 644 package/<package>/<package>.service \
$(TARGET_DIR)/usr/lib/systemd/system/<package>.service
mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants
ln -fs ../../../../usr/lib/systemd/system/<package>.service \
$(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants/<package>.service
```

Examples]
 ntp installs service and auto-start into etc:
  http://git.buildroot.net/buildroot/tree/package/ntp/ntp.mk

 postgresql installs into lib and auto-start into etc:
  http://git.buildroot.net/buildroot/tree/package/postgresql/postgresql.mk

 new packages configuring auto-start into etc:
  https://patchwork.ozlabs.org/patch/475859/

ps>
I would have even suggested using the "/lib/systemd/system/" location
over "/usr/lib/systemd/system/" but I don't see any mention of the
path in the manual (although I do see the path used in systemd code
and the default install location of basic services/targets right now
is "/lib/systemd/system").
