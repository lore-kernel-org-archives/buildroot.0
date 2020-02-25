From: Michael Walle <michael@walle.cc>
Date: Tue, 25 Feb 2020 11:19:20 +0100
Subject: [Buildroot] CVEs not matching buildroot packages
In-Reply-To: <20200225104600.0f295783@windsurf>
References: <e9268b49623925add8aeac91e8059012@walle.cc>
 <20200225104600.0f295783@windsurf>
Message-ID: <83c7598984b7c6eb22cc5a5bb11af4fc@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 2020-02-25 10:46, schrieb Thomas Petazzoni:
> Hello Michael,
> 
> Thanks for pushing this conversation further, we definitely want to
> make progress on this topic.
> 
> On Tue, 25 Feb 2020 09:58:27 +0100
> Michael Walle <michael@walle.cc> wrote:
> 
>> Yesterday, Heiko noticed that CVE-2020-8597 doesn't match the
>> pppd package, because the product name doesn't match the package
>> name.
> 
> Indeed. This was a known limitation when we did the initial work on the
> CVE checking as part of pkg-stats during the Buildroot Developers
> meeting.
> 
>> So apparently there need to be a mapping between these two. But
>> that comes with some caveats. Let's assume there would be a
>> pkg_NVD_CPE variable.
> 
> Nit: the NVD database uses the concept of "vendor" and "product" names.
> So either we have a single variable like <pkg>_CPE_ID that looks like
> CPE IDs:
> 
> LINUX_CPE_ID = cpe:2.3:o:linux:linux_kernel:*:*:*:*:*:*:*:*
> 
> Or we have separate variables for the vendor and product names:
> 
> LINUX_CPE_VENDOR = linux
> LINUX_CPE_PRODUCT = linux_kernel

I've left this out on purpose for simplicity ;) You could assume that
the product name is unique and if its not you could add the vendor.
Like for example:

  _CPE = linux_kernel
  _CPE = linux:linux_kernel

eg. something like that:
  pkg_CPE = [vendor:]product

Maybe it shouldn't be named CPE after all.. But I wanted to avoid
this discussion for now, because it doesn't matter for the mapping
problem ;)

>> One could think of having a default value
>> of this variable, eg by default "pkg_NVD_CPE = pkg". [This is,
>> as far as I understand it, the current behaviour, because there
>> is no mapping right now; correct me if I'm wrong].
> 
> You're correct.
> 
>> BUT in my optinion there MUST NOT be a default value for this mapping,
>> because then you cannot distiguish between a package which just
>> uses the default name and a package which wasn't ever touched
>> regarding CVEs. And this is really bad for statistics, eg you
>> can't even say we have this many packages checked for CVEs,
>> because you don't know which packages actually has a correct
>> mapping.
> 
> Yes. With the release-monitoring.org matching, we are able to know if
> the match was found thanks to an explicit mapping of the Buildroot
> distribution, or if it was found by "luck". That's the difference
> between "found by distro" and "found by guess" in
> http://autobuild.buildroot.net/stats/.

Mhh, I don't think I can follow you here. Even if the package is found
in release-monitoring.org it doesn't map to any CVEs/CPEs, does it?
Or should this be an example on already existing fuzzy matching in
buildroot?

>> So if a pkg_NVD_CPE variable is introduced this would need to
>> done manually per package; which would mean a lot of work. Of
>> course there could be some scripts which check if there was ever
>> a CVE for package x and x is a buildroot package. That would be
>> a strong indication that this is a correct mapping. There could
>> also be a checkpackage script which checks if pkg has no
>> pkg_NVD_CPE variable, but there is a CVE for that package name.
> 
> On the other hand, as explained above, the CPE information is not just
> a package name, it's also a vendor name. So in practice the default of
> using the package name doesn't really work.

correct. unless you only match only parts of the CPE. But yes. If there
would be a variable pkg_CPE which should contain the correct CPE, that
would not work with the default.

> 
>> Then a statistics script could gather:
>>    (1) how many packages don't have a mapping, eg. the CVE status
>>        is unknown. [package has no pkg_NVD_CPE]
>>    (2) how many packages are not affected by a CVE [package has
>>        pkg_NVD_CPE and doesn't match any CVEs]
>>    (3) how many packages are affected by a CVE [package has
>>        pkg_NVD_CPE and doesn't match any CVEs]
> 
> This last sentence should have been "and match some CVEs"

oh, yes of course.

> 
>> To minimize efforts in the beginning (1) could be split into
>>   (1a) how many packages don't have a mapping and no CVE matches
>>        the package name, therefore the status is still unknown
>>        [package has no pkg_NVD_CPE and there is no CVE matching
>>        the package name]
>>   (1b) how many packages don't have a mapping but there is a CVE
>>        matching the package name. Thus there is a high chance
>>        this package is actually affected by this CVE, but this
>>        is just a strong indication and would need further manual
>>        steps, eg. adding pkg_NVE_CPE to the package .mk.
>> 
>> So packages could incrementally moved from (1a) to (1b).
>> 
>> Any comments? ;)
> 
> One question is how will you distinguish packages that don't have any
> CPE information because no CVE has ever been reported and therefore we
> don't know which CPE vendor/product IDs will be used, and packages that
> don't have CPE information because nobody has done the work of checking
> the NVD database and adding the mapping.

IMHO you cannot distiguish between these two, can you? Only if there 
would
be another CPE database for all software out there. Otherwise if there 
is
no CPE without and actual CVE, you can't do anything about it. So the
package would still be unknown. A counterexample, let's assume you add

  pkg_CPE = <unknown>

to indicate you've manually checked that there is currently no CVE
matching this package and thus no CPE exists. Now, if there is actually
a CVE/CPE the recipe won't be updated or worse the CVE matching would
report nothing.

So I don't think you can do anything about that other than just saying
we don't know anything about this package.

> Indeed, in our 2500+ packages, I'm pretty sure a significant number of
> them never had any CVE, and therefore we have no idea what their CPE ID
> would be.
> 
> Any idea on this ?

Well I'd imaging three states in the stats:
  - green, no CVE applies, we know the CPE
  - red, CVE applies, we know the CPE
  - yellow, CPE unknown, for whatever reason

If you're right with "a significant number of them never had any CVE",
then many would be yellow. But I don't see any drawback on this. At the
of the day what really matters are the packages in the red category.
And of course, how we can get as many packages as possibe from yellow
to green/red.

What could also be done is a seperate script which loops over the CVEs
and prints if no mapping to a buildroot package is found. So someone
could look at it and say, oh this CVE looks like it should match one
of our packages.

-michael
