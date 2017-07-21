From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 21 Jul 2017 08:52:56 +0200
Subject: [Buildroot] [PATCH v8 08/10] external-toolchain: check if a
 buildroot SDK has already been relocated
In-Reply-To: <20170721083636.5442a2df@windsurf>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-9-git-send-email-wg@grandegger.com>
 <20170720232131.02e9a51d@windsurf>
 <9cca1b92-5e7e-2788-8370-59b12078396f@mind.be>
 <20170721083636.5442a2df@windsurf>
Message-ID: <5dabf921-90d5-5f82-4e6b-34bcff1e2023@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 21.07.2017 um 08:36 schrieb Thomas Petazzoni:
> Hello,
> 
> On Fri, 21 Jul 2017 00:30:52 +0200, Arnout Vandecappelle wrote:
> 
>>> Now that I think of it, this is going to be a bit annoying. This means
>>> that whenever you want to use a Buildroot-generated toolchain as an
>>> external toolchain in another Buildroot configuration, you have to run
>>> this relocate script.
>>>
>>> This will break a lot of things, like the autobuilders, the runtime
>>> test infrastructure, etc. that all rely on pre-built Buildroot
>>> toolchains, but don't run the relocate-sdk script. In addition, we
>>> simply can't do it, because it's directly Buildroot itself that
>>> downloads the toolchain tarball and extracts it, so we don't even get
>>> the opportunity to run the relocate-sdk script.
>>
>>   Well, we could run the script directly for downloaded toolchains, and do the
>> check for pre-installed toolchains. Does that sound acceptable?
>>
>>   I'm probably forgetting something though :-)
> 
> In fact, I wonder why this check is necessary at all, for the use case
> of an external toolchain. Indeed, an external toolchain is really a
> very minimal SDK, with just gcc/binutils/gdb/libc. And there is nothing
> that relocate-sdk will relocate in such a simple SDK: SDKs that are
> just toolchains are relocatable by design, with no fixup needed.
> 
> The relocate-sdk is useful when you start having more stuff in the SDK,
> with libtool files and other weird things that hardcore paths. But
> that's not the case for the SDK-is-just-a-toolchain case.

Yes.

> Therefore, I would suggest to simply drop this check.

If you make a toolchain with "make toolchain" the check will not harm. 
If it's created with "make sdk" it will do the check because
"share/buildroot/sdk-location" does exist. "make sdk" will never create 
just the toolchain.

Wolfgang.
