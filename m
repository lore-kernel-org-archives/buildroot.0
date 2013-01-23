From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Jan 2013 07:13:01 +0100
Subject: [Buildroot] Question about Buildroot-Based External Toolchains
 with 2012.11.1
In-Reply-To: <9A206D81F45CAE4EB5A38D7E602F5AEA0B77257E@TRANSXCH01.transcrypt.local>
References: <9A206D81F45CAE4EB5A38D7E602F5AEA0B772447@TRANSXCH01.transcrypt.local>
 <CAHXCMM+tZ_BFH6ZkE1sAzaDbyb+0NH67COk1QG5bR=Eek=uKHg@mail.gmail.com>
 <9A206D81F45CAE4EB5A38D7E602F5AEA0B77257E@TRANSXCH01.transcrypt.local>
Message-ID: <CAHXCMM+giefpvPJ8S_P2o_Gv6+Zm-up-A62PPcpG4SCu8EwdnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

2013/1/23 Will Bickford <WBickford@efji.com>:
>> -----Original Message-----
>> >
>> > Related discussion:
>> > http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/45427
>>
>> This discussion deals with making relocatable a toolchain built using
>> internal Buildroot toolchain backend, to be able to use it as an
>> external one later (i.e. in another build configuration).
>
> This is what I've done in the past (with the exception that in 2010.05 the produced toolchain didn't have the usr/ problem). I have one configuration marked to build an internal toolchain. I then use that as an external toolchain when configuring and building my target. I don't actually need it to be relocatable.

Having a usr/ directory is not a problem by itself, it just makes the
toolchains built using the internal Buildroot backend less similar to
any other external ones.
This usr/ hack aims to make them look like any other external
toolchains to avoid special case to locate the crosstools in the
external toolchain backend.

So, in your case, it should not change anything...

First, build the toolchain somewhere using:
$ make O=/path/to/toolchain
This way, the crosstools will be located in /path/to/toolchain/host/usr/bin/

Then, use it as a custom external toolchain, setting
/path/to/toolchain/host/usr/ as "Toolchain path"
(BR2_TOOLCHAIN_EXTERNAL_PATH).

>
> Would it make more sense to archive the state of our buildroot directory immediately after building the toolchain?

imho, it would not.

> I was under the impression that using Buildroot to build external toolchains would be a common operation. So far it looks like more time has been spent supporting third-party toolchains like crosstool-NG.

Note that the internal Buildroot toolchain backend will be deprecated
sooner or later in favor of the Crosstool-NG backend.

>
> Our solution right now is relatively cheap in terms of disk space (a 50 MiB bz2 archive of the installed toolchain). A typical working directory for our toolchain is 3.3 GiB.
>
> Doing a quick grep on the source tree it looks like there are 290 instances of 'HOST_DIR)/usr'. If I patch Buildroot to use the old path (via a config option), would it make sense to contribute that change? I'd prefer not to re-patch the next time we need to update.


Regards,

-- 
Samuel
