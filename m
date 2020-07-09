From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 09 Jul 2020 10:41:10 +0200
Subject: [Buildroot] [PATCH 5/9] support/scripts: Add a per
 configuration CVE checker
In-Reply-To: <CANQCQpbA7pSBTPgf0__OX5KAeVYU75KZ=3ZE4LoT49FFa-zWdg@mail.gmail.com>
References: <20200708164006.859021-1-gregory.clement@bootlin.com>
 <20200708164006.859021-6-gregory.clement@bootlin.com>
 <CANQCQpbA7pSBTPgf0__OX5KAeVYU75KZ=3ZE4LoT49FFa-zWdg@mail.gmail.com>
Message-ID: <87eepl5bdl.fsf@FE-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

> Gregory,
>> +# Used to make multiple requests to the same host. It is global
>> +# because it's used by sub-processes.
>> +http_pool = None
>> +
>> +
>> +class Package:
>> +    def __init__(self, name, version, ignored_cves):
>> +        self.name = name
>> +        self.version = version
>> +        self.cves = list()
>> +        self.ignored_cves = ignored_cves
>> +
>> +def check_package_cves(nvd_path, packages):
>> +    if not os.path.isdir(nvd_path):
>> +        os.makedirs(nvd_path)
>> +
>> +    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
>
> This read_nvd_dir call that does the dictionary download has a whole
> bunch of parsing package output  "Cannot parse package 'openssl'
> version ''".  I assume some of that output will get cleaned up when we
> add the additional CPE matching

Yes. Before this series, pkg-stat considered a pacakge as non- affected
by a CVE if it didn't manage to get the version of the package. Since
patch "package/pkg-utils/cve.py: Manage case when package version
doesn't exist" it is no more the case and the CVEs related to the package
are output in the colunm 'CVEs to check'.

However we might be less verbose during the parsing.

>
>> +def parse_args():
>> +    parser = argparse.ArgumentParser()
>> +    output = parser.add_argument_group('output', 'Output file(s)')
>> +    output.add_argument('--html', dest='html', type=resolvepath,
>> +                        help='HTML output file')
>> +    output.add_argument('--json', dest='json', type=resolvepath,
>> +                        help='JSON output file')
>> +    packages = parser.add_mutually_exclusive_group()
>> +    packages.add_argument('-n', dest='npackages', type=int, action='store',
>> +                          help='Number of packages')
>> +    packages.add_argument('-p', dest='packages', action='store',
>> +                          help='List of packages (comma separated)')
>
> Are the -n and -p options left over from pulling this tool out of
> pkg-stats?  Since this report is based on a specific defconfig,

Indeed they are left over and I will remove them

>
>> +    parser.add_argument('--nvd-path', dest='nvd_path',
>> +                        help='Path to the local NVD database', type=resolvepath)
>
> I noticed this was a required item, maybe default to a folder name in
> the current folder when one isn't provided?

I will also add a default value.

>
>> +    args = parser.parse_args()
>> +    if not args.html and not args.json:
>> +        parser.error('at least one of --html or --json (or both) is required')
>
> plus nvd path unless you add a default
>
>> +    return args
>> +
>> +
>> +def __main__():
>> +    packages = list()
>> +    exclude_pacakges = ["linux", "gcc"]
>> +    content = json.load(sys.stdin)
>> +    for item in content:
>> +        if item in exclude_pacakges:
>> +            continue
>> +        pkg = content[item]
>> +        p = Package(item, pkg.get('version', ''), pkg.get('ignored_cves', ''))
>> +        packages.append(p)
>> +
>> +    args = parse_args()
>> +    date = datetime.datetime.utcnow()
>> +    commit = subprocess.check_output(['git', 'rev-parse',
>> +                                      'HEAD']).splitlines()[0].decode()
>
> This git commit check doesn't work when the tools are used with out of
> tree buildroot builds.
>
> To reproduce from within Buildroot clone:
> make O=../foobar  qemu_x86_64_defconfig
> cd ../foobar
> make show-info | support/scripts/cve-checker --html report.html
> --nvd-path nvd


Thanks for the report I will check it.

Gregory

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
