From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Apr 2019 22:24:08 +0200
Subject: [Buildroot] [RFC] package/python-mako: build host-python-mako
 as python3 module for mesa3d build.
In-Reply-To: <20190413164606.25700-1-romain.naour@smile.fr>
References: <20190413164606.25700-1-romain.naour@smile.fr>
Message-ID: <7e08d753-a332-50e5-f19b-f1191db3cde4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout, All,

Le 13/04/2019 ? 18:46, Romain Naour a ?crit?:
> Since a long time, it was not possible to build mesa3d from the git
> repository due to the missing dependency on host-python-mako package
> in mesa3d package.
> 
> python-mako module is used by a python script
> ir_expression_operation.py to build the header file
> ir_expression_operation_constant.h.
> 
> Hopefully when building mesa3d from a tarball release using the
> autotools build system, this header is alreay generated and the build
> continue.
> 
> But we are switching mesa3d package to meson build system that check
> unconditionnaly if the mako module for python3 interpreter is present.
> 
> Even by removing this check, the meson build system call
> ir_expression_operation.py script even if
> ir_expression_operation_constant.h is already generated.
> 
> The problem with host-python-mako and mesa3d is that we need to build
> mako module for python3 interpreter. Adding host-python-mako as mesa3d
> dependency is not enough since it can be build as host python2 module
> when BR2_PACKAGE_PYTHON3 is not selected for the target.
> 
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
> 
> Mako module is also used by gnuradio build system and building
> this module for python3 for mesa3d can eventually break the build of
> gnuradio when the python interpreter on the host is python2
> (to be tested).
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---

Actually it's easier to hack the mesa's meson build system than hacking the
python infra...

I have a small patch for mesa that allow to use generated files present in the
release archive (like autotools buils system does).

Best regards,
Romain
