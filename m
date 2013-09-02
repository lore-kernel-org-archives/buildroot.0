From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Sep 2013 18:11:53 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org> <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
Message-ID: <5224B8C9.7060609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/13 10:44, Thomas De Schampheleire wrote:
> Hi Thomas,
>
> On Fri, Aug 30, 2013 at 2:52 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear J?r?me Pouiller,
>>
>> On Fri, 30 Aug 2013 14:44:01 +0200, J?r?me Pouiller wrote:
>>
>>>> In one of the previous buildroot developer days we discussed this.
>>>> IIRC, the conclusion was that this change in order shouldn't matter,
>>>> because all dependencies should be expressed in make. Hence, the end
>>>> result should be the same, even though build order was not.
>>>>
>>>> Have you come across a scenario where there actually was a problem?
>>>
>>> Some packages may detect installed library during ./configure run.
>>> Buildroot
>>> should be aware of this and fix dependencies with that library.
>>> Although, it
>>> is not always the case and Buildroot should at guarantee
>>> reproducibility of
>>> build.
>>>
>>> Without that, we cannot guarantee to reproduce a build done by
>>> Autobuilder.
>>
>> I agree with this. Thomas, I'm not sure that what you say what a
>> conclusion of a developer day. I believe we always said that it is
>> hardly possible to guarantee that a package .mk file will contain *all*
>> the possible dependencies of the package. Whenever someone bumps a
>> package, we rarely look in detail at whether the software has gained
>> some optional dependencies, and make sure they are handled in the
>> corresponding package .mk file.
>>
>> Having the packages always built in the same order guarantees that, in
>> the absence of expressed dependencies, the build result will be
>> reproducible.
>
> I may be wrong about the conclusion.
> Regardless: it's true that it's hard to guarantee that all
> dependencies are expressed properly in the .mk files. However, by
> 'fixing' the wildcard behavior into a sorted one such as with previous
> versions of make, we just hide the problem. We will never notice that
> some dependencies are missing, as long as the dependency comes before
> the dependant (or whichever word) in alphabetical order.
 > With the random behavior of wildcards in newer versions of make, we
 > would still see issues in autobuilds, and get the opportunity to fix
 > them. It may take time, and may be a never-ending story as packages
 > are bumped and new packages are added, but at least there can be
 > improvement.
 > So, my viewpoint is to keep the current behavior and instead focus on
 > fixing any missing dependency when we spot it.

  I think this scenario is rather unlikely in reality. If it's a 
dependency which is not mentioned at all in .mk or Config.in, then at 
some point there will be a random config that has the package enabled but 
not the dependency. So this scenario will only occur if the dependency is 
mentioned in Config.in, but not in the .mk. With the amount of review we 
do, that is not very likely to happen. And even if it does, it is not 
correct but buildroot will still function correctly in the normal use 
case ('make' instead of 'make pkg').

  What is much more likely to happen is that there is some optional 
dependency in the package's configure or build system that is not 
expressed in Config.in or pkg.mk. Most reviewers do not run a 'configure 
--help', and even then it is easy to miss something. Since the dependency 
is optional, the build will not fail either way. Only, when user A builds 
it, TLS support is included, but when user B builds it, it is not... 
That's the kind of lack of reproducability we really need to avoid.


  Note that doing more randomized build order in the autobuilder also 
will not capture the latter scenario. You would have to compare the build 
result - but binary differences are likely because of changing timestamps 
or changing optimizations depending on memory randomness.


  Regards,
  Arnout

>
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
