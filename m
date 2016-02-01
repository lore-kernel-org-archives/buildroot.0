From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 Feb 2016 15:57:38 +0100
Subject: [Buildroot] [PATCH v2 1/2] toolchain-external: add a check for
 unsupported toolchains
In-Reply-To: <20160201153839.6325ebba@free-electrons.com>
References: <1454334017-12326-1-git-send-email-romain.naour@gmail.com>
 <20160201153839.6325ebba@free-electrons.com>
Message-ID: <56AF7262.1080002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/02/2016 15:38, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Mon,  1 Feb 2016 14:40:16 +0100, Romain Naour wrote:
> 
>> Here is the sysroot directory tree for linaro 2015.11:
>> $ ls libc/arm-linux-gnueabihf
>> etc  lib  sbin  usr  var
>>
>> Here is the sysroot directory tree for CodeSourcery standard:
>> $ ls libc/sgxx-glibc
>> etc  lib  lib64  sbin  usr  var
>>
>> Usually the sysroot is located directly under libc directory
>> $ ls libc/
>> etc  lib  sbin  usr  var
> 
> I think this is not "usual", for example it's not the case for
> Buildroot or Crosstool-NG toolchain.

Ok, I'll simply remove this comment then. It seems that there is no "usual" case
with sysroot toolchains.

> 
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index 02cc0bb..fd99efe 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -418,6 +418,11 @@ check_unusable_toolchain = \
>>  		echo "and contain a lot of pre-built libraries that would conflict with"; \
>>  		echo "the ones Buildroot wants to build."; \
>>  		exit 1; \
>> +	fi; \
>> +	non_existent_sysroot=`$${__CROSS_CC} -print-file-name=libc.a` ; \
> 
> The variable should not be named non_existent_sysroot since it may
> exist. Also, you could use the existing toolchain_find_libc_a function,
> no? So maybe:
> 
> 	libc_a_path=$(call toolchain_find_libc_a,$${__CROSS_CC}) ; \

ok for the variable naming, but I didn't used toolchain_find_libc_a directly
because realpath -f is used by this function.

The path returned is $PWD/libc.a when something go wrong with the sysroot.
So the test would be test -d in this case but I think it's better to test the
path returned by __CROSS_CC directly against "libc.a".

Thoughts ?

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
