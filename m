From: Roy van Dam <roy@vandam-innovations.com>
Date: Fri, 30 Mar 2012 11:54:37 +0200
Subject: [Buildroot] External configuration files
Message-ID: <763F580D-226E-4AB7-ADF1-CFEB19B9E91B@vandam-innovations.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

For a project I've developed a wrapper around the Buildroot2012.02 package that maintains a some of the additional features we need here internally. This all works fine, except for the fact that Buildroot keeps messing up the configuration files on initial import. The first time the build process is executed the configuration path parameters (see below) are directly passed to buildroot. Buildroot imports them when needed during the build and the build succeeds fine, however some of the configuration settings in uClibc and Busybox are being overwritten with default values. For example I need uClibc to be build with RPC support but Buildroot keeps unchecking the flag upon import of the configuration file.

The following parameters are passed to the Buildroot.
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=/path/to/linux.config
BR2_PACKAGE_BUSYBOX_CONFIG=/path/to/busybox.config
BR2_UCLIBC_CONFIG=/path/to/uclibc.config
BUSYBOX_CONFIG_FILE=/path/to/busybox.config
UCLIBC_CONFIG_FILE=/path/to/uclibc.config

Any call to make that follows will only be passed the BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE parameter as Buildroot complains about it when it's not there. This way Buildroot can use the normal .config files of the modules. After a `*-menuconfig` of one of the modules the new .config file is copied to the configuration folder outside the Builtroot tree to keep the files in sync. The required flags are set in those external configuration file, so the copy/sync works. I also tried passing the BR2_* parameters on every call to Buildroot but without success, then it just keeps unchecking my flags.

Maybe I just doing something stupid, but it's very annoying that the configuration files are merged with some sort of defconfig and I have no clue where to look any further.

Thanks in advance!

Best regards,
Roy van Dam
Van Dam Innovations

T: (+31) (0) 625 20 40 10
M: roy at vandam-innovations.com
W: http://www.vandam-innovations.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120330/e2d4a197/attachment.html>
