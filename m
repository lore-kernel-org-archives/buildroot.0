From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 18:55:20 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171107181307.58471ad9@windsurf>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171107181307.58471ad9@windsurf>
Message-ID: <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-17 18:13, Thomas Petazzoni wrote:
>> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
>> index afbec44..66bfcad 100644
>> --- a/package/ccache/ccache.mk
>> +++ b/package/ccache/ccache.mk
>> @@ -50,6 +50,7 @@ BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
>>  ifneq ($(BR_CCACHE_INITIAL_SETUP),)
>>  define HOST_CCACHE_DO_INITIAL_SETUP
>>      @$(call MESSAGE,"Applying initial settings")
>> +    rsync -au --link-dest=$(HOST_DIR) $(HOST_DIR) $(call qstrip,$(BR2_HOST_DIR))
>>      $(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
>>      $(CCACHE) -s
>>  endef
> I don't think that's what we want. The global HOST_DIR (output/host)
> should basically be empty during the entire build process. Instead,
> what we want is to have the ccache host tools installed in the
> per-package SDK. This means that all packages have to have a dependency
> on host-ccache, which is not currently the case. So we probably instead
> want something like:
> 
> ifeq ($(BR2_CCACHE),y)
> $(2)_DEPENDENCIES += host-ccache
> endif
> 
> in package/pkg-generic.mk. But of course, we need to exclude the
> host-ccache package from this, otherwise we would have a circular
> dependency. Do you want to try something like this?

 Ha, I didn't understand the original problem but now I see. The issue is that
ccache is part of DEPENDENCIES_HOST_PREREQ, and DEPENDENCIES_HOST_PREREQ is
*not* added to each package's DEPENDENCIES, instead it is added to the
core-dependencies target and each package depends on that. It's an easy way to
avoid circular dependencies, I guess.

 So I think the proper solution would be to add DEPENDENCIES_HOST_PREREQ to the
dependencies of all packages except themselves, similar to how it's done for
toolchain.

 By the way there will also be a problem when host-tar is part of
DEPENDENCIES_HOST_PREREQ: ccache needs host-tar to be able to build, but there
is no explicit dependency between them, it relies purely on left-to-right order.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
