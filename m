From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Oct 2019 10:10:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: removed template config,
 added convenient 'sudo' group config options.
In-Reply-To: <CAH0Z9QLCKhx0-hjFUDd3xhj_281dqd8Lo93+AuXGhUit4uwikw@mail.gmail.com>
References: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
 <e97fd4a9-2d28-1d36-1ad3-9ae3c4486fd8@mind.be>
 <20191024101727.7af5db84@windsurf>
 <CAH0Z9QLCKhx0-hjFUDd3xhj_281dqd8Lo93+AuXGhUit4uwikw@mail.gmail.com>
Message-ID: <bc9c5724-e7e5-5220-8d21-b95810ba52e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/10/2019 23:26, Stephan Henningsen wrote:
> On Thu, Oct 24, 2019 at 10:17 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>>
>>>> +config BR2_PACKAGE_SUDO_GROUP_RULE
>>
>> I think we don't need any new option at all:
>>
>>  (1) Just create the sudo group unconditionally
> 
> I don't know about that. It wouldn't have any effect unless addition
> configuration was done, and so it would just be yet another unused
> system group filling up.  That's why I agree that the two options
> should be combined.
> 
> 
>>
>>  (2) Leave the customization of the /etc/sudoers file to the user,
>>      through an overlay/post-build script. We cannot add zillions of
>>      options to customize all aspects of each package configuration.
> 
> I think it's fair to say that the option I've added is a pretty
> standard usage of sudo. It's how it works in Ubuntu and Debian. So I
> consider it a very important option of this package that would
> definitely add a very common sudo use case and therefore something
> useful to Buildroot.

 I agree with that. If there is a sudo group, the only reason to have it is to
make it sudo-able. In the unlikely case that it needs to be different, it can
still be overridden in overlay.

 I believe our principle should be: allow any user customisation, but make sure
that the out-of-the-box experience is as smooth as possible.

 Obviously the out-of-the-box experience will still not be completely smooth
since there is no user in the sudo group, but it is still better than not having
a sudoers entry at all.


 So the only question is: should the addition of the sudo group be optional or
not? I see little reason to make it optional. Yes, it is yet another group, but
that just costs a few bytes in /etc/groups (which in practice doesn't cost
anything as long as the file stays under 4K).


 Regards,
 Arnout
