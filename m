From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Sep 2017 16:51:12 +0200
Subject: [Buildroot] [PATCH 1/1] Refine the dependencies so that
 packages can be compiled in parallel.
In-Reply-To: <5DBA847110A28B46BBA17BE675F0C9B21818F2B0@cnshjmbx01>
References: <5DBA847110A28B46BBA17BE675F0C9B21818F2B0@cnshjmbx01>
Message-ID: <6dd130e8-7783-0a84-d6b5-ccf0ebda56c3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Zhuliang,

On 20-09-17 16:31, Chu, Zhuliang (NSB - CN/Shanghai) wrote:
> support/scripts/parallel-build: Try to provide support for parallel compilation
> 
> Now we know that buildroot does not support parallel compilation.
> My colleagues and I in the process of working will be a lot of repetitive compilation of buildroot.
> A lot of time spent in the buildroot compiler, so I try to provide parallel compiler support.
> I added a target 'parallel-build' to the Makefile that will call the python script.
> 
> in script parallel-build:
> the dependencies of all packages are parsed first and then stored in a dictionary, and then the packages that are not dependent are extracted from the dictionary, After successfully compiling, it will release the other packages that depend on these packages, this will run until the dictionary is empty.

 As far as I can see after a cursory look, this will do exactly the same as
'make -j' since it just takes into account the dependencies that are encoded in
Buildroot. Did you read lines 103-116 of the top-level Makefile?

# Parallel execution of this Makefile is disabled because it changes
# the packages building order, that can be a problem for two reasons:
# - If a package has an unspecified optional dependency and that
#   dependency is present when the package is built, it is used,
#   otherwise it isn't (but compilation happily proceeds) so the end
#   result will differ if the order is swapped due to parallel
#   building.
# - Also changing the building order can be a problem if two packages
#   manipulate the same file in the target directory.
#
# Taking into account the above considerations, if you still want to execute
# this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
# use the -j<jobs> option when building, e.g:
#      make -j$((`getconf _NPROCESSORS_ONLN`+1))

 This script is not addressing either of the problems mentioned there. And if
this script works for you, a vastly simpler and faster to instead rely on make -j.

 See also commit 1668e1da390c3320ed7bcf0377ba57ed2280b38d for details.

 Regards,
 Arnout

> 
> In this script I also wrote a detailed note.
> 
> Signed-off-by: Zhuliang Chu <zhuliang.chu@nokia-sbell.com>
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
