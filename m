From: Matthew Weber <Matthew.Weber@collins.com>
Date: Mon, 3 Dec 2018 22:02:06 -0600
Subject: [Buildroot] [PATCH 11/11] supprt/graph-depends: use the new
 make-based dependency tree
In-Reply-To: <176c21d13a1e9af82e4801e5b43ea86dead4f007.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
 <176c21d13a1e9af82e4801e5b43ea86dead4f007.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpZgap1hK8DdW5amBqoc_wVuDDxVf++m__YsXRp6MmGy2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Dec 2, 2018 at 3:05 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Now that we can get the whole dependency tree from make, use it to
> speed up things considerably.
>
> So far, we had three functions to get the dependencies information:
> get_depends(), get_rdepends(), and, somehow unrelated, get_version().
>
> Because of the way %-show-{,r}depends works, getting the dependency tree
> was expensive, the three functions all took a set of packages for which
> to get the dependencies, in an attempt to limit the time it took to get
> that tree.
>
> Now, getting the tree is much, much less costly, and we can get the
> whole tree as cheaply as we previously got only the first-level
> dependencies.
>
> Furthemore, we can now also get the version information at the same
> time, and that also brings in whether the package is virtual or not,
> target or host.
>
> So, we drop all three helper functions, and replace them with a single
> one that returns all that information in one go: full dependency tree,
> per-package type, and per-package version.
>
> Note: since commit 2d29fd96a (pkg-virtual: remove VERSION/SOURCE),
> virtual packages are no longer reported as having a 'virtual' version,
> so have since been displayed as regular packages in the graphs. Although
> noone complained, this patch incidentally restores the initial
> behaviour, and virtual packages are now correctly displayed as such
> again.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Wow that is quite a bit faster.  Very cool

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

