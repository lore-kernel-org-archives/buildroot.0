From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 18:54:07 +0200
Subject: [Buildroot] [RFC] package/python-mako: build host-python-mako
 as python3 module for mesa3d build.
In-Reply-To: <20190413164606.25700-1-romain.naour@smile.fr>
References: <20190413164606.25700-1-romain.naour@smile.fr>
Message-ID: <20190413185407.7b474503@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Sat, 13 Apr 2019 18:46:06 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> But adding python3 on the target in order to have a python3 module
> on the host is not nice.
> 
> To build host-python-mako as python3 module we can add this line
> in pyhon-mako package:
> HOST_PYTHON_MAKO_NEEDS_HOST_PYTHON = python3
> 
> But python mako is not available anymore for python2 interpreter.
> 
> The problem is more global, how can we build the same python
> module for python2 and/or python3 on the host ?

We can't :-)

> Mako module is also used by gnuradio build system and building
> this module for python3 for mesa3d can eventually break the build of
> gnuradio when the python interpreter on the host is python2
> (to be tested).

Indeed, your patch would break situations where mesa3d is enabled, but
another package needs host-python-mako for python2 (and not python3).

We solved this problem for python-setuptools by having
host-python-setuptools and host-python3-setuptools as separate
packages. It's not great, but we don't have any other good solution for
this at the moment I believe.

Alternatively, perhaps for host Python modules we should always install
them for both host-python and host-python3 (if both are enabled, of
course). The gotcha is that since we don't have any Config.in options
for host packages, how can we know if host-python and/or host-python3
are enabled ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
