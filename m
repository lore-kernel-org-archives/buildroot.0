From: Martin Bark <martin@barkynet.com>
Date: Thu, 2 Jul 2015 09:22:06 +0100
Subject: [Buildroot] [v3 1/4] package/nodejs: Add node.js v0.12.5 and
 set as the default version
In-Reply-To: <20150630222004.GB21499@free.fr>
References: <1435660966-11347-1-git-send-email-martin@barkynet.com>
 <20150630222004.GB21499@free.fr>
Message-ID: <CAFGQKxdey7==9-UJnnh=Gg=CkONB37KVOPXYoihY1t4068w6Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On 30 June 2015 at 23:20, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2015-06-30 11:42 +0100, Martin Bark spake thusly:
>> The version of the V8 JavaScript engine used by node.js v0.12.5 requires
>> at least an ARMv6 architecture with VFPv2.  For this reason v0.10.39
>> remains the default for ARMv5 targets, all other targets now default to
>> v0.12.5.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> In fact, I missed something, which Thomas did notice...
>
> [--SNIP--]
>> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
>> index 9a39385..1e0681b 100644
>> --- a/package/nodejs/Config.in
>> +++ b/package/nodejs/Config.in
>> @@ -24,18 +24,23 @@ if BR2_PACKAGE_NODEJS
>>
>>  choice
>>       prompt "Node.js version"
>> -     default BR2_BR2_PACKAGE_NODEJS_0_10_39
>> +     default BR2_BR2_PACKAGE_NODEJS_0_10_39 if BR2_ARM_CPU_ARMV5
>> +     default BR2_BR2_PACKAGE_NODEJS_0_12_5
>
> This is OK and must be kept, however...
>
>>       help
>>         Select the version of Node.js you wish to use.
>>
>>  config BR2_BR2_PACKAGE_NODEJS_0_10_39
>>       bool "v0.10.39"
>>
>> +config BR2_BR2_PACKAGE_NODEJS_0_12_5
>> +     bool "v0.12.5"
>
> ... why did you drop the dependency on !BR2_ARM_CPU_ARMV5 here?
>
> My comment about reworking the choice was only about the default of the
> choice, to have defaults that are coherent with the dependencies of the
> options.
>
> We still need to hide 0.12.5 for armv5.
>
> Note: we put the dependencies after the prompt, like so:
>
>     # 0.12.5 uses VP8 which requires armv6 or above
>     config BR2_BR2_PACKAGE_NODEJS_0_12_5
>         bool "0.12.5"
>         depends on !BR2_ARM_CPU_ARMV5

Woops, well spotted, my mistake.  I'll fix that in a v4 patch set.

Thanks

Martin

>
> Regards,
> Yann E. MORIN.
>
>>  endchoice
>>
>>  config BR2_PACKAGE_NODEJS_VERSION_STRING
>>       string
>>       default "0.10.39"       if BR2_BR2_PACKAGE_NODEJS_0_10_39
>> +     default "0.12.5"        if BR2_BR2_PACKAGE_NODEJS_0_12_5
>>
>>  menu "Module Selection"
>>
>> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
>> index bc1f15f..816d602 100644
>> --- a/package/nodejs/nodejs.hash
>> +++ b/package/nodejs/nodejs.hash
>> @@ -1,2 +1,5 @@
>>  # From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
>>  sha256       68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
>> +
>> +# From upstream URL: http://nodejs.org/dist/v0.12.5/SHASUMS256.txt
>> +sha256       4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2  node-v0.12.5.tar.gz
>> --
>> 2.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
