From: Michael Walle <michael@walle.cc>
Date: Tue, 25 Feb 2020 13:41:36 +0100
Subject: [Buildroot] CVEs not matching buildroot packages
In-Reply-To: <20200225112943.0a2dd6e6@windsurf>
References: <e9268b49623925add8aeac91e8059012@walle.cc>
 <20200225104600.0f295783@windsurf>
 <83c7598984b7c6eb22cc5a5bb11af4fc@walle.cc>
 <20200225112943.0a2dd6e6@windsurf>
Message-ID: <11370f3cd0ea3d53ee8002c59dc600a9@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2020-02-25 11:29, schrieb Thomas Petazzoni:
> Hello Michael,
> 
> On Tue, 25 Feb 2020 11:19:20 +0100
> Michael Walle <michael@walle.cc> wrote:
> 
>> > LINUX_CPE_VENDOR = linux
>> > LINUX_CPE_PRODUCT = linux_kernel
>> 
>> I've left this out on purpose for simplicity ;)
> 
> OK.
> 
>> You could assume that
>> the product name is unique and if its not you could add the vendor.
>> Like for example:
>> 
>>   _CPE = linux_kernel
>>   _CPE = linux:linux_kernel
>> 
>> eg. something like that:
>>   pkg_CPE = [vendor:]product
>> 
>> Maybe it shouldn't be named CPE after all.. But I wanted to avoid
>> this discussion for now, because it doesn't matter for the mapping
>> problem ;)
> 
> Sure.
> 
>> > Yes. With the release-monitoring.org matching, we are able to know if
>> > the match was found thanks to an explicit mapping of the Buildroot
>> > distribution, or if it was found by "luck". That's the difference
>> > between "found by distro" and "found by guess" in
>> > http://autobuild.buildroot.net/stats/.
>> 
>> Mhh, I don't think I can follow you here. Even if the package is found
>> in release-monitoring.org it doesn't map to any CVEs/CPEs, does it?
>> Or should this be an example on already existing fuzzy matching in
>> buildroot?
> 
> Of course release-monitoring.org is completely unrelated from
> CVEs/CPEs. I was mentioning release-monitoring.org as another case in
> Buildroot where we have an issue with mapping Buildroot package names
> with package/project names used by another entity.
> 
> But now that I think of it, why not rely a bit more on
> release-monitoring.org after all? We could add a NVD distribution to
> release-monitoring.org, and use it to store the mapping between
> release-monitoring.org projects and their corresponding CPE IDs.
> 
> Then, Buildroot can query release-monitoring.org to find the CPE IDs.
> One advantage of this approach is that this CPE ID information in
> release-monitoring.org is not only useful for Buildroot, but
> potentially for any other project using release-monitoring.org.

Haha, actually Heiko had the same idea ;) But I'm not in favor of
relying on too many external stuff and putting in one more layer
of indirection. But thats just my opinion.

But even then you'd have to map the buildroot packages to
release-monitoring.org URLs (which we have to have anyway, I know ;).

But.. once release-monitors.org would have CPE mappings, we could just
pull the information to help creating our own mapping. I mean the CPEs
won't change anymore and could be easily added to the recipes.

>> > On the other hand, as explained above, the CPE information is not just
>> > a package name, it's also a vendor name. So in practice the default of
>> > using the package name doesn't really work.
>> 
>> correct. unless you only match only parts of the CPE. But yes. If 
>> there
>> would be a variable pkg_CPE which should contain the correct CPE, that
>> would not work with the default.
> 
> Right.
> 
>> > One question is how will you distinguish packages that don't have any
>> > CPE information because no CVE has ever been reported and therefore we
>> > don't know which CPE vendor/product IDs will be used, and packages that
>> > don't have CPE information because nobody has done the work of checking
>> > the NVD database and adding the mapping.
>> 
>> IMHO you cannot distiguish between these two, can you? Only if there
>> would be another CPE database for all software out there. Otherwise if 
>> there
>> is no CPE without and actual CVE, you can't do anything about it.
> 
> But then if we cannot distinguish between these two, it means there is
> no point in forcing to have a <pkg>_CPE variable in each package. We
> could rely on the default being the package name, as we're doing today,
> and simply add <pkg>_CPE to override that default.

