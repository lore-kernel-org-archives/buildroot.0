From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 7 Mar 2016 08:42:24 -0800
Subject: [Buildroot] buggy init script
In-Reply-To: <CAK7rcp-mGsPNS03NthrhdGV00TtthChp0M+OP=oZ+7BW6isGzA@mail.gmail.com>
References: <CAK7rcp-mGsPNS03NthrhdGV00TtthChp0M+OP=oZ+7BW6isGzA@mail.gmail.com>
Message-ID: <CAJJ6jxv=Fvv1_s=Hci673DO4fMQ4gi0N1Jc7dmd1p20wDa1vFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 7, 2016 at 6:48 AM, Kenneth Adam Miller
Hi Ken,

This is not so much a buildroot question as a linux user question.
Anyway a couple of maybe helpful answers below.

<kennethadammiller@gmail.com> wrote:
> I have a buildroot system with multiple target bzImages, each with a
> respective configuration. The configurations don't differ in much else aside
> from hostname. I have /etc/init.d in my target directory being populated
> with relevant scripts S02abc, S90xyz, S91abcxyz, S92zyx. I operate under the
> belief that init.d contents get executed in order of their numbers after S,
> and that the names after S<num><name> do not matter. In addtion, we are
> appropriately setting the permissions, which I've verified in both the
> /etc/init.d of the subject on startup and with our install command on the
> buildroot package that we have.
>

This assumption is correct.

> But what I'm seeing is something that appears to be spurious results that
> are inconsistent across runs. One host will execute a script like what is
> below just fine on startup, and sometime another system will not, despite
> the fact that the files are identical in the init.d directory for each host.
>

You don't give enough info on your environment. What is the rootfs
built into on your test runs? NFS? Flash? etc. How did it get there?

If you always do a make clean, fresh install for each flavor of init
scripts, do you have these problems?

What I am getting at is if you always just untar the rootfs into say a
nfs partition, the old stuff will be there. So now you have parts of
two filesystems and probably your run stuff will be confusing (new
files will over-written but old files will still be there). Check
/etc/init.d after boot and look for litter. dmesg and
/var/log/messages might have useful info.

Lots of packages add init scripts. Add your customizations one at a
time, and try to find the source of your problems. If you are nfs
booting you can alter the /etc/init.d scripts easily and reboot to
test again.

Good Luck, Steve
