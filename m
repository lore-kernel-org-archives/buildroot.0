From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 24 Oct 2019 09:22:08 -0700
Subject: [Buildroot] [PATCH v14 4/5] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <bc16617b-8c0a-c915-ea7b-b7733f6068af@mind.be>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-5-aduskett@gmail.com>
 <20191022225920.7e35e42e@windsurf>
 <b3699991-75ec-157a-0a4f-913a7a1d83f8@mind.be>
 <99a57ce9-4573-87c9-d978-f14e7fa00dba@mind.be>
 <CAFSsvmowGKsba5LaD5S6xXbK0uL2kVYCvNbh9vN9-Mnu2=LFzA@mail.gmail.com>
 <20191023225038.55ee5c3e@windsurf>
 <a17f32d5-a3bc-d656-3100-75da89e6d236@mind.be>
 <bc16617b-8c0a-c915-ea7b-b7733f6068af@mind.be>
Message-ID: <CAFSsvmqFvc-GOyg-EMXv=-btBrxicsXbZWc6UJqFozZ5o=M-9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This might be a good solution, but it is beyond my skillset to
implement it properly.

If the rest of the series looks good, perhaps we could come up with a
solution during the developer conference and them
implement GOI?

Regards;
Adam

On Wed, Oct 23, 2019 at 2:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 23/10/2019 23:03, Arnout Vandecappelle wrote:
> >
> >
> > On 23/10/2019 22:50, Thomas Petazzoni wrote:
> >> On Wed, 23 Oct 2019 13:42:54 -0700
> >> Adam Duskett <aduskett@gmail.com> wrote:
> >>
> >>>>  Adam, could you test if this works better?
> >>>>
> >>>> +       $$(if
> >>>> $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME)")
> >>>> \
> >>> $$(if $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)"
> >>> Also does not work, because the target python3 may not yet be built.
> >
> >  Ugh indeed, another side effect of this environment being used for both "host"
> > python and "cross" python...
> >
> >  I'm starting to think this is not such a good solution after all...
> >
> >
> >> But that is totally unrelated to the _sysconfigdata "fallback" that I
> >> was criticizing. The issue of "you're passing
> >> _PYTHON_SYSCONFIG_DATA_NAME regardless of whether Python was built
> >> before or not" was already present in your initial submission.
> >
> >  With "initial submission", do you mean *my* initial submission (i.e. this patch
> > 4/5 from v14), or Adam's initial submission which patched meson itself and which
> > was taken over from yocto? The latter did not actually change sysconfigdata at
> > all; instead it patched meson to not make use of the pkg_config_libdir that
> > comes out of sysconfigdata (which is I think the only thing from sysconfigdata
> > that is actually used by meson).
> >
> >  I'll dive into the meson code again to see if I can find something better...
>
>  OK, I *think* I've come up with an alternative (but I'm sure as hell not going
> to implement it :-).
>
>
>  Essentially, it's the same issue as for pkg-config: we should distinguish
> between the host version and the cross version (i.e. executable that can run on
> the host but that returns results for the target). Meson is very explicit about
> such a distinction, so anything pertaining to cross-compilation should be passed
> through cross-compilation.conf instead of in the environment.
>
>  As far as I can see in the source code, we can in fact set a
> "cross-compilation" python in the [binaries] section. So, we could create a
> python wrapper that sets those environment variables, and point to that python
> wrapper in the cross-compilation.conf.
>
>  And of course, we can use the same approach in pkg-python.mk: set
> $(2)_PYTHON_INTERPRETER to the python wrapper instead of $(HOST_DIR)/bin/python.
>
>
>  Regards,
>  Arnout
