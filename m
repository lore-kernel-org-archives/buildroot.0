From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2021 23:56:12 +0100
Subject: [Buildroot] [PATCH 2/2] utils/source-check: new script
In-Reply-To: <20201204123313.14455-2-patrickdepinguin@gmail.com>
References: <20201204123313.14455-1-patrickdepinguin@gmail.com>
 <20201204123313.14455-2-patrickdepinguin@gmail.com>
Message-ID: <20210102225612.GJ2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-04 13:33 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> This source-check script is a replacement for 'make source-check' that
> existed in earlier versions of Buildroot.
> 
> It takes as input a list of defconfigs,

Make that work on the current configured directory. I.e. it should
require a .config file to be already present.

Scanning for multiple defconfigs should be left as an exercise to the
interested parties (e.g. a job in a CI system, I believe).

e.g.;

    for cfg in configs/*_defconfig; do
        make ${cfg#*/}
        ./utils/source-check || { printf 'Failed: %s\n' "${cfg#*/}"; break; }
    done

> and then efficiently determines
> whether all files needed can be downloaded, without actually downloading
> them.
> 
> The settings of BR2_PRIMARY_SITE, BR2_PRIMARY_SITE_ONLY and
> BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS will be used as specified in the
> respective defconfigs.
> 
> Note: scp, hg, file, and http(s) protocols are currently covered. Others,
> like git, bzr, svn currently are not. I don't really use these and am not
> sure if it is possible to check remotely if something is valid or not,
> without downloading the entire repository.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/source-check | 220 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 220 insertions(+)
>  create mode 100755 utils/source-check
> 
> diff --git a/utils/source-check b/utils/source-check
> new file mode 100755
> index 0000000000..16566b9e81
> --- /dev/null
> +++ b/utils/source-check
> @@ -0,0 +1,220 @@
> +#!/usr/bin/env python3
> +"""
> +source-check: check that all packages needed for the specified defconfigs can be downloaded
> +
> +Given a list of defconfigs, determine which URLs are needed to build it, and
> +check the accessibility of the packages represented by them. Typically this
> +does not actually involve a real download, so this scripts works very fast.
> +"""
> +
> +# example output of 'make show-info'
> +# 'rsync': {'dependencies': ['host-ccache',
> +#                            'host-skeleton',
> +#                            'host-tar',
> +#                            'popt',
> +#                            'skeleton',
> +#                            'toolchain',
> +#                            'zlib'],
> +#           'dl_dir': 'rsync',
> +#           'downloads': [{'source': 'rsync-3.1.3.tar.gz',
> +#                          'uris': ['scp|urlencode+scp://xxx at mirror.example.com/rsync',
> +#                                   'scp|urlencode+scp://xxx at mirror.example.com',
> +#                                   'http+http://rsync.samba.org/ftp/rsync/src',
> +#                                   'http|urlencode+http://sources.buildroot.net/rsync',
> +#                                   'http|urlencode+http://sources.buildroot.net']}],
> +#           'install_images': False,
> +#           'install_staging': False,
> +#           'install_target': True,
> +#           'licenses': 'GPL-3.0+',
> +#           'reverse_dependencies': [],
> +#           'type': 'target',
> +#           'version': '3.1.3',
> +#           'virtual': False},
> +
> +
> +def get_files_to_check_one_defconfig(defconfig):
> +    outputdir = 'sourcecheck_%s' % defconfig
> +    subprocess.check_call([
> +        'make', '--no-print-directory', '-s', 'O=%s' % outputdir,
> +        defconfig
> +    ])
> +    # Note: set suitable-host-package to empty to pretend no suitable tools are
> +    # present on the host, and thus force all potentially-needed sources in the
> +    # list (e.g. cmake, gzip, ...)
> +    output = subprocess.check_output([
> +        'make', '--no-print-directory', '-s', 'O=%s' % outputdir,
> +        'show-info', 'suitable-host-package='
> +    ])
> +    info = json.loads(output)
> +
> +    files_to_check = set()
> +
> +    for pkg in info:
> +        if 'downloads' not in info[pkg]:
> +            sys.stderr.write("Warning: %s: no downloads for package '%s'\n" % (defconfig, pkg))
> +            continue
> +        if not info[pkg]['downloads']:
> +            sys.stderr.write("Warning: %s: empty downloads for package '%s'\n" % (defconfig, pkg))
> +            continue

Does that relayy warrant a warning? virtual packages have no download
key; some system-level packages (skeletons, mkpasswd et al.) have a
download key, but the dictionnary is empty. Having spurious warnings is
the best way for people to simply ignore them...

> +        for download in info[pkg]['downloads']:
> +            if 'source' not in download:
> +                sys.stderr.write("Warning: %s: no source filename found for package '%s'\n" % (defconfig, pkg))
> +                continue
> +            if 'uris' not in download:
> +                sys.stderr.write("Warning: %s: no uri's found for package '%s'\n" % (defconfig, pkg))
> +                continue

A download without a source or without a URI is an error, not a warning.
Either it is a bug in the package, or it is a bug in the show-info infra.
Either way, it must be fixed.

