From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 12 Jul 2016 10:00:41 +0200
Subject: [Buildroot] perl XS modules
In-Reply-To: <20160708174043.3e1b7d11@free-electrons.com>
References: <20160708095910.621ad48a@gmail.com>
 <20160708174043.3e1b7d11@free-electrons.com>
Message-ID: <CAGhdn55xFz6+4f46w3OLMwqUGvGv-mVgDLQzg8o07vWMcRQ3Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR package libxml-parser-perl is a very specific host package which
works only with the the system perl.
(The reason is : this packge is heavy used, and we don't want the cost|time
of the host-perl build)

All Perl modules (XS or Pure Perl) use the naming scheme :
perl-module-name.
For example, the wrapper for libxml2 is perl-xml-libxml.
All these packages use the BR infrastructure perl-package.

If you want a target package perl-xml-parser (XML expat wrapper), start by
running:
   $ support/script/scancpan XML-Parser
which creates a decent template.
After add manually, the specific part required by the expat C library.
(And obviously, read
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_perl_cpan_packages
)

Fran?ois

2016-07-08 17:40 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> Fran?ois, could you have a look at the below question, that is Perl and
> cross-compilation related?
>
> Thanks!
>
> Thomas
>
> On Fri, 8 Jul 2016 09:59:10 +0200, Arne Caspari wrote:
> > Hi all,
> >
> > I try to build the libxml-parser-perl package for an ARM target.
> > Unfortunately the compiled perl module fails to load with the following
> > error message:
> >
> > loadable library and perl binaries are mismatched
> >
> > After some digging I found that the module needs to be compiled with
> > the same toolchain and compiler defines as the perl binary in order to
> > be ABI compatible. Forcing the defines to be exactly the same as the
> > ones used for the perl binary did not fix the issue so I believe it
> > must be a problem with the toolchain.
> >
> > I get it right, buildroot builds the host-perl package with the GCC
> > installed on the build system. In my case this is GCC Version 6.1 while
> > the toolchain in buildroot uses 4.9.3. If I get the build procedure
> > right, the ABI for perl is then configured for the 6.1 toolchain while
> > module builds will use the toolchain provided by buildroot which is ABI
> > incompatible.
> >
> > Is there a way to make buildroot build an initial toolchain to build
> > the host packages with? Did anybody ever successfully build perlXS
> > modules?
> >
> > Thanks,
> >
> > /Arne
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160712/c5cd40bc/attachment.html>
