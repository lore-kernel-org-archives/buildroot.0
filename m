From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jun 2018 15:30:47 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <1528737656.28705.131.camel@impinj.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
Message-ID: <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-06-18 19:20, Trent Piepho wrote:
> On Sun, 2018-06-10 at 23:21 +0200, Arnout Vandecappelle wrote:
>>  
>>>  .PHONY: sdk
>>> -sdk: world
>>> +sdk: world $(BR2_TAR_HOST_DEPENDENCY)
>>>  	@$(call MESSAGE,"Rendering the SDK relocatable")
>>>  	$(TOPDIR)/support/scripts/fix-rpath host
>>>  	$(TOPDIR)/support/scripts/fix-rpath staging
>>>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>>>  	mkdir -p $(HOST_DIR)/share/buildroot
>>>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
>>> +	$(Q)mkdir -p $(BINARIES_DIR)
>>> +	$(TAR) czf $(BINARIES_DIR)/buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL).tar.gz \
>>
>>  Wouldn't it make more sense to make a .xz, or perhaps a .bz2? Although, that
>> probably gives a significant hit to the build time. But since it's explicit in
>> 'make sdk' I don't mind that much.
>>
> 
> I'm using the SDK with Docker.  It can add tar.gz files into the
> container, but now tar.xz.  Having to recompress the archive would be a
> significant increase in build time.

 Duh. Calling tar inside the container explicitly, rather than letting docker to
the extract directly, isn't too much of a problem either, no?

> 
> 
>>> +		-C $(HOST_DIR) \
>>> +		--transform='s#^\.#buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)#' \
>>
>>  Perhaps move that "buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)" into a
>> variable?
> 
> So having extracted an SDK, in an automated CI script, how does one use
> it?  I'll add it to the Docker container:
> 
> ARG sdk_file
> ENV SDK=/mnt/sdk
> ADD --chown=user:user ${sdk_file} ${SDK}

 My docker-fu is not too great, but you can do something similar to expose the
tarball directly, and then do

RUN tar -xf ${sdk_file} --strip-components=1

no?


> Now it needs to be relocated.  Something like:
> 
> RUN cd ${SDK}/buildroot-sdk.arm-buildroot-linux-gnueabihf-2018.02-00035-ge588bdd3e8 && ./relocate-sdk.sh

 Here you could to

RUN cd ${SDK}/buildroot-sdk.*/ && ./relocate-sdk.sh

> 
> Is the problem with using this tarball apparent?  The dockerfile needs
> to be hand edited on every single build to use the correct path to the
> SDK.
> 
> I've already added a "sdk-tar" to my external.mk to do this, but used
> the tarbomb approach.  While annoying for those who extract it in their
> home dir, it's much easier to use in an automated processes since there
> is no unknown path name component.
> 
> It is good if archives that are going to be used in an automated
> process do not contain unpredictable path names!
> 
> Now one might say that I can just make a tarball with a different
> process.  But that would mean creating two SDK tarballs, since there is
> no way to prep the host dir for making a SDK tar without also making
> the tarball.  That's a significant amount of wasted time.

 That's what Thomas proposed in his last mail, and I agree it's not great.

 That said, if you're building an SDK, it's probably because you're not changing
it too often. As long as you're developing the Buildroot OS itself, there's
generally no point generating the SDK. If you really are closely co-developing
your application and the Buildroot OS, you're probably better of including the
application as a package rather than building it externally.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
