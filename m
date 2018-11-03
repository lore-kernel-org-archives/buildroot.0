From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Nov 2018 14:53:48 +0100
Subject: [Buildroot] [PATCH 4/4] scripts/check-bin-arch: fix failure
 with bpf
In-Reply-To: <20181103142020.0d7e9005@windsurf>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <20181103122758.10578-4-fontaine.fabrice@gmail.com>
 <20181103142020.0d7e9005@windsurf>
Message-ID: <CAPi7W80r=y9NZseUxw31Mq_9nhPcRjK+AJrE_TbjvXUzGehnNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le sam. 3 nov. 2018 ? 14:20, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  3 Nov 2018 13:27:58 +0100, Fabrice Fontaine wrote:
> > Do not return an error if architecture is "Linux BPF" (in-kernel
> > bytecode machine)
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  support/scripts/check-bin-arch | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> > index 7f97696735..a0de7a6ac4 100755
> > --- a/support/scripts/check-bin-arch
> > +++ b/support/scripts/check-bin-arch
> > @@ -74,6 +74,11 @@ while read f; do
> >               continue
> >       fi
> >
> > +     # If architecture is Linux BPF (in-kernel bytecode machine), continue
> > +     if test "${arch}" = "Linux BPF" ; then
> > +             continue
> > +     fi
>
> In the build failure
> http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0/build-end.log
> that you point, the architecture is reported as "None", not as "Linux
> BPF". Am I misunderstanding something here ?
I wasn't able to reproduce this "None" architecture issue.
But I think it was "None" because the llvm/clang found on Peter's
machine was very old (3.8):
clang -idirafter /usr/local/include -idirafter
/usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
/usr/include/x86_64-linux-gnu -idirafter /usr/include
-I../../../include -target bpf -O2 -c grundig.c

With my patch's serie, I'm building a host-clang in version 7.0 that
supports BPF and in this case the architecture is correctly set to
"Linux BPF".
I tested with a clang in version 6.0 installed from Ubuntu 18.04
repositories on my host machine and it was also "Linux BPF".
>
> As a first step, could we explicitly disable building BPF protocols,
> before we merge the necessary LLVM/V4L logic to build these properly ?
Ok, I will do that.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
