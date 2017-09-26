From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Sep 2017 14:18:56 +0200
Subject: [Buildroot] [PATCH 1/1] Refine the dependencies so that
 packages can be compiled in parallel.
In-Reply-To: <5DBA847110A28B46BBA17BE675F0C9B21818F2B0@cnshjmbx01>
References: <5DBA847110A28B46BBA17BE675F0C9B21818F2B0@cnshjmbx01>
Message-ID: <20170926121856.GA2903@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zhuliang Chu, All,

On 2017-09-20 14:31 +0000, Chu, Zhuliang (NSB - CN/Shanghai) spake thusly:
> support/scripts/parallel-build: Try to provide support for parallel
> compilation
> 
> Now we know that buildroot does not support parallel compilation.
> My colleagues and I in the process of working will be a lot of repetitive
> compilation of buildroot.
> A lot of time spent in the buildroot compiler, so I try to provide
> parallel compiler support.
> I added a target 'parallel-build' to the Makefile that will call the
> python script.

Although I see the reason you decided to go with an external python
script, I would prefer that we go with a solution that is entirely
implemented in the existing infrastructures.

Some people have started such an endeavour in the past (and you can find
their work on the mailing list; search for "top-level parallel build"),
simply building two or more packages at the same time is not so trivial.

First and foremost, we strive for reproducibility. Given a configuration
and the same build machine, two builds will give the same result (or so
we strive for it).

Second, the most dreaded cause for non repropducibility are optional,
hidden dependencies. In an ideal world, all dependencies should be
expresed in the .mk files. But in practice, this is not true. Currently,
this issue is side-stepped thanks to the build ordering: two packages
will always be built in the same order, so the optional dependency is
always met, or it never is. Top-level parallel build, by its very
nature, no longer guarantees the build ordering, and thus breaks
reproducibility.

Those kind of hidden dependencies are either headers, libraries, or
host tools alike.

The way to solve this is to guarantee that a package will only ever
"see" the staging and host directories for its explicitly specified
dependencies. This is what we call "per-package staging" (where staging
implies host as well).

Unless we can do that, we killed reproducibility.

Third, we want to maximise the CPU usage, while still keeping the total
job-level to an acceptable amount. It has to be noted that not all
packages support building in parallel. Those are using $(MAKE1) instead
of $(MAKE) in Buildroot.

So, if you want to maximise the CPU usage on (say) an 8-core system, you
will want to use up to 9 jobs; you don't want to use more, or you'd kill
useability of the system.

So if you decorelate (like your script does) the top-level and
per-package number of jobs, then either you do not make full use of your
system, or you overwhelm it with build jobs. You want to use a high
top-level number of jobs, to cover the case where only MAKE1 packages
get built (worst case), but you also want a high per-package number of
jobs, in case a single package gets built (worst case).

But in doing so, you will happen to build 9 packages in parallel, with
each package bulding up to 9 files in parallel, which is 91 jobs in
parallel (worst case). This is definitely no good.

So you want to have a single number of jobs, that is spread evenly
across all ready-to-build packages.

So, the only solution is to push for top-level parallel build to be
natively supported in Buildroot.

Yes, talk is cheap, show-me-the-code and what-not. Don't hold your
breath...

Regards,
Yann E. MORIN.

