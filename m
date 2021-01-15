From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Jan 2021 11:55:22 +0100
Subject: [Buildroot] [PATCH 2/2] utils/source-check: new script
In-Reply-To: <20210102225612.GJ2997@scaer>
References: <20201204123313.14455-1-patrickdepinguin@gmail.com>
 <20201204123313.14455-2-patrickdepinguin@gmail.com>
 <20210102225612.GJ2997@scaer>
Message-ID: <CAAXf6LU4SvmU9No0bm9vyP5uD7K1fPFiaBreJqha+P+ufQYpYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b, 2 ene 2021 a las 23:56, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2020-12-04 13:33 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > This source-check script is a replacement for 'make source-check' that
> > existed in earlier versions of Buildroot.
> >
> > It takes as input a list of defconfigs,
>
> Make that work on the current configured directory. I.e. it should
> require a .config file to be already present.
>
> Scanning for multiple defconfigs should be left as an exercise to the
> interested parties (e.g. a job in a CI system, I believe).
>
> e.g.;
>
>     for cfg in configs/*_defconfig; do
>         make ${cfg#*/}
>         ./utils/source-check || { printf 'Failed: %s\n' "${cfg#*/}"; break; }
>     done
>

The method you propose is much less efficient, as it would check each
common package N times.
In fact, this was roughly what I was doing previously with the 'old'
source-check that I proposed.
The current approach, combining all defconfigs in one go, is way
faster, because it first creates a unique list of all URLs to be
checked, and then checks each of them exactly once. This is
particularly relevent when you have many defconfigs to check,
typically in some corporate environments.

[..]
> > +
> > +    for pkg in info:
> > +        if 'downloads' not in info[pkg]:
> > +            sys.stderr.write("Warning: %s: no downloads for package '%s'\n" % (defconfig, pkg))
> > +            continue
> > +        if not info[pkg]['downloads']:
> > +            sys.stderr.write("Warning: %s: empty downloads for package '%s'\n" % (defconfig, pkg))
> > +            continue
>
> Does that relayy warrant a warning? virtual packages have no download
> key; some system-level packages (skeletons, mkpasswd et al.) have a
> download key, but the dictionnary is empty. Having spurious warnings is
> the best way for people to simply ignore them...

Perhaps it is too much; I added it to help me in finding potential
issues in scanning the packages.

>
> > +        for download in info[pkg]['downloads']:
> > +            if 'source' not in download:
> > +                sys.stderr.write("Warning: %s: no source filename found for package '%s'\n" % (defconfig, pkg))
> > +                continue
> > +            if 'uris' not in download:
> > +                sys.stderr.write("Warning: %s: no uri's found for package '%s'\n" % (defconfig, pkg))
> > +                continue
>
> A download without a source or without a URI is an error, not a warning.
> Either it is a bug in the package, or it is a bug in the show-info infra.
> Either way, it must be fixed.

OK.

>
> > +            # tuple: (pkg, version, filename, uris)
> > +            # Note: host packages have the same sources as for target, so strip
> > +            # the 'host-' prefix. Because we are using a set, this will remove
> > +            # duplicate entries.
> > +            pkgname = pkg[5:] if pkg.startswith('host-') else pkg
> > +            files_to_check.add((
> > +                pkgname,
>
> No need for the intermediate variable pkgname:
>
>     files_to_check.add((
>         pkg[5:] if pkg.startswith('host-') else pkg,
>         ...
>     ))

OK

>
> > +                info[pkg]['version'],
> > +                download['source'],
> > +                tuple([uri for uri in download['uris']]),
> > +            ))
> > +
> > +    shutil.rmtree(outputdir)
> > +    return files_to_check
> > +
> > +
> > +def get_files_to_check(defconfigs):
> > +    total_files_to_check = set()
> > +
> > +    num_processes = multiprocessing.cpu_count() * 2
> > +    print('Dispatching over %s processes' % num_processes)
> > +    with multiprocessing.Pool(processes=num_processes) as pool:
> > +        result_objs = [
> > +            pool.apply_async(get_files_to_check_one_defconfig, (defconfig,))
> > +            for defconfig in defconfigs
> > +        ]
> > +        results = [p.get() for p in result_objs]
> > +
> > +    for result in results:
> > +        total_files_to_check |= result
> > +
> > +    return total_files_to_check
> > +
> > +
> > +def sourcecheck_one_uri(pkg, version, filename, uri):
> > +
>
> flake8 does not whine with or wihtout a leading empty line. I prefer
> when there is none, though...
>
> However, let's try something:
>
>     def sourcecheck_one_uri(pkg, version, filename, uri):
>         handler = dict()
>
>         def sourcecheck_file(...):
>             ...
>         handler['file'] = source_check_file
>
>         def sourcecheck_hg(...);
>             ...
>         handler['hg'] = source_check_file
>
>         try:
>             return handler[uri.split('://', 1)[0]](pkg, version, filename, uri)
>         except KeyError:
>             raise Exeption('Meh unknown URI type "{}"'.format(uri)) from None
>
> Not sure how nicer the code would be. At least, we get an easy one-liner
> to demux the URI type (plus the try-except boilerplate).

