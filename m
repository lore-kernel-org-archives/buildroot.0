From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 6 Jun 2013 11:26:43 -0700
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
 <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
 <CALo-6+jLazVYE_tXAyL+JVr6Duo-3yd+ayiX4PHOB5wiskBCKw@mail.gmail.com>
 <CAMYPSMppGbVCw451=gaDOvROj=HLpYd1z9HRg5ujA9N2cu7q0w@mail.gmail.com>
 <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
Message-ID: <CALo-6+hQ9+LDuE9XkRhoyMUjVBLbwS-gmap8cmG5OzrCoRn9ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ahh, I think I see what is happening.

When I use your .config, Wojciech, I see that QtDeclarative is not checked.

Try checking QtDeclarative and I suspect you will get to a similar
place I am at with your patch.

I originally started with QtDeclarative unchecked and buildroot built
lots of Qt libraries that loaded onto the AM3517 target and life was
good. But, .... then one of the Qt engineers said "Hey, we need
QtDeclarative" and once I checked that, I have been in a world of
"dunt work"

Charles

On 6/6/13, Charles Krinke <charles.krinke@gmail.com> wrote:
> Dear Wojceich:
>
> Your new patch looks like the only difference is the line changing
> package/opengl/libgles/libgles.mk from
>
> -ifeq ($(LIBGLES_DEPENDENCIES),)
> +ifeq ($(LIBGLES_DEPENDENCIES),y)
>
> I still get the same error when compiling Qt and that is:
>
> patching file mkspecs/common/posix/qplatformdefs.h
>>>> libgles undefined Configuring
>>>> libgles undefined Building
>>>> libgles undefined Installing to target
>>>> libegl undefined Extracting
>>>> libegl undefined Patching package/opengl//libegl
>>>> libegl undefined Configuring
> echo "No libEGL implementation selected. Configuration error."
>
> So, from this, I am assuming there is some mis-configuration on my end
> that is causing buildroot to go into the package/opengl/libgles
> directory when perhaps it should be going to either somewhere in Qt
> (QtOpenGl perhaps) or somewhere in Graphics_SDK_XXX. I am searching
> more into that.
>
> Perhaps one way to converge this would be to get your patch committed
> to the buildroot repository. The only parts that appear to be missing
> are the QMAKE_LIBS_INCDIR_OPENGL* ^ BR2_PACKAGE_QT_OMAP_LIB_PATH from
> night before last build on the buildroot server.
>
> If we could get the logic that pertains to the external TI
> Graphics_SDK committed into buildroot then those folks that wish to
> use QtDeclarative or another option that needs the Graphics_SDK, then
> we could be a bit further along for all.
>
> Charles
>
>
> On 6/6/13, Wojciech Sle?ska <wojciech.slenska@gmail.com> wrote:
>> Hello Charles,
>>
>> I didn't check this patch for current version of buildroot. It was
>> created some time before 2013.05. Sorry for that.
>>
>> I noticed that there was some changes in libgles configuration in new
>> versions of buildroot.
>> In attachment you can find patch for buildroot 2013.05 and my .config
>> file.
>>
>> In config I used arago compiler, because I had some problems in past
>> with others compilers ? maybe just for sure use arago. You can find it
>> here:
>> http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html
>>
>> Few minutes ago I made build and test this solution on my TI AM3517
>> and it is working.
>>
>> Best Regards
>> Wojciech Slenska
>>
>>
>> 2013/6/6 Charles Krinke <charles.krinke@gmail.com>:
>>> Dear Wojciech:
>>>
>>> I have been working with your patch but seem to have gotten myself
>>> into another "pickle" in that when I compile, I get the sequence
>>> below. I will start again fresh in the morning with the original patch
>>> and the nightly build from buildroot, which will be
>>> buildroot-20130606.tgz.
>>>
>>> Question, I presume the patch should apply against tonights buildroot?
>>> If not, is there a nightly build you would recommend for applying to
>>> patch to?
>>>
>>> If you have a suggestion on the errors, that would be appreciated.
>>>
>>> Hopefully you, Spenser or Prabu can get this and any remaining logic
>>> into buildroot so Neon, OpenGl and EGLFS support becomes part of the
>>> buildroot trunk, soon.
>>>
>>>>>> qt5base 5.0.2 Extracting
>>> xzcat
>>> /home/ckrinke/buildroot-20130605/dl/qtbase-opensource-src-5.0.2.tar.xz
>>> | tar --strip-components=1 -C
>>> /home/ckrinke/buildroot-20130605/output/build/qt5base-5.0.2  -xf -
>>>>>> qt5base 5.0.2 Patching package/qt5//qt5base
>>>
>>> Applying qt5base-mkspecs-files.patch using patch:
>>> patching file mkspecs/devices/linux-buildroot-g++/qmake.conf
>>> patching file mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>>>
>>> Applying qt5base-uclibc-no-lfs.patch using patch:
>>> patching file mkspecs/common/posix/qplatformdefs.h
>>>>>> libgles undefined Configuring
>>>>>> libgles undefined Building
>>>>>> libgles undefined Installing to target
>>>>>> libegl undefined Extracting
>>>>>> libegl undefined Patching package/opengl//libegl
>>>>>> libegl undefined Configuring
>>> echo "No libEGL implementation selected. Configuration error."
>>> No libEGL implementation selected. Configuration error.
>>
>
>
> --
> Charles Krinke
>


-- 
Charles Krinke
