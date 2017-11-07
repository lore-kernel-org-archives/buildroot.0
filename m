From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 21:54:19 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171107205558.315ce04c@windsurf>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171107181307.58471ad9@windsurf>
 <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
 <20171107205558.315ce04c@windsurf>
Message-ID: <32d492f8-4c57-16c9-1602-61117f556e3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-17 20:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 7 Nov 2017 18:55:20 +0100, Arnout Vandecappelle wrote:
> 
>>> in package/pkg-generic.mk. But of course, we need to exclude the
>>> host-ccache package from this, otherwise we would have a circular
>>> dependency. Do you want to try something like this?  
>>
>>  Ha, I didn't understand the original problem but now I see. The issue is that
>> ccache is part of DEPENDENCIES_HOST_PREREQ, and DEPENDENCIES_HOST_PREREQ is
>> *not* added to each package's DEPENDENCIES,
> 
> Exactly.
> 
>> instead it is added to the
>> core-dependencies target and each package depends on that. It's an easy way to
>> avoid circular dependencies, I guess.
>>
>>  So I think the proper solution would be to add DEPENDENCIES_HOST_PREREQ to the
>> dependencies of all packages except themselves, similar to how it's done for
>> toolchain.
> 
> Isn't this DEPENDENCIES_HOST_PREREQ thing a bit crappy in the first
> place?

 Nobody claimed it wasn't :-) It's a relic from 2007...

> Why isn't host-ccache simply added as a dependency of all
> packages, except itself?
> 
> Another example is that today, host-lzip is always built at the
> beginning of build, even if you're not building any package that needs
> the lzip "decompressor".
> 
> So perhaps this calls for a little bit of rework in this area, no?

 Yep. For cmake it is done the right way. The same could be done for the other
dependencies. And it may be useful to extend the mechanism to other system
packages. E.g. m4 is not really sensitive to version changes.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
