From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Tue, 2 Jun 2020 12:53:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
In-Reply-To: <8ede0323-ef3b-a405-81dc-80f92085ab93@oth-regensburg.de>
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com> <20200529204844.GR8737@scaer>
 <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
 <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
 <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
 <20200601211902.GI8737@scaer>
 <8ede0323-ef3b-a405-81dc-80f92085ab93@oth-regensburg.de>
Message-ID: <08939374-fc1a-eebe-654b-a11d5d711e75@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02.06.20 12:04, Ralf Ramsauer wrote:
> Hi Yann,
> 
> On 6/1/20 11:19 PM, Yann E. MORIN wrote:
>> Mario, Ralf, All,
>>
>> On 2020-06-01 18:23 +0200, Mario Mintel spake thusly:
>>> Am Sa., 30. Mai 2020 um 19:28?Uhr schrieb Mario Mintel < [1]mariomintel@gmail.com>:
>>>   Am Fr., 29. Mai 2020 um 23:40?Uhr schrieb Ralf Ramsauer < [2]ralf.ramsauer@oth-regensburg.de>:
>>>   On 5/29/20 10:48 PM, Yann E. MORIN wrote:
>>>   > Mario, All,
>>>   > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>>>   >> In addition to official releases of Jailhouse, allow to specify a custom
>>>   >> Git URI + branches. This adds more flexibility for custom
>>>   >> configurations.
>>>   > The overwhelming majority of packages do not allow selecting an
>>>   > alternate location. Why would jailhouse be different?
>>>
>>>   Jailhouse requires system-specific configurations. Those configurations
>>>   are compiled from C source files to binaries during the build process.
>>>   While upstream Jailhouse comes with a lot of samples for supported
>>>   systems, you will need a lot of fine tuning to for a specific use case.
>>
>> I am not sure I entirely followed... Note that I am totally ignorant to
>> how jailhouse works (and I barely know what it is). So I had a quick
>> look into the github repo, and I noticed this:
>>
>>     A system configuration can be created on an x86 target system by
>>     running the following command:
>>
>>         jailhouse config create sysconfig.c
>>
>>     In order to translate this into the required binary form, place
>>     this file in the configs/x86/ directory. The build system will pick
>>     up every .c file from there and generate a corresponding .cell file.
>>
>> Is this what you were trying to explain?
> 
> Yes. And that we want to use a git repository rather than a fixed
> release for development reasons.
> 
>>
>> If so, then I think we need a way for people to indeed provide their
>> cells descriptions files, so that they do get compiled by jailhouse,
>> without resorting to using an OVERRDIE_SRCDIR.
> 
> For the operational use-case, yes. For development purposes,
> OVERRIDE_SRCDIR is works fine.
> 
>>
>> So I see a few options:
>>
>>  1- let people provide those .c files as a patch against jailhouse. This
>>     requires no infra in Buildroot, but this is not very convenient;
>>
>>  2- add a configuration option in jailhouse/Config.in, which people
>>     could set as a path to a directory with .c files; those would be
>>     copied into the jailhouse build directory before the actual build,
>>     so the documented way (see above) will be used; those files would
>>     have to be in a br2-external tree or whatever, but not in a package
>>     (because we'd have no way to ensure that package be extracted before
>>     jailhouse gets built).
>>
>>  3- let people write their own package(s) (e.g. in a br2-external tree)
>>     that only builds the cell files. That package would depend on
>>     jailhouse (or rather, the to-be-introduced host-jailhouse). And
>>     packages could also provide their own cell definitions, too...
>>
>> I think option 3 is the best solution, as it is the most flexible and
>> most generic one. However, it will depend on the possibility to
>> introduce a host-jailhoue package that can just install the 'jailhouse
>> cell cross compiler'. As far as I see, this is just a bunch of objcopy,
>> but this is quite tightly integrated into the kernel Kbiuld process, so
>> might not so simple to come up with.
>>
>> Option 2 is probably a good compromise if option 3 turns out to be too
>> difficult to come up with...
> 
> True, option 3 would probably be the best way, though it could get a bit
> tricky.
> 
> BTW, Jan, is there a reason why we don't (optionally) install the
> hypervisor's headers yet? This would probably be enough to allow us for
> compiling cell configurations apart from Jailhouse's build process.

No particular reason, we could indeed enable a -dev package.

Installation is a bit inconsistent so far. We also do not install the
generated configs and demo inmates in upstream, we do so in
jailhouse-images.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
