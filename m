From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 23 Nov 2013 16:09:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-22
In-Reply-To: <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
Message-ID: <CAAXf6LWcrN+nGz+M=Gi4UMmvgeXB3c5BSooQNwZ=v7dcoT+4NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 23, 2013 at 2:11 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
> On Sat, Nov 23, 2013 at 8:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Build statistics for 2013-11-22
>> ===============================
>>
>>         success : 68
>>        failures : 34
>>        timeouts : 0
>>           TOTAL : 102
>>
> [..]
>
>>       sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/8dc9bca5969d455cc30206fc1ae6e1d3ba6eb6ca/
>
> Error is:
>
> In file included from src/FPEnvironment_C99.cpp:37:0,
>                  from src/FPEnvironment.cpp:48:
> include/Poco/FPEnvironment_C99.h:56:30: error: 'FE_DOWNWARD' was not
> declared in this scope
> include/Poco/FPEnvironment_C99.h:57:30: error: 'FE_UPWARD' was not
> declared in this scope
> make[2]: *** [/home/test/test/2/output/build/poco-1.4.6p1/Foundation/obj/Linux/sh4a/release_shared/FPEnvironment.o]
> Error 1
> make[2]: Leaving directory
> `/home/test/test/2/output/build/poco-1.4.6p1/Foundation'
> make[1]: *** [Foundation-libexec] Error 2
> make[1]: Leaving directory `/home/test/test/2/output/build/poco-1.4.6p1'
> make: *** [/home/test/test/2/output/build/poco-1.4.6p1/.stamp_built] Error 2
>
>
> The same build failure has been discussed a long time ago here:
> http://lists.busybox.net/pipermail/buildroot/2011-September/046013.html
> when the poco package was introduced. Then, the fpenvironment was
> disabled when the C library is uclibc.
> In the current failure, the C library seems to be glibc.
> I'm including Baruch on this one, who was involved in the above
> thread. Baruch: any idea?
>
>>        arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e5484bcdcca7f2cb48913d65271de4b957ea3450/
>>        arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/ea4627cae45e972ebba5b33a2b2871ce7f46fedc/
>
> I'm looking at the above two ones...

The udisks problem is the following: the configuration requests lvm2
support in udisks, which causes:
select BR2_PACKAGE_LVM2_APP_LIBRARY
The configuration also has BR2_PACKAGE_LVM2_DMSETUP_ONLY selected.
The problem is that both are not supposed to be configured together:

config BR2_PACKAGE_LVM2_DMSETUP_ONLY
        bool "install dmsetup only"
        depends on BR2_PACKAGE_LVM2
        help
          Install dmsetup only and skip the LVM2 suite.

config BR2_PACKAGE_LVM2_APP_LIBRARY
        bool "install application library"
        depends on BR2_PACKAGE_LVM2
        depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
        help
          Install application library (liblvm2app)

In the configuration menu, it seems you can indeed create such an
invalid configuration: start with LVM2_DMSETUP_ONLY selected, then
enable udisks with lvm2 support. If you save, you get a .config that
has:

$ grep LVM .config
BR2_PACKAGE_LVM2=y
BR2_PACKAGE_LVM2_DMSETUP_ONLY=y
BR2_PACKAGE_LVM2_APP_LIBRARY=y
BR2_PACKAGE_UDISKS_LVM2=y

Because DMSETUP_ONLY is setup, the install command does not install
the lvm2app, which is needed for udisks.

This could be solved by adding 'depends on
!BR2_PACKAGE_LVM2_DMSETUP_ONLY' to the option BR2_PACKAGE_UDISKS_LVM2,
so that you cannot enable lvm2 support in udisks if DMSETUP_ONLY is
selected.
However, is there a better solution? I tried 'select
!BR2_PACKAGE_LVM2_DMSETUP_ONLY' to explicitly turn off DMSETUP_ONLY
when lvm2 support is requested, but this seems invalid.

Thanks for your input,
Thomas