>
> ---
> Note: as I rewrote brpkgutil.py almost entirely now, and as I also
> substantially modified graph-depends, I added my (C) to them. We don't
> usually have copyright information in our files (no .mk or no Config.in
> and such have that), so I think it would be OK to just drop the (C) in
> there as well, especially since the Berne convention does not require it
> for a work to be protected and recognised anyway:
>     https://en.wikipedia.org/wiki/Copyright_symbol
>
> Beside, the authorship information is already present in the git log,
> and it is much more accurate in there than it is in the files
> themselves.
> ---
>  support/scripts/brpkgutil.py  | 106 ++++++++++++++++++--------------------
>  support/scripts/graph-depends | 117 +++++-------------------------------------
>  2 files changed, 64 insertions(+), 159 deletions(-)
>
> diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
> index e70d525353..39e9c5ce7e 100644
> --- a/support/scripts/brpkgutil.py
> +++ b/support/scripts/brpkgutil.py
> @@ -1,67 +1,61 @@
>  # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +# Copyright (C) 2018 Yann E. MORIN <yann.morin.1998@free.fr>
>
>  import logging
>  import sys
> +import os
>  import subprocess
>
>
> -# Execute the "make <pkg>-show-version" command to get the version of a given
> -# list of packages, and return the version formatted as a Python dictionary.
> -def get_version(pkgs):
> -    logging.info("Getting version for %s" % pkgs)
> -    cmd = ["make", "-s", "--no-print-directory"]
> -    for pkg in pkgs:
> -        cmd.append("%s-show-version" % pkg)
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
> -    output = p.communicate()[0]
> -    if p.returncode != 0:
> -        logging.error("Error getting version %s" % pkgs)
> -        sys.exit(1)
> -    output = output.split("\n")
> -    if len(output) != len(pkgs) + 1:
> -        logging.error("Error getting version")
> -        sys.exit(1)
> -    version = {}
> -    for i in range(0, len(pkgs)):
> -        pkg = pkgs[i]
> -        version[pkg] = output[i]
> -    return version
> +# This function returns a tuple of three dictionaries, all using package
> +# names as keys:
> +# - a dictionary which values are the lists of packages that are the
> +#   dependencies of the package used as key;
> +# - a dictionary which values are the type of the package used as key;
> +# - a dictionary which values are the version of the package used as key,
> +#   'virtual' for a virtual package, or the empty string for a rootfs.
> +#
> +# 'direction' can be either 'direct' or 'forward' to get the direct (aka
> +# forward) dependencies, or 'back' or 'reverse' to get the reverse (aka
> +# backward) dependencies.
> +def get_dependency_tree(direction="direct"):
> +    logging.info("Getting dependency tree...")
>
> -
> -def _get_depends(pkgs, rule):
> -    logging.info("Getting dependencies for %s" % pkgs)
> -    cmd = ["make", "-s", "--no-print-directory"]
> -    for pkg in pkgs:
> -        cmd.append("%s-%s" % (pkg, rule))
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
> -    output = p.communicate()[0]
> -    if p.returncode != 0:
> -        logging.error("Error getting dependencies %s\n" % pkgs)
> -        sys.exit(1)
> -    output = output.split("\n")
> -    if len(output) != len(pkgs) + 1:
> -        logging.error("Error getting dependencies")
> -        sys.exit(1)
>      deps = {}
> -    for i in range(0, len(pkgs)):
> -        pkg = pkgs[i]
> -        pkg_deps = output[i].split(" ")
> -        if pkg_deps == ['']:
> -            deps[pkg] = []
> +    types = {}
> +    versions = {}
> +
> +    # Special case for the 'all' top-level fake package
> +    deps['all'] = []
> +    types['all'] = 'target'
> +    versions['all'] = ''
> +
> +    cmd = ["make", "-s", "--no-print-directory", "show-dependency-tree"]
> +    with open(os.devnull, 'wb') as devnull:
> +        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull, universal_newlines=True)
> +        output = p.communicate()[0]
> +
> +    for l in output.splitlines():
> +        if " -> " in l:
> +            pkg = l.split(" -> ")[0]
> +            if direction == "forward" or direction == "direct":
> +                try:
> +                    deps[pkg] += l.split(" -> ")[1].split()
> +                except KeyError:
> +                    deps[pkg] = l.split(" -> ")[1].split()
> +            elif direction == "back" or direction == "reverse":
> +                for p in l.split(" -> ")[1].split():
> +                    try:
> +                        deps[p].append(pkg)
> +                    except KeyError:
> +                        deps[p] = [pkg]
> +            else:
> +                raise ValueError('direction must be one of: direct, forward, reverse, back')
>          else:
> -            deps[pkg] = pkg_deps
> -    return deps
> +            pkg, type_version = l.split(": ", 1)
> +            t, v = "{} -".format(type_version).split(None, 2)[:2]
> +            deps['all'].append(pkg)
> +            types[pkg] = t
> +            versions[pkg] = v
>
> -
> -# Execute the "make <pkg>-show-depends" command to get the list of
> -# dependencies of a given list of packages, and return the list of
> -# dependencies formatted as a Python dictionary.
> -def get_depends(pkgs):
> -    return _get_depends(pkgs, 'show-depends')
> -
> -
> -# Execute the "make <pkg>-show-rdepends" command to get the list of
> -# reverse dependencies of a given list of packages, and return the
> -# list of dependencies formatted as a Python dictionary.
> -def get_rdepends(pkgs):
> -    return _get_depends(pkgs, 'show-rdepends')
> +    return (deps, types, versions)
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 29134c8237..139a5dee80 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -20,10 +20,10 @@
>  #    configuration.
>  #
>  # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +# Copyright (C) 2018 Yann E. MORIN <yann.morin.1998@free.fr>
>
>  import logging
>  import sys
> -import subprocess
>  import argparse
>  from fnmatch import fnmatch
>
> @@ -36,63 +36,6 @@ MODE_PKG = 2    # draw dependency graph for a given package
>  allpkgs = []
>
>
> -# Execute the "make show-targets" command to get the list of the main
> -# Buildroot PACKAGES and return it formatted as a Python list. This
> -# list is used as the starting point for full dependency graphs
> -def get_targets():
> -    logging.info("Getting targets")
> -    cmd = ["make", "-s", "--no-print-directory", "show-targets"]
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
> -    output = p.communicate()[0].strip()
> -    if p.returncode != 0:
> -        return None
> -    if output == '':
> -        return []
> -    return output.split(' ')
> -
> -
> -# Recursive function that builds the tree of dependencies for a given
> -# list of packages. The dependencies are built in a list called
> -# 'dependencies', which contains tuples of the form (pkg1 ->
> -# pkg2_on_which_pkg1_depends, pkg3 -> pkg4_on_which_pkg3_depends) and
> -# the function finally returns this list.
> -def get_all_depends(pkgs, get_depends_func):
> -    dependencies = []
> -
> -    # Filter the packages for which we already have the dependencies
> -    filtered_pkgs = []
> -    for pkg in pkgs:
> -        if pkg in allpkgs:
> -            continue
> -        filtered_pkgs.append(pkg)
> -        allpkgs.append(pkg)
> -
> -    if len(filtered_pkgs) == 0:
> -        return []
> -
> -    depends = get_depends_func(filtered_pkgs)
> -
> -    deps = set()
> -    for pkg in filtered_pkgs:
> -        pkg_deps = depends[pkg]
> -
> -        # This package has no dependency.
> -        if pkg_deps == []:
> -            continue
> -
> -        # Add dependencies to the list of dependencies
> -        for dep in pkg_deps:
> -            dependencies.append((pkg, dep))
> -            deps.add(dep)
> -
> -    if len(deps) != 0:
> -        newdeps = get_all_depends(deps, get_depends_func)
> -        if newdeps is not None:
> -            dependencies += newdeps
> -
> -    return dependencies
> -
> -
>  # The Graphviz "dot" utility doesn't like dashes in node names. So for
>  # node names, we strip all dashes. Also, nodes can't start with a number,
>  # so we prepend an underscore.
> @@ -230,7 +173,7 @@ def remove_extra_deps(deps, rootpkg, transitive):
>
>
>  # Print the attributes of a node: label and fill-color
> -def print_attrs(outfile, pkg, version, depth, colors):
> +def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
>      name = pkg_node_name(pkg)
>      if pkg == 'all':
>          label = 'ALL'
> @@ -239,13 +182,11 @@ def print_attrs(outfile, pkg, version, depth, colors):
>      if depth == 0:
>          color = colors[0]
>      else:
> -        if pkg.startswith('host') \
> -                or pkg.startswith('toolchain') \
> -                or pkg.startswith('rootfs'):
> +        if pkg_type == "host":
>              color = colors[2]
>          else:
>              color = colors[1]
> -    if version == "virtual":
> +    if pkg_version == "virtual":
>          outfile.write("%s [label = <<I>%s</I>>]\n" % (name, label))
>      else:
>          outfile.write("%s [label = \"%s\"]\n" % (name, label))
> @@ -256,13 +197,13 @@ done_deps = []
>
>
>  # Print the dependency graph of a package
> -def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
> +def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
>                     arrow_dir, draw_graph, depth, max_depth, pkg, colors):
>      if pkg in done_deps:
>          return
>      done_deps.append(pkg)
>      if draw_graph:
> -        print_attrs(outfile, pkg, dict_version.get(pkg), depth, colors)
> +        print_attrs(outfile, pkg, dict_types[pkg], dict_versions[pkg], depth, colors)
>      elif depth != 0:
>          outfile.write("%s " % pkg)
>      if pkg not in dict_deps:
> @@ -270,17 +211,15 @@ def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
>      for p in stop_list:
>          if fnmatch(pkg, p):
>              return
> -    if dict_version.get(pkg) == "virtual" and "virtual" in stop_list:
> +    if dict_versions[pkg] == "virtual" and "virtual" in stop_list:
>          return
> -    if pkg.startswith("host-") and "host" in stop_list:
> +    if dict_types[pkg] == "host" and "host" in stop_list:
>          return
>      if max_depth == 0 or depth < max_depth:
>          for d in dict_deps[pkg]:
> -            if dict_version.get(d) == "virtual" \
> -               and "virtual" in exclude_list:
> +            if dict_versions[d] == "virtual" and "virtual" in exclude_list:
>                  continue
> -            if d.startswith("host-") \
> -               and "host" in exclude_list:
> +            if dict_types[d] == "host" and "host" in exclude_list:
>                  continue
>              add = True
>              for p in exclude_list:
> @@ -290,7 +229,7 @@ def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
>              if add:
>                  if draw_graph:
>                      outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
> -                print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
> +                print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
>                                 arrow_dir, draw_graph, depth + 1, max_depth, d, colors)
>
>
> @@ -352,6 +291,7 @@ def main():
>
>      if args.package is None:
>          mode = MODE_FULL
> +        rootpkg = 'all'
>      else:
>          mode = MODE_PKG
>          rootpkg = args.package
> @@ -370,13 +310,11 @@ def main():
>          exclude_list += MANDATORY_DEPS
>
>      if args.direct:
> -        get_depends_func = brpkgutil.get_depends
>          arrow_dir = "forward"
>      else:
>          if mode == MODE_FULL:
>              logging.error("--reverse needs a package")
>              sys.exit(1)
> -        get_depends_func = brpkgutil.get_rdepends
>          arrow_dir = "back"
>
>      draw_graph = not args.flat_list
> @@ -389,46 +327,19 @@ def main():
>          logging.error("Error: incorrect color list '%s'" % args.colors)
>          sys.exit(1)
>
> -    # In full mode, start with the result of get_targets() to get the main
> -    # targets and then use get_all_depends() for all targets
> -    if mode == MODE_FULL:
> -        targets = get_targets()
> -        dependencies = []
> -        allpkgs.append('all')
> -        filtered_targets = []
> -        for tg in targets:
> -            dependencies.append(('all', tg))
> -            filtered_targets.append(tg)
> -        deps = get_all_depends(filtered_targets, get_depends_func)
> -        if deps is not None:
> -            dependencies += deps
> -        rootpkg = 'all'
> -
> -    # In pkg mode, start directly with get_all_depends() on the requested
> -    # package
> -    elif mode == MODE_PKG:
> -        dependencies = get_all_depends([rootpkg], get_depends_func)
> -
> -    # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
> -    dict_deps = {}
> -    for dep in dependencies:
> -        if dep[0] not in dict_deps:
> -            dict_deps[dep[0]] = []
> -        dict_deps[dep[0]].append(dep[1])
> +    dict_deps, dict_types, dict_versions = brpkgutil.get_dependency_tree(arrow_dir)
>
>      check_circular_deps(dict_deps)
>      if check_only:
>          sys.exit(0)
>
>      dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive)
> -    dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
> -                                          if pkg != "all" and not pkg.startswith("root")])
>
>      # Start printing the graph data
>      if draw_graph:
>          outfile.write("digraph G {\n")
>
> -    print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
> +    print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
>                     arrow_dir, draw_graph, 0, args.depth, rootpkg, colors)
>
>      if draw_graph:
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
