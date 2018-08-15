From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 21:41:31 +0200
Subject: [Buildroot] [PATCH 5/8] package/mender: add
 BR2_PACKAGE_MENDER_DEVICE_TYPE option
In-Reply-To: <20180815194708.733bc58d@windsurf>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-6-mirza.krak@northern.tech>
 <20180815135507.6c321a4a@windsurf>
 <CADHdJwA+gYRAc5r1PGaE4ubaudUhJh5cmQeuaAgAWACPV-oAZQ@mail.gmail.com>
 <20180815144224.49d967a7@windsurf>
 <CADHdJwB11mau2fiZsWCy=og6uEmSzybNDULUNXHr8T+s-CSB2Q@mail.gmail.com>
 <20180815194708.733bc58d@windsurf>
Message-ID: <CADHdJwAWQ2y+6v_Pc_ARLE4EebOaCSPcPDD3rR+TGGgh2ErAgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 7:47 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,

Hello,

< snip >

> I don't think we should enforce anything like that in the Mender
> package. Buildroot's policy is to not have much policy on how the
> system should be structured/organized. Maybe people won't need any data
> partition because the system is completely state-less ? Maybe they need
> two data partitions ? Maybe having it in /data is not what they want.

I highly appropriate you taking time to review this.

It is time for me to provide a bit more context :), I know all the
internals so I assume that other people know this as well :).

Mender is an end-to-end open-source update solution. This has some
implications and "enforcement". Other update solutions such as
swupdate or RAUC are generic update solutions and highly configurable
= no enforcement/policies. They do not really do anything specific
unless you apply some kind of configuration to them.

Mender is highly optimized to do A & B style updates really well and
that is it (for now), and is coupled with an management server for OTA
updates (optional as it is able to do stand-alone updates). Being
highly optimized for a specific use-case/style of updates also has
some (not many but still) "enforcement's" otherwise you lose some of
the benefits of being a "highly optimized" solution. I understand that
not everything can exist in the upstream Buildroot repository and some
things shall come in via file-system overlays and external patches but
I am trying to get in as much as possible to minimize the "external"
stuff and appreciate your feedback on where  to draw the line.

This examples is based on updates on block based devices (eMMC/SD)

Mender _requires_ that the following partitions:

- rootfs A
- rootfs B
- data (persistent)

So "data" is not optional. You can have as many extra partitions as
you would like but above is minimum if Mender is to be used. You can
adjust where to mount the persistent data partition easily trough
file-system overlay, but "normally" it is /data. Things that are
stored on "data" part are not touched by updates and you only update
rootfs A and rootfs B.

Things stored on the "data" part by the Mender client:

- update progress logs / error logs on the persistent data part to be
able to provide failed updates to the server.
- authentication data provided by the server once the device is boot-strapped.
- device_type (explanation coming soon :))
- fw_env.config ()

device_type and fw_env.config must be populated during build-time, the
other stuff will be dynamically created by the Mender client once it
connects to a server etc.

My intention with installing it to /data in mender.mk is to have it in
place, even though it is in the wrong location. This can be later
extracted in a "post build" stage and converted to an ext4 image and
embedded in to an disk image as a separate partition. If am violating
Buildroot policies with this, I will back-off :).

>
> So, the mender package should not make any assumption like this. And I
> still don't get why the device_type file should be in this data
> partition :-)

The device_type file normally contains a string like:

    device_type=raspberrypi3

or

    device_type=beaglebone

The content of this file is reported to the Mender service as a
"compatibility" string, so that you can only install artifacts that
are targeting "raspberrypi3" on devices that actually are reporting
that they are a "raspberrypi3" device. And the reason for this to be
on the "data" part is that this value can not change once set.

The same applies for the fw_env.config file, which is an important
part for Mender to work it is put on "data" part to not be affected by
updates. There is a symlink in rootfs, /etc/fw_env.config ->
/data/uboot/fw_env.config

Sorry for the long email, but hopefully this brings some insights.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
