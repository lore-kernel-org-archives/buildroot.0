From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Oct 2015 00:31:02 +0200
Subject: [Buildroot] [RFC 1/2] non-versioned packages
In-Reply-To: <20151015224121.09399168@free-electrons.com>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
 <20151015224121.09399168@free-electrons.com>
Message-ID: <56202926.8050104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-10-15 22:41, Thomas Petazzoni wrote:
> Peter, Arnout, Yann,
> 
> What do you think of this patch (and the following one) ? Even if the
> commit log isn't very clear, I believe the idea behind the patch is
> quite good. It is indeed a bit pointless to set <pkg>_VERSION to
> "undefined" when it is not defined.

 Well, I do like the current situation that in the build directory it's very
explicity that the package has no explicit version. But I don't find it very
important so I can accept this change.

> Though I see that really only as a minor cosmetic improvement: besides
> changing the message and the name of the build directory, it doesn't
> change anything.

 It actually does change something: it avoids downloads of packages without
explicit _SOURCE or _VERSION. This sounds like a useful feature to me.


 Regards,
 Arnout

> But let's take a decision on this, and not keep the patches around
> forever.
> 
> Thomas
> 
> On Thu, 1 Oct 2015 00:12:43 +0300, Alex Suykov wrote:
>> In case (PKG)_VERSION is empty, do not attempt to download sources
>> for the package. Attempts to download (package)-undefined.tar.gz
>> are pointless, the file is not likely to exist.
>>
>> Also, output/build/(package) looks better and makes more sense than
>> output/build/(package)-undefined for such packages.
>>
>> Non-versioned packages within buildroot: skeleton and mke2img.
>>
>> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>> ---
>>  package/pkg-generic.mk | 6 ++----
>>  package/pkg-utils.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 5 deletions(-)
>>
>> The actual case the prompted me to do the change: I'm using buildroot
>> as a test rig for building and running HEAD shapshots of a local git repo.
>> "HEAD" is not a proper version, but without these changes I could only
>> get "package-unknown" or "package-HEAD", and it took some effort to prevent
>> download attempts.
>>
>> I'm not sure how common this is, but it's possible. And since no proper
>> downloadable package should ever come without a version, changing the way
>> empty VERSION is handled should affect them.
>>
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 5201fca..cb5545b 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -332,8 +332,6 @@ ifndef $(2)_VERSION
>>    $(2)_DL_VERSION := $$($(3)_DL_VERSION)
>>   else ifdef $(3)_VERSION
>>    $(2)_DL_VERSION := $$($(3)_VERSION)
>> - else
>> -  $(2)_DL_VERSION = undefined
>>   endif
>>  else
>>   $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
>> @@ -344,7 +342,7 @@ ifdef $(3)_OVERRIDE_SRCDIR
>>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>>  endif
>>  
>> -$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
>> +$(2)_BASE_NAME	=  $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>>  $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
>>  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>>  
>> @@ -374,7 +372,7 @@ endif
>>  ifndef $(2)_SOURCE
>>   ifdef $(3)_SOURCE
>>    $(2)_SOURCE = $$($(3)_SOURCE)
>> - else
>> + else ifdef $(2)_VERSION
>>    $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
>>   endif
>>  endif
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 44bd2c9..c098b55 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -83,7 +83,7 @@ INFLATE.tar  = cat
>>  suitable-extractor = $(INFLATE$(suffix $(1)))
>>  
>>  # MESSAGE Macro -- display a message in bold type
>> -MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
>> +MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_BASE_NAME) $(call qstrip,$(1))$(TERM_RESET)"
>>  TERM_BOLD := $(shell tput smso)
>>  TERM_RESET := $(shell tput rmso)
>>  
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
