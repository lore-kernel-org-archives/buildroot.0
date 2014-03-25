From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Mar 2014 22:03:51 +0100
Subject: [Buildroot] [RFC 0/3] Speeding up the Makefile parsing
In-Reply-To: <20140323215728.081c2c90@skate>
References: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <874n2oveed.fsf@dell.be.48ers.dk> <20140323215728.081c2c90@skate>
Message-ID: <5331EF37.6010700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

On 23/03/14 21:57, Thomas Petazzoni wrote:
> Dear Peter Korsgaard,
> 
> On Sun, 23 Mar 2014 21:38:50 +0100, Peter Korsgaard wrote:
>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>>
>>  > Hello,
>>  > The current strategy of Buildroot with regard to .mk files is to
>>  > always include all of them. However, with an ever-increasing number of
>>  > packages, the number of .mk files to parse is growing significantly,
>>  > and this makes the execution of any trivial make target take at least
>>  > 12 seconds on a relatively fast SSD equipped laptop. For example, a
>>  > simple thing like "make help" or "make external-deps" takes 12 seconds
>>  > solely because of the parsing time of more than a thousand of package
>>  > makefiles.
>>
>> .. and how fast is it after this series?
> 
> Before the series:
> 
> $ time make help
> [...]
> real	0m15.760s
> user	0m14.818s
> sys	0m0.969s
> 
> After the series:
> 
> $ time make help
> [...]
> real	0m1.209s
> user	0m0.807s
> sys	0m0.416s


 I was at first a bit wary of your proposed approach, as I would have
preferred to still include all .mk files and instead optimise the
implementation of generic-package. However, I did some further
experiments with

make -qp > /dev/null

on a reasonable-sized .config (make -qp is what is used by bash
completion so is very relevant IMHO).

Before the series:
$ time make -qp > /dev/null
make: *** [_all] Error 1

real    0m3.452s
user    0m2.980s
sys     0m0.092s

After the series:
$ time make -qp > /dev/null
make: *** [_all] Error 1

real    0m0.389s
user    0m0.280s
sys     0m0.004s

Upper bound of generic-package optimisation (just define *-package macros
as empty):
$ time make -qp > /dev/null
make: *** [_all] Error 1

real    0m1.234s
user    0m0.872s
sys     0m0.064s


 And on my allpackageyesconfig, there is even a tiny speedup (due to the
twenty-ish packages that are not included):
Before:
$ time make -qp > /dev/null
make: *** [_all] Error 1

real    0m3.325s
user    0m3.044s
sys     0m0.116s

After:
$ time make -qp > /dev/null
make: *** [_all] Error 1

real    0m3.040s
user    0m2.792s
sys     0m0.096s


 With those kind of results, the approach you propose really seems the
way to go.


>>  > The proposed RFC solution is to look at the BR2_PACKAGE_<foo>
>>  > variables, and from them derive the name of the package .mk files to
>>  > be included. It is a simple change in the main Makefile, but it has
>>  > two major consequences that we need to discuss on whether they are
>>  > acceptable or not:
>>
>>  >  * We need to have BR2_PACKAGE_HOST_<foo> options for *all* host
>>  >    packages. Of course, the vast majority of them can be blind
>>  >    options, but it means that we have to ensure all the host packages
>>  >    are properly selected at the Config.in level. That's a fairly
>>  >    significant change.
>>
>> I don't think this is too bad. Maybe we could look into generating the
>> _DEPENDENCIES line from depends/select statements in the Config.in
>> automatically, then we only need to explicitly handle the optional
>> dependencies in the .mk file (or decide to also handle them in Kconfig
>> if possible).

 Actually, we could generate the Config.in from the .mk file (like
OpenWRT does). Probably easier than the reverse.


> 
> Why not, but doing this would require a pre-processing step to process
> the Config.in file and generates the makefile dependencies from it.
> Also, having the mandatory dependencies handled automatically but not
> the optional dependencies seems a bit weird, no?

 I think that Peter meant that the _DEPENDENCIES variable would be
defined by some make function magic, not that a .mk file is generated.
Something like:

_DEPENDENCIES = $(call LOWERCASE,$(shell \
  sed -n '/.*select BR2_PACKAGE_\([A-Z0-9_]*\).*/s//\1/p' $(pkgdir)))


> 
> That being said, doing for host packages what we do today for target
> packages doesn't that horrible, especially since we don't have all the
> crazy dependencies on toolchain options that are complicated to handle
> for target packages.

 Right.

 There are anyway a number of other reasons why it would be nice to have
blind options for the host packages.

* Facilitate package check script.

* Remove the hacks to generate *-source target.

* Probably others.


> 
>>  >  * Since the logic assume that BR2_PACKAGE_FOO is always
>>  >    package/foo/foo.mk, it means we have to 1/ guarantee that the
>>  >    package option name matches the package file name, and 2/ guarantee
>>  >    that we don't use any sub-directories to store packages.
>>
>> The 2nd part is more serious as we use subdirs today to group related
>> packages and have supported them "forever". We also used to tell people
>> (before BR2_EXTERNAL) to put their own packages under package/<company>.
>>
>> I guess playing tricks with $(wildcard) to find the .mk file is going to
>> add quite some performance overhead.
> 
> Yes. This part is more problematic, and I don't have a good solution
> for it.

 We can require that packages in subdirs have a corresponding option for
the directory, cfr. BR2_PACKAGE_XORG7 (which would mean that the
directory has to be renamed). In some cases this could be a blind option
that is enabled any time that one of its packages is enabled (e.g. for
the freescale-imx stuff), in some cases there already happens to be a
package with that name (e.g. gstreamer). gstreamer doesn't even have to
be modified for it to work. It does mean that a few more .mk files will
be included than strictly necessary, but I don't think that's a worry.
For xorg7, we could still apply the same pattern in package/xorg7/xorg7.mk


 Bottom line: I'd like to see this series!


 Regards,
 Arnout



> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
