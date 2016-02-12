From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Feb 2016 23:57:32 +0100
Subject: [Buildroot] [PATCH 03/16 v4] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <20160212224602.GB3395@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <821b8ea9cd929a6c05b715d12e99f3da00aa9ed4.1454536753.git.yann.morin.1998@free.fr>
 <56BE5C84.8050602@lucaceresoli.net> <20160212224602.GB3395@free.fr>
Message-ID: <56BE635C.7050606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-02-16 23:46, Yann E. MORIN wrote:
> Luca, All,
> 
> On 2016-02-12 23:28 +0100, Luca Ceresoli spake thusly:
>> On 03/02/2016 23:21, Yann E. MORIN wrote:
>>> This macro will try to copy a source file into a destination directory,
>>> by first attempting to hard-link, and falling back to a plain copy.
>>>
>>> In some situations, it will be necessary that the destination file is
>>> named differently than the source (e.g. due to a re-numbering), so if a
>>> third argument is specified, it is treated as the basename of the
>>> destination file.
> [--SNIP--]
>>> +define hardlink-copy
>>> +	{ mkdir -p $(2) && \
>>> +	  rm -f        $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) && \
>>> +	  { ln -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) 2>/dev/null || \
>>> +	    cp -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))); \
>>> +	  } \
>>> +	}
>>> +endef
>>
>> Unfortunately this version of the patch does not seem to work, although
>> I can't wrap my head around the reason. What's happening is _weird_.
> 
> Damned, that's right. It's broke... :-/
> 
>> If I apply all of your patches up to 10/16, 'make legal-info' works. If
>> I add patch 11 ("core/legal-info: also save patches"), it does not. Add
>> patch 12 and it works again.
> [--SNIP--]
>> This is the best I could understand at the moment... :-(
> 
> Thanks for the detailed analysis! :-)
> I'll investigate this further.

 When in doubt, add a dollar.

 Regards,
 Arnout
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