Sure, we can do something like that, thanks.

>
> > +    def sourcecheck_scp(pkg, version, filename, uri):
>
> Please define handler in alphabetical order.

OK

>
> > +        real_uri = uri.split('+', 1)[1] + '/' + filename
> > +        if real_uri.startswith('scp://'):
> > +            real_uri = real_uri[6:]
> > +        domain, path = real_uri.split(':', 1)
> > +        with open(os.devnull, 'w') as devnull:
> > +            ret = subprocess.call(
> > +                ['ssh', domain, 'test', '-f', path],
> > +                stderr=devnull
> > +            )
> > +        return ret == 0
> > +
> > +    def sourcecheck_hg(pkg, version, filename, uri):
> > +        real_uri = uri.split('+', 1)[1]
> > +        with open(os.devnull, 'w') as devnull:
> > +            ret = subprocess.call(
> > +                ['hg', 'identify', '--rev', version, real_uri],
> > +                stdout=devnull, stderr=devnull
> > +            )
> > +        return ret == 0
> > +
> > +    def sourcecheck_file(pkg, version, filename, uri):
> > +        real_uri = uri.split('+', 1)[1] + '/' + filename
> > +        if real_uri.startswith('file://'):
> > +            real_uri = real_uri[7:]
> > +        return os.path.exists(real_uri)
> > +
> > +    def sourcecheck_http(pkg, version, filename, uri):
> > +        real_uri = uri.split('+', 1)[1] + '/' + filename
> > +        with open(os.devnull, 'w') as devnull:
> > +            ret = subprocess.call(
> > +                ['wget', '--spider', real_uri],
> > +                stderr=devnull
> > +            )
> > +        return ret == 0
> > +
> > +    if uri.startswith('scp'):
> > +        handler = sourcecheck_scp
> > +    elif uri.startswith('hg'):
> > +        handler = sourcecheck_hg
> > +    elif uri.startswith('file'):
> > +        handler = sourcecheck_file
> > +    elif uri.startswith('http'):
> > +        handler = sourcecheck_http
> > +    else:
> > +        raise Exception("Cannot handle unknown URI type: '%s' for package '%s'" % (uri, pkg))
> > +
> > +    return handler(pkg, version, filename, uri)
> > +
> > +
> > +def sourcecheck_one_file(pkg, version, filename, uris):
> > +    result = any(
> > +        sourcecheck_one_uri(pkg, version, filename, uri)
> > +        for uri in uris
> > +    )
> > +    return pkg, version, filename, result
> > +
> > +
> > +def sourcecheck(files_to_check):
> > +
> > +    def process_result(result):
> > +        pkg, version, filename, success = result
> > +        if success:
> > +            print(' OK: pkg %s, filename %s' % (pkg, filename))
> > +        else:
> > +            sys.stderr.write('NOK: pkg %s, filename %s -- ERROR!\n' % (pkg, filename))
> > +
> > +    num_processes = multiprocessing.cpu_count() * 2
> > +    print('Dispatching over %s processes' % num_processes)
>
> Hmm... I don't much like this auto-parallelism... I think we should not
> try to do parallsism at all. But if you really insist, then make that a
> command line option (e.g. source-check -jN).

Might I ask why you don't like that?

The parallelism gives a great speed boost. Every connection that needs
to be set up takes some time.
When I run the script for just one defconfig with 180 download URIs on
my laptop with 4 cores:
- dispatched to 8 processes: 40 seconds
- dispatched to 1 process: 3 minutes

But we can indeed add an option to determine the amount of parallelism.

Best regards,
Thomas
