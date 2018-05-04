From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 May 2018 12:35:06 +0200
Subject: [Buildroot] [RFC PATCH 1/2] annobin: New package
In-Reply-To: <a7a208243fe391b22171c9a67099814afb1d429a.camel@spectralink.com>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
 <20180503143147.5301-2-stefan.sorensen@spectralink.com>
 <6d1f56f4-c708-9855-59e4-58df59a296c0@mind.be>
 <a7a208243fe391b22171c9a67099814afb1d429a.camel@spectralink.com>
Message-ID: <2b0a115e-bcae-7c7d-ee1e-7fabc9768379@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-05-18 10:32, S?rensen, Stefan wrote:
> On Fri, 2018-05-04 at 00:13 +0200, Arnout Vandecappelle wrote:
> 
>>> +A lot of packages build with a mix of -fPIC and -fPIE, so bump
>>> this down from a failure to just issuing a warning.
>>
>> Is that really the case? I mean, if an executable contains code
>> (directly, not in a shared library) that has not been compiled with
>> -fPIE/-fpie, then the executable is not (or may not be) completely
>> position-independent, right?
> 
> You are right, it does not fail on the mixed static+pic/pie case - it
> turns out that the original script does not fail on the pure static
> case. I will add a fix for this.

 So can you explain in the commit log of the patch why exactly it is needed
then? And maybe whatever you do would be upstreamable in the end?


>> TBH, I don't really understand how this position independent
>> executable is used in the end. Does the kernel's ELF loader perform
>> ASLR while loading it?
> 
> I believe so - I think that the executable it handled more or less like
> a shared library.
> 
>>> +	bool "annobin"
>>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
>>
>>  Can you add a comment explaining why 6 is the minimum, and not 4.5
>> (first GCC supporting plugins)?
> 
> To be honest, I don't recall why this was added. 

 That's exactly why there should be a comment :-)

> I will test it and
> drop  it if not needed.
> 
>>> +	  Enabling this will slightly (1-2%) increase the size of
>>> +	  built binaries.
>>
>>  Really? Isn't this info stripped off in the strip step?
> 
> No, this is not touched by strip. It is intended that you should be
> able to verify the final binaries - though this is probably more
> relevant on ordianry Linux distributions.

 Really really? I haven't tried it, but the documentation of annobin says that
it will store the information in a NOTES section, and we strip with
--remove-section=.note so it should be gone.

 Oh, hang on, it's stores in a .note.something section, and our strip command is
missing a * at the end. Which is probably a bug, I think we really do want to
strip off the notes in the target... But that's a pretty dramatic change.


>>  HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS +=
>>> $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
>>> +ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
>>> +HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS +=
>>> -DBR_ANNOBIN_GCC_PLUGIN='"$(ANNOBIN_GCC_PLUGIN)"'
>>
>>  Is there a reason to repeat this in gcc-final.mk and pkg-toolchain-
>> external.mk, rather than specifying it once in toolchain/toolchain-
>> wrapper.mk (like most of the wrapper options)?
> 
> Adding it in toolchain/toolchain-wrapper.mk will also cause it to be
> added in the wrapper of gcc-initial, requiring that the annobin plugin
> be built much earlier.

 Ah indeed, I forgot that we now build the wrapper for gcc-initial as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
