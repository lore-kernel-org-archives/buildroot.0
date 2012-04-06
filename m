From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 6 Apr 2012 16:30:17 +0200
Subject: [Buildroot] External configuration files
In-Reply-To: <763F580D-226E-4AB7-ADF1-CFEB19B9E91B@vandam-innovations.com>
References: <763F580D-226E-4AB7-ADF1-CFEB19B9E91B@vandam-innovations.com>
Message-ID: <CAAXf6LUeW4-50c-Lhr-KtP7f644Mkk7k58EFRpgkOz+ye0qTBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Mar 30, 2012 at 11:54 AM, Roy van Dam
<roy@vandam-innovations.com> wrote:
> Hi,
>
> For a project I've developed a wrapper around the Buildroot2012.02 package
> that maintains a some of the additional features we need here
> internally.?This all works fine, except for the fact that Buildroot keeps
> messing up the configuration files on initial import. The first time the
> build process is executed the configuration path parameters (see below) are
> directly passed to buildroot. Buildroot imports them when needed during the
> build and the build succeeds fine, however some of the configuration
> settings in uClibc and Busybox are being overwritten with default values.
> For example I need uClibc to be build with RPC support but Buildroot keeps
> unchecking the flag upon import of the configuration file.
>
> The following parameters are passed to the Buildroot.
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=/path/to/linux.config
> BR2_PACKAGE_BUSYBOX_CONFIG=/path/to/busybox.config
> BR2_UCLIBC_CONFIG=/path/to/uclibc.config
> BUSYBOX_CONFIG_FILE=/path/to/busybox.config
> UCLIBC_CONFIG_FILE=/path/to/uclibc.config
>
> Any call to make that follows will only be passed
> the?BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE parameter as Buildroot complains
> about it when it's not there. This way Buildroot can use the normal .config
> files of the modules. After a `*-menuconfig` of one of the modules the new
> .config file is copied to the configuration folder outside the Builtroot
> tree to keep the files in sync. The required flags are set in those external
> configuration file, so the copy/sync works.?I also tried passing the BR2_*
> parameters on every call to Buildroot but without success, then it just
> keeps unchecking my flags.
>
> Maybe I just doing something stupid, but it's very annoying that the
> configuration files are merged with some sort of defconfig and I have no
> clue where to look any further.

The normal way to handle project-specific things is to add a defconfig
file, containing the configuration you need, in the 'configs'
directory. This defconfig would refer to the different .config files
of uClibc, busybox ...  You would set this configuration by running
'make <yourproject>_defconfig'.
The different .config files can be stored in a directory
board/<manufacturer>/<project>.
The following presentation explains this among others:
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf

Is there a specific reason you are not doing it this way?
If so, what is the content of the buildroot .config file? I don't see
you passing any configuration for that...
Specifically for RPC, the uClibc RPC setting will be modified to
reflect the global RPC setting in the buildroot .config. If you do not
have that properly set, the behavior you see is normal.

Best regards,
thomas