> in script parallel-build:
> the dependencies of all packages are parsed first and then stored in a dictionary, and then the packages that are not dependent are extracted from the dictionary, After successfully compiling, it will release the other packages that depend on these packages, this will run until the dictionary is empty.
> 
> In this script I also wrote a detailed note.
> 
> Signed-off-by: Zhuliang Chu <zhuliang.chu@nokia-sbell.com>
> ---
>  Makefile                       |   4 ++
>  support/scripts/parallel-build | 150 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 154 insertions(+)
>  create mode 100755 support/scripts/parallel-build
> 
> diff --git a/Makefile b/Makefile
> index 9b09589..a854760 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -785,6 +785,10 @@ show-targets:
>  .PHONY: show-build-order
>  show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
>  
> +.PHONY:parallel-build
> +parallel-build:dependencies
> +	$(TOPDIR)/support/scripts/parallel-build --jobs $(PARALLEL_JOBS) 
> +--packages $(PACKAGES)
> +
>  .PHONY: graph-build
>  graph-build: $(O)/build/build-time.log
>  	@install -d $(GRAPHS_DIR)
> diff --git a/support/scripts/parallel-build b/support/scripts/parallel-build new file mode 100755 index 0000000..562d114
> --- /dev/null
> +++ b/support/scripts/parallel-build
> @@ -0,0 +1,150 @@
> +#!/usr/bin/python
> +import sys
> +import subprocess
> +import argparse
> +from copy import deepcopy
> +import multiprocessing
> +import brpkgutil
> +
> +done_queue=multiprocessing.Queue()
> +extras=""
> +get_depends_func = brpkgutil.get_depends get_rdepends_func = 
> +brpkgutil.get_rdepends
> +
> +# get all dependencies of packages
> +def get_all_depends(pkgs):
> +  filtered_pkgs = []
> +  for pkg in pkgs:
> +    if pkg in filtered_pkgs:
> +      continue
> +    filtered_pkgs.append(pkg)
> +  if len(filtered_pkgs) == 0:
> +    return []
> +  return get_depends_func(filtered_pkgs)
> +
> +# select someone which is in dictionary`s values but isn`t in keys.
> +def pickup_nokey_pkg(depends):
> +  nokey_deps = []
> +  alldeps=[]
> +  for deps in depends.values():
> +    alldeps.extend(deps)
> +  alldeps=list(set(alldeps))
> +  for dep in alldeps:
> +    if not depends.has_key(dep):
> +      nokey_deps.append(dep)
> +  return nokey_deps
> +
> +# select some packages that have no dependencies def 
> +pickup_nodepends_pkgs(depends):
> +  no_deps_pkgs = []
> +  for pkg,deps in depends.items():
> +    if deps == []:
> +      no_deps_pkgs.append(pkg)
> +  return no_deps_pkgs
> +
> +# when a package has been compiled successfully, then remove it from dictionary 'dependencies'
> +def remove_pkg_from_depends(package,depends):
> +  for pkg,deps in depends.items():
> +    if package == pkg:
> +      del depends[package]
> +    if package in deps:
> +      depends[pkg].remove(package)
> +  return depends
> +
> +# real build process
> +def make_build_pkg(package):
> +  cmd = "make %s %s"%(extras,package)
> +  p = 
> +subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subproces
> +s.STDOUT)
> +  (stdoutput,erroutput) = p.communicate()
> +  if stdoutput:
> +    sys.stdout.write(stdoutput)
> +  if erroutput:
> +    sys.stderr.write(erroutput)
> +  if p.returncode == 0:
> +    return package
> +  else:
> +    sys.stderr.write("make %s have a error,so the parallel build must exit %d\n"%(package,p.returncode))
> +    return '__error__'
> +
> +def callback(x):
> +  done_queue.put(x)
> +
> +if __name__ == '__main__':
> +
> +  # Running Scenario
> +  #
> +  #  step1:             step2:                  step3:                  step4:
> +  # 'packages'      'dependencies'             'processPool'           'Distribute'
> +  #                                              ____                 1) 'pkg0' has no dependencies in dictionary 'dependencies'
> +  #  pkg0                 pkg0                  |    |                2) Distribute 'pkg0' to child process from Pool
> +  #    |                 /    \                 |____|                3) 'pkg0' is successfully completed 
> +  #  pkg1              pkg1   pkg2              |    |                4) the function callback resume main process
> +  #    |              / |  \   |  \    ---------------------->        5) the main process remove 'pkg0' from dictionary 'dependencies'  
> +  #  pkg2            /  |   \  |   \            |    |                   and now the 'pkg1' and 'pkg2' have no dependencies 
> +  #    |          pkg3 pkg4  pkg5  pkg6         |____|                6) query the dictionary 'dependencies' and select 'pkg1' and 'pkg2'. goto 1)
> +  #  pkg3          /|\  /\     |    / \         |    | 
> +  #  .....       ...  ...  ... ... ... ....    ...  ...
> +  #
> +  
> +  # step1: Get all packages that will been compiled  parser = 
> + argparse.ArgumentParser(description="Parallel build")  
> + parser.add_argument("--packages", '-p', dest="packages",nargs='+',metavar="PACKAGE",
> +      help="all the packages to parallel compiled")  
> + parser.add_argument("--jobs", '-j', dest="jobs",metavar="JOB",
> +      help="all the packages to parallel compiled")  args = 
> + parser.parse_args()  packages=args.packages
> +  cur_jobs=int(args.jobs)
> +  max_jobs = len(packages)/2
> +  if not packages:
> +    sys.stderr.write("parallel build must have targets\n")
> +    sys.exit(1)
> +  
> +  # step2: Create the frame of all packages and dependencies which will 
> + be built  dependencies = get_all_depends(packages)  while packages:
> +    packages = pickup_nokey_pkg(dependencies)
> +    if packages:
> +      depends = get_all_depends(packages)
> +      dependencies.update(depends)
> +  
> +  # step3: Create a process pool for parallel compilation
> +  jobs=min(cur_jobs,max_jobs)
> +  pool = multiprocessing.Pool(processes=jobs)
> +  
> +  # step4: 
> +  #   1) Pick up some packages that have no dependencies from the dictionary 'dependencies'
> +  #   2) Distribute the packages that have been selected to the child process to compile
> +  #   3) When a child process is successfully completed , the function callback will be invoked. otherwise the main process will exit.
> +  #   4) The callback will triger main process to resume.
> +  #   5) The main process will remove the package that has been compiled by child process from the dictionary 'dependencies' 
> +  #      and then some other packages that depend on this package will be released.
> +  #   6) Continue to query the dictionary, and then get the package that has no dependencies util the dictionary dependencies is empty.
> +  allpending=[]
> +  while dependencies:
> +    # 1) pick up some packages  
> +    no_deps_pkgs = pickup_nodepends_pkgs(dependencies)
> +
> +    if not no_deps_pkgs:
> +      sys.stderr.write("parallel build must have targets\n")
> +      sys.exit(1)
> +    for pkg in no_deps_pkgs:
> +      if pkg in allpending:
> +        continue
> +      # 2) if one package have no dependencies or its dependencies have been built successfully before, then we can build it here 
> +      pool.apply_async(make_build_pkg, (pkg, ),callback=callback)
> +      allpending.append(pkg)
> +    while True:
> +      # 3,4) Wait for child process execution to end , if the child process has some errors, the main process will exit 
> +      pkg = done_queue.get()
> +      if pkg == '__error__':
> +        sys.stderr.write("An error occurred during compilation, so must exit\n")
> +        sys.exit(1)
> +      # 5) remove the package that has been compiled successfully and released some other packages
> +      dependencies=remove_pkg_from_depends(pkg,dependencies)
> +      if done_queue.empty():
> +        break
> +    # 6) Continue
> +
> +make_build_pkg("")
> +print "all builds is done"
> --
> 1.8.3.1
> 



-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
