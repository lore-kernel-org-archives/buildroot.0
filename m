From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:30:14 +0200
Subject: [Buildroot] Mysqld startup problems
In-Reply-To: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
References: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
Message-ID: <ba440c62-d192-435f-2b3f-099611dd88fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Steve,

 No reason to send this twice :-)

On 08-08-17 17:10, Steve Calfee wrote:
> Hi, I am trying to upgrade to the latest buildroot from I think it was
> 2016.08. As an intermediate step, while waiting for 2017.08, I am
> upgrading to 2017.05.02.
> 
> Everything builds fine, it boots and runs ok.
> 
> But mysqld did not get started. I did have it working before. I know
> something was done with the mariadb and mysql becoming virtual
> packages, but I am not sure what.

 Since the new oracle-mysql package does seem to get built, the virtual package
itself can't be the issue.

 I also don't see any other change since 2016.08 that could be relevant.

> The problem I see is S97mysqld wants
> to start /usr/bin/mysqld_safe and mysqld_safe is not installed
> anywhere in the target.

 That is indeed a problem... Could you see what the package *does* install? Just
'grep ^oracle-mysql output/build/packages-file-list.txt'.

> So I would appreciate any tips on where to look.
> 
> Thanks, Steve
> 
> Here is my dockstar_glibc_buildroot_defconfig

 I'll try to build with this defconfig when I find the time. However:

> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../new_sept_2014_tools/output/host/usr"

 I obviously can't use this toolchain, but I would be surprised if that were the
issue.

> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
> BR2_TARGET_GENERIC_HOSTNAME="dockstar"
> BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
> BR2_ROOTFS_DEVICE_TABLE="$(BR2_EXTERNAL)/seagatedockstar/device_table.txt"
> BR2_GENERATE_LOCALE="en_US.UTF-8"
> BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL)/seagatedockstar/skeleton"
> BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL)/seagatedockstar/patchrootfs.sh"

 This script doesn't happen to remove mysqld_safe, does it? :-)

[snip]
> There are quite a few warnings in the server build, but no errors that
> I can see:

 Please use a pastebin for such huge output.

[snip]
>>>> oracle-mysql 5.1.73 Autoreconfiguring
> aclocal: warning: autoconf input should be named 'configure.ac', not
> 'configure.in'

 Autoreconf often gives a lot of warnings, they can be ignored.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
