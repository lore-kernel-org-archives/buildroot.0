From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 17:26:00 +0100
Subject: [Buildroot] [RFC PATCH] linux: let to work with xenomai in
 override mode
In-Reply-To: <CAOf5uwnZPoBUF8nGA8tg3fa3VjFQ5JxHTn_vJehp7C9iu4ovJQ@mail.gmail.com>
References: <1536782312-12240-1-git-send-email-michael@amarulasolutions.com>
 <20180912220822.7c6beee4@windsurf>
 <CAOf5uwnZPoBUF8nGA8tg3fa3VjFQ5JxHTn_vJehp7C9iu4ovJQ@mail.gmail.com>
Message-ID: <be15f521-7cad-8d39-8697-e7365bf2c41d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Michael,

On 12/09/2018 21:15, Michael Nazzareno Trimarchi wrote:
> Hi Thomas
> 
> On Wed, Sep 12, 2018 at 10:08 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On Wed, 12 Sep 2018 21:58:32 +0200, Michael Trimarchi wrote:
>>> We would like to patch xenomai in override mode. Xenomai create
>>> symlink in order to build the kernel and those links are absolute
>>> one. The adeos patch is not applied if it is found so we
>>> can change the connect hook from PRE_PATCH to PRE_CONFIGURE.
>>> The xenomi dependence should be explicit set
>>>
>>> Change-Id: Idc5189047451bb9ac3019d3f35674d5332159918
>>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>>
>> As I explained in our previous e-mail discussion, when you use
>> <pkg>_OVERRIDE_SRCDIR, you should handle any needed patching yourself.
>>
>> Doing what you suggest here means that all patches from Linux kernel
>> extensions will be applied in the configure step, which is:
>>
>>  (1) Contrary to common sense: why should patching happen outside of
>>      the patching step ?
>>
> 
> Xenomai create symlinks, and it's not only a patch by provide links to
> the package. Adeos
> patch xenomai but another part is connect to those symlinks. Now you
> can not let to have
> a complete developement project without move this is a patching step.
> Xenomai check if the
> patch applied correspond to the one that you are going to apply and if
> they are the same
> the symlink are created.
> 
> Now suppose to have a manifest and repo describe your buildroot
> project and your override
> and you want to have the kernel already patched but with symlink not
> created. I don't going to
> git commit symlink but I want them created automatic.
> 
> Is now more clear?

 Your intention is fairly clear, but we still disagree :-)

 The problem is that when you have an OVERRIDE_SRCDIR (or local site method), it
is impossible for Buildroot to know what you intend to do with each patching
step. One person may already have the adeos stuff applied in their repo, another
one may not.

 To be consistent, we have chosen to never do any patching when OVERRIDE_SRCDIR
is used. Whatever the patching step is doing, you can always do that manually,
either in a script that is called before running Buildroot, or just committing
the patched/modified/symlinked tree into your repo.

 In case of the Adeos patch, it is not even a problem to do it this way, because
Xenomai is fairly independent of the Adeos patch (i.e. you can have a different
version of the Adeos patch and Xenomai usually still works).

 Therefore, we've marked your patch as Rejected in patchwork.

 Regards,
 Arnout
