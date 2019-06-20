From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:17:21 +0200
Subject: [Buildroot] [PATCH 3/6] package/python-pycairo: new package
In-Reply-To: <20190531171654.17906-3-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
 <20190531171654.17906-3-matthew.weber@rockwellcollins.com>
Message-ID: <20190620221721.0cbac654@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 May 2019 12:16:51 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
> new file mode 100644
> index 0000000000..2d44dec85e
> --- /dev/null
> +++ b/package/python-pycairo/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYCAIRO
> +	bool "python-pycairo"
> +	select on BR2_PACKAGE_CAIRO # runtime dependency

"select on" is not correct, it even prevents menuconfig from starting.

Also cairo is not a runtime dependency, but a build time dependency.
With your patch applied, if you do "make python-pycairo" to just build
python-pycairo and its build dependencies, the build fails with:

>>> python-pycairo 1.18.1 Building
(cd /home/thomas/projets/buildroot/output/build/python-pycairo-1.18.1//; _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabi" PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/libexec/python3-sphinx:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin" PYTHONPATH="/home/thomas/projets/buildroot/output/target/usr/lib/python3.7/" PYTHONNOUSERSITE=1 _python_sysroot=/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /home/thomas/projets/buildroot/output/host/bin/python setup.py build  )
running build
running build_py
creating build
creating build/lib.linux-x86_64-3.7
creating build/lib.linux-x86_64-3.7/cairo
copying cairo/__init__.py -> build/lib.linux-x86_64-3.7/cairo
copying cairo/__init__.pyi -> build/lib.linux-x86_64-3.7/cairo
copying cairo/py.typed -> build/lib.linux-x86_64-3.7/cairo
running build_ext
Package cairo was not found in the pkg-config search path.
Perhaps you should add the directory containing `cairo.pc'
to the PKG_CONFIG_PATH environment variable
Package 'cairo', required by 'virtual:world', not found
Command '['pkg-config', '--print-errors', '--exists', 'cairo >= 1.13.1']' returned non-zero exit status 1.

> +PYTHON_PYCAIRO_LICENSE = LGPL-2.0, MPL-1.1

The license is LGPL-2.1 or MPL-1.1

> +PYTHON_PYCAIRO_LICENSE_FILES = COPYING

Please add COPYING-LGPL-2.1 and COPYING-MPL-1.1 to the license files.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
