From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Jun 2018 09:46:02 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <1528825657.28705.168.camel@impinj.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
Message-ID: <4d151eb4-bc60-fc45-e6af-8979af2d994e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-06-18 19:47, Trent Piepho wrote:
> On Tue, 2018-06-12 at 15:30 +0200, Arnout Vandecappelle wrote:
>>
>> On 11-06-18 19:20, Trent Piepho wrote:
>>> On Sun, 2018-06-10 at 23:21 +0200, Arnout Vandecappelle wrote:
>>>>  
>>>>>  .PHONY: sdk
>>>>> -sdk: world
>>>>> +sdk: world $(BR2_TAR_HOST_DEPENDENCY)
>>>>>  	@$(call MESSAGE,"Rendering the SDK relocatable")
>>>>>  	$(TOPDIR)/support/scripts/fix-rpath host
>>>>>  	$(TOPDIR)/support/scripts/fix-rpath staging
>>>>>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>>>>>  	mkdir -p $(HOST_DIR)/share/buildroot
>>>>>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>>>>> +	$(Q)mkdir -p $(BINARIES_DIR)
>>>>> +	$(TAR) czf $(BINARIES_DIR)/buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL).tar.gz \
>>>>
>>>>  Wouldn't it make more sense to make a .xz, or perhaps a .bz2? Although, that
>>>> probably gives a significant hit to the build time. But since it's explicit in
>>>> 'make sdk' I don't mind that much.
>>>>
>>>
>>> I'm using the SDK with Docker.  It can add tar.gz files into the
>>> container, but now tar.xz.  Having to recompress the archive would be a
>>> significant increase in build time.
>>
>>  Duh. Calling tar inside the container explicitly, rather than letting docker to
>> the extract directly, isn't too much of a problem either, no?
> 
> I believe COPY + RUN ends up being more layers than just ADD. 

 You can collapse the RUN commands, see below.

> Though
> current docker supports xz and bz2 so it would work to use a better
> compression.
> 
> But, in the tests I've done on our vsphere system, using gz was still
> fastest.  I'm more interested in making the CI process faster than in
> saving disk space.

 Good point, gz is much faster than xz, both for compressing and decompressing.
So it indeed makes sense to just keep it as a .gz. IIRC lz4 would be even
better, but that requires installing lz4...

>>>>> +		-C $(HOST_DIR) \
>>>>> +		--transform='s#^\.#buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)#' \
>>>>
>>>>  Perhaps move that "buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)" into a
>>>> variable?
>>>
>>> So having extracted an SDK, in an automated CI script, how does one use
>>> it?  I'll add it to the Docker container:
>>>
>>> ARG sdk_file
>>> ENV SDK=/mnt/sdk
>>> ADD --chown=user:user ${sdk_file} ${SDK}
>>
>>  My docker-fu is not too great, but you can do something similar to expose the
>> tarball directly, and then do
>>
>> RUN tar -xf ${sdk_file} --strip-components=1
>>
>> no?
> 
> It would be more like:
> 
> RUN dnf install -y tar

 You could just have tar already in your base image, of course...

> ARG sdk_file
> ENV SDK=/mnt/sdk
> COPY ${sdk_file} ${SDK}

 Isn't there something that "links" the file rather than copying it into the image?

> RUN tar -xf ${SDK}/${sdk_file} -C ${SDK} --strip-components=1 --owner user:user
> RUN rm ${SDK}/${sdk_file}

 I think this will create 3 layers: one for the COPY and one for each RUN. You
can reduce it to two with:

RUN tar -xf ${SDK}/${sdk_file} -C ${SDK} --strip-components=1 &&
    rm ${SDK}/${sdk_file}

> 
> decompress option needs to be specified to tar, based on the compressor used.
> 
> This uses more layers.
> 
> 
>>> Now it needs to be relocated.  Something like:
>>>
>>> RUN cd ${SDK}/buildroot-sdk.arm-buildroot-linux-gnueabihf-2018.02-00035-ge588bdd3e8 && ./relocate-sdk.sh
>>
>>  Here you could to
>>
>> RUN cd ${SDK}/buildroot-sdk.*/ && ./relocate-sdk.sh
> 
> Assumes only one directory will match the pattern.

 If you re-create the docker image every time (like is done above), only one
will match.

>  Would also require
> the user of the SDK to do the same thing, assume the only directory in
> ${SDK} is the one they want and use a shell wildcard expansion to find
> it.

 Indeed, not so nice. So --strip-components is better :-)

>  Which I admit could work, though I think it's a kludge.  I needed
> to do the same thing to find the sysroot location and compiler prefix
> inside the SDK, and I think that's a kludge too, and wish buildroot put
> a pointer in a known location in the sdk to where things in unknown
> locations (sysroot) are.

 Good point. In the output/ directory, we have ${STAGING_DIR} which does
something like that (points to the sysroot, still doesn't explicitly say what
the CROSS_COMPILE prefix is but you could parse it out of the symlink). So we
could add the staging symlink to the tarball as well, and while we're at it also
add a host symlink. Although actually, no, I think that just looks ugly. There
must be a better way.

>  But I haven't gotten around to making a patch
> to do that yet.
> 
>>  That said, if you're building an SDK, it's probably because you're not changing
>> it too often. As long as you're developing the Buildroot OS itself, there's
>> generally no point generating the SDK. If you really are closely co-developing
>> your application and the Buildroot OS, you're probably better of including the
>> application as a package rather than building it externally.
> 
> The latter, both the SDK and the applications using the SDK change very
>  frequently.  Which is why I'm so concerned about speed.
> 
> While the applications are buildroot packages as well, there are
> downsides to doing development that way.  So they exist as stand alone
> packages that can be compiled outside of buildroot.  No different than
> any other package in buildroot in that regard.
> 
> But how to build a package stand alone in a CI process, in an
> environment than can build it correctly, and also closely tracks the
> image buildroot will make for the final product?  Use the buildroot
> SDK!  So that's what I'm using it for.

 Very good point indeed. I'm glad I asked :-)

 Is the idea that you have one buildroot build, it creates a docker image, and
that docker image is then used for several application builds? Sounds like a
pretty neat setup.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
