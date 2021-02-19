From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Feb 2021 09:24:09 +0100
Subject: [Buildroot] [PATCH] package/rust: disable ninja
In-Reply-To: <f36ed50b-06ea-947b-272c-ace0daf53ca7@gmail.com>
References: <20210217232411.290242-1-romain.naour@gmail.com>
 <ba18df82-1dd9-1e48-e42d-9524ad6c5591@mind.be>
 <f36ed50b-06ea-947b-272c-ace0daf53ca7@gmail.com>
Message-ID: <95a75c2d-b1f9-8130-f95b-1e8ab7d9d1c1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/02/2021 21:32, Romain Naour wrote:
> Hello Arnout,
> 
> Le 18/02/2021 ? 20:00, Arnout Vandecappelle a ?crit?:
>>
>>
>> On 18/02/2021 00:24, Romain Naour wrote:
>>> Ninja has recently be enabled as the default build system to build
>>> llvm fork for rust compiler [1]. But we can still use Make if
>>> "ninja = false" is provided in config.toml.
>>>
>>> Ninja support can be enabled by a following patch.
>>>
>>> [1] https://github.com/rust-lang/rust/commit/30b7dac745b1555cd96f41977f7d24435cbe7fa2
>>
>>  That commit reports a speedup of about 2 minutes in build time (on a highly
>> parallel system). I guess that on a lowlier system, the build time will still
>> improve by more than the 10 seconds it takes to build ninja...
> 
> Yes, but the rust package was using Make build system until recently. I'm not
> sure if we should switch to ninja for 2021.02 release.

 True.

> 
>>
>>  So I'd propose to instead just add
>>
>> HOST_RUST_DEPENDENCIES += ninja
> 
> You mean host-ninja
> 
>>
>>  (Note that long-term, I'd like to switch to ninja build for CMake packages in
>> general. Not that rust is a cmake package, but llvm is.)
> 
> That was already suggested long time ago but the benefit was rather small at
> that time:
> 
> http://patchwork.ozlabs.org/project/buildroot/patch/20170106223748.2203-1-cedric.marie at openmailbox.org/

 At the time, host-ninja still depended on host-python{,3}. This is no longer
the case. Now the overhead of host-ninja is just about 10s, so IMHO it's worth
it if it can shave off a minute off the build time of a large package.

 Regards,
 Arnout


> 
> Best regards,
> Romain
> 
> 
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> Fixes:
>>> https://gitlab.com/buildroot.org/buildroot/-/jobs/1019386205
>>>
>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>>> ---
>>>  package/rust/rust.mk | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
>>> index 798450e04e..a38a3d64f5 100644
>>> --- a/package/rust/rust.mk
>>> +++ b/package/rust/rust.mk
>>> @@ -65,6 +65,8 @@ define HOST_RUST_CONFIGURE_CMDS
>>>  		echo 'channel = "stable"'; \
>>>  		echo '[target.$(RUSTC_TARGET_NAME)]'; \
>>>  		echo 'cc = "$(TARGET_CROSS)gcc"'; \
>>> +		echo '[llvm]'; \
>>> +		echo 'ninja = false'; \
>>>  	) > $(@D)/config.toml
>>>  endef
>>>  
>>>
> 
