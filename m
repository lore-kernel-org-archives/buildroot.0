From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Sep 2015 09:55:32 +0300
Subject: [Buildroot] LD_LIBRARY_PATH variable
In-Reply-To: <CAJ2oMhLdM-ivbFsC-VSe-kLzkOXb94qiobRNSOf+wNzvDW1Bsg@mail.gmail.com>
References: <CAJ2oMh+nrOjF8VK0FmCj7KuL=29rF_vtqEO7A+99OTh5Ov00RQ@mail.gmail.com>
 <55F88835.3060403@mind.be>
 <CAJ2oMhLdM-ivbFsC-VSe-kLzkOXb94qiobRNSOf+wNzvDW1Bsg@mail.gmail.com>
Message-ID: <20150916065532.GB11632@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ran,

On Wed, Sep 16, 2015 at 08:45:54AM +0300, Ran Shalit wrote:
> > But specifically for fakeroot: that's just a script, and the path is 
> > hardcoded in it. Look in host/usr/bin/fakeroot.
> 
> That solved the issue for me !
> 
> But from where did fakeroot took this absolute path ?

fakeroot is just a shell script. It looks for libfakeroot.so in the 
directories listed in the $PATHS variable. See the $PATHS assignment in 
output/host/usr/bin/fakeroot.

baruch

> On Wed, Sep 16, 2015 at 12:05 AM, Arnout Vandecappelle <arnout@mind.be> 
>   wrote:
> > On 15-09-15 22:55, Ran Shalit wrote:
> >> Hello,
> >>
> >> I have some strange issue, in which I have to export LD_LIBRARY_PATH
> >> (.../output/host/usr/lib), otherwise the build fails on not ""cannot
> >> open shared object file: No such file or directory.... " during build
> >> (with the make command without any arguments).
> >> The strange thing is that I done it several times before without
> >> specifying the export command, so I really don't understand what
> >> happened in my host environment that requires this additional command.
> >>
> >> But now I get a new error during build:
> >> fakeroot: preload library `libfakeroot.so' not found, aborting.
> >>
> >> On checking I do see that it exist in .../output/host/usr/lib
> >> Is there any idea what's wrong ?
> >
> >  Have you moved your output directory to a different location? Everything that
> > is built for the host will look for shared libraries using an absolute path, so
> > if you move it to a different place, it will fail. There were some patches to
> > convert the absolute paths to relative paths using patchelf, but that was not
> > yet ready for committing.
> >
> >  But specifically for fakeroot: that's just a script, and the path is hardcoded
> > in it. Look in host/usr/bin/fakeroot.
> >
> >
> >  Regards,
> >  Arnout

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
