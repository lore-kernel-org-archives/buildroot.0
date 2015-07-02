From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Jul 2015 23:22:30 +0200
Subject: [Buildroot] [PATCH 1/1] force rsync of local package and try to
 rebuild it with its dependencies
In-Reply-To: <20150702123528.1d32089a@free-electrons.com>
References: <1435828515-16620-1-git-send-email-viallard@syscom-instruments.com>
 <20150702123528.1d32089a@free-electrons.com>
Message-ID: <5595AB96.7020401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/15 12:35, Thomas Petazzoni wrote:
> Dear Anthony Viallard,
> 
> On Thu,  2 Jul 2015 11:15:15 +0200, Anthony Viallard wrote:
>> The purpose of this patch is to force rsync of local site packages and
>> rebuild them if their source code has changed. Therefore, if the source
>> of a package has changed, it will be rebuild if you type make or
>> make <pkg>. Likewise, if a package has a library dependency which is
>> local site package too and you type make <pkg>, the library will be
>> rebuild if the source has been modified.
>>
>> This behavior is pretty useful if you use buildroot with many of your
>> own packages. Especially if you share these packages with a developer
>> team through a version control system like git.
> 
> Again, I don't think we want this change in Buildroot. I don't think we
> want *all* local packages to systematically be rsync'ed and rebuilt, at
> every "make" invocation.

 Actually, why not? Ideally, we would like to rebuild everything every time -
but that just takes too long. However, we can assume that there aren't so many
local packages, so their rebuild does not necessarily take too long.

 So I went and did an experiment on my laptop (HDD, 8GB RAM, so relatively
slow): when nothing actually has to be rebuilt, 'make linux-rebuild' takes 40s
longer than 'make linux'. (I'm taking linux because that's the one where we can
expect the most overhead from rebuilding.)  That is the same amount of time as
building a small package like xz.

 Conclusion: indeed, we shouldn't do rebuilding of local packages by default.

> 
> Maybe we want a separate "make rebuild-local" target (not sure of the
> name), which would trigger this special action. Local packages could be
> all registered in a global LOCAL_PACKAGES variable, and make
> rebuild-local would rebuild them all.
> 
> Note that you could also solve this problem by adding something like
> that in your external.mk (provided you're using BR2_EXTERNAL):

 Or in your local.mk (BR2_PACKAGE_OVERRIDE_FILE), where you put these overrides.

> 
> # Needs to be filled in with your complete list of packages
> CUSTOM_PACKAGES = foo1 foo2 foo3
> 
> rebuild-custom: $(foreach p,$(CUSTOM_PACKAGES),$(p))

 Or if you don't want to call a specific target:

world: $(foreach p,$(CUSTOM_PACKAGES),$(p))

That way, you can just type 'make' and it will rebuild your custom packages.


> 
>> -	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
>> +	rsync -au $(RSYNC_VCS_EXCLUSIONS) --include core $(SRCDIR)/ $(@D)
> 
> This change is unrelated to the patch I believe.

 And it should be added to RSYNC_VCS_EXCLUSIONS instead.

 However, why is this even needed? RSYNC_VCS_EXCLUSIONS doesn't exclude any
pattern that matches 'core'.


 Regards,
 Arnout


> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
