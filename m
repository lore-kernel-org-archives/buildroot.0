From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 11:55:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-numpy: remove unsafe
 path possibly contamine target package with host libraries
In-Reply-To: <20190802121449.17254-1-alexandre.payen@smile.fr>
References: <20190802121449.17254-1-alexandre.payen@smile.fr>
Message-ID: <15ca143e-b613-aa31-1279-bab96cbb06d4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alex, Romain,

On 02/08/2019 14:14, Aalx wrote:
> From: Romain Naour <romain.naour@smile.fr>
> 
> When python-numpy is cross-compiled, the path provided by the build process are
> hard-coded. Those paths are unsafe because they could poison the target package
> with host libraries.

 I tested it fairly extensively, and it doesn't seem to be needed. Indeed, in
site.cfg we set library_dirs and include_dirs explicitly, so the build system
never uses those defaults.

 To verify this, I added the following at the end of get_paths() in system_info.py:

        for v in ret:
            if v.startswith('/usr'):
                raise ImplementationError("Path %s starts with /usr: %s" %
                                          (key, ret))


 There could be an issue with runtime_library_dirs or src_dirs because we don't
override those, but apparently they're not used since I don't hit that
exception... But I didn't test very extensively. If it is one of these that
triggers the issue, please instead extend site.cfg with those paths.

 Regards,
 Arnout

> 
> Doing so, we can cross-compile python-scipy added in a following patch.
> 
> So :
> - Remove every unsafe path for cross-compiling in python-numpy.
> - Let the buildroot infrastructure provide the correct path through sysroot.
> 
> A similar fix have been done in Yocto Project.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ced097eb4e30133acc6c3e9ed841b3463844cd39
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> ---
>  .../0001-distutils-remove-poisoned-path.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/python-numpy/0001-distutils-remove-poisoned-path.patch
> 
> diff --git a/package/python-numpy/0001-distutils-remove-poisoned-path.patch b/package/python-numpy/0001-distutils-remove-poisoned-path.patch
> new file mode 100644
> index 0000000000..8bd19db8e8
> --- /dev/null
> +++ b/package/python-numpy/0001-distutils-remove-poisoned-path.patch
> @@ -0,0 +1,79 @@
> +From 89e5645bd80b57252a3babdbd68277490dc187e5 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Fri, 7 Jun 2019 18:02:53 +0200
> +Subject: [PATCH] distutils: remove poisoned path
> +
> +When python-numpy is cross-compiled, the path provided by the build process are
> +hard-coded. Those paths are unsafe because they could poison the target package
> +with host libraries.
> +
> +Doing so, we can cross-compile python-scipy added in a following patch.
> +
> +So :
> +- Remove every unsafe path for cross-compiling in python-numpy.
> +- Let the buildroot infrastructure provide the correct path through sysroot.
> +
> +A similar fix have been done in Yocto Project.
> +http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ced097eb4e30133acc6c3e9ed841b3463844cd39
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> +---
> + numpy/distutils/system_info.py | 33 ++++++---------------------------
> + 1 file changed, 6 insertions(+), 27 deletions(-)
> +
> +diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
> +index 806f4f7d3..7cadd325d 100644
> +--- a/numpy/distutils/system_info.py
> ++++ b/numpy/distutils/system_info.py
> +@@ -276,29 +276,13 @@ if sys.platform == 'win32':
> +             add_system_root(os.path.join(conda_dir, 'Library'))
> + 
> + else:
> +-    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
> +-                                 '/opt/local/lib', '/sw/lib'], platform_bits)
> ++    default_lib_dirs = []
> +     default_runtime_dirs = []
> +-    default_include_dirs = ['/usr/local/include',
> +-                            '/opt/include', '/usr/include',
> +-                            # path of umfpack under macports
> +-                            '/opt/local/include/ufsparse',
> +-                            '/opt/local/include', '/sw/include',
> +-                            '/usr/include/suitesparse']
> +-    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
> +-
> +-    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
> +-                                     '/usr/lib'], platform_bits)
> +-    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
> +-                                '/usr/include']
> +-
> +-    if os.path.exists('/usr/lib/X11'):
> +-        globbed_x11_dir = glob('/usr/lib/*/libX11.so')
> +-        if globbed_x11_dir:
> +-            x11_so_dir = os.path.split(globbed_x11_dir[0])[0]
> +-            default_x11_lib_dirs.extend([x11_so_dir, '/usr/lib/X11'])
> +-            default_x11_include_dirs.extend(['/usr/lib/X11/include',
> +-                                             '/usr/include/X11'])
> ++    default_include_dirs = []
> ++    default_src_dirs = ['.']
> ++
> ++    default_x11_lib_dirs = []
> ++    default_x11_include_dirs = []
> + 
> +     tmp = None
> +     try:
> +@@ -321,11 +305,6 @@ else:
> +         if tmp is not None:
> +             tmp.close()
> + 
> +-if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
> +-    default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
> +-    default_include_dirs.append(os.path.join(sys.prefix, 'include'))
> +-    default_src_dirs.append(os.path.join(sys.prefix, 'src'))
> +-
> + default_lib_dirs = [_m for _m in default_lib_dirs if os.path.isdir(_m)]
> + default_runtime_dirs = [_m for _m in default_runtime_dirs if os.path.isdir(_m)]
> + default_include_dirs = [_m for _m in default_include_dirs if os.path.isdir(_m)]
> +-- 
> +2.20.1
> +
> 
