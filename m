From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 31 May 2020 16:12:37 +0200
Subject: [Buildroot] [for-next] package/rust: allow using python3
 interpreter
In-Reply-To: <20200531151020.3f1fae20@windsurf.home>
References: <20200526182037.592824-1-romain.naour@gmail.com>
 <20200529231401.4c66c5d9@windsurf.home>
 <49ffaaec-73fe-0cd0-9a4d-ff920f5c2562@gmail.com>
 <20200531151020.3f1fae20@windsurf.home>
Message-ID: <5a3e64c6-78fc-cf17-771b-1c95b8662981@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 31/05/2020 ? 15:10, Thomas Petazzoni a ?crit?:
> On Fri, 29 May 2020 23:45:23 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>>> Shouldn't we try to find an upstreamable solution here, such as perhaps
>>> a PYTHON environment variable, or an argument to configure that allows
>>> to specify the path to the Python interpreter ?
>>>
>>> But in fact, this path to the Python interpreter is already in the
>>> config.toml file that we generate, why isn't this path used ?  
>>
>> humm, It seems that this configure script is not used at all by rust package
>> since we use directly x.py...
>> So we can just drop this patch.
> 
> Could you send a follow-up patch ?

http://patchwork.ozlabs.org/project/buildroot/patch/20200530134344.24976-1-romain.naour at gmail.com/

> 
>>>> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>>>> +HOST_RUST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
>>>> +HOST_RUST_DEPENDENCIES += host-python3
>>>> +else
>>>> +HOST_RUST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
>>>> +HOST_RUST_DEPENDENCIES += host-python
>>>> +endif  
>>>
>>> I think we should start inverting this logic, i.e use host-python3 by
>>> default if there is no python interpreter selected for the target. We
>>> should do that not only here, but in all packages that have a logic
>>> like that: python3 should become our default, and python2 should become
>>> the exception.  
>>
>> Yes, with this change we can remove python3-<module> added to provide python3
>> modules. I hope packages that still use python2 will only require the python2
>> interpreter without any additional modules.
> 
> That is not what I meant. What I meant was to change:
> 
> ifeq ($(BR2_PACKAGE_PYTHON3),y)
> HOST_RUST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> HOST_RUST_DEPENDENCIES += host-python3
> else
> HOST_RUST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> HOST_RUST_DEPENDENCIES += host-python
> endif  
> 
> to:
> 
> ifeq ($(BR2_PACKAGE_PYTHON),y)
> HOST_RUST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> HOST_RUST_DEPENDENCIES += host-python
> else
> HOST_RUST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> HOST_RUST_DEPENDENCIES += host-python3
> endif  
> 
> i.e: our default becomes python3.

Ok, I guess this can be done in a patch series that also use host-python3 by
default for python packages.

Best regards,
Romain


> 
> Thomas
> 
