From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 22:56:00 +0200
Subject: [Buildroot] [PATCH 1/3 v2] package/opengl-registry: new package
In-Reply-To: <20141005190829.6253c2ca@free-electrons.com>
References: <cover.1411334346.git.yann.morin.1998@free.fr>
 <6c5dbcd315ecd266891ca9932c47c5e5f86eaf9b.1411334346.git.yann.morin.1998@free.fr>
 <20141005184708.128aa15e@free-electrons.com>
 <20141005165741.GN4220@free.fr>
 <20141005190829.6253c2ca@free-electrons.com>
Message-ID: <20141005205600.GO4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-05 19:08 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sun, 5 Oct 2014 18:57:41 +0200, Yann E. MORIN wrote:
> 
> > > > We use the last svn revision at which the api directory was *changed*,
> > > > not the revision the repository is currently at.
> > > 
> > > Why does this matter?
> > 
> > It does not matter. It is just a note that the revision used might be
> > different than the current revision in the SVN tree, because the tree
> > contains many other things than the registry, some of which are not even
> > public.
> 
> Hum, ok. I found it a bit weird.

OK, I rephrased that, and moved it after the --- line.

[--SNIP--]
> > > Do we know why this gl.h is not part of the upstream opengl-registry?
> > 
> > No, I have no idea.
> 
> Do you know if there's some sort of upstream to which we could report
> what looks like a "bug" ?

No idea. I'll look on their website. What 'bug' would you want to
report? Missing gl.h?

> I was wondering what other distributions do, and seems like Ubuntu is
> also adding all those headers through a big patch.

Yes, and that's also what the NVidia binary blob suggest. They even have
their own gl.h, but they say it is incomplete, and the one from the
distribution should be used.

I choose to do what others did, and pick one of the gl.h headers. The
one from mesa3d is as good as any other...

> > > > +	  This package installs the openGL header files. You do not need them
> > > > +	  if the OpenGL/EGL/GLES implementation provides its own headers.
> > > > +	  Currently, the only known implementation requiring OpenGL Resgistry
> > > > +	  is the NVidia proprietary driver.
> > > > +
> > > > +	  https://www.opengl.org/registry/
> > > 
> > > Should we foresee any problem if an OpenGL implementation providing its
> > > own header files (e.g rpi-userland, gpu-imx, etc.) gets selected in
> > > addition to this package? They will overwrite each other files, no?
> > 
> > Hmm.. I think I thought about that when I did the patch, I can't
> > remember what I came up with as a conclusion. Lemme think about it once
> > again...
> 
> For safety, should we ensure this package only gets selected together
> with the NVidia driver? Don't know exactly since we can't have A
> depends on B, and B select A. Make opengl-registry a blind option, so
> that people cannot select it, and even autobuilders will not select it,
> except as a dependency of the NVidia driver package.

I've made opengl-registry a prompt-less package, that nvidia-driver
selects. Others may do so if they need to.

> > > Why not simply use a patch instead of this awk magic? We generally use
> > > patches when possible. In this case, you're patching only one file, so
> > > clearly a patch seems to make sense here, no?
> > 
> > Because it is done after the build, and changs a generated file.
> 
> Aaah, yes, indeed. I guess the generation logic is too complicated to
> be patched. So, we'll have to keep the awk magic. Maybe add a short
> comment that mentions that it's done after the headers have been
> generated.
> 
> Also, this is using some Python script to generate the headers. Is this
> Python script only using the Python standard library for XML, or is it
> using some external Python library that will cause troubles in terms of
> Buildroot "core" dependencies?

Indeed, it is using lxml, which is an external Python module. I've added
that new package to the series, and made opengl-registry depend on it
and on host-python.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
