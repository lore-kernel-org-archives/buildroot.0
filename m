From: Davide Viti <zinosat@tiscali.it>
Date: Tue, 29 Dec 2015 23:37:52 +0100
Subject: [Buildroot] [PATCH 1/1] python-paho-mqtt: add new package
In-Reply-To: <20151228142514.58df0700@free-electrons.com>
References: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
 <20151228142514.58df0700@free-electrons.com>
Message-ID: <CAKpAL0=3nfy0Y3qDZm5-UrckQ1t5Vn1dyMN_EcOWEjK7skve4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*Hi Thomas and Yegor,*

I've tried to rebuild the package using python3 and the build fails finding
$(HOST_DIR)/usr/bin/python2

I guess it's worth discussing the redefinition of
PYTHON_PAHO_MQTT_INSTALL_TARGET_CMDS though, since it probably is the
origin of the problems

2015-12-28 14:25 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

>
> On Mon, 28 Dec 2015 13:57:35 +0100, Davide Viti wrote:
>
> > ...
> > +define PYTHON_PAHO_MQTT_INSTALL_TARGET_CMDS
> > +     (cd $(@D); \
> > +             $(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> > +             $(HOST_DIR)/usr/bin/python2 setup.py install \
> > +             --root=/)
> > +endef
>
> Why do you need to override <pkg>_INSTALL_TARGET_CMDS ?
>
> Using $(HOST_PKG_PYTHON_SETUPTOOLS_ENV) for a target package looks
> clearly wrong. Also, since you're not passing
> --prefix=$(TARGET_DIR)/usr, I don't see how this overriden install
> target commands can even install something in $(TARGET_DIR).
>
> Could you clarify this?
>
>
The install stage of the package, fails with the following error (I
replaced the custom paths with "..."):

.../bin/python setup.py install --prefix=... --executable=/usr/bin/python
--single-version-externally-managed --root=/ )
usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
or: setup.py --help [cmd1 cmd2 ...]
or: setup.py --help-commands
or: setup.py cmd --help

error: option --executable not recognized

I narrowed this down to "--executable" and
"--single-version-externally-managed" not being supported by setup.py
I've looked at packages/pkg-python.mk and tried to fix it overriding
"PYTHON_PAHO_MQTT_BASE_INSTALL_TARGET_OPTS" and
"PYTHON_PAHO_MQTT_INSTALL_TARGET_OPTS" but it did not work, so I ended up
overriding the entire rule.
Never packaged a python module before, so thank you for assisting me in
this process

Davide
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151229/98d3a12f/attachment.html>
