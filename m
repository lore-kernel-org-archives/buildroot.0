From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 21:55:37 +0200
Subject: [Buildroot] Discussing libudev,
	was: Re: [PATCH v6 09/32] mesa3d: dri2 does not need udev support
Message-ID: <pil74bx9op.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in
news:1399716164-6452-10-git-send-email-bernd.kuhls at t-online.de: 

> http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=b959fd967493
> 8e127a34d42d34b903e3a9ae7ad9 "The loader infrastructure for everything
> but DRI2 requires that udev be present" 
> 
> Check for udev only for dri3.

> Patch sent upstream:
> https://bugs.freedesktop.org/show_bug.cgi?id=75212#c5

Hi,

I would like to discuss feedback I received for my patch to remove udev as 
a requirement for mesa dri2 support. Before going into details I would like 
to explain the system where I am using xbmc:
The distro (www.fli4l.de) uses buildroot to compile its binary files and 
the kernel. As an user-provided package for fli4l I am building xbmc & 
tvheadend here, so I am not in a position to have a free design choice 
while using fli4l, which I want to do.

Quoted are some important configuration options of fli4l:

buildroot .config
BR2_i386=y
BR2_TOOLCHAIN_USES_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_ROOTFS_DEVICE_CREATION_STATIC=y

busybox .config
CONFIG_MDEV=y

Now the feedback on the mesa3d bug tracker:
https://bugs.freedesktop.org/show_bug.cgi?id=75212#c6

Emil Velikov wrote:
--- snip
udev != libudev. The latter can be used without the presence of the former 
as it is a selection of helper functions that helps abstract dev 
manipulations.

AFAICS you have a couple options here - install libudev or keep a bunch of 
local patches. I would encourage you go with the former.
--- snap

This was an interesting piece of information for me because I am patching 
xbmc to remove its libudev dependency in the cec-adapter detection part.
While trying to setup Emil?s suggestion I created a libudev package which 
was successfully linked by libcec and its binary cec-client to detect my 
cec adapter so I guess Emil?s idea could really work.

I have yet to do more testing but reading through the udev/systemd/eudev 
discussion of the last months here I would like to ask for feedback already 
at this early stage whether a seperate libudev package is useful for the 
broader public.

Regards, Bernd
