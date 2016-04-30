From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Apr 2016 22:56:25 +0200
Subject: [Buildroot] [PATCH v2 0/4] Bump to Python 3.5 and pyc
	compilation improvements
In-Reply-To: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLdTCD5CgsNwaCZRXWa4EXcuHpm18JjuWyLh_TBVx1k4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sat, Apr 30, 2016 at 2:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This series of patches bump Python3 to the 3.5 series, and brings some
> pyc compilation improvements gathered from patches sent by Yegor and
> Samuel.
>
> Patch 1 makes the bump to Python 3 itself. Compared to the previous
> version, feedback from Arnout has been taken into account (see the
> patch itself for details about the changes). We are now getting rid of
> the optimized .opt-<X>.pyc files since there is no way to use them
> without the non-optimized .pyc files.
>
> Patch 2 is a minor clean up in the python3 package, to make it look
> more similar to the python package.
>
> Patch 3 is the patch from Yegor to handle globally the compilation of
> .pyc files, which makes sure we don't remove .py files that had not
> been compiled. I have merged into it the improvements from Samuel that
> ensures the build aborts if the .pyc compilation fails.
>
> Patch 4 simplifies the samba4 package, which no longer needs to build
> .pyc files manually, as it's now done globally.
>
> Thanks!

I ran few quick build tests using:
- this python3-based defconfig [1];
- this python2-based defconfig [8].

With python3 enabled (i.e. using [1] defonfig), the series works as
expected, but I noticed a coupled of things:
- there are still some *.pyc installed by py-gobject [2]. This
clean-up can come in another patchset.
- Using the defconfig from [1], but with BR2_PACKAGE_PYTHON3_PY_PYC=y
instead of BR2_PACKAGE_PYTHON3_PY_ONLY=y, some packages trigger the
pycompile wrapper error because of missing 2to3-fixes, or
broken-on-purpose modules:
  - python-crossbar [3] (syntaxerror.py)
  - python-pyftpdlib [4]
  - python-pygame [5,6]
  IMHO, these fixes should be addressed before merging the series to
avoid a.b.o. turning red...
- it seems python-twisted has some broken install rules since it
installs its stuff directly in $(TARGET_DIR)/usr (see [7])...

With pyhton2 (i.e. using [8] defconfig), the series does not work as expected:
- there are some *.pyo in $(TARGET_DIR)/usr/lib/python2.7/site-package (see [9])
- Using the defconfig from [8], but with BR2_PACKAGE_PYTHON_PY_PYC=y
instead of BR2_PACKAGE_PYTHON_PY_ONLY=y, some packages trigger the
pycompile wrapper error because of python3-only-by-design modules, or
broken-on-purpose modules:
  - python-crossbar (same reason as with python3, see [3])
  - python-pexpect (triggers this issue [10])

Also whatever the python version is, some packages install stuff
outside /usr/lib/python*/ and compile its themselves (e.g.
python-gobject, python-web2py).
Shall we do something about that?
Anyway this can be addressed later.


[1] http://code.bulix.org/gn01eu-98176
[2] http://code.bulix.org/16aej8-98177
[3] http://code.bulix.org/31jro0-98179
[4] http://code.bulix.org/cjma75-98180
[5] http://code.bulix.org/3e86ux-98181
[6] http://code.bulix.org/fkjouw-98182
[7] http://code.bulix.org/epxk6m-98184
[8] http://code.bulix.org/o86r2k-98185
[9] http://code.bulix.org/l1hybv-98186
[10] https://github.com/pexpect/pexpect/issues/290


Regards,

-- 
Samuel
