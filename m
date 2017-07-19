From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 18 Jul 2017 23:02:26 -0300
Subject: [Buildroot] [PATCH 2/2] support/testing: add test of BR2_CCACHE
 with an external toolchain
References: <2bb2847d-c094-2319-5de2-9ea540acf8bf@mind.be>
Message-ID: <596ebdb223c47_3a713fbb44b45304469cb@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jul 18, 2017 at 06:38 AM, Arnout Vandecappelle wrote:

> On 15-07-17 05:07, Ricardo Martincoski wrote:
>> [snip]
>>> +        self.config = self.config + self.extraconfig.format(builddir = self.builddir)
>> 
>> 3 nits:
>> - why not += ?
> 
>  Because config is initialized as a class member, and += would update the class
> member instead of the instance member like we want. As it happens, this test is
> executed last so it doesn't matter, but if any test comes after it, it would get

From command line there is no guarantee on execution order when using -t.

In my tests without -t I observe the testcases being executed in a case
insensitive reverse alphabetical order, no matter if I move one test to another
place in the file.

$ support/testing/run-tests -d d -o o -k tests.toolchain.test_external
22:32:39 TestExternalToolchainSourceryArmv7       Starting
22:32:43 TestExternalToolchainSourceryArmv7       Cleaning up
.22:32:43 TestExternalToolchainSourceryArmv5       Starting
22:32:49 TestExternalToolchainSourceryArmv5       Cleaning up
.22:32:49 TestExternalToolchainSourceryArmv4       Starting
22:32:54 TestExternalToolchainSourceryArmv4       Cleaning up
.22:32:54 TestExternalToolchainLinaroArm           Starting
22:32:58 TestExternalToolchainLinaroArm           Cleaning up
.22:32:58 TestExternalToolchainCtngMusl            Starting
22:33:01 TestExternalToolchainCtngMusl            Cleaning up
.22:33:01 TestExternalToolchainCCache              Starting
22:33:04 TestExternalToolchainCCache              Cleaning up
.22:33:04 TestExternalToolchainBuildrootuClibc     Starting
22:33:08 TestExternalToolchainBuildrootuClibc     Cleaning up
.22:33:08 TestExternalToolchainBuildrootMusl       Starting
22:33:11 TestExternalToolchainBuildrootMusl       Cleaning up
.

But I guess you are talking about gitlab. I never used it.

> the extraconfig as well...
> 
>  Cfr. the following test:
> 
> In [49]: class Foo:
>     ...:     foo = [0]
>     ...:
> 
> In [50]: class Foo1(Foo):
>     ...:     def __init__(self):
>     ...:         self.foo += [1]
>     ...:
> 
> In [51]: Foo1().foo
> Out[51]: [0, 1]
> 
> In [52]: Foo1().foo
> Out[52]: [0, 1, 1]
> 
> In [53]: class Foo2(Foo):
>     ...:     def __init__(self):
>     ...:         self.foo = self.foo + [2]
>     ...:
> 
> In [54]: Foo2().foo
> Out[54]: [0, 1, 1, 2]
> 
> In [55]: Foo2().foo
> Out[55]: [0, 1, 1, 2]

The same does not apply to strings, only to mutable objects.

But if i.e. for some reason we change the type of config from string to an array
of lines the += would need to be changed, while your code would still work.

[snip]
>> with the 4 nits fixed
>> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
>  Can you confirm that this still stands if I don't do the +=, as long as the
> line stays below 79 characters?

Sure. It still stands without += .

Regards,
Ricardo
