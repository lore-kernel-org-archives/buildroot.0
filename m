From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:26:21 +0100
Subject: [Buildroot] [PATCH v4] package/python-pillow: new package
In-Reply-To: <1455962149-29459-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1455962149-29459-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160221152621.52c42acd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Sat, 20 Feb 2016 10:55:49 +0100, Angelo Compagnucci wrote:
> This patch adds python-pillow, the friendly python image library fork.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This package does not build when jpeg is disabled:

running build_ext
Traceback (most recent call last):
  File "setup.py", line 711, in <module>
    zip_safe=not debug_build(),
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/core.py", line 148, in setup
    dist.run_commands()
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/dist.py", line 955, in run_commands
    self.run_command(cmd)
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/dist.py", line 974, in run_command
    cmd_obj.run()
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/command/build.py", line 126, in run
    self.run_command(cmd_name)
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/cmd.py", line 313, in run_command
    self.distribution.run_command(command)
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/dist.py", line 974, in run_command
    cmd_obj.run()
  File "/home/thomas/projets/buildroot/output/host/usr/lib/python3.4/distutils/command/build_ext.py", line 342, in run
    self.build_extensions()
  File "setup.py", line 459, in build_extensions
    % (f, f))
ValueError: --enable-jpeg requested but jpeg not found, aborting.

It seems like you should pass explicit --enable/--disable options,
since at least jpeg and zlib are by default expected to be enabled.
See https://pillow.readthedocs.org/en/latest/installation.html#external-libraries.

Unfortunately, those options are only recognized when calling "setup.py
build_ext", not when calling "setup.py build" as the python-package
infrastructure is doing. So you might need to override the build
commands for this package.


> diff --git a/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch b/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
> new file mode 100644
> index 0000000..5f43013
> --- /dev/null
> +++ b/package/python-pillow/0001-setup.py-removing-unneeded-platform-guess.patch
> @@ -0,0 +1,85 @@
> +From cb8c67c0b7ee805100c381300ea29262e8b5838a Mon Sep 17 00:00:00 2001
> +From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +Date: Thu, 22 Oct 2015 22:45:31 +0200
> +Subject: [PATCH] setup.py: removing unneeded platform guess
> +
> +Platform guess is not needed when cross compiling on buildroot
> +so removing it.
> +
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Can you submit this patch upstream or at least report the issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
