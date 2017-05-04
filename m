From: Mario Rugiero <mrugiero@gmail.com>
Date: Thu, 4 May 2017 10:34:18 -0300
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <20170504145610.39ba9d06@free-electrons.com>
References: <20170503205945.7065-1-mrugiero@gmail.com>
 <20170504145610.39ba9d06@free-electrons.com>
Message-ID: <CAKKQwLSKh5LijFRDNDXmocqgxtgSk1Gt_8vh8wnFDbCPbtdZJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-05-04 9:56 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed,  3 May 2017 17:59:45 -0300, Mario J. Rugiero wrote:
>> Includes upstream patch working around a gcc bug which got fixed in version 4.5.0.
>>
>> Fixes:
>> http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
>> http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
>> http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/
>>
>> Tested with:
>> qemu_aarch64_virt_defconfig
>>
>> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
>
> I've applied this patch, and then tried building with a gcc 4.3
> toolchain, and still get:
>
> libtool: compile:  /home/thomas/projets/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-g++ -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pthread -DHAVE_PTHREAD=1 -Wall -Wno-sign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c google/protobuf/util/type_resolver_util.cc  -fPIC -DPIC -o google/protobuf/util/.libs/type_resolver_util.o
> In file included from ./google/protobuf/metadata.h:41,
>                  from ./google/protobuf/type.pb.h:27,
>                  from google/protobuf/util/type_resolver_util.cc:33:
> ./google/protobuf/metadata_lite.h: In constructor 'google::protobuf::internal::InternalMetadataWithArenaLite::InternalMetadataWithArenaLite(google::protobuf::Arena*)':
> ./google/protobuf/metadata_lite.h:170: error: class 'google::protobuf::internal::InternalMetadataWithArenaLite' does not have any field named 'InternalMetadataWithArenaBase'
> In file included from ./google/protobuf/metadata.h:41,
>                  from ./google/protobuf/compiler/plugin.pb.h:27,
>                  from google/protobuf/compiler/code_generator.cc:37:
> ./google/protobuf/metadata_lite.h: In constructor 'google::protobuf::internal::InternalMetadataWithArenaLite::InternalMetadataWithArenaLite(google::protobuf::Arena*)':
> ./google/protobuf/metadata_lite.h:170: error: class 'google::protobuf::internal::InternalMetadataWithArenaLite' does not have any field named 'InternalMetadataWithArenaBase'
> In file included from ./google/protobuf/metadata.h:41,
>                  from ./google/protobuf/duration.pb.h:27,
>                  from ./google/protobuf/util/time_util.h:45,
>                  from google/protobuf/util/time_util.cc:31:
> ./google/protobuf/metadata_lite.h: In constructor 'google::protobuf::internal::InternalMetadataWithArenaLite::InternalMetadataWithArenaLite(google::protobuf::Arena*)':
> ./google/protobuf/metadata_lite.h:170: error: class 'google::protobuf::internal::InternalMetadataWithArenaLite' does not have any field named 'InternalMetadataWithArenaBase'
> In file included from ./google/protobuf/metadata.h:41,
>                  from ./google/protobuf/type.pb.h:27,
>                  from ./google/protobuf/util/internal/type_info.h:35,
>                  from ./google/protobuf/util/internal/default_value_objectwriter.h:43,
>                  from google/protobuf/util/json_util.cc:36:
> ./google/protobuf/metadata_lite.h: In constructor 'google::protobuf::internal::InternalMetadataWithArenaLite::InternalMetadataWithArenaLite(google::protobuf::Arena*)':
> ./google/protobuf/metadata_lite.h:170: error: class 'google::protobuf::internal::InternalMetadataWithArenaLite' does not have any field named 'InternalMetadataWithArenaBase'
> Makefile:4068: recipe for target 'google/protobuf/util/time_util.lo' failed
> make[5]: *** [google/protobuf/util/time_util.lo] Error 1
> make[5]: *** Waiting for unfinished jobs....
> Makefile:4068: recipe for target 'google/protobuf/util/type_resolver_util.lo' failed
> make[5]: *** [google/protobuf/util/type_resolver_util.lo] Error 1
> Makefile:4068: recipe for target 'google/protobuf/util/json_util.lo' failed
> make[5]: *** [google/protobuf/util/json_util.lo] Error 1
> Makefile:4068: recipe for target 'google/protobuf/compiler/code_generator.lo' failed
> make[5]: *** [google/protobuf/compiler/code_generator.lo] Error 1
> Makefile:2076: recipe for target 'all' failed
> make[4]: *** [all] Error 2
> Makefile:1396: recipe for target 'all-recursive' failed
> make[3]: *** [all-recursive] Error 1
> Makefile:1302: recipe for target 'all' failed
> make[2]: *** [all] Error 2
> package/pkg-generic.mk:227: recipe for target '/home/thomas/projets/buildroot/output/build/protobuf-3.3.0/.stamp_built' failed
> make[1]: *** [/home/thomas/projets/buildroot/output/build/protobuf-3.3.0/.stamp_built] Error 2
> Makefile:79: recipe for target '_all' failed
> make: *** [_all] Error 2
>
> You can reproduce this by using the following configuration:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://sources.buildroot.net/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-none-linux-gnueabi"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_PROTOBUF=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
Thanks, I'll look into it.
