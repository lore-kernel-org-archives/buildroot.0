From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Dec 2019 00:04:56 +0100
Subject: [Buildroot] [FYI] Bootlin external toolchains
In-Reply-To: <11b9e616-d8ce-ec5c-dbed-9180fa18a338@smile.fr>
References: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
 <20191202152601.4ab1c8cd@windsurf>
 <a9c40802-dfd5-67b5-6750-b0711f667280@smile.fr>
 <09654893-fe44-76f0-da65-3f29bc758c6f@mind.be>
 <11b9e616-d8ce-ec5c-dbed-9180fa18a338@smile.fr>
Message-ID: <048916d9-4188-52b0-db41-d1b87e06ddb9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/12/2019 22:52, Romain Naour wrote:
> Hi Arnout, All,
> 
> Le 03/12/2019 ? 22:15, Arnout Vandecappelle a ?crit?:
>>
>>
>> On 03/12/2019 10:59, Romain Naour wrote:
>>> Hi Thomas, Vadim,
>>>
>>> +Arthur Courtel in Cc.
>>>
>>> Le 02/12/2019 ? 15:26, Thomas Petazzoni a ?crit?:
>>>> Hello,
>>>>
>>>> +Romain Naour in Cc.
>>>>
>>>> On Mon, 2 Dec 2019 02:47:15 +0200
>>>> Vadim Kochan <vadim4j@gmail.com> wrote:
>>>>
>>>>> Just in case if someone will be interested. I started Buildroot external
>>>>> project which provides external toolchains from the Bootlin:
>>>>>
>>>>>     https://toolchains.bootlin.com
>>>>>
>>>>> The git repo can be found at:
>>>>>
>>>>>     https://github.com/vkochan/buildroot-external-toolchain-bootlin
>>>>
>>>> An effort was started to package the Bootlin external toolchains in
>>>> Buildroot itself, some time ago by engineers at Smile. We had some
>>>> off-list discussion about this, but I don't think it was ever posted to
>>>> the list. The idea back then was to have a script that generates all
>>>> the packages, but the design was to have one package for each
>>>> toolchain, so it really added a lot of packages.
>>>>
>>>> But I think we should really support these toolchains in Buildroot
>>>> proper instead of having an external for them.
>>>
>>> Agree.
>>>
>>> Arthur will take a look at the script but it's very complicated script...
>>> Maybe we need to discuss what we really want.
>>
>>  I think this should be like scancpan/scanpypi, i.e. something that generates
>> the toolchain-external-bootlin package but it's up to the user to fix up the
>> final details.
>>
>>  And then we can work on toolchains-builder to make sure it generates something
>> that is easier for this scanbootlin script to parse.
> 
> The initial goal was to use toolchain bootlin as prebuilt external toolchain
> when no other prebuilt toolchain is available (Linaro, Mentor etc...).
> I would like to avoid letting the user fixing the final details.

 Er, looks like we have a bit of a disconnect here...

 In my view, the bootlin toolchains should be made available exactly like the
other external toolchains (Linaro, Mentor, ...): as a menuconfig choice. But we
can build a script that creates the corresponding Config.in and .mk file, and
commit the result into git. That script doesn't need to be fully automated, the
output can be manually adapted before committing.


>>  Alternatively, maybe even better, we can just update build.sh in
>> toolchains-builder to generate all the pieces and then add an additional
>> pipeline stage that collects the pieces into a package.
> 
> The script evoked by Thomas showed that it was too difficult/complex to generate
> a toolchain packages from the files currently provided by toolchain-builder.
> 
> So, I'm agree that it would be better if toolchain-builder can provide such package.
> 
>>
>>  Most importantly, though, I think we should take this gradually. Start with a
>> manually constructed package, it doesn't even need to support all the different
>> toolchains. We can bikeshed a bit on what that package looks like, and use that
>> as input for how to script it.
> 
> At least aarch64, arm and x86_64 should be included in the manually constructed
> package.
> 
>>
>>  To kick off the bikeshedding, here's my opinion on what the package should look
>> like.
>>
>> * It should be a single package, toolchain-external-bootlin. Maybe two (-stable
>> and -bleeding-edge) but I think there'll be enough shared infrastructure to
>> warrant creating a single package.
> 
> The most difficult part is to generate the dependencies (depends on) of the
> toolchain and its properties (select). That is why our experimental script
> create one package for each toolchain provided by toolchain Builder.

 That's why starting with something that is constructed manually is a good idea.
We can reason about how to solve the issues with hidden helper symbols etc.


> Also if we can use a single a single package for the Bootlin toolchain package,
> it mean that we can also use a single package for the
> Linaro/ARM/Codescape/Codesourcery packages.

 Er, no. We've factored all the commonalities between those packages into
external-toolchain-package.

 Or maybe you mean that the 3 arm toolchains and the 4 linaro toolchains could
be merged? Yes, that's probably true.


>> * It should offer a choice in Config.in.options for libc and stable/bleeding-edge.
>>
>> * For now, it should be limited to *exactly* the same architecture suboptions as
>> what the toolchain was built for. Later we can decide how to expand this to
>> compatible options (e.g. the core-i7 toolchain will also work for core-avx2) -
>> but I'm pretty sure that that is something that will require help from
>> toolchain-builder itself.
> 
> Indeed.


 Regards,
 Arnout
