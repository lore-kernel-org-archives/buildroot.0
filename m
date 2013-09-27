From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 27 Sep 2013 11:06:15 -0400
Subject: [Buildroot] [PATCH v2] Add support for eglibc-2.17 multiarch
 layout, from Linaro 2013.07+
In-Reply-To: <20130917205024.0bd97ef9@skate>
References: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com>
 <5237F574.9070700@mind.be>
 <1379411093-37240-1-git-send-email-greg.beresford@zbdsolutions.com>
 <CA+-urNTYe7NF43KmEQDYVZBsqvgC0w+F7VtEafRUQVxhzO+CNA@mail.gmail.com>
 <20130917205024.0bd97ef9@skate>
Message-ID: <CA+-urNQwu7jcgAgHmpEY8Do_hbBMK85qZcTyaTo4HCm5kW-8Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 17, 2013 at 2:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Frank Hunleth,
>
> On Tue, 17 Sep 2013 13:01:14 -0400, Frank Hunleth wrote:
>
>> Thanks for posting the patch. I've been trying it out, but I think
>> that I'm running into a bigger problem of how the shared library
>> search path works now. I.e. /usr/lib is not searched by default
>> anymore even though that's where many buildroot packages install their
>> libraries.
>>
>> Here's the new search path:
>>
>> /lib/arm-linux-gnueabihf/
>> /usr/lib/arm-linux-gnueabihf/tls/v7l/neon/vfp/
>> /usr/lib/arm-linux-gnueabihf/tls/v7l/neon/
>> /usr/lib/arm-linux-gnueabihf/tls/v7l/vfp/
>> /usr/lib/arm-linux-gnueabihf/tls/v7l/
>> /usr/lib/arm-linux-gnueabihf/tls/neon/vfp/
>> /usr/lib/arm-linux-gnueabihf/tls/neon/
>> /usr/lib/arm-linux-gnueabihf/tls/vfp/
>> /usr/lib/arm-linux-gnueabihf/tls/
>> /usr/lib/arm-linux-gnueabihf/v7l/neon/vfp/
>> /usr/lib/arm-linux-gnueabihf/v7l/neon/
>> /usr/lib/arm-linux-gnueabihf/v7l/vfp/
>> /usr/lib/arm-linux-gnueabihf/v7l/
>> /usr/lib/arm-linux-gnueabihf/neon/vfp/
>>
>> I can think of a few hacks to get around this, but is there a right
>> way that I should be configuring buildroot to deal with this
>> multiarch/multilib toolchain feature?
>
> I haven't had the time yet to try the patch and experiment with this
> problem specifically, but I believe one of the possible solutions is to
> continue to install the libraries in /lib and /usr/lib, and
> creates /lib/arm-linux-gnueabihf/ -> /lib
> and /usr/lib/arm-linux-gnueabihf/ -> /usr/lib symbolic links.

I'm not sure if you had a chance to revisit this, but I wanted to
report that using symlinks works. Here's what I've temporarily added
to my rootfs post build script:

if [ -d $TARGETDIR/lib/arm-linux-gnueabihf -a ! -h
$TARGETDIR/lib/arm-linux-gnueabihf ]; then
    mv $TARGETDIR/lib/arm-linux-gnueabihf/* $TARGETDIR/lib
    rm -fr $TARGETDIR/lib/arm-linux-gnueabihf
    rm -fr $TARGETDIR/lib/arm-linux-gnueabi
    ln -fs . $TARGETDIR/lib/arm-linux-gnueabihf
    ln -fs . $TARGETDIR/usr/lib/arm-linux-gnueabihf
fi

I'm not sure how best to integrate this with buildroot, but I've
haven't had much time to work on it. I'm hoping that this may be
helpful to someone fixing armhf builds when using the external
toolchain option.

Frank

>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



-- 
Frank Hunleth
Troodon Software LLC
http://troodon-software.com/
