From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2019 23:03:25 +0200
Subject: [Buildroot] [PATCH v14 4/5] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <20191023225038.55ee5c3e@windsurf>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-5-aduskett@gmail.com>
 <20191022225920.7e35e42e@windsurf>
 <b3699991-75ec-157a-0a4f-913a7a1d83f8@mind.be>
 <99a57ce9-4573-87c9-d978-f14e7fa00dba@mind.be>
 <CAFSsvmowGKsba5LaD5S6xXbK0uL2kVYCvNbh9vN9-Mnu2=LFzA@mail.gmail.com>
 <20191023225038.55ee5c3e@windsurf>
Message-ID: <a17f32d5-a3bc-d656-3100-75da89e6d236@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/10/2019 22:50, Thomas Petazzoni wrote:
> On Wed, 23 Oct 2019 13:42:54 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
> 
>>>  Adam, could you test if this works better?
>>>
>>> +       $$(if
>>> $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME)")
>>> \  
>> $$(if $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)"
>> Also does not work, because the target python3 may not yet be built.

 Ugh indeed, another side effect of this environment being used for both "host"
python and "cross" python...

 I'm starting to think this is not such a good solution after all...


> But that is totally unrelated to the _sysconfigdata "fallback" that I
> was criticizing. The issue of "you're passing
> _PYTHON_SYSCONFIG_DATA_NAME regardless of whether Python was built
> before or not" was already present in your initial submission.

 With "initial submission", do you mean *my* initial submission (i.e. this patch
4/5 from v14), or Adam's initial submission which patched meson itself and which
was taken over from yocto? The latter did not actually change sysconfigdata at
all; instead it patched meson to not make use of the pkg_config_libdir that
comes out of sysconfigdata (which is I think the only thing from sysconfigdata
that is actually used by meson).

 I'll dive into the meson code again to see if I can find something better...

 Regards,
 Arnout
