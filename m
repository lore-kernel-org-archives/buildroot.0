From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 6 Feb 2014 08:50:48 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <52F2BF55.3050200@mind.be>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
 <CAAXf6LVM939GcFkXA6UkifUEs9H6sQnKgDqW8uBHQD3_JK0-OA@mail.gmail.com>
 <52F2BF55.3050200@mind.be>
Message-ID: <CAAXf6LVFtrHs4EcrtF-bjT3V32fJ32N8DF9sPxDBXGucVCToyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Feb 5, 2014 at 11:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/02/14 12:54, Thomas De Schampheleire wrote:
>> Hi,
>>
>> On Tue, Feb 4, 2014 at 3:12 PM, J?r?my Rosen <jeremy.rosen@openwide.fr> wrote:
>>> When it is set, BR2_DEFCONFIG is saved like any config variable.
>>> However, at this point it is a completely expanded, absolute path
>>> It is not a good idea to save absolute paths in defconfig files
>>> moreover it makes little sense to save the defconfig location
>>> within the defconfig
>>
>> The entire BR2_DEFCONFIG mechanism has never done what I expected.
>> What I want is that 'make savedefconfig' (or a similar command) saves
>> the configuration back to where it originated from. BR2_DEFCONFIG does
>> more or less that, but only if you set the configuration initially
>> with 'make defconfig BR2_DEFCONFIG=...' instead of the normal 'make
>> xxxx_defconfig'. Isn't this possible to achieve?
>
>  Sure, quite easily. However, is that really what we want?
>
>
> make rpi_defconfig
> add some packages
> test test test
> add more packages
> test test test
> make savedefconfig
>
> Oops I've just overwritten rpi_defconfig.
>
>
>  It's probably what you want when using BR2_EXTERNAL, but not when using
> a buildroot defconfig. Unless, of course, you don't use BR2_EXTERNAL but
> add directly to the buildroot directory...

The question is how you define 'a buildroot defconfig'. Not so long
ago, our recommendation for 'real' projects was to also put project
defconfigs in configs/. For these defconfigs, I do expect the
described behavior. It's true that an end-user with a raspberrypi
should create his own private defconfig, from which point the
described behavior is again desirable. A buildroot developer improving
the raspberrypi defconfig (on purpose) wants the behavior as well.
So the only situation where it is not desirable is when you start from
a non-project defconfig and make private modifications.

One way forward is to introduce a new config variable, enabled on all
non-project defconfigs, stating that we do not want this behavior. The
buildroot developer improving the raspberrypi defconfig will have to
do something special, but this may be acceptable.

The project developer now has a useful improvement in workflow.

What do you think of that?

Thanks,
Thomas
