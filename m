From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Apr 2016 22:56:33 +0200
Subject: [Buildroot] [PATCH v2 1/4] python3: bump to 3.5.1
In-Reply-To: <1462020471-29986-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462020471-29986-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJv9J3zSXFDRwR6ujMa6ekwAxu1Tpn8nR+T3QfoDoT70g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sat, Apr 30, 2016 at 2:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The major changes in terms of Buildroot packaging are:
>
>  - Due to PEP488, Python no longer generates .pyc (unoptimized) and
>    .pyo (optimized) byte-code files. Instead, it generates <foo>.pyc,
>    <foo>.opt-1.pyc and <foo>.opt-2.pyc. Therefore, we removed the
>    --disable-pyo-build option and kept only the --disable-pyc-build
>    option, which completely disables building all .pyc files. In
>    addition, since the optimized .opt-X.pyc files don't work if the
>    corresponding un-optimized .pyc file is not present, we are for the
>    moment unconditionally removing the optimized ones (keeping both
>    the unoptimized and optimized ones doubles the required filesystem
>    size!). So basically we preserve the behavior we had before this
>    commit:
>
>      BR2_PACKAGE_PYTHON3_PY_ONLY -> only *.py
>      BR2_PACKAGE_PYTHON3_PYC_ONLY -> only non-optimized *.pyc
>      BR2_PACKAGE_PYTHON3_PY_PYC -> both the *.py and non-optimized *.pyc
>
>    To achieve this, the TARGET_FINALIZE_HOOKS are reworked:
>
>     PYTHON3_REMOVE_PY_FILES is responsible for removing *.py files in
>     the BR2_PACKAGE_PYTHON3_PYC_ONLY case.
>
>     PYTHON3_REMOVE_PYC_FILES is responsible for removing *.pyc files
>     in the BR2_PACKAGE_PYTHON3_PY_ONLY case.
>
>     PYTHON3_REMOVE_OPTIMIZED_PYC_FILES is responsible for removing the
>     optimized *.opt-1.pyc and *.opt-2.pyc files, which is done
>     unconditionally.
>
>  - The PEP3147 disabling patch had to be significantly reworked due to
>    the code having changed heavily. The code was moved into a
>    _bootstrap_external.py, which is a "frozen" Python module, i.e a
>    module generated into a .h file at compile time using the
>    _freeze_importlib program.
>
>  - Due to the above, we now need to regenerate importlib.h at build
>    time. Unfortunately, for the target Python _freeze_importlib is
>    built for the target, so we can't run it on the build machine. To
>    fix this, we copy the _freeze_importlib program from the
>    host-python in $(HOST_DIR), and then patch the target python to use
>    it. Since the same solution can be used for 'pgen', we do it, and
>    avoid having to touch the graminit.{c,h} files.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
