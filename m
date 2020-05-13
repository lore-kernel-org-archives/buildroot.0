From: LP C <lpdev@cordier.org>
Date: Thu, 14 May 2020 01:27:20 +0200
Subject: [Buildroot] Adding post image hook
In-Reply-To: <CAFV4z9bmpryMth8sY0rCFN_4tV_+xpU7xA_g8_E5Ke8FUxSGVA@mail.gmail.com>
References: <CAFV4z9bmpryMth8sY0rCFN_4tV_+xpU7xA_g8_E5Ke8FUxSGVA@mail.gmail.com>
Message-ID: <15E50ECE-28BD-4A24-A3E6-0911CBC35096@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On May 13 2020, at 11:46 pm, Patrick Mochel <patrick.mochel@timesys.com> wrote:

> Hi Yann,
>  
>  
>> On Wed, May 13, 2020 at 2:30 PM Yann E. MORIN
>> <yann.morin.1998@free.fr> wrote:
>> ?
>>  
>>>> FWIW, This doesn't generate any output.
>>>  
>>> Probably you were doing an out-of-tree build?
>>  
>> Nope, it's an in-tree build, configured and already built. And it's
>> this recent:
>>  
>> ?$ git describe
>> 2020.02-1207-ga8da12f0f9
>>  
>>  
>> ...
>>  
>>>> .. which does generate?+/- the desired output of _everything_, but
>>>> it also results in this in the shell:
>>>> ? ?make: support/dependencies/check-host-.sh: Command not found
>>>  
>>> Yes, this is a side-effect of not actually runing the commands: some
>> ...
>>  
>> ACK -- not a personal concern; just a minor wart.
>>  
>> ...
>>  
>>> Nowadays, the cannonical way to extract information out of the internals
>>> of Buildroot is geared toward json-formatted output.
>>>  
>>> If you want information from packages, you should use (and extend if
>>> needed) from your post-scripts:
>>>  
>>> ? ? make --no-print-directory -C $(BASE_DIR) show-info
>>  
>> That's a good point and I shall look into it again as to whether
>> that'll provide all the metadata that we need, since we need the
>> similar concerning the firmware and kernel components, which are
>> classified differently than the packages.
>>  
>> If you're curious, here's the current (fresh!) code:
>>  
>> https://github.com/TimesysGit/vigiles-buildroot
>>  
>> I apologize for the shameless promotion of a semi-commercial product.
>> And, I must say it ain't my best work. That said, the point of it is
>> to gather specific metadata about the various components of an built
>> system, generate a json manifest and submit for a CVE check of known
>> vulnerabilities (that's our money-maker). YMMV.?
>>  
>> Thanks for the reply.?
>>  
>> Cheers,
>>  
>>  
>> Patrick


Hi again,

I would like to jump back to the original topic of this email: adding
post image hook. I would like to have your thoughts about my
proposition. Following are additional considerations on it:

AFAIK, post-build and post-image scripts are the only part of buildroot
that is executing user-provided scripts and the only use case of using
those .sh scripts is when you are using vanilla buildroot (without
BR2_EXTERNAL, without fork), and/or when layering is required (see doc
section: "9.1.1. Implementing layered customizations"). I also
understand it's the only way at the moment for people with only a
defconfig file to launch some extra tasks at the end of their build.

That said we can also have something like BR2_EXTERNAL_MAKEFILE with
those proposed hooks defined inside. It remains to have an external.mk
file, but lighter. Anyway, I see less and less advantages of not using
BR2_EXTERNAL to be honest.

Pros of makefile:  

- full access to all BR2_* variables to customize image name, get
version of packages, generate a manifest...
- does not break the layering customization order, as hooks will be
added and executed in the same order they are defined.
- BR2_ROOTFS_POST_SCRIPT_ARGS: remove the "All the scripts will be
passed the exact same set of arguments, it is not possible to pass
different sets of arguments to each script." limitation stated in the
doc section "9.5. Customizing the generated target filesystem". It is
also the only config that can't take advantage of layering AFAIK. So
scripts will get the arguments they are ONLY needing.

Cons:

- The dev has to define a makefile + .sh script if he/she absolutely
wants to keep legacy code. Some (basic) knowledge of makefile will be required.
- break legacy?

To be honest I already have a solution that works for my use case. My
motivation comes from other devs stuck that would love to have an
"official" and clean way to do achieve those actions (if there is any?).
I would be interested to know if it can makes Patrick's life easier with
this design (sorry I don't have the courage of digging into your
project's code)

Thanks all for your time

Louis-Paul CORDIER  

PS: sorry for the email indentation, my email webclient (mailo) is
barely supporting plain text editing :(
