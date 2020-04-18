From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Apr 2020 12:01:24 +0200
Subject: [Buildroot] compilation issue with a uboot-tools / ubootenv
 client program
In-Reply-To: <7af4b2f6-543d-86ba-d392-9101cf7e14ce@smile.fr>
References: <790fd2c10c690f6e5df1c312c709b2c136d75a74.camel@orolia.com>
 <7af4b2f6-543d-86ba-d392-9101cf7e14ce@smile.fr>
Message-ID: <f07c0918-fec3-557c-35af-0efafc9d8ffc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas, All,

Le 17/04/2020 ? 13:24, Romain Naour a ?crit?:
> Hi Nicolas,
> 
> Le 17/04/2020 ? 12:17, Nicolas Carrier a ?crit?:
>> Hello,
>> I'm upgrading the buildroot version we're shipping in our products,
>> from buildroot 2019.02.5 to 2020.02.1.
>>
>> My issue is that I have a program which interacts with the u-boot
>> environment and thus, uses the headers of the ubootenv library provided
>> by uboot-tools, which doesn't compile anymore.
>>
>> Concretely during the compilation, gcc complains of a missing env.h
>> header, which is included by the fw_env.h that my program is using.
>> Exact error:
>>
>> [ 50%] Building C object CMakeFiles/fw-env-reproducer.dir/main.o
>> In file included from
>> /home/ncarrier/workspace/buildroot/output/build/fw-env-
>> reproducer/main.c:2:
>> /home/ncarrier/workspace/buildroot/output/host/arm-buildroot-linux-
>> uclibcgnueabihf/sysroot/usr/include/fw_env.h:7:10: fatal error: env.h:
>> No such file or directory
>>  #include <env.h>
>>           ^~~~~~~
>> compilation terminated.
> 
> This is an upstream change from uboot, see :
> https://gitlab.denx.de/u-boot/u-boot/-/commit/9fb625ce05539fe6876a59ce1dcadb76b33c6f6e

It's seems an upstream bug since env_set() is not used in fw_env tool.

Adding env.h is an error since it also include compiler.h (and others uboot
internal includes) which is not present in STAGING_DIR.

Nicolas removed env.h from fw_env tool and fixed it's build issue.

This problem is present since uboot v2019.10, so the uboot version present in
Buildroot 2020.02 is affected.

Best regards,
Romain
