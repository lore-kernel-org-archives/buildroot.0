From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Apr 2019 14:47:45 +0200
Subject: [Buildroot] [PATCH 00/10] infra: add solution to dump metadata
 from packages (branch yem/misc)
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXcOGi+geZH749WFgNfC+kt91eJtn=a7qcKzAUTgBoMGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

El dom., 7 abr. 2019 a las 13:51, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Hello All!
>
> This series is a proposal to allow extracting metadata about packages,
> in a way that makes it reusable for tooling outside of Buildroot, that
> is both reliable and extendable, without causing too much burden on
> Buildroot own infrastructure.
>
> This series introduces a global 'show-info' rule, and a per package and
> per filesystem 'show-info' rule, that dump the pacakge metadata as a
> JSON blob. JSON is a key-value based serialisation format. As such, it
> is easy to parse (there are implementations in virtually all languages,
> and there are even tools like jq, that can be used from shell scripts).
> But most importantly, it is easy to extend without breakign existing
> tools (as long as they use proper JSON parsers, that is).
>
> This series first introduces 4 cleanup preparatory patches in the
> download infra, so that it gets easy to get the list of URIs to report
> them. Strictly speaking, only patches 1 and 2 are required for this
> series, but the cleanup was extended to the infra with patches 3 and 4,
> for consistency.
>
> Then, the series introduces a per package and per filesystem show-info
> rule, as well as a recursive variant. The per filesystem rule is needed
> to be able to get the info about packages that are a dependency of
> filesystems.
>
> Finally, a global show-info rule is introduced that generates a JSON
> array with all the information about a build.
>
> In the end, the output for a packages would look like (beautified manually
> for ease of reading):
>
>     $ make cracklib-show-info
>     {
>       "name": "cracklib",
>       "type": "target",
>       "virtual": false,
>       "version": "2.9.7",
>       "licenses": "LGPL-2.1",
>       "downloads": [
>         {
>           "source": "cracklib-2.9.7.tar.gz",
>           "URIs": [
>             "https+https://github.com/cracklib/cracklib/releases/download/v2.9.7",
>             "http|urlencode+http://sources.buildroot.net/cracklib",
>             "http|urlencode+http://sources.buildroot.net"
>           ]
>         },
>         {
>           "source": "cracklib-words-2.9.7.gz",
>           "URIs": [
>             "https://github.com/cracklib/cracklib/releases/download/v2.9.7",
>             "http|urlencode+http://sources.buildroot.net/cracklib",
>             "http|urlencode+http://sources.buildroot.net"
>           ]
>         },
>         null
>       ],
>       "depends on": [
>         "host-cracklib",
>         "host-skeleton",
>         "skeleton",
>         "toolchain"
>       ],
>       "dependency of": [
>         "libpwquality",
>         "linux-pam"
>       ]
>     }
>
> While the whole show-info would look like (elipsed for readbility):
>
>     $ make show-info
>     [
>     { "name": "host-gcc-final", "type": "host", "virtual": false, ... },
>     { "name": "host-binutils", "type": "host", "virtual": false, ... },
>     { "name": "toolchain-buildroot", "type": "target", ... },
>     { "name": "gettext-tiny", "type": "target", "virtual": false, ... },
>     { "name": "gettext", "type": "target", "virtual": true, ... },
>     { "name": "ifupdown-scripts", "type": "target", "virtual": false, ... },
>     ...
>     { "name": "rootfs-common", "type": "rootfs", ... },
>     { "name": "rootfs-tar", "type": "rootfs", ... }
>     ]
>


Thanks for this series.
I gave some comments on the individual patches.

I cooked together a script to implement 'source-check' externally,
based on this show-info output.
It all works fine, all info needed is there.
I first process the show-info output into something like:

<name> <version> <filename> <uri1> <uri2> ...

using following jq query:

make show-info | jq -r '.[] | .["name"] as $pkg | .["version"] as
$version | .["downloads"][]? | $pkg + " " + $version + " " +
.["source"] + " " + (.["URIs"]? | select(. != null) | join(" "))'

And then I parse each resulting line, checking that for each package
at least one of the URIs that match my primary site / hg server work
fine.

For reference, below is the script as it is now (can probably still be
improved, the purpose was mainly to check if everything I need is
there, as feedback to your series):

#!/usr/bin/env python3

import os
import subprocess
import sys

LOCAL_MIRROR = 'my.local.mirror.example.com'

def sourcecheck_scp(pkg, version, filename, uri):
    real_uri = uri.split('+', 1)[1] + '/' + filename
    if real_uri.startswith('scp://'):
        real_uri = real_uri[6:]
    domain, path = real_uri.split(':', 1)
    with open(os.devnull, 'w') as devnull:
        ret = subprocess.call(['ssh', domain, 'test', '-f', path],
stderr=devnull)
    return ret == 0

def sourcecheck_hg(pkg, version, filename, uri):
    real_uri = uri.split('+', 1)[1]
    with open(os.devnull, 'w') as devnull:
        ret = subprocess.call(['hg', 'identify', '--rev', version,
real_uri], stdout=devnull, stderr=devnull)
    return ret == 0

def sourcecheck(pkg, version, filename, uri):
    if uri.startswith('scp'):
        handler = sourcecheck_scp
    elif uri.startswith('hg'):
        handler = sourcecheck_hg
    else:
        raise Exception("Cannot handle unknown URI type: '%s' for
package '%s'" % (uri, pkg))

    return handler(pkg, version, filename, uri)

def main():
    p1 = subprocess.Popen(['make', 'show-info'], stdout=subprocess.PIPE)
    p2 = subprocess.Popen(['jq', '-r', '.[] | .["name"] as $pkg |
.["version"] as $version | .["downloads"][]? | $pkg + " " + $version +
" " + .["source"] + " " + (.["URIs"]? | select(. != null) | join("
"))'],
            stdin=p1.stdout, stdout=subprocess.PIPE)
    p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
    pkginfo = p2.communicate()[0].decode('utf-8')
    result = {}

    for line in pkginfo.splitlines():
        pkg, version, filename, *uris = line.split()

        success = any(sourcecheck(pkg, version, filename, uri) for uri
in uris if LOCAL_MIRROR in uri)
        result[pkg] = success

    print('Failed packages: ', [pkg for pkg in result if not result[pkg]])
    return all(result.values())

if __name__ == '__main__':
    ret = main()
    if not ret:
        sys.exit(1)


Best regards,
Thomas
