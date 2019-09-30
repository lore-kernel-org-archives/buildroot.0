From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:33:47 +0200
Subject: [Buildroot] [PATCH 04/08] package/python-daphne: new package
In-Reply-To: <20190804011631.86261-5-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-5-aduskett@gmail.com>
Message-ID: <20190930213347.6704553f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Aug 2019 21:16:27 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Daphne is a HTTP, HTTP2 and WebSocket protocol server for ASGI and ASGI-HTTP,
> developed to power Django Channels.
> 
> It supports automatic negotiation of protocols; there's no need for URL
> prefixing to determine WebSocket endpoints versus HTTP endpoints.
> 
> In addition, add the patch: remove pytest-runner-requirement.
> Setup and runtime work without without pytest-runner as such, it is not actually
> a requirement for building.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied, but after making a number of changes, and I also have a
few comments/suggestions. See below.

> diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
> new file mode 100644
> index 0000000000..c471d60e8c
> --- /dev/null
> +++ b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
> @@ -0,0 +1,27 @@
> +From f9d881cc55c89f51240f93308713216cfec793eb Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Sat, 3 Aug 2019 14:23:19 -0400
> +Subject: [PATCH] remove pytest-runner requirement
> +
> +Setup does not actually require pytest-runner. As such, remove it.
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 64e94f1..4e3abb0 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -23,7 +23,6 @@ setup(
> +     packages=find_packages() + ["twisted.plugins"],
> +     include_package_data=True,
> +     install_requires=["twisted>=18.7", "autobahn>=0.18", "asgiref~=3.0"],
> +-    setup_requires=["pytest-runner"],

Shouldn't the pytest-runner requirement be moved...

> +     extras_require={
> +         "tests": ["hypothesis~=3.88", "pytest~=3.10", "pytest-asyncio~=0.8"]

... here, if it's only needed for testing ?

That would perhaps make this change acceptable upstream ?

> diff --git a/package/python-daphne/Config.in b/package/python-daphne/Config.in
> new file mode 100644
> index 0000000000..b60004976d
> --- /dev/null
> +++ b/package/python-daphne/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_DAPHNE
> +	bool "python-daphne"
> +	select BR2_PACKAGE_PYTHON_TWISTED # runtime
> +	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
> +	select BR2_PACKAGE_PYTHON_ASGIREF # runtime

Alphabetic ordering was not respected here.

In addition, python-daphne only works with Python 3.x, this is
documented in the README.md, and also it doesn't byte-compile with
Python 2.x.

Speaking of that, I think asgiref and autobahn also need Python 3.x.
Indeed, when I try to build python-daphne with Python 2.x, I get this:

Compiling usr/lib/python2.7/site-packages/asgiref/compatibility.py ...
  File "usr/lib/python2.7/site-packages/asgiref/compatibility.py", line 32
    async def new_application(scope, receive, send):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/asgiref/server.py ...
  File "usr/lib/python2.7/site-packages/asgiref/server.py", line 64
    async def handle(self):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/asgiref/sync.py ...
  File "usr/lib/python2.7/site-packages/asgiref/sync.py", line 134
    async def main_wrap(self, args, kwargs, call_result, source_thread):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/asgiref/testing.py ...
  File "usr/lib/python2.7/site-packages/asgiref/testing.py", line 24
    async def wait(self, timeout=1):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/asgiref/timeout.py ...
  File "usr/lib/python2.7/site-packages/asgiref/timeout.py", line 34
    timeout: Optional[float],
           ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/asgiref/wsgi.py ...
  File "usr/lib/python2.7/site-packages/asgiref/wsgi.py", line 14
    async def __call__(self, scope, receive, send):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/autobahn/xbr/_buyer.py ...
  File "usr/lib/python2.7/site-packages/autobahn/xbr/_buyer.py", line 195
    async def stop(self):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/autobahn/xbr/_interfaces.py ...
  File "usr/lib/python2.7/site-packages/autobahn/xbr/_interfaces.py", line 141
    async def start(self, session):
        ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/autobahn/xbr/_seller.py ...
  File "usr/lib/python2.7/site-packages/autobahn/xbr/_seller.py", line 447
    async def balance(self):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/daphne/cli.py ...
  File "usr/lib/python2.7/site-packages/daphne/cli.py", line 29
    async def asgi(self, receive, send, scope):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/daphne/server.py ...
  File "usr/lib/python2.7/site-packages/daphne/server.py", line 213
    async def handle_reply(self, protocol, message):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/daphne/testing.py ...
  File "usr/lib/python2.7/site-packages/daphne/testing.py", line 166
    async def __call__(self, send, receive):
            ^
SyntaxError: invalid syntax



> +PYTHON_DAPHNE_VERSION = 2.3.0
> +PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
> +PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/7b/f1/994f55248e27059e160f9d07bf5d325a9891b99daf1eb775a14110e91e5b
> +PYTHON_DAPHNE_SETUP_TYPE = setuptools
> +PYTHON_DAPHNE_LICENSE = BSD

As suggested by Yegor, I fixed that to say BSD-3-Clause. Could you
contact upstream so that the LICENSE file that is in their Github repo
makes its way to the tarball provided on PyPi ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
