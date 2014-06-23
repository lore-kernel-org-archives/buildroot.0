From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 21:16:58 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix when $(O) is a relative
 path
In-Reply-To: <20140623170350.GB3400@free.fr>
References: <1403129424-27129-1-git-send-email-arnout@mind.be>
 <20140620205532.GA26745@free.fr> <53A7BB14.4060804@mind.be>
 <20140623170350.GB3400@free.fr>
Message-ID: <53A87D2A.50501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 19:03, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-06-23 07:28 +0200, Arnout Vandecappelle spake thusly:
>> On 20/06/14 22:55, Yann E. MORIN wrote:
>>> On 2014-06-19 00:10 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>>>> The graph-depends commands cd into the CONFIG_DIR and run the script
>>>> from there. However, this means that when $(O) is a relative path, it
>>>> will no longer be correct.  Therefore, use $(BASE_DIR) instead of $(O).
>>>>
>>>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>> I tried with thisscript, and did not notice any difference between the
>>> two runs, one with master, the second with the patch applied:
> [--SNIP long script--]
>>  First of all, for me all these cases succeed both with and without the patch.
> 
> You mean all the 6 cases do work for you? Weird.
> 
> I don't see how it can work, since calling this
>     make -C buildroot O=somewhere goal
> 
> will not have the --no-print-directory option, and thus make would print
> its usual "Entering/Leaving directory blabla" which confuses
> graph-depends.py

 Oh sorry, I didn't look at the output, just that it doesn't error out.


> 
> There is not much we can do about that, since our out-of-tree Makefile
> wrapper is never called.
> 
> Even worse, if you do
>     make -C buildroot O=somewhere defconfig
>     make -C somewhere graph-depends
> 
> then even though we do use our Makefile wrapper in this case, the
> --no-print-directory option is not used! So make would still print its
> "Entering/Leaving directory blabla" (and thus graph-depends will get
> confused.)

 So why don't we just add --no-print-directory to the recursive make invocation
from the script? Patch follows...


> 
>> Using any other combination of . and .. a $(O)
>> triggers the problem. So try
>>
>> do_prep br-7
>> make -C br-7 O=./br.build-7 defconfig
>> make -C br-7 O=./br.build-7 graph-depends

 This one I didn't actually run like this, but like:

make O=br.build-7 defconfig
make O=br.build-7 graph-depends

(from the buildroot directory). For that one, I checked that the PDF was OK, and
then I just wrote it with -C in the mail. Stupid of me.


 Regards,
 Arnout

> 
> OK, that's a use-case I was missing.
> 
>>  The graph-depends will fail with:
>>
>> tee: br.build-7/graphs/graph-depends.dot: No such file or directory
>> Getting targets
>> Getting dependencies for ['host-binutils', 'host-gmp', 'host-mpc', 'host-mpfr',
>> 'uclibc', 'host-fakeroot', 'host-gcc-final', 'host-makedevs',
>> 'toolchain-buildroot', 'toolchain', 'busybox', 'rootfs-tar']
>> Getting dependencies for ['host-m4', 'linux-headers', 'host-gcc-initial']
>> br.build-7/graphs/graph-depends.pdf: No such file or directory
>> Makefile:677: recipe for target 'graph-depends' failed
>> make: *** [graph-depends] Error 1
> 
> OK, it fails here, too, but your patch does not change anything: it
> fails without your patch, and it fails with your patch applied.
> 
> I'm using make-3.81, if that shall be a differentiator.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
