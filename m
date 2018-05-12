From: Olof Johansson <olof@lixom.net>
Date: Sat, 12 May 2018 10:51:13 -0700
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <CAMWSM7gzGhpgRB-xXqNreQtvwR27d+UQuGUZ35_5uwhNY6gonA@mail.gmail.com>
References: <20180511172314.28ba9f80@windsurf.home>
 <20180511215508.GA28572@jaya>
 <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
 <704976570.261553.1526089365924.JavaMail.zimbra@datacom.com.br>
 <20180512142738.GB3674@momiji.home>
 <CAMWSM7gzGhpgRB-xXqNreQtvwR27d+UQuGUZ35_5uwhNY6gonA@mail.gmail.com>
Message-ID: <CAOesGMimW+-9zEaSoJk0-Xjwg7O6-NJ3fXMYDdkzGRDUSaKB9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 12, 2018 at 10:06 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> On Sat, May 12, 2018 at 6:27 AM, Adrian Perez de Castro
> <aperez@igalia.com> wrote:
>> On Fri, 11 May 2018 22:42:45 -0300 (BRT), Carlos Santos <casantos@datacom.ind.br> wrote:
>>> > From: "ratbert90" <aduskett@gmail.com>
>>> > To: anisse at astier.eu, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
>>> > Cc: "Olof Johansson" <olof@lixom.net>, buildroot at uclibc.org
>>> > Sent: Friday, May 11, 2018 10:22:49 PM
>>> > Subject: Re: [Buildroot] Tesla is using Buildroot
>>> >
>>> > [...]
>>> >
>>> > - there's a tesla-verity package which seems to be a custom init that
>>> > checks the validity of the verity metadata and interacts with
>>> > firmware to check soc lock status before calling dmsetup.
>>> > - there are a few packages that look like backports: python-dateutil,
>>> > nanomsg, python-pytz, python-jsonschema
>>> > - tesla-binutils is a "real" host binutils (non-cross)
>>> > - there's tesla-libsystemd stub that builds a libsystemd with stubbed
>>> > functions
>>>
>>> Makes me wonder why they don't use a BR2_EXTERNAL.
>>
>> Probably because (AFAIK) it is not yet possible to override base package in
>> a BR2_EXTERNAL. I have tripped on this myself a couple of times, and ended
>> up providing a top-level Makefile in the repo for my BR2_EXTERNAL which
>> downloads a certain version of the Buildroot tarball and applies a couple
>> of patches over it, then proceeds to chain up to the Buildroot Makefiles
>> passing the path BR2_EXTERNAL path down to them (so from the point of view
>> of somebody building, they just download the BR2_EXTERNAL repo and do ?make
>> foo_defconfig && make?).
>
> I do the same thing. The top level Makefile exports BR2_EXTERNAL="..",
> there's a target for cloning and checking out a specific Buildroot
> revision, then there's a wildcard pattern at the end to pass any
> unrecognized targets up to Buildroot's Makefile, so things like
> "linux-menuconfig" still work.
>
> It keeps my project repos nicely separated from upstream, and makes it
> easy to pull in upstream changes.
>
> I also have a few custom targets for taking the generated filesystem
> images, and packing them up with an installer and manifest.
>
> It would be nice if the manual covered some of these approaches,
> because when I first started using Buildroot, it wasn't immediately
> apparent how to do what I needed. Some examples would go a long way in
> that regard, I might see what I can do about that later.

I liked the split of having third party software in an upstream-based
separate buildroot repo, and only proprietary components in
BR2_EXTERNAL. That way it's easier to separate out the portion you
need to share for compliance (i.e. see current github contents), while
having a place to keep confidential material, work on new
configs/products/prototypes/internal uses that are not yet released,
etc in the BR2_EXTERNAL. As expressed above, wrapping it with a second
layer of makefiles makes it relatively easy to deal with.

Removing the upstream package and adding it locally really is no
different from replacing the contents in the repo. A rebase would do
the same.


-Olof