The point here is that in the good case you have the information if 
actually
anyone looked into it; eg. changed PPPD_CPE from pppd (the default) to
PPPD_CPE = point-to-point_protocol. So a script can find out what 
packages
are not looked at. And yes, in the case there is no CPE yet it would be 
the
same as you didn't looked at it yet. But thats another problem IMHO. Eg 
you
could tag a package with a date you looked at it last time and found no 
CPE.

You might have both worlds. Eg. have the default and tell the script if
someone looked at it: allow setting the "pkg_CPE = pkg" in the .mk (eg.
the same value as the default). So you can find out in which zone you 
are.
If you have pkg_CPE in the .mk you're either in the red or green zone. 
If
you don't have the pkg_CPE variable, then the default applies and you're 
in
the yellow zone (even if a CVE applies!).

> Your initial statement was:
> 
>>> BUT in my optinion there MUST NOT be a default value for this 
>>> mapping,
>>> because then you cannot distiguish between a package which just
>>> uses the default name and a package which wasn't ever touched
>>> regarding CVEs.
> 
> However, we will anyway never be able to distinguish between a package
> that does not have a <pkg>_CPE variable because there is no known CPE
> ID for this package, or because nobody did the effort.

Correct.

>> So the
>> package would still be unknown. A counterexample, let's assume you add
> 
>> 
>>   pkg_CPE = <unknown>
>> 
>> to indicate you've manually checked that there is currently no CVE
>> matching this package and thus no CPE exists. Now, if there is 
>> actually
>> a CVE/CPE the recipe won't be updated or worse the CVE matching would
>> report nothing.
> 
> Indeed, that makes the whole <pkg>_CPE = <unknown> idea a bit useless.
> 
>> So I don't think you can do anything about that other than just saying
>> we don't know anything about this package.
>> 
>> > Indeed, in our 2500+ packages, I'm pretty sure a significant number of
>> > them never had any CVE, and therefore we have no idea what their CPE ID
>> > would be.
>> >
>> > Any idea on this ?
>> 
>> Well I'd imaging three states in the stats:
>>   - green, no CVE applies, we know the CPE
>>   - red, CVE applies, we know the CPE
>>   - yellow, CPE unknown, for whatever reason

So taking the default from above we'd also have forth one:
- yellow, CPE guessed, CVE applies.

>> If you're right with "a significant number of them never had any CVE",
>> then many would be yellow. But I don't see any drawback on this. At 
>> the
>> of the day what really matters are the packages in the red category.
> 
> No, because the yellow category could very well be "there are some
> serious CVEs potentially affecting some packages, but nobody has added
> the CPE ID information for the moment". So in the end, this yellow zone
> is as dangerous as the red zone.

Correct, but it would be an easy step to convert a package from the 
yellow
zone to the red zone. Eg. just verify that this CVE maps to the package,
then add pkg_CPE to the recipe. So ultimately there shouldn't be a CVE
matching in the yellow zone. Only packages where no CVEs match. So for
packages which have a CVE and the "CPE" matches the buildroot package
name, this would be an easy task.

Going through all the other packages which are yellow but no CVE matches
is a more daunting task. And yes, if no CPE is found for now, this
information should also be stored somewhere.

>> And of course, how we can get as many packages as possibe from yellow
>> to green/red.
>> 
>> What could also be done is a seperate script which loops over the CVEs
>> and prints if no mapping to a buildroot package is found. So someone
>> could look at it and say, oh this CVE looks like it should match one
>> of our packages.
> 
> This is going to be horrible: the NVD database contains CVEs for
> zillions of proprietary products that are completely irrelevant to
> Buildroot. Looking through all of this data is going to be really
> atrocious.

I see. I guess there is no matching for "!= commercial"? ;)

-michael
