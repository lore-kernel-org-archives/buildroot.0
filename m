From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 11:38:46 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add test of BR2_CCACHE
 with an external toolchain
In-Reply-To: <59698709710e0_a573fd7a88dac88568f3@ultri3.mail>
References: <20170710204007.8402-2-arnout@mind.be>
 <59698709710e0_a573fd7a88dac88568f3@ultri3.mail>
Message-ID: <2bb2847d-c094-2319-5de2-9ea540acf8bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-07-17 05:07, Ricardo Martincoski wrote:
> Hello,
> 
> On Mon, Jul 10, 2017 at 05:40 PM, Arnout Vandecappelle (Essensium/Mind) wrote:
> 
>> We reuse TestExternalToolchainBuildrootuClibc and add ccache to its
>> configuration.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [snip]
>> +        self.config = self.config + self.extraconfig.format(builddir = self.builddir)
> 
> 3 nits:
> - why not += ?

 Because config is initialized as a class member, and += would update the class
member instead of the instance member like we want. As it happens, this test is
executed last so it doesn't matter, but if any test comes after it, it would get
the extraconfig as well...

 Cfr. the following test:

In [49]: class Foo:
    ...:     foo = [0]
    ...:

In [50]: class Foo1(Foo):
    ...:     def __init__(self):
    ...:         self.foo += [1]
    ...:

In [51]: Foo1().foo
Out[51]: [0, 1]

In [52]: Foo1().foo
Out[52]: [0, 1, 1]

In [53]: class Foo2(Foo):
    ...:     def __init__(self):
    ...:         self.foo = self.foo + [2]
    ...:

In [54]: Foo2().foo
Out[54]: [0, 1, 1, 2]

In [55]: Foo2().foo
Out[55]: [0, 1, 1, 2]


> - usually there are no spaces around parameter equals
> - line is too long (not that much)

 I'll take care of these, and check it with flake8 while I'm at it.

> from these I suggest to change to:
>         self.config += self.extraconfig.format(builddir=self.builddir)
> 
>> +
>> -- 
> 
> nit: This empty line at end of file is not needed.

 Hm, I usually don't make that kind of mistake :-)

> 
> with the 4 nits fixed
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

 Can you confirm that this still stands if I don't do the +=, as long as the
line stays below 79 characters?


 Regards,
 Arnout

> 
> [the test passes, host-ccache is built either with or without ccache
>  pre-installed in the host machine, the ccache dir is created inside the
>  builddir and has valid data inside:
>  $ cd ${builddir} && host/bin/ccache -s
>  ...
>  cache size                          13.1 MB
>  max cache size                       5.0 GB]
> Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> Regards,
> Ricardo
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
