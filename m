From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Feb 2014 22:15:26 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <CAAXf6LVFtrHs4EcrtF-bjT3V32fJ32N8DF9sPxDBXGucVCToyA@mail.gmail.com>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>	<CAAXf6LVM939GcFkXA6UkifUEs9H6sQnKgDqW8uBHQD3_JK0-OA@mail.gmail.com>	<52F2BF55.3050200@mind.be>
 <CAAXf6LVFtrHs4EcrtF-bjT3V32fJ32N8DF9sPxDBXGucVCToyA@mail.gmail.com>
Message-ID: <52F3FB6E.5070503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/14 08:50, Thomas De Schampheleire wrote:
> Hi Arnout,
> 
> On Wed, Feb 5, 2014 at 11:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05/02/14 12:54, Thomas De Schampheleire wrote:
>>> Hi,
>>>
>>> On Tue, Feb 4, 2014 at 3:12 PM, J?r?my Rosen <jeremy.rosen@openwide.fr> wrote:
>>>> When it is set, BR2_DEFCONFIG is saved like any config variable.
>>>> However, at this point it is a completely expanded, absolute path
>>>> It is not a good idea to save absolute paths in defconfig files
>>>> moreover it makes little sense to save the defconfig location
>>>> within the defconfig
>>>
>>> The entire BR2_DEFCONFIG mechanism has never done what I expected.
>>> What I want is that 'make savedefconfig' (or a similar command) saves
>>> the configuration back to where it originated from. BR2_DEFCONFIG does
>>> more or less that, but only if you set the configuration initially
>>> with 'make defconfig BR2_DEFCONFIG=...' instead of the normal 'make
>>> xxxx_defconfig'. Isn't this possible to achieve?
>>
>>  Sure, quite easily. However, is that really what we want?
>>
>>
>> make rpi_defconfig
>> add some packages
>> test test test
>> add more packages
>> test test test
>> make savedefconfig
>>
>> Oops I've just overwritten rpi_defconfig.
>>
>>
>>  It's probably what you want when using BR2_EXTERNAL, but not when using
>> a buildroot defconfig. Unless, of course, you don't use BR2_EXTERNAL but
>> add directly to the buildroot directory...
> 
> The question is how you define 'a buildroot defconfig'. Not so long
> ago, our recommendation for 'real' projects was to also put project
> defconfigs in configs/. For these defconfigs, I do expect the
> described behavior. It's true that an end-user with a raspberrypi
> should create his own private defconfig, from which point the
> described behavior is again desirable. A buildroot developer improving
> the raspberrypi defconfig (on purpose) wants the behavior as well.
> So the only situation where it is not desirable is when you start from
> a non-project defconfig and make private modifications.
> 
> One way forward is to introduce a new config variable, enabled on all
> non-project defconfigs, stating that we do not want this behavior. The
> buildroot developer improving the raspberrypi defconfig will have to
> do something special, but this may be acceptable.
> 
> The project developer now has a useful improvement in workflow.
> 
> What do you think of that?

 OK, so in most cases we really want the original defconfig to be
overwritten on savedefconfig. It is only when it's one of buildroot's own
config files that we prefer to protect the user.

 I'm not happy with the solution you propose, though, because it adds
complexity and yet another config option for not much of a feature. How
about this one, though: for users who clone the git tree, it's not much
of a problem since they'll see they made a mistake; for the release
tarballs, we can just make configs/*_defconfig readonly while creating
the tarball.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
