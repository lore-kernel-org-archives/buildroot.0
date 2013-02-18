From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 19:07:56 +0100
Subject: [Buildroot] QUILT helper
In-Reply-To: <5122132B.5000402@syscom-instruments.com>
References: <50F92F70.2070808@syscom-instruments.com>
 <50FACBAA.7020602@mind.be> <7241967.ZJo92yCnzW@sagittae>
 <5122132B.5000402@syscom-instruments.com>
Message-ID: <51226DFC.306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 12:40, Viallard Anthony wrote:
>>
>> We could add an option to apply-patches.sh to automatically do first
>> steps. We
>> could do:
>>     make $PKG-dirclean
>>     make CREATE_GIT=1 $PKG-patch

  I would make it something like 'make $PKG-prepare-patch'. That gives us 
the possibility to later add a PATCH_BACKEND variable that can be set to 
git, hg or quilt (or something else).

>>     cd build/$PKG-$PKG_VERSION
>>     git rebase -i
>>     git format-patch initial
>>
>> And with guilt:
>>     make $PKG-dirclean
>>     make CREATE_GIT=1 $PKG-patch
>>     cd build/$PKG-$PKG_VERSION
>>     guilt push/pop/refresh
>>     guilt export
>>
>> What do you think about it?
>>
>
> Hello J?r?me,
>
> I think using QUILT directly will be the best. Because, we don't need git
> here. We just need a buildroot system to init quilt env, copy patches and
> when the job is done, copy the patches from quilt env to the package
> directory.

  I think more people (in particular, the buildroot developers) are 
familiar with git (or hg) workflows than quilt workflows.

  guilt combines the best features of git and quilt for this particular 
purpose, I think (not that I ever used guilt :-). quilt has the 
disadvantage that you have to add a file before modifying it - this is 
solved by guilt. git has the disadvantage that it is easy to loose your 
orientation in the middle of a rebase (with edits) - that is also solved 
by guilt.


> I want so much this feature ! I'm the only one here :) ?

  I'm also in favour of this feature. In fact, a long time ago I posted a 
patch to add a script to do the reverse: create a patch series from a git 
repository.

  Regards,
  Arnout

>
> I began to do some research about how openwrt do that and how we can do
> this in buildroot. But, I'm pretty busy and don't have time to do it now.
> If someone who know internal stuff in buildroot can tell where to do the
> modifications, it will be appreciable.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
