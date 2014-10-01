From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 1 Oct 2014 17:14:04 +0200
Subject: [Buildroot] [PATCH 1/6] python3: add distutils fix for PEP 3147
	issue
In-Reply-To: <1412113141-17650-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1412113141-17650-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141001171404.78e112ee@grp-cvubrugier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 30 Sep 2014 23:38:56 +0200, Thomas Petazzoni wrote :
> Python 3 has a new standard for installing .pyc file, called PEP
> 3147. Unfortunately, this standard requires both the .py and .pyc
> files to be installed for a Python module to be found. This is quite
> annoying on space-constrained embedded systems, since the .py file is
> technically not required for execution.
> 
> For the Python standard library, our Python 3 package already contains
> a patch named python3-004-old-stdlib-cache.patch, which allows to
> disable the PEP 3147 installation.
> 
> But that lives the distutils/setuptools package an unsolved
> problem. This patch therefore adds a new patch to Python, which makes
> distutils package use the traditional installation path when byte
> compiling, rather than the PEP 3147 installation path. Since
> setuptools relies on distutils internally, it also fixes setuptools
> based packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../python3/python3-016-distutils-no-pep3147.patch | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/python3/python3-016-distutils-no-pep3147.patch
> 
> diff --git a/package/python3/python3-016-distutils-no-pep3147.patch b/package/python3/python3-016-distutils-no-pep3147.patch
> new file mode 100644
> index 0000000..0fdfeb2
> --- /dev/null
> +++ b/package/python3/python3-016-distutils-no-pep3147.patch
> @@ -0,0 +1,36 @@
> +Add distutils fix for PEP 3147 issue
> +
> +Python 3 has a new standard for installing .pyc file, called PEP
> +3147. Unfortunately, this standard requires both the .py and .pyc
> +files to be installed for a Python module to be found. This is quite
> +annoying on space-constrained embedded systems, since the .py file is
> +technically not required for execution.
> +
> +For the Python standard library, our Python 3 package already contains
> +a patch named python3-004-old-stdlib-cache.patch, which allows to
> +disable the PEP 3147 installation.
> +
> +But that lives the distutils/setuptools package an unsolved
              ^
            leaves?

Otherwise, looks good to me.

Reviewed-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

> +problem. This patch therefore adds a new patch to Python, which makes
> +distutils package use the traditional installation path when byte
> +compiling, rather than the PEP 3147 installation path. Since
> +setuptools relies on distutils internally, it also fixes setuptools
> +based packages.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/Lib/distutils/util.py
> +===================================================================
> +--- a/Lib/distutils/util.py
> ++++ b/Lib/distutils/util.py
> +@@ -437,7 +437,9 @@
> +             # Terminology from the py_compile module:
> +             #   cfile - byte-compiled file
> +             #   dfile - purported source filename (same as 'file' by default)
> +-            if optimize >= 0:
> ++            if "_python_sysroot" in os.environ:
> ++                cfile = file + (__debug__ and "c" or "o")
> ++            elif optimize >= 0:
> +                 cfile = importlib.util.cache_from_source(
> +                     file, debug_override=not optimize)
> +             else:


-- 
Christophe Vu-Brugier
