From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 30 Oct 2017 11:32:36 -0400
Subject: [Buildroot] [WIP 0/2] gobject-introspection
In-Reply-To: <CAFSsvmohhFyXHSEsj7YwczuM9Y4+FyFX4ZaE5e=7Yn7mtw6qeA@mail.gmail.com>
References: <20171020200856.19406-1-Adamduskett@outlook.com>
 <0dddc375-85ee-5222-c90d-cfda74e1e601@mind.be>
 <CAFSsvmohhFyXHSEsj7YwczuM9Y4+FyFX4ZaE5e=7Yn7mtw6qeA@mail.gmail.com>
Message-ID: <CAFSsvmqq3Wn5X9h2DPC3UpyFXOm24jQARfEKv08ipVtSwrfBHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looking into it, there are 4 recipes in Yocto that require the
GIR_EXTRA_LIBS_PATH flag.

cogl, gstreamer, gtk3, and avahi.  (gtk-doc also uses it, but we don't
build gtk-docs).

Buildroot doesn't provide Cogl, so would it be best just to provide
patches for gstreamer and avahi?



On Fri, Oct 27, 2017 at 6:05 PM, Adam Duskett <aduskett@gmail.com> wrote:
> On Wed, Oct 25, 2017 at 6:10 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 20-10-17 22:08, Adam Duskett wrote:
>>> Gstreamer will now fail to build!
>>> Why? Gstreamer looks for an introspection library during the configure
>>> stage, and if it finds it, attempts to use it.
>>> Because some library paths not being making it to the introspection
>>> compiler, it will now fail to build with linking errors! Oh no!
>>>
>>> In Yocto, you can call out:
>>> export GIR_EXTRA_LIBS_PATH="path"
>>> (see meta/recipes-multimedia/gstreamer/gstreamer1.0.inc for an example)
>>> in the recipe file, which will be then get passed to g-ir-scanner-qemuwrapper,
>>> which will then set the environment variable LD_LIBRARY_PATH to the value of
>>> GIR_EXTRA_LIBS_PATH, whcih will then call g-ir-scanner, which will then
>>> call the functions in the script entitled "ccompiler.py" in the host directory.
>>> which will then resolve the library paths properly based off of the
>>> LD_LIBRARY_PATH variable. It's a very easy and clean solution to the problem.
>>>
>>> However, this isn't possible with BuildRoot because a script called from
>>> a GNU Makefile can't change the parent environment, and so the build
>>> will fail miserably.
>>
>>  So setting
>>
>> GSTREAMER_MAKE_ENV = GIR_EXTRA_LIBS_PATH="path"
>>
>> doesn't work? I wonder why not...
>>
> It doesn't! And I could really use some help with this!
>
>>  Regards,
>>  Arnout
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> Thanks!
>
> Adam
