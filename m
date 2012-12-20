From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 20 Dec 2012 14:12:53 +1300
Subject: [Buildroot] Any way to override .config settings?
In-Reply-To: <CAJJ6jxucNMGJo1pSNsL04rUMjZbcH1Z8XkGLGMGkHArsmRehMw@mail.gmail.com>
References: <CAE21AQpSdqfXmX1Kv97LHQP_kqEqC9FH+rwU70ZZAPS-Xt4_DA@mail.gmail.com>
 <50D255F0.8030107@mind.be>
 <CAE21AQrTh=bTke7awGUDfp+SfJJx5K1L6HVVhMs5F4eXAaZaTA@mail.gmail.com>
 <50D259DC.7090509@mind.be>
 <CAJJ6jxuyeGH0iGkZ-UgaufGMKkuK8Ena80KjMfyLkzjou9t99w@mail.gmail.com>
 <CAE21AQpTYPzOG-M1W_ERLJjX6DijJyt4eXWeu-qg0A1=cXNPJQ@mail.gmail.com>
 <CAJJ6jxucNMGJo1pSNsL04rUMjZbcH1Z8XkGLGMGkHArsmRehMw@mail.gmail.com>
Message-ID: <CAE21AQp_+4zm-epcSzjd7ridYX3nTxMyinqhK75Au-=ERB=LAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 20, 2012 at 2:00 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
> On Wed, Dec 19, 2012 at 4:46 PM, Charles Manning <cdhmanning@gmail.com> wrote:
>> On Thu, Dec 20, 2012 at 1:26 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
>>> On Wed, Dec 19, 2012 at 4:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>> On 20/12/12 01:13, Charles Manning wrote:
>>>
>>>>
>>>>>>> 1) Is there a built in mechanism in buildroot to include extra symbols
>>>>>>> and override those in .config?
>>>>>>
>>>>>>
>>>>>>
>>>>>>   Yes, the package override file: BR2_PACKAGE_OVERRIDE_FILE, defaults to
>>>>>> $(TOPDIR)/local.mk. I use this to include a bunch of project-specific .mk
>>>>>> files that add packages without requiring a Config.in.
>>>>>
>>>>>
>>>>> In a separate thread to this, I submitted a patch that follows the
>>>>> package overriding idea to override the config
>>>>
>>>>
>>>>  Since it does exactly the same as BR2_PACKAGE_OVERRIDE_FILE, I don't see
>>>> the point... Unless you want to start overriding toolchain configs.
>>>>
>>>>  Actually, I don't see much point to override the .config - why not just
>>>> save a different .config?
>>>>
>>>
>>> I agree. From a maintenance point of view, having one file (.config or
>>> defconfig) that describes how something is built is much nicer than
>>> having a .config and various makefiles that hack at it.
>>
>> Simplicity is pretty much my goal here too and proliferating
>> defconfigs for minor tweaks seems a nasty way to tackle the issue.
>>
>> Some examples of where this might make sense:
>>
>> .config defines the project and individual developers want to apply
>> tweaks to that.
>> eg.1) I sometimes have problems with my svn client and only managed to
>> get it working properly by forcing --username and --password. That is
>> not something I want to put in a defconfig.
>>
>> eg2) Keeping everything the same, except changing revisions.
>> eg3) Overriding sources for stuff while
>>
> Hi Charles,
>
> Please keep the list in CC, others may have an opinion too.
>
> I don't know how to deal with problems with the svn. All other things
> can be handled with local custom configs. Git branches work
> wonderfully for such things.
>
>>>
>>> Also, the buildroot make system is a mechanism that can easily be
>>> extended by an external script or makefile. We should resist the
>>> temptation to complicate the buildroot system just to fit a subset of
>>> people's strange build desires. Keeping it simple and clean and
>>> limiting the number of targets is good.
>>
>> Sorry... How is that logically consistent? A few lines back you say
>> "just make more defconfigs". Now you say "limit the number of
>> targets"...
>>
>> My proposed addition of config overriding  .config allows simple
>> tweaking without generating more defconfigs. Surely that is a good
>> thing?
>>
>
> Maybe, but my objection is to adding makefile targets. That affects
> everyone, the docs etc. You having several configs that completely
> describe your build configuration is merely something that seems
> beneficial to me, maybe not you. I believe limiting the makefile
> targets is a good thing, and having a few, standard ways to externally
> configure your build is good enough.
>
> Regards, Steve

Sorry I didn't cc.

With a bit more fiddling I find that there is no need for an extra
CONFIG_OVERRIDE. The PACKAGE_OVERRIDE can do exactly the same (well
most of the time any way).

eg.

I can set the Linux version to HEAD in the defconfig and override that
with something else in local.mk

This also gives an "escape hatch" for doing some other stuff I want to
do (eg. make private custom packages without adding them to the main
buildroot tree).
