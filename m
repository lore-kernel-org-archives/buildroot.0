From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 May 2015 16:19:19 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150517155219.6acb4d2d@free-electrons.com>
References: <20150517063017.77AD4100D35@stock.ovh.net>	<20150517124934.20a9c661@free-electrons.com>	<555884B7.5030806@openwide.fr>
 <20150517155219.6acb4d2d@free-electrons.com>
Message-ID: <5558A367.7050706@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/05/2015 15:52, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sun, 17 May 2015 14:08:23 +0200, Romain Naour wrote:
> 
>>>>       xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/c1ef3b4fae3ddf3206ee79141dc36bef50085b6a/
>>>
>>> Max, can you have a look at this one?
>>
>> There is a patch for this one but with some comment on it:
>> http://patchwork.ozlabs.org/patch/470073/
>>
>> The proposal was to disable ptrace for xtensa with uClibc/uClibc-ng toolchains,

Ok I should have said uClibc-xtensa/uClibc-ng...

>> but those toolchain can also be fixed by a patch like this one for PowerPC:
>> http://git.buildroot.net/buildroot/commit/?id=e0a4d9fa6fa68b95181fbaf1babcbb3cf2c9c63b
>>
>> Or better yet, use the upstream commit made by Baruch Siach:
>> http://git.uclibc.org/uClibc/commit/?id=de6561f6669308e5d2297589b39a217d4c14df1c
>>
>> Waldemar, can you have a look for uClibc-ng ?
> 
> Hum, Xtensa is using uClibc master, not uClibc-ng. And Xtensa uses the
> uClibc commit 7bf35c8b7d4a1f97174eb49f47f33946b282114c, whic includes
> commit de6561f6669308e5d2297589b39a217d4c14df1c.

... but indeed uClibc-xtensa is already fixed.

> 
> So why are we seeing the issue?

If you look at the config file from [1] and [2], uClibc-ng is used.

BR2_UCLIBC_VERSION_STRING="1.0.2"
BR2_UCLIBC_CONFIG="package/uclibc/uClibc-ng.config"

The commit de6561f6669308e5d2297589b39a217d4c14df1c from uClibc is not
backported yet in uClibc-ng 1.0.2.

We should instead disable pthread on xtensa only with uClibc-ng.

[1] http://autobuild.buildroot.net/results/c1ef3b4fae3ddf3206ee79141dc36bef50085b6a/

[2]
http://autobuild.buildroot.org/results/d03/d035e3735e414acb26ae79a8cf55a562c89d01e8/

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
