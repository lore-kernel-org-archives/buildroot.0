From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:38:48 +0100
Subject: [Buildroot] [PATCH v5 20/20] python-crossbar: new package
In-Reply-To: <1455188328-7595-3-git-send-email-mc5686@mclink.it>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
 <1455188328-7595-3-git-send-email-mc5686@mclink.it>
Message-ID: <20160220153848.0a8c45fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mauro,

On Thu, 11 Feb 2016 11:58:48 +0100, Mauro Condarelli wrote:

> diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
> new file mode 100644
> index 0000000..0cd3ee1
> --- /dev/null
> +++ b/package/python-crossbar/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_PYTHON_CROSSBAR
> +	bool "python-crossbar"
> +	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY

I tested with BR2_PACKAGE_PYTHON_PYC_ONLY=y and it just built and
worked fine for me. I was able to run "crossbar version" :

# crossbar version
Automatically choosing optimal Twisted reactor
Running on Linux and optimal reactor (epoll) was installed.
     __  __  __  __  __  __      __     __
    /  `|__)/  \/__`/__`|__) /\ |__)  |/  \
    \__,|  \\__/.__/.__/|__)/~~\|  \. |\__/
                                        
 Crossbar.io        : 0.12.1
   Autobahn         : 0.12.1 (with JSON, MessagePack, CBOR)
   Twisted          : 15.5.0-EPollReactor
   LMDB             : 0.89/lmdb-0.9.18
   Python           : 3.4.3/CPython
 OS                 : Linux-4.2.0-armv7l-with-libc1
 Machine            : armv7l

> +	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
> +	select BR2_PACKAGE_PYTHON_CBOR # runtime
> +	select BR2_PACKAGE_PYTHON_CLICK # runtime
> +	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
> +	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
> +	select BR2_PACKAGE_PYTHON_MISTUNE # runtime
> +	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
> +	select BR2_PACKAGE_PYTHON_NETADDR # runtime
> +	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
> +	select BR2_PACKAGE_PYTHON_PYASN # runtime
> +	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
> +	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
> +	select BR2_PACKAGE_PYTHON_PYINOTIFY # runtime
> +	select BR2_PACKAGE_PYTHON_PYNACL # runtime
> +	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
> +	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
> +	select BR2_PACKAGE_PYTHON_PYYAML # runtime
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> +	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
> +	select BR2_PACKAGE_PYTHON_SETPROCTITLE # runtime
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> +	select BR2_PACKAGE_PYTHON_SHUTILWHICH if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON_TREQ # runtime
> +	select BR2_PACKAGE_PYTHON_TWISTED # runtime
> +	select BR2_PACKAGE_PYTHON_UJSON # runtime
> +	select BR2_PACKAGE_PYTHON_WSACCEL # runtime

Mentioning "# runtime" each time was a bit annoying, so I've changed
this to one single comment at the beginning saying that all
dependencies are runtime dependencies.

Note however that:

 * Dependency on BR2_PACKAGE_PYTHON_LMDB was missing. Without this,
   "crossbar version" was failing with
   "pkg_resources.DistributionNotFound: The 'lmdb>=0.88' distribution
   was not found and is required by crossbar"

 * Dependency on BR2_PACKAGE_PYTHON_PYCPARSER was missing. Without
   this, "crossbar version" was failing with:
   "pkg_resources.DistributionNotFound: The 'pycparser' distribution
   was not found and is required by cffi".

Also, there is still one problem with your package: when running
"crossbar version", it complains that:

pkg_resources.DistributionNotFound: The 'shutilwhich>=1.1.0' distribution was not found and is required by crossbar

However, shutilwhich is only available for Python 2.x, and I'm using
Python 3.x. When I force enable python-shutilwhich on Python 3.x, then
I can run "crossbar version" (this is how I did my test above).

But since shutilwhich is not supposed to be enabled with Python 3.x,
this was really a hack.

Can you look into this and provide a solution?

Once again, when you submit new packages, please make sure that they
build and run by building a configuration that only has *this* package
enabled.

> +PYTHON_CROSSBAR_LICENSE = AGPL3

We use AGPLv3 and not AGPL3.

I've committed to the next branch with those issues fixed, except the
shutilwhich one.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
