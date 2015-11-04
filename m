From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 4 Nov 2015 10:38:03 -0800
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
	configurations
In-Reply-To: <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <20151102224357.213f796c@free-electrons.com>
 <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
Message-ID: <CAKbGBLh_3oY7j738N5Tp=Y9fsdcG+0YEfU9WMwq8yP3h7jC82g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 3, 2015 at 1:17 PM, Gabe Evans <gabe@hashrabbit.co> wrote:
> Hi Cyril, Thomas,
>
> This patch results in dropbear being broken out-of-the-box for systemd
> users. The EnvironmentFile= line sets a requirement that
> /etc/default/dropbear exist (it doesn't, by default).

Make it "EnvironmentFile=-/some/path" (note the dash) and it will
ignore cases where the environment file is not present.

> I'm not so sure having an environment file by default is a good practice for
> systemd units. The general consensus is that things effecting the execution
> of a service should always be found in the appropriate service unit.
> Environment= would be better anyway since there's only one variable
> ($DROPBEAR_ARGS) being used in this particular case.
>
> An even better solution would be to move the dropbear.service symlink from
> /etc/systemd/system/multi-user.target.wants/ to
> /usr/lib/systemd/system/multi-user.target.wants/. That would allow users to
> shadow the unit completely with their own customizations or override
> individual options through the use of "drop-in" units. The manual explains
> this in more detail:
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#id-1.10.3
>
> Thanks,
> Gabe
>
> On Mon, Nov 2, 2015 at 1:43 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Dear Cyril Bur,
>>
>> On Thu, 29 Oct 2015 17:11:41 +1100, Cyril Bur wrote:
>> > systemd .service file should respect /etc/default/dropbear
>> > ---
>> >  package/dropbear/dropbear.service | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Thanks, applied.
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
>
> --
> Gabe Evans | Co-Founder & CTO
> hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
