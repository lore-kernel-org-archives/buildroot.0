From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Jun 2021 22:33:48 +0200
Subject: [Buildroot] Gstreamer1.18 build static option
In-Reply-To: <20210621202438.518c144c@gmx.net>
References: <CALM_QrXzearvsRtm_QikCF1atAWiKsqBAFhGPUHYcbMQqkM3RA@mail.gmail.com>
 <20210621202438.518c144c@gmx.net>
Message-ID: <8af50a20-0e95-9bb9-8abf-82608b37d811@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2021 20:24, Peter Seiderer wrote:
> Hello Ratheendran,
> 
> On Mon, 21 Jun 2021 13:05:45 +0530, Ratheendran R <ratheendran.s@gmail.com> wrote:
> 
>> Hi All,
>>
>>
>> I am looking for the option to build gstreamer statically and linking with
>> our webrtc plugin.
> 
> There are no per-package options in buildroot to select static or dynamic
> linking...
> 
>>
>>  looks like it is not supported on buildroot 2020.x, let me know if this
>> working on any of the buildroot versions.please share the details or
>> workaround if exists.
> 
> Only a global one, take a look at 'make menuconfig' and 'Build options' -->
> 'libraries' --> 'staic only'/'shared only'/'both static and shared'....

 Note that static-only is not available with glibc, you need to use musl or
uClibc for that.

 Also, static-only will link *everything* statically, which (for bigger systems)
will usually result in a huge footprint.

 I would suggest to use 'both static and shared'. Unfortunately, that won't
work: GStreamer uses meson as build system, and meson doesn't support building
both shared and static libraries at the same time, so you'll get only the shared
library.

 A workaround that some people use is to have two buildroot configurations: one
which is static-only and where you build the static libraries, and a second one
that copies the files from the first one as external toolchain, so the static
libraries are available. That's a hack that half-works, but it could be useful
for you.

 Regards,
 Arnout

> But not sure if gstreamer will honor your selection as you expect it (personally
> do only use/test the shared case)...
> 
> Regards,
> Peter
> 
> 
>>
>>
>> thanks in advance
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
