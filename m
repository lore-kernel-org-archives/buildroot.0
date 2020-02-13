From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 13 Feb 2020 17:19:09 +0100
Subject: [Buildroot] udisks situation
In-Reply-To: <140df557-3b15-3f36-ac78-9d8d3139ad63@mind.be>
References: <4669dcc6-5080-22fc-702e-74f145a1a936@benettiengineering.com>
 <140df557-3b15-3f36-ac78-9d8d3139ad63@mind.be>
Message-ID: <dd9c4fb8-867b-9442-f319-b6de6ff87235@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 2/13/20 10:43 AM, Arnout Vandecappelle wrote:
> 
> 
> On 12/02/2020 21:52, Giulio Benetti wrote:
>> Hi All,
>>
>> during bump of udisks package from version 1.0.5(the last known 1.x version) to
>> version 2.8.4 lot of heavy dependencies have been added:
>> - gobject-introspection(upcoming from Adam Duskett[1])
>> - libblockdev(upcoming from me) => libbytesize, volume_key(upcoming from me)
>> - parted
>> - polkit
>> - sg3-utils
>> - libxslt
>> then it needs:
>> - toolchain w/ glibc
>> - nls enabled
>>
>> Adam Duskett, while testing(and fixing) my udisks branch[2] against its
>> gobject-introspection patchset[1], found out that currently Fedora provides both
>> udisks[3] and udisks2[4]. udisks(1) is considered obsolete but they still offer
>> it as a package.
>>
>> Upstream didn't create a dedicated 1.x branch, but considering the amount of
>> dependencies for version 2.x, maybe we could imitate Fedora and keep package
>> "udisks" as it is(since its development stopped on version 1.0.5), and package
>> "udisks2" that will follow upstream.
>>
>> The meaning to keep both packages is to have different memory footprints, but
>> most of all retro-fitting. udisks2 provides "udisksctrl" tool, while udisks(1)
>> provides "udisks" tool that are not compatible.
>>
>> I have already discussed about this in IRC with Thomas Petazzoni and we ended up
>> to keep udisks2 to follow upstream, but udisks(1) seems to be still used.
> 
>   What Fedora does is of little relevance to Buildroot IMO.
> 
>   Rather, let's look at who seems to be interested in the udisks package. Its
> last real change if from Pieterjan in 2016. The only real change before that is
> the addition of the package by Marek in 2013. So I'd say that probably nobody is
> using it.
> 
>   Our usual approach in such a case is to do whatever is the easiest. So in this
> case, I'd say: simply bump the udisks package even though it adds all those
> dependencies and the API changes.

Ok, then let's bump it following upstream.

>   If someone has a problem with that, we have several ways to fix it later, e.g.
> by adding a udisks1 package.
> 
> 
>> On the counterpart, being Buildroot an embedded linux build system, where the
>> system is not meant to be upgraded during its lifetime,
> 
>   Err, what? No no no, not upgrading during its lifetime would be a *very* bad idea!

Yes, you're right, indeed I'm looking at swupdate.

Thank you
-- 
Giulio Benetti
Benetti Engineering sas

>   Regards,
>   Arnout
> 
>> one could tell "do you
>> want udisks? So use new udisks and rewrite the interface to it on you
>> application or daemon.". But IMHO this case sounds to me similar(even if of
>> minor impact) to packages "gstreamer" and "gstreamer1".
>>
>> [1]: https://patchwork.ozlabs.org/project/buildroot/list/?series=157909
>> [2]: https://github.com/giuliobenetti/buildroot/tree/dev/udisks-bump
>> [3]: https://apps.fedoraproject.org/packages/udisks
>> [4]: https://apps.fedoraproject.org/packages/udisks2
>>
>> Best regards
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