> +            # tuple: (pkg, version, filename, uris)
> +            # Note: host packages have the same sources as for target, so strip
> +            # the 'host-' prefix. Because we are using a set, this will remove
> +            # duplicate entries.
> +            pkgname = pkg[5:] if pkg.startswith('host-') else pkg
> +            files_to_check.add((
> +                pkgname,

No need for the intermediate variable pkgname:

    files_to_check.add((
        pkg[5:] if pkg.startswith('host-') else pkg,
        ...
    ))

> +                info[pkg]['version'],
> +                download['source'],
> +                tuple([uri for uri in download['uris']]),
> +            ))
> +
> +    shutil.rmtree(outputdir)
> +    return files_to_check
> +
> +
> +def get_files_to_check(defconfigs):
> +    total_files_to_check = set()
> +
> +    num_processes = multiprocessing.cpu_count() * 2
> +    print('Dispatching over %s processes' % num_processes)
> +    with multiprocessing.Pool(processes=num_processes) as pool:
> +        result_objs = [
> +            pool.apply_async(get_files_to_check_one_defconfig, (defconfig,))
> +            for defconfig in defconfigs
> +        ]
> +        results = [p.get() for p in result_objs]
> +
> +    for result in results:
> +        total_files_to_check |= result
> +
> +    return total_files_to_check
> +
> +
> +def sourcecheck_one_uri(pkg, version, filename, uri):
> +

flake8 does not whine with or wihtout a leading empty line. I prefer
when there is none, though...

However, let's try something:

    def sourcecheck_one_uri(pkg, version, filename, uri):
        handler = dict()

        def sourcecheck_file(...):
            ...
        handler['file'] = source_check_file

        def sourcecheck_hg(...);
            ...
        handler['hg'] = source_check_file

        try:
            return handler[uri.split('://', 1)[0]](pkg, version, filename, uri)
        except KeyError:
            raise Exeption('Meh unknown URI type "{}"'.format(uri)) from None

Not sure how nicer the code would be. At least, we get an easy one-liner
to demux the URI type (plus the try-except boilerplate).

> +    def sourcecheck_scp(pkg, version, filename, uri):

Please define handler in alphabetical order.

> +        real_uri = uri.split('+', 1)[1] + '/' + filename
> +        if real_uri.startswith('scp://'):
> +            real_uri = real_uri[6:]
> +        domain, path = real_uri.split(':', 1)
> +        with open(os.devnull, 'w') as devnull:
> +            ret = subprocess.call(
> +                ['ssh', domain, 'test', '-f', path],
> +                stderr=devnull
> +            )
> +        return ret == 0
> +
> +    def sourcecheck_hg(pkg, version, filename, uri):
> +        real_uri = uri.split('+', 1)[1]
> +        with open(os.devnull, 'w') as devnull:
> +            ret = subprocess.call(
> +                ['hg', 'identify', '--rev', version, real_uri],
> +                stdout=devnull, stderr=devnull
> +            )
> +        return ret == 0
> +
> +    def sourcecheck_file(pkg, version, filename, uri):
> +        real_uri = uri.split('+', 1)[1] + '/' + filename
> +        if real_uri.startswith('file://'):
> +            real_uri = real_uri[7:]
> +        return os.path.exists(real_uri)
> +
> +    def sourcecheck_http(pkg, version, filename, uri):
> +        real_uri = uri.split('+', 1)[1] + '/' + filename
> +        with open(os.devnull, 'w') as devnull:
> +            ret = subprocess.call(
> +                ['wget', '--spider', real_uri],
> +                stderr=devnull
> +            )
> +        return ret == 0
> +
> +    if uri.startswith('scp'):
> +        handler = sourcecheck_scp
> +    elif uri.startswith('hg'):
> +        handler = sourcecheck_hg
> +    elif uri.startswith('file'):
> +        handler = sourcecheck_file
> +    elif uri.startswith('http'):
> +        handler = sourcecheck_http
> +    else:
> +        raise Exception("Cannot handle unknown URI type: '%s' for package '%s'" % (uri, pkg))
> +
> +    return handler(pkg, version, filename, uri)
> +
> +
> +def sourcecheck_one_file(pkg, version, filename, uris):
> +    result = any(
> +        sourcecheck_one_uri(pkg, version, filename, uri)
> +        for uri in uris
> +    )
> +    return pkg, version, filename, result
> +
> +
> +def sourcecheck(files_to_check):
> +
> +    def process_result(result):
> +        pkg, version, filename, success = result
> +        if success:
> +            print(' OK: pkg %s, filename %s' % (pkg, filename))
> +        else:
> +            sys.stderr.write('NOK: pkg %s, filename %s -- ERROR!\n' % (pkg, filename))
> +
> +    num_processes = multiprocessing.cpu_count() * 2
> +    print('Dispatching over %s processes' % num_processes)

Hmm... I don't much like this auto-parallelism... I think we should not
try to do parallsism at all. But if you really insist, then make that a
command line option (e.g. source-check -jN).

Regards,
Yann E. MORIN.

> +    with multiprocessing.Pool(processes=num_processes) as pool:
> +        result_objs = [
> +            pool.apply_async(sourcecheck_one_file, entry, callback=process_result)
> +            for entry in files_to_check
> +        ]
> +        results = [p.get() for p in result_objs]
> +
> +    succeeded = [
> +        (pkg, version, filename, success)
> +        for (pkg, version, filename, success) in results
> +        if success
> +    ]
> +    failed = [
> +        (pkg, version, filename, success)
> +        for (pkg, version, filename, success) in results
> +        if not success
> +    ]
> +
> +    print('\nSummary: %s OK, %s NOK, %s total' % (len(succeeded), len(failed), len(results)))
> +
> +    if len(failed):
> +        print('\nFAILED FILES')
> +        for pkg, version, filename, success in sorted(failed):
> +            print('pkg: %s, version: %s, file: %s/%s' % (pkg, version, pkg, filename))
> +
> +    return len(failed) == 0
> +
> +
> +def main():
> +    defconfigs = sys.argv[1:]
> +    if not defconfigs:
> +        sys.stderr.write('Error: pass list of defconfigs as arguments\n')
> +        sys.exit(1)
> +
> +    total_files_to_check = get_files_to_check(defconfigs)
> +    return sourcecheck(total_files_to_check)
> +
> +
> +if __name__ == '__main__':
> +    ret = main()
> +    if not ret:
> +        sys.exit(1)
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
