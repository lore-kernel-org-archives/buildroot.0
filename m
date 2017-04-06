From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 6 Apr 2017 18:12:15 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
Message-ID: <CAOf5uwkL9FX3Fq2Dou1jnixat2CWxtWSbXG+Q=RQ=y3pSyjRzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I can pass this build step

On Thu, Apr 6, 2017 at 1:47 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> Hello Arnout,
>
>> Gesendet: Donnerstag, 06. April 2017 um 12:57 Uhr
>> Von: "Arnout Vandecappelle" <arnout@mind.be>
>> An: "Buildroot Mailing List" <buildroot@buildroot.org>, "Peter Seiderer" <ps.report@gmx.net>, "Ga?l PORTAY" <gael.portay@savoirfairelinux.com>, "Julien Corjon" <corjon.j@ecagroup.com>
>> Betreff: Qt5 build failure (beaglebone_qt5_defconfig)
>>
>>  Hi Qt5 specialists,
>>
>>  For quite some time now (basically since the 5.8.0 bump I think),
>> beaglebone_qt5_defconfig has been failing [1]. The error is:
>>
>> cd photoviewer/ && ( test -e Makefile ||
>> /builds/buildroot.org/buildroot/output/host/usr/bin/qmake -o Makefile
>> /builds/buildroot.org/buildroot/output/build/qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
>> ) && /usr/bin/make -f Makefile
>> Project ERROR: Unknown module(s) in QT: widgets
>>
>>  Probably some missing Config.in dependency, or else a missing exclusion of
>> demos that require widgets.
>>
>>  Can someone take a look?
>>
>
> Untested but maybe the following works:
>
> diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
> index 853322c..5e0fbe2 100644
> --- a/package/qt5/qt5declarative/Config.in
> +++ b/package/qt5/qt5declarative/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
>         select BR2_PACKAGE_QT5XMLPATTERNS
>         select BR2_PACKAGE_QT5BASE
>         select BR2_PACKAGE_QT5BASE_GUI
> +       select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5BASE_EXAMPLES
>         depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>         help
>           Qt is a cross-platform application and UI framework for
>

Tested-by: Michael Trimarchi <michael@amarulasolutions.com>

But we have still two problems:

make[1]: Leaving directory
'/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593'
PATH="/home/michael/work/amarula/bticino/buildroot/output/host/bin:/home/michael/work/amarula/bticino/buildroot/output/host/sbin:/home/michael/work/amarula/bticino/buildroot/output/host/usr/bin:/home/michael/work/amarula/bticino/buildroot/output/host/usr/sbin:/opt/OpenPrinting-Gutenprint/sbin:/opt/OpenPrinting-Gutenprint/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin"
BR_BINARIES_DIR=/home/michael/work/amarula/bticino/buildroot/output/images
/usr/bin/make  HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
INSTALL_MOD_PATH=/home/michael/work/amarula/bticino/buildroot/output/target
CROSS_COMPILE="/home/michael/work/amarula/bticino/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/michael/work/amarula/bticino/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=1 -C
/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593
am335x-evm.dtb am335x-bone.dtb am335x-boneblack.dtb
am335x-bonegreen.dtb am335x-evmsk.dtb
make[1]: Entering directory
'/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593'
  DTC     arch/arm/boot/dts/am335x-bone.dtb
  DTC     arch/arm/boot/dts/am335x-evm.dtb
make[2]: *** No rule to make target
'arch/arm/boot/dts/am335x-bonegreen.dtb'.  Stop.
arch/arm/Makefile:314: recipe for target 'am335x-bonegreen.dtb' failed
make[1]: *** [am335x-bonegreen.dtb] Error 2
make[1]: *** Waiting for unfinished jobs....
  DTC     arch/arm/boot/dts/am335x-boneblack.dtb
make[1]: Leaving directory
'/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593'
package/pkg-generic.mk:227: recipe for target
'/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/.stamp_built'
failed
make: *** [/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/.stamp_built]
Error 2


and if I remove kernel and bootloader configuration

chmod a+x /home/michael/work/amarula/bticino/buildroot/output/build/_fakeroot.fs
PATH="/home/michael/work/amarula/bticino/buildroot/output/host/bin:/home/michael/work/amarula/bticino/buildroot/output/host/sbin:/home/michael/work/amarula/bticino/buildroot/output/host/usr/bin:/home/michael/work/amarula/bticino/buildroot/output/host/usr/sbin:/opt/OpenPrinting-Gutenprint/sbin:/opt/OpenPrinting-Gutenprint/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin"
/home/michael/work/amarula/bticino/buildroot/output/host/usr/bin/fakeroot
-- /home/michael/work/amarula/bticino/buildroot/output/build/_fakeroot.fs
rootdir=/home/michael/work/amarula/bticino/buildroot/output/target
table='/home/michael/work/amarula/bticino/buildroot/output/build/_device_table.txt'
genext2fs: couldn't allocate a block (no free space)
fs/ext2/ext2.mk:44: recipe for target
'/home/michael/work/amarula/bticino/buildroot/output/images/rootfs.ext2'
failed
make: *** [/home/michael/work/amarula/bticino/buildroot/output/images/rootfs.ext2]
Error 1

> Regards,
> Peter
>
>>  Regards,
>>  Arnout
>>
>>
>>
>> [1] https://gitlab.com/buildroot.org/buildroot/builds/13476094
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
