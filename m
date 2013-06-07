From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 7 Jun 2013 07:44:09 -0700
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <20130607100824.2cc5e5e0@skate>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
 <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
 <CALo-6+jLazVYE_tXAyL+JVr6Duo-3yd+ayiX4PHOB5wiskBCKw@mail.gmail.com>
 <CAMYPSMppGbVCw451=gaDOvROj=HLpYd1z9HRg5ujA9N2cu7q0w@mail.gmail.com>
 <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
 <20130607100824.2cc5e5e0@skate>
Message-ID: <CALo-6+j5W7OERo3dtuUqzmcidq2tcR=BobM_d6NWt2iMx-s0tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you both Thomas and Wojciech:

I can seem to get past this error by enabling "rpi-userland" which
does define LIBGLES_DEPENDENCIES, but this seems like the wrong answer
to me. Perhaps there is a different configuration setting somewhere
else that defines sufficient configuration for the AM3517 that I have
missed?

I just did a make clean && make after defining "rpi-userland" and the
compilation completed with a libQt5OpenGL.so.5.0.2 about 300KBytes in
size, so something seems to have worked.

Would it be correct that LIBGLES_DEPENDENCIES may just have to be
defined to "anything" so we could put into qt5base/qt5.mk a line that
says

LIBGLES_DEPENDENCIES += any_string_will_do

and expect success?

On 6/7/13, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Dear Charles Krinke,
>
> On Thu, 6 Jun 2013 11:20:05 -0700, Charles Krinke wrote:
>
>> Your new patch looks like the only difference is the line changing
>> package/opengl/libgles/libgles.mk from
>>
>> -ifeq ($(LIBGLES_DEPENDENCIES),)
>> +ifeq ($(LIBGLES_DEPENDENCIES),y)
>
> The first line is the correct one. The second line was the one
> originally introduced, but it was a bug. The idea here is that if
> LIBGLES has no dependencies, then it means that no OpenGL
> implementation was selected.
>
>> I still get the same error when compiling Qt and that is:
>>
>> patching file mkspecs/common/posix/qplatformdefs.h
>> >>> libgles undefined Configuring
>> >>> libgles undefined Building
>> >>> libgles undefined Installing to target
>> >>> libegl undefined Extracting
>> >>> libegl undefined Patching package/opengl//libegl
>> >>> libegl undefined Configuring
>> echo "No libEGL implementation selected. Configuration error."
>
> This happens when no package provides a libEGL implementation, i.e
> LIBEGL_DEPENDENCIES is empty.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>


-- 
Charles Krinke
