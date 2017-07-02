From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jul 2017 13:18:09 +0200
Subject: [Buildroot] [PATCH] core: postpone evaluation on decompressor
 dependencies
In-Reply-To: <20170702123621.67df4ae7@windsurf>
References: <20170702103030.2210-1-yann.morin.1998@free.fr>
 <20170702123621.67df4ae7@windsurf>
Message-ID: <f75e93d0-ef5d-9d71-fca8-1a96329886d3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-07-17 12:36, Thomas Petazzoni wrote:
>>  DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>> +UNCOMP_TOOLS_DEPENDENCIES += $$(UNCOMP_TOOL_DEPENDENCY$$(suffix $$($(2)_SOURCE)))
> I know we looked at it yesterday, but I again don't remember what
> extractor-dependency is for. When looking at this code, it seems a bit
> weird that extractor dependencies are added to DL_TOOLS_DEPENDENCIES
> and "uncompressor dependencies" are added to UNCOMP_TOOLS_DEPENDENCIES.
> 
> Can we clarify this ? Should the output of extractor-dependency be added
> to UNCOMP_TOOLS_DEPENDENCIES ? Do we need both extractor-dependency and
> UNCOMP_TOOL_DEPENDENCY ?

 It also took me a bit of browsing to find out what this was about. IIUC,
DL_TOOLS_DEPENDENCIES is not actually a list of dependencies, but rather a list
of tools that should be checked by dependencies.mk. In addition, this list mixes
download tools (e.g. git) with extractor/uncompressor tools - and it could in
fact contain anything else. So it would be better to call it something like
DEPENDENCIES_TO_CHECK.

 Also, this patch only looks at the uncompressor tools, but the same approach
could be applied to the download tools. In fact, I'd like those two to be
refactored a little.

 Ideally, we'd even have a distinct name for dependencies.mk "things" (i.e.
tools that may or may not be available on the host and, for some of them, that
we build on demand) and FOO_DEPENDENCIES "things" (i.e. packages that we need to
build before package foo).

 So perhaps:
DL_TOOLS_DEPENDENCIES -> TOOLS_TO_CHECK
UNCOMP_TOOLS_DEPENDENCIES -> TOOLS_DEPENDENCIES


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
