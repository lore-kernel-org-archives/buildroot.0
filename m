From: Matthew Weber <Matthew.Weber@collins.com>
Date: Thu, 29 Nov 2018 14:21:40 -0600
Subject: [Buildroot] [PATCH] package/setools: drop path prefix from man
 install
In-Reply-To: <1543461118-61712-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1543461118-61712-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpab0mm6H_5927egumC6pOqt1k2kDDsWP3Ao=poLZjDPDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Nov 28, 2018 at 9:12 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>

Patch should have been prefixed "next"

> For this man file install scenario, joining the sys.prefix makes the
> path absolute (this was previously working by accident).  It was
> found when e94280e5a537b "package/pkg-python: use proper --prefix
> and --root values" was merged.
>
> Fixes:
> http://autobuild.buildroot.net/results/e214e1a539cdac07028fb58c3822f89886d86f1f
>
> Upstream:
> https://github.com/SELinuxProject/setools/pull/13/commits/bc36cba1393120e65bfe4d0f642fd8d38010c0f7
>
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...etup.py-drop-path-prefix-from-man-install.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
>
> diff --git a/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch b/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
> new file mode 100644
> index 0000000..6334450
> --- /dev/null
> +++ b/package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch
> @@ -0,0 +1,42 @@
> +From bc36cba1393120e65bfe4d0f642fd8d38010c0f7 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Wed, 28 Nov 2018 20:49:00 -0600
> +Subject: [PATCH] setup.py: drop path prefix from man install
> +
> +If the directory is a relative path, it is interpreted relative to the
> +installation prefix (Python's sys.prefix for pure-Python packages,
> +sys.exec_prefix for packages that contain extension modules).
> +So the sys.prefix should not be joined because the correct one will be
> +added regardless. The reason why a relative path is going to work is
> +because the installation path is built internally joining python root
> +with python prefix, thus forming the correct path $(TARGET_DIR)/usr.
> +(https://docs.python.org/3/distutils/setupscript.html#installing-additional-files)
> +
> +For this man file install scenario, joining the sys.prefix makes the
> +path absolute (this was previously working by accident).
> +
> +Upstream: https://github.com/SELinuxProject/setools/pull/13/commits/bc36cba1393120e65bfe4d0f642fd8d38010c0f7
> +
> +Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +Cc: Arnout Vandecappelle <arnout@mind.be>
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 3767fbc..80e0400 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -136,7 +136,7 @@ setup(name='setools',
> +       cmdclass={'build_qhc': QtHelpCommand, 'clean': CleanCommand},
> +       packages=['setools', 'setools.diff', 'setoolsgui', 'setoolsgui.apol'],
> +       scripts=['apol', 'sediff', 'seinfo', 'seinfoflow', 'sesearch', 'sedta'],
> +-      data_files=[(join(sys.prefix, 'share/man/man1'), glob.glob("man/*.1"))],
> ++      data_files=[('share/man/man1', glob.glob("man/*.1"))],
> +       package_data={'': ['*.ui', '*.qhc', '*.qch'], 'setools': ['perm_map']},
> +       ext_modules=cythonize(ext_py_mods, include_path=['setools/policyrep'],
> +                             annotate=cython_annotate,
> +--
> +1.9.1
> +
> --
> 1.9.1
>


-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
