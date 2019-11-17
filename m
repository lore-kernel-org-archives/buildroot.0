From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 18:34:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: set machine id file
 instalation as optional choice
In-Reply-To: <CAFvCimW2Pp+j4O2TtXGbXW-9uf_epkpbA-q7+Sq1sTGrTD5bEw@mail.gmail.com>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
 <0b8bd9be-3109-f998-5a44-cca063d1e207@mind.be>
 <CAFvCimUuDJUWzKPA-rX0rqcFNGgNARvD5gdLYqDjR+XVdbgUVA@mail.gmail.com>
 <6987e42b-89ad-cbf3-fd03-ee3ad74880b7@mind.be>
 <CAFvCimW2Pp+j4O2TtXGbXW-9uf_epkpbA-q7+Sq1sTGrTD5bEw@mail.gmail.com>
Message-ID: <782843ef-67eb-d6df-c97d-dc7877448918@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Je?re?my,

 Thanks for your input!

On 17/11/2019 17:14, J?r?my ROSEN wrote:
> Argh, each time I simplify a bit, it comes back to bite me :)
> 
> Le?dim. 17 nov. 2019 ??17:00, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> a ?crit?:
> 
> 
> 
>     On 17/11/2019 15:19, J?r?my ROSEN wrote:
>     > hmmm, I'm kinda torn on that one..
>     >
>     > The only difference I see betweed no machine-id and an empty machine-id is
>     > systemd-firstboot and ConditionFirstBoot
> 
>     ?That's exactly the point I think.
> 
>     ?I assumed, however, that ConditionFirstBoot was evaluated by systemd-firstboot,
>     but that's not the case then?
> 
> 
> 
> no, all Condition* are handled by PID1.?
> systemd-firstboot.service itself relies on ConditionFirstBoot to decide if the
> binary needs to be started

 Of course, that makes a lot of sense if you think about it. I should do more of
that :-)


>     > if the file is empty or missing and systemd can write to it, systemd will
>     set it
>     > up (not sure what happens for Arnout's symlink, that's worth testing)
>     > however, if the file exists but is empty we will skip systemd-firstboot
>     >
>     > for context, systemd-firstboot does the following:
>     > * set (unconditionnaly) a machine-id
> 
>     ?Are you saying that if systemd-firstboot it not enabled, no machine-id will be
>     generated?
> 
> no, it's a bit more complex, and i'd need to check the details.
> 
> my understanding is that systemd-firstboot will always override the machine-id
> whereas on a normal boot,?
> the machine-id will be used if available and generated/written if not

 That also makes sense.

[snip]
>     ?Actually, come to think of it, maybe it's better to never create the machine-id
>     at all. What is the effect (with a readonly rootfs) if machine-id doesn't exist?
>     Does it block booting, does the boot take a little longer, or do we boot with a
>     different machine-id all the time? And in the latter case, is there a real
>     problem with that?
> 
> 
> on a RO filesystem
> * if /etc/machine-id exists and contains a machine-id, systemd will use it
> * if it's an empty file, systemd will bind-mount a file with a machine-id over
> the file

 Where I suppose the machine-id is regenerated on every boot.

> * if the file does not exist, systemd can't bind mount over the file... systemd
> itself should be fine, but other services might not, it's hard to tell

 That's not good...

> 
> So the recommended?way for a read-only rootfs is to have that empty file, which
> is why this is what currently have.
> it works both for RW and RO filesystems..

 Another option would be to make it a symlink to a file in tmpfs, but that
doesn't help because the net effect is the same: machine-id is regenerated on
every boot :-(


> A longer-term solution would be to add a patch upstream to allow to specify in a
> systemd configuration file what is?
> the file to check for first boot instead of /etc/machine-id.

 No, that makes very little sense. If a system has any kind of persistency, then
machine-id should definitely be one of the things that is persisted, so it's a
perfect flag for firstboot.

 Upstream's vision is that /etc should be persistent and empty on factory reset
[1]. But we're far away from having an empty /etc in Buildroot...



> I can look into that, but for the short term, i'd?rather break
> ConditionFirstBoot than read-only rootfs
> 
> so... not sure what to advise at that point. that choice is something a bit too
> specialized for a config option
> especially if we plan to drop it in the future
> 
> so not sure where to go...

 As is often the case: it looks to me that the status quo is the best we can do :-)

 Regards,
 Arnout

[1] http://0pointer.net/blog/projects/stateless.html

[snip]
